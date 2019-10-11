Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1036381wrm;
        Fri, 11 Oct 2019 09:15:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxreRO1DSGmm1JKkKwU7cHTJDbkZzN6nEECSM7tZJkJbhDm8XS9m8yaHduZfEKrdT0/3qSe
X-Received: by 2002:a17:907:10dc:: with SMTP id rv28mr14540727ejb.7.1570810520229;
        Fri, 11 Oct 2019 09:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810520; cv=none;
        d=google.com; s=arc-20160816;
        b=oPyDXQM4ubgiZi4uXjy5CRC57zyp/rYNFvjrNvBRzlBOiouW7tU839UAAdwXzBQri8
         fA63o6KL1iLKcmPxCkm1zZV0JILdPyavwTjRV2pc+vaDn6gfErtKJrBahHSmXMNvaO0R
         oW8aRpT51lDNZhOIqlml4CmfvfQPTUjUug017hm/iCj6qH0EttJ/bfSBtam6e+z6apFi
         JbG6g0R7L24njFcHQSWwinFxFvFxe9phLUhaQNp0quSwu8+U1twUIzuj4swmOxd0bLR3
         7JvZ6b3iLhMEo4fOKo91vWLI+40GgfY7RPFlPIGERQoNBAbrgupqjGNe578hU+6WbU21
         01Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=cl2cwLMmZGvzhfN3CV68TLR9Wvkj57GFOp1995kUBYY=;
        b=NTlc1x/Eub60YsOHKVmDy3PwGhKaHKysRkA14eivMGthiAJLFVa5l9oO/gWrs8szA3
         lF3OAhFGWVRgBUQ6ZGFdUTTwAo/b01hv/fe1n/OkqBx/WegPEloc14+YFgCh0b5xeuh4
         UfAvmgBMYkYSiqbtMpkMoy9gsE7h1rno9CJWiQ68DfvGtBfyUHy+W8j3txBW7aEfCLmb
         4tXSIrxuHTfkcNLr96KaSNZZPWAl8NfpdXb98uHM/WzNBxcnAQ52K90CwguAGWPWDTyp
         dv5WzzkZnKMZr5C0jqoEPc/C+kBKSp1jQ4NmsWHU3EdKIM1mTEU/eCh1ckMGBqpYWTkU
         2k6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B49Z/cTC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca9si5726877edb.79.2019.10.11.09.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B49Z/cTC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxZW-0000av-Kj
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGz-0002hZ-Pz
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGy-0007p3-KB
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:09 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:41443)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGy-0007oa-Fb
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:08 -0400
Received: by mail-yw1-xc41.google.com with SMTP id 129so3643083ywb.8
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cl2cwLMmZGvzhfN3CV68TLR9Wvkj57GFOp1995kUBYY=;
 b=B49Z/cTCHUm2tttXa2Kqx7xjEb91HMFOUpd2mgGzAjop/aq5kUs/1WoYQR2ENO0+ux
 E9zyUvimlJzur/K08AvVyeE3riN3VpaFRsnv7qviOVK1OMyf4IRc8kcPi7G6oQQJS/iM
 6NiqlhZi1DNxr5vrSlsL6tov8J4s31/1XqoRhA56SnJ5IkZzhmX4+hnlJYFCdsp5cmB+
 HThBU1QgUJA8GXqzm2QzpiJu3jumYabNEM5m70386s/g7XjeLkGMfSzgS97sORNCR955
 eAd12by+4L4IkGbpGJVI6HdOrDHLQHFOwyNBhTmDyj1lxZj/999QAuvMsCMbZPv9SKh8
 mX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cl2cwLMmZGvzhfN3CV68TLR9Wvkj57GFOp1995kUBYY=;
 b=DFNz4Kk8oIdxUwR/FND1vi30VcuSt0PdcTt2e1klAoRR33ykzH2VNeWDQxlDsmy3LO
 5RQji62FbRqT1+EpyST7jtHHMq0eWg1tCS8szxrP1XrP/BgnNZog4MMNN6RuyvRxGKkl
 ZBKXl2OX9xN7w3oR0H2AHbiDnjqMDyJuQKgqYcxeGWs2qQmqbU/vtLzfdeKHTz0Ppr3c
 VpzVI3+eC4y1Ad7AS+5Hw8um8NhYI+yFJEviElkmzI5LSOWEwq4ocsno0DC9qyJmSxjN
 sukvy8dqWOYyCa3Xl88q7VSvmljqYFlBg6NZ07setJN9lL+EOhPKZSxO2kRtWIBvQfv9
 xCPw==
X-Gm-Message-State: APjAAAVXQS8+YbegUQgQNrSA60PmCE0Gm3hzGhrFxPo3e/GVkd9WUer+
 S/Tt5aiykvupdkwyIxjj+6LobPeSMfc=
X-Received: by 2002:a0d:d956:: with SMTP id b83mr3097689ywe.68.1570809367858; 
 Fri, 11 Oct 2019 08:56:07 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/20] target/arm: Rebuild hflags at MSR writes
Date: Fri, 11 Oct 2019 11:55:43 -0400
Message-Id: <20191011155546.14342-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FKRKLz3IgVKY

Continue setting, but not relying upon, env->hflags.

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

