Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C20EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKf-0002Md-60; Mon, 23 Feb 2026 12:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKd-0002K0-MB
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKb-0000F0-Nw
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so40066295e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866168; x=1772470968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2cboAhFeHVHRYQSjMCx5mj0gc79Tc2QBuh4TMC+EX3s=;
 b=Efg8Q+WVH1W77D5YMiu/m0qADogdR8LI1wEtu+TEHZKPOgQhXwJzYkJAj9shdf6rx3
 CNe7ccygdvatoKAbISHcH8TxPcysbvrLKrGBEhbezwIu5iJ8ATfMswrAWIJ5hBzP3S4s
 gxX+8oI8FKXR6rXJ2IacEex/VaaslSLaD+9Nm/IOgIRvI1QJIe0w5Aknew8paGpXuSiT
 D6RrOm2wmbE5Tb/SWS7vSwnnqowbf16HxenVZDqBHzEi/Gbd6bawqzce3oPfmR31DjHg
 qc9Abroy+6lVTBpmT2xsOeB6S0cew8YxdPkkkT74IEh4Gop3ZdXflYLz5OegCKJbl0qv
 vaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866168; x=1772470968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2cboAhFeHVHRYQSjMCx5mj0gc79Tc2QBuh4TMC+EX3s=;
 b=vN/8CfZ8L6b4k6oH8cmcIpAw3M+cY3c8iQGJZkFfyNLMMCcziHVZRDJ/Iu1g9IVc1o
 GAfWGFMtnyYD/8hHbghZFg5/EOCgstBzkntU6jZNaDzkpyDLeBbgQCbmsyE1/aFyjJFD
 ONQu14bkO3W/izuqMflfKRZ8uNdDSzA7r4uOz3DcF/wMKlrj21+bnSqkLOh4pTrYfOCO
 SYtXyC+/0FmBFGn1P+nI5R5LnL0UTqpwB9jz/9HsXIzLRkh1NU39l16HBsjizFqg4u6E
 ZeSQlhJlu+lfHyojaP2PEKxumzknsVp2GmCun0X7IbF2fORlsrK8V0C8w+hoZD1Piy8D
 klYg==
X-Gm-Message-State: AOJu0YxTTrTNeRso+N1EUqgTe8am9LRtuS3rFR94jYS4kS35h+2cRlfa
 t7yxs71nY2ZtDVdX4gGAfjZHqehm7pOaI8wZaWEK1NdVAJ+/1AOh7Y7Yf4yCO9Nbrrdmn3oO+Re
 f0lkl
X-Gm-Gg: AZuq6aLYPvOuH+8M8JTQuJh3Bc/jmXkj3qOtYwtplFTpaccpFnMX1CpGom6avKwdGYm
 vVj2bxnMItQznCnBTYTR8y90WNUcFHL9QqIX17OTMylqOUielFvlFP3Thfq+o0CSHfolWfZno9e
 tJvCYZODrjcasNb/JcDgaQAxU8d5NT8vbAZcljBeHbFkYKqaM2GNuwsoSPP6BTkj6q9FWTihBdv
 fBP+ByMsqcAtqL5ZfagdY8Ps3fbuvM7sfaRJaSqE1F4VmOdZvZnnyRp68lwXgd1QWYNk64Hq2s/
 ENxQLeTC0zhhnRFBLDb10kmR0wY921rRGuhmeKtgDMW0SZeXeV9dwL8lmTeGDOnbmzt7Qx3K+WD
 vCEl3U66M4PRy8/4WEHs4relvLu8NqgegXUxGnS4dhtZQvt/XWEQDPoOGHs+FxrQxP15b+KNORs
 Ja1/WTOkb8mR28C0oFhkVMLpTDqHMRckLe7uE6MYSjY6mf6QP0OKNBUOLEYQVkB0aUE0Govmirv
 EKNHBST/4JwbE4rMChXMPm7/J37+eIn7lyls3j77g==
X-Received: by 2002:a05:600c:4f8a:b0:480:1d0b:2d32 with SMTP id
 5b1f17b1804b1-483a95beb5bmr166518165e9.12.1771866167675; 
 Mon, 23 Feb 2026 09:02:47 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 29/65] hw/intc/arm_gicv5: Implement IRS_SYNCR and
 IRS_SYNC_STATUSR
Date: Mon, 23 Feb 2026 17:01:36 +0000
Message-ID: <20260223170212.441276-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The IRS_SYNCR register is used by software to request synchronization
of interrupt events.  This means that in-flight interrupt events are
guaranteed to have been delivered.

Since QEMU's implementation is entirely synchronous, syncs are a
no-op for us.  This means we can ignore writes to IRS_SYNCR and
always report "sync complete" via the IDLE bit in IRS_SYNC_STATUSR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 5f4c4158c4..d0ba8fe669 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1047,6 +1047,10 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_CR1:
         *data = cs->irs_cr1[domain];
         return true;
+    case A_IRS_SYNC_STATUSR:
+        /* Sync is a no-op for QEMU: we are always IDLE */
+        *data = R_IRS_SYNC_STATUSR_IDLE_MASK;
+        return true;
     }
 
     return false;
@@ -1132,6 +1136,9 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_CR1:
         cs->irs_cr1[domain] = data;
         return true;
+    case A_IRS_SYNCR:
+        /* Sync is a no-op for QEMU: ignore write */
+        return true;
     }
     return false;
 }
-- 
2.43.0


