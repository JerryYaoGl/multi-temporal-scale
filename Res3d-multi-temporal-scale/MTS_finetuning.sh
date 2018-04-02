temporalscales=(
RGB_4f
RGB_8f
RGB_16f
OF_4f
OF_8f
OF_16f
)

function finetuning()
{
    cd $1
    ./finetuning_ucf101.sh
    cd ../
}

for scale in ${temporalscales[@]};
do
    finetuning $scale
done


