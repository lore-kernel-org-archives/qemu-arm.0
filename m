Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1150946wrs;
        Wed, 28 Aug 2019 12:08:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWyR40c/F7xTpHB9IGjliTuaGsKTxt3JW1tMJFF5ilimrpw6ja/6kZIvoD7kx6+TUgk7fa
X-Received: by 2002:a05:620a:705:: with SMTP id 5mr5764585qkc.330.1567019322996;
        Wed, 28 Aug 2019 12:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019322; cv=none;
        d=google.com; s=arc-20160816;
        b=xgSsohsjQwdckIAN6NKCiC41buKrOw3rfDRtxxbTCj9qNEhBbAoWHqFAKhjkDnk0i8
         K4boo3ZKy/Nd7FxPRhRIsSd4NqC1RBIN9BnjA1mxpdGFYJRsSLmFRndQnGOh8W5NzblG
         NQQDOKqO8fom1hFAzC9ZMAfk/S37PL6/eiyV/H6GWQOIeQgwO8ys1lt8+INDu89jWksm
         4NXTho38j5N3uyYGgXyRFifXDxXF/XYpk66O/WQASNdTRhs2zxWbMS5AEsJdn7vh3g0r
         KoGLp5Lp9oSBP+paGspPOIIU8KA6OcUuVfilWYTZn1AnxfKu9bj/7Xu+lruQZ/i5p/zF
         NpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Y5yPfgEriWWma7y9hU2/xgK2vFUjf1uQUjpsxHdDPIY=;
        b=QA6COYCBVwx8wsnenOSyhrr4c6hffFJ07ZHJPEK5P0PYReLbCfhy2lfBip8zoqP/Ie
         0xBHZHEKx+kJ2iPpz8enZe8m4C4kbBc67wwpGqFUpuEizw427FbFV2p7PxwBnnw7caqi
         pBD7Pn38EJTxQOVq2p8jQodtFENJ5XGd387PeVxPIbPn4j7ZJtd/eEMoxft3pa5t9qq8
         zJloqs2YmVZ19Z5O6EtYmJqeXKAp/HTbWr7VJAKBgfrZVRlDTEjumjDdlE9t1QoUfXu/
         vZqqb6Oo78qRULe6zFQRZZHUYD9SNfyYRo5biDf3ageGsea5Xmlpi5eF8S//wCMay4OP
         Fd8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yMq3/iJI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si119372qvg.195.2019.08.28.12.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yMq3/iJI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33JC-0005ik-99
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fm-00033n-Sv
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fl-0008Bn-BF
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:10 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fl-0008A1-2H
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:09 -0400
Received: by mail-pf1-x443.google.com with SMTP id c81so371837pfc.11
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y5yPfgEriWWma7y9hU2/xgK2vFUjf1uQUjpsxHdDPIY=;
 b=yMq3/iJIs+X2hHMLBXGUONjwOV07estLLoofNW7mzhCS/ghswkzmTIi3WUGIcYUTY1
 y1eUDawNAjO1pMYfz3OVEneK59MGv/0jvXXD23idfG478JSMENqsjmhKk/+0hO9jmpMs
 TzuhF7InGuX9Q71WkNMmRUTH238lmfyJEQpZpbqoXNDcxjjrDaMoa3gZ74bw/HnRPDy5
 eToc6DPH3Th2Zq6+YdrbImTra3GGD7tD/YZFOrZBzbw9xWyGni9xg6VKwM64CSf6UfaO
 ksBohpHL+SvbOGp2OGv2tV7lvw4PdhqHKNRe3h200BpT6HC6RS7L5wAl+L/y0ok0Fhow
 7XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y5yPfgEriWWma7y9hU2/xgK2vFUjf1uQUjpsxHdDPIY=;
 b=FagH1sApOul13wQXfVGlaQ0snqnJ/EFGLyxxpv15Kz9zjp7JryVv/Mf89KnVAyQ6mC
 6uTihRwZuJ8v9sfjD2cUHTew59YdD6v3D8tXgG1MgMYYBCW4E5O8nSjD/clGNNYKwwxa
 ZA7Ub0jK6t9Bu14gxVzy1rbIng9+Y8uTYqdbUfxK9lKBbPFp/jD2jujh2Nm/k6OEH/oB
 Y9pd2tQPtf1LBPTuthkJuFqSinYOF2e9E0fVuwFZ70vuTrPOgQ3ETugZ3MIl+7gs73X/
 GWD4Xa+8TG5ejKLPjXXqic8aYmsz/I7Hnq9+Z8/4HVp5QDXWW2HHqCmPWAk9gvgEYy2t
 caqA==
X-Gm-Message-State: APjAAAXXDqS2luBLq3hYNMdgrd/JYw0zTjLSanPG3+IiFmjC4XAF4/0N
 I3Qd1qWlVJgU+8j4GTQ705TnJVpxC0A=
X-Received: by 2002:a63:de4c:: with SMTP id y12mr4869451pgi.264.1567019107645; 
 Wed, 28 Aug 2019 12:05:07 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:54 -0700
Message-Id: <20190828190456.30315-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH v3 07/69] target/arm: Simplify UMAAL
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
X-TUID: EyGfqz3euvx/

Since all of the inputs and outputs are i32, dispense with
the intermediate promotion to i64 and use tcg_gen_mulu2_i32
and tcg_gen_add2_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b7845d825b..17659627b1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7320,21 +7320,6 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
     store_reg(s, rhigh, tmp);
 }
 
-/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
-static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
-{
-    TCGv_i64 tmp;
-    TCGv_i32 tmp2;
-
-    /* Load value and extend to 64 bits.  */
-    tmp = tcg_temp_new_i64();
-    tmp2 = load_reg(s, rlow);
-    tcg_gen_extu_i32_i64(tmp, tmp2);
-    tcg_temp_free_i32(tmp2);
-    tcg_gen_add_i64(val, val, tmp);
-    tcg_temp_free_i64(tmp);
-}
-
 /* load and add a 64-bit value from a register pair.  */
 static void gen_addq(DisasContext *s, TCGv_i64 val, int rlow, int rhigh)
 {
@@ -8093,8 +8078,7 @@ static bool trans_SMLAL(DisasContext *s, arg_SMLAL *a)
 
 static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 {
-    TCGv_i32 t0, t1;
-    TCGv_i64 t64;
+    TCGv_i32 t0, t1, t2, zero;
 
     if (s->thumb
         ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
@@ -8104,11 +8088,17 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
-    t64 = gen_mulu_i64_i32(t0, t1);
-    gen_addq_lo(s, t64, a->ra);
-    gen_addq_lo(s, t64, a->rd);
-    gen_storeq_reg(s, a->ra, a->rd, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_mulu2_i32(t0, t1, t0, t1);
+    zero = tcg_const_i32(0);
+    t2 = load_reg(s, a->ra);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    t2 = load_reg(s, a->rd);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(zero);
+    store_reg(s, a->ra, t0);
+    store_reg(s, a->rd, t1);
     return true;
 }
 
-- 
2.17.1

