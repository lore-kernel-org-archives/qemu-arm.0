Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED2F9EDCA
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE1-0001CR-M4; Wed, 22 Apr 2026 09:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDt-00016y-Iz
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDr-00017o-Tx
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so69655315e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862950; x=1777467750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9WNiVc32x9uwc9Kvl3F3IabOVkUVJfyhaJuWqhRbgs=;
 b=gWwpYdgCVcbM2Yhiyn7T7JtxjuhoSyhO6hf0gcroWyPxYBTbaeA1pGyDwZ7XxolK3f
 eIZyNfXBdReTavrcQQIKv1Mhs4Liyd/OBAUQhlaIs/V2f0rDV+XVM9m8D7ZsZcEUl+KV
 cN1y1kvvCyf76P/MSEI4gz6cd7Q8JmT3GM94mDkJB2ChgG8pYrkDROx4FrCqR59JQzmS
 R0cu/XOAF+cMDRsdrPKqLk140Pkp4wmkXHWK9+If4V5QY5TI4KdNgd6EZLfuJbljSlKz
 6jmnuLFTJ9JYuhBBcVfK7/B9cP3ACo+8GTJ6vGtbSC+RKEvHWRYVFfvzbe0fhqqtj2vl
 h2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862950; x=1777467750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V9WNiVc32x9uwc9Kvl3F3IabOVkUVJfyhaJuWqhRbgs=;
 b=OjB+ei0mpGS2GtqnR8zCrIwQDZD7P7/oJn9cFaaxIDEcT7p0Wkv+BDLdiKQQjLI805
 gjbjIKCPLvpn2fI2rV6dW8xmxv5cCCAbW3ByERFhQil4an5/GB8ByHnP0uyZXDpo056v
 nQx0bkVQu0cipoP9ilJwCKIr51wswtM+NhfuC6aQADkJhZ+P09+wRC6VjOnfpIsNnUA8
 Ju647c38GUquMPp1SS2tQfWBwnw95mQXw+6yK3LB3xq5xO7h/5io8hdIOOxnEHXESNGK
 ROhPzeutWrfdYz59B55nICO1Zp0RRYP0i8vXOqbFp51/wIY30kX4qVypPhx1M3bbqUhZ
 c1XA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/PqNepyuVR6Y+4ewvwp98WOLAwg+2BH+qCE7f+CQnbMMMuez1cPpeZnzpnTkBxQTE8XP1zUEKCJQ==@nongnu.org
X-Gm-Message-State: AOJu0YxHM539bhXB3x/qaJhrtbAMblSvcbJRfkwXEmj2kYx1Lp9huF5R
 fN4LOb/Z5c5eHt2jqQUoXvk6qY0P6rKQHnVwGwytybuBNMYNBiTg2YB1mLWtlGlrZhA=
X-Gm-Gg: AeBDievvZ4NOHtVB0adHSpsOfiDKD1ulp7RT5o1TsQwoFF/XzEtADtLtwMK7NxGvJTk
 JQKmJ/KyuaLQ+7l5wU+45l7s5wW6sLLpfI935H2UtQP4lrg8KpGPhE9pO/Ogtk7f2cbuWvUHOWY
 BplQNfuDsl4LhoxkbgD8NSfZWWQQKjMI2G3S6bkf240pdWhb7n6lkUEUD5TIw776SWnICLcX0F/
 Mnrqtj7bc9/GnlkC9fprw2gB7ihlLxS+1uBPJqdArt+/oSxxfTUaHXzOS5qP4JicAggOA/r6Ocg
 YeGKQv9iIH11MtQnLyRnSS/hcGvNbe8ojaPMGXzs4WxCFGjXrQbzmgk/i9O7xNTkB/I+deWIAu/
 10S7Mrr0ZALvG9KyLYyQayDNZmuLqalqqcVTT7/0de5XKKLMx9FKSBQfsrCP/PMmHnpXZC471XK
 Bgc7155lPmLOP4nOGGLMaKzAQugL5ZVtI3mO+fNUKgtQwe
X-Received: by 2002:a05:600c:8483:b0:488:7ff6:1f75 with SMTP id
 5b1f17b1804b1-488fb782d91mr334374605e9.21.1776862950380; 
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74c7a2sm140308125e9.1.2026.04.22.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:25 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0269E6153F;
 Wed, 22 Apr 2026 13:52:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 25/32] target/arm: redefine event stream fields
Date: Wed, 22 Apr 2026 13:52:42 +0100
Message-ID: <20260422125250.1303100-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

The event stream control bits are the same for both CNTHCTL and
CNTKCTL so rather than duplicating the definitions rename them to be
useful in both cases.

We will need these in a later commit when we start implementing event
streams.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h | 11 +++++++----
 target/arm/helper.c    |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 85980f0e69a..dc593f1fec8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -263,14 +263,17 @@ FIELD(VSTCR, SA, 30, 1)
  * have different bit definitions, and EL1PCTEN might be
  * bit 0 or bit 10. We use _E2H1 and _E2H0 suffixes to
  * disambiguate if necessary.
+ *
+ * The event stream bits (EVN*) are in the same position for
+ * CNTKCTL_EL1/CTNKCTL.
  */
 FIELD(CNTHCTL, EL0PCTEN_E2H1, 0, 1)
 FIELD(CNTHCTL, EL0VCTEN_E2H1, 1, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H0, 0, 1)
 FIELD(CNTHCTL, EL1PCEN_E2H0, 1, 1)
-FIELD(CNTHCTL, EVNTEN, 2, 1)
-FIELD(CNTHCTL, EVNTDIR, 3, 1)
-FIELD(CNTHCTL, EVNTI, 4, 4)
+FIELD(CNTxCTL, EVNTEN, 2, 1)
+FIELD(CNTxCTL, EVNTDIR, 3, 1)
+FIELD(CNTxCTL, EVNTI, 4, 4)
 FIELD(CNTHCTL, EL0VTEN, 8, 1)
 FIELD(CNTHCTL, EL0PTEN, 9, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H1, 10, 1)
@@ -280,7 +283,7 @@ FIELD(CNTHCTL, EL1TVT, 13, 1)
 FIELD(CNTHCTL, EL1TVCT, 14, 1)
 FIELD(CNTHCTL, EL1NVPCT, 15, 1)
 FIELD(CNTHCTL, EL1NVVCT, 16, 1)
-FIELD(CNTHCTL, EVNTIS, 17, 1)
+FIELD(CNTxCTL, EVNTIS, 17, 1)
 FIELD(CNTHCTL, CNTVMASK, 18, 1)
 FIELD(CNTHCTL, CNTPMASK, 19, 1)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40dd070d2c1..81a07ca42d0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1746,9 +1746,9 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint32_t valid_mask =
         R_CNTHCTL_EL0PCTEN_E2H1_MASK |
         R_CNTHCTL_EL0VCTEN_E2H1_MASK |
-        R_CNTHCTL_EVNTEN_MASK |
-        R_CNTHCTL_EVNTDIR_MASK |
-        R_CNTHCTL_EVNTI_MASK |
+        R_CNTxCTL_EVNTEN_MASK |
+        R_CNTxCTL_EVNTDIR_MASK |
+        R_CNTxCTL_EVNTI_MASK |
         R_CNTHCTL_EL0VTEN_MASK |
         R_CNTHCTL_EL0PTEN_MASK |
         R_CNTHCTL_EL1PCTEN_E2H1_MASK |
@@ -1763,7 +1763,7 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
             R_CNTHCTL_EL1TVCT_MASK |
             R_CNTHCTL_EL1NVPCT_MASK |
             R_CNTHCTL_EL1NVVCT_MASK |
-            R_CNTHCTL_EVNTIS_MASK;
+            R_CNTxCTL_EVNTIS_MASK;
     }
     if (cpu_isar_feature(aa64_ecv, cpu)) {
         valid_mask |= R_CNTHCTL_ECV_MASK;
-- 
2.47.3


