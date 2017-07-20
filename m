Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c55sm7472686wrc.7.2017.07.20.08.12.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:38 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 95BA53E0AF9;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [RFC PATCH for 2.11 16/23] include/exec/helper-head.h: support f16 in helper calls
Date: Thu, 20 Jul 2017 16:04:19 +0100
Message-Id: <20170720150426.12393-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J43UR5VqwN4h

This allows us to explicitly pass float16 to helpers rather than
assuming uint32_t and dealing with the result. Of course they will be
passed in i32 sized registers by default.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/helper-head.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 1cfc43b9ff..fdb82151d3 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -30,6 +30,7 @@
 #define dh_alias_int i32
 #define dh_alias_i64 i64
 #define dh_alias_s64 i64
+#define dh_alias_f16 i32
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
 #define dh_alias_ptr ptr
@@ -42,6 +43,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
+#define dh_ctype_f16 float16
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
 #define dh_ctype_ptr void *
@@ -98,6 +100,7 @@
 #define dh_is_signed_s32 1
 #define dh_is_signed_i64 0
 #define dh_is_signed_s64 1
+#define dh_is_signed_f16 0
 #define dh_is_signed_f32 0
 #define dh_is_signed_f64 0
 #define dh_is_signed_tl  0
-- 
2.13.0
