Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414730ejs;
        Wed, 16 Aug 2023 07:55:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:c83:b0:688:47d5:ede with SMTP id a3-20020a056a000c8300b0068847d50edemr2988832pfv.6.1692197756697;
        Wed, 16 Aug 2023 07:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197756; cv=none;
        d=google.com; s=arc-20160816;
        b=FX1FwFUcEmniHqXzbWQ5jcyfy5gfXRHMeE31hiv/9pTyyxvCD/6XDfTHzEjvOU3T1V
         52B93n4rkjThgJvqR6Q/UAeoeFedWAe9+RfLY0h7Y7vTBSVUVi8lSutXVfOD2NpwWPMG
         XcCSrFCA5q3Brl+v8gMc777+M24ETqGfOAlrt/wy1ivEVvbo8saCCz+ehcpv78OL/AIx
         jrdnv25Si+XBOwn2rTM+mm+gp3pwcHbf0bVbcnPWywvUAvm5cRkRS6lnZ0ZqsuqNg1z7
         S32XVHLqyYEVCEr0hF7NEM6vY56cOYFt+j+ak3pyl1wm3jIp9IWbaNvTCzggZWuurx1I
         vwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a4lfc+3ofMUnScOCPQ0mHvnxSSki1D/PoIMD/TM/ubo=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=YIwa7PxQlGw4i1LJJmuKR9IGNB9nARp6IEDXhKnczUQQA52/WLU0Skvs4aH1jWuMRA
         LbP0vh1cgVu0HCdXuapjSTxEF/fTeMWTfNHcbW/yhC7QImzXwiIZ0de7xGGvIQi2Thl2
         qNURgAcJDXAtu5JDKsaW4idXX7uFb9fBQgGRK60U/LvrMk1fvdpVXek0mXM8u05/vFGO
         Az8Jir+/k3YTlHBoo5x5W1zRcfd5oOzWiHvk6TLBwnA5bONM4pav8NyCa5REY4FmFxpj
         RT/Ug90ZKE843gofBJn8bTTf42I4AuwbPuwqiCpxwVugu56I8Ss6XCnm8hxbvNaQJQZv
         qGXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=JHgzyGlr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p189-20020a625bc6000000b00686b7f18654sor7041548pfb.5.2023.08.16.07.55.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:55:56 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=JHgzyGlr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197756; x=1692802556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4lfc+3ofMUnScOCPQ0mHvnxSSki1D/PoIMD/TM/ubo=;
        b=JHgzyGlrmLOyKd4XtnUZUHBIfeiHMT+n0LYQ2qbdFVdrS8JCds68NqNTuR+wGU30LC
         STGHmqfkS0Yhuh1sdDT8IAIj+e4hII52TW0mj9RN58U2UHTBiSQ0Rmsdb4J9jEJNQsYu
         zLBaNxAsktU+UHgWTFNK4DjYkXfwKZ1inTtBA/F65do01uuIBA7m0B1/65yG3J2ZDnXz
         iVxgGmToAYv/hxjO0PQK4PNnaNWJcwLdJ8KmCfph6J55OgV5BT8Q40kSwU8W8wz6ZCfQ
         v/PafK3dVyBri+mEaYnQ3Nhmy2PeXa24DYlhExZoEi0FhwDPWrtsY/0W2Nv/8uTNnHgZ
         PRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197756; x=1692802556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4lfc+3ofMUnScOCPQ0mHvnxSSki1D/PoIMD/TM/ubo=;
        b=h80aGuC0awP9XLjY4j9AvuS9SJGL50NPIwx2P2ppTahZtyBDKgDxfx5Uzn7xJT0D1F
         B611A0kcoHXYo/TPdIBGtbKhBMQtTsVAVSMLWc5l1Rp7B85JgYXykG5uTVPIlTAxZ3Sg
         a7UFivLpULmSJsY/3aZ/Ty7GeeCbqdReV+lXMLvkiwStAnXCmK+i2wqmcV3HGScFlZfE
         viEGRNgCBpxkRdw4IV/dmvcxTDe9bK/VCfOYtvOrK1lMYoZTH16jViXXullLvaWl1DV/
         Xv4DcyHbmk+yUpbkx3ahkwz8oPXLdfEe+0YlG6mM72yrPlbfUPYieXRsVECT64Hn3ZMe
         H1ug==
X-Gm-Message-State: AOJu0YzTQr9RyZ3teh2I6U3/LcW+/bPlRNLHScy8G4VFk0VBXH1QLC5g
	sC7hqUcH4wXCn/FYLyvtlYHbvQ==
X-Google-Smtp-Source: AGHT+IG++B0TbJUOezPMWxtLZ5ibdzjcE0GQONt/uzZ5WKwJbtlHvJkyaqAk2M4oATOMNd2boKTHbg==
X-Received: by 2002:a05:6a00:c83:b0:688:47d5:ede with SMTP id a3-20020a056a000c8300b0068847d50edemr2988788pfv.6.1692197756021;
        Wed, 16 Aug 2023 07:55:56 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:55:55 -0700 (PDT)
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
Subject: [PATCH v4 23/25] contrib/plugins: Allow to log registers
Date: Wed, 16 Aug 2023 23:51:44 +0900
Message-ID: <20230816145155.21049-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7+N6nDIMJiyj

This demonstrates how a register can be read from a plugin.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  10 ++-
 contrib/plugins/execlog.c  | 142 ++++++++++++++++++++++++++++---------
 2 files changed, 118 insertions(+), 34 deletions(-)

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
index ce67acf145..aa05840fd0 100644
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
@@ -77,28 +93,42 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
  */
 static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 {
-    GString *s;
+    int n;
+    int i;
 
-    /* Find or create vCPU in array */
     g_rw_lock_reader_lock(&expand_array_lock);
-    if (cpu_index >= last_exec->len) {
-        g_rw_lock_reader_unlock(&expand_array_lock);
-        expand_last_exec(cpu_index);
-        g_rw_lock_reader_lock(&expand_array_lock);
-    }
-    s = g_ptr_array_index(last_exec, cpu_index);
-    g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Print previous instruction in cache */
-    if (s->len) {
-        qemu_plugin_outs(s->str);
+    if (cpus[cpu_index].last_exec->len) {
+        if (cpus[cpu_index].reg >= 0) {
+            GByteArray *current = cpus[cpu_index].reg_history[0];
+            GByteArray *last = cpus[cpu_index].reg_history[1];
+
+            g_byte_array_set_size(current, 0);
+            n = qemu_plugin_read_register(current, cpus[cpu_index].reg);
+
+            if (n != last->len || memcmp(current->data, last->data, n)) {
+                g_string_append(cpus[cpu_index].last_exec, ", reg,");
+                for (i = 0; i < n; i++) {
+                    g_string_append_printf(cpus[cpu_index].last_exec, " %02x",
+                                           current->data[i]);
+                }
+            }
+
+            cpus[cpu_index].reg_history[0] = last;
+            cpus[cpu_index].reg_history[1] = current;
+        }
+
+        qemu_plugin_outs(cpus[cpu_index].last_exec->str);
         qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
     /* vcpu_mem will add memory access information to last_exec */
-    g_string_printf(s, "%u, ", cpu_index);
-    g_string_append(s, (char *)udata);
+    g_string_printf(cpus[cpu_index].last_exec, "%u, ", cpu_index);
+    g_string_append(cpus[cpu_index].last_exec, (char *)udata);
+
+    g_rw_lock_reader_unlock(&expand_array_lock);
 }
 
 /**
@@ -167,8 +197,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
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
@@ -177,17 +209,53 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
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
@@ -224,9 +292,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      * we don't know the size before emulation.
      */
     if (info->system_emulation) {
-        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
-    } else {
-        last_exec = g_ptr_array_new();
+        cpus = g_new(CPU, info->system.max_vcpus);
     }
 
     for (int i = 0; i < argc; i++) {
@@ -236,13 +302,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
