Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365835ejs;
        Wed, 16 Aug 2023 06:43:45 -0700 (PDT)
X-Received: by 2002:a05:6808:209c:b0:3a7:a14:ba07 with SMTP id s28-20020a056808209c00b003a70a14ba07mr2303751oiw.7.1692193425162;
        Wed, 16 Aug 2023 06:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193425; cv=none;
        d=google.com; s=arc-20160816;
        b=QZnoIzo633hWQIz2HSBlN6uGtyClJ1tUHJn8+4D02i6bK2Os1eapCjFgviSBtv/AoR
         /29oCSL84Hi9cadu1yvN5Y8J8ERLPuU199j/0Aul9VG8ca2X83kSxCXgkTX1X8woiWD8
         fYKAiIdf2yrI1o5dn+E8WyeRdFTkhvvkdxFKXYTOgmAvse/ohwklRInnGuTNPFi6bC73
         mh4YPrJh4a05tIG7m/LJMYqYu32eLm3Spz/iIXyg8Vlt9p9+wIQKQSThPLoQEboaqdRL
         qCkZDO2J+jtu8t6GPew4BnjUrP/PB5pZqiDxDSAvClSjDELTPqDS1Fwkb5vNCyAe0072
         ILjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5zIcJuxbGAgDC3LnJtGglsWAa27I1AZ8jTEBgk7e2vQ=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=rRSI0dtpUoapBphI4CMHx13FCI4pVZfLtgm0PW9HpzfSI9LA1sHT4M9gnRfx9ZM1th
         BFs9BzrV3U0M8prs6DOWtfD+A1iztI2ETQ5jpUte2z7Fzm3L6N45FTb6evyYmqvoUGHK
         yM+d1lYaho/LTrnoZAzd8jJ8xe1g7JqCw1hP3lVINXR9EqisaanfmTeuy/D8sQkUeS1p
         EpPMNXBI9BW/F/Yg0wV4NWjF8EQDHlhh/kgK6c2RfNrIu7pB8683dRPv5E1XMJnYGAd8
         XiYxjK/6GUNeIKqPsLzfnO3aaaS3AT+n7f2Ki881+vf/Hnyg6U+klPoc+Jy+9IowVfMu
         AUzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Al1gNmgw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f25-20020a05680807d900b0039a96bed144sor7244659oij.5.2023.08.16.06.43.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:43:45 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Al1gNmgw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193424; x=1692798224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zIcJuxbGAgDC3LnJtGglsWAa27I1AZ8jTEBgk7e2vQ=;
        b=Al1gNmgwlxzQKBcFA2RoxAIxe9zPotGnWabz9Q6Z1lz1wbTDU6RarLfcFO4EoYfD6e
         0Zn3hU5tlnG3GzTbdpRh4UpDIgn6nKu+Kw9dKDQ4TKSA9+WU/BSy6MGA+dJETUIV9mb6
         Qe/p35SCAr6TSl6WypA7iv7hgpOeHRw4VdDMJ9yFyGV1ly5t/Z620lM6IZapYbeiU6WQ
         /9x8DcRYv/5dRcqrIFYSVueqsN3d1KnZ7Kbzre92hsmummoxcKRjA+nbx/HrM1onVguA
         w7jOCQtMUv/wHkOcmTG8SvVWKMpk3bFztYlUFtytWXB5lfbTmSgSS6k+7TsYxkQQR2mB
         y6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193424; x=1692798224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zIcJuxbGAgDC3LnJtGglsWAa27I1AZ8jTEBgk7e2vQ=;
        b=Nbvw3iUvMgr0cPaAQoCV8EWu/L/Qm/cMV7heCyc+0ZcTs781OLoYS6oLZBgMdQo3aJ
         MIoRrUGPHGZQKVu1H2WShG/uEawWdoC8T/vz35AUWIzOMZK9rMdaStduoV2ecIzwCs8J
         I0vB46fHavZwFZxX5Yjh7bosZujxmQodRHOwhiLl4FeCBp+hbI13rDL+5UK4lz40K9hO
         TEsFG8DES0rOhY7880C25kpk5icmRfIzc3HsoCF6Y0lM+fOCDAgrSpWX1z6rA7IxtH/Z
         lbD+KRzviuNhZTieIXbnYjDE9qNTKJ58OdHqQXf02GjiuLn9J+Cu032DFu1FfOva3LfB
         vtpg==
X-Gm-Message-State: AOJu0Yy6sfgMjkOTEST3cTiu2Zxu3eQSv4QvgvlnguEhbYgOMRBQRPwX
	ZH1BFDOwfh2nBrLdw3ynb56zvw==
X-Google-Smtp-Source: AGHT+IGP0tz4+26OjG0kAfvXU7oBgSEOeX+dQ6AccUX+7KHWvKdK/x4xzshTFe3WiAEsuLLRsw6CUQ==
X-Received: by 2002:a05:6808:1783:b0:3a7:550c:635d with SMTP id bg3-20020a056808178300b003a7550c635dmr2312547oib.56.1692193424662;
        Wed, 16 Aug 2023 06:43:44 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:43:44 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 23/25] contrib/plugins: Allow to log registers
Date: Wed, 16 Aug 2023 22:39:33 +0900
Message-ID: <20230816133938.18310-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0o5YLSubqonw

This demonstrates how a register can be read from a plugin.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  10 ++-
 contrib/plugins/execlog.c  | 140 +++++++++++++++++++++++++++++--------
 2 files changed, 118 insertions(+), 32 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 81dcd43a61..c9f8b27590 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -497,6 +497,15 @@ arguments if required::
   $ qemu-system-arm $(QEMU_ARGS) \
     -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
 
+This plugin can also dump a specified register. The specification of register
+follows `GDB standard target features <https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html>`__.
+
+Specify the name of the feature that contains the register and the name of the
+register with ``rfile`` and ``reg`` options, respectively::
+
+  $ qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so,rfile=org.gnu.gdb.arm.core,reg=sp -d plugin
+
 - contrib/plugins/cache.c
 
 Cache modelling plugin that measures the performance of a given L1 cache
@@ -583,4 +592,3 @@ The following API is generated from the inline documentation in
 include the full kernel-doc annotations.
 
 .. kernel-doc:: include/qemu/qemu-plugin.h
-
diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index ce67acf145..21b92ab1b3 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -15,27 +15,43 @@
 
 #include <qemu-plugin.h>
 
+typedef struct CPU {
+    /* Store last executed instruction on each vCPU as a GString */
+    GString *last_exec;
+    GByteArray *reg_history[2];
+
+    int reg;
+} CPU;
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
-/* Store last executed instruction on each vCPU as a GString */
-static GPtrArray *last_exec;
+static CPU *cpus;
+static int num_cpus;
 static GRWLock expand_array_lock;
 
 static GPtrArray *imatches;
 static GArray *amatches;
 
+static char *rfile_name;
+static char *reg_name;
+
 /*
- * Expand last_exec array.
+ * Expand cpu array.
  *
  * As we could have multiple threads trying to do this we need to
  * serialise the expansion under a lock.
  */
-static void expand_last_exec(int cpu_index)
+static void expand_cpu(int cpu_index)
 {
-    g_rw_lock_writer_unlock(&expand_array_lock);
-    while (cpu_index >= last_exec->len) {
-        GString *s = g_string_new(NULL);
-        g_ptr_array_add(last_exec, s);
+    g_rw_lock_writer_lock(&expand_array_lock);
+    if (cpu_index >= num_cpus) {
+        cpus = g_realloc_n(cpus, cpu_index + 1, sizeof(*cpus));
+        while (cpu_index >= num_cpus) {
+            cpus[num_cpus].last_exec = g_string_new(NULL);
+            cpus[num_cpus].reg_history[0] = g_byte_array_new();
+            cpus[num_cpus].reg_history[1] = g_byte_array_new();
+            num_cpus++;
+        }
     }
     g_rw_lock_writer_unlock(&expand_array_lock);
 }
@@ -50,8 +66,8 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
 
     /* Find vCPU in array */
     g_rw_lock_reader_lock(&expand_array_lock);
-    g_assert(cpu_index < last_exec->len);
-    s = g_ptr_array_index(last_exec, cpu_index);
+    g_assert(cpu_index < num_cpus);
+    s = cpus[cpu_index].last_exec;
     g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Indicate type of memory access */
@@ -77,28 +93,44 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
  */
 static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 {
-    GString *s;
+    CPU cpu;
+    int n;
+    int i;
 
     /* Find or create vCPU in array */
     g_rw_lock_reader_lock(&expand_array_lock);
-    if (cpu_index >= last_exec->len) {
-        g_rw_lock_reader_unlock(&expand_array_lock);
-        expand_last_exec(cpu_index);
-        g_rw_lock_reader_lock(&expand_array_lock);
-    }
-    s = g_ptr_array_index(last_exec, cpu_index);
+    cpu = cpus[cpu_index];
     g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Print previous instruction in cache */
-    if (s->len) {
-        qemu_plugin_outs(s->str);
+    if (cpu.last_exec->len) {
+        qemu_plugin_outs(cpu.last_exec->str);
         qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
     /* vcpu_mem will add memory access information to last_exec */
-    g_string_printf(s, "%u, ", cpu_index);
-    g_string_append(s, (char *)udata);
+    g_string_printf(cpu.last_exec, "%u, ", cpu_index);
+    g_string_append(cpu.last_exec, (char *)udata);
+
+    if (cpu.reg >= 0) {
+        GByteArray *current = cpu.reg_history[0];
+        GByteArray *last = cpu.reg_history[1];
+
+        g_byte_array_set_size(current, 0);
+        n = qemu_plugin_read_register(current, cpu.reg);
+
+        if (n != last->len || memcmp(current->data, last->data, n)) {
+            g_string_append(cpu.last_exec, ", reg,");
+            for (i = 0; i < n; i++) {
+                g_string_append_printf(cpu.last_exec, " %02X",
+                                       current->data[i]);
+            }
+        }
+
+        cpu.reg_history[0] = last;
+        cpu.reg_history[1] = current;
+    }
 }
 
 /**
@@ -167,8 +199,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
                                              QEMU_PLUGIN_MEM_RW, NULL);
 
             /* Register callback on instruction */
-            qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
-                                                   QEMU_PLUGIN_CB_NO_REGS, output);
+            qemu_plugin_register_vcpu_insn_exec_cb(
+                insn, vcpu_insn_exec,
+                rfile_name ? QEMU_PLUGIN_CB_R_REGS : QEMU_PLUGIN_CB_NO_REGS,
+                output);
 
             /* reset skip */
             skip = (imatches || amatches);
@@ -177,17 +211,53 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     }
 }
 
+static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
+{
+    int reg = 0;
+    bool found = false;
+
+    expand_cpu(vcpu_index);
+
+    if (rfile_name) {
+        int i;
+        int j;
+        int n;
+
+        qemu_plugin_register_file_t *rfiles =
+            qemu_plugin_get_register_files(vcpu_index, &n);
+
+        for (i = 0; i < n; i++) {
+            if (g_strcmp0(rfiles[i].name, rfile_name) == 0) {
+                for (j = 0; j < rfiles[i].num_regs; j++) {
+                    if (g_strcmp0(rfiles[i].regs[j], reg_name) == 0) {
+                        reg += j;
+                        found = true;
+                        break;
+                    }
+                }
+                break;
+            }
+
+            reg += rfiles[i].num_regs;
+        }
+
+        g_free(rfiles);
+    }
+
+    g_rw_lock_writer_lock(&expand_array_lock);
+    cpus[vcpu_index].reg = found ? reg : -1;
+    g_rw_lock_writer_unlock(&expand_array_lock);
+}
+
 /**
  * On plugin exit, print last instruction in cache
  */
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     guint i;
-    GString *s;
-    for (i = 0; i < last_exec->len; i++) {
-        s = g_ptr_array_index(last_exec, i);
-        if (s->str) {
-            qemu_plugin_outs(s->str);
+    for (i = 0; i < num_cpus; i++) {
+        if (cpus[i].last_exec->str) {
+            qemu_plugin_outs(cpus[i].last_exec->str);
             qemu_plugin_outs("\n");
         }
     }
@@ -224,9 +294,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      * we don't know the size before emulation.
      */
     if (info->system_emulation) {
-        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
-    } else {
-        last_exec = g_ptr_array_new();
+        cpus = g_new(CPU, info->system.max_vcpus);
     }
 
     for (int i = 0; i < argc; i++) {
@@ -236,13 +304,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
             parse_insn_match(tokens[1]);
         } else if (g_strcmp0(tokens[0], "afilter") == 0) {
             parse_vaddr_match(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "rfile") == 0) {
+            rfile_name = g_strdup(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "reg") == 0) {
+            reg_name = g_strdup(tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    if ((!rfile_name) != (!reg_name)) {
+        fputs("file and reg need to be set at the same time\n", stderr);
+        return -1;
+    }
+
     /* Register translation block and exit callbacks */
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
 
-- 
2.41.0
