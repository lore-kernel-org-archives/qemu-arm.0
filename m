Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2725010ejh;
        Mon, 5 Sep 2022 21:28:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7/b6u2R2Uwa9+XpNNH7RQyR4X3cZEhaZyuQBrUhr3Wn+eWdMjUW99C4NhN5LwymZq8w9lx
X-Received: by 2002:a05:620a:470b:b0:6bb:61ca:9ae9 with SMTP id bs11-20020a05620a470b00b006bb61ca9ae9mr33243949qkb.36.1662438481322;
        Mon, 05 Sep 2022 21:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662438481; cv=none;
        d=google.com; s=arc-20160816;
        b=xVGA/jtyrwvCuJp8THm7dtarEg4ar9HqUMnpYhUpJCNyVtokqZyeljleBesD+EYlQH
         ohjvrbYbK++jvwAwzNZvMk8AvjTqFgEWz5aX/XuCVVn0evWyiO8WZZ7yMLG0dnd+zQ0N
         2a9d3XHE6tiSgmTYNiyG7LTLGdXyTsSvQvggRQBIW62TJSgA+dwhkQpPaUo9Sevs4FhU
         RzU66HdXwdPsKp5nXVmQIombbxSO4NSiYjxWe8BvWOyhn1TyRwi/oiBGhzeU26K5Y7Qs
         Z+PdtviVnJA0n2KdUjg/t+L11CQ6NQPxskBXdGfLqZ/A/Q2yb5ekiRClPN7xdIE8iIoC
         GNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZBm3nLoiUBu04kY2LVi2GbBxIBiGqU5xHs6XU99y0Yo=;
        b=zTlG/2qW6yTfJYzySeYcai4Rxxzm9ttWflFPf22yOrjJL4vlH6hrG9ryss4pSRDS2S
         3kw45T5mgRcXF3gRWuveg6buyEPDRWgNsShIg/0172JbSmrYHISYYIjOD6EAQNExTR7z
         SVE1rRC/0EAH8Aof8PSvjpR7wc/6Sfd0/LAJbYvfGALGqhWKClSTimvMtRaQvosdTj6f
         cwiWJpUWrZOtsav8pMieFdj5fMNnhp3CwwM2zyQy5h+rf0NrI3c6CDnNABu5qwYchfnh
         vaf08BMlcBQhKZk2Tbt6FSFu86VBNXpikNpm5HaFa0cQQbafuVt0j5hS0sprWJWTORaT
         TGtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=JNktW2Hr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a0562141cc500b004972c49fda1si5755701qvd.416.2022.09.05.21.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 21:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=JNktW2Hr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVQBs-0001e1-Oq
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 00:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ95-0007Pw-4m
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:07 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ92-00072A-Om
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o15-20020a17090a3d4f00b002004ed4d77eso4704029pjf.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZBm3nLoiUBu04kY2LVi2GbBxIBiGqU5xHs6XU99y0Yo=;
 b=JNktW2HrQrw0Dani8CY4KJ/fzN+hIqaH5I783ieB3f03BqUMk9bi4KeSoyjUkCCrjx
 WK+0R6S3MyksTPQE0w1fkkRtPWqMvUH7bnr97b9gnuuEJ0gaN970aZCdCx9rsTJZH0Z/
 7okcXG/ixW9nvp5YpyCKB1XnMzPMCQYEZ5RAnOxbzeskkbZtdC5Pj2Wf0p/DqXoGD1E7
 zBE/wT++WZzFCpiLQBOwqJEDW7M4IKVAkx2CHLIlL96xRCCOnCstH1u3tYImX4nZcXcA
 bNqPsWqYp7RtqyUx5EkMnkudqJE12v0wyy+FHe0XlNdgHiSLqz3FawlgRquySFzBLoPN
 Rx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZBm3nLoiUBu04kY2LVi2GbBxIBiGqU5xHs6XU99y0Yo=;
 b=i7+mTKwTRD/Ee3DfKsveKl0YkKr13rAl9hiphsx81bCwxAfMjoa45/AiUFZVOW5qEI
 l7tiAlhqxzFYuvS9xfXMVHvDs9/LafN1D56gwnh7PP8uLGXhw44hvHCOoHBKQawZXavH
 khGsyRdSY08fV+VYpdjTFHsHqikXCY9iXJzyGgZpawP/Gh17jQaYS7b5s43ot5/DP3Nl
 +9c6kV5junGMQVu/mY5R2w4ixKxvl09l9VBVroYcpNQovs1SQ1eMdKpaUxiZPfbGTTTN
 2YAvmB+bO4pk2/8tzb0oAKaCYcPGz/7xCvq9fOXbyz9gYvoRPvJrvWQ28R6+9S3lVWJX
 1WBQ==
X-Gm-Message-State: ACgBeo1zJfZ3QC3nJkhxIUBNq0OR8wdOwpbqgUZEgeGXP956UPvc9s4S
 HYjKYsM055f1W2mf/ZHiMjUmiA==
X-Received: by 2002:a17:902:6b84:b0:172:f7cc:175 with SMTP id
 p4-20020a1709026b8400b00172f7cc0175mr50864072plk.158.1662438303483; 
 Mon, 05 Sep 2022 21:25:03 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa796aa000000b00537f029c94bsm8724967pfk.183.2022.09.05.21.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:25:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 1/3] hw/arm,
 loongarch: Move load_image_to_fw_cfg() to common location
Date: Tue,  6 Sep 2022 09:54:49 +0530
Message-Id: <20220906042451.379611-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906042451.379611-1-sunilvl@ventanamicro.com>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +k0uJCrSy/nm

load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
function will be required by riscv too. So, it's time to refactor and
move this function to a common path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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
index 5cc0b05538..eee2c193c0 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -542,39 +542,6 @@ static void reset_load_elf(void *opaque)
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

