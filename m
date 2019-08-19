Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3200822wrs;
        Mon, 19 Aug 2019 15:17:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU1sjVoOTOYnxyFWXXO3Xc/ll4Q8XiYCDB82j21bci+0XiOpH8/3BX1baqp6X8f3JT9zW3
X-Received: by 2002:a0c:b0ef:: with SMTP id p44mr12324699qvc.27.1566253060869;
        Mon, 19 Aug 2019 15:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253060; cv=none;
        d=google.com; s=arc-20160816;
        b=S2Qmw87blPSmx596Xk9Dos9yDy6/TRlH9cPOqpVm2GSwJE7jR//AoYb58PnE+rEiDz
         wFqEXSlXYoa2TJqLU3LtKt+bRzAPPsDCZkLmhFIUjbiTMMAeVslj/K8H11PIbmYKXjKW
         r0tHKHmCG8y5yOWRjA4LeC4dTfKCzCUzkVrCHF7+yENX+xDG06rN0EvdozZJJSwRyLjj
         4rNREXfoORrbwDFUE7wz088k/9nbK2HIpnUNXbiRgKiaga7wtNzmp5YJpluyfSyBdhOs
         tHW2ZwjBx2A38mOM5Q4IrShXE6Unj53WQ80NZzJXimxlebFwjyvuRCwi76YrNxFhMp8Z
         ee1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MSRdVhU7JG8W/BPDMD9yM4+AFvL57yq4+jCtr5it5qs=;
        b=sOztbV2OIjDDB9FyayPv2Wu9SIG7prLgPTHMdxGinZ2HBxPqw41yvjJErh8wjxrviD
         9ExWRlLUTaTK6iZ1bjaTnaZpEkWC1tnG7SusHMAJSNIKu1vJo2UMljXjdzFQb93/9vel
         W7GE/saktluOhLl/n6VjXGo7ybbhmzk47eKsXXbziNQ2kixd0ba4swgn54XLe3Rpq+vF
         k+HAfXkEmRw2guoeryH9+V2iQsB6Rezui5n3wDGjM1GXK+O2mg2eP4tbSDjhB6Jd3iKz
         2uXRIEdins0YOeMgCDdyRBrcP+2OQ6FdlK1PR9US/Ia+Q/eosDj8FbAD9IVlqYLFb5fP
         ik6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MfNrJqun;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26si9250241qkj.290.2019.08.19.15.17.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MfNrJqun;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpy8-00034U-1e
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMu-0002ru-Kz
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMt-0006tq-AC
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:12 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36037)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMt-0006tS-4r
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:11 -0400
Received: by mail-pf1-x444.google.com with SMTP id w2so1951750pfi.3
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MSRdVhU7JG8W/BPDMD9yM4+AFvL57yq4+jCtr5it5qs=;
 b=MfNrJqun3vCG68VZiO/VjFAj/jU5TdGWWHXIdVS8Wq/oDPKHyJLY6bsLOppK/2WW9x
 kp5/IbXli5q5HiorX6yS0OXGRtm6rPC49cJNXXnut18PlEmx3HAM4LZow9dr7nv/5f/T
 aFwFecjkaYaxQMH5fLopbSrqPQYr2jpoJDvXpS7YkRBqVUBIDOFyTBF/aUBF6lNNg/Ki
 kGuaqALxGeZB/1QMRtr7kUwfS89PPA9e2LITrTcLquaD+ft585s00N4AiO0HwBl1nGLn
 TWlcJiS00icTVhV5nMtd6/FWDMmo0z6WAodEVNJbW/ncuFsfC00J+fEaHr7WF7+ewVBO
 mAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MSRdVhU7JG8W/BPDMD9yM4+AFvL57yq4+jCtr5it5qs=;
 b=W3kFa0R0flGQi9BMANJRxxlJrRfJHIju6bZWKvETVdpjOn7pljOjKh6aobVN1bWoTo
 AuX/x+jpxY74Sl2LO+WdH/4UYz0MYJyBpTxCOwfqMuyoJibaT5nXH7CKPJTYNyALpjJa
 RtIyTNsFBEAW5QuQjpDvPo4mHI/EmARwCvBSrtO0XFDQAOzSOd0RahSRvVDPyH8v8DFE
 z10g0rTjE3S59LFkv4Nu777owCgu/VUeil0lBi0mtNYsPu2fDE5i10Q6u7d1D5iFT2eV
 A/L+ZhF/SiswUe6nkwmB5VLH9WMQnNtUVuNEHzaZZ+Oo2mBa6iNcxBfHd/eifU0shlYE
 1IiA==
X-Gm-Message-State: APjAAAVg18RUesZ+ISD7W9QVl08RASS76UqKBVIq+6iLemTvkMBWg/w6
 FbiLhgXsazC5ivKd2eALgpyS9hKUaR8=
X-Received: by 2002:a63:20a:: with SMTP id 10mr21611744pgc.226.1566250749834; 
 Mon, 19 Aug 2019 14:39:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:46 -0700
Message-Id: <20190819213755.26175-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v2 59/68] target/arm: Split gen_nop_hint
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
X-TUID: HN24qy0/4Tjh

Now that there all callers pass a constant value, split the switch
statement into the individual trans_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 67 +++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 67f0202d29..9e0345adf7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3045,46 +3045,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
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
@@ -8165,19 +8125,40 @@ DO_SMLAWX(SMLAWT, 1, 1)
 
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

