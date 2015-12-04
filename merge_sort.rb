

def merge_sort(arr)
	return arr if arr.length == 1
	n = arr.length
	left = merge_sort(arr[0..(n/2-1)])
	right = merge_sort(arr[n/2..-1])

	merge(left,right)

end


def merge(left,right)

	i,j = 0,0
	merged_arr = Array.new

	len_left = left.length
	len_right = right.length

	while i < len_left || j < len_right

		if i < len_left && j < len_right

			if left[i] <= right[j]
				merged_arr << left[i]
				i += 1
			else
				merged_arr << right[j]
				j += 1
			end
			# merged_arr << left[i]; i+=1 if left[i] <= right[j]
			# merged_arr << right[j]; j+=1 if right[j] <= left[i] 


		elsif i < len_left
			merged_arr << left[i]
			i+=1
		elsif j < len_right
			merged_arr << right[j]
			j+=1
		end
				
	end 
		merged_arr

end

p merge_sort([2,100,4,2,22,0,55,-32,5,44])