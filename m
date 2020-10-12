Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1163764lfa;
        Mon, 12 Oct 2020 08:57:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycq8l/xJLJJv5B6URN/P0Y9qDtu3kljCh2SQt2Pr96AOV0p6n3u5PXey4Raw9LZOqd6Qf6
X-Received: by 2002:a25:dbcf:: with SMTP id g198mr33771236ybf.354.1602518248153;
        Mon, 12 Oct 2020 08:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518248; cv=none;
        d=google.com; s=arc-20160816;
        b=URwmc/wjg5XUcRLMkslZynE42WtAvmT+EfP5bHY4dZavdqnmt+qHgIFFKFNtn0eyt3
         MWicgs8ghWF/bfeejbNBQw3XBHcwBEeAQEU71n100OAI/4f21IoCw312gQlR8sqImscg
         w1Bf7CziVruSbvmuu8HJwPQyyuQ/x+C4NRM6xs1xnQV6HPHJYiyhqOeWd6xse2pyAEwS
         PXdWZ8jF3GdgEOHLb8DATwdkLHqZkOZUDXhbGQS4hBmBQjauhKgvRp1Xo98XLp2L0yBe
         iL2uqwwoSwH45+40jLS64Th7BgPsjWeOeJoG8m33vTeZ1piz/0qlkwM7p/EDIR/KcJzt
         PL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=00ShRuslEy4BzxQbUPtydgOGX+tNRA8D9prQR/vuBmQ=;
        b=pFmjmv0XYbje4sI64p7sSwy4v2q6LF1dcy3kCZhXopoGSZCNgnmGN0v/m6+5RLsOkZ
         612q3dRtDwMYrlJf/XJxlIK73PXOIUsydR+oNlDGqkECy3Y5ctWiRKHZ8SLwJ7g6KbMR
         Cz5T/EOnqHnF/a+ZqmF/XuBVth52QqaTsCV7ad+f+igVfDVuqjErCyIRyjsmu3hevpV6
         p29bX6jWishDNkn6r0sNCAw8jIb11En/juzbuWS7j9XUmuxlYDPX+83aMFiLjbYCfMNH
         ibCeRnY+VVl3bNmUm25TorYcEafHl98yiOy8nvxikA/17aAx6GiKFiyGFBwPVPDWR2s4
         pBlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDAjKJaw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e188si9052520ybe.264.2020.10.12.08.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDAjKJaw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0CV-0003A8-Hg
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqq-0007N0-Mx
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:04 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007Mo-FD
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:04 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so17961168wmj.5
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00ShRuslEy4BzxQbUPtydgOGX+tNRA8D9prQR/vuBmQ=;
 b=kDAjKJawIAE0ro0wvLiqzgwH/s4FSbYcMD8nDqklP0SMjSN7C1i5ty3iwVWVTrS2zK
 4u28SMEuoDRfTRhcM2Rw0AFqOTpzwoKMaB4bairNo8i6dFcmm7H0n9Kh3t9K380pUSV9
 EX0Ob2Uwk3MVLqDlNv1MmTzDsmkcatqdUmg7omErkjtFhSIcsrppeSO//6V5rM376WgR
 RbBNU5bSEqlOq0L+CUQ/EiBdH2LtwNwkRnQo4HTXgqrdRIm77/Od/H2lN9kzkhjNbgST
 Khf8CEpls2Qs9apLXURxKG8Hb94Q9yxt5zkPJuCfb5v1LnzRlOedi71E1uyc6ajkS2MP
 goYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00ShRuslEy4BzxQbUPtydgOGX+tNRA8D9prQR/vuBmQ=;
 b=Nsc5YEJlIF9C19RVoylkaogA7z5Kiyx/YRomny/NSBFQeywXZVy+LjVXume+oVkTxs
 64hU3nKcixvKcocSC+RjviNmPsAm2e/MVEuxm/1qSWt0KYT5pp31HzMgK+gS9BilTWTn
 Yaacte5bE5Yqvj2dQ5dMNoHiGl1IgMYfzEl/eMAQMP7/G6peuUCw8/vicpdQs7AgSW/f
 s8kXhxo8J2mDvrC4JgEg29iQzD8y/g4hQPeyTraJQ4s0RAdQIuEI/RzOFDb+4NyguW4G
 aScuWpFCJYjokKK+RY7oGjJzTV1D1QwAROREG242yAPXhAWzNe9t87p1ItUQ+XJcT7As
 4bAg==
X-Gm-Message-State: AOAM530OAgGWQaXQ0wG20g1Vn04XhH7zf8OmMCQZifrINDFlSvKfoO7q
 RlhdLqGcGth845rEgarW2ScJjQ==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr11336567wme.27.1602516882717; 
 Mon, 12 Oct 2020 08:34:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Allow user-mode code to write CPSR.E via MSR
Date: Mon, 12 Oct 2020 16:33:51 +0100
Message-Id: <20201012153408.9747-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 39AX8hfQQeSE

Using the MSR instruction to write to CPSR.E is deprecated, but it is
required to work from any mode including unprivileged code.  We were
incorrectly forbidding usermode code from writing it because
CPSR_USER did not include the CPSR_E bit.

We use CPSR_USER in only three places:
 * as the mask of what to allow userspace MSR to write to CPSR
 * when deciding what bits a linux-user signal-return should be
   able to write from the sigcontext structure
 * in target_user_copy_regs() when we set up the initial
   registers for the linux-user process

In the first two cases not being able to update CPSR.E is a bug, and
in the third case it doesn't matter because CPSR.E is always 0 there.
So we can fix both bugs by adding CPSR_E to CPSR_USER.

Because the cpsr_write() in restore_sigcontext() is now changing
a CPSR bit which is cached in hflags, we need to add an
arm_rebuild_hflags() call there; the callsite in
target_user_copy_regs() was already rebuilding hflags for other
reasons.

(The recommended way to change CPSR.E is to use the 'SETEND'
instruction, which we do correctly allow from usermode code.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2 changes:
 * fixed wrong variable name in commit message
 * added arm_rebuild_hflags() call in restore_sigcontext()
---
 target/arm/cpu.h        | 2 +-
 linux-user/arm/signal.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5d995368d4f..677584e5da0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1230,7 +1230,7 @@ void pmu_init(ARMCPU *cpu);
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
     | CPSR_NZCV)
 /* Bits writable in user mode.  */
-#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
+#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE | CPSR_E)
 /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
 #define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index a475a103e97..698985a647e 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -552,6 +552,7 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
 #ifdef TARGET_CONFIG_CPU_32
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+    arm_rebuild_hflags(env);
 #endif
 
     err |= !valid_user_regs(env);
-- 
2.20.1

