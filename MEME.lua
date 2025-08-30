Library = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function Library.Main:CreateDropdown(op)
			assert(op.Title, "Dropdown Missing Title")
			assert(op.List, "Dropdown " .. op.Title .. " Missing List")
			local dropdown = background(PageList_1, op.Title, op.Desc)
			local list = op.List or {}
			local value = op.Value or list[1]
			local multi = op.Multi or false
			local callback = op.Callback or function() end
			
			dropdown.TextDesc.TextLabel.TextTransparency = 0.1
			
			local function vd()
				if type(value) == "table" then
					return table.concat(value, ", ")
				else
					return value
				end
			end
			
			local Frame = Instance.new("Frame")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local UIPadding_1 = Instance.new("UIPadding")
			local Frame_1 = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local SelectedText_1 = Instance.new("TextLabel")
			local UIPadding_2 = Instance.new("UIPadding")
			local ImageLabel_1 = Instance.new("ImageLabel")
			local DropdownGradient = Instance.new("UIGradient")
			local DropdownStroke = Instance.new("UIStroke")
			local Click = Instance.new("TextButton", dropdown)

			Frame.Parent = dropdown
			Frame.AnchorPoint = Vector2.new(1, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(1, 0,0.5, 0)
			Frame.Size = UDim2.new(0, 120,0.800000012, 0)

			UIListLayout_1.Parent = Frame
			UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

			UIPadding_1.Parent = Frame
			UIPadding_1.PaddingRight = UDim.new(0,16)

			Frame_1.Parent = Frame
			Frame_1.BackgroundColor3 = Color3.fromRGB(45,45,55)
			Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_1.BorderSizePixel = 0
			Frame_1.Size = UDim2.new(1, 0,0, 24)

			UICorner_1.Parent = Frame_1
			UICorner_1.CornerRadius = UDim.new(0,6)
			
			-- Dropdown gradient
			DropdownGradient.Parent = Frame_1
			DropdownGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 60)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 45))
			}
			DropdownGradient.Rotation = 90
			
			-- Dropdown stroke
			DropdownStroke.Parent = Frame_1
			DropdownStroke.Color = Color3.fromRGB(100, 100, 120)
			DropdownStroke.Thickness = 1
			DropdownStroke.Transparency = 0.8

			SelectedText_1.Name = "SelectedText"
			SelectedText_1.Parent = Frame_1
			SelectedText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SelectedText_1.BackgroundTransparency = 1
			SelectedText_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SelectedText_1.BorderSizePixel = 0
			SelectedText_1.Size = UDim2.new(0.75, 0,1, 0)
			SelectedText_1.Font = Enum.Font.GothamMedium
			SelectedText_1.Text = vd()
			SelectedText_1.TextColor3 = Color3.fromRGB(240,240,245)
			SelectedText_1.TextSize = 11
			SelectedText_1.TextXAlignment = Enum.TextXAlignment.Left
			SelectedText_1.TextTruncate = Enum.TextTruncate.AtEnd

			UIPadding_2.Parent = Frame_1
			UIPadding_2.PaddingLeft = UDim.new(0,8)
			UIPadding_2.PaddingRight = UDim.new(0,8)

			ImageLabel_1.Parent = Frame_1
			ImageLabel_1.AnchorPoint = Vector2.new(1, 0.5)
			ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ImageLabel_1.BackgroundTransparency = 1
			ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ImageLabel_1.BorderSizePixel = 0
			ImageLabel_1.Position = UDim2.new(1, 0,0.5, 0)
			ImageLabel_1.Size = UDim2.new(0, 16,0, 16)
			ImageLabel_1.Image = "rbxassetid://14914019851"
			ImageLabel_1.ImageColor3 = Color3.fromRGB(180, 180, 190)
			
			Click.Name = "Click"
			Click.Active = true
			Click.AnchorPoint = Vector2.new(0.5, 0.5)
			Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Click.BackgroundTransparency = 1
			Click.BorderColor3 = Color3.fromRGB(0,0,0)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(1.1, 0,2, 0)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextSize = 14
			Click.ZIndex = 2
			Click.Position = UDim2.new(0.5, 0, 0.5, 0)
			
			local DropdownSelect = Instance.new("CanvasGroup")
			local UICorner_1 = Instance.new("UICorner")
			local ScrollingFrame_1 = Instance.new("ScrollingFrame")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local UIStroke_1 = Instance.new("UIStroke")
			local UIPadding = Instance.new("UIPadding")
			local SelectGradient = Instance.new("UIGradient")
			
			DropdownSelect.Name = "DropdownSelect"
			DropdownSelect.Parent = PageList_1
			DropdownSelect.BackgroundColor3 = Color3.fromRGB(35,35,45)
			DropdownSelect.BackgroundTransparency = 0.1
			DropdownSelect.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownSelect.BorderSizePixel = 0
			DropdownSelect.Size = UDim2.new(.99, 0,0, -5)
			DropdownSelect.ClipsDescendants = true
			DropdownSelect.GroupTransparency = 1
			
			-- Select gradient
			SelectGradient.Parent = DropdownSelect
			SelectGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
			}
			SelectGradient.Rotation = 135

			UICorner_1.Parent = DropdownSelect
			UICorner_1.CornerRadius = UDim.new(0,8)

			ScrollingFrame_1.Name = "ScrollingFrame"
			ScrollingFrame_1.Parent = DropdownSelect
			ScrollingFrame_1.Active = true
			ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ScrollingFrame_1.BackgroundTransparency = 1
			ScrollingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ScrollingFrame_1.BorderSizePixel = 0
			ScrollingFrame_1.Size = UDim2.new(1, 0,1, 0)
			ScrollingFrame_1.ClipsDescendants = true
			ScrollingFrame_1.AutomaticCanvasSize = Enum.AutomaticSize.None
			ScrollingFrame_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
			ScrollingFrame_1.CanvasPosition = Vector2.new(0, 0)
			ScrollingFrame_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
			ScrollingFrame_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			ScrollingFrame_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			ScrollingFrame_1.ScrollBarImageColor3 = Color3.fromRGB(120,120,140)
			ScrollingFrame_1.ScrollBarImageTransparency = 0.3
			ScrollingFrame_1.ScrollBarThickness = 3
			ScrollingFrame_1.ScrollingDirection = Enum.ScrollingDirection.XY
			ScrollingFrame_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
			ScrollingFrame_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
			ScrollingFrame_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

			UIListLayout_1.Parent = ScrollingFrame_1
			UIListLayout_1.Padding = UDim.new(0,6)
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			
			UIStroke_1.Parent = DropdownSelect
			UIStroke_1.Color = Color3.fromRGB(100,100,120)
			UIStroke_1.Thickness = 1
			UIStroke_1.Transparency = 1
			
			UIPadding.Parent = DropdownSelect
			UIPadding.PaddingBottom = UDim.new(0,8)
			UIPadding.PaddingLeft = UDim.new(0,8)
			UIPadding.PaddingRight = UDim.new(0,8)
			UIPadding.PaddingTop = UDim.new(0,8)
			
			local isopen = false
			
			Click.MouseButton1Click:Connect(function()
				isopen = not isopen
				if not isopen then
					tw({v = DropdownSelect, t = 0.2, s = "Quint", d = "Out", g = {Size = UDim2.new(.99, 0,0, -5), GroupTransparency = 1}}):Play()
					tw({v = UIStroke_1, t = 0.2, s = "Linear", d = "Out", g = {Transparency = 1}}):Play()
					tw({v = ImageLabel_1, t = 0.2, s = "Quint", d = "Out", g = {Rotation = 0}}):Play()
				else
					tw({v = DropdownSelect, t = 0.2, s = "Quint", d = "Out", g = {Size = UDim2.new(.99, 0,0, 120), GroupTransparency = 0}}):Play()
					tw({v = UIStroke_1, t = 0.2, s = "Linear", d = "Out", g = {Transparency = 0.6}}):Play()
					tw({v = ImageLabel_1, t = 0.2, s = "Quint", d = "Out", g = {Rotation = 180}}):Play()
				end
			end)
			
			local itemslist = {}
			local selectedValues = {}
			local selectedItem
			
			function itemslist:Clear()
				if not multi then
					for _, child in ipairs(ScrollingFrame_1:GetChildren()) do
						if child:IsA("Frame") then
							child:Destroy()
						end
					end

					selectedItem = nil
					SelectedText_1.Text = ""
				else
					for key in pairs(selectedValues) do
						selectedValues[key] = nil
					end

					for _, child in ipairs(ScrollingFrame_1:GetChildren()) do
						if child:IsA("Frame") then
							child:Destroy()
						end
					end

					SelectedText_1.Text = ""
				end
			end
			
			function itemslist:Add(text)
				local Item_1 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local TextLabel_1 = Instance.new("TextLabel")
				local UIPadding_1 = Instance.new("UIPadding")
				local ImageLabel_1 = Instance.new("ImageLabel")
				local TextButton_1 = Instance.new("TextButton")
				local ItemGradient = Instance.new("UIGradient")
				
				Item_1.Name = "Item"
				Item_1.Parent = ScrollingFrame_1
				Item_1.BackgroundColor3 = Color3.fromRGB(50,50,60)
				Item_1.BackgroundTransparency = 0.8
				Item_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Item_1.BorderSizePixel = 0
				Item_1.Size = UDim2.new(1, 0,0, 32)

				UICorner_2.Parent = Item_1
				UICorner_2.CornerRadius = UDim.new(0,6)
				
				-- Item gradient
				ItemGradient.Parent = Item_1
				ItemGradient.Color = ColorSequence.new{
					ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 65)), 
					ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
				}
				ItemGradient.Rotation = 90

				TextLabel_1.Parent = Item_1
				TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextLabel_1.BackgroundTransparency = 1
				TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextLabel_1.BorderSizePixel = 0
				TextLabel_1.Size = UDim2.new(1, 0,1, 0)
				TextLabel_1.Font = Enum.Font.GothamMedium
				TextLabel_1.Text = text
				TextLabel_1.TextColor3 = Color3.fromRGB(220,220,225)
				TextLabel_1.TextSize = 11
				TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_1.TextTransparency = 0.4

				UIPadding_1.Parent = Item_1
				UIPadding_1.PaddingLeft = UDim.new(0,12)
				UIPadding_1.PaddingRight = UDim.new(0,8)

				ImageLabel_1.Parent = Item_1
				ImageLabel_1.AnchorPoint = Vector2.new(1, 0.5)
				ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ImageLabel_1.BackgroundTransparency = 1
				ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ImageLabel_1.BorderSizePixel = 0
				ImageLabel_1.Position = UDim2.new(1, 0,0.5, 0)
				ImageLabel_1.Size = UDim2.new(0, 16,0, 16)
				ImageLabel_1.Image = "rbxassetid://14916050992"
				ImageLabel_1.ImageTransparency = 0.6
				ImageLabel_1.ImageColor3 = Color3.fromRGB(180, 180, 190)

				TextButton_1.Parent = Item_1
				TextButton_1.Active = true
				TextButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextButton_1.BackgroundTransparency = 1
				TextButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextButton_1.BorderSizePixel = 0
				TextButton_1.Size = UDim2.new(1, 0,1, 0)
				TextButton_1.Font = Enum.Font.SourceSans
				TextButton_1.Text = ""
				TextButton_1.TextSize = 14
				
				TextButton_1.MouseButton1Click:Connect(function()
					if multi then
						if selectedValues[text] then
							selectedValues[text] = nil
							tw({
								v = Item_1,
								t = 0.2,
								s = "Quint",
								d = "Out",
								g = {BackgroundTransparency = 0.8}
							}):Play()
							tw({
								v = TextLabel_1,
								t = 0.2,
								s = "Linear",
								d = "Out",
								g = {TextTransparency = 0.4}
							}):Play()
							TextLabel_1.Text = text
							local selectedList = {}
							for i, v in pairs(selectedValues) do
								table.insert(selectedList, i)
							end
							if #selectedList > 0 then
								SelectedText_1.Text = table.concat(selectedList, ", ")
							else
								SelectedText_1.Text = ""
							end
							pcall(function()
								callback(selectedList)
							end)
						else
							tw({
								v = Item_1,
								t = 0.2,
								s = "Quint",
								d = "Out",
								g = {BackgroundTransparency = 0.3}
							}):Play()
							tw({
								v = TextLabel_1,
								t = 0.2,
								s = "Linear",
								d = "Out",
								g = {TextTransparency = 0}
							}):Play()
							selectedValues[text] = true
							TextLabel_1.Text = text
							local selectedList = {}
							for i, v in pairs(selectedValues) do
								table.insert(selectedList, i)
							end
							SelectedText_1.Text = table.concat(selectedList, ", ")
							pcall(function()
								callback(selectedList)
							end)
						end
					else
						for i,v in pairs(ScrollingFrame_1:GetChildren()) do
							if v:IsA("Frame") then
								tw({
									v = v,
									t = 0.2,
									s = "Quint",
									d = "Out",
									g = {BackgroundTransparency = 0.8}
								}):Play()
								tw({
									v = v.TextLabel,
									t = 0.2,
									s = "Linear",
									d = "Out",
									g = {TextTransparency = 0.4}
								}):Play()
							end
						end
						tw({
							v = Item_1,
							t = 0.2,
							s = "Quint",
							d = "Out",
							g = {BackgroundTransparency = 0.3}
						}):Play()
						tw({
							v = TextLabel_1,
							t = 0.2,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
						TextLabel_1.Text = text
						value = text
						SelectedText_1.Text = text
						pcall(function()
							callback(text)
						end)
					end
				end)

				local function isValueInTable(val, tbl)
					if type(tbl) ~= "table" then
						return false
					end

					for _, v in pairs(tbl) do
						if v == val then
							return true
						end
					end
					return false
				end

				delay(0,function()
					if multi then
						if isValueInTable(text, value) then
							tw({
								v = Item_1,
								t = 0.2,
								s = "Quint",
								d = "Out",
								g = {BackgroundTransparency = 0.3}
							}):Play()
							tw({
								v = TextLabel_1,
								t = 0.2,
								s = "Linear",
								d = "Out",
								g = {TextTransparency = 0}
							}):Play()
							TextLabel_1.Text = text
							selectedValues[text] = true
							local selectedList = {}
							for i, v in pairs(selectedValues) do
								table.insert(selectedList, i)
							end
							SelectedText_1.Text = table.concat(selectedList, ", ")
							pcall(function()
								callback(selectedList)
							end)
						end
					else
						if text == value then
							tw({
								v = Item_1,
								t = 0.2,
								s = "Quint",
								d = "Out",
								g = {BackgroundTransparency = 0.3}
							}):Play()
							tw({
								v = TextLabel_1,
								t = 0.2,
								s = "Linear",
								d = "Out",
								g = {TextTransparency = 0}
							}):Play()
							TextLabel_1.Text = text
							value = text
							SelectedText_1.Text = text
							pcall(function()
								callback(text)
							end)
						end
					end
				end)
			end
			
			for i,v in ipairs(list) do
				itemslist:Add(v)
			end
			
			UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				ScrollingFrame_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y + 8)
			end)
		end
		
		function Library.Main:CreateLabel(op)
			assert(op.Title, "Label Missing Title")
			local par = background(PageList_1, op.Title, op.Desc)
			
			par.TextDesc.TextLabel.TextTransparency = 0.1

			local NewSet = {}

			function NewSet:SetTitle(newTitle)
				par.TextDesc.TextLabel.Text = newTitle
			end

			function NewSet:SetDesc(newDesc)
				local descLabel = par.TextDesc:FindFirstChild("Desc")
				if descLabel then
					descLabel.Text = newDesc
				else
					local descf = Instance.new("TextLabel", par.TextDesc)
					descf.TextWrapped = true
					descf.BorderSizePixel = 0
					descf.TextXAlignment = Enum.TextXAlignment.Left
					descf.TextTransparency = 0.3
					descf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					descf.TextSize = 10
					descf.Font = Enum.Font.Gotham
					descf.TextColor3 = Color3.fromRGB(180, 180, 190)
					descf.BackgroundTransparency = 1
					descf.RichText = true
					descf.Size = UDim2.new(1, 0, 0, math.floor(16))
					descf.AutomaticSize = Enum.AutomaticSize.Y
					descf.BorderColor3 = Color3.fromRGB(0, 0, 0)
					descf.Text = newDesc
					descf.LayoutOrder = 1
					descf.Name = "Desc"
				end
			end

			function NewSet:SetVisible(newVisible)
				par.Visible = newVisible
			end

			return NewSet
		end
		
		function Library.Main:CreateTextbox(op)
			assert(op.Title, "Textbox Missing Title")
			local par = background(PageList_1, op.Title, op.Desc)
			local Callback = op.Callback or function() end

			par.TextDesc.TextLabel.TextTransparency = 0.1
			par.TextDesc.UIPadding.PaddingRight = UDim.new(0, 220)
			
			local Frame = Instance.new("Frame")
			local UIPadding_1 = Instance.new("UIPadding")
			local Frame_1 = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local Frame_2 = Instance.new("Frame")
			local Frame_3 = Instance.new("Frame")
			local TextBox_1 = Instance.new("TextBox")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local TextboxGradient = Instance.new("UIGradient")
			local TextboxStroke = Instance.new("UIStroke")

			Frame.Parent = par
			Frame.AnchorPoint = Vector2.new(1, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(1, 0,0.5, 0)
			Frame.Size = UDim2.new(0, 210,0.800000012, 0)

			UIPadding_1.Parent = Frame
			UIPadding_1.PaddingRight = UDim.new(0,16)

			Frame_1.Parent = Frame
			Frame_1.BackgroundColor3 = Color3.fromRGB(35,35,45)
			Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_1.BorderSizePixel = 0
			Frame_1.Size = UDim2.new(1, 0,0, 24)

			UICorner_1.Parent = Frame_1
			UICorner_1.CornerRadius = UDim.new(0,6)
			
			-- Textbox gradient
			TextboxGradient.Parent = Frame_1
			TextboxGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
			}
			TextboxGradient.Rotation = 90
			
			-- Textbox stroke
			TextboxStroke.Parent = Frame_1
			TextboxStroke.Color = Color3.fromRGB(120, 120, 200)
			TextboxStroke.Thickness = 1
			TextboxStroke.Transparency = 0.9

			Frame_2.Parent = Frame_1
			Frame_2.AnchorPoint = Vector2.new(0.5, 1)
			Frame_2.BackgroundColor3 = Color3.fromRGB(140,140,220)
			Frame_2.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Position = UDim2.new(0, 0,1, 0)
			Frame_2.Size = UDim2.new(0, 0,0, 2)
			Frame_2.Position = UDim2.new(0.5, 0, 1, 0)

			Frame_3.Parent = Frame_1
			Frame_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Frame_3.BackgroundTransparency = 1
			Frame_3.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_3.BorderSizePixel = 0
			Frame_3.Size = UDim2.new(1, 0,1, 0)

			TextBox_1.Parent = Frame_3
			TextBox_1.Active = true
			TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			TextBox_1.BackgroundTransparency = 1
			TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
			TextBox_1.BorderSizePixel = 0
			TextBox_1.ClearTextOnFocus = false
			TextBox_1.Size = UDim2.new(1, 0,1, 0)
			TextBox_1.Font = Enum.Font.GothamMedium
			TextBox_1.PlaceholderColor3 = Color3.fromRGB(150,150,160)
			TextBox_1.PlaceholderText = op.Placeholder or "Enter text..."
			TextBox_1.Text = op.Value or ""
			TextBox_1.TextColor3 = Color3.fromRGB(240,240,245)
			TextBox_1.TextSize = 11
			TextBox_1.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_2.Parent = Frame_3
			UIPadding_2.PaddingLeft = UDim.new(0,8)
			UIPadding_2.PaddingRight = UDim.new(0,8)

			UIListLayout_1.Parent = Frame
			UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
			
			TextBox_1.FocusLost:Connect(function()
				if op.Value then
					if #TextBox_1.Text > 0 then
						pcall(Callback,TextBox_1.Text)
					end
				end
			end)

			TextBox_1.Focused:Connect(function()
				tw({
					v = Frame_2,
					t = 0.2,
					s = "Quint",
					d = "Out",
					g = {BackgroundTransparency = 0, Size = UDim2.new(1, 0, 0, 2)}
				}):Play()
				tw({
					v = TextboxStroke,
					t = 0.2,
					s = "Linear",
					d = "Out",
					g = {Transparency = 0.5}
				}):Play()
			end)

			TextBox_1.FocusLost:Connect(function()
				tw({
					v = Frame_2,
					t = 0.2,
					s = "Quint",
					d = "Out",
					g = {BackgroundTransparency = 0.8, Size = UDim2.new(0, 0, 0, 2)}
				}):Play()
				tw({
					v = TextboxStroke,
					t = 0.2,
					s = "Linear",
					d = "Out",
					g = {Transparency = 0.9}
				}):Play()
			end)

			delay(0,function()
				if op.Value then
					if #TextBox_1.Text > 0 then
						pcall(Callback,TextBox_1.Text)
					end
				end
			end)
		end
		
			local par = background(PageList_1, op.Title, op.Desc)
			local callback = op.Callback or function() end

			par.TextDesc.TextLabel.TextTransparency = 0.1
			par.TextDesc.UIPadding.PaddingRight = UDim.new(0, 16)
			par.BackgroundTransparency = 0.2
			
			-- Enhanced button gradient
			local UIGradient = Instance.new("UIGradient")
			UIGradient.Parent = par
			UIGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 65)), 
				ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 40, 55)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
			}
			UIGradient.Rotation = 135
			
			-- Button glow stroke
			local ButtonStroke = Instance.new("UIStroke", par)
			ButtonStroke.Color = Color3.fromRGB(120, 120, 180)
			ButtonStroke.Thickness = 1
			ButtonStroke.Transparency = 0.7
			
			for i,v in pairs(par.TextDesc:GetChildren()) do
				if v:IsA("TextLabel") then
					v.TextXAlignment = Enum.TextXAlignment.Center
					v.TextColor3 = Color3.fromRGB(240, 240, 245)
				end
			end
			
			local Click = Instance.new("TextButton", par)
			
			Click.Name = "Click"
			Click.Active = true
			Click.AnchorPoint = Vector2.new(0.5, 0.5)
			Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Click.BackgroundTransparency = 1
			Click.BorderColor3 = Color3.fromRGB(0,0,0)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(1.1, 0,2, 0)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextSize = 14
			Click.ZIndex = 2
			Click.Position = UDim2.new(0.5, 0, 0.5, 0)
			
			-- Button hover effects
			Click.MouseEnter:Connect(function()
				tw({v = par, t = 0.15, s = "Quint", d = "Out", g = {BackgroundTransparency = 0.1}}):Play()
				tw({v = ButtonStroke, t = 0.15, s = "Linear", d = "Out", g = {Transparency = 0.4}}):Play()
			end)
			
			Click.MouseLeave:Connect(function()
				tw({v = par, t = 0.15, s = "Quint", d = "Out", g = {BackgroundTransparency = 0.2}}):Play()
				tw({v = ButtonStroke, t = 0.15, s = "Linear", d = "Out", g = {Transparency = 0.7}}):Play()
			end)
			
			Click.MouseButton1Click:Connect(function()
				jc(Click, par)
				-- Button press animation
				tw({v = par, t = 0.05, s = "Quad", d = "In", g = {Size = UDim2.new(1, -2, 0, par.Size.Y.Offset - 1)}}):Play()
				delay(0.05, function()
					tw({v = par, t = 0.1, s = "Quad", d = "Out", g = {Size = UDim2.new(1, 0, 0, par.Size.Y.Offset + 1)}}):Play()
				end)
				callback()
			end)
		end
		
		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			PageList_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 8)
		end)
		
		UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingFrame_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y + 8)
		end)
		
		return Library.Main
	end
	
	return Library.Tabs
end

return LibraryLibrary = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function Library:CreateWindow(op)
	assert(op.Title, "Window Missing Title")
	assert(op.Icon, "Window Missing Icon")
	local KeyCloseUI = op.Keybind or Enum.KeyCode.LeftControl
	
	local function gl(i)
		if type(i) == 'string' and not i:find('rbxassetid://') then
			return "rbxassetid://".. i
		elseif type(i) == 'number' then
			return "rbxassetid://".. i
		else
			return i
		end
	end
	
	local function lak(o)
		local a, b, c, d
		local function u(i)
			local dt = i.Position - c
			game:GetService"TweenService":Create(o, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(d.X.Scale, d.X.Offset + dt.X, d.Y.Scale, d.Y.Offset + dt.Y)}):Play()
		end
		o.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then a = true c = i.Position d = o.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then a = false end end) end end)
		o.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then b = i end end)
		game:GetService"UserInputService".InputChanged:Connect(function(i) if i == b and a then u(i) end end)
	end
	
	local function click(i)
		local Click = Instance.new("TextButton", i)
		Click.Name = "Click"
		Click.Active = true
		Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Click.BackgroundTransparency = 1
		Click.BorderColor3 = Color3.fromRGB(0,0,0)
		Click.BorderSizePixel = 0
		Click.Size = UDim2.new(1, 0,1, 0)
		Click.Font = Enum.Font.SourceSans
		Click.Text = ""
		Click.TextSize = 14
		Click.ZIndex = 2
		return Click
	end
	
	local function tw(info)
		return game:GetService"TweenService":Create(info.v,TweenInfo.new(info.t,Enum.EasingStyle[info.s],Enum.EasingDirection[info.d]),info.g)
	end
	
	local function background(parent, text, desc)
		local hg = Instance.new("Frame", parent)
		local uicorner = Instance.new("UICorner", hg)
		local frame = Instance.new("Frame", hg)
		local padding = Instance.new("UIPadding", frame)
		local layout = Instance.new("UIListLayout", frame)
		local title = Instance.new("TextLabel", frame)
		local glow = Instance.new("UIStroke", hg)
		
		-- Enhanced background with gradient and glow
		hg.BorderSizePixel = 0
		hg.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		hg.BackgroundTransparency = 0.1
		hg.Size = UDim2.new(1, 0, 0, 40)
		hg.BorderColor3 = Color3.fromRGB(0, 0, 0)
		hg.ClipsDescendants = true
		
		uicorner.CornerRadius = UDim.new(0, 8)
		
		-- Modern glow effect
		glow.Color = Color3.fromRGB(100, 100, 120)
		glow.Thickness = 1
		glow.Transparency = 0.7
		
		-- Gradient background
		local gradient = Instance.new("UIGradient", hg)
		gradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 45)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 28))
		}
		gradient.Rotation = 135
		
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.Position = UDim2.new(0, 0, 0.5, 0)
		frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		frame.BackgroundTransparency = 1
		frame.Name = "TextDesc"
		
		padding.PaddingLeft = UDim.new(0, 16)
		padding.PaddingRight = UDim.new(0, 90)
		padding.PaddingTop = UDim.new(0, 4)
		padding.PaddingBottom = UDim.new(0, 4)
		
		layout.VerticalAlignment = Enum.VerticalAlignment.Center
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 2)
		
		title.TextWrapped = true
		title.BorderSizePixel = 0
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.TextTransparency = 0.1
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.TextSize = 13
		title.Font = Enum.Font.GothamBold
		title.TextColor3 = Color3.fromRGB(240, 240, 245)
		title.BackgroundTransparency = 1
		title.RichText = true
		title.Size = UDim2.new(1, 0, 0, math.floor(16))
		title.AutomaticSize = Enum.AutomaticSize.Y
		title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title.Text = text

		if desc and desc ~= "" then
			local descf = Instance.new("TextLabel", frame)
			
			descf.TextWrapped = true
			descf.BorderSizePixel = 0
			descf.TextXAlignment = Enum.TextXAlignment.Left
			descf.TextTransparency = 0.3
			descf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			descf.TextSize = 10
			descf.Font = Enum.Font.Gotham
			descf.TextColor3 = Color3.fromRGB(180, 180, 190)
			descf.BackgroundTransparency = 1
			descf.RichText = true
			descf.Size = UDim2.new(1, 0, 0, math.floor(16))
			descf.AutomaticSize = Enum.AutomaticSize.Y
			descf.BorderColor3 = Color3.fromRGB(0, 0, 0)
			descf.Text = desc
			descf.LayoutOrder = 1
		end

		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			frame.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + 18)
			hg.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + 18)
		end)

		return hg
	end
	
	local function jc(c, p)
		local Mouse = game.Players.LocalPlayer:GetMouse()

		local relativeX = Mouse.X - c.AbsolutePosition.X
		local relativeY = Mouse.Y - c.AbsolutePosition.Y

		if relativeX < 0 or relativeY < 0 or relativeX > c.AbsoluteSize.X or relativeY > c.AbsoluteSize.Y then
			return
		end

		local ClickButtonCircle = Instance.new("Frame", p)
		ClickButtonCircle.BackgroundColor3 = Color3.fromRGB(120, 120, 140)
		ClickButtonCircle.BackgroundTransparency = 0.4
		ClickButtonCircle.BorderSizePixel = 0
		ClickButtonCircle.AnchorPoint = Vector2.new(0.5, 0.5)
		ClickButtonCircle.Position = UDim2.new(0, relativeX, 0, relativeY)
		ClickButtonCircle.Size = UDim2.new(0, 0, 0, 0)
		ClickButtonCircle.ZIndex = 10

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = ClickButtonCircle

		local expandTween = game:GetService("TweenService"):Create(ClickButtonCircle, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, c.AbsoluteSize.X * 1.8, 0, c.AbsoluteSize.X * 1.8),
			BackgroundTransparency = 1
		})

		expandTween.Completed:Connect(function()
			ClickButtonCircle:Destroy()
		end)

		expandTween:Play()
	end
	
	-- Main window with modern design
	local Shadow_1 = Instance.new("ImageLabel")
	local Frame_1 = Instance.new("CanvasGroup")
	local UICorner_1 = Instance.new("UICorner")
	local MainGradient = Instance.new("UIGradient")
	local isshowlogo = false
	
	Shadow_1.Name = "Shadow"
	Shadow_1.Parent = ScreenGui
	Shadow_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Shadow_1.BackgroundTransparency = 1
	Shadow_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Shadow_1.BorderSizePixel = 0
	Shadow_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Shadow_1.Size = UDim2.new(0, 420,0, 320)
	Shadow_1.Image = "rbxassetid://1316045217"
	Shadow_1.ImageColor3 = Color3.fromRGB(0,0,0)
	Shadow_1.ImageTransparency = 0.3
	
	lak(Shadow_1)
	
	Frame_1.Parent = Shadow_1
	Frame_1.Active = true
	Frame_1.BorderSizePixel = 0
	Frame_1.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
	Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_1.Size = UDim2.new(0.95, 0, 0.95, 0)
	Frame_1.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	
	UICorner_1.Parent = Frame_1
	UICorner_1.CornerRadius = UDim.new(0,12)
	
	-- Enhanced gradient
	MainGradient.Parent = Frame_1
	MainGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)), 
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 18)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 15))
	}
	MainGradient.Rotation = 45
	
	-- Modern stroke
	local MainStroke = Instance.new("UIStroke", Frame_1)
	MainStroke.Color = Color3.fromRGB(80, 80, 100)
	MainStroke.Thickness = 1
	MainStroke.Transparency = 0.8
	
	local TabFrame_1 = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	local IconFrame_1 = Instance.new("Frame")
	local ImageLabel_1 = Instance.new("ImageLabel")
	local TabGradient = Instance.new("UIGradient")
	
	TabFrame_1.Name = "TabFrame"
	TabFrame_1.Parent = Frame_1
	TabFrame_1.BackgroundColor3 = Color3.fromRGB(22,22,28)
	TabFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TabFrame_1.BorderSizePixel = 0
	TabFrame_1.Size = UDim2.new(0, 70,1, 0)
	
	-- Tab frame gradient
	TabGradient.Parent = TabFrame_1
	TabGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 35)), 
		ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 23))
	}
	TabGradient.Rotation = 90

	Frame_2.Parent = TabFrame_1
	Frame_2.BackgroundColor3 = Color3.fromRGB(100,100,120)
	Frame_2.BackgroundTransparency = 0.7
	Frame_2.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(1, 0,0, 0)
	Frame_2.Size = UDim2.new(0, 1,1, 0)

	IconFrame_1.Name = "IconFrame"
	IconFrame_1.Parent = TabFrame_1
	IconFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	IconFrame_1.BackgroundTransparency = 1
	IconFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	IconFrame_1.BorderSizePixel = 0
	IconFrame_1.Size = UDim2.new(1, 0,0, 60)

	ImageLabel_1.Parent = IconFrame_1
	ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ImageLabel_1.BackgroundTransparency = 1
	ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ImageLabel_1.BorderSizePixel = 0
	ImageLabel_1.Position = UDim2.new(0.5, 0,0.5, 0)
	ImageLabel_1.Size = UDim2.new(0, 45,0, 45)
	ImageLabel_1.Image = gl(op.Icon)
	
	-- Icon glow effect
	local iconGlow = Instance.new("UIStroke", ImageLabel_1)
	iconGlow.Color = Color3.fromRGB(120, 120, 140)
	iconGlow.Thickness = 2
	iconGlow.Transparency = 0.8
	
	local logoclick = click(ImageLabel_1)
	
	local Frame_3 = Instance.new("Frame")
	local UIPadding_1 = Instance.new("UIPadding")
	
	Frame_3.Parent = TabFrame_1
	Frame_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Frame_3.BackgroundTransparency = 1
	Frame_3.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Size = UDim2.new(1, 0,1, 0)

	UIPadding_1.Parent = Frame_3
	UIPadding_1.PaddingBottom = UDim.new(0,12)
	UIPadding_1.PaddingLeft = UDim.new(0,12)
	UIPadding_1.PaddingRight = UDim.new(0,12)
	UIPadding_1.PaddingTop = UDim.new(0,60)
	
	local Frame_4 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke_1 = Instance.new("UIStroke")
	local ScrollingFrame_1 = Instance.new("ScrollingFrame")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local UIPadding_2 = Instance.new("UIPadding")
	
	Frame_4.Parent = Frame_3
	Frame_4.BackgroundColor3 = Color3.fromRGB(35,35,42)
	Frame_4.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_4.BorderSizePixel = 0
	Frame_4.Size = UDim2.new(1, 0,1, 0)

	UICorner_2.Parent = Frame_4
	UICorner_2.CornerRadius = UDim.new(0,8)

	UIStroke_1.Parent = Frame_4
	UIStroke_1.Color = Color3.fromRGB(100,100,120)
	UIStroke_1.Thickness = 1
	UIStroke_1.Transparency = 0.8

	ScrollingFrame_1.Name = "ScrollingFrame"
	ScrollingFrame_1.Parent = Frame_4
	ScrollingFrame_1.Active = true
	ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ScrollingFrame_1.BackgroundTransparency = 1
	ScrollingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ScrollingFrame_1.BorderSizePixel = 0
	ScrollingFrame_1.Size = UDim2.new(1, 0,1, 0)
	ScrollingFrame_1.ClipsDescendants = true
	ScrollingFrame_1.AutomaticCanvasSize = Enum.AutomaticSize.None
	ScrollingFrame_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
	ScrollingFrame_1.CanvasPosition = Vector2.new(0, 0)
	ScrollingFrame_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
	ScrollingFrame_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ScrollingFrame_1.ScrollBarImageColor3 = Color3.fromRGB(120,120,140)
	ScrollingFrame_1.ScrollBarImageTransparency = 0.3
	ScrollingFrame_1.ScrollBarThickness = 3
	ScrollingFrame_1.ScrollingDirection = Enum.ScrollingDirection.XY
	ScrollingFrame_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
	ScrollingFrame_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	
	UIListLayout_1.Parent = ScrollingFrame_1
	UIListLayout_1.Padding = UDim.new(0,8)
	UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	
	UIPadding_2.Parent = Frame_4
	UIPadding_2.PaddingBottom = UDim.new(0,6)
	UIPadding_2.PaddingTop = UDim.new(0,6)
	
	logoclick.MouseButton1Click:Connect(function()
		isshowlogo = not isshowlogo
		if not isshowlogo then
			tw({v = Shadow_1, t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 420,0, 320)}}):Play()
			tw({v = TabFrame_1, t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 70,1, 0)}}):Play()
			for i,v in pairs(Frame_1:GetChildren()) do
				if v.Name == "Page" then
					tw({v = v.UIPadding, t = 0.3, s = "Quint", d = "Out", g = {PaddingLeft = UDim.new(0,85)}}):Play()
				end
			end
			for i,v in pairs(ScrollingFrame_1:GetChildren()) do
				if v:IsA("Frame") then
					tw({v = v, t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 45,0, 45)}}):Play()
					tw({v = v.ImageLabel, t = 0.3, s = "Quint", d = "Out", g = {Position = UDim2.new(0.5, 0,0.5, 0)}}):Play()
					tw({v = v.TextLabel, t = 0.2, s = "Linear", d = "In", g = {TextTransparency = 1}}):Play()
					tw({v = v.Selected, t = 0.3, s = "Quint", d = "Out", g = {BackgroundTransparency = 1, Size = UDim2.new(0, 3,0, 0)}}):Play()
					delay(.3,function()
						v.TextLabel.Visible = false
						v.Selected.Visible = false
					end)	
				end
			end
		else
			tw({v = Shadow_1, t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 540,0, 320)}}):Play()
			tw({v = TabFrame_1,t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 160,1, 0)}}):Play()
			for i,v in pairs(Frame_1:GetChildren()) do
				if v.Name == "Page" then
					tw({v = v.UIPadding, t = 0.3, s = "Quint", d = "Out", g = {PaddingLeft = UDim.new(0,175)}}):Play()
				end
			end
			for i,v in pairs(ScrollingFrame_1:GetChildren()) do
				if v:IsA("Frame") then
					v.TextLabel.Visible = true
					tw({v = v, t = 0.3, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 130,0, 35)}}):Play()
					tw({v = v.ImageLabel, t = 0.3, s = "Quint", d = "Out", g = {Position = UDim2.new(0.15, 0,0.5, 0)}}):Play()
					if v.BackgroundTransparency == 1 then
						tw({v = v.TextLabel, t = 0.3, s = "Linear", d = "Out", g = {TextTransparency = 0.6}}):Play()
						tw({v = v.ImageLabel, t = 0.3, s = "Linear", d = "Out", g = {ImageTransparency = 0.6}}):Play()
						v.Selected.Visible = true
						tw({v = v.Selected, t = 0.3, s = "Quint", d = "Out", g = {BackgroundTransparency = 1, Size = UDim2.new(0, 3,0, 0)}}):Play()
					else
						tw({v = v.TextLabel, t = 0.3, s = "Linear", d = "Out", g = {TextTransparency = 0}}):Play()
						tw({v = v.ImageLabel, t = 0.3, s = "Linear", d = "Out", g = {ImageTransparency = 0}}):Play()
						v.Selected.Visible = true
						tw({v = v.Selected, t = 0.3, s = "Quint", d = "Out", g = {BackgroundTransparency = 0, Size = UDim2.new(0, 3,0, 20)}}):Play()
					end
				end
			end
		end
	end)
	
	-- Enhanced close UI
	local ShadowCloseUI = Instance.new("ImageButton")
	local CloseUIFrame = Instance.new("Frame")
	local UICorner_1Frame = Instance.new("UICorner")
	local ImageLabel_1Frame = Instance.new("ImageLabel")
	local TextLabel_1Frame = Instance.new("TextLabel")
	local UIPadding_1Frame = Instance.new("UIPadding")
	local CloseGradient = Instance.new("UIGradient")
	local isopen = false

	ShadowCloseUI.Name = "ShadowCloseUI"
	ShadowCloseUI.Parent = ScreenGui
	ShadowCloseUI.AnchorPoint = Vector2.new(0, 1)
	ShadowCloseUI.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ShadowCloseUI.BackgroundTransparency = 1
	ShadowCloseUI.BorderColor3 = Color3.fromRGB(0,0,0)
	ShadowCloseUI.BorderSizePixel = 0
	ShadowCloseUI.Position = UDim2.new(0.015, 0,0.985, 0)
	ShadowCloseUI.Size = UDim2.new(0, 110,0, 45)
	ShadowCloseUI.Image = "rbxassetid://1316045217"
	ShadowCloseUI.ImageColor3 = Color3.fromRGB(0,0,0)
	ShadowCloseUI.ImageTransparency = 0.5

	CloseUIFrame.Parent = ShadowCloseUI
	CloseUIFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseUIFrame.BackgroundColor3 = Color3.fromRGB(18,18,22)
	CloseUIFrame.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseUIFrame.BorderSizePixel = 0
	CloseUIFrame.Position = UDim2.new(0.5, 0,0.5, 0)
	CloseUIFrame.Size = UDim2.new(0.9, 0,0.9, 0)

	UICorner_1Frame.Parent = CloseUIFrame
	UICorner_1Frame.CornerRadius = UDim.new(0,8)
	
	-- Close UI gradient
	CloseGradient.Parent = CloseUIFrame
	CloseGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 32)), 
		ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
	}
	CloseGradient.Rotation = 45

	ImageLabel_1Frame.Parent = CloseUIFrame
	ImageLabel_1Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_1Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ImageLabel_1Frame.BackgroundTransparency = 1
	ImageLabel_1Frame.BorderColor3 = Color3.fromRGB(0,0,0)
	ImageLabel_1Frame.BorderSizePixel = 0
	ImageLabel_1Frame.Position = UDim2.new(0.22, 0,0.5, 0)
	ImageLabel_1Frame.Size = UDim2.new(0, 32,0, 32)
	ImageLabel_1Frame.Image = "rbxassetid://75995793188886"

	TextLabel_1Frame.Parent = CloseUIFrame
	TextLabel_1Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextLabel_1Frame.BackgroundTransparency = 1
	TextLabel_1Frame.BorderColor3 = Color3.fromRGB(0,0,0)
	TextLabel_1Frame.BorderSizePixel = 0
	TextLabel_1Frame.Size = UDim2.new(1, 0,1, 0)
	TextLabel_1Frame.Font = Enum.Font.GothamBold
	TextLabel_1Frame.Text = op.Title
	TextLabel_1Frame.TextColor3 = Color3.fromRGB(240,240,245)
	TextLabel_1Frame.TextSize = 11
	TextLabel_1Frame.TextXAlignment = Enum.TextXAlignment.Right

	UIPadding_1Frame.Parent = CloseUIFrame
	UIPadding_1Frame.PaddingRight = UDim.new(0,8)
	
	local function closeopenui()
		isopen = not isopen
		local g
		if isopen then
			if g then
				g:Cancel()
			end
			tw({
				v = Shadow_1,
				t = 0.25,
				s = "Quint",
				d = "Out",
				g = {ImageTransparency = 1}
			}):Play()
			g = tw({
				v = Frame_1,
				t = 0.25,
				s = "Quint",
				d = "Out",
				g = {GroupTransparency = 1}
			})
			g:Play()
			g.Completed:Connect(function()
				Shadow_1.Visible = false
			end)
		else
			Shadow_1.Visible = true
			tw({
				v = Frame_1,
				t = 0.25,
				s = "Quint",
				d = "Out",
				g = {GroupTransparency = 0}
			}):Play()
			tw({
				v = Shadow_1,
				t = 0.25,
				s = "Quint",
				d = "Out",
				g = {ImageTransparency = 0.3}
			}):Play()
		end
	end

	ShadowCloseUI.MouseButton1Click:Connect(function()
		closeopenui()
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == KeyCloseUI then
			closeopenui()
		end
	end)
	
	Library.Tabs = {va = false}
	
	function Library.Tabs:CreateTab(op)
		assert(op.Title, "Tab Missing Title")
		assert(op.Icon, "Tab " .. op.Title .. " Missing Icon")
		
		local Frame_5 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local ImageLabel_2 = Instance.new("ImageLabel")
		local TextLabel_1 = Instance.new("TextLabel")
		local TabGradient = Instance.new("UIGradient")
		local TabStroke = Instance.new("UIStroke")
		
		Frame_5.Parent = ScrollingFrame_1
		Frame_5.BackgroundColor3 = Color3.fromRGB(35,35,45)
		Frame_5.BackgroundTransparency = 1
		Frame_5.BorderColor3 = Color3.fromRGB(0,0,0)
		Frame_5.BorderSizePixel = 0
		Frame_5.Size = UDim2.new(0, 45,0, 45)

		UICorner_3.Parent = Frame_5
		UICorner_3.CornerRadius = UDim.new(0,10)
		
		-- Modern tab gradient
		TabGradient.Parent = Frame_5
		TabGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 55)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 38))
		}
		TabGradient.Rotation = 135
		
		-- Tab stroke
		TabStroke.Parent = Frame_5
		TabStroke.Color = Color3.fromRGB(100, 100, 120)
		TabStroke.Thickness = 1
		TabStroke.Transparency = 0.9

		ImageLabel_2.Parent = Frame_5
		ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
		ImageLabel_2.BackgroundTransparency = 1
		ImageLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
		ImageLabel_2.BorderSizePixel = 0
		ImageLabel_2.Position = UDim2.new(0.5, 0,0.5, 0)
		ImageLabel_2.Size = UDim2.new(0, 20,0, 20)
		ImageLabel_2.Image = gl(op.Icon) or gl(14940601316)
		ImageLabel_2.ImageTransparency = 0.6

		TextLabel_1.Parent = Frame_5
		TextLabel_1.AnchorPoint = Vector2.new(1, 0)
		TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		TextLabel_1.BackgroundTransparency = 1
		TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TextLabel_1.BorderSizePixel = 0
		TextLabel_1.Position = UDim2.new(1, 0,0, 0)
		TextLabel_1.Size = UDim2.new(0.65, 0,1, 0)
		TextLabel_1.Font = Enum.Font.GothamBold
		TextLabel_1.Text = op.Title
		TextLabel_1.TextColor3 = Color3.fromRGB(240,240,245)
		TextLabel_1.TextSize = 12
		TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_1.TextTransparency = 1
		TextLabel_1.Visible = false
		
		local Selected = Instance.new("Frame")
		local UICorner_1Select = Instance.new("UICorner")
		local SelectedGradient = Instance.new("UIGradient")

		Selected.Name = "Selected"
		Selected.Parent = Frame_5
		Selected.AnchorPoint = Vector2.new(0, 0.5)
		Selected.BackgroundColor3 = Color3.fromRGB(120,120,200)
		Selected.BorderColor3 = Color3.fromRGB(0,0,0)
		Selected.BorderSizePixel = 0
		Selected.Position = UDim2.new(0, 0,0.5, 0)
		Selected.Size = UDim2.new(0, 3,0, 0)
		Selected.BackgroundTransparency = 1
		Selected.Visible = false

		UICorner_1Select.Parent = Selected
		UICorner_1Select.CornerRadius = UDim.new(1,0)
		
		-- Selection gradient
		SelectedGradient.Parent = Selected
		SelectedGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 140, 220)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 180))
		}
		SelectedGradient.Rotation = 90
		
		local click = click(Frame_5)
		
		local Page_1 = Instance.new("Frame")
		local UIPadding_3 = Instance.new("UIPadding")
		local PageList_1 = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_4 = Instance.new("UIPadding")
		
		Page_1.Name = "Page"
		Page_1.Parent = Frame_1
		Page_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Page_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Page_1.BackgroundTransparency = 1
		Page_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Page_1.BorderSizePixel = 0
		Page_1.Position = UDim2.new(0.5, 0,0.5, 0)
		Page_1.Size = UDim2.new(1, 0,1, 0)
		Page_1.Visible = false
		Page_1.ClipsDescendants = true

		UIPadding_3.Parent = Page_1
		UIPadding_3.PaddingBottom = UDim.new(0,15)
		UIPadding_3.PaddingLeft = UDim.new(0,85)
		UIPadding_3.PaddingRight = UDim.new(0,15)
		UIPadding_3.PaddingTop = UDim.new(0,15)

		PageList_1.Name = "PageList"
		PageList_1.Parent = Page_1
		PageList_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PageList_1.BackgroundTransparency = 1
		PageList_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PageList_1.BorderSizePixel = 0
		PageList_1.Size = UDim2.new(1, 0,1, 0)
		PageList_1.AutomaticCanvasSize = Enum.AutomaticSize.None
		PageList_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		PageList_1.CanvasPosition = Vector2.new(0, 0)
		PageList_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
		PageList_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		PageList_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageList_1.ScrollBarImageColor3 = Color3.fromRGB(120,120,140)
		PageList_1.ScrollBarImageTransparency = 0.3
		PageList_1.ScrollBarThickness = 3
		PageList_1.ScrollingDirection = Enum.ScrollingDirection.XY
		PageList_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		PageList_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
		PageList_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

		UIListLayout_2.Parent = PageList_1
		UIListLayout_2.Padding = UDim.new(0,8)
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center

		UIPadding_4.Parent = PageList_1
		UIPadding_4.PaddingRight = UDim.new(0,12)
		
		local function changepage()
			tw({v = Frame_5, t = 0.25, s = "Quint", d = "Out", g = {BackgroundTransparency = 0.2}}):Play()
			tw({v = TabStroke, t = 0.25, s = "Linear", d = "Out", g = {Transparency = 0.5}}):Play()
			tw({v = TextLabel_1, t = 0.25, s = "Linear", d = "Out", g = {TextTransparency = 0}}):Play()
			tw({v = ImageLabel_2, t = 0.25, s = "Linear", d = "Out", g = {ImageTransparency = 0}}):Play()
			tw({v = Selected, t = 0.25, s = "Quint", d = "Out", g = {BackgroundTransparency = 0, Size = UDim2.new(0, 3,0, 20)}}):Play()
			Page_1.Visible = true
		end
		
		click.MouseButton1Click:Connect(function()
			for i,v in pairs(Frame_1:GetChildren()) do
				if v.Name == "Page" then
					v.Visible = false
				end
			end
			for i,v in pairs(ScrollingFrame_1:GetChildren()) do
				if v:IsA("Frame") then
					tw({v = v, t = 0.25, s = "Linear", d = "Out", g = {BackgroundTransparency = 1}}):Play()
					tw({v = v:FindFirstChild("UIStroke"), t = 0.25, s = "Linear", d = "Out", g = {Transparency = 0.9}}):Play()
					tw({v = v.TextLabel, t = 0.25, s = "Linear", d = "Out", g = {TextTransparency = 0.6}}):Play()
					tw({v = v.ImageLabel, t = 0.25, s = "Linear", d = "Out", g = {ImageTransparency = 0.6}}):Play()
					tw({v = v.Selected, t = 0.25, s = "Quint", d = "Out", g = {BackgroundTransparency = 1, Size = UDim2.new(0, 3,0, 0)}}):Play()
				end
			end
			changepage()
		end)
		
		delay(.4 ,function()
			if not Library.Tabs.va then
				changepage()
				Library.Tabs.va = true
			end
		end)
		
		Library.Main = {}
			
		function Library.Main:CreateToggle(op)
			assert(op.Title, "Toggle Missing Title")
			local toggle = background(PageList_1, op.Title, op.Desc)
			local Value = op.Value or false
			local Callback = op.Callback or function() end
			
			local Frame = Instance.new("Frame")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local UIPadding_1 = Instance.new("UIPadding")
			local Frame_1 = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local Frame_3 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local done_1 = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local ToggleGradient = Instance.new("UIGradient")
			local Click = Instance.new("TextButton", toggle)

			Frame.Parent = toggle
			Frame.AnchorPoint = Vector2.new(1, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(1, 0,0.5, 0)
			Frame.Size = UDim2.new(0, 100,0.800000012, 0)

			UIListLayout_1.Parent = Frame
			UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

			UIPadding_1.Parent = Frame
			UIPadding_1.PaddingRight = UDim.new(0,16)

			Frame_1.Parent = Frame
			Frame_1.BackgroundColor3 = Color3.fromRGB(45,45,55)
			Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_1.BorderSizePixel = 0
			Frame_1.Size = UDim2.new(0, 18,0, 18)

			UICorner_1.Parent = Frame_1
			UICorner_1.CornerRadius = UDim.new(0,6)
			
			Frame_3.Parent = Frame_1
			Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame_3.BackgroundColor3 = Color3.fromRGB(140, 140, 220)
			Frame_3.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_3.BorderSizePixel = 0
			Frame_3.Size = UDim2.new(0, 0,0, 0)
			Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
			
			UICorner_3.Parent = Frame_3
			UICorner_3.CornerRadius = UDim.new(0,6)
			
			-- Toggle gradient
			ToggleGradient.Parent = Frame_3
			ToggleGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 160, 240)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 120, 200))
			}
			ToggleGradient.Rotation = 45

			done_1.Name = "done"
			done_1.Parent = Frame_3
			done_1.AnchorPoint = Vector2.new(0.5, 0.5)
			done_1.BackgroundColor3 = Color3.fromRGB(27,27,27)
			done_1.BackgroundTransparency = 1
			done_1.BorderColor3 = Color3.fromRGB(27,27,27)
			done_1.Position = UDim2.new(0.5, 0,0.5, 0)
			done_1.Size = UDim2.new(0.7, 0,0.7, 0)
			done_1.Image = "rbxassetid://3926305904"
			done_1.ImageColor3 = Color3.fromRGB(255, 255, 255)
			done_1.ImageRectOffset = Vector2.new(644, 204)
			done_1.ImageRectSize = Vector2.new(36, 36)

			UICorner_2.Parent = done_1
			UICorner_2.CornerRadius = UDim.new(0,4)
			
			Click.Name = "Click"
			Click.Active = true
			Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Click.BackgroundTransparency = 1
			Click.BorderColor3 = Color3.fromRGB(0,0,0)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(1, 0,1, 0)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextSize = 14
			Click.ZIndex = 2
			
			local function ToggleC(Value)
				if not Value then
					tw({v = toggle.TextDesc.TextLabel, t = 0.2, s = "Quint", d = "Out", g = {TextTransparency = 0.3}}):Play()
					tw({v = Frame_3, t = 0.2, s = "Quint", d = "Out", g = {Size = UDim2.new(0, 0, 0, 0)}}):Play()
					tw({v = Frame_3, t = 0.4, s = "Quint", d = "Out", g = {Rotation = 0}}):Play()
					pcall(function() Callback(Value) end)
				elseif Value then
					tw({v = toggle.TextDesc.TextLabel, t = 0.2, s = "Quint", d = "Out", g = {TextTransparency = 0.1}}):Play()
					tw({v = Frame_3, t = 0.2, s = "Quint", d = "Out", g = {Size = UDim2.new(1, 0, 1, 0)}}):Play()
					tw({v = Frame_3, t = 0.4, s = "Quint", d = "Out", g = {Rotation = 360}}):Play()
					pcall(function() Callback(Value) end)
				end
			end

			delay(0.6,function()
				ToggleC(Value)
			end)
			
			Click.MouseButton1Click:Connect(function()
				Value = not Value
				jc(Click, toggle)
				ToggleC(Value)
			end)
		end
		
		function Library.Main:CreateSlider(op)
			assert(op.Title, "Slider Missing Title")
			local slider = background(PageList_1, op.Title, op.Desc)
			local Min = op.Min or 0
			local Max = op.Max or 100
			local Value = op.Value or Max/2
			local DecimalPlaces = op.DecimalPlaces or 0
			local Callback = op.Callback or function() end
			
			slider.TextDesc.TextLabel.TextTransparency = 0.1
			slider.TextDesc.UIPadding.PaddingRight = UDim.new(0, 220)
			
			local Frame = Instance.new("Frame")
			local UIPadding_1 = Instance.new("UIPadding")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local TextBox_1 = Instance.new("TextBox")
			local Frame_1 = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local Frame_2 = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIGradient_1 = Instance.new("UIGradient")
			local Click = Instance.new("TextButton", Frame_1)

			Frame.Parent = slider
			Frame.AnchorPoint = Vector2.new(1, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(1, 0,0.5, 0)
			Frame.Size = UDim2.new(0, 210,0.800000012, 0)

			UIPadding_1.Parent = Frame
			UIPadding_1.PaddingRight = UDim.new(0,16)

			UIListLayout_1.Parent = Frame
			UIListLayout_1.Padding = UDim.new(0,8)
			UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

			TextBox_1.Parent = Frame
			TextBox_1.Active = true
			TextBox_1.BackgroundColor3 = Color3.fromRGB(45,45,55)
			TextBox_1.BackgroundTransparency = 0.2
			TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
			TextBox_1.BorderSizePixel = 0
			TextBox_1.LayoutOrder = -1
			TextBox_1.Size = UDim2.new(0, 40,0, 28)
			TextBox_1.Font = Enum.Font.GothamBold
			TextBox_1.PlaceholderColor3 = Color3.fromRGB(150,150,160)
			TextBox_1.PlaceholderText = ""
			TextBox_1.Text = "0"
			TextBox_1.TextColor3 = Color3.fromRGB(240,240,245)
			TextBox_1.TextSize = 11
			
			-- Textbox corner
			local TextBoxCorner = Instance.new("UICorner", TextBox_1)
			TextBoxCorner.CornerRadius = UDim.new(0, 6)

			Frame_1.Parent = Frame
			Frame_1.BackgroundColor3 = Color3.fromRGB(35,35,45)
			Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_1.BorderSizePixel = 0
			Frame_1.Size = UDim2.new(0, 160,0, 8)

			UICorner_1.Parent = Frame_1
			UICorner_1.CornerRadius = UDim.new(1,0)

			Frame_2.Name = "Frame"
			Frame_2.Parent = Frame_1
			Frame_2.BackgroundColor3 = Color3.fromRGB(140,140,220)
			Frame_2.BorderColor3 = Color3.fromRGB(0,0,0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Size = UDim2.new(0, 0,1, 0)
			Frame_2.ClipsDescendants = true

			UICorner_2.Parent = Frame_2
			UICorner_2.CornerRadius = UDim.new(1,0)

			UIPadding_2.Parent = Frame_2
			UIPadding_2.PaddingRight = UDim.new(0,1)

			UIGradient_1.Parent = Frame_2
			UIGradient_1.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 160, 240)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 120, 200))
			}
			
			Click.Name = "Click"
			Click.Active = true
			Click.AnchorPoint = Vector2.new(0.5, 0.5)
			Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Click.BackgroundTransparency = 1
			Click.BorderColor3 = Color3.fromRGB(0,0,0)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(1.2, 0,3, 0)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextSize = 14
			Click.ZIndex = 2
			Click.Position = UDim2.new(0.5, 0, 0.5, 0)
			
			local ImageLabel = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")

			ImageLabel.Parent = Frame_2
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.BorderColor3 = Color3.fromRGB(0,0,0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Size = UDim2.new(0, 160,0, 8)
			ImageLabel.Image = "rbxassetid://108090296301459"
			ImageLabel.ImageTransparency = 0.7
			ImageLabel.ScaleType = Enum.ScaleType.Crop

			UICorner.Parent = ImageLabel
			UICorner.CornerRadius = UDim.new(1,0)
			
			local function roundToDecimal(value, decimals)
				local factor = 10 ^ decimals
				return math.floor(value * factor + 0.5) / factor
			end

			local function tweenText(currentValue, targetValue)
				local startTime = tick()
				local diff = targetValue - currentValue

				local connection
				connection = game:GetService("RunService").Heartbeat:Connect(function()
					local elapsedTime = tick() - startTime
					local progress = math.clamp(elapsedTime / 0.25, 0, 1)

					TextBox_1.Text = tostring(math.floor(currentValue + diff * progress))

					if progress >= 1 then
						TextBox_1.Text = tostring(targetValue)
						connection:Disconnect()
					end
				end)
			end

			local function updateSlider(value)
				value = math.clamp(value, Min, Max)
				value = roundToDecimal(value, DecimalPlaces)
				tw({
					v = Frame_2,
					t = 0.4,
					s = "Quart",
					d = "Out",
					g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
				}):Play()
				tw({
					v = TextBox_1,
					t = 0.15,
					s = "Quint",
					d = "Out",
					g = {TextSize = 13, BackgroundTransparency = 0}
				}):Play()
				delay(0.12, function()
					tw({
						v = TextBox_1,
						t = 0.15,
						s = "Quint",
						d = "Out",
						g = {TextSize = 11, BackgroundTransparency = 0.2}
					}):Play()
				end)
				tweenText(tonumber(TextBox_1.Text), value)
				pcall(function()
					Callback(value)
				end)
			end

			delay(0.6,function()
				updateSlider(Value or 0)
			end)

			TextBox_1.FocusLost:Connect(function()
				local value = tonumber(TextBox_1.Text) or Min
				updateSlider(value)
			end)

			local function move(input)
				local sliderBar = Frame_1
				local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
				local value = relativeX * (Max - Min) + Min
				updateSlider(value)
			end

			local dragging = false

			Click.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					move(input)
				end
			end)

			Click.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = false
				end
			end)

			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					move(input)
				end
			end)

		end
