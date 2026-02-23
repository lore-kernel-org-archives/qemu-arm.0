Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CF2EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:12:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKJ-0001Pg-SW; Mon, 23 Feb 2026 12:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKI-0001Oq-UK
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:30 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKH-00007G-EP
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:30 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so50707915e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866148; x=1772470948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ceChrM7CQ4Ylberwabnc+XrtHRBLvAP4BZtWSnP7bSk=;
 b=RPf8I28jTmaDQcuIe4Sx2Z2PbVSLe173HQsfqWCDl36psZBP64lTe1E5XoWta2S/zH
 LVcBeE1f89NGlcRf1RbPifxW4RrKS2lRpl/Gfjo7yOv+mfyA1+YuP83Z3dIQ3dx82fb8
 tj3CF5oKltlMmnvczK+1BXPJaeHpUWAU9MYC1+b7xLDrO9jO0Phwpes9+uMjFpY9mjV2
 sSOmJdaC+AUpLduv/htQtZf+TkoxuuFEA7vRtfuNQwmBS/EQlsYholcEohzXIMLoq7cN
 +jm7WgsiutQIFwcU0Cw9hylj943/PnOwytIykpnuPGNhljga8NFDQ7hip0cUXyEOGWak
 ZGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866148; x=1772470948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ceChrM7CQ4Ylberwabnc+XrtHRBLvAP4BZtWSnP7bSk=;
 b=Gp70tlc6jTqUGghrbCoY/PeG7npNMfFBX1qbuBCDKOC9iLQhgb+dkAz8fsH9QIbe9B
 8/Jz5IrdHBpCD25T7OflXDoYbrFToGVaAx2jhz7uwrn15Ap7E7HGE8+Qgm1Nq1zzEP4S
 ZlkF4RfT1v+jGpfMXbZXD8dlk86NJR5uUAiwH1Z64jgxreyt8Zpgp5ywHGU3U+ZX/DHc
 SmoiIbQAWiPHxQHQvDPSUoC3d7tR5cUnHC/4abez0zVZQWMq3PjUNotI4ASARzOkXmxO
 xzbDUrwbt8v1CBbmmsdlUFBoUMkphIdqRi7miu1L9lXXfU7+aQsD3oOto0a16f3tRLHB
 zQMw==
X-Gm-Message-State: AOJu0YyC2zhFdr5cj/7LXw6X9O14nwPnljIWRBFBFf3xg2v0/zLWPMdt
 U1ddVEEDqar2ZuuVm905vKOnH88Q5C5TLtozAKo/LlMxh9iePEKQ3X7ba9gj6vmor552JO1MVnR
 HMRXGEbI=
X-Gm-Gg: AZuq6aK1uvBFT2dRPVpjVIfQiPKklib9nl+4enaNjtjo/b3Ok09fUAIWqmwwYIswBZq
 a42DVJLfPg/THjV9jgCRhSEvH/MICt+clGQ95YEN6E0SQhEk7UI+QQ+ssS5fCdv6ATNDAs1W17V
 0gUTCP2XPmHZHRW1ofkpbIaYudhiDPZRsHXpUtlFgSCZq1i7TNmSwdm4eXmw52TGYJf7KFXi9XM
 bBJTkRluuli4It2WDAuPk5TBt1N+SP2C7hpC7MmnZIZHvaLZmDH7U9uvS3/HU0/mHKbIxrKGCtO
 nqrppp0THZ6C3ZnGyUAqTESxIEHxLw24dontW+WooQXIo51uiFaeOkwA5QjjN/qTDU4voT+xLKd
 OxVS5EECJe4vHHNqPu+YuED4g2ErZaWb5vq4nmpZKRN79qeKX9qTwEh6YX50IvjABBxRbar/k5j
 JJdruLAj2y56yVQheIPsYbvTPmTwf8zt8zkfiTuj3PylWJtU1C8YLCoCGIkbigFEJphC49JOXbp
 YbyhUygvoMM2FOwJKlVhBj8CygTFas=
X-Received: by 2002:a05:600c:4452:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-483a95a859dmr150164455e9.6.1771866147947; 
 Mon, 23 Feb 2026 09:02:27 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/65] hw/intc/arm_gicv5: Implement gicv5_class_name()
Date: Mon, 23 Feb 2026 17:01:18 +0000
Message-ID: <20260223170212.441276-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

Implement a gicv5_class_name() function that does the same job as
gicv3_class_name(): allows board code to get the correct QOM type for
the GIC at runtime depending on whether KVM is enabled or not.

For the GICv5, we don't yet implement KVM support, so the KVM-enabled
codepath is always an error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5_common.c         | 12 ++++++++++++
 include/hw/intc/arm_gicv5_common.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 274d8cd255..620ae3b88f 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -11,6 +11,8 @@
 #include "hw/core/qdev-properties.h"
 #include "qapi/error.h"
 #include "trace.h"
+#include "qemu/error-report.h"
+#include "system/kvm.h"
 
 OBJECT_DEFINE_ABSTRACT_TYPE(GICv5Common, gicv5_common, ARM_GICV5_COMMON, SYS_BUS_DEVICE)
 
@@ -157,3 +159,13 @@ static void gicv5_common_class_init(ObjectClass *oc, const void *data)
     dc->realize = gicv5_common_realize;
     device_class_set_props(dc, arm_gicv5_common_properties);
 }
+
+const char *gicv5_class_name(void)
+{
+    /* When we implement KVM GICv5 we might return "kvm-arm-gicv5" here. */
+    if (kvm_enabled()) {
+        error_report("Userspace GICv5 is not supported with KVM");
+        exit(1);
+    }
+    return "arm-gicv5";
+}
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 3bffa2cb1d..7db2c87ddc 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -150,4 +150,14 @@ static inline bool gicv5_domain_implemented(GICv5Common *cs, GICv5Domain domain)
     return cs->implemented_domains & (1 << domain);
 }
 
+/**
+ * gicv5_class_name
+ *
+ * Return name of GICv5 class to use depending on whether KVM acceleration is
+ * in use. May throw an error if the chosen implementation is not available.
+ *
+ * Returns: class name to use
+ */
+const char *gicv5_class_name(void);
+
 #endif
-- 
2.43.0


