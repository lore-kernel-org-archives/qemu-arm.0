Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259c1fa3sm487925166b.80.2024.09.10.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:13:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A628E63460;
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
Subject: [PATCH 20/26] tests/tcg: only read/write 64 bit words on 64 bit systems
Date: Tue, 10 Sep 2024 15:07:27 +0100
Message-Id: <20240910140733.4007719-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UiHkpk/5gLYq

While the compilers will generally happily synthesise a 64 bit value
for you on 32 bit systems it doesn't exercise anything on QEMU. It
also makes it hard to accurately compare the accesses to test_data
when instrumenting.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/system/memory.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 8f2371975d..680dd4800b 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -163,6 +163,7 @@ static void init_test_data_u32(int offset)
     ml_printf("done %d @ %p\n", i, ptr);
 }
 
+#if __SIZEOF_POINTER__ == 8
 static void init_test_data_u64(int offset)
 {
     uint8_t count = 0;
@@ -187,6 +188,7 @@ static void init_test_data_u64(int offset)
     }
     ml_printf("done %d @ %p\n", i, ptr);
 }
+#endif
 
 static bool read_test_data_u16(int offset)
 {
@@ -254,6 +256,7 @@ static bool read_test_data_u32(int offset)
     return true;
 }
 
+#if __SIZEOF_POINTER__ == 8
 static bool read_test_data_u64(int offset)
 {
     uint64_t word, *ptr = (uint64_t *)&test_data[offset];
@@ -307,11 +310,16 @@ static bool read_test_data_u64(int offset)
     ml_printf("done %d @ %p\n", i, ptr);
     return true;
 }
+#endif
 
 /* Read the test data and verify at various offsets */
-read_ufn read_ufns[] = { read_test_data_u16,
-                         read_test_data_u32,
-                         read_test_data_u64 };
+read_ufn read_ufns[] = {
+    read_test_data_u16,
+    read_test_data_u32,
+#if __SIZEOF_POINTER__ == 8
+    read_test_data_u64
+#endif
+};
 
 bool do_unsigned_reads(int start_off)
 {
@@ -476,10 +484,14 @@ bool do_signed_reads(bool neg_first)
     return ok;
 }
 
-init_ufn init_ufns[] = { init_test_data_u8,
-                         init_test_data_u16,
-                         init_test_data_u32,
-                         init_test_data_u64 };
+init_ufn init_ufns[] = {
+    init_test_data_u8,
+    init_test_data_u16,
+    init_test_data_u32,
+#if __SIZEOF_POINTER__ == 8
+    init_test_data_u64
+#endif
+};
 
 int main(void)
 {
-- 
2.39.2
