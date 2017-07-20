Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r30sm3361234wrc.95.2017.07.20.08.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:32 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DBA4F3E0BB3;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH for 2.11 20/23] fpu/softfloat2a: add half-precision expansions for MINMAX fns
Date: Thu, 20 Jul 2017 16:04:23 +0100
Message-Id: <20170720150426.12393-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r/RpJjNLXbBY

As SoftFloat3c doesn't have helpers for min/max and we already
implemented it in 2a lets just expand the current helpers to include
half-precision functions. The includes having f16 version of the
compare functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat2a/softfloat.c         |  2 ++
 include/fpu/softfloat2a/softfloat.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/fpu/softfloat2a/softfloat.c b/fpu/softfloat2a/softfloat.c
index 4f1abbe08f..67115298bd 100644
--- a/fpu/softfloat2a/softfloat.c
+++ b/fpu/softfloat2a/softfloat.c
@@ -7579,6 +7579,7 @@ int float ## s ## _compare_quiet(float ## s a, float ## s b,                 \
     return float ## s ## _compare_internal(a, b, 1, status);                 \
 }
 
+COMPARE(16, 0x1f)
 COMPARE(32, 0xff)
 COMPARE(64, 0x7ff)
 
@@ -7779,6 +7780,7 @@ float ## s float ## s ## _maxnummag(float ## s a, float ## s b,         \
     return float ## s ## _minmax(a, b, 0, 1, 1, status);                \
 }
 
+MINMAX(16)
 MINMAX(32)
 MINMAX(64)
 
diff --git a/include/fpu/softfloat2a/softfloat.h b/include/fpu/softfloat2a/softfloat.h
index 3cb41977d8..dd1293d802 100644
--- a/include/fpu/softfloat2a/softfloat.h
+++ b/include/fpu/softfloat2a/softfloat.h
@@ -386,6 +386,17 @@ static inline float16 float16_abs(float16 a)
      */
     return make_float16(float16_val(a) & 0x7fff);
 }
+
+/* Expanded by the MINMAX macro in softfloat.c */
+int float16_compare(float16, float16, float_status *status);
+int float16_compare_quiet(float16, float16, float_status *status);
+float16 float16_min(float16, float16, float_status *status);
+float16 float16_max(float16, float16, float_status *status);
+float16 float16_minnum(float16, float16, float_status *status);
+float16 float16_maxnum(float16, float16, float_status *status);
+float16 float16_minnummag(float16, float16, float_status *status);
+float16 float16_maxnummag(float16, float16, float_status *status);
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated half-precision NaN.
 *----------------------------------------------------------------------------*/
-- 
2.13.0
