# -*- coding: utf-8 -*-
"""
GPU対応のPyTorch環境があることの確認
"""
import torch
import sklearn

import numpy as np
import pandas as pd
import cv2

def main():
    device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    print('使用デバイス:{}'.format(device))
    print(f'PyTorchバージョン:{torch.__version__}')
    print(f'Scikit-learnバージョン:{sklearn.__version__}')
    print(f'pandasバージョン:{pd.__version__}')
    print(f'numpyバージョン:{np.__version__}')
    print(f'opencvバージョン:{cv2.__version__}')
if __name__ == "__main__":
    main()