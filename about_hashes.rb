require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal _, empty_hash.class
    assert_equal(_, empty_hash)
    assert_equal _, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal _, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal _, hash[:one]
    assert_equal _, hash[:two]
    assert_equal _, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal _, hash.fetch(:one)
    assert_raise(_) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = _
    assert_equal expected, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal _, hash1 == hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal _, hash.keys.size
    assert_equal _, hash.keys.include?(:one)
    assert_equal _, hash.keys.include?(:two)
    assert_equal _, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal _, hash.values.size
    assert_equal _, hash.values.include?("uno")
    assert_equal _, hash.values.include?("dos")
    assert_equal _, hash.values.class
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal _, hash != new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    assert_equal _, expected == new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal _, hash1[:one]
    assert_equal _, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal _, hash2[:one]
    assert_equal _, hash2[:two]
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ['uno','dos'], hash[:one]
    assert_equal ['uno','dos'], hash[:two]
    assert_equal ['uno','dos'], hash[:three]

    assert_equal _, hash[:one].object_id == hash[:two].object_id
  end

  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal _, hash[:one]
    assert_equal _, hash[:two]
    assert_equal _, hash[:three]
  end
end
