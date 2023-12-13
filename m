Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431467ejo;
        Tue, 12 Dec 2023 22:43:17 -0800 (PST)
X-Received: by 2002:a17:903:24a:b0:1d0:68a:4a45 with SMTP id j10-20020a170903024a00b001d0068a4a45mr10322052plh.35.1702449797109;
        Tue, 12 Dec 2023 22:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449797; cv=none;
        d=google.com; s=arc-20160816;
        b=AXcjExtGiWjx/WqrPUWA1xLpTZ2hMGNuGzfGGBplVoyRvVHb2iNEX3k3VL3zajLrMU
         ZqJ8o+c4zu3wnE2L8Oe5jPXn50PXqKxhEa9JQgLzmAsRhF/azo6KM79Ze1b7xiyAqfYA
         iFaPtiWv+pTB7GkcJ8tSEr3WxOUC0y4kfB1cGR/3ltdduAu8AINoSAagVR3OeeEcGtrW
         saA8DshHs4REftSI5nSscp/FSJc9DSfKQtYS+ntlephAkJZL80hordSIjv/5RcBmk8pf
         4oMag5DzxidIQLq6NzJjEADPYb+hiCcKXj2+kIkmWwFwMl7uW9+uA8+vZsEaWh14hWer
         J0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=T4p6vSO8CKdC89ov95w+SL3j0ix/l04dcknZHk45s30=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=Sw6qNSlWJSSIkNupSBBDX3YgZNVfJGjjHNzlT2YtC4rQhzdUscMhR9ZMjQxe00BuCu
         kV8EpiKun0SNAkL21PhgSZfCoWpapkAEo5BDdrvpZKXscLUrt2iukkyi0NJUEtRJ7ehg
         2+SzGL+HJ0uFZdM5RBvB5C29OFbwNKw+Ndi1ocXRWkU4D07x46NZtQENHErO2ZpyAIK8
         6ZCln2vIFohv7dejHAR9TXC5cKtnAhLytL38U1/41+Mr08F9WUC2CAtw2W4SaCiqCIIJ
         WJkahDDstWwIC8gz9u0ogEiPtmzntVknpoZhKXuoPru+b+C9Y5puDkZ7mB1sdGWxRJrd
         hu8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="iONUi7//";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y13-20020a170902b48d00b001cfb573671fsor6868902plr.10.2023.12.12.22.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:43:17 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="iONUi7//";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449796; x=1703054596; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4p6vSO8CKdC89ov95w+SL3j0ix/l04dcknZHk45s30=;
        b=iONUi7//SbnACxfXySARTu0zLc+0g8kjDWqmCJk7H/R2XYDtnw/3yVI1pqno2dUSdb
         HO8LMTC9MF/WLcSxZiYlqRTStg0rFujTNdCn4eDp32JItk0cnCChDndsJ56DLGgcmQWY
         cl99c7LhmoWDY0n07cDsLk5ai7MKRkCIS4c2S/xZ6YQj0Xsz0oh4uiGBFn3VSma3MJpd
         RciwdM0Y2gyPds5cgasjzDYR8zHldnA2UldZmn4tv+fWa/X4I4kBh5s1q5qiivI5BN2T
         mFezHFco3Dp6i5PROEF9zL6xDP56G9yJL4JoxkbBs7RmwypfPfMub6NOp/7rczNQme3B
         dx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449796; x=1703054596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4p6vSO8CKdC89ov95w+SL3j0ix/l04dcknZHk45s30=;
        b=Mk98OgOsb01Fgx1301rdJ704WpAcp1748dufqezdBzYnfSAVCAptPIft2kmL1z8lBg
         rXJzwwPwqJPqrw8iPazifflE76Dg7Hn2iJsm3Sk/Sn2UADetGfsoOAeHRVmDYBpCQplT
         Mk1p1iAjYrYdQYMVORIcwaP3Y/eGaJL8/ZgddgyVxPCaY74d8H/yEJRdnE0xvptRIxd8
         q86HVq3x7HKc3YgLlbgdQ+Jh7vrj3B9OL82y3Ir0shfX0EbKcaiaZZp6I/is3wv7aZhn
         jX2Hv554l0vvHEhARXibAGjqHuA4bKDNQ2RL1UT9thODnjCMrj90GZxRYjiJrlw9tOFO
         oDcQ==
X-Gm-Message-State: AOJu0YxTaGUACNv97SWUe+ze3YP6yVY/3WNVLJhiJAu+SC9yuQcI4hwo
	orND8rFvb3widopSic6Q3iH0WA==
X-Google-Smtp-Source: AGHT+IFNoDHwOBz4h+l24N2R9FDR52U2pp6CZ0JrZXT4MdxTrKcLBJx0wzIXJSGFPkOWiUFb8/gA6Q==
X-Received: by 2002:a17:902:ab4e:b0:1d3:4fa1:9dc with SMTP id ij14-20020a170902ab4e00b001d34fa109dcmr528944plb.79.1702449796608;
        Tue, 12 Dec 2023 22:43:16 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id x10-20020a1709029a4a00b001d34796c1e9sm1151266plv.119.2023.12.12.22.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:43:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:12 +0900
Subject: [PATCH v17 13/14] plugins: Allow to read registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-13-777047380591@daynix.com>
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
X-TUID: de20g0BaapKP

It is based on GDB protocol to ensure interface stability.

The timing of the vcpu init hook is also changed so that the hook will
get called after GDB features are initialized.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/qemu/qemu-plugin.h   | 50 ++++++++++++++++++++++++++++++++++++++++++--
 plugins/api.c                | 20 ++++++++++++++++++
 plugins/qemu-plugins.symbols |  3 +++
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4daab6efd291..e7e21c9ee5b7 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -11,6 +11,7 @@
 #ifndef QEMU_QEMU_PLUGIN_H
 #define QEMU_QEMU_PLUGIN_H
 
+#include <glib.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -227,8 +228,8 @@ struct qemu_plugin_insn;
  * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
  * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
  *
- * Note: currently unused, plugins cannot read or change system
- * register state.
+ * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
+ * system register state.
  */
 enum qemu_plugin_cb_flags {
     QEMU_PLUGIN_CB_NO_REGS,
@@ -708,4 +709,49 @@ uint64_t qemu_plugin_end_code(void);
 QEMU_PLUGIN_API
 uint64_t qemu_plugin_entry_code(void);
 
+/**
+ * qemu_plugin_find_register_file() - find register file
+ *
+ * @vcpu_index: the index of the vcpu context
+ * @name: the name of the register file.
+ *
+ * Returns the identifier of the register file if it was found, and a negative
+ * value otherwise.
+ *
+ * The names of register files are identical with names of GDB's standard
+ * target features with some extensions. For details, see:
+ * https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html
+ */
+int qemu_plugin_find_register_file(unsigned int vcpu_index, const char *name);
+
+/**
+ * qemu_plugin_find_register() - find register
+ *
+ * @vcpu_index: the index of the vcpu context
+ * @file: the register file identifier determined with
+ *        qemu_plugin_find_register_file().
+ * @name: the name of the register.
+ *
+ * The names of register are identical with names used in GDB's standard
+ * target features with some extensions. For details, see:
+ * https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html
+ */
+int qemu_plugin_find_register(unsigned int vcpu_index, int file,
+                              const char *name);
+
+/**
+ * qemu_plugin_read_register() - read register
+ *
+ * @buf: the byte array to append the read register content to.
+ * @reg: the register identifier determined with
+ *       qemu_plugin_find_register().
+ *
+ * This function is only available in a context that register read access is
+ * explicitly requested.
+ *
+ * Returns the size of the read register. The content of @buf is in target byte
+ * order.
+ */
+int qemu_plugin_read_register(GByteArray *buf, int reg);
+
 #endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index ac39cdea0b35..3eaad5bf4187 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -35,10 +35,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "qemu/log.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
@@ -435,3 +437,21 @@ uint64_t qemu_plugin_entry_code(void)
 #endif
     return entry;
 }
+
+int qemu_plugin_find_register_file(unsigned int vcpu_index, const char *name)
+{
+    QEMU_IOTHREAD_LOCK_GUARD();
+    return gdb_find_feature(qemu_get_cpu(vcpu_index), name);
+}
+
+int qemu_plugin_find_register(unsigned int vcpu_index, int file,
+                              const char *name)
+{
+    QEMU_IOTHREAD_LOCK_GUARD();
+    return gdb_find_feature_register(qemu_get_cpu(vcpu_index), file, name);
+}
+
+int qemu_plugin_read_register(GByteArray *buf, int reg)
+{
+    return gdb_read_register(current_cpu, buf, reg);
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549d4..977f1fcfcbfb 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -42,4 +42,7 @@
   qemu_plugin_tb_vaddr;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
+  qemu_plugin_find_register_file;
+  qemu_plugin_find_register;
+  qemu_plugin_read_register;
 };

-- 
2.43.0
