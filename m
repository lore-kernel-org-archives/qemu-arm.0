Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g26sm1978426wra.14.2017.10.13.09.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:31:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 8B69A3E138C;
	Fri, 13 Oct 2017 17:24:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 29/30] tests/test-softfloat: add f16_to_int16 conversion test
Date: Fri, 13 Oct 2017 17:24:37 +0100
Message-Id: <20171013162438.32458-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BCJnhgax5OZX

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/test-softfloat.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/test-softfloat.c b/tests/test-softfloat.c
index d7b740e1cb..e1f356572d 100644
--- a/tests/test-softfloat.c
+++ b/tests/test-softfloat.c
@@ -16,6 +16,31 @@ typedef struct {
     uint8_t final_exception_flags;
 } f16_test_data;
 
+static void test_f16_convert_to_int(void)
+{
+    int i;
+    float16 out;
+    float_status flags, *fp = &flags;
+    f16_test_data test_data[] = {
+        /* from risu fcvtps  v23.4h, v16.4h */
+        { { .float_rounding_mode = float_round_up}, 0xa619, 0xb860, 0 },
+        { { .float_rounding_mode = float_round_up}, 0x83c0, 0xff91, 0 },
+        { { .float_rounding_mode = float_round_up}, 0x6966, 0x0001, 0 },
+        { { .float_rounding_mode = float_round_up}, 0x06b1, 0x0001, 0 },
+    };
+
+    for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
+        flags = test_data[i].initial_status;
+        out = float16_to_int16(test_data[i].in, fp);
+
+        if (!(test_data[i].out == out)) {
+            fprintf(stderr, "%s[%d]: expected %#04x got %#04x\n",
+                    __func__, i, test_data[i].out, out);
+            g_test_fail();
+        }
+    }
+}
+
 static void test_f16_round_to_int(void)
 {
     int i;
@@ -54,5 +79,6 @@ int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
     g_test_add_func("/softfloat/f16/round_to_int", test_f16_round_to_int);
+    g_test_add_func("/softfloat/f16/convert_to_int", test_f16_convert_to_int);
     return g_test_run();
 }
-- 
2.14.1
