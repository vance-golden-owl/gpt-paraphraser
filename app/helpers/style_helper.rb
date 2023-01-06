module StyleHelper 
  def style_base_on_flash_type(type)
    { 
      alert: 'bg-red-100 border-t-4 border-red-500 rounded-b text-red-900 px-4 py-3 shadow-md', 
      notice: 'bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md',
      info: 'bg-blue-100 border-t-4 border-blue-500 rounded-b text-blue-900 px-4 py-3 shadow-md'
    }[type.to_sym] || type.to_s
  end
end