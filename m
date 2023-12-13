Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431517ejo;
        Tue, 12 Dec 2023 22:43:26 -0800 (PST)
X-Received: by 2002:a05:6808:3c4c:b0:3ba:12af:8311 with SMTP id gl12-20020a0568083c4c00b003ba12af8311mr6445394oib.117.1702449806382;
        Tue, 12 Dec 2023 22:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449806; cv=none;
        d=google.com; s=arc-20160816;
        b=gHiVzW+iW4M2Wek54a8pXxeAmr3qhkRx7kdjbLlkZXzVNQyioF5R7SDNroskMt7JQI
         ACrEt+gMMi61UgAu1YAPkqj315khSTHtKnA8+VAeVrcVzpSen269kkZdHcSA4ldIZ44A
         rymdMKWMIIanDox/3KCEoRFgqfSDhnWRz3Frg9/6TCzuvFAR1JDk+C6xzn6VL4p/YRr4
         UR/kxD3oH9wBnGW0AWKT37lewQWfY8GLMNEH2fVLQJqrm8Edjfow//hCxkTTM052cwab
         IfBqV7bTTDR5w/9HrlrvkMtwlaDNDUB38VYugz/rvGhcn+Ei8S0adagch9KaFALkjnuF
         zRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=Iml365b4EelzYHSZ0FulCEqGdj4H79FyvhO3q4R/Ev0=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=TfJzt+IDvEZ/FyN5szuhHNEnKTdu4WE/ZAb8u2WJPC534Mvja5j068E8e3nBcfM+Tq
         62OcOWRPQHYqMEOlHO2cyC2OxvCA48SCNE8vBtUjcMB3L/JtnbUWZlIrtVgagKA9j9gF
         +Xj0REtg8hKHmb0c5AZxHaBlJcacDa0GEZeZNIL4zprT4HboFjvXrGq6TsuE2rC1SSLt
         XhaojGHO8Ma6lndSq+Kmv6cZzcNFSj2sQ40hPR+zlr/XJJuKJwCNdH4H3JDmLqpvuLR1
         lvJT0GgNOE8ENOIf2hm3l6vIpellYFDHC8TmksAQmUxQghwbtxohhzBWpYzmaN12wkos
         zvaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="NM1TDEz/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c1-20020aca1c01000000b003b8b0f7fb08sor8140084oic.17.2023.12.12.22.43.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:43:26 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="NM1TDEz/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449806; x=1703054606; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iml365b4EelzYHSZ0FulCEqGdj4H79FyvhO3q4R/Ev0=;
        b=NM1TDEz/daeHBmPRLVxQlf1wp+xT1dL6jM7Lnr1Nv/IYU3gp5m4grQfm78dxqcJq9b
         4SnrvZB8wpkO7hz+WkZMWBAUJr+Q3+vgMH/RV8TX9HFjNklwH0KtHURUWJ0YLusCJcLO
         vzheuOe/+GACii2XssZN+l/obPzyBSRodzFaB8tJbe1PqAvimbVaIgUBWGerSb+azZvu
         E7SAqlrbredF7/oyWIGYwGuAUXqtlnRvvbQhTltDohJzIXCE/nXaMcRkSYX4hjF+rsw5
         WYu5Fo5IpAzxl8wxewWYj4HwBz1UUjGPolZ5P/Swdz7XkNGAquI7c6LSxwew4WrAZYjW
         CUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449806; x=1703054606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iml365b4EelzYHSZ0FulCEqGdj4H79FyvhO3q4R/Ev0=;
        b=EN86aPIaG4ERXW+JUFtuF+vf5UGdP91HwYsNxf1UOhxe1jt187pv7iq6wyVrn2k3+U
         aNAiVIcnwJ+wvN1wd4jo46p2PgQmPXYs6kKk+mX6MdMCN0xIsQSkp7mFm+6RHxxnf6d8
         A6aGQwX3MOFMsGYO57/CgOp0HQtXqFg4HPOQdwB7Na1JhvWs0ICht/+vPdAqGU/9qjgK
         IwsK11CNLbwLstUAq0FKA4JlHqdPjW9GxpT3COMQt4CG0o3HKKKKsibLAcGR/lGlHs/W
         likE6k9RoQjHVxn1nDcwRBYbnEITNj0puSLmW95jqvq7EYYzxiCYE0O0qE5d6X3/EhBw
         WWmQ==
X-Gm-Message-State: AOJu0YxvNeUwmyQawe0/csddcPMXd5MI309GQv35nbFl3scxEHCny3qf
	AndNasA5ZC/miOcawcZ6JpQH0w==
X-Google-Smtp-Source: AGHT+IGv72lyGgllXBf9/ZKSll3qdZFYuEo+yD89Wl5azDkiXXcV1uJzExHNYIF9Tj0phk1oHbeGGw==
X-Received: by 2002:a05:6808:140f:b0:3b8:6274:5b8 with SMTP id w15-20020a056808140f00b003b8627405b8mr11415518oiv.37.1702449805896;
        Tue, 12 Dec 2023 22:43:25 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id q2-20020a17090a430200b0028a4c85a55csm8232846pjg.27.2023.12.12.22.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:43:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:13 +0900
Subject: [PATCH v17 14/14] contrib/plugins: Allow to log registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-14-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: KCM8tzCmwkwk

This demonstrates how a register can be read from a plugin.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  10 +++-
 contrib/plugins/execlog.c  | 120 +++++++++++++++++++++++++++++++++------------
 2 files changed, 97 insertions(+), 33 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 81dcd43a6128..c9f8b275906c 100644
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
index 82dc2f584e20..f3e714c888ff 100644
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
     g_rw_lock_writer_lock(&expand_array_lock);
-    while (cpu_index >= last_exec->len) {
-        GString *s = g_string_new(NULL);
-        g_ptr_array_add(last_exec, s);
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
@@ -177,17 +209,33 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     }
 }
 
+static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
+{
+    int reg = -1;
+
+    expand_cpu(vcpu_index);
+
+    if (rfile_name) {
+        int rfile = qemu_plugin_find_register_file(vcpu_index, rfile_name);
+        if (rfile >= 0) {
+            reg = qemu_plugin_find_register(vcpu_index, rfile, reg_name);
+        }
+    }
+
+    g_rw_lock_writer_lock(&expand_array_lock);
+    cpus[vcpu_index].reg = reg;
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
@@ -224,9 +272,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      * we don't know the size before emulation.
      */
     if (info->system_emulation) {
-        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
-    } else {
-        last_exec = g_ptr_array_new();
+        cpus = g_new(CPU, info->system.max_vcpus);
     }
 
     for (int i = 0; i < argc; i++) {
@@ -236,13 +282,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
2.43.0
