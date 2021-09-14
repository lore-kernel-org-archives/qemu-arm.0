Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp616376lfp;
        Tue, 14 Sep 2021 05:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGWr+tvK4hbEnbFqy/JEqmh2q+Ig0pORKpSej3vALGnbOBO1OaZvC/QAH3imV5qb5Vsy4i
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr2659550wrf.416.1631621545830;
        Tue, 14 Sep 2021 05:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631621545; cv=none;
        d=google.com; s=arc-20160816;
        b=isOB3SGw7t/0nTInsktnPvYuZPusAd4MnOFaiSfNGMlaQGgwsSocvTcDP09T1drsJO
         yUPg5NwVuoj0nwHfdDCtzvozRb/wI1a/Cp03+gMpVnGYnMRw4p5h+s4o1qjEP2lbM+3C
         vgjLETsYxcHhSC4dWj3pb+Wo89rWBAfSxqLaRt501YYQwM4Q4YYJc4MDXX6L61d2MI2t
         /J74swe+paL1vH4RurmCP5nbvRR8hTyiFd8Z1xTcAt910t3Gk6p+AX7TW39fzcoVsYu9
         eZEw4kJfn39pwLTbJJfTJPrjeeZGpqqEZpqt+/DiDTPLwJngGJpHGESroXnMR1fQpDj4
         GuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xKwGyJmZxOms/ByF0kDC33B+Wu0QPCZS/ddqiwTaY04=;
        b=BhDCyq6mM0S1l6uQmDPTHwyCbmLDujDIrKHrh0MZzklWkLqYfWKMr3veIczx5OPzbZ
         179bwW7byKX7GNFbQHTM6DrTe7jwjx04d3lJcQmb53pErIjTjVjYgwI6JzYVp4CPmhTq
         PdllbFSJyk9f9BYwgQZvKULkYlL8eDYFRxgb6GUAbpeDLxO6CPUDOB2vVJN8TRjwUtc+
         rlR4gRh1XaqdS+AfbSvxwEXAyZF2JF7mFNvald8kWFarvUbvIAgTO3GrjQglxiO6Oaz/
         dNY6JRb+1UslEcYXajEz16Z6u7URFRg5cHzbY5JKKYhB83Q6GczeXKL1qaJ6ut5VcMLT
         xNhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbEO4Mda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si1362031wmq.75.2021.09.14.05.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 05:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbEO4Mda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ7IW-0006kZ-OG
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 08:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dr-0000lS-UO
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 08:07:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dq-0001MC-BC
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 08:07:35 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1821996wmh.1
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKwGyJmZxOms/ByF0kDC33B+Wu0QPCZS/ddqiwTaY04=;
 b=gbEO4MdaJGu1/l2b26BchYmIGdHWFP+8LM76ril7xaV4buTJSNg12cngXRL/pPQvPw
 r/WREqi5k0i69Dldpv5HkfMV+FCc3wP4V7EWypQAvNHCgT9lxuSnFnAFZgK2E6IOMJ1e
 yI39Yd4nRwXCtHI494wFlggr4r76V892isFD4ZZAi9oUCqg+o71NngPqVBbObOYRtLVt
 CwIjI0Zr2C2J4dztPGw3vhdUKM4A8uJzfCnr09x9+l9XWntlCJ7NfPwinTrn/51HUmmF
 Ks99C3DuoSPmp4rHIS3/teNN/aiSpF7sux1+uzb68wvbqfuolcUXZVrmx22nRvF+PVwQ
 DwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKwGyJmZxOms/ByF0kDC33B+Wu0QPCZS/ddqiwTaY04=;
 b=qnGCShb/LryRZYsFKopBsUng02IEQc4KJzMGbiLgF5nMeanhatiP3eAzukMghPAVxs
 QGJkMt4QPsBRJr6aaGFbhKFYWTzTJPhMIYYt3/bzeuKEwjBsAmllJLQLzqoC5p28gZHD
 8/5gUpu4x/LMDoVGyyRQKaSs7zQST+LCsLCNDRboqPP/uvz60l0rRrd7ode1PjLOHIAs
 GYQKJGZEOxZ9jmyXB2ayL0H7x4BAH1/oNN6mqRkcaNCEsebXwuPFCkEfLlm6oBNPlTn7
 mK2+yaXJXEJeNITtQF2OMmqJPy2jS6XkvLzo7sn8E4eEYvRjgfRHSq+crWuAUn2DnDIi
 TbvA==
X-Gm-Message-State: AOAM533PJMZtlY8ZQqhYaS01EqPxf9PB+b8vdOAZLgiJW1Xx+DWf9pMV
 dLf5fz2PmldLSYjH2Z0w7ubpUMw3HrWF2Q==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr1778571wma.155.1631621249849; 
 Tue, 14 Sep 2021 05:07:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Always clear exclusive monitor on reset
Date: Tue, 14 Sep 2021 13:07:24 +0100
Message-Id: <20210914120725.24992-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
References: <20210914120725.24992-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4VOGnpcWvuLG

There's no particular reason why the exclusive monitor should
be only cleared on reset in system emulation mode. It doesn't
hurt if it isn't cleared in user mode, but we might as well
reduce the amount of code we have that's inside an ifdef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 98eed6c6d31..7b1665a1d0c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -381,15 +381,15 @@ static void arm_cpu_reset(DeviceState *dev)
         env->regs[15] = 0xFFFF0000;
     }
 
+    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
+#endif
+
     /* M profile requires that reset clears the exclusive monitor;
      * A profile does not, but clearing it makes more sense than having it
      * set with an exclusive access on address zero.
      */
     arm_clear_exclusive(env);
 
-    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
-#endif
-
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         if (cpu->pmsav7_dregion > 0) {
             if (arm_feature(env, ARM_FEATURE_V8)) {
-- 
2.20.1

