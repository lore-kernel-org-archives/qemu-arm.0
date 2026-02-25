Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3FF55449
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 03:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv5Os-0000lx-HA; Tue, 24 Feb 2026 22:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Oq-0000lR-P9
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Op-00036W-4X
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso49843425e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771989438; x=1772594238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DoPGvmndfJWB+ezVYLMKCPYZN0oN2JJ1YLQJ64HIOf0=;
 b=zufSqG8hNBHqRVhDrkBkJcqoYnTvtil14p9Lg6r5CpLMcUQRGOIsrWiJqm1+XOpbOZ
 t9zx6uJZdmkrWEff6V9PL+X6wlCuWN9nFwnku5/qLgMGEhRaPGE63TRixFVbaf6X/gcn
 bo4+e+03mP0JChXS+SankwAxrg+sgz8P3JxQNiJlb0HnbLQZpEzYk5K4k7IQzQ0UDGit
 0z81SJO4RJx0WAk0P3BRnVjCxu1ggrdcLgd4F2Efh//vson4H5eDaYn9UqNivztPM0zc
 jrexfdUWSxZbrXB8AQrqenp4ywbi1pf2vrXQMX9danV+NQBpT0WVgmo/WJ2pJniiL4U2
 Jdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771989438; x=1772594238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DoPGvmndfJWB+ezVYLMKCPYZN0oN2JJ1YLQJ64HIOf0=;
 b=W13ctxB/x73fdFKoD2nSPDR+GXoMXgdGxNuUHg4QTZsQe/aVR7NOp283q6lc0Gv0M7
 ytwaq2tXWLdu7tNiMcUW+2xd6TaakyZAvPrgnwye/I5GXr7GjrojiiHqnh9l7FvJe7G9
 H6rSO912rHI9X2ztmDwcoH/vlpyIGJoGveRjrNEgUXtsnLLvkgPpk3/jH/6lfU7ikgVM
 sgss0WuPXjlGy9tGoi6/gpjNTcrKmVKh3IEJlxQvawVAthotjizFNM6kYkiXL1mOBEah
 NN9QCpMCDuSTaj42widlvLCFtipz/tjejn0HJd3kUdMPWwGAUc0fe32413OEzTuvJHBr
 gCmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXznzrqJKxbeG9YVb9VhdQXFZNtw8WAEmYWU4ld/lXofqvNQaniOMFMRfRty0UU693y9qltrIPDuA==@nongnu.org
X-Gm-Message-State: AOJu0YxNWW+DDwVIIOIQTDj66jp/dfEKfAFXcU4VV3BgZfao6nacVx2n
 Uzl75nRDFKo8JNdFAZEySfM+QqQuLSR+tmfZzc1Wqp0slBLH7erMDj+RCQKS1ZE33YM=
X-Gm-Gg: ATEYQzyPEltfmMb+f2KSVBusVOhF+mPcjbJen5QXYft43Wp2y4RQ19+0jfOvyHB0oUh
 38i282xVrpYrLbZqjsGxxpVifFoMUO6gcJ+ZoZzGoaPJWiMHAZ4TWRfxV7E19/bxJSIe1T8KNWT
 puDwmpQwiiMP+e1Uh64atyKlMHh2yxhewlKHclY726iQnTvT6+7VHXO9UoelFmsP+J+2nd/4RAJ
 nj3AZ4R34Ovy9RsGZQKdJXGkpyOf5s7G/AjNX4A3QZjSfzC8YGv/pgqcshVWfbdFk0Iv8aw7UW2
 kjWZTVS+sCW7/svH4gIwlyFxudDcckiAO2u+9gkYVbRtn7KTfe4mUo1b7RgIvbOWa+0KcyvIFNa
 rdJPkxNBO2qiH7Y/cqOGxzmflv/bssfT5A2OVz2roPgDlmHxBJKDExp2KGRk/e5UhoVTGYfoUE4
 ARwfYHK0tx99t6HgGiEj/HNMbD7malxMesrAk5W/ZAai6V+njrdv3pTikKdzcd9FjHkH+omdUY
X-Received: by 2002:a05:600c:6990:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-483a95aa328mr245873865e9.5.1771989437583; 
 Tue, 24 Feb 2026 19:17:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7031f3sm37810325e9.6.2026.02.24.19.17.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 19:17:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>
Subject: [PATCH 2/3] hw/i386/intel_iommu: Avoid including CONFIG_DEVICES in
 hw/ header
Date: Wed, 25 Feb 2026 04:16:57 +0100
Message-ID: <20260225031658.32095-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225031658.32095-1-philmd@linaro.org>
References: <20260225031658.32095-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
 hw/i386/intel_iommu_accel.h       | 35 ++---------------------------
 hw/i386/intel_iommu_accel-stubs.c | 37 +++++++++++++++++++++++++++++++
 hw/i386/meson.build               |  1 +
 3 files changed, 40 insertions(+), 33 deletions(-)
 create mode 100644 hw/i386/intel_iommu_accel-stubs.c

diff --git a/hw/i386/intel_iommu_accel.h b/hw/i386/intel_iommu_accel.h
index e5f0b077b4b..d75d232c6d4 100644
--- a/hw/i386/intel_iommu_accel.h
+++ b/hw/i386/intel_iommu_accel.h
@@ -10,9 +10,9 @@
 
 #ifndef HW_I386_INTEL_IOMMU_ACCEL_H
 #define HW_I386_INTEL_IOMMU_ACCEL_H
-#include CONFIG_DEVICES
 
-#ifdef CONFIG_VTD_ACCEL
+#include "hw/i386/intel_iommu_internal.h"
+
 bool vtd_check_hiod_accel(IntelIOMMUState *s, VTDHostIOMMUDevice *vtd_hiod,
                           Error **errp);
 VTDHostIOMMUDevice *vtd_find_hiod_iommufd(VTDAddressSpace *as);
@@ -21,36 +21,5 @@ void vtd_flush_host_piotlb_all_locked(IntelIOMMUState *s, uint16_t domain_id,
                                       uint32_t pasid, hwaddr addr,
                                       uint64_t npages, bool ih);
 void vtd_iommu_ops_update_accel(PCIIOMMUOps *ops);
-#else
-static inline bool vtd_check_hiod_accel(IntelIOMMUState *s,
-                                        VTDHostIOMMUDevice *vtd_hiod,
-                                        Error **errp)
-{
-    error_setg(errp, "host IOMMU cannot be checked!");
-    error_append_hint(errp, "CONFIG_VTD_ACCEL is not enabled");
-    return false;
-}
 
-static inline VTDHostIOMMUDevice *vtd_find_hiod_iommufd(VTDAddressSpace *as)
-{
-    return NULL;
-}
-
-static inline bool vtd_propagate_guest_pasid(VTDAddressSpace *vtd_as,
-                                             Error **errp)
-{
-    return true;
-}
-
-static inline void vtd_flush_host_piotlb_all_locked(IntelIOMMUState *s,
-                                                    uint16_t domain_id,
-                                                    uint32_t pasid, hwaddr addr,
-                                                    uint64_t npages, bool ih)
-{
-}
-
-static inline void vtd_iommu_ops_update_accel(PCIIOMMUOps *ops)
-{
-}
-#endif
 #endif
diff --git a/hw/i386/intel_iommu_accel-stubs.c b/hw/i386/intel_iommu_accel-stubs.c
new file mode 100644
index 00000000000..6015e0df2a1
--- /dev/null
+++ b/hw/i386/intel_iommu_accel-stubs.c
@@ -0,0 +1,37 @@
+/*
+ * Intel IOMMU acceleration with nested translation (stubs)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/i386/intel_iommu_accel.h"
+
+bool vtd_check_hiod_accel(IntelIOMMUState *s, VTDHostIOMMUDevice *vtd_hiod,
+                          Error **errp)
+{
+    error_setg(errp, "host IOMMU cannot be checked!");
+    error_append_hint(errp, "CONFIG_VTD_ACCEL is not enabled");
+    return false;
+}
+
+VTDHostIOMMUDevice *vtd_find_hiod_iommufd(VTDAddressSpace *as)
+{
+    return NULL;
+}
+
+bool vtd_propagate_guest_pasid(VTDAddressSpace *vtd_as, Error **errp)
+{
+    return true;
+}
+
+void vtd_flush_host_piotlb_all_locked(IntelIOMMUState *s, uint16_t domain_id,
+                                      uint32_t pasid, hwaddr addr,
+                                      uint64_t npages, bool ih)
+{
+}
+
+void vtd_iommu_ops_update_accel(PCIIOMMUOps *ops)
+{
+}
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 63ae57baa51..0f058761b66 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -22,6 +22,7 @@ i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
 i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
 i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
 i386_ss.add(when: 'CONFIG_VTD_ACCEL', if_true: files('intel_iommu_accel.c'))
+stub_ss.add(files('intel_iommu_accel-stubs.c'))
 i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c','sgx.c'),
                                 if_false: files('sgx-stub.c'))
 
-- 
2.52.0


