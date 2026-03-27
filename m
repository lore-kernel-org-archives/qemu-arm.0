Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45B10ED660
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C3-0006oB-OP; Fri, 27 Mar 2026 07:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C1-0006lU-NO
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bz-00081U-Cw
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43b9d3ebed5so631542f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610250; x=1775215050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cD+byhD6HHL0QW4JTdgOkUxXSbgebUllweR4WzK/yw=;
 b=QfqkyLE8E+O/JxGhjd1pkXPe9SL+eV9QfLJnTUy60p2C7ZoepJc8vT9vxwjXdNQK3V
 zqdcC3/HP1tNpnb84LgFQQidntg8Uo6ilnv25yrb3bEH/tuCDMcv0VX36qfzrsGhpkRF
 giooM4+Od3RgNaDYrhUzTqjpTP0H+uP/Wn4H5RQTjG0aOAWV0c6Sb4XrMGuOfv9lOsqV
 wQeT6XvuVglRrOyFigs3Z9fBq8DXTybL/Khiu5J9vaVoQdZu1TMI/S3qluohy+uC9LBQ
 1oN4TwsKMGH4+pn/tXoKgfOK/Eygq7PsXfqj8i4tNzMsrXxY2kZYLMyvukp2+ytSG7hu
 sb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610250; x=1775215050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6cD+byhD6HHL0QW4JTdgOkUxXSbgebUllweR4WzK/yw=;
 b=RcS0lNErQOByIq8ZWJMhmYym3C5IQy+VF306ePymSXHSo1vZD33QY8eGY+W3pvn18a
 scMhHPtc8WfpJUO+9dfNIdnU1lkJhPg2qArRrJf2H+KYoUR17WxAIIAxmoHIiRzkdB/m
 ei3sdeLsph5FLE1SOzxkUPD4VkIXWKWhJxajHvOiQwO1iXl7e4M9DMwj3+y0dFBLXAVJ
 6+PcokW/K9Jg6MpYU/NizNu7XwG9ZqZZportwrCiInxyNu6A9aXjJa5+J0Dy0oL4ypQt
 yGKkkb6Tpdh5H19g90xhYk+xFHIMkhUggrHPxqpIQ760nwM3kRUc9ZmgzhpKu8oOIvtq
 Md7w==
X-Gm-Message-State: AOJu0YzrkOti3sds3WR3n3eBkprhdGCMMDR1+PbYC56KeXEJ4cKs0SBJ
 jfR787W+vaV8sMoDBy10VmV+D8fKTIWdeXiGNCFPsNHWvkMVsqJbtRAFD8eJKbyKuB1kSl+g1Lx
 J5jaahUY=
X-Gm-Gg: ATEYQzyE3d0y8gJilBuZTimsLtqVLHUHqDU597rMuvJCeimZd413HwewmyJ065bu7bC
 8HDcTSYuNJcWgVaSobLABMqG0ElFMetvOSLCYqKauEj5Bi1T+yvOnrA4TqLxE6l3dXQ/2SqpPGZ
 MFP5dZp2gpMzAD47lp9yUqZ08pCgU2qwwrzVQbpSmMjX4t3szv4TufRXtKhlShGDISzt7MMW+Lx
 7mPLVF4jq0Mfg9dIN3B3yJJdNIltVPoZ/UH1lEwSuAsWUKfLIwa0vHI4FmA50aG0gR6GvK9YsSm
 tLMkzpzcrpAb79Q+8kyiWquqq7Ngl1FjC6mGEo1hbX8fMbWqk09SSY9EuVwRPw+AD/f3cUXxdwk
 OPpGVZ9jAIrdKcQQps+gLvmd5opTNx4RrI1kFMXhNJeD51wkYbJBkI0VIkHsd7bw3xIKXMBZDJi
 vR1s/yKLW7zSben37fuCW2/vRU6991Mjk5INUjdUf0+VB94ONS6eMPa2PwNySUUr2zaZjpLIwga
 E0POzL3c/qRWeai3k8RmKCd39Bgf9M=
X-Received: by 2002:a05:6000:2210:b0:439:dfae:8083 with SMTP id
 ffacd0b85a97d-43b9eaad56fmr3138459f8f.38.1774610249644; 
 Fri, 27 Mar 2026 04:17:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 29/65] hw/intc/arm_gicv5: Implement IRS_CR0 and IRS_CR1
Date: Fri, 27 Mar 2026 11:16:24 +0000
Message-ID: <20260327111700.795099-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

The IRS_CR0 register has the main enable bit for the IRS, and an IDLE
bit to tell the guest when an enable/disable transition has
completed.

The IRS_CR1 register has cacheability, shareability and cache hint
information to use for IRS memory accesses; since QEMU doesn't care
about this we can make it simply reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c                | 13 +++++++++++++
 hw/intc/arm_gicv5_common.c         |  2 ++
 include/hw/intc/arm_gicv5_common.h |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index bc887233f5..3f397d9115 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1080,6 +1080,13 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
         }
         *data = v;
         return true;
+    case A_IRS_CR0:
+        /* Enabling is instantaneous for us so IDLE is always 1 */
+        *data = cs->irs_cr0[domain] | R_IRS_CR0_IDLE_MASK;
+        return true;
+    case A_IRS_CR1:
+        *data = cs->irs_cr1[domain];
+        return true;
     }
 
     return false;
@@ -1159,6 +1166,12 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
         trace_gicv5_spi_state(id, spi->level, spi->pending, spi->active);
         return true;
     }
+    case A_IRS_CR0:
+        cs->irs_cr0[domain] = data & R_IRS_CR0_IRSEN_MASK;
+        return true;
+    case A_IRS_CR1:
+        cs->irs_cr1[domain] = data;
+        return true;
     }
 
     return false;
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 0813f0ac66..b1c8ec4521 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -66,6 +66,8 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
 
     memset(cs->irs_ist_baser, 0, sizeof(cs->irs_ist_baser));
     memset(cs->irs_ist_cfgr, 0, sizeof(cs->irs_ist_cfgr));
+    memset(cs->irs_cr0, 0, sizeof(cs->irs_cr0));
+    memset(cs->irs_cr1, 0, sizeof(cs->irs_cr1));
 
     if (cs->spi) {
         GICv5Domain mp_domain;
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 61d017bf38..ac0532abe8 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -84,6 +84,8 @@ struct GICv5Common {
     uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
     uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
     uint32_t irs_spi_selr[NUM_GICV5_DOMAINS];
+    uint32_t irs_cr0[NUM_GICV5_DOMAINS];
+    uint32_t irs_cr1[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


