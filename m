Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D827EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKe-0002LR-Kn; Mon, 23 Feb 2026 12:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKd-0002JW-BZ
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKb-0000Ed-7z
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso57998345e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866167; x=1772470967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OWTRxMPzfjQP35RbB57Fpzqp0nJNEuo2Ib1GI+1oX2E=;
 b=W9pq+A5OG608byHUyTRn25o5ANgAxZKoD4SjkyB9eeKIADm6u4f6LnusTmj/XC66ns
 cIl1srlD6WnFJB50eg4RUnlbfLll04QqEMqIracqTCsB/EEXmGPGLb5BIRkzZnratQsE
 R0UT95eS/iHrCu/jv1bZWiMGvJMGrmBlEsgUN6/+ZLzoSAnLJ9r/LaBc57zKNcdIZoId
 tMPxjA9jMvp02jQZA7ZiCAhfsrkE9DVYHhFP8MWkdrCWYOWmBdUJO8twUjcITktVppqb
 htPx5vqVtr65CR8i94YubFM00JRj5bKeiRA9XsBBf53pxZmWIkEarXruTz7D+XST+DNJ
 Bmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866167; x=1772470967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OWTRxMPzfjQP35RbB57Fpzqp0nJNEuo2Ib1GI+1oX2E=;
 b=mCcSe7OEBpcsTG032OmpzDV2B64Y6rCi8SzfwiCNHtnkksjLRaAPeGuSVT1oqqKSWo
 VyNsgeYE6z364uzRvjVym7JxAr/bL8Nzy9NPO//Syy+FPs6/9BNgUzf+0A3wessquXiF
 CkzEAKOnn7f5P/QlTw/9UP5qPI3JKA5yb5tSIamOeWtTzSlNtj9BJhdl4lB0klDp8tAa
 AGCRU3LvP1DeX0kiNi3lEmc+MkJRp+53q32AfqRPm7MqW22X1Ukc+58jt2NuvjfvsG3m
 fk5LapQyhaEa9ouFn9kaUW1JCSEypzDAY14S6egcB4NxX+km6LUNomdR3j+PjY+ItKdx
 0jUg==
X-Gm-Message-State: AOJu0Ywka2QeLPeJpQE+ZQpGy4ThuC0bjeqTJfSBzz7khO9MRiEwFVa2
 tFspKHPGEFp0aog2yiVgg0RHLLFNN5IjVCFn6VZMRqgkUV1/9aR0xx0BkcaPtdIg7uP9NRhTGYE
 tg2bm
X-Gm-Gg: AZuq6aLdpMoOxkseuX4GsYXWnUBGdRyC0/yI8jj1mrJZSGm/Z3pbbBT/UmTz98Gxujt
 PN954S/fEoac2h3EgiqSZ8mYbUlArGicu1pT3z/f1VESlKgt8G9XOju7kcOMZ1QwF2hiMjjiPK4
 jYeOxozc2gHLPJ/yoPUeAiul8eAV9nJvustX4lZb4XXN87D7kkQxLVsKFQzvok+naEKqWxRXUt6
 paQ22iI95F22uqYQjbhEFpOCMxAHls1gxmxcG3CwD9Pqomd7x+xXQ1XNDTtSW5EMU80CeRFRrVT
 NwFWm/jJX7qgKWElSRcuho5ynyi5E1nUrj358XmeG7y7P7LRudhYgMr0dyrLb+YRZ0dBEiXCkup
 tJtGrlyg5vjTIvcS/bduCOyzReOLcO6a6scrVQiX0MvWJRQft8uFdj9RaQJOJD2l6oxUXajLf75
 vVq4sfqggjCGJodq/QlNRVM3tTRbJK3UB0yjk0Egmw/Zj+oGXNGPIFerY2G4BNBS+XSA8Sp9zWb
 iC2qgL780qtLy9ElCPu4fJWNFBfPuY=
X-Received: by 2002:a05:600c:c3cc:20b0:483:afbb:a064 with SMTP id
 5b1f17b1804b1-483afbba23cmr77215115e9.1.1771866166714; 
 Mon, 23 Feb 2026 09:02:46 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/65] hw/intc/arm_gicv5: Implement IRS_CR0 and IRS_CR1
Date: Mon, 23 Feb 2026 17:01:35 +0000
Message-ID: <20260223170212.441276-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The IRS_CR0 register has the main enable bit for the IRS, and an IDLE
bit to tell the guest when an enable/disable transition has
completed.

The IRS_CR1 register has cacheability, shareability and cache hint
information to use for IRS memory accesses; since QEMU doesn't care
about this we can make it simply reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 14 ++++++++++++++
 hw/intc/arm_gicv5_common.c         |  2 ++
 include/hw/intc/arm_gicv5_common.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index d1baa015d1..5f4c4158c4 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1040,7 +1040,15 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
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
+
     return false;
 }
 
@@ -1118,6 +1126,12 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
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
 }
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index e0d954f3c6..b358691105 100644
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
index 5490fdaf8b..00b1dc2b45 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -85,6 +85,8 @@ struct GICv5Common {
     uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
     uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
     uint32_t irs_spi_selr[NUM_GICV5_DOMAINS];
+    uint32_t irs_cr0[NUM_GICV5_DOMAINS];
+    uint32_t irs_cr1[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.
-- 
2.43.0


