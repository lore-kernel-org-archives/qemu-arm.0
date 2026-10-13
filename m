Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD613CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6C-0003iz-Bm; Tue, 13 Oct 2026 04:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY40-00005G-Dm
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3w-00081q-Mz
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso30879555e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880843; x=1792485643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=LyvNqr8B9XOZSvfVbX8GBWpCDEyy4RrMQ2ufgi9wdS0=;
 b=mV+uUH8LcNXhOtYSCvzkYoE4rtPIr3rW3cNlWbMl5slFDIdkUL5JoQ5rKE+IfhjVqQ
 1jSeRdb1fEf6u6lJFfFj0L7A9Nv5xuAZGnQ7vTV8zUVK7wDgZCoo+c84By3dO2tyz+ei
 i4bNONY+ptd+o1cjGESQDf8mW+dBee2BMI0+socf/guRYusprbsaIkcENWorK89Ougqb
 Mj3fSGv2l5iD7YjBBZ0cZ5ri5r908sZ87TnKZeGUrwaWh/Sr6uXHe1oaXsel+n0fPby3
 MrTs3ACt7WGzX1Cd5bFTo45MmOTFYDo4mP/NJxPrSKlOExHaDX55cycsc24NIgJO/k51
 2qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880843; x=1792485643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=LyvNqr8B9XOZSvfVbX8GBWpCDEyy4RrMQ2ufgi9wdS0=;
 b=MF6VBgYrjiQJ7Q/1413QRsykATLMyctK4mN8g3t1Zs7hwOVxD6bg1HzCGEDZwjoo9X
 B9L/Cm3fON3OnTHoYz0EPfkekq731Re/w84f+yRe2xPnhxD+8KUrElSx7OqygKUi5pO5
 zP/iZ2nIJAiCH4aR/iLHd2cSDzaYp2nDWWcteKlom9Gbbr3OKjoR1ykXLWeKMy9+roHY
 PAkJ5cQIqapZhy0mBmOIDDAKZaBTMaQaTtYqSbrZb97J/StKVoPN252mE+4HhXAObq1A
 sWJt83NK5EPqgBKAHdTgnOf6aXH7icm6C38XKYHS9QVd/6Axk+AuCWHE4RzFhg4gaYVy
 sjAA==
X-Gm-Message-State: AFq9FYI1NQih/zW9EA/DBEdz+8x9eTjsQ+Sak2V91030oW4qY0EoOLpo
 4Ow9EKiZnmBjZu+VeaoVx8BTbA8oVhngvyYo/mKDkTYNTStreSLf/5wGYkDsqhbs/Rkm/lJnzdp
 3PFOEcIY=
X-Gm-Gg: AYBFou3Sfr1lucCdArEHxzbtea7BsO9bTzt4EXd42s6LyKWhhLwJbMp7qwJTpQ0PBed
 H+6OZ/h+UKupcwk5c56gFcRONZefGWQqxcMAeYgrq1RAbzR7Bks1to4ZiLe//DjqgFuGmt5r/kK
 ZKNKE9pcA/iQJFIski4sR1ubD0LMH+Q3+vMptndyL3Fg15gzOwO3CIAJugHGxbCUbBv+BiPCXDK
 Y6rAWHbMQ7MY/30h30g0WkDeNWmK8zf+srlzU3xnLvK8gGqO7abXrIbVONTB/fCB6vwMuoqSVgm
 QWRyTNV6wA/IofzGehRQm/dj7+8AiBnIkSQxuAz+FshDtumRVo9jXCbCzuLqQGwuE1kF07sMheO
 iHwa/wHgTWPv6oDv+SE+Ps2JGkqNv/ZxKc5cmGP+MA+lJtb+NxgTJ71zH858oG/Eys4a+EcAYK+
 G5o5r1GiI3cgeJTQPa8c+SqsNDixvv8IAjhzcwEmp/X3NmK1T0E1D5NSC2vw5b+p9jR9yAqOEf+
 NkLhGm8q+NmJkMXaXZ5LzYvVbpccNFbtaNjxmDLspkd/yH84A2g4XvHZOdh1LkZBiPmyXGvC37G
 GFKp
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-4a18e4d80bdmr223995565e9.33.1791880843064; 
 Tue, 13 Oct 2026 01:40:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 50/86] hw/intc/arm_gicv5: Correct offset for IRS_VMT_STATUSR
Date: Tue, 13 Oct 2026 09:38:57 +0100
Message-ID: <20261013083933.1024405-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

A typo in the definition of IRS_VMT_STATUSR made its offset 0x124
instead of the correct 0x214. This was harmless for our initial
EL1-only GICv5, where the register doesn't exist, but needs to be
fixed for virtualization support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv5_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv5_regs.h b/include/hw/intc/arm_gicv5_regs.h
index 275fee315b5..1d0fb8b147e 100644
--- a/include/hw/intc/arm_gicv5_regs.h
+++ b/include/hw/intc/arm_gicv5_regs.h
@@ -149,7 +149,7 @@ REG32(IRS_VMT_CFGR, 0x210)
     FIELD(IRS_VMT_CFGR, VM_ID_BITS, 0, 5)
     FIELD(IRS_VMT_CFGR, STRUCTURE, 16, 1)
 
-REG32(IRS_VMT_STATUSR, 0x124)
+REG32(IRS_VMT_STATUSR, 0x214)
     FIELD(IRS_VMT_STATUSR, IDLE, 0, 1)
 
 REG64(IRS_VPE_SELR, 0x240)
-- 
2.43.0


