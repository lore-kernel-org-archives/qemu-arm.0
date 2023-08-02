Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp207288ejb;
        Wed, 2 Aug 2023 01:50:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:12e:44:a1a6 with SMTP id k10-20020a056a20258a00b0012e0044a1a6mr17655868pzd.11.1690966208191;
        Wed, 02 Aug 2023 01:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966208; cv=none;
        d=google.com; s=arc-20160816;
        b=hOkcffpJiFFX5ByipfhJTFkXgTlgQeQSRLGMSiBnGzc2kxtcQKgsdA2FAhy+vION9j
         3P0wwJTA/XTvjP7kd2FJLxxeRo/naHGt8P4D8VKp7I18tKvowEtqtT8tPq85JKdIN0BA
         ZeFLqleblR1qrknjDQrR9Jt1N2rS9mdZDd2zuxVb+AuglBmYjLtTRXLJOwjlYqrV9Qus
         iby97PQwJ6G03WyokTVHCZj/nReQ9/PzmNgPuYHqTtNBvrFDs4HuWMy/9WSNjTylV3ur
         bjm/ba3AkqXWMi/uxSiQiak3QyKlFUnvsNu11CMOKzP/hsSxa0PWjw2FkZqryU0Zc7q1
         mDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TPZLL2BQqlmuIWxUEHn0Sk9lpGxDteaJZxDIDmp8UqM=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=jYbfJgGkbUVmWbXGF6sWACEFJaqIWo46ib3wFE4uROryVC4ePcArrpP9FGPi64tZUA
         8GY75pdFBuptSeiPTkR49LQVy0A6Hqpoh1IW3nLBeZGCusIeMytPTPnpqFv5i1+9joAu
         L3Nv4gBcCmlv+M1qQsw3MzJ9nOyBvu6/KldhQAwkwXrnuK3mVqOXaGz96wcPqiHexMWx
         I0QZkfE3VUnAqURdzboA890HhLRgfk3prODg5NldmSRErqbxU1dvytQw2S8DoRyeqaao
         BWnq8Ms121vPTJ5j75ZR//IVv9GXqyB0BU+9wUgCe8CJXwjOYu/QcNw3599EYnAi4FDc
         PuAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=EsBUBuCR;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d10-20020a621d0a000000b0068711b2efedsor410544pfd.2.2023.08.02.01.50.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:50:08 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=EsBUBuCR;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966207; x=1691571007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPZLL2BQqlmuIWxUEHn0Sk9lpGxDteaJZxDIDmp8UqM=;
        b=EsBUBuCR0S4RhEpI2lo1HRKWkjsztQCFEY2V0Zi2etZuY9bE8UqSuf9FKb3JfK0RH3
         fdP6AofXO8C4X4rEC/af1ZN2MEniRKql5q7cfVVIObHwmPU452I+23vzvsKWXI+l3Pmb
         eHWSo8i80v/ur5RupSrxk2zBxtI9y8qArjKfSpzyLXCy+0GzIljOlrXRfQjg+uQ7rvkj
         0vgy2B6ndvBtlK/Nwpw8+v6lL4v0xRG2rnlNrAgG0GNj7UEzbK10fV+jCEWTd74YE8hf
         v+JBH0JQ0ntaY4Ke7+rrrFhfDMjjLpqtfoHpJ5O9DZvmMYaMvx3PmJJdv7aVCQ/7cqKB
         PBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966207; x=1691571007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPZLL2BQqlmuIWxUEHn0Sk9lpGxDteaJZxDIDmp8UqM=;
        b=SevTZtlosPOfekPxwkU/QpoD/B7vl3ZpcrLpCHQ6wZBjn658iVuQnIBtxhrmNc/l8I
         uvcM1ToKaiZBJW5VWbDYK/rihXYjj+z/BA7WLuzbDEm2tJc+mGyPQnAWASbjXOn/mjb5
         mpsKMuHLz2AoIgb6ESkr9Vs62Jw0c6PFqy5jstJfhb7xVb/Z0MjdG9fGlsi05oBd9l4v
         ZMB5PqBAk5E/b9D5Z7oGGZBgw+7gcuW0e8mWlKXKhiPp7jPIlO22POKWv8GfrBwQ8Xd0
         qQ/SVGyEDHRICtO4xf9vo2ra907y6KYZeLCWF1kqp6IeHWBvvf4/go08/6IQdNPASZRV
         dKRg==
X-Gm-Message-State: ABy/qLYULTvftGcmqHfru68mOz3OOA4FE1F1daj67Or6EM2FAYYn65p4
	kVQ9uWTWklag1j/bV3ENfcHjVA==
X-Google-Smtp-Source: APBJJlEGoPx4uVJ2v8p8ALkAYuDoR6HCD2Gx0IPmrd1EGhSec+muAQP1Q8gGudB5AwHAIy/XtvygnQ==
X-Received: by 2002:a05:6a21:6da5:b0:134:73f6:5832 with SMTP id wl37-20020a056a216da500b0013473f65832mr20217917pzb.16.1690966207669;
        Wed, 02 Aug 2023 01:50:07 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:50:07 -0700 (PDT)
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
Subject: [PATCH v2 22/24] contrib/plugins: Allow to log registers
Date: Wed,  2 Aug 2023 17:46:10 +0900
Message-ID: <20230802084614.23619-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: su/hQkb1lNWl

This demonstrates how a register can be read from a plugin.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  10 ++-
 contrib/plugins/execlog.c  | 130 ++++++++++++++++++++++++++++---------
 2 files changed, 108 insertions(+), 32 deletions(-)

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
index ce67acf145..031ad67fbb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -15,27 +15,42 @@
 
 #include <qemu-plugin.h>
 
+typedef struct CPU {
+    /* Store last executed instruction on each vCPU as a GString */
+    GString *last_exec;
+    GByteArray *reg_buf;
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
+            cpus[num_cpus].reg_buf = g_byte_array_new();
+            num_cpus++;
+        }
     }
     g_rw_lock_writer_unlock(&expand_array_lock);
 }
@@ -50,8 +65,8 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
 
     /* Find vCPU in array */
     g_rw_lock_reader_lock(&expand_array_lock);
-    g_assert(cpu_index < last_exec->len);
-    s = g_ptr_array_index(last_exec, cpu_index);
+    g_assert(cpu_index < num_cpus);
+    s = cpus[cpu_index].last_exec;
     g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Indicate type of memory access */
@@ -77,28 +92,35 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
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
+        g_string_append(cpu.last_exec, ", reg,");
+        n = qemu_plugin_read_register(cpu.reg_buf, cpu.reg);
+        for (i = 0; i < n; i++) {
+            g_string_append_printf(cpu.last_exec, " 0x%02X",
+                                   cpu.reg_buf->data[i]);
+        }
+        g_byte_array_set_size(cpu.reg_buf, 0);
+    }
 }
 
 /**
@@ -167,8 +189,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
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
@@ -177,17 +201,53 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
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
@@ -224,9 +284,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      * we don't know the size before emulation.
      */
     if (info->system_emulation) {
-        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
-    } else {
-        last_exec = g_ptr_array_new();
+        cpus = g_new(CPU, info->system.max_vcpus);
     }
 
     for (int i = 0; i < argc; i++) {
@@ -236,13 +294,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
