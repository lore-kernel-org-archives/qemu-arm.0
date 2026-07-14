Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB3BC43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZHT-0005qc-Mq; Tue, 14 Jul 2026 05:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHK-0005Vt-Ii
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHI-0006mb-VN
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-472326ca506so3316650f8f.2
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784020691; x=1784625491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=vugWGtQq8pFEDWT6Zcaa4tHT+CIBMpUoXHLbFhwYeF8=;
 b=hResNjfzhRzsVPogh5hs4XgOxQfNZfkh1Okuy+C6DvRWQRNBj6IfNdoxwgSfLRCtcb
 K8RipdA6HtrIQ+K9ZplUhHwYe8TXvbKTh+nwrGCYqmqxSuu5QAT4hgRzjuSYwzSOkqEu
 jIfTTgHNbgFwhILl4iDiB99PfFnbkqEIpVjZfLJyv5y08UtZ/uaPYFnjJw/kkM03tcKx
 rnlKWryntXGsrDp9jr2Y0cpDXU4E/ZN+5zoK+BWKaiw9EkjGdecfBt1d+f8SBeJEUyQn
 4Fhjir8N4d1SVx95a96dI9KyUpP4MpTiMODhaRfvq23ju28hZ8f4G+DfH8+KxytB+J84
 On6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784020691; x=1784625491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=vugWGtQq8pFEDWT6Zcaa4tHT+CIBMpUoXHLbFhwYeF8=;
 b=HqA+jqE8kJJU96F+Jg6qaM4bg/d+kNC+sgRjAzLD+GzaXej0nlPVeuSR5C86vtgWL2
 dAnPjdxqVl/bIJ23RaOwufNfdmZVsCy/PzsLAUrZkP3CBPv9B6WivFqVKCALlNgeT97n
 rQ9sGwCdyClFUFPxdzgvckteZ5LEmF+3U4aOknuDvOQJnjqmQyQIVsel/1dELjt5GSgu
 hB0+cNHlPYO+e4ch/kuGh7e/WQjYL45K8O4MSeXvW0ltsCGpQtpKm5BNPUiAasltHU+K
 N4YYc+XpQAO54h+GvMtNc8CyXiqGy+8cuFFgJW78tdq+CdrJqCTpiNYhNKex9LnQUhCM
 x8dQ==
X-Gm-Message-State: AOJu0YzlJWhq6dQRWHdZ5X09otp3ZQfA7yjGW1X2ZU8+oRHLCvAi/UMo
 bghcZMH5MaG4FCUK3O3ZMNDuB0EPTLGORtra20DRxOL2g9x1JSjov+QuOPKXVWR60aWY+aaCTQ4
 94U/8F3h4sA==
X-Gm-Gg: AfdE7cliCtsv8It6rI4JiuDmCd8Iydpbu2roLdEyyVtYg8nJFt4DhxIS0teK1wiJQGA
 mAf6bMKxZtC+RDcUM2d/uOQFQIecMRJ+0CeGXw0a66gidT4r5Ayo7cJBRT1fCAyt4eZ9aWOiFGl
 36FyJmm7y/dMpUPA4ZzjngD1Py7XS1JnULjOgLxFpzCPWgNZVhG9HQ1GRMtAXMAuC9HgmIueYXi
 Vg8v/wAafUMV+ySFxWrwEOJOIP1h9BU8aWA+PEwotUG0tbncnX5sAr01HVkSE4BpK8jLVzGzrIC
 HuTy02MQJVkaPqaHLaihMPqdllV1Dej73+odikYu86fa0xgyUzJGFBnBLGXzB2e6Xuchk0MfY3u
 P4uPY36aixStV3poQCdR3W5ANnlzH62b+7OU480+IXVdlooREurww5HagbTM6z+dBAAmQlDtf1J
 xH1JO6fdjKidIP4qAVpen7BIDK5HBF9ctzRcWvVqa8dy51DQOOjBL1pVjAh3IRKnAzhZF4jQxww
 nbGw+cvglDJtSGPg+YBow==
X-Received: by 2002:a05:600c:1d9a:b0:493:c535:3934 with SMTP id
 5b1f17b1804b1-495384a43aemr22224705e9.36.1784020691032; 
 Tue, 14 Jul 2026 02:18:11 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a322bcbsm69927185e9.9.2026.07.14.02.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 02:18:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: GICv5 cpuif: Writes to ICC_APR_EL1 can change
 IRQ/FIQ
Date: Tue, 14 Jul 2026 10:18:06 +0100
Message-ID: <20260714091806.3568281-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714091806.3568281-1-peter.maydell@linaro.org>
References: <20260714091806.3568281-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The ICC_APR_EL1 register values change the current running priority,
which we use in our calculations in gic_hppi().  Changing them can
affect whether we have a HPPI, and so the value of the IRQ/FIQ
outputs.  We need to trigger an update in the register writefn.

Fixes: 9bd90bddb79 ("target/arm: GICv5 cpuif: Signal IRQ or FIQ")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 8e2a08fdb6f..a6e6c440849 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -495,6 +495,7 @@ static void gic_icc_apr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv5Domain domain = gicv5_logical_domain(env);
     value &= 0xffffffff;
     env->gicv5_cpuif.icc_apr[domain] = value;
+    gicv5_update_irq_fiq(env);
 }
 
 static uint64_t gic_icc_apr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.43.0


