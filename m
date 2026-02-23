Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC27EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKl-0002UE-AZ; Mon, 23 Feb 2026 12:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKj-0002SZ-Vj
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKi-0000II-Ga
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-483a233819aso44122745e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866175; x=1772470975; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2coO5QjLP0oc9KsM/+Txuq5tlHPzzz+22aLdjZKCFt4=;
 b=dX5AqLE9no+lJnT7gDpDuUtKBcrO3oqUkTMOSREbhBJ8wegbyuM6ZMoPGn4JTQD5ih
 eZ22f2CKuS7fVN4i4eq1n6v/xC9hXpFjtHWCns54aznJL3spTIGDRGiwsXUJ30Q7f4aV
 /2j89PnYaPl35iKR28XmOoslnE6PDlNvOTEIRqIOw/X1X2rmkqF5fHdtKlkUQwJbTZy/
 C1Wo4tgkMm1GymianykMLjmL0WaHwAuSojnPD22U36pLIxDGoDd+xSulTkRIr/JiVPK4
 4bWZdRtcYXbRycvy82nLHbZQ1AFbJl7R1Oje0qSg7UPwSCJ4qTYtr2cxMrQSeXVEa9w3
 3rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866175; x=1772470975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2coO5QjLP0oc9KsM/+Txuq5tlHPzzz+22aLdjZKCFt4=;
 b=rdepAcovJW20qxpkbvpSdDwUK3iKOzL8lbQZlcne0HPsN/owvusd0ylVL9SmuqvK7t
 i2jjNF7Xdli7ij6Z6EzlWB1FA2KeJLK8zB0cLSNIMQd/Aby3idf0nmkwY6j4cbfuJzjD
 G6yPRiLUQvJEtwaxkZeLzb6Ceeaqa/TyJQEdtYAqBzpGp4HAUOePWHocWg9gdshOrnfF
 z/3GRa3Xfks2xDErvZS6OLrSVV5niBExqEBOcMOmd23BHUb3b/Lwp4w6ZziE7honyk6b
 AQ4ptX/Bm+FadYD4wIYZqLXYujgbXEZBzBtl8PAoH8jQrmZcAPgOx5Q1DLxKijvtvfGg
 jXMg==
X-Gm-Message-State: AOJu0Yyeon77oCPw7hIqU/zgNT4J5uDtmgmV5Zq28/Wvf1FsLzAL1L9T
 lpwAJn4g7TFYO+SQ1S1bVYHoDqacJ4FDUnWWz7347KEL7Ccs4YgAVvE0lFoJdQILb2pYaDSx53q
 /fdlt
X-Gm-Gg: AZuq6aJBGqjcvVeJJ7ezHlFh/xzGG+wNptMGV6T4hlu0Z/be81Ug+XtmNo9mRWRzVl/
 yupelpAwYk2jW0FCETbyoo/XyN6MpDhsiIH42qwdm3YhVIAvlk47U1agmV+3ZaQLQf+y9uzsuQi
 xbycxanvyBgxP8iJDxAOrlfc7eT+oQ3OE6YN9bIgQaZFwjk8T7Tm9k6VCAdhMrutwTJqh+0iKy2
 HO5TZLv19cEhqqlzfIQkd4O7MoY8iGhzxlkk5LgaSMrz+3PUCqQyMYHVm2e0EOE5ZuwAvnid98J
 wDlpihVvFe94ZbHFo/NESPADhkh9jV/3JY3hmYP13mXwsbDl+vXIF5Gvvge3G21lHDaNzYdEAY1
 dWKlDt8JFolLGywWQIr7n7Q1wHspHsaFMO7bexMjcG4DTrPjUY5rIOnKyP9kVoqvC2Cl8GUn85h
 kZxIrbhKVZ/ElvINWt9aGAtjpFU126ymf5GcofD8ax3Ots2EPcVXnA0NhlOJpX/sjF3HZX6yef7
 HHt5/djqDF1gKILNrnN10KQ8YNiX+oo2Z5UA58zWg==
X-Received: by 2002:a05:600c:c166:b0:483:8e67:e696 with SMTP id
 5b1f17b1804b1-483a96088eamr162999475e9.15.1771866172677; 
 Mon, 23 Feb 2026 09:02:52 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/65] target/arm: GICv5 cpuif: Implement ICC_IDR0_EL1
Date: Mon, 23 Feb 2026 17:01:41 +0000
Message-ID: <20260223170212.441276-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

ICC_IDR0_EL1 is an identification register; we can implement this as
a simple constant value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index c591e249b1..36d1c196a8 100644
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


