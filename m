Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC4B10ED662
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CE-00073Q-LC; Fri, 27 Mar 2026 07:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C7-0006t3-0p
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C5-000890-7z
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439cd6b0aedso1292327f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610256; x=1775215056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajCMEb2lQLuc5DJ03lNLJ9KK+fIl70fxwg3ayKyNDHE=;
 b=YqXGija7U9DkUVtKOoXH4TE3QFhB4rl0WbIFdHGgb31A2uMIu6pQgYgzqCz8NA4C2P
 j+A1KvapnabGbh/gIquF0JJYMHEg1Jc94e7MXv1yRoYIGbEosYbcbGgmSP5E9cRIZ6do
 WGYRIJOPYYqLYTnp1aPUImxL33uD8KaIm3KDok1sJ+SkIxVfcyBMNbZro/UMfZ/2njDL
 /eFW8baayZTwJWeaPfmWUMe5/UvRsmUbRARkzjAhHaRIBYFVWAZknYD/u99csoBlvmke
 QdF8zrWqJRfOfTqcy6A3Bug+7/Ls0dtekf4uQtrXEheLKNQMQM9RhyLnWjTwNeJk73wC
 a4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610256; x=1775215056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ajCMEb2lQLuc5DJ03lNLJ9KK+fIl70fxwg3ayKyNDHE=;
 b=Tw/ZYXy1s/YLCVLSuE3rFqB71SwH9IaMOmDYgjx7w8sxt6acqn9G5H79Coroc0s3K8
 6Xn/rkc5uBU8IZkL8HH3iYi+dtxnBBIFOCjPH1tvYw+43cBNZSTC/9iXotCoDdH98tw1
 RHW4SfjLCF3c3pVLeH0L2Y0C/qb1M58cqVzWPFnNMn1q7i9Vm3xkw+SUnq3TiCiegkMm
 Eeslr5BHN1KVIc0hjzfd4F+buOjVMsUxQRSF3CiG8hM0RLZwab4LbgcKzk4Z5ozc4zKy
 heeAvGwEHdytWCUhLPerI/opEMNC9hA94FDh2kyNJXxXTHvUQJef3PKod5T0QPZs52xX
 5d7Q==
X-Gm-Message-State: AOJu0YywXWRRDcyez6pNfgontLfIfYtdkAtYLs929Eq501WQZYTylAmD
 1+tDOO7F4ABHOjsS0lhHPMpw3xNVDmYb5nXHvMsba1f3alVk8FDFQ9yKH5KM5ZSfXk1ZtiU0US2
 pqw35fwc=
X-Gm-Gg: ATEYQzzXWWjMuKvCIXXGsn1tumVewbjlc40sUdgkfd/R8Cw5QhfzZI1QYGifqne9XRt
 DAIqU3oA7Ld9sJkNQ4mNEhWpROBq/+bby+o+rmamRCef/F/jM6fN8I3+AY9wQaUnbvf9Wg5Ktz6
 LyOpWyGcFLanGCAlokSsYn71j60ZxLf0WdMHI2W1Ly6FdgAa8RMawm8Yg0+uGr+enbup6woNKfq
 sOuFhw7t7p1d/Znfy5AK/5Qw1/qSpH7jhGv2JK4QJNelmMiZF01hLCJL8aVc9CjM6eUYT+0+Z+r
 XMk7XumYZy0L2BueVW00FQUtWfZ382KuInk5G222ylWifr7HM/JpLx5f2N5W+WgT14CXFNjatwl
 wQphyOpsut/OjlGK28ekIKm4JodF7dYMmadwGfoZdpgEeWr5wqWd468QjOzIJZ4/ofMEWKssv7O
 nvVodBV8LGp0VaofByoX0wbqVNc7Au3WWgaxlNDQR3O2sYjqEK+A6Nk678pdx/6Gb5n0JVbqsXe
 Xd9b0Tm9jJVVCWQdtqAfnFitJbbSQw=
X-Received: by 2002:a05:6000:2892:b0:439:b744:c601 with SMTP id
 ffacd0b85a97d-43b9ea638d1mr3375657f8f.40.1774610255710; 
 Fri, 27 Mar 2026 04:17:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 35/65] target/arm: GICv5 cpuif: Implement ICC_IDR0_EL1
Date: Fri, 27 Mar 2026 11:16:30 +0000
Message-ID: <20260327111700.795099-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

ICC_IDR0_EL1 is an identification register; we can implement this as
a simple constant value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 005e2fa8d2..497c09474b 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -38,6 +38,18 @@ FIELD(GIC_CDHM, HM, 32, 1)
 FIELD(GIC_CDRCFG, ID, 0, 24)
 FIELD(GIC_CDRCFG, TYPE, 29, 3)
 
+FIELD(ICC_IDR0_EL1, ID_BITS, 0, 4)
+FIELD(ICC_IDR0_EL1, PRI_BITS, 4, 4)
+FIELD(ICC_IDR0_EL1, GCIE_LEGACY, 8, 4)
+
+/*
+ * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
+ * and no legacy GICv3.3 vcpu interface (yet)
+ */
+#define QEMU_ICC_IDR0 \
+    ((4 << R_ICC_IDR0_EL1_PRI_BITS_SHIFT) |     \
+     (1 << R_ICC_IDR0_EL1_ID_BITS_SHIFT))
+
 static GICv5Common *gicv5_get_gic(CPUARMState *env)
 {
     return env->gicv5state;
@@ -220,6 +232,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .writefn = gic_cdhm_write,
     },
+    {   .name = "ICC_IDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 2,
+        .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
+        .resetvalue = QEMU_ICC_IDR0,
+    },
     {   .name = "ICC_ICSR_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 4,
         .access = PL1_RW, .type = ARM_CP_NO_RAW,
-- 
2.43.0


