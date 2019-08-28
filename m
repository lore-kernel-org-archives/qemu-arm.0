Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1205079wrs;
        Wed, 28 Aug 2019 13:00:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxltvX+ZICdn36S2hD9VyFAGbEDHpm4PVFbGhoTPygeVtvoZmYAG8YAm2C787HlJoPQ5Guq
X-Received: by 2002:ac8:6684:: with SMTP id d4mr6098480qtp.286.1567022436761;
        Wed, 28 Aug 2019 13:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022436; cv=none;
        d=google.com; s=arc-20160816;
        b=SIHk4Hcl2MwHyOLHx2xBzSxiHeggDHdJlh0QiiVjBX3U03Hts+ifPMinHTBZrMUvt8
         jrSp4nNbGlvuHWnMZtcxiKz4RZUHAmYeXkTngkXjBUVgGsQxueZsywIZ8BPs6W3Q4sk0
         9uCMRmNlJVog+EATu9ew1Vi706ldevEwEL6FP4wsxSwhDr0+nS7x5TIA6E/SR56mV/Ra
         pu5UZ34uqX8vNRm1iUN2r39QHZTGLtS6SYV/YDjS04futbMbTBbUKAHV8RjX8od1xeOq
         iwDX2xwBcqX/SJl8Hh4HBsBW5GQOQ6s6Thf0Etgbo/8HAEGsMw+cg8OgFnhsB75x4Lqp
         RA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YeIFIe6n+qNkaqMNDbQLOQi6RqvsGYoOCEwWlKiQ2C8=;
        b=mNiXSSWe+Ev5fZi8/rDAk03uvDPCQX6aMkoa72sH6YQ5EZIExBWCPMq4sRnSh8YVAb
         L294O57+mmcqWyFbagr7r6ATUfPbNUcSqerOW4wJXe9sOie64+Hpb3hUq29s8jYEDnzm
         vJr+egGZpFc3cevUMO9JzWlkd0ffrYPeVTY1pLdkbC3so+3WCJ9BIL/vqbMllUkiwk0t
         xdwYsZvkW0VzzcbctF8+D+iVK+Qfska+0VO7DGv61xEgHaC41iB31EBrRW+re0KEmRWt
         VtHFeyEW8CBdyYgyOO7Ztx7zTZRtgabZOL/z+p/17pzKf4oZctyKnPNY7aqwslXtexCr
         yBbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGFI9v+y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si117756qto.390.2019.08.28.13.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGFI9v+y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i347P-0008OH-ER
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gw-00040k-GO
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gu-0000ke-D7
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:22 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gs-0000iM-M7
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:19 -0400
Received: by mail-pg1-x544.google.com with SMTP id k3so209653pgb.10
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YeIFIe6n+qNkaqMNDbQLOQi6RqvsGYoOCEwWlKiQ2C8=;
 b=cGFI9v+yYvM7OyVOL802yWUrQ+heODsU5521ukAB2ZrcogJj/fekfXMGfX6jwwqIug
 t6/VBxuZm/i4bI1YnI8BXxoeMAuKeR8DaQ/R/HFcFTX0FVvmQ0eynQU01zauTeUT7eF/
 kPamqgGP+WZ8zH85efEalIvJRrYrrHg8+kH7yC1IQYlFbxGfvfn69o5Aa+RJvDbqXKfL
 s0kxKZQ/guVv+gXgT6E2PPpPAgEpeu81TNf+JZ4uEfS9ZoXix3MOE+1La8/U8zfF4c7T
 U6MjisURYrKUJOaLtQLmrD9ziLZeReo86PcVX3s+Cs0y4tS/doh9mFXDlT7A7TlyOW9y
 Y3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YeIFIe6n+qNkaqMNDbQLOQi6RqvsGYoOCEwWlKiQ2C8=;
 b=U2EiYX7ZlGfo2viLU5zIjKjJiaaXq8gLy23nDchPCuHIrNvdwULgUKCLIrvJqHB5oq
 0oGsISoODgdTm14W9D2BokD299p/XNKQz3KTeQmStjfMg1wxSYwoXEY/KCJhT07VF01n
 gsQGqzcC6X2DbW6P5U4DCkMxWzcNJid3/oflaRgSoC9uMp2aVq1cB2w5W9ZwiDXoLYKY
 e8wQAUhjL8MRHT0KtAvbwAXDnVw6ASmbP7OARFArIzBcHopX2YamvtaXokt9/UQ/40Ap
 IJhFkOomacqh4wTEWV2xZgrKTeBsdDD44Js2yX3cUhx10T2gig9ttjUO9IsnG2g9znas
 FR2Q==
X-Gm-Message-State: APjAAAUv6BdHSluFvOYOj8m0w6xTcX8/tJhSGsjR540GtnmHbuxNwV3M
 RAFoE4Oc/wzdAyKBSwGm3L6cEWD0mSw=
X-Received: by 2002:a65:5003:: with SMTP id f3mr4798865pgo.335.1567019175981; 
 Wed, 28 Aug 2019 12:06:15 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:47 -0700
Message-Id: <20190828190456.30315-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v3 60/69] target/arm: Split gen_nop_hint
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
X-TUID: BL/FHx6eIx/t

Now that all callers pass a constant value, split the switch
statement into the individual trans_* functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 67 +++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1bbfea8ea4..c7d7834440 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3042,46 +3042,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
     gen_rfe(s, pc, load_cpu_field(spsr));
 }
 
-/*
- * For WFI we will halt the vCPU until an IRQ. For WFE and YIELD we
- * only call the helper when running single threaded TCG code to ensure
- * the next round-robin scheduled vCPU gets a crack. In MTTCG mode we
- * just skip this instruction. Currently the SEV/SEVL instructions
- * which are *one* of many ways to wake the CPU from WFE are not
- * implemented so we can't sleep like WFI does.
- */
-static void gen_nop_hint(DisasContext *s, int val)
-{
-    switch (val) {
-        /* When running in MTTCG we don't generate jumps to the yield and
-         * WFE helpers as it won't affect the scheduling of other vCPUs.
-         * If we wanted to more completely model WFE/SEV so we don't busy
-         * spin unnecessarily we would need to do something more involved.
-         */
-    case 1: /* yield */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            gen_set_pc_im(s, s->base.pc_next);
-            s->base.is_jmp = DISAS_YIELD;
-        }
-        break;
-    case 3: /* wfi */
-        gen_set_pc_im(s, s->base.pc_next);
-        s->base.is_jmp = DISAS_WFI;
-        break;
-    case 2: /* wfe */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            gen_set_pc_im(s, s->base.pc_next);
-            s->base.is_jmp = DISAS_WFE;
-        }
-        break;
-    case 4: /* sev */
-    case 5: /* sevl */
-        /* TODO: Implement SEV, SEVL and WFE.  May help SMP performance.  */
-    default: /* nop */
-        break;
-    }
-}
-
 #define CPU_V001 cpu_V0, cpu_V0, cpu_V1
 
 static inline void gen_neon_add(int size, TCGv_i32 t0, TCGv_i32 t1)
@@ -8168,19 +8128,40 @@ DO_SMLAWX(SMLAWT, 1, 1)
 
 static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
 {
-    gen_nop_hint(s, 1);
+    /*
+     * When running single-threaded TCG code, use the helper to ensure that
+     * the next round-robin scheduled vCPU gets a crack.  When running in
+     * MTTCG we don't generate jumps to the helper as it won't affect the
+     * scheduling of other vCPUs.
+     */
+    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_set_pc_im(s, s->base.pc_next);
+        s->base.is_jmp = DISAS_YIELD;
+    }
     return true;
 }
 
 static bool trans_WFE(DisasContext *s, arg_WFE *a)
 {
-    gen_nop_hint(s, 2);
+    /*
+     * When running single-threaded TCG code, use the helper to ensure that
+     * the next round-robin scheduled vCPU gets a crack.  In MTTCG mode we
+     * just skip this instruction.  Currently the SEV/SEVL instructions,
+     * which are *one* of many ways to wake the CPU from WFE, are not
+     * implemented so we can't sleep like WFI does.
+     */
+    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_set_pc_im(s, s->base.pc_next);
+        s->base.is_jmp = DISAS_WFE;
+    }
     return true;
 }
 
 static bool trans_WFI(DisasContext *s, arg_WFI *a)
 {
-    gen_nop_hint(s, 3);
+    /* For WFI, halt the vCPU until an IRQ. */
+    gen_set_pc_im(s, s->base.pc_next);
+    s->base.is_jmp = DISAS_WFI;
     return true;
 }
 
-- 
2.17.1

