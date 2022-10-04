Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp41140ocb;
        Tue, 4 Oct 2022 02:26:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4IrEBtv0f4e6jMXryTvCKOGSXsbNwnpa8Hl+8SFvL1A0O2w2lWgGscTnTrw9tDQluDmfgz
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr19172836qvb.5.1664875588029;
        Tue, 04 Oct 2022 02:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664875588; cv=none;
        d=google.com; s=arc-20160816;
        b=nYOcv6Z7SaM3eYxx85QdVqnlgGYxVABKrCql6OaO0WVqvs+4K/F2mqAwYq/KNT+c15
         7V44BmmZ+y0q7QKrsubkWu/o5/kbA0GkST+uqHa9za/d1PWwLDq5nmsGWMAlvU3ggJFY
         66a94IEttdlHaY6q/QnQORIZAq5fVx4eQg/KTTcI3nT2h5byDGy/0YtBMcM43h9Bz3fu
         3GzDG3qhjHjmkxBR5ZEAXU+iTmR6cYXoTTNegW8BnTszwjwyveimAL8ISKvKt+AdS/G0
         a6pcWb/Zfq3i55hQCgoorvoRgoLL8woK5EPSROee+IEBzBpvrQwlaZFtBT4lJvix3RQf
         SuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tn1Lf1hywhKaXdBFMhzTN4ztaESwvV9b7qo9S+GKeVI=;
        b=G3k4WKCwtI2D6GPkI/Q998dyZsSxtYRzmPRaty7PKzL2B5/nqNxpoFZLLTa3Q1HaYI
         6uCqDpXD2RYRiHDwFjmZ2wUKUd1feTjgrNYkctyo/ZfUJsX4r5LhwbchemU/UcaJsWwX
         wyPN6upIhVpTJX9y4vgzEAb2wd7uZfOXnNi+k/gcfEsuLL8swujb+DJQqed091f6CM/6
         GSU0wwZJpYS3nvwITxRp08Zo3emSA2vYESsQIyV5TiYFWcp4orcQJ92UMNbJwhGmMfsU
         qgSioz1kCLrGX6BHFzefQ7Nyz0lHgloMYkH9QPD78L35HGgBb76+hK307PY1qu7f1f15
         EDNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=S+xs67k6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp41-20020a05620a45a900b006cf7d65b5a0si4400636qkb.535.2022.10.04.02.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 02:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=S+xs67k6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofeC3-0006Zk-IC
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9n-00042Z-D6
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:24:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9k-0004MV-NT
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:24:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i6so12675375pfb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tn1Lf1hywhKaXdBFMhzTN4ztaESwvV9b7qo9S+GKeVI=;
 b=S+xs67k6jFbRaa4GCYofhhRbpijcXN7bNuhlsxghdXsoMxuxtO2MB1p4/1XVzvgk3w
 dT3b5GDwW9ecyH6Ulhgjn+0orRCQ+ArDq6lKxX3KKAFiDEFuuj7Jduh3FUkSxgN/I3/U
 ccTwwytLvYx2rF8Kec6P5HqJoxdhW7cz05qLvSTn3zj6FDfo81jhyYK87gjpGvCV9DFK
 CnDaI3sTgxgmA5hAL+sE+RnXngMEeJLxnw0MHZJ3M3BZ7QmKt125s7sUMUyrUc49WH5y
 P2xuo6he99oI0jsuoEl5Y4i/Ue+z7DDbh27Dh7y8hyvGEbtmASIRK22UsHuLo2HQlmvg
 Z/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tn1Lf1hywhKaXdBFMhzTN4ztaESwvV9b7qo9S+GKeVI=;
 b=6PQvJ5q1AAiUeetPbiqvKynIPSzFy89q3bF1c8LdLPkdgrHGDbDl+KVMlWq7PG8ezd
 Y7uB8gN8asQeONV/NKuBHfZZRYXZfZSHkFeeaXlwlzkDamR90A7nPKsUDFI0ao4Ip1os
 T6Jjp9UFQa2li+0Etq9UJ9FLP8Ld2xRWpM4ahBOdfFQF32b1qm6lZHsJ6D9UYHNqkmsw
 +8goyyTeJNT5OO2cGbc/ZNrUvbL9Mv53q8lsV91RCUsVlA5zt0K5hJLYW3OU1pO8V+Te
 eO3TPxkKESjoq3kqN0kfijCKUybv8VQNWK9Drt9QXl/kogkkFuQt+TUn48qaKW6U9nZV
 8Dlg==
X-Gm-Message-State: ACrzQf0NXM7NxIxSEBEqPOFdOLW9yeftCLiWcANIVKoxuiST1LvIYSkA
 B2F12VM+95K3ESzFdwmum6K5qA==
X-Received: by 2002:a05:6a00:1989:b0:546:410f:bdd2 with SMTP id
 d9-20020a056a00198900b00546410fbdd2mr26628601pfl.83.1664875443484; 
 Tue, 04 Oct 2022 02:24:03 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 1/3] hw/arm,
 loongarch: Move load_image_to_fw_cfg() to common location
Date: Tue,  4 Oct 2022 14:53:49 +0530
Message-Id: <20221004092351.18209-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d6qVRWvbfk7c

load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
function will be required by riscv too. So, it's time to refactor and
move this function to a common path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 4 files changed, 53 insertions(+), 82 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..704f368d9c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -818,55 +818,6 @@ static void do_cpu_reset(void *opaque)
     }
 }
 
-/**
- * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
- *                          by key.
- * @fw_cfg:         The firmware config instance to store the data in.
- * @size_key:       The firmware config key to store the size of the loaded
- *                  data under, with fw_cfg_add_i32().
- * @data_key:       The firmware config key to store the loaded data under,
- *                  with fw_cfg_add_bytes().
- * @image_name:     The name of the image file to load. If it is NULL, the
- *                  function returns without doing anything.
- * @try_decompress: Whether the image should be decompressed (gunzipped) before
- *                  adding it to fw_cfg. If decompression fails, the image is
- *                  loaded as-is.
- *
- * In case of failure, the function prints an error message to stderr and the
- * process exits with status 1.
- */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_name,
-                                 bool try_decompress)
-{
-    size_t size = -1;
-    uint8_t *data;
-
-    if (image_name == NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size = load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
-    }
-
-    if (size == (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size = length;
-        data = (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static int do_arm_linux_init(Object *obj, void *opaque)
 {
     if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 29df99727d..4b595a9ea4 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -598,39 +598,6 @@ static void reset_load_elf(void *opaque)
     }
 }
 
-/* Load an image file into an fw_cfg entry identified by key. */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_name,
-                                 bool try_decompress)
-{
-    size_t size = -1;
-    uint8_t *data;
-
-    if (image_name == NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size = load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
-    }
-
-    if (size == (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size = length;
-        data = (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
 {
     /*
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index d605f3f45a..371a45dfe2 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/loader.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
     return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
 }
 
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress)
+{
+    size_t size = -1;
+    uint8_t *data;
+
+    if (image_name == NULL) {
+        return;
+    }
+
+    if (try_decompress) {
+        size = load_image_gzipped_buffer(image_name,
+                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
+    }
+
+    if (size == (size_t)-1) {
+        gchar *contents;
+        gsize length;
+
+        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
+            error_report("failed to load \"%s\"", image_name);
+            exit(1);
+        }
+        size = length;
+        data = (uint8_t *)contents;
+    }
+
+    fw_cfg_add_i32(fw_cfg, size_key, size);
+    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
+}
 
 static void fw_cfg_class_init(ObjectClass *klass, void *data)
 {
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 0e7a8bc7af..c1f81a5f13 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -342,4 +342,25 @@ bool fw_cfg_dma_enabled(void *opaque);
  */
 const char *fw_cfg_arch_key_name(uint16_t key);
 
+/**
+ * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
+ *                          by key.
+ * @fw_cfg:         The firmware config instance to store the data in.
+ * @size_key:       The firmware config key to store the size of the loaded
+ *                  data under, with fw_cfg_add_i32().
+ * @data_key:       The firmware config key to store the loaded data under,
+ *                  with fw_cfg_add_bytes().
+ * @image_name:     The name of the image file to load. If it is NULL, the
+ *                  function returns without doing anything.
+ * @try_decompress: Whether the image should be decompressed (gunzipped) before
+ *                  adding it to fw_cfg. If decompression fails, the image is
+ *                  loaded as-is.
+ *
+ * In case of failure, the function prints an error message to stderr and the
+ * process exits with status 1.
+ */
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress);
+
 #endif
-- 
2.25.1

