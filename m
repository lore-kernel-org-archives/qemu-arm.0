Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1487309wrt;
        Wed, 10 Oct 2018 13:47:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61BFMb1lCuNn4c0OcOM6if6SywdS2GX2iA2I4X5fiuLCbeJQqsJesiEOf0a2wQk+LINPONZ
X-Received: by 2002:a37:c050:: with SMTP id o77-v6mr28008982qki.228.1539204469664;
        Wed, 10 Oct 2018 13:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204469; cv=none;
        d=google.com; s=arc-20160816;
        b=Q48Q1o3f7wYlYlK4hOQIjlpJv/N0Mn7p5CT7JHI8eFShmrw97QBDUbzbpMbW6OFPfn
         yhnIHw2tKenFIkDb+t6L2WuzK9cgcohKS+8EKJMRup3KfZ/yXeeAIlXqWZwiGTl681Ti
         X6sb1zEChOSUYEXuSBZZM79g5SWts/5DADJ07bjmL6sp/k4aWVgjrkfibjbwWENolnb/
         EWQPN2FVK101p2C+GPtjXQ/o1Q8SZdSKAG83gutdm8D7I2SOQ3yJeL0Xp8VH6WfoP4bV
         jNrt1b2RZqkkHLrluUQ8AXqsflL2E3Ix+60F/s/fQZ+RFjgLcpE53Hk+ojS4qvvzqepQ
         fIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EWF0Fr/S5CUPmbGpS8tqzvex/tP5zrxb/33cA+skGN4=;
        b=MWHw33fjxaa9eC0uysSh6ci4gHJePtXoFoTfQeMDQ/Ajc3kTeThs1GdehGanoAsD33
         aJ/Dw1AQU/WD2xs6X3VzCLiNOx2wWqgJWe7TEFlf5N6m11rxCz1yMfur6KQYmftuCNsa
         HL+vrZwRb/PzV3MgiEP3+BMJl6dh41SLcy9rqU0QVIdiOYDFrcw1pjBl6AzuzjhIPtTs
         JB7VkHrTVINSfJduL4R/CQSDHR8Jk/DX2XWN4PEMQ7IgoVaHT4mP5Q6SWKRfMKglE2Dd
         TSjPfJmxoX2gPhGGiiLaBJCO5cDwsf2+phFhmWXmPXzM5IjpOyIjPC/RcxQT7ONwJJ+4
         HZOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cf7/47lA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128-v6si13555148qkc.27.2018.10.10.13.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cf7/47lA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALOX-0001at-4o
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:47:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFd-0002tw-8g
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFb-0002We-Tt
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:37 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:43086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFb-0002Ve-Kb; Wed, 10 Oct 2018 16:38:35 -0400
Received: by mail-yb1-xb41.google.com with SMTP id w80-v6so2750414ybe.10;
	Wed, 10 Oct 2018 13:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EWF0Fr/S5CUPmbGpS8tqzvex/tP5zrxb/33cA+skGN4=;
	b=Cf7/47lAYIOTZaG7uIbjQGVGyyofz8AoFJ4bkLiY7cr+HyjzuzZ55u3biWAZNi+jxQ
	U40C7HLsK2Tw1qTjRBnaqpHRAxGmhXvVzwJX6rpCKpw3oAiG41Tip+MZACRUNEXwlm/9
	IYf3wpHnEG6/hxkZEPuMnNBCnSJc953qUOYxBgDaKyLW9VcC5/DYnrTODeY/0E/1WWoz
	hV8uIteYdf7V/dlZl/jgiqZ8PN4bzWDO5G88P4HhJzj4SUgZzhmeKefafgbHZGl71Wlg
	ivqUya4+rdNqAVYweUVTIE9cr2gTUTHruk+eua0xhFyTNXo/SLAICme9Efl6y0/1OA+z
	ZslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EWF0Fr/S5CUPmbGpS8tqzvex/tP5zrxb/33cA+skGN4=;
	b=CA3IKpn9hbJoP1ClcVAREC6zUGnGB8nPopI+rXYYxH0c0zjNUBxD1xi5Ma7Uh/HeRX
	wFXdX7UvtXNswC+EfSftKSwr0k6YY5Y4T4qyBWY5JsE4eu3itP2jREKOY/IBG8PgjPvF
	QPH9TspaPjczag3obWGCTWzxoRVK1uWe7/Mzzsl+9uDI/AJvInsUu1n5jPrC7t6h/4Py
	hjWFvCCk+mIakuReyKjUPWw3PT+dfGAwpEoycwhdJAG9kUh9hGLj2optJYEF5wlhaCwR
	ZWmkhYt4a8zEpvPIODb632Ewzf8lk9idjDhSTJjQWF7jQxW0u8oyNcMKLJRRy8zkaYFz
	CqqQ==
X-Gm-Message-State: ABuFfojkcTaDM3SzDDGdBxNN5hBWDVvKwPUbfnwmA4jJ+b5f9nPXLbw8
	2fX3sYKdE8uv6ja3TEA3DGo+g4Ur
X-Received: by 2002:a25:e481:: with SMTP id
	b123-v6mr19206298ybh.416.1539203914835; 
	Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:33 -0400
Message-Id: <20181010203735.27918-13-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-arm] [PATCH v6 12/14] target/arm: PMU: Set PMCR.N to 4
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GlrjKLzDEye

This both advertises that we support four counters and enables them
because the pmu_num_counters() reads this value from PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6501de1ba..89ceb34cb9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1706,7 +1706,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_W, .type = ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5412,8 +5412,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
-         * field as main ID register, and we implement only the cycle
-         * count register.
+         * field as main ID register, and we implement four counters in
+         * addition to the cycle count register.
          */
         unsigned int i, pmcrn = 4;
         ARMCPRegInfo pmcr = {
@@ -5430,7 +5430,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access = PL0_RW, .accessfn = pmreg_access,
             .type = ARM_CP_IO,
             .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue = cpu->midr & 0xff000000,
+            .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
             .writefn = pmcr_write, .raw_writefn = raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
-- 
2.19.1

