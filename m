Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2535060ejh;
        Mon, 5 Sep 2022 11:33:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zeUArWzUNIl66ipExH6OLzB2FawJe1Tlb9un6pIRoT9SYfOG6mF+m7NKF5ocMzo/Lae+C
X-Received: by 2002:a05:6214:2a81:b0:473:af82:9a95 with SMTP id jr1-20020a0562142a8100b00473af829a95mr40970489qvb.44.1662402838235;
        Mon, 05 Sep 2022 11:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662402838; cv=none;
        d=google.com; s=arc-20160816;
        b=fnJMku1qYzYLm+JzKWZjeYcoU/sh2/Gnu01xiM5fTUzt2dMXUbNirjfjCMokkLzLw+
         BDnU+QI3y6aB6ZISAUunnjxWxF3JFf0+DYyhjkxujr7CPqtLD25g8ijMLGKuQ0G1m1DH
         c+NBoWNRd0go/yhZBu2MWpmfMuGt0Gxy3g2Nm6E0/942eJQmot9lm4Q+tHqtmQ7S3DVV
         bAPjwH13alUhZblPrelTRx84LNFkTGE6PYb9W43RhlHvVgZjE/XTPksrtr2r7Uztf75M
         ZiHgijh0MseYKKMUhqQGlDrtMmiiYMM3NHnMGB4S89qPrTorNyYqATShv//iFop71cBV
         qzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nOmKJ9C0Ic7pbA3XrY/urXuMZM/kB+XJyZpt6xVFVH4=;
        b=b5AdPnJ4Trj0AlRCkK5Ha1GUe8waeBDmQCxulPIV/uPiVRENv8E5zqw+LT62PvtGA4
         WDku1mb2UKZ+U2lw4BFES2pjOCEdM7Gk4lsOD7s9edG4f+z8KF7DbF6FW1nYabQfYJ5x
         U7bz12UtT73qpurJav+m9PkQVMrB1U4Y0Ks0IYZu96Lwc859ZQ61ub2XD5R1NYO6jwFS
         zDu8rSJdKIq089rgncnsJ4zMg6jvltJH18DjFJLBHoJIu0fSFPjvHLcK0j1NBgO3Id6E
         1GLo2f1ncDnJC1BCos7nic+O61s0933QlIBvYHGT4XwkRpBJAlNtRdW1Z9kH9Wcw3k4o
         C/nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=bILOzOcj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u40-20020a05622a19a800b00344542b5d56si6783572qtc.402.2022.09.05.11.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 11:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ventanamicro.com header.s=google header.b=bILOzOcj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVGuz-00036L-NL
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 14:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkl-0002DG-Eo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkc-000276-QD
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t6-20020a17090a950600b0020063f8f964so2410035pjo.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nOmKJ9C0Ic7pbA3XrY/urXuMZM/kB+XJyZpt6xVFVH4=;
 b=bILOzOcjQv8WmX5zuZHALcuK+EsBhhAcV3ZAm0jP3WQ/mKzWbGo5kLNGkbrZLSROdY
 Nhk0CxsYuqHuLLqwg5NEmUUNv4GTsJyf7VIJUWEoVGB6YS2Ak+jfHPh553TZrrsoE5As
 FJqiG3nPXhvDpUYyeg1ll07f2skCXgkpTyCkNCHOh6/TxCA4oFKEKKUJcbJ6kvYLo3Ry
 uC2+OH7swqJydrfqmpCHXUWI9q2tJRH7Wg/sQfoVfGPy/g2ZHLcEjzTb86r4Iv0krmCM
 k65xDxq9dROnYFOsPzcalzuv5oVHIgvBTPQYBt7nHgLfsOEOAbYfOEZL+2TEJGt7Wmb0
 SQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nOmKJ9C0Ic7pbA3XrY/urXuMZM/kB+XJyZpt6xVFVH4=;
 b=J430mYPpBEzxdDS5N5K1CjdowVw6SYH78kN/+/AhBeQJVYZyG2qYQWWBYGKIS4st9q
 2A5hdpnmgO8l2IAB3JBXY7s1Pq7y670GrapkC1FbdYEMqI+nRCdwFSg5Ng23KqQXC/WM
 fO2G+WqUPD6AKxdBb6AYo5Ber0mtB1beqUkqjSmlclIDHn1M4WpR92m75YcAoEuqlnq8
 UbTAP8kF0swinu/hXSxn9Lj460XwwKZ5AQkp4VLSGCSmKigMlp/+Y8Fm+3Or2YAheWCO
 VyQiYsnmsNg49aSbR5pmT22CxvWOzgQgatwIBG8H7E8pm/rou/IA2NPCIGaB0HqVXt+/
 qPIg==
X-Gm-Message-State: ACgBeo2kSZfW2skq8vgd5KJEWp9T1L4uK+wqpjtccIOclTih/x72EXCd
 a7DPXqFbpAjcK96KyOibAyTRqw==
X-Received: by 2002:a17:90b:33d1:b0:1fd:6e9f:548c with SMTP id
 lk17-20020a17090b33d100b001fd6e9f548cmr21370273pjb.137.1662402192057; 
 Mon, 05 Sep 2022 11:23:12 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79587000000b005321340753fsm8046724pfj.103.2022.09.05.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 11:23:11 -0700 (PDT)
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
Subject: [PATCH V2 1/3] hw/arm,
 loongarch: Move load_image_to_fw_cfg() to common location
Date: Mon,  5 Sep 2022 23:52:36 +0530
Message-Id: <20220905182238.374545-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905182238.374545-1-sunilvl@ventanamicro.com>
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wHuDjtN4ABgc

load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
function will be required by riscv too. So, it's time to refactor and
move this function to a common path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
 include/hw/nvram/fw_cfg.h |  3 +++
 4 files changed, 52 insertions(+), 82 deletions(-)

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
index d605f3f45a..3f68dae5d2 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/loader.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -1221,6 +1222,54 @@ FWCfgState *fw_cfg_find(void)
     return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
 }
 
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
index 0e7a8bc7af..066c10d279 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -341,5 +341,8 @@ bool fw_cfg_dma_enabled(void *opaque);
  *          key lookup failure.
  */
 const char *fw_cfg_arch_key_name(uint16_t key);
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress);
 
 #endif
-- 
2.25.1

