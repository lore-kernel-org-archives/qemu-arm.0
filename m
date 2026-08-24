Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05841C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:28:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyRub-00033j-UH; Mon, 24 Aug 2026 06:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuY-00032p-Qf
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuV-0001pW-5U
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so25752785e9.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787567288; x=1788172088; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dr/IjVo/gSKq6gEnuFGTi1QwN0pd8rwWarA0Q34qZc8=;
 b=ZEFe+RElCtGPL89E1/1L40kzKqAdqCDQI4KGxIbni2vT3+dWU1VMP6T5pVBBZSpCUv
 ZflQIhadb5NhaYFAsvRe5EO4aXXfI1JzR2dBwPpYhR2tGFlN2rQ40r2CE8ZyCX4aTSpS
 FnCa1N33mq6Y6Hv+fiTNCXTe8gmrPpvmyVQIRmyFd86kVxN9O9Gra6jiIerlXoDXzaWa
 y/ZnW3WXQWHBqcpx6jT2Fx1E9TsaunyrRGKeWye9m2hn7NJtyYqa2hCIgK/rvmeHJKOK
 FjsLhyWzBEllsdbGrDXL2KonZWWqUPa4bFrh4CS2/m1HKOsc9v7vf3PVu0jYJJiJfJ4z
 D6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787567288; x=1788172088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=dr/IjVo/gSKq6gEnuFGTi1QwN0pd8rwWarA0Q34qZc8=;
 b=LZKU0MTO0qPR7WiyBDjza/jDNMtN0ncl0W+Q53gFxes4K0kWGf5DrPI+Q+TQOzQvTC
 3rS/3ik44jRJZL2GF3G2wZxSvgRpnsUxMjfKEmdOXIIQcVeo0t6p0lWUqy20i0glTprd
 AECNxFAmPBN/5SWgZ7sDwu6HMM6olqLl9a9ImWdWgHoSumz2dUf6H4+nHP3x1Dmwc6Jj
 6KDIR7eA2qkc2+mN0N7CyDFZbhsfYJ+cCLSVa7DBPsrx1vnvCSIepluipofaYo80CO3O
 J1Q7rF/M7BJIRehiV+uSJ/PsUKw3aDuLtMMCtJ71cvP1WkGwgLxQr9opzX7B7jVzILle
 vGMg==
X-Gm-Message-State: AFuF++lv2M36OQumfSoY1E3+Mzl2Qpre5lwp/3ZE1bEJcA1bYmgsKCUg
 Be8xSq8FUn6UMAu4ch5RkZAU/vy6ymIC69OMPnVimTInulzd/tmv07DjvK3tnV1la9mL+eYIJJ2
 L/J1iDi8=
X-Gm-Gg: AR+sD11UoZHXpWPA3lFfAVfW78xhe3GPepCkqUPFkGGi6rQycAqG91e5y9++s4Af4KF
 rNyEXMVezX1WtExvmUM+7DEiqsAz4tPrEqL12zy3jNTKOZOrH+cVgV95d4AxISuA8UqnW3Vmuwe
 +00DhRwZne6qJ9JqX4LV58ihNtoxCNujlCZQcpLHB6cYyQ6DlwsLQRWNz0+U9nf3+savyBVvWrN
 6st9ffio5Y704wpw1QSm27a4IQqkTTXBXsn/sOmy8hRVKlNG/QL+5LOQtU3RxGjqIeVkKyglJCn
 USJCQ4wMjfEQrYsYTdaZdVZrUSEsKpDUiNCiyniqgRDZcGL2pnFwwNFhFyv8+pPonGoXeKgtpyU
 jFmaSjYYOwPsxlVxlvBuYMsqA7E1qqfEt6cat3Z0n3ze3KjZJ0IwvDCgYnjYuWYd0MxUzTjWeg9
 /Y4RHQgNHXl194N4eR/9V8Gx41ZhfEyvTkPdLJfuQrfmqbFuJXcrfvredikM6d9Xf6yQLubDQEz
 BIQqf3stdkWouvoMrozj+b7DkQKPqzV3rGL2xUftBAhuikm2KupMayDunuQqwzsO/OvZg==
X-Received: by 2002:a05:600c:c113:b0:499:bf0e:95c8 with SMTP id
 5b1f17b1804b1-499bf0e9606mr211342485e9.1.1787567287996; 
 Mon, 24 Aug 2026 03:28:07 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499c355e6d1sm77730095e9.6.2026.08.24.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:28:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/intc/arm_gicv5: Minor fixes and cleanups
Date: Mon, 24 Aug 2026 11:27:59 +0100
Message-ID: <20260824102805.639072-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

This patchset is a compilation of minor fixes and cleanups to the
GICv5 code that I found in the course of implementing virtualization
support:

 * Various in-memory data structures are defined to be aligned to
   their size, even if the guest provides a base address that is less
   aligned
 * We had some extra blank lines that didn't match the style in the
   rest of the file
 * We were unnecessarily extracting a bit from a raw register value
   when we already had it cached as a boolean in a struct
 * We weren't tidying up our allocated memory on finalize
 * We can re-use arm_cpu_set_irq() rather than implementing the
   set/clear IRQ/FIQ/NMI locally. (This doesn't matter much for these,
   but VIRQ/VFIQ/VINMI have more complex logic in arm_cpu_set_irq()
   that we don't want to have to duplicate.)

thanks
-- PMM

Peter Maydell (6):
  hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
  hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
  hw/intc/arm_gicv5: Regularize spacing in config_readl() switch
  hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
  hw/intc/arm_gicv5: Free memory in finalize
  target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set IRQ/FIQ status

 hw/intc/arm_gicv5.c          | 67 ++++++++++++++++++++++++++----------
 hw/intc/arm_gicv5_common.c   |  3 ++
 include/hw/intc/arm_gicv5.h  |  1 +
 target/arm/cpu.c             | 14 ++++++--
 target/arm/internals.h       | 14 ++++++++
 target/arm/tcg/gicv5-cpuif.c | 35 +++----------------
 6 files changed, 81 insertions(+), 53 deletions(-)

-- 
2.43.0


