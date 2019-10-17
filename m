Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1344454wrm;
        Thu, 17 Oct 2019 11:52:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWE45Rgsr8Mfmf35qXxtLHVq81aPirqqeFk6WRkCPszalNbiwiT+jROqs0qVj4XGuHiODI
X-Received: by 2002:a17:906:8313:: with SMTP id j19mr5078364ejx.196.1571338372202;
        Thu, 17 Oct 2019 11:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338372; cv=none;
        d=google.com; s=arc-20160816;
        b=ddvgIEbjh3kM2c6XCvZN12PcUVuS5YXQc6NnYB73UCeOtUbMlq8MqxtPpzdhXY1we0
         ikUXu30o85fAX+pQeeouq9NBGYKUmjdxSdDIu9n7Q0RmWz4feFbtyx0rOy6OONGa/gU2
         lUmzsGeFoUOgTJFV+Ee8bSKFL317/EcxuzmfMF9lrcLetNHgC1FCaQE1wUn1GjATicMe
         V/N5TinTbu/o7xryJPjfKfrILrZQk/0ahrmq1gZrpo+m14f7IKcXYDV+foph+A0nM1Vg
         89K5/p9zUJkF+nj9ag9iY6WSPOVKyDLWX2z6qOyBqAYqqE/sS+AAG7Xob2Yht1vj9ikD
         xXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
        b=R+tuM279lLH1sZBr518TCD4FkmrLqVJojdF5TDmw0gVpQGnb5OCe3vr+xuyK+pGpS1
         +BiPjBFqSD/EPBX5F9v/pa1no6j4/d95HOxhFclTGK7I1hc7xCP5KYGlfupdt0ZF8iG4
         tKXaD3sIt2t5q6rPT677T/e/yXd83UTWflq8jMbONmHHifSjeMTkn3835kVihwTWVprY
         FxQicFy6rSMbjntxvANALjCeVeh+xbQAF/XQ8xbKHV1+dzIS0pXeAkhMvqbm+2uBSzWk
         QR80EghRb+x9ogQuZEdMmcNdy7POIoTXs538CPWf2gn2RZnKbzzWJ1S/BHB5qzYfPFsf
         dORw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IiuVEfLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si2421958edb.164.2019.10.17.11.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IiuVEfLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAtH-0002df-3I
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs7-0001Hk-Sr
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000wK-DU
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:39 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000vM-3h
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pf1-x443.google.com with SMTP id q7so2207196pfh.8
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
 b=IiuVEfLf5+TKjAGIxfM3Cl2hkN4WSbjcY4rplM0tp+pBS4sNEcM6FffTkXxmpT8DV1
 u7iLsMVR0fk1nsdpjsCuDmv6cdF7jEAZxHerfu/MMXM1I9Fx034cS6YxeVYiGNx6vuj5
 KEbqabNhtejIbwEObLto6LcqpAb/VGWrYWkYMngEU5RDnFmi5rFBBcw3urzEi+Tka1Ux
 JiR3EdUM/iqu7OzvjjhuVZt7w+JDb1qUX5qPSCHtwDbMVVmLAXRSJJXjmoknuCihTSpM
 Ksj+lqBa4/66Jl6ZCvjVdxghw08WsaPizSNppxzUR9paT/RnxtYwsFBfvEdZ3GxlQpDr
 CkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mb3YwiZncjKHxGhu+AsTIpQEFeyLEnUoSMmhup1oAE=;
 b=rM5nzb0rMllPR3i904OVw/8M7w/nxO3tLpvOxKVkOEGLJ8Ah5wTz/YGaMAaf9bNhaS
 +OXKtNucL/QWuVOZijHuaHvSmc0h9aSSljmtri1cpygHy65NhW2ASYxKbTqxNZ+HjHC6
 3vjOdykFxKCFryYX2Cp5zbIq6ifdCLobi4qZzWH/MTTIoCJLiQNMXfPPga61YojUr2QG
 CDZaus1f5hj347yxBycqR3bBIdRrZhIJ/A3R12ULcY+YEhpVx7PvLhP70USpDl4bJTgi
 Ur8eG7B/9QhAK0N2sjMkgb0MZQJQnh/4PYNbSMmMzsylD/JnJJDTuQyOJE3ANUSAPlc8
 UKyQ==
X-Gm-Message-State: APjAAAV411+VuFLNjzw6Mz9sqROmpnaqmB797cMIsiUAN6kG2veux1PL
 5ytXQ0Gd3Z1jb0iZzAtwo75/fw==
X-Received: by 2002:a17:90a:c405:: with SMTP id i5mr6407369pjt.9.1571338294787; 
 Thu, 17 Oct 2019 11:51:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/20] target/arm: Rebuild hflags at MSR writes
Date: Thu, 17 Oct 2019 11:51:07 -0700
Message-Id: <20191017185110.539-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: U+nQ70UFZtIY

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

