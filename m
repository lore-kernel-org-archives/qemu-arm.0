Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l23sm3956278wrb.30.2017.08.17.11.04.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 11:04:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C4CDA3E128A;
	Thu, 17 Aug 2017 19:04:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: rth@twiddle.net,
	cota@braap.org,
	batuzovk@ispras.ru
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [RFC PATCH 4/9] helper-head: add support for vec type
Date: Thu, 17 Aug 2017 19:03:59 +0100
Message-Id: <20170817180404.29334-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170817180404.29334-1-alex.bennee@linaro.org>
References: <20170817180404.29334-1-alex.bennee@linaro.org>
X-TUID: d8kLwc0C0HrW

---
 include/exec/helper-head.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 1cfc43b9ff..3fb4c3fc39 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -23,6 +23,7 @@
 #define GET_TCGV_i32 GET_TCGV_I32
 #define GET_TCGV_i64 GET_TCGV_I64
 #define GET_TCGV_ptr GET_TCGV_PTR
+#define GET_TCGV_vec GET_TCGV_VEC
 
 /* Some types that make sense in C, but not for TCG.  */
 #define dh_alias_i32 i32
@@ -33,6 +34,7 @@
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
 #define dh_alias_ptr ptr
+#define dh_alias_vec vec
 #define dh_alias_void void
 #define dh_alias_noreturn noreturn
 #define dh_alias(t) glue(dh_alias_, t)
@@ -45,6 +47,7 @@
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
 #define dh_ctype_ptr void *
+#define dh_ctype_vec void *
 #define dh_ctype_void void
 #define dh_ctype_noreturn void QEMU_NORETURN
 #define dh_ctype(t) dh_ctype_##t
@@ -90,6 +93,7 @@
 #define dh_is_64bit_i32 0
 #define dh_is_64bit_i64 1
 #define dh_is_64bit_ptr (sizeof(void *) == 8)
+#define dh_is_64bit_vec (sizeof(void *) == 8)
 #define dh_is_64bit(t) glue(dh_is_64bit_, dh_alias(t))
 
 #define dh_is_signed_void 0
@@ -106,6 +110,7 @@
    extension instructions that may be required, e.g. ia64's addp4.  But
    for now we don't support any 64-bit targets with 32-bit pointers.  */
 #define dh_is_signed_ptr 0
+#define dh_is_signed_vec dh_is_signed_ptr
 #define dh_is_signed_env dh_is_signed_ptr
 #define dh_is_signed(t) dh_is_signed_##t
 
-- 
2.13.0
