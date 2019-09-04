Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1163715wrp;
        Wed, 4 Sep 2019 13:28:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIVTG1/Tetvopja4xH6uOr5sXGMPyI3AE7SnUFJbZ5RFN2akqnhIn6IbJtnj70n+Zruka9
X-Received: by 2002:a05:6402:3ca:: with SMTP id t10mr98942edw.271.1567628887660;
        Wed, 04 Sep 2019 13:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628887; cv=none;
        d=google.com; s=arc-20160816;
        b=QGwjwAtAWSApl1Tfcxf0FvauoHHr9P97xFoh5GkJAv+kiP1BVmwraIBvrhVKOZ0xeG
         JUuysGWJRdEW6rWQ1v9alFBIXQYSN28e4qQXzf24Paht5djYy7HKjrU/cwFZUtEOFlXx
         iNAVNFVth7hHxUXhHovEs3Rf0r400Geh+0TXl5hP/7B7KhPLauJ1lhN4fzURsApbbTQK
         Tb8Ue86VV/ZKdgLfNsN1XrDS5A4RV0RIWGitQuKRLsf/TaGbfKMPmdZ7hsSqo1xYBpHd
         PHI5xHHkmvW7gzTRoV4m2iG1u7ew1mkE3HL33hdyyU1Aj24otLN0brLonZrzycWOmASc
         W/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/PXkXzASKMcUQDbV6Hl9B5xocqfOCXTaxlqtgyWXLXY=;
        b=h03+orMW+NFzG5Y5AWcVvsyTC3F7V6uABYgt2wS8Kh7pOBxJjkxntv/zrzWxWgTzyN
         omrYKiVnPuEZzEXKvUZZWFKo/oEMBy5faV32oqKgAerCrY8oMF9mrYfUAqMCdDebr2LO
         in+DLziHEf3C9eGgD3OiFy+iDU6hsiWWiPoVHGI0DgbaLbSDGT/4p6QoP5ykCnYeyMgZ
         kz1eSY9tTHbk3c+JnrZWieuJjhU0mFWQvN6muNGXkmMbpA83DegJ3z6ooorkB+g6XMr2
         Lrc1+4NuVEhQT/FhrWWJzRR7axDYkHR0x5tDVVD2yQUpne2H8O3fTablhTDGibnrjUcO
         yFzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oABczCk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si87215ejr.6.2019.09.04.13.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oABczCk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bss-0005d1-E3
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b17-0005eM-8W
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b15-0003Q5-B3
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:33 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46981)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b13-0003MJ-90
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:31 -0400
Received: by mail-pg1-x544.google.com with SMTP id m3so11751574pgv.13
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/PXkXzASKMcUQDbV6Hl9B5xocqfOCXTaxlqtgyWXLXY=;
 b=oABczCk+r1Ph0Tq2jPBo4ES/BfjeCyUc6xL4ploAXIPJzq/gYgpcgxyWnDR0wfZE3f
 rsVTU3KR+3UO9RS/YgdhiYCHZhs9EVm8Hg4cuGSgTd4da+HOwTrvsl8JeXkUrHk1RruX
 pJ2cakqWG4tSenbqapliTXOMKW1ZZgmGcBax4TfTppRZVfj9o2XSfetNh0Jb8m+itPVd
 TRJwvNONdH3NwCZdHyrsb0qRIjQumfxlRgOxEEkflKdL1nq/1owXSVtBbPVPtxcrsJ5f
 RJGfAgGhuHmsWIPNML5xTpV2CBiQjU5Juqvn066SjDs18JTatE2je8EkbRfW8BPI6J2v
 74AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/PXkXzASKMcUQDbV6Hl9B5xocqfOCXTaxlqtgyWXLXY=;
 b=BlP2Bd1RHBwe+Mxi+K7l6BIisDTV43/2NBsPsNhlvaXG91exiXIOYdLmXDBOXJW6ls
 uTyfb9JEdAr318iC5mEY0iMrVy2VdNVTI1Ic5ewlhPTwhF7xd8hP98e+h+SfebObUaR6
 gyU3rrebliZwhCQJSFkQRpw4gQsb3ZftmbAYjCf3Nr0nkhtwP/w1ZB24N5Zq7d3ih93T
 P8IHuBmo0EqJRu7ZN2ktpplP/i3rfBiwXmy/lyRsoLpgr1J3VpGZaQ9bt6uvsE917Zm5
 l9S2UJxkgvorGgr/EyNTct5jHScToHirNWJ/bqithL2PCLFxcmYUJrshpvFY9YAuIhdH
 U2bg==
X-Gm-Message-State: APjAAAXs3a0s5IT4jheW5/IUJyVHf5rfasmMCiI4wrucwUbB7N/c0azi
 FoL7bhS9uaAZN0gintXu+yRsXw==
X-Received: by 2002:aa7:8556:: with SMTP id y22mr21009221pfn.252.1567625548160; 
 Wed, 04 Sep 2019 12:32:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:59 -0700
Message-Id: <20190904193059.26202-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v4 69/69] target/arm: Inline gen_bx_im into
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
X-TUID: fH2MzoLs/gx+

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
index 2412dde631..34bb280e3d 100644
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
@@ -2725,9 +2710,8 @@ static inline void gen_jmp (DisasContext *s, uint32_t dest)
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
@@ -10138,12 +10122,16 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
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

