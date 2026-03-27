Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980B10ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bq-0006UT-1u; Fri, 27 Mar 2026 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bn-0006Ra-6o
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bk-0007rx-EN
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso16260495e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610234; x=1775215034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hk6a1v8L3spC6OyBMcpBGHvcslrItUrS5/6IvS68Vw=;
 b=QUlhctwmiwAj5MlUVWsA0VMz1ytCYF7MRg8L25ZFaufhHdTfjBzpz0COl4wrMWzVhv
 77bjrALIomQ7KLwkO2snBK6/Fy0pZMcZaR7kFECZpIFH/KBckUkr52DcS0ov/nnge8Kr
 QVX6NmgKnl69EDMLwqaN0p2MZV+M1AWYRYZi+aPyAO7GxnAHDBhTlXbMuc+PLHUaZHl6
 vuXKdi62kBk+m/pGpKo5b3HmzEngcaJ+9jYAUXcVFLIieEDwQB81rBWfQgzkTNz611Im
 qnwhRN5SZcvnQjjD5HNDw4FOTXkZxMgNy31FWRX9HNreuRwfy6tVoEK7HYHOpkzlKs+I
 vUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610234; x=1775215034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0hk6a1v8L3spC6OyBMcpBGHvcslrItUrS5/6IvS68Vw=;
 b=Y0/EqzvXaYXTfcR4Zax/5J+trCw9RdrWfvDmV/9zIerOj18QpWSrILLBBj+DayffGa
 vz0ShGAvxmqLnCJ79BPPrnf2UhVv5EmsdUao2IXzam0MieGZkLFGByl7A0glP44bCqAT
 S8+aZ4XBE8DxSrZgPItAGf8QE98kbWOuFuWUj5Xwo/9lprT3hYlUwW5lH6ug89TyuHHx
 vyvhaeER+iJVTgLE8S+J8hjvfSAx06YKTz2ktDNh+pVOl/tYaNSm3kAgF+PAWgBOiPCG
 h49iYJ55F1+i/uwsE8KO+oCwZW2TYNeG7Um3wttRuovDe978lp3Mu1P9WAsZmO36r9In
 6hPg==
X-Gm-Message-State: AOJu0YwsRm1FpMhMSi3R3Jy5o2xbUeUVZNJ38HcpZmQpTGozl2aKQTKN
 Nxc6A+vcqU7HBHnJkbG6lpeNp55s9zhhNN2iv3KD/J4FZI53byF3IbL8sg2hX+NdidVF9MscIpt
 BuPJnB08=
X-Gm-Gg: ATEYQzy2KH4364w0VBf8j89Ri1dqN1fKecWsrGsjq0vCiFRm2MZC1vP1wpPhak6vkOi
 8mVA/hJ6DiXPS8LTOskCMRGMzpNepvkwCwM1rdgJvKZ5DTZFmRiPSZe0EqN5QPF9wlHyWfioe3K
 g7+wJiNFd8ZhzD9vP1id/iyEzzsdqTpral7Uu9HsmY2MltWo1lVtxely2QNOpM4qAwKMLb5ccZW
 1cGwulrnou9xjN3GrU/i2EgNAs4yez5JNh6hrq4/r1IxgSdejCzNihpp/bAG/GHVwo8xJmV9d+P
 OaKKGcZhOnFpJoJzl2hjyBup/AYYH3qaaAeLpCLMLZi2Uj9wLlf6+GyTnVz7L4G9qtAiacyvslP
 fuABvby01PN6ElydYo+mVpArQiKsJCTtYeUm/1M4gVZPlf8tx0JN3jYKBPF/ZIlxsD1DvfSeKf6
 Cbgs5SuSF38dGlCihDBvMMKgSycS13tMOztdX5GvFxQEBJYY0EOzo8KWPX5r07PbwRWJzDb3IeG
 ULPSUwOs/YS5q+5C/Y3nTNONnzOUMcmJYEz7Phv/g==
X-Received: by 2002:a05:600c:8207:b0:480:4a8f:2d5c with SMTP id
 5b1f17b1804b1-48727ee4444mr34500275e9.29.1774610234518; 
 Fri, 27 Mar 2026 04:17:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 13/65] hw/intc/arm_gicv5: Add defines for GICv5 architected
 PPIs
Date: Fri, 27 Mar 2026 11:16:08 +0000
Message-ID: <20260327111700.795099-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

The GICv5 defines architected numbers for the PPI sources like the
generic timer and the PMU; these are different from the ones
traditionally used by GICv2 and GICv3.  Add defines for them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 include/hw/intc/arm_gicv5_types.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index 49dc1d6e95..7d23752ece 100644
--- a/include/hw/intc/arm_gicv5_types.h
+++ b/include/hw/intc/arm_gicv5_types.h
@@ -25,4 +25,24 @@ typedef enum GICv5Domain {
 
 #define NUM_GICV5_DOMAINS 4
 
+/* Architected GICv5 PPIs (as listed in R_XDVCM) */
+#define GICV5_PPI_S_DB_PPI 0
+#define GICV5_PPI_RL_DB_PPI 1
+#define GICV5_PPI_NS_DB_PPI 2
+#define GICV5_PPI_SW_PPI 3
+#define GICV5_PPI_HACDBSIRQ 15
+#define GICV5_PPI_CNTHVS 19
+#define GICV5_PPI_CNTHPS 20
+#define GICV5_PPI_PMBIRQ 21
+#define GICV5_PPI_COMMIRQ 22
+#define GICV5_PPI_PMUIRQ 23
+#define GICV5_PPI_CTIIRQ 24
+#define GICV5_PPI_GICMNT 25
+#define GICV5_PPI_CNTHP 26
+#define GICV5_PPI_CNTV 27
+#define GICV5_PPI_CNTHV 28
+#define GICV5_PPI_CNTPS 29
+#define GICV5_PPI_CNTP 30
+#define GICV5_PPI_TRBIRQ 31
+
 #endif
-- 
2.43.0


