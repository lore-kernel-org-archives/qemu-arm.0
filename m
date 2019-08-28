Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1208777wrs;
        Wed, 28 Aug 2019 13:03:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPPIL4nOCD/DKaF+1Jg/qv97bAgL+f6Iuq4M3TOWFR3ezIS8sV4OQ9h+NfcnYvb78aRxiN
X-Received: by 2002:a50:972c:: with SMTP id c41mr6082392edb.153.1567022620241;
        Wed, 28 Aug 2019 13:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022620; cv=none;
        d=google.com; s=arc-20160816;
        b=lO2H63kbmc6h0e5wVUgAZW+V0XWdRd7eiSFtA9yJhgxjRSZPU2aVmWPVVV7fWMWHhQ
         wa7yXSht6KpVbU8RMpTtLM0nTo5/fU1LO5u9D7bRAK6dgf2Y7odT5Q0n89NvARVT/bA+
         WQGUbnTDi9SDt7cpcx4V6TjPH1O1zESHj6jfIDmZvqwFihfuBrNMnGjL0KtGbi5v2O/v
         FyQ0r8ExwQa3nslGZw2mnzRHQcu8EScNE2QBpAyij+MUQWZLoDhWvLSRaeCG+vXvOfTp
         DgEyHyFqI7CRyjl2wm0/RKL1fr9D1JCIMXpI4ryR/c3+np5QC19YI82to6JX3V/pWtnc
         1rwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gHxh7NJ9ZDQD5ad3sh/ZYrxo8RnJxM/j1QAWPCspKQ8=;
        b=tEjc7XFSGZHmytoKjuFXFlhMoBfzSt/5p9C2cdQYW4+Za0TtxGm/dbVSV1hFfAARin
         Kui8G+YSS/lFLufByplekg24ZPwQjuvjmigPJ3KrWkCBsMthrpn0WA6a39bl0wvQGIa4
         MUxCtQzpLkkx+hDUaSxLGMySlVBZNJzwxW8SBMJzxH5yYuQNlSNUAsFMH4EKsP/eMWwt
         PTEll3BCUjAB0iRkdSmSYlOx3AAa+VxINDQUqI4/8ys2TaWDnCdCE6apzAiDB0Ab8mfs
         hk40Wx9QqEmDTzPEkoaG+DtEq1mOspZBoi5Xfu+I7No8oV5RnwFFAQOvTDdNfV5S7W5W
         Y/jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCb+9M3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c38si1997055edb.217.2019.08.28.13.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCb+9M3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34AM-0002iG-IL
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H7-0004AB-PF
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H6-0000sU-Ef
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:33 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33H4-0000pn-77
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:31 -0400
Received: by mail-pl1-x643.google.com with SMTP id gn20so408360plb.2
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gHxh7NJ9ZDQD5ad3sh/ZYrxo8RnJxM/j1QAWPCspKQ8=;
 b=jCb+9M3HZ8mMyUcbr7jvJ4BKrD6Mldz8iF22quWO5UNM3T/caBgOkNaKkOuP52mdkS
 rpSC6bnPRLSF4UbTvKiLJBnNEC7WFDphwL7+qjnRMJbc5oTuVRIohGQZmyDOKd//ok/+
 kVJ+qq/XY+xVG7Y5uOrht+zJDeYwyt6P59/kib/Pqns+ZbnC4mLU8k0tI/OQuhGfEgsN
 Sy3xYwHe0ihKhfCaLwVakpplAGcFr03tWd/8fj5d4P9xVOVzsXmmIqI7ZNBSWbrX7vMd
 w6lW6dJ97hImbuQ2TatuJdvL/ppt6ZCyHLCOXjreefGXr77s/iMcuzBQtTlHg6NnYMO2
 S9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gHxh7NJ9ZDQD5ad3sh/ZYrxo8RnJxM/j1QAWPCspKQ8=;
 b=N3dF7Rd92TkT3HhMGgJMVXDWpIDSYYJ03MZISSyhlXSgd7QZgWgIAIYRsZtwVaXwqu
 a6dpQ0/Fa7nRT0+7DuA61pjJGsQ6MbIZBEAJCjAUWPzkvsH4ln/lCJWdfydpVGJ0N6TO
 Z21C4dqu2Su7jBpRgiTwTainA+W+QiHGKEeQGmweiDP5o4GIVLhvZCo9J8/OzrEP/Zmr
 gDCWud1AbxH3Hncb9l8EPiq/1GiONHdpNe9vtG5yWkCMg7jQqWi6BQ+bAu+lS88OX1H3
 TjrdtmtERdqMFl8MAXuhnIQJ1IsY909sPRXtlgMQrONomlDuqkLBzIOn0KxuUrpedzhb
 ptnQ==
X-Gm-Message-State: APjAAAWe3Cv4oSOOIK22TdcwQZKxLWKUsN4YtjDTEn1Fc+uYJipxm1TG
 /zqHPBTf3Sa0HF8ZBLdYzu0m2w==
X-Received: by 2002:a17:902:ff02:: with SMTP id
 f2mr5394995plj.99.1567019187200; 
 Wed, 28 Aug 2019 12:06:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:56 -0700
Message-Id: <20190828190456.30315-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v3 69/69] target/arm: Inline gen_bx_im into
 callers
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
X-TUID: QIoT9/SICwh7

There are only two remaining uses of gen_bx_im.  In each case, we
know the destination mode -- not changing in the case of gen_jmp
or changing in the case of trans_BLX_i.  Use this to simplify the
surrounding code.

For trans_BLX_i, use gen_jmp for the actual branch.  For gen_jmp,
use gen_set_pc_im to set up the single-step.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a9a6d3a1e..253f9f4142 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -765,21 +765,6 @@ static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
     tcg_gen_movi_i32(cpu_R[15], val);
 }
 
-/* Set PC and Thumb state from an immediate address.  */
-static inline void gen_bx_im(DisasContext *s, uint32_t addr)
-{
-    TCGv_i32 tmp;
-
-    s->base.is_jmp = DISAS_JUMP;
-    if (s->thumb != (addr & 1)) {
-        tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, addr & 1);
-        tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, thumb));
-        tcg_temp_free_i32(tmp);
-    }
-    tcg_gen_movi_i32(cpu_R[15], addr & ~1);
-}
-
 /* Set PC and Thumb state from var.  var is marked as dead.  */
 static inline void gen_bx(DisasContext *s, TCGv_i32 var)
 {
@@ -2706,9 +2691,8 @@ static inline void gen_jmp (DisasContext *s, uint32_t dest)
 {
     if (unlikely(is_singlestepping(s))) {
         /* An indirect jump so that we still trigger the debug exception.  */
-        if (s->thumb)
-            dest |= 1;
-        gen_bx_im(s, dest);
+        gen_set_pc_im(s, dest);
+        s->base.is_jmp = DISAS_JUMP;
     } else {
         gen_goto_tb(s, 0, dest);
     }
@@ -10105,12 +10089,16 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
+    TCGv_i32 tmp;
+
     /* For A32, ARCH(5) is checked near the start of the uncond block. */
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    gen_bx_im(s, (read_pc(s) & ~3) + a->imm + !s->thumb);
+    tmp = tcg_const_i32(!s->thumb);
+    store_cpu_field(tmp, thumb);
+    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
     return true;
 }
 
-- 
2.17.1

