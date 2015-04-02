module Dict
  def Dict.new(num_buckets=256)
  	#initialize object Dict array with that many buckets.
  	aDict =[]
	(0..num_buckets).each do |i|
  	  aDict.push([])
  	end
  	return aDict
  end
  
  def Dict.hash_key(aDict, key)
  	#given a key, this will create a number and convert it to 
  	#an index for the aDict bucket.
  	return key.hash  % aDict.length
  end
  
  def Dict.get_bucket(aDict, key)
  	#given a key find the bucket where it goes.
  	bucket_id = Dict.hash_key(aDict, key)
  	return aDict[bucket_id]
  end
  
  def Dict.get_slot(aDict, key, default=nil)
  	#returns the index, key, and value of a slot found in a bucket
  	bucket = Dict.get_bucket(aDict, key)
  	
  	bucket.each_with_index do |kv, i|
  	  k, v = kv
  	  if key == k
  		return i, k, v
  	  end
	end
	
	return -1, key, default
  end

  def Dict.get(aDict, key, default=nil)
  	#get the value in a bucket or the given key or the default
  	i, k, v = Dict.get_slot(aDict, key, default=default)
  	return v
  end
  
  def Dict.set(aDict, key, value)
  	#set the key to the value (replace existing)
  	bucket = Dict.get_bucket(aDict, key)
  	i, k, v = Dict.get_slot(aDict, key)
  	
  	if i >= 0
  		bucket[i] = [key, value]
  	else
  		bucket.push([key, value])
  	end
  end
  
  def Dict.delete(aDict, key)
  	#deletes a given key from dict
  	bucket = Dict.get_bucket(aDict, key)
  	
  	(0...bucket.length).each do |i|
  		k, v = bucket[i]
  		if key == k 
  			bucket.delete_at(i)
  			break
  		end
  	end
  end
  
  def Dict.list (aDict)
  	#prints out contents of Dict
  	aDict.each do |bucket|
  	  if bucket
  	  	bucket.each {|k, v| puts k, v}
  	  end
  	end
  end
end
	