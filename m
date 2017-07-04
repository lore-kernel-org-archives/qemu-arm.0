Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 13sm16204040wrl.57.2017.07.04.07.53.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:53:46 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 40F023E2201;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 11/11] aarch64.risu: update AdvancedSIMD across lanes
Date: Tue,  4 Jul 2017 15:48:59 +0100
Message-Id: <20170704144859.17644-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +sDF7pYaloC7

 - sorted alphabetically
 - aligned the instructions patterns
 - adding half-precision F[MAX|MIN][NMV|V]
 - add @AdvSIMDAcrossVector group

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 90 +++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/aarch64.risu b/aarch64.risu
index 5450cd3..215882e 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -1955,50 +1955,58 @@ ZIP2 A64_V 0 Q:1 001110 size:2 0 rm:5 0 111 10 rn:5 rd:5 \
 # ReservedValue: break the !($size == 3 && $Q == 0) constraint
 ZIP2_RES A64_V 0 0 001110 11 0 rm:5 0 111 10 rn:5 rd:5
 
-# C3.6.4 AdvSIMD across lanes
+# C4-286 AdvSIMD across vector lanes
 # 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16  12 11 10 9  5 4  0
 #  0  Q  U  0  1  1  1  0  size  1  1  0  0  0 opcode  1  0  Rn   Rd
+@AdvSIMDAcrossVector
+
+ADDV         A64_V 0 Q:1 0 01110 s:2 11000 11011 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+ADDV_RES     A64_V 0  0  0 01110  10 11000 11011 10 rn:5 rd:5
+
+FMAXNMV      A64_V 0  1  1 01110  00 11000 01100 10 rn:5 rd:5
+FMAXV        A64_V 0  1  1 01110  00 11000 01111 10 rn:5 rd:5
+FMINNMV      A64_V 0  1  1 01110  10 11000 01100 10 rn:5 rd:5
+FMINV        A64_V 0  1  1 01110  10 11000 01111 10 rn:5 rd:5
+
+# ARMv8.2 Half-precision variants
+FMAXNMV_FP16 A64_V 0 q:1 0 01110  00 11000 01100 10 rn:5 rd:5
+FMAXV_FP16   A64_V 0 q:1 0 01110  00 11000 01111 10 rn:5 rd:5
+FMINNMV_FP16 A64_V 0 q:1 0 01110  10 11000 01100 10 rn:5 rd:5
+FMINV_FP16   A64_V 0 q:1 0 01110  10 11000 01111 10 rn:5 rd:5
+
+SADDLV       A64_V 0 Q:1 0 01110 s:2 11000 00011 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+SADDLV_RES   A64_V 0   0 0 01110  10 11000 00011 10 rn:5 rd:5
+
+SMAXV        A64_V 0 Q:1 0 01110 s:2 11000 01010 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+SMAXV_RES    A64_V 0   0 0 01110  10 11000 01010 10 rn:5 rd:5
+
+SMINV        A64_V 0 Q:1 0 01110 s:2 11000 11010 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+SMINV_RES    A64_V 0   0 0 01110  10 11000 11010 10 rn:5 rd:5
+
+UADDLV       A64_V 0 Q:1 1 01110 s:2 11000 00011 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+UADDLV_RES   A64_V 0   0 1 01110  10 11000 00011 10 rn:5 rd:5
+
+UMAXV        A64_V 0 Q:1 1 01110 s:2 11000 01010 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+UMAXV_RES    A64_V 0   0 1 01110  10 11000 01010 10 rn:5 rd:5
+
+UMINV        A64_V 0 Q:1 1 01110 s:2 11000 11010 10 rn:5 rd:5 \
+!constraints { $s < 2 || ($s == 2 && $Q == 1); }
+# ReservedValue: break the constraint (s==2) => (Q=1)
+UMINV_RES    A64_V 0   0 1 01110  10 11000 11010 10 rn:5 rd:5
 
-SADDLV A64_V 0 Q:1 0 01110 size:2 11000 00011 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-SADDLV_RES A64_V 0 0 0 01110 10 11000 00011 10 rn:5 rd:5
-
-SMAXV A64_V 0 Q:1 0 01110 size:2 11000 01010 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-SMAXV_RES A64_V 0 0 0 01110 10 11000 01010 10 rn:5 rd:5
-
-SMINV A64_V 0 Q:1 0 01110 size:2 11000 11010 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-SMINV_RES A64_V 0 0 0 01110 10 11000 11010 10 rn:5 rd:5
-
-ADDV A64_V 0 Q:1 0 01110 size:2 11000 11011 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-ADDV_RES A64_V 0 0 0 01110 10 11000 11011 10 rn:5 rd:5
-
-UADDLV A64_V 0 Q:1 1 01110 size:2 11000 00011 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-UADDLV_RES A64_V 0 0 1 01110 10 11000 00011 10 rn:5 rd:5
-
-UMAXV A64_V 0 Q:1 1 01110 size:2 11000 01010 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-UMAXV_RES A64_V 0 0 1 01110 10 11000 01010 10 rn:5 rd:5
-
-UMINV A64_V 0 Q:1 1 01110 size:2 11000 11010 10 rn:5 rd:5 \
-!constraints { $size < 2 || ($size == 2 && $Q == 1); }
-# ReservedValue: break the constraint (size==2) => (Q=1)
-UMINV_RES A64_V 0 0 1 01110 10 11000 11010 10 rn:5 rd:5
-
-FMAXNMV A64_V 0 1 1 01110 00 11000 01100 10 rn:5 rd:5
-FMAXV A64_V 0 1 1 01110 00 11000 01111 10 rn:5 rd:5
-
-FMINNMV A64_V 0 1 1 01110 10 11000 01100 10 rn:5 rd:5
-FMINV A64_V 0 1 1 01110 10 11000 01111 10 rn:5 rd:5
+@
 
 # C3.6.5 AdvSIMD copy
 # 31 30 29 28 27 26 25 24 23 22 21 20    16 15 14    11 10 9  5 4  0
-- 
2.13.0
