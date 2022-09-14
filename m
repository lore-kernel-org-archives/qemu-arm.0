Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600002a100b00228d183f9c2sm15739754wry.89.2022.09.14.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 554C51FFBA;
	Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH  2/4] qtest: make read/write operation appear to be from CPU
Date: Wed, 14 Sep 2022 17:09:53 +0100
Message-Id: <20220914160955.812151-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TVCVuw3EGYsP

The point of qtest is to simulate how running code might interact with
the system. However because it's not a real system we have places in
the code which especially handle check qtest_enabled() before
referencing current_cpu. Now we can encode these details in the
MemTxAttrs lets do that so we can start removing them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 softmmu/qtest.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..c086bd34b7 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
     qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
 }
 
+/*
+ * QTest memory accesses are treated as though they come from the
+ * first (non-existent) CPU. We need to expose this via MemTxAttrs for
+ * those bits of HW which care which core is accessing them.
+ */
+#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })
+
 static void qtest_process_command(CharBackend *chr, gchar **words)
 {
     const gchar *command;
@@ -525,17 +532,17 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else if (words[0][5] == 'w') {
             uint16_t data = value;
             tswap16s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 2);
         } else if (words[0][5] == 'l') {
             uint32_t data = value;
             tswap32s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 4);
         } else if (words[0][5] == 'q') {
             uint64_t data = value;
             tswap64s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 8);
         }
         qtest_send_prefix(chr);
@@ -554,21 +561,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][4] == 'b') {
             uint8_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 1);
             value = data;
         } else if (words[0][4] == 'w') {
             uint16_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 2);
             value = tswap16(data);
         } else if (words[0][4] == 'l') {
             uint32_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 4);
             value = tswap32(data);
         } else if (words[0][4] == 'q') {
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &value, 8);
             tswap64s(&value);
         }
@@ -589,7 +596,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(len);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                            len);
 
         enc = g_malloc(2 * len + 1);
@@ -615,7 +622,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(ret == 0);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                            len);
         b64_data = g_base64_encode(data, len);
         qtest_send_prefix(chr);
@@ -650,7 +657,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                 data[i] = 0;
             }
         }
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                             len);
         g_free(data);
 
@@ -673,7 +680,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (len) {
             data = g_malloc(len);
             memset(data, pattern, len);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 data, len);
             g_free(data);
         }
@@ -707,7 +714,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             out_len = MIN(out_len, len);
         }
 
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                             len);
 
         qtest_send_prefix(chr);
-- 
2.34.1
