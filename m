Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t62sm662005wmb.24.2017.07.04.07.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:15 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 2C4BB3E21FE;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 09/11] aarch64.risu: remove duplicate AdvSIMD Scalar 3 same block
Date: Tue,  4 Jul 2017 15:48:57 +0100
Message-Id: <20170704144859.17644-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: v2q3UMaJDvhD

A chunk of the AArch64 definitions repeat themselves. Clean that up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/aarch64.risu b/aarch64.risu
index bfca45f..609021a 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2130,6 +2130,8 @@ SQDMULL_S3D A64_V 0 1 U 11110 size:2 1 rm:5 1101 00 rn:5 rd:5
 # 31 30 29 28 27 26 25 24 23 22 21 20    16 15      11 10  9    5   4    0
 #  0  1 U   1  1  1  1  0  size  1 [  Rm  ] [ opcode ]  1 [  Rn  ] [  Rd  ]
 #
+@AdvSIMDScalar3Same
+
 SQADD    A64_V   01 0 11110 size:2 1 rm:5 00001 1 rn:5 rd:5
 SQSUB    A64_V   01 0 11110 size:2 1 rm:5 00101 1 rn:5 rd:5
 CMGT     A64_V   01 0 11110 size:2 1 rm:5 00110 1 rn:5 rd:5
@@ -2167,28 +2169,7 @@ FCMGT    A64_V   01 1 11110 1 size:1 1 rm:5 11100 1 rn:5 rd:5
 FACGT    A64_V   01 1 11110 1 size:1 1 rm:5 11101 1 rn:5 rd:5 \
 !constraints { $size != 11; }
 
-CMTST    A64_v   01 0 11110 size:2 1 rm:5 10001 1 rn:5 rd:5
-SQDMULH  A64_v   01 0 11110 size:2 1 rm:5 10110 1 rn:5 rd:5
-FMULX    A64_v   01 0 11110 0 size:1 1 rm:5 11011 1 rn:5 rd:5
-FCMEQ    A64_v   01 0 11110 0 size:1 1 rm:5 11100 1 rn:5 rd:5
-FRECPS   A64_v   01 0 11110 0 size:1 1 rm:5 11111 1 rn:5 rd:5
-FRSQRTS  A64_v   01 0 11110 1 size:1 1 rm:5 11111 1 rn:5 rd:5
-UQADD    A64_v   01 1 11110 size:2 1 rm:5 00001 1 rn:5 rd:5
-UQSUB    A64_v   01 1 11110 size:2 1 rm:5 00101 1 rn:5 rd:5
-CMHI     A64_v   01 1 11110 size:2 1 rm:5 00110 1 rn:5 rd:5
-CMHS     A64_v   01 1 11110 size:2 1 rm:5 00111 1 rn:5 rd:5
-USHL     A64_v   01 1 11110 size:2 1 rm:5 01000 1 rn:5 rd:5
-UQSHL    A64_v   01 1 11110 size:2 1 rm:5 01001 1 rn:5 rd:5
-URSHL    A64_v   01 1 11110 size:2 1 rm:5 01010 1 rn:5 rd:5
-UQRSHL   A64_v   01 1 11110 size:2 1 rm:5 01011 1 rn:5 rd:5
-SUBv     A64_v   01 1 11110 size:2 1 rm:5 10000 1 rn:5 rd:5
-CMEQ     A64_v   01 1 11110 size:2 1 rm:5 10001 1 rn:5 rd:5
-SQRDMULH A64_v   01 1 11110 size:2 1 rm:5 10110 1 rn:5 rd:5
-FCMGE    A64_v   01 1 11110 0 size:1 1 rm:5 11100 1 rn:5 rd:5
-FACGE    A64_v   01 1 11110 0 size:1 1 rm:5 11101 1 rn:5 rd:5
-FABD     A64_v   01 1 11110 1 size:1 1 rm:5 11010 1 rn:5 rd:5
-FCMGT    A64_v   01 1 11110 1 size:1 1 rm:5 11100 1 rn:5 rd:5
-FACGT    A64_v   01 1 11110 1 size:1 1 rm:5 11101 1 rn:5 rd:5
+@
 
 # C3.6.12 AdvSIMD scalar 2reg misc
 CMGTzero A64_V      01 0 11110 size:2 10000 01000 10 rn:5 rd:5
-- 
2.13.0
