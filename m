Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b4sm3226424wrf.70.2017.07.20.08.12.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:38 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id EC9AE3E0BB7;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH for 2.11 21/23] fpu/softfloat2a: propagate signalling NaNs in MINMAX
Date: Thu, 20 Jul 2017 16:04:24 +0100
Message-Id: <20170720150426.12393-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bHU9m1PV6w7g

While a comparison between a QNaN and a number will return the number
it is not the same with a signaling NaN. In this case the SNaN will
"win" and after potentially raising an exception it will be quietened.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat2a/softfloat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat2a/softfloat.c b/fpu/softfloat2a/softfloat.c
index 67115298bd..5e918cc208 100644
--- a/fpu/softfloat2a/softfloat.c
+++ b/fpu/softfloat2a/softfloat.c
@@ -7684,6 +7684,7 @@ int float128_compare_quiet(float128 a, float128 b, float_status *status)
  * minnum() and maxnum() functions. These are similar to the min()
  * and max() functions but if one of the arguments is a QNaN and
  * the other is numerical then the numerical argument is returned.
+ * SNaNs will get quietened before being returned.
  * minnum() and maxnum correspond to the IEEE 754-2008 minNum()
  * and maxNum() operations. min() and max() are the typical min/max
  * semantics provided by many CPUs which predate that specification.
@@ -7704,11 +7705,14 @@ static inline float ## s float ## s ## _minmax(float ## s a, float ## s b,     \
     if (float ## s ## _is_any_nan(a) ||                                 \
         float ## s ## _is_any_nan(b)) {                                 \
         if (isieee) {                                                   \
-            if (float ## s ## _is_quiet_nan(a, status) &&               \
+            if (float ## s ## _is_signaling_nan(a, status) ||           \
+                float ## s ## _is_signaling_nan(b, status)) {           \
+                propagateFloat ## s ## NaN(a, b, status);               \
+            } else  if (float ## s ## _is_quiet_nan(a, status) &&       \
                 !float ## s ##_is_any_nan(b)) {                         \
                 return b;                                               \
             } else if (float ## s ## _is_quiet_nan(b, status) &&        \
-                       !float ## s ## _is_any_nan(a)) {                \
+                       !float ## s ## _is_any_nan(a)) {                 \
                 return a;                                               \
             }                                                           \
         }                                                               \
-- 
2.13.0
