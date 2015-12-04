def bubble_sort(arr)

	n = arr.length
	

	for i in (0..n-2)
		for j in (0..n-i-2)
			if arr[j] > arr[j+1]
				arr[j],arr[j+1] = arr[j+1],arr[j]
			end
		end
	end
	print arr
end

def bubble_sort_by(arr)

	n = arr.length
	for i in (0..n-2)
		for j in (0..n-i-2)
			if yield(arr[j],arr[j-1]) < 0
				arr[j],arr[j+1] = arr[j+1],arr[j]
			end
		end
	end
		
	print arr

end

bubble_sort([15,24,33,2,21,88,12,34])
bubble_sort_by(["hi","hello","hey"]) do |left,right|
	right.length - left.length
end

