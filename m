Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3211910wrs;
        Mon, 19 Aug 2019 15:32:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3WjmU4A8NB4o4QYG4B47A2p+DqzibW8nm65OnYZ11t7eaAwXn6Kd9Y8+U9FhqjP4rgnbZ
X-Received: by 2002:a17:907:423d:: with SMTP id oi21mr22828742ejb.184.1566253958265;
        Mon, 19 Aug 2019 15:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253958; cv=none;
        d=google.com; s=arc-20160816;
        b=GIgvYiMMqCSNqAPNAf9zntA3+bMza/urmvz0p8fO/MhRW1z/AhUSwZMMBkTjSoW5nF
         clkyFrTlTB2KEMIK41IdiCVyyvQE1inCRjjDJ0VipP4rbP/iUhrTOeUul6CGsFPQ+AaJ
         q8ZQXGQd8kBAHjAFoM2UMLfLV6NLH/iDeLaBcqCH0AN7jeffTb+FwmGQCxLr5iZoR5op
         3ZuyaR4fJ56l9v+zA1bn95yk4z7LCnvve77TB2/G5rM1tXMgwoleiMFDuOt4fxuiX/Xr
         ujk1B/T9wY6rCTDNN5sgnLltNPsA0XPDA/Fq0aYqgHOiZWo38PSNcMPhhTNlwgb1bjjB
         dBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pOrmu4hSyVv/uT8dsNEbfV+BcoCBHIkgixiHAKgiaBE=;
        b=isX4tPhoMOhWcfX9SzMKYJFk+55wiMu/8xBdkIbHLZdYHuZzbyu6ov2iMf44sv+26O
         LMhobTG2C/7MbxD4QhLEPxm1b1PWQqTEj/VQ5MOpX08CkBhYt4N6YzkY0VGirqbcsMBf
         bgqvi9pIfAjgNxCCO5kPgSjcLFYqS9+xq0gV5uG3MIynj10xJfDx3vonaNN5pqTWeXAz
         Q0fEKBME8qiZ59lSeQ/+30xUwsgXbSclADPjUlItU6NPT0wJE4/wAUEDCS1fPIbx6p98
         GIkwA/vxl/DwFv1ejNHw87K7nYSXaYiA1bnkDBYN4dcuzrd7vXRDrTOjdPYrCts3HlLs
         LrRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szYWKgnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o56si6412096edc.349.2019.08.19.15.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szYWKgnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzqCb-0001M4-9w
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpN5-0003Bk-KK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpN4-00073F-CX
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:23 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41493)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpN4-00072q-6c
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:22 -0400
Received: by mail-pl1-x642.google.com with SMTP id m9so1579074pls.8
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pOrmu4hSyVv/uT8dsNEbfV+BcoCBHIkgixiHAKgiaBE=;
 b=szYWKgnbjQZEyqcsTvJZwySHhotNNZp7oNO0mFXiSwrXztSEMf/pZcRYx1fEL+KZR9
 tmfY/8DvfXaWvxGAnVm7gPjJPZT46j2Vba0RgNh+bCQvBIpPa41tTyS2YaTQ2aRlk7C6
 vCgAotQhYMekCV9dxyXfcqQS/0KsNjFhUgq0Civeddgx8VbeasuAPndSRcSQ6O/In2yN
 YR64X2uxYUFdA23mGwM2f3blTbBOh3R1iWArkePm2wD2M3ZjX4TjYy0Wfy64tfxF92hx
 UvU8nw8X4yu3uM/xBOwreT685/qPPb+5sA1eGCaNhYPQ6llll+EcEo/1Yp+llAZ6fXlX
 AMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pOrmu4hSyVv/uT8dsNEbfV+BcoCBHIkgixiHAKgiaBE=;
 b=mleSwOIVixd4pltbnHJrXc1RZAW2AdBt7TVIoDIcdqVRLhxLVuH7ENsH7ZyxeoiKMi
 XzUOwbkqrKVugY3tnwpQahsqHsGQyTcAye7nGYZW2NUbwS36OUptoMD32AXX/6VVa5Un
 lksfiXid9fsIHWrIxfCNatmyJdzQYSEDr47MAquJCNcIacWUHQ1e0Kq//qjBRDXmYCm+
 16YZ0WTDP1o7LGD8UadyL60WG4hTE1Mesn6Yk2OsfgDefrFNQN+Zukf5D4bFI1FkzPDR
 lTRDtVeD6Zo7S0vGZ7hrL2kgNqkDrIzFqr/o0/17Whw9NbEXId74Ed9DPFBYIQjDJugO
 o8kA==
X-Gm-Message-State: APjAAAUT8temTOVUgXn1L8dgkCIjdekmn4lOf1MJ3gVSuqJg8eLyr0qT
 U3f2ER0IC0uEXMqNrIDEttwxdyaRhok=
X-Received: by 2002:a17:902:543:: with SMTP id
 61mr24756723plf.20.1566250761305; 
 Mon, 19 Aug 2019 14:39:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:55 -0700
Message-Id: <20190819213755.26175-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 68/68] target/arm: Inline gen_bx_im into
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
X-TUID: Eq5zA+saZhhH

There are only two remaining uses of gen_bx_im.  In each case, we
know the destination mode -- not changing in the case of gen_jmp
or changing in the case of trans_BLX_i.  Use this to simplify the
surrounding code.

For trans_BLX_i, use gen_jmp for the actual branch.  For gen_jmp,
use gen_set_pc_im to set up the single-step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index bac38e6261..9162ad113a 100644
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
@@ -10016,12 +10000,16 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
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

