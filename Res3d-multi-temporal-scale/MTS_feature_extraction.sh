temporalscales=(
RGB_4f
RGB_8f
RGB_16f
OF_4f
OF_8f
OF_16f
)

function feature_extraction()
{
    cd $1
    ./feature_extraction.sh
    cd ../
}

for scale in ${temporalscales[@]};
do
    feature_extraction $scale
done


