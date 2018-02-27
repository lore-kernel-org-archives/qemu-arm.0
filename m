Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p21sm8962891wmc.28.2018.02.27.06.38.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:38:54 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E755B3E025C;
	Tue, 27 Feb 2018 14:38:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [PATCH v4 01/31] include/exec/helper-head.h: support f16 in helper calls
Date: Tue, 27 Feb 2018 14:38:22 +0000
Message-Id: <20180227143852.11175-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F4rEGqQ7uuxF

This allows us to explicitly pass float16 to helpers rather than
assuming uint32_t and dealing with the result. Of course they will be
passed in i32 sized registers by default.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index e1fd08f2ba..15b6a68de3 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -26,6 +26,7 @@
 #define dh_alias_int i32
 #define dh_alias_i64 i64
 #define dh_alias_s64 i64
+#define dh_alias_f16 i32
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
 #define dh_alias_ptr ptr
@@ -38,6 +39,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
+#define dh_ctype_f16 float16
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
 #define dh_ctype_ptr void *
@@ -94,6 +96,7 @@
 #define dh_is_signed_s32 1
 #define dh_is_signed_i64 0
 #define dh_is_signed_s64 1
+#define dh_is_signed_f16 0
 #define dh_is_signed_f32 0
 #define dh_is_signed_f64 0
 #define dh_is_signed_tl  0
-- 
2.15.1
