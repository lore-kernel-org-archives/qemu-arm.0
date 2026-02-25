Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71477F55449
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 03:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv5Oj-0000kL-He; Tue, 24 Feb 2026 22:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Oi-0000js-CO
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Og-00035c-No
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso2334265e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771989429; x=1772594229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBFSSzCow/tWOBWocPKfqkuVJO6XeuexcV7U+ifCqGw=;
 b=exVRjbYYPux1xLWe12hQmtV12cc53Zp1m9rXzc7xCSh1Zr+yLKj4dKurTiQlY0niNC
 YanAPvpwWft75+QonpBwVHyJKq3bxWDM8T2AKVTfA5HJzIoDkQ5qmQDa2vbuc6yQLlO+
 mPUCmTfDvKwt2jF4w2egLgpH707lAUxUkqybich7pOL0DrH5XhW48bov/ndxV3mtHC3R
 mnFqLhK0S2+/lXJvylvR4ilIl3KOLUJOlTl84pzCxwDk+UZsLpxthFe7g/mEx6xD6A/9
 vf8PiSPbjxRVP5kmXXGtxb+Tqz+JNjfKV86nwO1DYJyF2wSE6UrYqQM251Sfbxzhn4QB
 SN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771989429; x=1772594229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pBFSSzCow/tWOBWocPKfqkuVJO6XeuexcV7U+ifCqGw=;
 b=nVAg06/NtJTJn8q7KNuoWp8Ce+UO857lUuhEDL8j7oZkjzYWxgmG8cF13uCR5sPyfL
 ZWf4lyXq9Byi7y+khmzuUeDvq/0vN68ALDgmnYtT2QzLreOLV1FGYkOKBEg97iVAY2j0
 0SD+LmLaitpSYKMaVH386k0kvS2UVF7IvPDlN5gnfsnbRhPWRyy0bdwfE67rWUuJCNEf
 sVKvDllunIinVDRHVPCUO2iu61aJc15yE9YjxO7RgsJ2W01pRElZ4xClgXqkHjx5vB9e
 HOrmywFmsWKzYcdYCqt1QqyXPU8FL79hP+8ZDqKD6phDEiydvCpn0iErNCJsNvOV3ngX
 ZMZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLRCVMt5gaXXowk8CNYSTYf2PPB4lZ5fjQic1mN6rGNYQFe7yPDD3HRGfdfJXYWMvoxeS3tTEH0A==@nongnu.org
X-Gm-Message-State: AOJu0YxT1qKsd237LnufqdhS7VJRAZUP4i2QvarzYVLY+t1sWJ9GrCsx
 dkQJKVrhFMzLhT4iBiW+5yiU2dbxyI6aKr18Pq/HKo03r0lB9TUwA0F/Wd9FVJhILnk=
X-Gm-Gg: ATEYQzz8yuuvA5xylPGFHU0mi+RSqY0seSDaRe4HgfzazSPkhjpyI5/St72wrIawFlR
 kfUjhmqJao3bjk786DEkiNvNL+3baIbIL6i7tSIXuayT1U3qmb/EfpJf/w3Wyigi1M8OrBqtNA3
 eHnSFgAEpXK8KhfiAcpa+MDVBqumFjAdbHACbvlcKmLJQXr+FugC16ffBgIe9GWcM98CbHuxIfx
 taBogjbnmCBUd4GrbjfHUDwkUqux6Z98+7dY+6/TTecq0SDbI2+kpEKjuuuMiOWw5y0XV2EKFiW
 5Vu+2Z7p8hCIpRopmvd3Ox8ybNLMRuV9nkA5pql8OCTq1mJ0BmQB+MY2/KWHJDpoav5r+okJKkM
 LYeK1XDqpBPCxmrmV8N5WTyXGZ0C32/dakXF1KnkyoHHzKg9vsyu9HKfUFDdSRo5zgLxzZLyc/p
 2asF2RRxQ7SPGB3r9o07+ALUG8G/nCjIJmYns5nvAQfWF2usFN5+CHmsiPLiJbviZvS1nN55f4
X-Received: by 2002:a05:600c:c045:b0:47a:8383:f2b2 with SMTP id
 5b1f17b1804b1-483bd76fa19mr21308535e9.17.1771989429299; 
 Tue, 24 Feb 2026 19:17:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750701sm41216875e9.11.2026.02.24.19.17.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 19:17:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 1/3] hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/
 header
Date: Wed, 25 Feb 2026 04:16:56 +0100
Message-ID: <20260225031658.32095-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225031658.32095-1-philmd@linaro.org>
References: <20260225031658.32095-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

By inlinining the stubs we can avoid the use of target-specific
CONFIG_DEVICES include in a hw/ header, allowing to build the
source files including it as common objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmuv3-accel.h       | 35 -----------------------------
 hw/arm/smmuv3-accel-stubs.c | 44 +++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build          |  5 +++--
 3 files changed, 47 insertions(+), 37 deletions(-)
 create mode 100644 hw/arm/smmuv3-accel-stubs.c

diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
index a8a64802eca..7e48d1555d3 100644
--- a/hw/arm/smmuv3-accel.h
+++ b/hw/arm/smmuv3-accel.h
@@ -14,7 +14,6 @@
 #ifdef CONFIG_LINUX
 #include <linux/iommufd.h>
 #endif
-#include CONFIG_DEVICES
 
 /*
  * Represents an accelerated SMMU instance backed by an iommufd vIOMMU object.
@@ -40,7 +39,6 @@ typedef struct SMMUv3AccelDevice {
     SMMUv3AccelState *s_accel;
 } SMMUv3AccelDevice;
 
-#ifdef CONFIG_ARM_SMMUV3_ACCEL
 void smmuv3_accel_init(SMMUv3State *s);
 bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
                               Error **errp);
@@ -51,38 +49,5 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
                                 Error **errp);
 void smmuv3_accel_idr_override(SMMUv3State *s);
 void smmuv3_accel_reset(SMMUv3State *s);
-#else
-static inline void smmuv3_accel_init(SMMUv3State *s)
-{
-}
-static inline bool
-smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
-                         Error **errp)
-{
-    return true;
-}
-static inline bool
-smmuv3_accel_install_ste_range(SMMUv3State *s, SMMUSIDRange *range,
-                               Error **errp)
-{
-    return true;
-}
-static inline bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
-{
-    return true;
-}
-static inline bool
-smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
-                           Error **errp)
-{
-    return true;
-}
-static inline void smmuv3_accel_idr_override(SMMUv3State *s)
-{
-}
-static inline void smmuv3_accel_reset(SMMUv3State *s)
-{
-}
-#endif
 
 #endif /* HW_ARM_SMMUV3_ACCEL_H */
diff --git a/hw/arm/smmuv3-accel-stubs.c b/hw/arm/smmuv3-accel-stubs.c
new file mode 100644
index 00000000000..b64f1e4d93e
--- /dev/null
+++ b/hw/arm/smmuv3-accel-stubs.c
@@ -0,0 +1,44 @@
+/*
+ * Stubs for accelerated SMMU instance backed by an iommufd vIOMMU object.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/arm/smmuv3.h"
+#include "hw/arm/smmuv3-accel.h"
+
+void smmuv3_accel_init(SMMUv3State *s)
+{
+}
+
+bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
+                              Error **errp)
+{
+    return true;
+}
+
+bool smmuv3_accel_install_ste_range(SMMUv3State *s, SMMUSIDRange *range,
+                                    Error **errp)
+{
+    return true;
+}
+
+bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
+{
+    return true;
+}
+
+bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
+                                Error **errp)
+{
+    return true;
+}
+
+void smmuv3_accel_idr_override(SMMUv3State *s)
+{
+}
+
+void smmuv3_accel_reset(SMMUv3State *s)
+{
+}
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 47cdc51d135..8f834c32b1f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -85,8 +85,9 @@ arm_common_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
+stub_ss.add(files('smmuv3-accel-stubs.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
-- 
2.52.0


