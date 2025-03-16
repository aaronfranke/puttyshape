# MIT License
# 
# Copyright (c) 2025 Ben Kurtin
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Shape taken from Inigo Quilez's article on 3D SDFs
# https://iquilezles.org/articles/distfunctions/
# Licensed under the MIT License.

@tool
class_name PuttyArbitraryCappedCone3D
extends PuttyShape3D

@export
var start := -Vector3.UP:
	set(value):
		start = value
		_update_parent()

@export
var end := Vector3.UP:
	set(value):
		end = value
		_update_parent()

@export
var bottom_radius := 1.0:
	set(value):
		bottom_radius = absf(value)
		_update_parent()

@export
var top_radius := 0.5:
	set(value):
		top_radius = absf(value)
		_update_parent()

func get_shape_type() -> int:
	return Shapes.ARBITRARY_CAPPED_CONE

func get_first_arguments() -> Vector4:
	return Vector4(start.x, start.y, start.z, end.x)

func get_second_arguments() -> Vector4:
	return Vector4(end.y, end.z, bottom_radius, top_radius)
