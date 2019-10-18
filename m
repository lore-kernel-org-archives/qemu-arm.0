Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1243907wrm;
        Fri, 18 Oct 2019 11:04:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8Q8TNIYM0UCxdWCZ/o/czPW6JtDD43jf8J1EWZkylMtRQ+4ZKGTmInQllFDY480pcP70A
X-Received: by 2002:ac8:2a5d:: with SMTP id l29mr11436924qtl.36.1571421899286;
        Fri, 18 Oct 2019 11:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421899; cv=none;
        d=google.com; s=arc-20160816;
        b=vDmumpGgt02p5yudNewJ//CB0ZGrJSmTxlQtFJRacUku5qfVgLNm35wS1V+I7UqGLr
         Wgqb3rC1Hev+XMSSyZUCkyQAkRAXtANPWQhY4Y6AHJFQy/WX1UOPJXaGUwe6/Yav27jo
         0kCQs7a/fY8mNbBdEk0ms4kXGCUQ4eC5HeCXzzu3b1oXMqfVPEy9CV4Mtq49ucY+6RD6
         40Nl2YHrSAQ8W4DlSNhsF1ck1UvTSCdAQU6cc3xd5bt2ql839AVAIZAvcePNRcHzQxlp
         pvqk8gWh9200Y6/MJC6UuQa/YZjMVqUUkIDDNAwXz2EvWUX/+BZyfysqf8HgZDyyYlVu
         MkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
        b=oSz4DB0KRrqHerRrdbxxTx9CqVgfSEKUEkHj+H0prCKVA1z0TiSusszAww3qryQxyW
         7+9yGx6/uQlaI9XZJHxI2QXWyhUQMZnYpg4nvTkXBFpt9ZTuuFCxA0HBVmUCB58+ynXN
         H8HMn++Pu0o2A7b4OV8rMxuSYtu4OVoeymQGSLkRpL9Kp+TsZ6TuPO2BxFAAnnxa//iU
         jE+xo3soHkHG7LRmTmA7IWnWheznxA/O/5T3rLOCCujFWNztxsbEEMH3E/39ufNdNGSL
         Ioa0tfRo0MUcsAml3opWE69Rd8Au4q9+sOFtUFjY4DqxiG7Tm0CStMIVL9mkCGIf6mQ6
         pMRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jwr7py+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w125si5903031qkd.329.2019.10.18.11.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jwr7py+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWcU-0001It-AA
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ7-0006oW-Pz
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ5-0005bg-7p
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:57 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ5-0005b1-2P
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:55 -0400
Received: by mail-pf1-x444.google.com with SMTP id q5so4301805pfg.13
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
 b=Jwr7py+bQBoYaWXfiCoTCjoDBKkiPGxT5+nrQPKZHeCpFuyXWBm3YPesYDJtr2rkXU
 H+gI1NQBAMM7nIjTCfxUkfFm/jwgwHWlJBZ4dJcjVE3BvHePh3CYYiU24hfpfr2hgLp0
 uP0BP0626ht6iEtLZ8xnFhshCsvvqvc8ARS0sWbZ9q/P4pkmB69Y3om/cJnK4VLOQzTO
 ZPvNKxDqG7NRWrLIUnUFi7B0Pt1ogv6w5oAQsy+BPsvFPGmyQROmNt2ZGVaxFVYrQ/pv
 LPM5iBoJaWLxcL5WToWu/RjoAIMHfacy5hqBwXdNHRAv/AHuEKRwQFZviu9xnOmjlIEy
 F6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
 b=JUdqUP1SKWV4aeBYiTndEz53XRVILX3nLT5ipiivksj3KuvHrXYy/hTD+MeC+J+fTL
 5R/CsmNPgfie0r5esvw2Bl08ZW/ryrVpM8uuQX5mujWJo/8q8F2njjQPd8E69ZBK4++K
 SEM1ZCvIWcOxXYLeq9wAYh15kL0kwALxQXmPjG6Vasbp3bBx2NWrWye+nRp+yckLApni
 FzZcH27QKiBHDpGiT97NCZb6mQgv8TQthSDU43W3Cx9zoRy2kOpCeS7uvLWDNGI3LSY6
 fBMwjk0oQMdEQCuDSojnf7pQPzG27Gm3QjEARX2q9Fbj++BXahzDS025lCPBOJxEqwe9
 GNMQ==
X-Gm-Message-State: APjAAAUfv45dWERznl4QTR1v+/XJ2EqbP3XoA70vCSRllr1T3BUHMGp+
 z4bxIA6pQlN+7biQz5N5AX7dyF7xynU=
X-Received: by 2002:a63:4f12:: with SMTP id d18mr11835824pgb.52.1571420693696; 
 Fri, 18 Oct 2019 10:44:53 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/22] target/arm: Rebuild hflags at MSR writes
Date: Fri, 18 Oct 2019 10:44:26 -0700
Message-Id: <20191018174431.1784-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHyOO22hMFXq

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 13 +++++++++++--
 target/arm/translate.c     | 28 +++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2d6cd09634..d4bebbe629 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1789,8 +1789,17 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
         s->base.is_jmp = DISAS_UPDATE;
-    } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
-        /* We default to ending the TB on a coprocessor register write,
+    }
+    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+        /*
+         * A write to any coprocessor regiser that ends a TB
+         * must rebuild the hflags for the next TB.
+         */
+        TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
+        tcg_temp_free_i32(tcg_el);
+        /*
+         * We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 698c594e8c..cb47cd9744 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6890,6 +6890,8 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
     ri = get_arm_cp_reginfo(s->cp_regs,
             ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
     if (ri) {
+        bool need_exit_tb;
+
         /* Check access permissions */
         if (!cp_access_ok(s->current_el, ri, isread)) {
             return 1;
@@ -7068,14 +7070,30 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             }
         }
 
-        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-            /* I/O operations must end the TB here (whether read or write) */
-            gen_lookup_tb(s);
-        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
-            /* We default to ending the TB on a coprocessor register write,
+        /* I/O operations must end the TB here (whether read or write) */
+        need_exit_tb = ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
+                        (ri->type & ARM_CP_IO));
+
+        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+            /*
+             * A write to any coprocessor regiser that ends a TB
+             * must rebuild the hflags for the next TB.
+             */
+            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+            if (arm_dc_feature(s, ARM_FEATURE_M)) {
+                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
+            } else {
+                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+            }
+            tcg_temp_free_i32(tcg_el);
+            /*
+             * We default to ending the TB on a coprocessor register write,
              * but allow this to be suppressed by the register definition
              * (usually only necessary to work around guest bugs).
              */
+            need_exit_tb = true;
+        }
+        if (need_exit_tb) {
             gen_lookup_tb(s);
         }
 
-- 
2.17.1

