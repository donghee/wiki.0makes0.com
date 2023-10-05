cp ../작품포장.md 03-작품포장.md
cp ../전시장조성.md 04-전시장조성.md
cp ../홍보-디자인.md 05-홍보-디자인.md
cp ../전시운영.md 06-전시운영.md
cp ../부록.md 07-부록.md

# [[_TOC_|levels=3]]
#find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/\[\[_TOC_\]\]\|levels\=3=\]\]/[\[\_TOC_\]\]/g'
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/|levels=3//g'

cd ../
make mdbook
