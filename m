Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9151D19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:47:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd0-0001Vt-FY; Mon, 26 Jan 2026 12:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcm-0001Nc-H1
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:40 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQci-00005J-Rs
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so4601990f8f.3
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449415; x=1770054215; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IyBLhmWsQkr927zc3BlL2YflzrPqIWsR6t7Odl+vUc=;
 b=KJkh4Vr2LNfVgjwvwPcwtdwT2cetO/YFV7kg9EWVE2lJz4hldjoqHA1QoWvUcnIeeO
 a7UCRpTkGpoI3yd3R0vJO815253q+6P6752tJpkKBmIyRIKNXKgVLhf5ARazVCyGButv
 3Sc+F8rwgsFJvMc/6MPjDr/319MGkO3dyBgx0qqQ152wZe0Ux4or1eLlUV46q4NKdljF
 yTSJOOmZMzoza1z/Tm66+kwkFYeyquPAcIBTTK/ZjGikQkptRZGYLjktzKabYz5OFtNY
 7b+zmqQAmlyH3j2lDOWHmgQPHDsp4q8CKQ7kCQxBWym4WPx91D3XFV+2nLMC0Lxp7/H2
 AdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449415; x=1770054215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2IyBLhmWsQkr927zc3BlL2YflzrPqIWsR6t7Odl+vUc=;
 b=kUkCLlX6JbGzIMIXzsCTzCUikrQIKt3nHo5j7JtR8jpsdRARiqA+JFOZKJqcQOah41
 LNeVTqa+H/7euOkgzf/HzEYlcR6NJ+hznMdpe77p9NXYD0PCYQ7ZUhOKiESoOW51HYh0
 NCJ76DrdpnfQGWzoHmJSd1xZYuEDWUa3Yifz3lU8H8R+FDy5tEth1IsF3C5llpqUAljH
 d7gTUklrXBWLMYAK5aI8UOxts3jYZv6tThBw1Kt6MyQyh6R2M8A/f34NO4nTlsgBdNx2
 jDTNT0jHnatmJhQuwg4LRBeFIcCbdEwGlxO65HYTrUl+kmurrzu8VKAx1UlXVZNB5St5
 dfpg==
X-Gm-Message-State: AOJu0YzRN7dZmvbAEq329QzROIce2vNhsQexC7Um46jbhTp5Yn65JvY0
 b4evODKSj3YCrAnGzPdyCFEE4e1aV6cxhxSKa8RtEzISD2RmCDUu/rn3
X-Gm-Gg: AZuq6aK7ydqUYBqp0juBNLyWpwRlY9U0MuY4l/p5d33lpGk9TmIFz5HKM45YKSqJ+lQ
 iRuQZjgLsQTrfPxgYbp6AuWmSyzKFKxB+3Pkp/hLcbkAmLfI8gyKusCXevpBy23CFON3QzffI6O
 2e7cOYh7ZeVHhNurBKtdGynpi+PXraKUxtoZkvPfUIHbFboSs26/eWTx6Af3QRTNxZpmtc1TNqc
 s/fFR3EVvrb6mvecg/bhbmTGy65coFuPeTI/uDv4VAqRZ6S3kMiLyL/m8z4IgMDRxG6uG7AG4Ko
 qDRHRiQMpxTQvpfwniqrtKKtDoomZe/Pp+UrWb1OvJuYU3yypqJaoaJmk13D0kuMGVcomH4Sw8Q
 I2HaX8GocN2dsfu4U/zKbz6DVEgdclSdHcvpSwcsp6TRc7h5cs5EFT4ENssVG73PedqFvffpxmk
 FomEgmAlzwX7YtdJgG7L29gxpfuapBPQ5dD8NW48aD2k93G5Sy3kSa8g==
X-Received: by 2002:a05:6000:420e:b0:435:a2f8:1533 with SMTP id
 ffacd0b85a97d-435ca39918cmr8121216f8f.52.1769449415066; 
 Mon, 26 Jan 2026 09:43:35 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:34 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 11/27] hw/core/fdt_generic_util: add TYPE_FDT_GENERIC_MMAP
Date: Mon, 26 Jan 2026 18:42:57 +0100
Message-ID: <20260126174313.1418150-12-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 2c3f4d6b09..c0e974e53a 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -766,3 +766,14 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
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


