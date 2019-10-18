Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1244167wrm;
        Fri, 18 Oct 2019 11:05:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIQOX8YNntrGWWnEkQaIXmt+0WOOIWVO4kp709zKl4pVymrs2Z1R1bOs6fARuAJLstIc6s
X-Received: by 2002:a37:aa8f:: with SMTP id t137mr133707qke.128.1571421910220;
        Fri, 18 Oct 2019 11:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421910; cv=none;
        d=google.com; s=arc-20160816;
        b=eDCZTjoE+5XbJdvnvkSjZjv1wqz7BMLTjGmQW4t2U5N4cIQbSk2amiUCjj0DrnICSz
         yh6vwbjqV4j6hejogIqyHuTNgUv1Tc8rAN6ExQ8HSeuNHoIS5H0RatZ90dzuWPiMYYF9
         UdZSs3ldIE+TDUuLhSR4A6+Fge4WBEaNAi8ZjwiBd+Mq5hLSCX8Gd8+kQbvTfG3Xh8vU
         SlyqWCDSJdpdtkxfah2MhR1qAWlJZuivzazeQqJSl6ZGNEiUptlbbx/V96h9CtJE1Tzo
         RGXsw0m+z6zT9khFzYgXblMGaR/hQYnCPUQkiGsYTrH1pfC133bKkhpetNtR5yfYgdc3
         tctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HGoDHAyFTg02BbCDc0SzUOS11VgHC5xQyCe+OvrFqFc=;
        b=BEzp2OONpNrZzTdzrzvOHUqb8t3Y8VRu2PgSyYlhkOeoXVGE+dOSLF4p/U+6fz2Ar3
         s7J9fMMwWEgfKQInCg8DGBqjUt7ODLAoWPwCivw7nMu3aYSMHrUMev16CHGXMw0OP65a
         cFa0m08qbRDH3w657mz2smHlr5chq1p9ebYDWkAUYvHwU31ANt2+pWsuPeAEzSLLpKkN
         XWlPVsKfLHqshJqokxYpaAdAglgFhMrIh7bdgZGCMGSUZSXI8A5Y9QOsT0HXebGz6VCY
         mHevrYeX4O80h53rprorx+mZ6bfkVz3BPCl6SU3FeqDsHWw2KzN7yjBQ3DJ8ewIViaYx
         OGKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gH4ePKI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 55si154938qts.279.2019.10.18.11.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gH4ePKI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWcf-0002Lz-Fc
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJA-0006tR-6F
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:45:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ8-0005eX-RS
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33783)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ8-0005e2-LZ
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q10so4340399pfl.0
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGoDHAyFTg02BbCDc0SzUOS11VgHC5xQyCe+OvrFqFc=;
 b=gH4ePKI0ZYmF3BKEWSo9PNClpVHrBkapR2R7ZkhfqrjHkMHJS0HX4sdTlt21lXFwtc
 2tKmh+xORcUbroASKsXq+0bA1pUBHlDJndVV1+Wuh2WRFy5pCmXxAaB3cH87LD9FyKXb
 IXQZH9TBrb4pIXteiwfFCvBGPW1Tzaoo8oyue8TYz0MouKhMLXpwpwEIz/3TmgsQh0SU
 rCTNdMyVME5zlZXAigmt3XoGOgmV6t40LujfLvl/DO78he81jF+v7I7vuI6cFTTDCAkZ
 VeC8eSH+ufI37bf33sNcpqxpTpY6vLGvUMUpMuxRtnhE/twy081+Txs9R2p5D860HpVB
 khuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGoDHAyFTg02BbCDc0SzUOS11VgHC5xQyCe+OvrFqFc=;
 b=LwfLMRIm7FZugm52qNTQMV044BHN3pI8f82T3pt91bDkan0rdv1dSQqIqlEaKtt6lz
 mKBukpm5s9NxSBQMSDAIogwnw1jK5sTRNSA0+c9A9Npvz4mtubr6iYAsTHSgEbi9wytb
 oD7jTan6zx2W6r/pEA+KD9fj/Z84DUaVVXqarDGZrsznJ4IRj8d+/fbrJm756vh5Vp+o
 ZdnYHflGKfsu0uBiXTeqFpJutyBRwQOXDJR8vdRh9gJJrUd0OltJg2rRXWejbChPIatN
 xGdr0dziMBCWUB2fEANLIBl+tB3JemSST/DF/SvkLZDlL+9vP5btN6CzLaHwUxGcIXdD
 EmBQ==
X-Gm-Message-State: APjAAAULqQfj7ku/hRbKD5HZ7OgzczbAXxsZ5DZmU5f3BxDFJyOVSQXb
 t2C5wRr+cwJ3QPxgOynqJK3l0Q==
X-Received: by 2002:a17:90a:376d:: with SMTP id
 u100mr12408557pjb.23.1571420697691; 
 Fri, 18 Oct 2019 10:44:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/22] target/arm: Rebuild hflags for M-profile
Date: Fri, 18 Oct 2019 10:44:29 -0700
Message-Id: <20191018174431.1784-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42a
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fLGGWh91s+h9

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Add rebuilds for v7m_msr and nvic_writel to v7m.ccr.
v8: Split nvic update to a new patch and generalize location.
---
 target/arm/m_helper.c  | 6 ++++++
 target/arm/translate.c | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 27cd2f3f96..f2512e448e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -494,6 +494,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, dest & 1);
     env->thumb = 1;
     env->regs[15] = dest & ~1;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
@@ -555,6 +556,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, 0);
     env->thumb = 1;
     env->regs[15] = dest;
+    arm_rebuild_hflags(env);
 }
 
 static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
@@ -895,6 +897,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     env->regs[14] = lr;
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
+    arm_rebuild_hflags(env);
 }
 
 static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
@@ -1765,6 +1768,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 
     /* Otherwise, we have a successful exception exit. */
     arm_clear_exclusive(env);
+    arm_rebuild_hflags(env);
     qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
 }
 
@@ -1837,6 +1841,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     xpsr_write(env, 0, XPSR_IT);
     env->thumb = newpc & 1;
     env->regs[15] = newpc & ~1;
+    arm_rebuild_hflags(env);
 
     qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
     return true;
@@ -1959,6 +1964,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     switch_v7m_security_state(env, true);
     xpsr_write(env, 0, XPSR_IT);
     env->regs[15] += 4;
+    arm_rebuild_hflags(env);
     return true;
 
 gen_invep:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cb47cd9744..b3720cd59b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8325,7 +8325,7 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
 
 static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
 {
-    TCGv_i32 addr, reg;
+    TCGv_i32 addr, reg, el;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -8335,6 +8335,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     gen_helper_v7m_msr(cpu_env, addr, reg);
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
+    el = tcg_const_i32(s->current_el);
+    gen_helper_rebuild_hflags_m32(cpu_env, el);
+    tcg_temp_free_i32(el);
     gen_lookup_tb(s);
     return true;
 }
-- 
2.17.1

