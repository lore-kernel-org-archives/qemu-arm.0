Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1157468wrp;
        Wed, 4 Sep 2019 13:20:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+g1EPtwVnbEJ+697GqZLu79pQlxsFhoVd+PI9+xGGompAlTCLeQCIyEllXrYk19AJq4SD
X-Received: by 2002:a50:d090:: with SMTP id v16mr128732edd.176.1567628443517;
        Wed, 04 Sep 2019 13:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628443; cv=none;
        d=google.com; s=arc-20160816;
        b=gObkzIKSVgkNM8RXnFwtg693TukHEtZP7D9m+fDf13E0NvgzwvzykME0MDw5izm+RX
         g6xbQWz9nT9BnzAST0xkLxjzgHcSL7B4YPePXDJK2X6iOnqqgLPFb5PYPd/TfZhoeRRU
         JSwWbTXAJvPwJHHOXj4B01QVEhNal9URCMIfTqiE7B0kMT+HiG4Fe6QVFJrgCiqSNzYN
         fFpUWlM6DMn2oAukcziP6UIIZwDlX1To6TSSXmH+LWvqlvrD4y3dh0DIzQVkMYjLy+fg
         FKhRE58NbREgrE6TasTDxepCgeh1mvCpAbkzdiXy2To2sdoyt67f38taEx+a/E5+R6Ac
         TtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=QO3IBs61SUEB1dyssLo6yzRJXGICvl8lJuuHe5SABa4=;
        b=jXYuRClnEQ3FZ/PDzi8an00gs87RnTKtSFn0GgPtvMz09J5386d3EVPdRpQL+xAz+A
         moYGPpVKl9P4hJIWnw3QeM21+M0xKxmyu8RwHR0EcAfzEdrpRyi9SRJMplbK6Qh67RUE
         CWLL3AP1yDH27SC6qsB2KG+BGXb3d+g8Bgi32xceulnant0YBVgHs00f8qAmN3p3vOrQ
         KKPA/0FK7hjnIJsqeR8TQP8jR45L2xC/2KQ8NpWunWyMh9WFOUn2Lxx2hggsS0unt54r
         AGDFYXbymgsXmHTzQfGvhcnOLLRlc1R8i54uhR0d6xr4HjDXpf6f76UmuTgaqMGC0Z+j
         BylA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nKLxRsbD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29si8134225edx.16.2019.09.04.13.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nKLxRsbD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5blh-0005d1-TQ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0x-0005Ys-5p
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0t-0003B8-15
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0s-00039G-GB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:18 -0400
Received: by mail-pl1-x641.google.com with SMTP id bd8so3713619plb.6
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QO3IBs61SUEB1dyssLo6yzRJXGICvl8lJuuHe5SABa4=;
 b=nKLxRsbD9qVwU7AV2bUR2h5Flog47pBDBLggJR/s4mautgkbdP7gh3jngNlkJDF4I0
 gK3CB9GvbaAvnfHoujqVwMEEU63KNcI50Ty9Q+Dwy4ismaU9WbL4erabtcjtzjbrHRLW
 TLBVQvPuYH/oDnAsOoa8ARU8jBak+bSmQbJiPbLx70mw8QN0qBJUwYQ1MVvHxUESGhrR
 0FzL6WYcBAnq6d73Ypc+kkkYV5ASNqPg4JyuEcS7V+QJ3ePgTlNjVzd45QskXg80uq2x
 m1q8kQ45CYcOxmNhoRqsX/xyTOYLhqVhu9e1C5vbyUOLlM/YDQW4WHEAdRm3Opd3/k1Q
 sl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QO3IBs61SUEB1dyssLo6yzRJXGICvl8lJuuHe5SABa4=;
 b=Q5JKsnQAUIF3xjsuSJZERf38u2GpvfszVne+raByBuHQKlZHE0l667+CPrq3g8pLHE
 72VT/D0IE8aqDcP4DuKIPqNyZwOVvlUaUKbbe79EueD2SlN6Xcv1pF1A3vu10/PDaSqV
 3lKb/of5WlualTIVRFInprV/DjS4mDsjyWbQ/U5K8gpJZPQ3PPla9UpD9mnHOQ6YFiB0
 76woEypkZRn4RQbIXaxOLHQckSllrd9+7DApdU0soiFgU9Zo3zRmMv6ECpmjJtU2iIPu
 exvSjf4OnGuV48PHjwwH+VouoO9/4QYAtFcHlRyfNRmSN1M9KYIuM+bhZAPIOZkqL3cg
 uC6w==
X-Gm-Message-State: APjAAAU9+VITpgR6lYK4LUqwM7gTq6BQ3KTDXgYz1BXNroxvTlIlz2QF
 p0b5j1m8+Map2vw/q0RP/X7Ms/kd2is=
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr42247324plo.47.1567625537068; 
 Wed, 04 Sep 2019 12:32:17 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:50 -0700
Message-Id: <20190904193059.26202-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v4 60/69] target/arm: Split gen_nop_hint
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
X-TUID: 60HCxC2p9OTg

Now that all callers pass a constant value, split the switch
statement into the individual trans_* functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 67 +++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 69092c12c3..d076c962ea 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3061,46 +3061,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
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
@@ -8194,19 +8154,40 @@ DO_SMLAWX(SMLAWT, 1, 1)
 
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

