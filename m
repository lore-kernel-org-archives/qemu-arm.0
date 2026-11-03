Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF2606A324
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4yY1c5p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIH9-00006Q-KY; Tue, 03 Nov 2026 12:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIH7-00005h-Vw
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIH6-0006Pq-2y
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:21 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so2725532f8f.3
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793726778; x=1794331578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0i0p7amou0Zd3z9VGv+EcRptK1TJ4cWVBtL7CtmRmrE=;
 b=T4yY1c5prp3+ZB4Y6Shrs8x5zySkriA6tff2L+GPEaK2HrtCeX9/3MBSe1cH0SqhLd
 Agy4m9oz61eIopDLR76786jnHo9ClMaaPo1N2gqvjSHfI3hvfSgxPbh6YJivvaPbxvOw
 Hm8d7JCI6PPomn2Gns/ZOCwk9dQzN54Hz7t4yd44HrJ5t3uuvq4R6zLUVeF96tk00gYq
 0Eih5nZNnai44Ii8XDag2ReNCuT2W2XvYdI5qSpOMtWH6qho5nF677uOkNQaiHI26Fgn
 J/8oaV6+zecmWfwapp8HrklcWXKRXRcw8LRFcX25OcswPq/Fb8vmSsKn45GxhOFr2Iii
 zLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793726778; x=1794331578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=0i0p7amou0Zd3z9VGv+EcRptK1TJ4cWVBtL7CtmRmrE=;
 b=Sze/Ct5pE0FsJ+f32NhspXkA+8r9/vrGLGMZKcox6nXzev5PXTDJMwnpJDsPe+xv3g
 H++5h559YuCHC00I1raEm2yY5cgNQ8jDMJbTL1JZkyGDML6AtWrnihz43aHFpDUwVI5a
 rxykWiGGkxIa84ef+Ff5yXom/0XvH/2ufn3zzCBXSIObyb3YohrPZJsWhRaNybqjA5mK
 xlgUKKukpzJW0ynot3/MZ8Nal1eEFWwvGgE/9OepfzjzH801+buAMO4IOou7gvN18Er8
 RU+5qwLObwQTSBPaXb17S/Z9r+sLTE4DWvppoiQyfKZfUdoiVwDTo4CVsiNruz3GhZDo
 zlWQ==
X-Gm-Message-State: APuU4Z++QeyyJBOMSJqECO6dRcbA7YMODJVV06ARfCk0Hus+mLhJU6Pl
 cZJpubhRmqD/lFc9YcCikYfvFRuEwHDq9I51Fow7zcHBRvo9mRyHYjHMGMoRXIqQKU9ht2AL8EE
 3dlbttoc=
X-Gm-Gg: AYBFou0cvXRxU6nuqN0+RC0qiJB3a8XPOXyn+A/8XB/xWGR7ewqPZxnI+AC98jB3KJq
 9B96ODRZCwIbCJBX0qoexSYh/03PR3+cf4DqbOsC5E3h5K8bXRyL5qC7RcVZjr+9TBZcpALt6rO
 xnOD4I2YlgY9n9Q5sZUeZ/jeT6zq7WW2O++ZAEo5oPjXeVab3sYJx8kEuQtnbKoxScXbVHKX5wL
 5LSZSxZ5K3umPci0I6Fpo5lV0gJcvoKM0Rzev9aurHbrW4/R/6QC3T3FRQT0hC1YMRF51HA1FJE
 WRTdQMRuD/BlH5bQ3OZMnVavo0vntRzqRhyV324ZuK/3x0qJD6O6/i1gd4JIDD6TUO+h1K9bQKF
 7vHd7R9iqf34Fvhd3aLkSwq+vd5IrZ2JUQugT25fU3rn3Qqa7Ot1GvhUkzAY5D34OX7rJKJS7sD
 xQ41KxNQSmgr/kQb+QaDjBXaOoxZyP+L+nHh2gadk8xPgIjtYT1UOTS5FGNBw/QbSQFAim1HS/4
 IR5ck8ltzBJB4B9f3+Bqq16Tvk4J6f6TKkW47D6kGyRwlSzu3GXz/Yx9q1lei9Evm2erDxISOI/
 3apVR6hNwQy7IiXcMQwdjAjXpLOICWfeC88XM5uM+tSH6gwv+4XFgNs1kYP93M5WoazTuCyyelm
 xNFcb41PzwAQomKzB+KYn3hZnrqTHPEJFaA==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id
 5b1f17b1804b1-4ac182dcb6fmr311058765e9.13.1793726778183; 
 Tue, 03 Nov 2026 09:26:18 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm211082605e9.3.2026.11.03.09.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:26:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.2 0/4] hw/intc/arm_gicv5: Misc minor fixes
Date: Tue,  3 Nov 2026 17:26:12 +0000
Message-ID: <20261103172616.2400758-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the handful of patches from the "fixes/tweaks to the existing
code" section at the start of my gicv5 series which didn't get
reviewed and which I think are fixes that we should put into
11.2. (The first one isn't strictly a fix but it's also pretty
simple.) Everything else in the gicv5 series is either already
upstream or else to be deferred to 12.0.

thanks
-- PMM

Peter Maydell (4):
  hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
  hw/intc/arm_gicv5: Free memory in finalize
  target/arm: Only allow GICv5 on CPUs without AArch32 at EL1..3
  hw/intc/arm_gicv5: Use correct type for value in lpi_cache_get_hppi()

 target/arm/cpu-features.h  |  8 ++++++++
 hw/intc/arm_gicv5.c        | 20 +++++++++++++++-----
 hw/intc/arm_gicv5_common.c |  3 +++
 target/arm/cpu.c           | 37 +++++++------------------------------
 4 files changed, 33 insertions(+), 35 deletions(-)

-- 
2.43.0


