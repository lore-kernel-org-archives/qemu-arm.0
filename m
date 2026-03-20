Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB21098782
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:07:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYk-00038I-6o; Fri, 20 Mar 2026 09:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYa-0002z8-5P
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYX-00065U-SL
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6686d06c411so2990635a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011983; x=1774616783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQk5EIWS/k8f7E8VJ5PddE89ZAccPM8Fu5MsTCn+yFg=;
 b=wwygJhF1IvIbA+AHsqfid4zxJWEwpIPd8E/mYRUVsNIxKyBqoW99e4/EQXkKtJdbk9
 b3DtXyZhrFARu2FQQK1ZesoXHHStd1VC7pcdCcZAvGSE3d/WUGK6el8xgonnCRNGukwW
 CyHS1wHHjX2K6JKJg/a0SiwE35JlTU7XmY7yyIli+PXzjpw79IeK6qMPf6Aps3goHV8n
 qnIND9TarmcVDwXMdtY+Zdm6FX9WzE5IAiNHB41NMb/j4O/vv83x59IF0KGmm8+x5y2p
 DPx1H4Os2wpTWwyy9uyu/YDGbqaxaHBggaEDfy4T5MEd1FRVDLqiQbs/Wngj1LTiTMG7
 kxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011983; x=1774616783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQk5EIWS/k8f7E8VJ5PddE89ZAccPM8Fu5MsTCn+yFg=;
 b=AoEPxm0WEjNrmJJ0cKbNMjM0LB6fNKX4pO4U2y+wpAbeXdt6uIDSTvaGB4TpUgucqE
 rVAP9cLOv1tFZpz0W00on5rudYBYzs3wEgv13Plm2Su/HTMhzE85O+6qPPUpfi6kI9T6
 txfRfTxn74TFFwH1JnGM7GbhX8hCT5zm/6myvUYjhNbx9up1AJ9gnuEJ+gyakhWRDjQ1
 WTnRo1EkVWFUMWzsaOQbCf2R2wL8Zlv6Zp3EZ3Pxvn3tYQIAOpqMeqY+tQHSoNLirWbI
 Ql2wrcWv/RFyR4CUYsBX6Dg8C65yJHYt7rvbNkZqxvslJ2TnQHkwWvXYKmEgotoTp5Rj
 cWrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtLrmqtGaEb3m3yLsRS0TZ0JsTGbIzVJpxSqq5/dOS3FJuSL0Tlv8fU0YuKlsHR5iRsDCLHOnpng==@nongnu.org
X-Gm-Message-State: AOJu0Ywvh5GxdQOl4tJYI1OTMGMeS3uvZX4+ZExlaQTGQQMEDXmQ/vG+
 lpik5R9mLVkzBHSkAhnPUZXPzt+HQF9b5s1Bk4ngJEJlliFgpt4h2wVhcjObvojbJP4kAaxAAaa
 Q6M2w4Bs=
X-Gm-Gg: ATEYQzwY2mvrILDx6JrBKiYVq+pVY3ZR0rl7LC3FRBwweXIgsjViCu/seaCsyFY5EQ6
 S4c621KXXqT7D4NYv6+hEzUW1VmqwyzMMHqcEMmgt0Z6+IN1sTbyALFsEBDbCx5iVEotlmctwWp
 jsAfD3xggXpHoNf8eJnsHbiWKX7vWxrj6kZXKOcmAwLR/xuRwyBSJwy640hOOfKIvafWvtjdtpK
 e64JBDkqrVcTFYFZpq/4iGwrQvnAI1xinU6z5zzvVrzIQdKSXd2iLNP6Di6V0VSuEhHT/C7AQpg
 S2RSSI8NclKAu47scQeti3LUTunnk1hLHYp4uPu8U+25TKCEnPImnsx/uuxIzKLunZgASwGWPrR
 qA8txOlU7U5flbc/5Xe/BPk09aPm7Mk8FLVcjeUT4tv54bQxaNEiODLEfLOpWET/hFOTquQ/UZN
 tybVvGZ4DXTYfld6ojB/z39Kk=
X-Received: by 2002:a05:6402:27ce:b0:665:a417:3ed8 with SMTP id
 4fb4d7f45d1cf-668c9b2ab19mr2361876a12.16.1774011982641; 
 Fri, 20 Mar 2026 06:06:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668d2677970sm1350417a12.27.2026.03.20.06.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA74B5F9D3;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 16/35] target/arm: use syndrome helpers in
 arm_cpu_do_interrupt_aarch32_hyp
Date: Fri, 20 Mar 2026 13:05:47 +0000
Message-ID: <20260320130607.2071996-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

One more step towards dropping the old #defines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c4..5ee79f7564f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8898,9 +8898,9 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
              */
             if (cs->exception_index == EXCP_PREFETCH_ABORT ||
                 (cs->exception_index == EXCP_DATA_ABORT &&
-                 !(env->exception.syndrome & ARM_EL_ISV)) ||
+                 !(FIELD_EX32(env->exception.syndrome, SYNDROME, IL))) ||
                 syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
-                env->exception.syndrome &= ~ARM_EL_IL;
+                env->exception.syndrome = FIELD_DP32(env->exception.syndrome, SYNDROME, IL, 0);
             }
         }
         env->cp15.esr_el[2] = env->exception.syndrome;
-- 
2.47.3


