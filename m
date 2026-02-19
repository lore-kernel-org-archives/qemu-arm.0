Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4110CE9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:38:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57K-0000Cz-CH; Thu, 19 Feb 2026 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57J-0000Bu-3L
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57H-000302-DB
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43590777e22so635299f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511694; x=1772116494; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsEuEDN93mu6tw4kHdtM2iFgDNe7+5GS0Ac924Z7fco=;
 b=Abxkr74LpxzUvl2i51sPyGPT/IjH0TebiIn4QkzOJQy/PWLjvFqcAKUmpLqnj/DEFe
 wJWcEHq7qFYr+M1UVQ4JWb3PafMxZwA11DAsZztZRWp+HjKNvrx7TVjqhd2ywKAxZEqn
 a+N7q+W/0s3Glos34wms88PC9SFSK0rj4OI4KlJQ5T2UIjjTibjMSZyoGbzaW70hd8c3
 K3/bf+wVt4tR90xXbkDaOdygUQdMUZmB5HrMZwfCO0jGQttSIL4V3PjpSBuf/3fZJ+tz
 kR3b5FiA2OXxYEFZFzmjZA58pzZgrkC/DrUgoniP4uo1f1ud116u7jHjgsvDq3CDocWc
 trvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511694; x=1772116494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SsEuEDN93mu6tw4kHdtM2iFgDNe7+5GS0Ac924Z7fco=;
 b=dC4a6oUmPPyxgs169EQPfXinqgO73K0vqDCW7VQaKalt16+ux73aPtBt9ahV2Kcz/T
 rS4CKuiSoLtpsF7DjUj/i68in6dUinXWTQ18+YxVrwlcZDGD4c2ebShvFwlgkYENzbmN
 AU7GJr8fI/niyOhpPfC7nEPsqvcl6feRJKO9kcDK0lMpPw4baSfZvwKk+OlNPYmxZvgM
 hQrRP0lcwFEAqVgpIgloeE/utSsvUFgEWm0T0WUok3skRBa4sV2rFV3dHe+2Ch6JBjco
 vNCvia26GPSh/XtQZJkNV7CYxV2++zmOo06o/pkLGr3JntDQNe/iEQXvG5PSzhTNVgGs
 kU/g==
X-Gm-Message-State: AOJu0YwgGxOetkLaUz3JUiXKpJ14vgnmznyl4EjN9F4FgHIHC4/A15CP
 uZ3TKwa/HUHwYnVELiiKyF5cAT8TNpWfJyEGHnc2CapPoRNy3u+uu6xB
X-Gm-Gg: AZuq6aIXp3BZhEzlnfMNhhYxRRTlC/0eSKoClvF/AYVANHb34O76vMtmRsG86GLTLIO
 0OAuoyCsZa0XDrO8KYgPW2rgEoynLnraPaufG7PFbldgwm8GACQ6Apcsc7jBJiOhnEBNzfgLaZV
 oaCydECatXJMeNKQJqdTqc6PnxPcGJsZDLla8EVBukYRNuT7EySn37fU3NfREbkek2qdDAn1r2l
 odz0Vx5fCzJMFNAovCPKk9OHoQSSQ5yTxMKI9WIix1jlYHIbXmZCpadG9aI+1wlrLqd0D0aN0aG
 hMzED28xgaYfMsF8e+j1bkUJaeLDjr7Kda90c74pQTouxM8vSZ9wf/HDjp2PwmiMSc9DhdofrSh
 GhKnqLMiuOW52qbN4I4VncRzLNjBq6ybf9F4d3zbC3vRmn8/ywsBh348aOBI70WiSt95Fw7iUlw
 dhd7qm1w0fP/D9y2AialTPdobClDh/tcZbh4SsHqpaiWmlEy18PVvUoHoiWUnOk0t/O1QSWSbY2
 oY4kHA=
X-Received: by 2002:a05:6000:40ca:b0:436:1a2e:9f1c with SMTP id
 ffacd0b85a97d-4379db35a92mr36136443f8f.19.1771511693577; 
 Thu, 19 Feb 2026 06:34:53 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:53 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 12/33] hw/core/fdt_generic_util: add TYPE_FDT_GENERIC_MMAP
Date: Thu, 19 Feb 2026 15:33:11 +0100
Message-ID: <20260219143332.3316679-13-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add new FDT_GENERIC_MMAP class and interface to allow
devices to register own handlers for mapping memory
regions in device tree's 'reg' property.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c         | 11 ++++++++
 include/hw/core/fdt_generic_util.h | 44 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 43fa862f31..a9ae56d1c3 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -711,3 +711,14 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
     return 0;
 }
 
+static const TypeInfo fdt_generic_mmap_info = {
+    .name          = TYPE_FDT_GENERIC_MMAP,
+    .parent        = TYPE_INTERFACE,
+    .class_size = sizeof(FDTGenericMMapClass),
+};
+
+static void fdt_generic_register_types(void)
+{
+    type_register_static(&fdt_generic_mmap_info);
+}
+type_init(fdt_generic_register_types)
diff --git a/include/hw/core/fdt_generic_util.h b/include/hw/core/fdt_generic_util.h
index e18c4f9c8b..38086ec1e4 100644
--- a/include/hw/core/fdt_generic_util.h
+++ b/include/hw/core/fdt_generic_util.h
@@ -16,4 +16,48 @@
 
 FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq);
 
+#define TYPE_FDT_GENERIC_MMAP "fdt-generic-mmap"
+
+#define FDT_GENERIC_MMAP_CLASS(klass) \
+     OBJECT_CLASS_CHECK(FDTGenericMMapClass, (klass), TYPE_FDT_GENERIC_MMAP)
+#define FDT_GENERIC_MMAP_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(FDTGenericMMapClass, (obj), TYPE_FDT_GENERIC_MMAP)
+#define FDT_GENERIC_MMAP(obj) \
+     INTERFACE_CHECK(FDTGenericMMap, (obj), TYPE_FDT_GENERIC_MMAP)
+
+typedef struct FDTGenericMMap {
+    /*< private >*/
+    Object parent_obj;
+} FDTGenericMMap;
+
+/*
+ * The number of "things" in the tuple. Not to be confused with the cell length
+ * of the tuple (which is variable based on content
+ */
+
+#define FDT_GENERIC_REG_TUPLE_LENGTH 4
+
+typedef struct FDTGenericRegPropInfo {
+    int n;
+    union {
+        struct {
+            uint64_t *a;
+            uint64_t *s;
+            uint64_t *b;
+            uint64_t *p;
+        };
+        uint64_t *x[FDT_GENERIC_REG_TUPLE_LENGTH];
+    };
+    Object **parents;
+} FDTGenericRegPropInfo;
+
+typedef struct FDTGenericMMapClass {
+    /*< private >*/
+    InterfaceClass parent_class;
+
+    /*< public >*/
+    bool (*parse_reg)(FDTGenericMMap *obj, FDTGenericRegPropInfo info,
+                      Error **errp);
+} FDTGenericMMapClass;
+
 #endif /* FDT_GENERIC_UTIL_H */
-- 
2.43.0


