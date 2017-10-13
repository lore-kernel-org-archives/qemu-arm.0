Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a34sm3466724wra.64.2017.10.13.09.24.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:48 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 131903E0899;
	Fri, 13 Oct 2017 17:24:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 09/30] softfloat: propagate signalling NaNs in MINMAX
Date: Fri, 13 Oct 2017 17:24:17 +0100
Message-Id: <20171013162438.32458-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eB+6yvsWzafV

While a comparison between a QNaN and a number will return the number
it is not the same with a signaling NaN. In this case the SNaN will
"win" and after potentially raising an exception it will be quietened.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 013b223947..6ab4b39c09 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
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
2.14.1
