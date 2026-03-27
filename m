Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F17E10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bz-0006i8-2d; Fri, 27 Mar 2026 07:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bn-0006RZ-5K
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bj-0007r7-Lf
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43b871dd06eso1154374f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610234; x=1775215034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAtjWu5Nao9N8oE0IDX5NSQrIVlRkYa+wCz3k4lXaJM=;
 b=fEuIzeT9Afbcvy0S3qyxsdA5cq9ornsK+B3znKGz5jeRTKv45e5iAvl45RZwuwoKiK
 pznkZnQXh+/VpFAx04f4OvgudqdxBRd12ewJfA9mr2woV8f+84O2p78CjMruaq4K9+fl
 JzWbjGykapfGMbnb9n1vsdzdEpBHq07qqa13MsEGxT+fTvhJXPoc/44rvhipFm359Vq+
 bfIH5DK/zP/UjwxcgCoUh53cU/ZPHUp6jVmsG1w0YdbimOxXzfF1XjWwIRdH2Bse8R4m
 VL/98BhzemkhCwddhhZfDf7+BlysPFcgj8nOt5WhspIfj3GuRyOR4mGbg8i3sQm2T1NW
 ibfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610234; x=1775215034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eAtjWu5Nao9N8oE0IDX5NSQrIVlRkYa+wCz3k4lXaJM=;
 b=brtCUpLccgUQqyMSIotq3W1WF7YnsnER3eWTwh5yZDFPbv2odtQwNh0nwHoxCZbHG1
 lXcnvCzT2flTOnB1B5dym4CAWiGGVpBQcPGq7fJ/YxbIe/wsai3BlnYeoy1Vs2KfQI/V
 rW3QIcKAG9JtVZPm69o5FGaZpu/bs6B1wlTYk1YVpI8QjVKKx4Z6aa47sgvY4oS53pUC
 TJ4gn+ksnHu/wVqCZouauPg0aIYsFcdp+ddRphWjQXyV65pRD8rYrEKBvu1/fhOihaNY
 n2cjvBULpkUySLbdMkH1pgWFDw4C5KfRf2q8CLcLfc87nleNPM6NzTSlJS3gW3pJsuly
 0cYQ==
X-Gm-Message-State: AOJu0YyPOdMEtXa7YtHh2EUGEqEiYbXDzANu7KPzFNHWQh7DaCz3Evnt
 sfnP8yhyehU+HlXuGkiStQQBuWyyhHG4/VkFLtcO6vXzbK9QqPJRTvR0MPbZ4pZE2U3cucDZPV3
 dUKeyK9s=
X-Gm-Gg: ATEYQzzjBkDL0Xv+GKFDKzylysNz30L7MOPqmPmYw/EJ9htcDL83OfKBuD6VaxUoqIX
 8v/AhjIaq1rtLq/7vO30qVeVBQj8Z2hvq4WSymt/UyEdX8D4+3VVMLt+F9vPSh0F5Sv7U2ADwZM
 MMtBqPnoHjsLLKqltWs7eUYikJxJ6hUFkXmeU4acMnMeDWucR0Ar/SoLHT0bR98+9K0Xujl6hx+
 i0iiXcuBYMIyO6kUM0MHcQvOpqrLkSWZTgk36DbthKghlN8LHmIEbLi2NH4a09xuFC33FNICAZe
 QYW0LYYYMrCpWtvvU0C1qD3/AXAjY/gvXVVg8HM32WJ/xD0WsmiT+ATKHnsEuwqVmtNAohNnkIE
 ZCmZiOD3Cj+5ipb/i4zVsEQMlb2QCKcPTWpxR/aVlS13OUZHvzK9K9bJo+gHIVQlCUNUdQriKD4
 48oiMN2UwVi/2kO9CXgLryS6TF/g7kL7qFZN2u+df8uazRGntyuJUGBzJYHADWObNN8AeQW/AGy
 Iyga1VVCNa59hgV6bh33Zz94vul2gI=
X-Received: by 2002:a05:6000:2dca:b0:43b:3c42:802a with SMTP id
 ffacd0b85a97d-43b9ea4aca8mr3225114f8f.32.1774610233649; 
 Fri, 27 Mar 2026 04:17:13 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 12/65] hw/intc/arm_gicv5: Implement gicv5_class_name()
Date: Fri, 27 Mar 2026 11:16:07 +0000
Message-ID: <20260327111700.795099-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5_common.c         | 12 ++++++++++++
 include/hw/intc/arm_gicv5_common.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 29cc96917e..7f15e3c7c8 100644
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
index 900af53b0f..88e1b4d73d 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -149,4 +149,14 @@ static inline bool gicv5_domain_implemented(GICv5Common *cs, GICv5Domain domain)
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


