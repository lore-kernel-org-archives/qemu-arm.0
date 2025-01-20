Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c60751sm662877366b.30.2025.01.20.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:02:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4EF8B5FA07;
	Mon, 20 Jan 2025 21:02:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org (open list:sPAPR (pseries)),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 5/7] tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
Date: Mon, 20 Jan 2025 21:02:10 +0000
Message-Id: <20250120210212.3890255-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120210212.3890255-1-alex.bennee@linaro.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xkErRCarituI

qtest_send_prefix never actually sent something over the chardev, all
it does is print the timestamp to the QTEST_LOG when enabled. So
rename the function, make it static, remove the unused CharDev and
simplify all the call sites by handling that directly with
qtest_send (and qtest_log_send).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/system/qtest.h |  1 -
 hw/ppc/spapr_rtas.c    |  1 -
 hw/riscv/riscv_hart.c  |  1 -
 system/qtest.c         | 26 +++-----------------------
 4 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/include/system/qtest.h b/include/system/qtest.h
index c161d75165..6ddddc501b 100644
--- a/include/system/qtest.h
+++ b/include/system/qtest.h
@@ -24,7 +24,6 @@ static inline bool qtest_enabled(void)
 }
 
 #ifndef CONFIG_USER_ONLY
-void qtest_send_prefix(CharBackend *chr);
 void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr, const char *fmt, ...);
 void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words));
 bool qtest_driver(void);
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index df2e837632..503d441b48 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -565,7 +565,6 @@ static bool spapr_qtest_callback(CharBackend *chr, gchar **words)
         g_assert(rc == 0);
         res = qtest_rtas_call(words[1], nargs, args, nret, ret);
 
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %"PRIu64"\n", res);
 
         return true;
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index ad67cd7645..a55d156668 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -94,7 +94,6 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
         g_assert(rc == 0);
         csr_call(words[1], cpu, csr, &val);
 
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0 "TARGET_FMT_lx"\n", (target_ulong)val);
 
         return true;
diff --git a/system/qtest.c b/system/qtest.c
index bb1efba9fd..28b6fac37c 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -265,7 +265,7 @@ static int hex2nib(char ch)
     }
 }
 
-void qtest_send_prefix(CharBackend *chr)
+static void qtest_log_timestamp(void)
 {
     if (!qtest_log_fp || !qtest_opened) {
         return;
@@ -282,7 +282,7 @@ static void G_GNUC_PRINTF(1, 2) qtest_log_send(const char *fmt, ...)
         return;
     }
 
-    qtest_send_prefix(NULL);
+    qtest_log_timestamp();
 
     va_start(ap, fmt);
     vfprintf(qtest_log_fp, fmt, ap);
@@ -301,6 +301,7 @@ static void qtest_server_char_be_send(void *opaque, const char *str)
 
 static void qtest_send(CharBackend *chr, const char *str)
 {
+    qtest_log_timestamp();
     qtest_server_send(qtest_server_send_opaque, str);
 }
 
@@ -324,7 +325,6 @@ static void qtest_irq_handler(void *opaque, int n, int level)
     if (irq_levels[n] != level) {
         CharBackend *chr = &qtest->qtest_chr;
         irq_levels[n] = level;
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "IRQ %s %d\n",
                     level ? "raise" : "lower", n);
     }
@@ -380,19 +380,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         is_outbound = words[0][14] == 'o';
         dev = DEVICE(object_resolve_path(words[1], NULL));
         if (!dev) {
-            qtest_send_prefix(chr);
             qtest_send(chr, "FAIL Unknown device\n");
             return;
         }
 
         if (is_named && !is_outbound) {
-            qtest_send_prefix(chr);
             qtest_send(chr, "FAIL Interception of named in-GPIOs not yet supported\n");
             return;
         }
 
         if (irq_intercept_dev) {
-            qtest_send_prefix(chr);
             if (irq_intercept_dev != dev) {
                 qtest_send(chr, "FAIL IRQ intercept already enabled\n");
             } else {
@@ -419,7 +416,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             }
         }
 
-        qtest_send_prefix(chr);
         if (interception_succeeded) {
             irq_intercept_dev = dev;
             qtest_send(chr, "OK\n");
@@ -438,7 +434,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         dev = DEVICE(object_resolve_path(words[1], NULL));
         if (!dev) {
-            qtest_send_prefix(chr);
             qtest_send(chr, "FAIL Unknown device\n");
             return;
         }
@@ -457,7 +452,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         irq = qdev_get_gpio_in_named(dev, name, num);
 
         qemu_set_irq(irq, level);
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "outb") == 0 ||
                strcmp(words[0], "outw") == 0 ||
@@ -480,7 +474,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else if (words[0][3] == 'l') {
             cpu_outl(addr, value);
         }
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "inb") == 0 ||
         strcmp(words[0], "inw") == 0 ||
@@ -501,7 +494,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else if (words[0][2] == 'l') {
             value = cpu_inl(addr);
         }
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0x%04x\n", value);
     } else if (strcmp(words[0], "writeb") == 0 ||
                strcmp(words[0], "writew") == 0 ||
@@ -537,7 +529,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
                                 &data, 8);
         }
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "readb") == 0 ||
                strcmp(words[0], "readw") == 0 ||
@@ -571,7 +562,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                                &value, 8);
             tswap64s(&value);
         }
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0x%016" PRIx64 "\n", value);
     } else if (strcmp(words[0], "read") == 0) {
         g_autoptr(GString) enc = NULL;
@@ -593,7 +583,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         enc = qemu_hexdump_line(NULL, data, len, 0, 0);
 
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0x%s\n", enc->str);
 
         g_free(data);
@@ -613,7 +602,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
                            len);
         b64_data = g_base64_encode(data, len);
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %s\n", b64_data);
 
         g_free(data);
@@ -649,7 +637,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                             len);
         g_free(data);
 
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "memset") == 0) {
         uint64_t addr, len;
@@ -673,7 +660,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             g_free(data);
         }
 
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     }  else if (strcmp(words[0], "b64write") == 0) {
         uint64_t addr, len;
@@ -705,10 +691,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
                             len);
 
-        qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "endianness") == 0) {
-        qtest_send_prefix(chr);
         if (target_words_bigendian()) {
             qtest_sendf(chr, "OK big\n");
         } else {
@@ -726,7 +710,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                                             QEMU_TIMER_ATTR_ALL);
         }
         new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "%s %"PRIi64"\n",
                     new_ns > old_ns ? "OK" : "FAIL", new_ns);
     } else if (strcmp(words[0], "module_load") == 0) {
@@ -734,7 +717,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         int rv;
         g_assert(words[1] && words[2]);
 
-        qtest_send_prefix(chr);
         rv = module_load(words[1], words[2], &local_err);
         if (rv > 0) {
             qtest_sendf(chr, "OK\n");
@@ -752,13 +734,11 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         ret = qemu_strtoi64(words[1], NULL, 0, &ns);
         g_assert(ret == 0);
         new_ns = qemu_clock_advance_virtual_time(ns);
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "%s %"PRIi64"\n",
                     new_ns == ns ? "OK" : "FAIL", new_ns);
     } else if (process_command_cb && process_command_cb(chr, words)) {
         /* Command got consumed by the callback handler */
     } else {
-        qtest_send_prefix(chr);
         qtest_sendf(chr, "FAIL Unknown command '%s'\n", words[0]);
     }
 }
-- 
2.39.5
