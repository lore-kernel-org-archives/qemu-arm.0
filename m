Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y192sm18342573wmy.6.2017.07.04.07.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:15 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 362883E21FF;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 10/11] aarch64.risu: remove duplicate AdvSIMD scalar 2 reg misc block
Date: Tue,  4 Jul 2017 15:48:58 +0100
Message-Id: <20170704144859.17644-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aOBXWdp1nQ6s

While at that also:
  - sort alphabetically
  - add to @AdvSIMDScalar2RegMisc group

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 114 ++++++++++++++++++++---------------------------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/aarch64.risu b/aarch64.risu
index 609021a..5450cd3 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2171,85 +2171,49 @@ FACGT    A64_V   01 1 11110 1 size:1 1 rm:5 11101 1 rn:5 rd:5 \
 
 @
 
-# C3.6.12 AdvSIMD scalar 2reg misc
-CMGTzero A64_V      01 0 11110 size:2 10000 01000 10 rn:5 rd:5
-CMGEzero A64_V      01 1 11110 size:2 10000 01000 10 rn:5 rd:5
-CMEQzero A64_V      01 0 11110 size:2 10000 01001 10 rn:5 rd:5
-CMLEzero A64_V      01 1 11110 size:2 10000 01001 10 rn:5 rd:5
-CMLTzero A64_V      01 0 11110 size:2 10000 01010 10 rn:5 rd:5
-ABS A64_V           01 0 11110 size:2 10000 01011 10 rn:5 rd:5
-NEG A64_V           01 1 11110 size:2 10000 01011 10 rn:5 rd:5
-
-FCMGT_S2MISC A64_V  01 0 11110 size:2 10000 01100 10 rn:5 rd:5
-FCMEQ_S2MISC A64_V  01 0 11110 size:2 10000 01101 10 rn:5 rd:5
-FCMLT_S2MISC A64_V  01 0 11110 size:2 10000 01110 10 rn:5 rd:5
-FCMGE_S2MISC A64_V  01 1 11110 size:2 10000 01100 10 rn:5 rd:5
-FCMLE_S2MISC A64_V  01 1 11110 size:2 10000 01101 10 rn:5 rd:5
-
-SCVTF_S2MISC A64_V 01 0 11110 0 sz 10000 11101 10 rn:5 rd:5
-UCVTF_S2MISC A64_V 01 1 11110 0 sz 10000 11101 10 rn:5 rd:5
-
-FCVTNS_S2MISC A64_V 01 0 11110 0 sz 10000 11010 10 rn:5 rd:5
-FCVTMS_S2MISC A64_V 01 0 11110 0 sz 10000 11011 10 rn:5 rd:5
-FCVTAS_S2MISC A64_V 01 0 11110 0 sz 10000 11100 10 rn:5 rd:5
-FCVTPS_S2MISC A64_V 01 0 11110 1 sz 10000 11010 10 rn:5 rd:5
-FCVTZS_S2MISC A64_V 01 0 11110 1 sz 10000 11011 10 rn:5 rd:5
-
-FCVTNU_S2MISC A64_V 01 1 11110 0 sz 10000 11010 10 rn:5 rd:5
-FCVTMU_S2MISC A64_V 01 1 11110 0 sz 10000 11011 10 rn:5 rd:5
-FCVTAU_S2MISC A64_V 01 1 11110 0 sz 10000 11100 10 rn:5 rd:5
-FCVTPU_S2MISC A64_V 01 1 11110 1 sz 10000 11010 10 rn:5 rd:5
-FCVTZU_S2MISC A64_V 01 1 11110 1 sz 10000 11011 10 rn:5 rd:5
-
-FCVTXN_S2MISC A64_V 01 1 11110 0 sz 10000 10110 10 rn:5 rd:5
-
-SUQADD_S2MISC A64_V 01 0 11110 size:2 10000 00011 10 rn:5 rd:5
-USQADD_S2MISC A64_V 01 1 11110 size:2 10000 00011 10 rn:5 rd:5
-SQABS_S2MISC A64_V 01 0 11110 size:2 10000 00111 10 rn:5 rd:5
-SQNEG_S2MISC A64_V 01 1 11110 size:2 10000 00111 10 rn:5 rd:5
-
-# XXX lots of others in this group
-
 # C3.6.12 AdvSIMD scalar two-reg misc
 # 31 30 29 28 27 26 25 24 23 22 21 20      16     12 11 10 9     5  4    0
 #  0  1 U   1  1  1  1  0  size  1 0 0 0 0 [ opcode ] 1 0 [  Rn  ] [  Rd  ]
 # U size opcode
-SUQADDs  A64_V          01 0 11110   size:2 10000 00011 10 rn:5 rd:5 
-SQABSs  A64_V           01 0 11110   size:2 10000 00111 10 rn:5 rd:5 
-CMGTzs  A64_V           01 0 11110   size:2 10000 01000 10 rn:5 rd:5 
-CMEQzs  A64_V           01 0 11110   size:2 10000 01001 10 rn:5 rd:5 
-CMLTzs  A64_V           01 0 11110   size:2 10000 01010 10 rn:5 rd:5 
-ABSs  A64_V             01 0 11110   size:2 10000 01011 10 rn:5 rd:5 
-SQXTN_SQXTN2s  A64_V    01 0 11110   size:2 10000 10100 10 rn:5 rd:5 
-FCVTNSvs  A64_V         01 0 11110 0 size:1 10000 11010 10 rn:5 rd:5 
-FCVTMSvs  A64_V         01 0 11110 0 size:1 10000 11011 10 rn:5 rd:5 
-FCVTASvs  A64_V         01 0 11110 0 size:1 10000 11100 10 rn:5 rd:5 
-SCVTFvis  A64_V         01 0 11110 0 size:1 10000 11101 10 rn:5 rd:5 
-FCMGTzs  A64_V          01 0 11110 1 size:1 10000 01100 10 rn:5 rd:5 
-FCMEQzs  A64_V          01 0 11110 1 size:1 10000 01101 10 rn:5 rd:5 
-FCMLTzs  A64_V          01 0 11110 1 size:1 10000 01110 10 rn:5 rd:5 
-FCVTPSvs  A64_V         01 0 11110 1 size:1 10000 11010 10 rn:5 rd:5 
-FCVTZSvis  A64_V        01 0 11110 1 size:1 10000 11011 10 rn:5 rd:5 
-FRECPEs  A64_V          01 0 11110 1 size:1 10000 11101 10 rn:5 rd:5 
-FRECPX  A64_V           01 0 11110 1 size:1 10000 11111 10 rn:5 rd:5 
-USQADDs  A64_V          01 1 11110   size:2 10000 00011 10 rn:5 rd:5 
-SQNEGs  A64_V           01 1 11110   size:2 10000 00111 10 rn:5 rd:5 
-CMGzs  A64_V            01 1 11110   size:2 10000 01000 10 rn:5 rd:5 
-CMLEzs  A64_V           01 1 11110   size:2 10000 01001 10 rn:5 rd:5 
-NEGvs  A64_V            01 1 11110   size:2 10000 01011 10 rn:5 rd:5 
-SQXTUN_SQXTUN2s  A64_V  01 1 11110   size:2 10000 10010 10 rn:5 rd:5 
-UQXTN_UQXTN2s  A64_V    01 1 11110   size:2 10000 10100 10 rn:5 rd:5 
-FCVTXN_FCVTXN2s  A64_V  01 1 11110 0 size:1 10000 10110 10 rn:5 rd:5 
-FCVTNUvs  A64_V         01 1 11110 0 size:1 10000 11010 10 rn:5 rd:5 
-FCVTMUvs  A64_V         01 1 11110 0 size:1 10000 11011 10 rn:5 rd:5 
-FCVTAUvs  A64_V         01 1 11110 0 size:1 10000 11100 10 rn:5 rd:5 
-UCVTFvis  A64_V         01 1 11110 0 size:1 10000 11101 10 rn:5 rd:5 
-FCMGEzs  A64_V          01 1 11110 1 size:1 10000 01100 10 rn:5 rd:5 
-FCMLEzs  A64_V          01 1 11110 1 size:1 10000 01101 10 rn:5 rd:5 
-FCVTPUvs  A64_V         01 1 11110 1 size:1 10000 11010 10 rn:5 rd:5 
-FCVTZUvis  A64_V        01 1 11110 1 size:1 10000 11011 10 rn:5 rd:5 
-FRSQRTEs  A64_V         01 1 11110 1 size:1 10000 11101 10 rn:5 rd:5 
- 
+@AdvSIMDScalar2RegMisc
+
+ABSs  A64_V             01 0 11110   size:2 10000 01011 10 rn:5 rd:5
+CMEQzs  A64_V           01 0 11110   size:2 10000 01001 10 rn:5 rd:5
+CMGTzs  A64_V           01 0 11110   size:2 10000 01000 10 rn:5 rd:5
+CMGzs  A64_V            01 1 11110   size:2 10000 01000 10 rn:5 rd:5
+CMLEzs  A64_V           01 1 11110   size:2 10000 01001 10 rn:5 rd:5
+CMLTzs  A64_V           01 0 11110   size:2 10000 01010 10 rn:5 rd:5
+FCMEQzs  A64_V          01 0 11110 1 size:1 10000 01101 10 rn:5 rd:5
+FCMGEzs  A64_V          01 1 11110 1 size:1 10000 01100 10 rn:5 rd:5
+FCMGTzs  A64_V          01 0 11110 1 size:1 10000 01100 10 rn:5 rd:5
+FCMLEzs  A64_V          01 1 11110 1 size:1 10000 01101 10 rn:5 rd:5
+FCMLTzs  A64_V          01 0 11110 1 size:1 10000 01110 10 rn:5 rd:5
+FCVTASvs  A64_V         01 0 11110 0 size:1 10000 11100 10 rn:5 rd:5
+FCVTAUvs  A64_V         01 1 11110 0 size:1 10000 11100 10 rn:5 rd:5
+FCVTMSvs  A64_V         01 0 11110 0 size:1 10000 11011 10 rn:5 rd:5
+FCVTMUvs  A64_V         01 1 11110 0 size:1 10000 11011 10 rn:5 rd:5
+FCVTNSvs  A64_V         01 0 11110 0 size:1 10000 11010 10 rn:5 rd:5
+FCVTNUvs  A64_V         01 1 11110 0 size:1 10000 11010 10 rn:5 rd:5
+FCVTPSvs  A64_V         01 0 11110 1 size:1 10000 11010 10 rn:5 rd:5
+FCVTPUvs  A64_V         01 1 11110 1 size:1 10000 11010 10 rn:5 rd:5
+FCVTXN_FCVTXN2s  A64_V  01 1 11110 0 size:1 10000 10110 10 rn:5 rd:5
+FCVTZSvis  A64_V        01 0 11110 1 size:1 10000 11011 10 rn:5 rd:5
+FCVTZUvis  A64_V        01 1 11110 1 size:1 10000 11011 10 rn:5 rd:5
+FRECPEs  A64_V          01 0 11110 1 size:1 10000 11101 10 rn:5 rd:5
+FRECPX  A64_V           01 0 11110 1 size:1 10000 11111 10 rn:5 rd:5
+FRSQRTEs  A64_V         01 1 11110 1 size:1 10000 11101 10 rn:5 rd:5
+NEGvs  A64_V            01 1 11110   size:2 10000 01011 10 rn:5 rd:5
+SCVTFvis  A64_V         01 0 11110 0 size:1 10000 11101 10 rn:5 rd:5
+SQABSs  A64_V           01 0 11110   size:2 10000 00111 10 rn:5 rd:5
+SQNEGs  A64_V           01 1 11110   size:2 10000 00111 10 rn:5 rd:5
+SQXTN_SQXTN2s  A64_V    01 0 11110   size:2 10000 10100 10 rn:5 rd:5
+SQXTUN_SQXTUN2s  A64_V  01 1 11110   size:2 10000 10010 10 rn:5 rd:5
+SUQADDs  A64_V          01 0 11110   size:2 10000 00011 10 rn:5 rd:5
+UCVTFvis  A64_V         01 1 11110 0 size:1 10000 11101 10 rn:5 rd:5
+UQXTN_UQXTN2s  A64_V    01 1 11110   size:2 10000 10100 10 rn:5 rd:5
+USQADDs  A64_V          01 1 11110   size:2 10000 00011 10 rn:5 rd:5
+
+@
 # C3.6.13 AdvSIMD scalar x indexed element
 # Complete coverage.
 
-- 
2.13.0
