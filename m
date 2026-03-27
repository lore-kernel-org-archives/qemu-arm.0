Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6255510ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C8-0006tr-GQ; Fri, 27 Mar 2026 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C6-0006sY-Mf
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C4-00088Y-O7
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso15351415e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610255; x=1775215055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoRGta1aZeQteYUJwBZiFNsYjMFLQaWe8l3517JXolw=;
 b=SQOhzIe5+vzt44HDvuv0KqtDyxSuv67CbZHaiKIjEXJEoMt/SPTwcrC+JpRKzQcfUf
 V47KvbbUx4X86hIzH+Eifcnapi2EDxql+ByCoiRMTQEotnoPsFdTEX/B9Z2+tdh123tk
 hpf/QgeSYHuVPgmTgIWuChivx9Po/mxZm0UuQgANaZVh9GZoy/U80u9MaxB9dP6thVMT
 Go65++oX8CptrFDkXJQtw3yVvOAyDeD4iW0g9JUWSzI+bzVt8EJNjLayrt+VEVczLkXN
 ihkC58dqbEUqlH1hcq9CfguTqEPkblYxK1n5OKZ5GXG6MqJXwv4dIp/pP+iLt2Jkg7M7
 tshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610255; x=1775215055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xoRGta1aZeQteYUJwBZiFNsYjMFLQaWe8l3517JXolw=;
 b=ja6UHF0B50hWP1Hy6iO9PkbnxFOtZkSxt8/Yybt4ZOe/Tg2wwQJPxN1mmC0IYzFqKB
 mRSEVKQaQi9JHOKih4J9V+kIlLX7cwiEtW+tRpl3SmzodU5iGjer+x1YuJ6Zr7M2h6/s
 PAHTiTcCdCv66r32lxquNPsi5tXTUff2vVSjZcwQYkbwk5pLgcnUevp6vU35DqiWlR5X
 CZ1UiQvsMUOlHN+gnERUqVCdf+fkTbHDsNUWiIVmxro6iIYNNVRxgQBzhh7FJqEGJF3t
 6Hff7RzLErIYOQ22E5olciYTzPmgCrnnACtT9AiTv6KYCaFiKXVbsHz+ogZfoFsyz51I
 Ig8Q==
X-Gm-Message-State: AOJu0YzSb4GVKuft/+GW1XJ39ewrtmLXhKfsA0gsW1JY7fA/hBCH5ong
 IgipfCRn4rA5s7vqL+TWQGlHbf6TDm5D8/zMhtS01JZD0xzIS8xRl/fQR1kgyw9jm/uQImtigbK
 P9ch7S5Q=
X-Gm-Gg: ATEYQzysT+5R/RxFArJxHeLmappdE+4iSjZXxyjeHsRFa3z6b/puhDUELuW5tD4CpFR
 inpCcC35Jc50ti4zfbfRqjYuKq+Bv9xHR1q9SjyFfNo4yCzhfnQhG0qrBO5pO8XQHRVBVSl/KfH
 JTZk95HlxPtEx9S/1LESGnnRwh5efCUAr29BKusJmUQLvhkqTgDKRqbWQUQ7eJzYoSrFwcf+wA4
 ajoPBMuZnTNNkHyjABw4vRae14HW2v6wwSB16Hf/K/L2lKd1n2XuIby7x7I/6P8w4O39DXR63BR
 RXrACt2+GYGIki7zqXYdRrl2TjRX2XIzAUuQekVMjUXL7Wi2YT7kPL0IJ94G2NQOFtwxS8J2rpv
 70m7DdQlBOeZxRJTCGqU6c5mWRl9Jk3UyGmWg0JdRCE95mnxi/mqlm9ytfktuBG0ZxQ82n2NpkD
 9ckrSNSWswDnEGiC6IDuZfh7v/dlqdNgGIEeI/DFLC99KAmc5xrYaLcvWIzRrQiwaalEvkrjaHZ
 47m21bffPZi7PEZH9bkqDoCj2HuZyk=
X-Received: by 2002:a05:600c:1e8c:b0:485:304a:58cd with SMTP id
 5b1f17b1804b1-48727d5a25dmr34381805e9.4.1774610250547; 
 Fri, 27 Mar 2026 04:17:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 30/65] hw/intc/arm_gicv5: Implement IRS_SYNCR and
 IRS_SYNC_STATUSR
Date: Fri, 27 Mar 2026 11:16:25 +0000
Message-ID: <20260327111700.795099-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 3f397d9115..7b0d9e16c4 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1087,6 +1087,10 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_CR1:
         *data = cs->irs_cr1[domain];
         return true;
+    case A_IRS_SYNC_STATUSR:
+        /* Sync is a no-op for QEMU: we are always IDLE */
+        *data = R_IRS_SYNC_STATUSR_IDLE_MASK;
+        return true;
     }
 
     return false;
@@ -1172,6 +1176,9 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_CR1:
         cs->irs_cr1[domain] = data;
         return true;
+    case A_IRS_SYNCR:
+        /* Sync is a no-op for QEMU: ignore write */
+        return true;
     }
 
     return false;
-- 
2.43.0


