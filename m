Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1233295wrm;
        Fri, 18 Oct 2019 10:54:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMxQgTDWugNgYCbYSSYdM0Q/IjLAxl283G+hMlSmbH8vZ+JWys4218D/w13tUov6w/0tfN
X-Received: by 2002:a17:906:e090:: with SMTP id gh16mr10041422ejb.56.1571421293671;
        Fri, 18 Oct 2019 10:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421293; cv=none;
        d=google.com; s=arc-20160816;
        b=BavGTM/p5p4q51Vi/TZzhoszfjaiIJaQL928suuy+sZ0rfHzeQ/xFWCL7UE4WUl52t
         2v1D3nnFxzkZ2FIsfwa8fOiS/YDwHwVbUgORBY6JbMe78x8sSsmu0L7gW/qrz30LOS9W
         HiQGpuCowavsiv7BbaoWbgNzDQBqAfULgNEhMy5kaG5d4a6J9nX4GTJ9eGolGBOQQ3z6
         deFANQzkkGkr91SSOMU87t2iJPWh/+Ii/WTutVndGl/QRmezFdYwwA4YwUM5WODQnTtv
         spRgMW7kVqwkaPYbqBWxFtM5FZJZB52YGd4rr13ZAv6oZwZuOVMYOslqf0qkKTBcPE2C
         L3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
        b=imEIM3GuGZ63GujfsqWYPg++vEzrtOqnjuodWsdE10Y07fdQ91R6aVSVrIDNjg8t4z
         fEZliLlhKe1gKy+m9H+fHU8NXi5amuFqX8WvBs+LbLXd56/4aKp+EPE81YcjVC8s7Usx
         KQSSkwyzZUSHJd9PluWoLKtJs0M+Rc58fNQkHB8X5zPe+fVVWxEMeM3PgyjL2aoKt4oD
         ImK4dS5bbatM3uiK8jg5Pwz66RmJYunnBIrUn4FMl5BLfXxuYozDtnytIPB+Lo40SdPS
         PAFFJ5+PycpHoXuqNNzRrmphiEbhqg15doXEUMXR/xEi7zLhqAIpE+jhxyFSlI1Ob9RB
         QyDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pWIoIHOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k63si4651606edc.347.2019.10.18.10.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pWIoIHOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWSi-0000X5-Ad
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIw-0006Yl-V8
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIv-0005Sf-Ik
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:46 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIv-0005Rv-C0
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: by mail-pg1-x543.google.com with SMTP id e13so3750108pga.7
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
 b=pWIoIHOzUUgQIGhlSzHdOdcPTYTWLBK97r2ZWl9k015vOd2yzVVP+iljAdQzhj4WBj
 el2sVOFN3Gxe2v1gpdI7NJrlWBsEvCZuegNIlLif6TVPt70MZpkCtOsYmv4mAl7Il+hV
 xZFZyk4eP5/ytJB6oC1coEAbB1yMSBYqOoX+Pb8Ck9Q7tzvc9xIalZtyB2eolkQq/XzB
 ZAWsZMOdGojYoCjCNRBoj4KEPRRBmuo7qQyCej+Ka6usaFP0NC4vUVqjWYtNKfGRmfLK
 iEGsBErXfpg6lrZzzTftIiNkSSRf8M2kmwSxILqxBPlDXBQee/aggExOmwN2Wuo2a1aY
 9eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4LDoKiCDj8UEOXKdxGeWLogI6gqriKirwE9ruJcfe0=;
 b=epH02eg3mPCK4YD3g2IQ9Dyn7dTniyOWFWnoxH8wqyHsRmDgCMom/SXuXlTFJmQfky
 bVKlaJjBOF7ZTmB/rQOfezusgD1XfVE/j8ZjJmQOVTNv4TOKGYoLTZy0TbLt9I2ECvM5
 CWkwAeZrYtMnD1UXvsjQECRJQfF7cqCiRGsckZgwarrCd0xdZxhRAXqE+pCtCFHsSERy
 xKnB8RDH+KhI8ZLBmwuaXLCJs3jmFPiMNuoPxiViX7tSENVBQXYQROPQ484zeMgoivFS
 J5zBGDEiS5UJK4uukYCAAU0Y346L1IOmuK0u44fI3/hJBtlXFnhSWlVunE8L/PUnzmKQ
 +pew==
X-Gm-Message-State: APjAAAWzBgPUY7spkSvLGakPNv55IKKh6lW7DT+WRHncnF5qMrLm7dJv
 zRHMsj/UIaa4+xss3sh+ZKX1NM5fnuM=
X-Received: by 2002:aa7:908b:: with SMTP id i11mr8245647pfa.186.1571420684462; 
 Fri, 18 Oct 2019 10:44:44 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/22] target/arm: Simplify set of PSTATE_SS in
 cpu_get_tb_cpu_state
Date: Fri, 18 Oct 2019 10:44:19 -0700
Message-Id: <20191018174431.1784-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: g0A74o4sFTi+

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

