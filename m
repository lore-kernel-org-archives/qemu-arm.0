Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B379CD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 13:13:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNsLX-000375-AM; Fri, 15 May 2026 09:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNsLS-00036H-Fs
 for qemu-arm@nongnu.org; Fri, 15 May 2026 09:12:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNsLR-000771-3n
 for qemu-arm@nongnu.org; Fri, 15 May 2026 09:12:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso5933306f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778850767; x=1779455567; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=WheMXiVqmit8mEymN0nlA0kDJYvTtD1k939PyknoS0E=;
 b=bGcZuNpWBOSIqDhUPNHDX6erHAWryJPs4Ab+XvCbpn8TJ5Ltx3BR43hzQiA17WkGLU
 YjSfM4MgBsEAWJVVwVLQ33VF+tYNMRKys+o3CzNhup2JNxvQ3gHX4E+YGaiuZ+T3spGq
 6CiutanRv78K0rE+mqwx0NL0THoG5D8AhcZcdtAG7ciyxyIk4+gYFS3h7Tk1J5qint87
 Kgdq0bSOOY5LPtFXmNn0YZA3ILi8brafJHjPPHRICvFpMfmpDnSrFSqsgzTIegJllfGZ
 02XbLdiYjc1fe53DB4oRgUSjCUfM37JL679nRKNAz0wTYaAs8d1T1EvYP3aM9qfiktgE
 1WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778850767; x=1779455567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WheMXiVqmit8mEymN0nlA0kDJYvTtD1k939PyknoS0E=;
 b=DzcLGDdbbCPR0gODGT0oXxZk3IX4ZPRzrD02RNRZ7Yq2qkgHKlXln/siT2mzKULxLX
 T/rtEAZf0HuKKauoPXwrXNBa9o/41rlY4pcRyWnwZ9c0BIWI2KNMWL14h+zD+9KPWlcv
 YKmRzjTE3mhilRgW+UJd8O6eQy1j2+Vuox74OQ3jff6KqOsCARWOtTZ4Mjp8ysoa4FFT
 XUttVMwEOS5sZiOJolniuPcAfi/tuX+0+GNegQD0okcQx60oL2RCz3WRVe49d53TscUr
 K6mknFUnXn2OPmk+Iu1IYHWLSUDAih8fw3UORbKW62eUdnn92YZf425rCONLJ5+AgueA
 5h8A==
X-Gm-Message-State: AOJu0YzPEdeAPkMVToU7FCjyuzSqxL2D6TzGe9QvR+YjmmJel1hHtr+U
 jCsMaO4BVnHvyeELqfOxc2B+N+Hd29EL5E/nwlPIcTSX8KckegIVXIk6qVwaVp2fZUCXGLUMKj3
 2Rzrn
X-Gm-Gg: Acq92OHNOfl6b1HJsWLhTd86nVP8K2pjXcpO7N193rEppRBM5FGlgZQgEzVx8+YGnhV
 rZFmnyvZ1pyMt1x0MSEFFvna6mny35moXWKvyTnxk9p0OQEgpy+qjO+FiE3HBcKx/jrYDH3YPwM
 lxKCugtZOsRv6QdsshkbIFCtRb1qz1qwCDqTcc8odCZ3VZC7mBW60Idb4emYJFYlL8AXh1RESMM
 ZNuOQ5s4w1ff2/qKJ/8ocurVoTf7C41qeFzWnMS845vfN+yfomv7Ax7sVeYZmXQeU0/L1Hava2x
 kuN4HMze72KXcilGmQD/pMLilSt1QyUUX0mk3L3xqbZ7AiB6ZlxTqQGsXwj1OyQaVdroH4aqf61
 RIhoPS9g4ZETGW5RX2yu69duEpOXD75AeHLvLOOp9RCW5N7lJvMLhWDU/W22BEWwHZjreGevefb
 AJRaKFd3EtNw/I7VwbINStUTufqI1EUBhy/lmYE2ZM5KYigTYLzf3UlgpYDjd2+qARRCXf2ExNN
 IjKfSCpP3E+/IWYXbveKRubr9I6/ys=
X-Received: by 2002:a5d:588c:0:b0:441:3144:efc5 with SMTP id
 ffacd0b85a97d-45e5c5db173mr5319138f8f.42.1778850766968; 
 Fri, 15 May 2026 06:12:46 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a5653sm15339338f8f.35.2026.05.15.06.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:12:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Set debug in attrs in translate_for_debug()
Date: Fri, 15 May 2026 14:12:45 +0100
Message-ID: <20260515131245.366240-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The translate_for_debug method is supposed to return attributes
that include the debug flag being set. We forgot this when
implementing the method for Arm.

Fixes: abefca8e7f957 ("target/arm: Implement translate_for_debug")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8706dd59dd..0693d2867e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3961,6 +3961,7 @@ static bool arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
         /* translation succeeded */
         result->physaddr = res.f.phys_addr;
         result->attrs = res.f.attrs;
+        result->attrs.debug = 1;
         result->lg_page_size = res.f.lg_page_size;
     }
     return fault;
-- 
2.43.0


