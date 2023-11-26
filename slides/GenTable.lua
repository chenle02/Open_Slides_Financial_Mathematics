#!/usr/bin/env lua
if #arg == 0  then
    print(arg[0] .. " [Yes]")
    print([[

    Make sure first edit TOC.lua and run it to generate TOC.table.

        By Le Chen;
        chenle02@gmail.com
        Sun 15 Aug 2021 12:55:47 PM EDT
    ]])
    return
end


toc = dofile("toc.table")

file = io.open("Table.wiki",'w')
file:write("|Chapter/Section  |Slides|Slides|\n")
for i=1,#toc do
  Chapter_full = 'Chapter-' .. toc[i]['Number'] .. '_full.pdf'
  Chapter_comp = 'Chapter-' .. toc[i]['Number'] .. '_compact.pdf'
  file:write('|*Chapter ' .. toc[i]['Number'] .. ': ' .. toc[i]['Name'] .. '*| [[local:../vimwiki_html/' .. Chapter_full .. '|presentation]] | [[local:../vimwiki_html/' .. Chapter_comp .. '|compact]]|\n')
  for j=1,#toc[i]['Sections'] do
      Section_Num = toc[i]['Number'] .. '.' .. j
      Section_full = 'Section_' .. toc[i]['Number'] .. '-' .. j .. '_full.pdf'
      Section_comp = 'Section_' .. toc[i]['Number'] .. '-' .. j .. '_compact.pdf'
      file:write('| ' .. Section_Num .. '. ' .. toc[i]['Sections'][j] .. '| [[local:../vimwiki_html/' .. Section_full.. '|pres.]] | [[local:../vimwiki_html/' .. Section_comp.. '|comp.]]|\n')
  end
end
file:close()


