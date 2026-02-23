Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C51EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:12:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKL-0001TZ-UI; Mon, 23 Feb 2026 12:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKK-0001Qx-4G
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKI-00007d-I6
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837907f535so41151445e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866149; x=1772470949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sngzmWpFYqov4tsRiPEbrCo+XLB7I8a4AeFdOGirVho=;
 b=b46WDa7qPdAvTMHuoQPVU2eKaCo1w9pMyO79mXtdbEN+PggUqVE36pmuTC0AuWiFEQ
 0FaO6hLG5c5THhJNOes89tmbTEb3Y9+29dXe2BZrWPng+BE6oTptcWKuXnsTAxTeYD2f
 vHu0/gSDE2npYNInWkYcx/tkYCaTkkYF2X93OsgXcekqjaqRlKZwCefnFU9Vr6Olaesj
 eYl8tD9bF28RsgMUFrICKTYq/COBPKvHkzvWK2D1kUtQD8UkzdQuCmupVjis6Wi6f4R/
 Ur3UMhNN0wQnbYz+1iI0S0nPTM6gLqux1TEDLRs/IhMzqg9MnrEbrC0cfl3rA0uJLJ2l
 UGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866149; x=1772470949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sngzmWpFYqov4tsRiPEbrCo+XLB7I8a4AeFdOGirVho=;
 b=bMGHwJQrBOP5edHp5EV2uc/qfTV/BsC6G2l9jSjb83X5IR6J95Z/7qNeB9QtheLmPd
 a9V1OPdwaa+W1/icNAZQEIgIVUeWxRcr7f7yltW4F2R5DLq6V6oeO4GMNXTz+cFtgovP
 MnXvzMIt5Uz4vT1llNr88xiukdY42/KivbbANH59tu71oAvwmF31p8tI85gy/F+8D6Ao
 F6uOmbyK9QSJzr7Q7At015AdkPjZ3TY6dBf5ux4vgSFxDUYjDqabypzIskDYgiFvQFlk
 8346yyCpdOc885ZICwYRFHSq/AywQr3HVwAeCKIMjkxVLdp1RsX/Vk0EwJp3DmjQrKsm
 O0Aw==
X-Gm-Message-State: AOJu0YwwpCutIv2Jvlp0q9xQMxgBUi/SKG2SpylJf96tqHeKz97ZDfsM
 zIxz8K/uFnlb9U7ykNQznHiDyRf0jcJvEUx5hcZpfthOWPefaivRyiq5MP7VoYOPBo6woN6QCGO
 Dr4Z/
X-Gm-Gg: AZuq6aISLUkMstaTj0WuSHpCbY+bO2EezganoRJPPKnDKWqbHBw50M045xn0C1gqd3M
 qT6rj1WcwpZxw00bc5GA49upUk8P3dK7n8ndNFPEbcLlYwuKaEViyJ8H9z9fDqcAQiuOzUuu/g+
 5JMQt9swAiEMfc3LR2+CEv0bwg4qlgloQONY6pxMGhaZPEmtNCBZJ/APx33A77yzAH6VsgTWwOR
 hYVraKFQDlUtthMeHnu+CJN+TS54Pr03pNBe1aQDKyW0Ng7bSTiB3mOm5FK3jOSw3wnQvDHBSBg
 a/8CWJVnj4N25tPSVAvpzbkU4e3MyMTdJ3fZ5/iMPgL/pTmZ92CmMRC53VChDARjYGaAo7R3AEy
 ic9mA6AiIt01LcNk7+LvU56v6IZnrDZQV2d/k5QHvQMjJFrA4wr9jFG/IfQhVQn1xc4SVADDGHX
 Svbu2p2K4cEGlHZavC8cHDVCvyx4/QDMP3to9txQeTCB5hVr6Vn1m6qc7YIsCuJKtdv7BJdxKmG
 pU78twINsf7SiEi6RLAxC709P7/2qo=
X-Received: by 2002:a05:600c:6211:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-483a9566b78mr139437995e9.0.1771866149008; 
 Mon, 23 Feb 2026 09:02:29 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/65] hw/intc/arm_gicv5: Add defines for GICv5 architected
 PPIs
Date: Mon, 23 Feb 2026 17:01:19 +0000
Message-ID: <20260223170212.441276-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The GICv5 defines architected numbers for the PPI sources like the
generic timer and the PMU; these are different from the ones
traditionally used by GICv2 and GICv3.  Add defines for them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv5_types.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index 143dcdec28..9c7788b1e6 100644
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


