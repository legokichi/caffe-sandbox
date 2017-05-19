wget http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_16_layers.caffemodel
wget https://gist.githubusercontent.com/ksimonyan/211839e770f7b538e2d8/raw/ded9363bd93ec0c770134f4e387d8aaaaa2407ce/VGG_ILSVRC_16_layers_deploy.prototxt
wget https://upload.wikimedia.org/wikipedia/commons/9/98/Sanzio_01_Plato_Aristotle.jpg
source $CAFFE_HOME/data/ilsvrc12/get_ilsvrc_aux.sh
convert -crop 224x224+130+40 Sanzio_01_Plato_Aristotle.jpg crop.jpg
$CAFFE_HOME/python/classify.py --raw_scale 224 --model_def VGG_ILSVRC_16_layers_deploy.prototxt --pretrained_model VGG_ILSVRC_16_layers.caffemodel --mean_file '' ./crop.jpg result.npz
python show_result.py $CAFFE_HOME/data/ilsvrc12/synset_words.txt result.npy.npy
#1 | n04584207 wig | 63.5%
#2 | n02895154 breastplate, aegis, egis | 12.9%
#3 | n02113799 standard poodle |  2.1%







