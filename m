Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1362302wrm;
        Thu, 17 Oct 2019 12:08:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzleQJlcXCc9LfPJekkfRKzr7O3ddLdZnFXZJ07SJC/RJNPyj9ZE4iMWON0G+2HTUqU/Ke
X-Received: by 2002:ac8:5514:: with SMTP id j20mr427669qtq.241.1571339319285;
        Thu, 17 Oct 2019 12:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571339319; cv=none;
        d=google.com; s=arc-20160816;
        b=jc73XLfYVJm21AySTjUuyHUEsVH/gWKImTEiH6IR/lxiVTkPXfZxm59pkQ6wZiTsIM
         sObw1WRQV9L6qC7Ez9aylVyXDAp7DabnO/90ImqKc81H73EErLB5HlTn9hqVYtriP7F8
         F/VLY2vWl3tmrs34caSoWqPog+K9ZhoIpbcLzsulQi58UTiARN5lrBS1JDb/tLxYcSew
         i/1LDSY9wE5iYZP5WRDXipbZ5mIZC1bHl+eZOf9mKelIjNHuxpxO9erxjlYU3VM2Ko80
         6iulCYjZQAkG/u2qVR6eaB0U+cXY/48CRAOslKeCzaNzrINFxhU/d4r7+DHfqTh/Nq3v
         s69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
        b=oufYj527lliSFJiqkom39uf+idTGMbrJUCH8PvUr9zvhNR63DZTJgztY5zPEOPNeQF
         bGEF1MvtDK2jVvECdKC6w4+xXyWFg4IANjUsOXqNfDZ4c9jFBwBCakyMjp5lnJdSBfLS
         MJifbftRvU8CVJ6cQb2T3GW2D7NpPHCMAs8hv4RUhHs4YqHGKTCugE0Rj46AKKHqB27w
         vD6QmltmWQzokF/2VDKwUI8old618WSb4VAL4hdV2eobHZGSApmMcp2cqqBplcMaT4eo
         8eaLWdnRbJsN+VKrt5CX+v2Qa6xe7GG8Eh+Ha1HQcLAPb4WEVsTGjCiyXr8JQM0V2XMN
         KMNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kkvgoGSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s94si2820377qtd.29.2019.10.17.12.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kkvgoGSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB8Y-0004j5-EG
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0001Ei-4A
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs2-0000v9-Ba
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:37 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAru-0000tO-Pt
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:28 -0400
Received: by mail-pl1-x644.google.com with SMTP id f21so1551995plj.10
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
 b=kkvgoGShiDYFdnVG69AeK6rYe+drgSTZVX8QhFqP9Bp90hOTywYxJ6GoZxFnuFCd8u
 t9GHqpK6jtFaHAfOQHeG35azMcz5T5DIrTBXnnBreWyDuW02x4Lykz7Ke4/BoYahZt54
 iKBWSC+72w+uxFwV9H8vqmMqq/SS+wR2png+abaID3KD8AkMK8ZURPBu3oIZC6FTBw0T
 /rIv2avFBe8jDa7Wa59f/ucyIhsRBQDjh0Sdr9Bp/ojSQPyagxsj3Y97A7SEaOBvzmnz
 2g8K7wpc1zqRwRK9zxVzA1dHbA9388EHYWORDBMZWNkL1+vXoJVuhaA6IvmrE2If3rZ9
 m+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
 b=p44PwZ3d2MdknLmP+BJ3C/PYhU9g3njG8Ve7l8XdghOJFu18Spcb4biZNyUb/rPWp0
 L1+vAlYOZVsXRIAitGjaib7GkbxHWP+m+eEk+AZZWdSsgN+tPRqe/K3RNL1PoCxgSrNw
 nfsgb+Yju0yO0L9NaHpOzjXDG/nC0VGdHSyRHjvH/aVTt71B7oxDLfAzJLWa5wpeXIlK
 AXXEbsL2huienAwuuG0v4SkR5a1iTk0M7k04VE6hAkvsaaKJZDibHRJJwJ7sAo94Or07
 9FurkAqQCMcc5uVy0vjUKUByhdXx3FkyJT4G1l2HrZEeDA/kf4tr1crnROFOnwa9aRmj
 qfSg==
X-Gm-Message-State: APjAAAX+hbmRmIHntpfWG0Tb1ZtqV44obE2OzSXDj4Hf88gdccb3eTew
 v3hChIqseyhFjuqK6BES/B+T9A==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr5640663pln.288.1571338285472; 
 Thu, 17 Oct 2019 11:51:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/20] target/arm: Simplify set of PSTATE_SS in
 cpu_get_tb_cpu_state
Date: Thu, 17 Oct 2019 11:51:00 -0700
Message-Id: <20191017185110.539-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: YZLo3Tx6mqBt

Hoist the variable load for PSTATE into the existing test vs is_a64.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2a62cf19a..398e5f5d6d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11197,7 +11197,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags;
+    uint32_t flags, pstate_for_ss;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11205,6 +11205,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
+        pstate_for_ss = env->pstate;
     } else {
         *pc = env->regs[15];
 
@@ -11257,9 +11258,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
+        pstate_for_ss = env->uncached_cpsr;
     }
 
-    /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
+    /*
+     * The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
      *  SS_ACTIVE   PSTATE.SS   State
      *     0            x       Inactive (the TB flag for SS is always 0)
@@ -11267,16 +11270,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     1            1       Active-not-pending
      * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
-    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)) {
-        if (is_a64(env)) {
-            if (env->pstate & PSTATE_SS) {
-                flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
-            }
-        } else {
-            if (env->uncached_cpsr & PSTATE_SS) {
-                flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
-            }
-        }
+    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
+        (pstate_for_ss & PSTATE_SS)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
     }
 
     *pflags = flags;
-- 
2.17.1

