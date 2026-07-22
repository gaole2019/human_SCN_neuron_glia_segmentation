# finetune model to segment glia
python -m cellpose --train --dir '/home/dell/Documents/LeGAO/Task_NucleiSegmentation/new_0716/a_training_1101/train_set_3_1101/glia' --pretrained_model nuclei --chan 0 --chan2 0 --min_train_masks 1 --learning_rate 0.1 --weight_decay 0.0001 --n_epochs 1000 --verbose --use_gpu

# finetune model to segment neuron
python -m cellpose --train --dir '/home/dell/Documents/LeGAO/Task_NucleiSegmentation/new_0716/a_training_1101/train_set_3_1101/neuron' --pretrained_model nuclei --chan 0 --chan2 0 --min_train_masks 1 --learning_rate 0.1 --weight_decay 0.0001 --n_epochs 1000 --verbose --use_gpu

