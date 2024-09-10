Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4339984a12.3.2024.09.10.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:13:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8E34C6343F;
	Tue, 10 Sep 2024 15:07:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 19/26] tests/tcg: clean up output of memory system test
Date: Tue, 10 Sep 2024 15:07:26 +0100
Message-Id: <20240910140733.4007719-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1KcjiJkBtSRb

This is useful information when debugging memory issues so lets
improve by:

  - include the ptr address for u8 fills (like the others)
  - indicate the number of operations for reads and writes
  - explicitly note when we are flushing
  - move the fill printf to after the reset

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/system/memory.c | 47 ++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 6eb2eb16f7..8f2371975d 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -63,12 +63,14 @@ static void init_test_data_u8(int unused_offset)
     int i;
     (void)(unused_offset);
 
-    ml_printf("Filling test area with u8:");
+    ml_printf("Filling test area with u8 (%p):", ptr);
+
     for (i = 0; i < TEST_SIZE; i++) {
         *ptr++ = BYTE_NEXT(count);
         pdot(i);
     }
-    ml_printf("done\n");
+
+    ml_printf("done %d @ %p\n", i, ptr);
 }
 
 /*
@@ -94,7 +96,7 @@ static void init_test_data_s8(bool neg_first)
         *ptr++ = get_byte(i, !neg_first);
         pdot(i);
     }
-    ml_printf("done\n");
+    ml_printf("done %d @ %p\n", i * 2, ptr);
 }
 
 /*
@@ -105,9 +107,18 @@ static void reset_start_data(int offset)
 {
     uint32_t *ptr = (uint32_t *) &test_data[0];
     int i;
+
+    if (!offset) {
+        return;
+    }
+
+    ml_printf("Flushing %d bytes from %p: ", offset, ptr);
+
     for (i = 0; i < offset; i++) {
         *ptr++ = 0;
     }
+
+    ml_printf("done %d @ %p\n", i, ptr);
 }
 
 static void init_test_data_u16(int offset)
@@ -117,17 +128,17 @@ static void init_test_data_u16(int offset)
     const int max = (TEST_SIZE - offset) / sizeof(word);
     int i;
 
-    ml_printf("Filling test area with u16 (offset %d, %p):", offset, ptr);
-
     reset_start_data(offset);
 
+    ml_printf("Filling test area with u16 (offset %d, %p):", offset, ptr);
+
     for (i = 0; i < max; i++) {
         uint16_t low = BYTE_NEXT(count), high = BYTE_NEXT(count);
         word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
         *ptr++ = word;
         pdot(i);
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
 }
 
 static void init_test_data_u32(int offset)
@@ -137,10 +148,10 @@ static void init_test_data_u32(int offset)
     const int max = (TEST_SIZE - offset) / sizeof(word);
     int i;
 
-    ml_printf("Filling test area with u32 (offset %d, %p):", offset, ptr);
-
     reset_start_data(offset);
 
+    ml_printf("Filling test area with u32 (offset %d, %p):", offset, ptr);
+
     for (i = 0; i < max; i++) {
         uint32_t b4 = BYTE_NEXT(count), b3 = BYTE_NEXT(count);
         uint32_t b2 = BYTE_NEXT(count), b1 = BYTE_NEXT(count);
@@ -149,7 +160,7 @@ static void init_test_data_u32(int offset)
         *ptr++ = word;
         pdot(i);
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
 }
 
 static void init_test_data_u64(int offset)
@@ -159,10 +170,10 @@ static void init_test_data_u64(int offset)
     const int max = (TEST_SIZE - offset) / sizeof(word);
     int i;
 
-    ml_printf("Filling test area with u64 (offset %d, %p):", offset, ptr);
-
     reset_start_data(offset);
 
+    ml_printf("Filling test area with u64 (offset %d, %p):", offset, ptr);
+
     for (i = 0; i < max; i++) {
         uint64_t b8 = BYTE_NEXT(count), b7 = BYTE_NEXT(count);
         uint64_t b6 = BYTE_NEXT(count), b5 = BYTE_NEXT(count);
@@ -174,7 +185,7 @@ static void init_test_data_u64(int offset)
         *ptr++ = word;
         pdot(i);
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
 }
 
 static bool read_test_data_u16(int offset)
@@ -198,7 +209,7 @@ static bool read_test_data_u16(int offset)
         }
 
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
 
@@ -239,7 +250,7 @@ static bool read_test_data_u32(int offset)
             pdot(i);
         }
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
 
@@ -293,7 +304,7 @@ static bool read_test_data_u64(int offset)
             pdot(i);
         }
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
 
@@ -365,7 +376,7 @@ static bool read_test_data_s8(int offset, bool neg_first)
             return false;
         }
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i * 2, ptr);
     return true;
 }
 
@@ -398,7 +409,7 @@ static bool read_test_data_s16(int offset, bool neg_first)
             return false;
         }
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
 
@@ -431,7 +442,7 @@ static bool read_test_data_s32(int offset, bool neg_first)
             return false;
         }
     }
-    ml_printf("done @ %p\n", ptr);
+    ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
 
-- 
2.39.2
