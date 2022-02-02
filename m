Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f13sm17900966wrp.105.2022.02.02.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D96591FFB8;
	Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  1/4] tests/tcg: cleanup sha1 source code
Date: Wed,  2 Feb 2022 19:12:39 +0000
Message-Id: <20220202191242.652607-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202191242.652607-1-alex.bennee@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4MLZi/GHTdSj

We have a lot of legacy mess in this imported code which makes
figuring out what is going on harder. Clean it up:

  - delete non-SHA1HANDSOFF legs, remove symbol
  - don't bother clearing variables at the end
  - remove #if 0 dead code
  - some light indentation fixes

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/sha1.c | 67 ++++++++++----------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
index 0081bd7657..3b1e18f3d4 100644
--- a/tests/tcg/multiarch/sha1.c
+++ b/tests/tcg/multiarch/sha1.c
@@ -17,9 +17,6 @@ A million repetitions of "a"
 */
 
 /* #define LITTLE_ENDIAN * This should be #define'd already, if true. */
-/* #define SHA1HANDSOFF * Copies data before messing with it. */
-
-#define SHA1HANDSOFF
 
 #include <stdio.h>
 #include <string.h>
@@ -69,24 +66,17 @@ void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
 
 /* Hash a single 512-bit block. This is the core of the algorithm. */
 
-void SHA1Transform(uint32_t state[5], const unsigned char buffer[64])
+inline void SHA1Transform(uint32_t state[5], const unsigned char buffer[64])
 {
-uint32_t a, b, c, d, e;
-typedef union {
-    unsigned char c[64];
-    uint32_t l[16];
-} CHAR64LONG16;
-#ifdef SHA1HANDSOFF
-CHAR64LONG16 block[1];  /* use array to appear as a pointer */
-    memcpy(block, buffer, 64);
-#else
-    /* The following had better never be used because it causes the
-     * pointer-to-const buffer to be cast into a pointer to non-const.
-     * And the result is written through.  I threw a "const" in, hoping
-     * this will cause a diagnostic.
-     */
-CHAR64LONG16* block = (const CHAR64LONG16*)buffer;
-#endif
+    uint32_t a, b, c, d, e;
+    typedef union {
+        unsigned char c[64];
+        uint32_t l[16];
+    } CHAR64LONG16;
+
+    CHAR64LONG16 block[1];  /* use array to appear as a pointer */
+    memcpy(&block[0], buffer, sizeof(block));
+
     /* Copy context->state[] to working vars */
     a = state[0];
     b = state[1];
@@ -120,14 +110,8 @@ CHAR64LONG16* block = (const CHAR64LONG16*)buffer;
     state[2] += c;
     state[3] += d;
     state[4] += e;
-    /* Wipe variables */
-    a = b = c = d = e = 0;
-#ifdef SHA1HANDSOFF
-    memset(block, '\0', sizeof(block));
-#endif
 }
 
-
 /* SHA1Init - Initialize new context */
 
 void SHA1Init(SHA1_CTX* context)
@@ -146,8 +130,8 @@ void SHA1Init(SHA1_CTX* context)
 
 void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t len)
 {
-uint32_t i;
-uint32_t j;
+    uint32_t i;
+    uint32_t j;
 
     j = context->count[0];
     if ((context->count[0] += len << 3) < j)
@@ -171,32 +155,15 @@ uint32_t j;
 
 void SHA1Final(unsigned char digest[20], SHA1_CTX* context)
 {
-unsigned i;
-unsigned char finalcount[8];
-unsigned char c;
-
-#if 0	/* untested "improvement" by DHR */
-    /* Convert context->count to a sequence of bytes
-     * in finalcount.  Second element first, but
-     * big-endian order within element.
-     * But we do it all backwards.
-     */
-    unsigned char *fcp = &finalcount[8];
-
-    for (i = 0; i < 2; i++)
-    {
-        uint32_t t = context->count[i];
-        int j;
-
-        for (j = 0; j < 4; t >>= 8, j++)
-            *--fcp = (unsigned char) t;
-    }
-#else
+    unsigned i;
+    unsigned char finalcount[8];
+    unsigned char c;
+
     for (i = 0; i < 8; i++) {
         finalcount[i] = (unsigned char)((context->count[(i >= 4 ? 0 : 1)]
          >> ((3-(i & 3)) * 8) ) & 255);  /* Endian independent */
     }
-#endif
+
     c = 0200;
     SHA1Update(context, &c, 1);
     while ((context->count[0] & 504) != 448) {
-- 
2.30.2
