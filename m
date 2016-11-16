Received: by 10.25.150.194 with SMTP id y185csp306953lfd;
        Wed, 16 Nov 2016 11:53:08 -0800 (PST)
X-Received: by 10.200.37.221 with SMTP id f29mr3416800qtf.123.1479325988541;
        Wed, 16 Nov 2016 11:53:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j44si14292072qtf.139.2016.11.16.11.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 11:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c76GZ-0000k1-AO
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 14:53:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c75qm-0004PQ-1F
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 14:26:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c75qi-00062z-LT
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 14:26:28 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c75qi-00062W-CZ; Wed, 16 Nov 2016 14:26:24 -0500
Received: by mail-wm0-x241.google.com with SMTP id g23so14398659wme.1;
	Wed, 16 Nov 2016 11:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hVYym7Na+dBBovYTB42kTGixBslnYY1PZqvcj8yotEI=;
	b=ColBBl5E7R4/MAY/XfxCZRH6lBXpG9Dk2iZhb2IV+YbKhJY8of32zd4N765/AQzFaG
	J1H0dKooYJgcZZiGZSY7BYZbzdwFO/xM0e1cZ1fli6Zt44GMDEkuxas/FbHaEf2bcMt3
	J71ccuwG/SC+0o8BJbhUDJdoHzBueE0cL9+mhltC02hZf8KnK7CEzmotFmDxykllHmOZ
	sEocBth7fCfyJ2A+4ZaCib4L557+Ip/EJ37PxeZgbKaDdszSRsUgWSE0giB4yKwwS+aD
	j/jkayswifT+dIG+V3EMFgaJs+GPBim4Cz4GVqsEiAB/6/OufV/8Yg+SVfzAmAUgBBGF
	Opng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=hVYym7Na+dBBovYTB42kTGixBslnYY1PZqvcj8yotEI=;
	b=IotU/0BDojh6mVCg8jcnSBJ8x38VH577gW3DH4/NdiY5s5AYPAB+9PDpazzsYQV5RU
	q+PwdvdUpCJvVyPnNfs9reDWS2eMlyMR0nVorkNF6uXrmXUnqyoGQQOVLORX+OnHM1bA
	e4Xtpij0RVFxs1xzxqg+y0W6sAL3VdZM3aR26i8VYeR3Z48cvFMUGbO1uf+7ynZ63FTu
	KtE/sIyZ83s57neVa6X+KtI9UA7W8xtip2Y7OuNY1aF1/wAzYR1XucnzIhxcc1GiXmSJ
	5HghMxKCuSDXkwnETjYofDqL9YBsegwaBrqVIFIAmM3I9tUHgE33RsfQafyKQYFMc4Ma
	Ndrw==
X-Gm-Message-State: ABUngvdQr8q4x+l1OwUSsHg18Xur5SwjCACkcjSG1ZWzTV3fX+68JQq/lYpapR2H8JU8NA==
X-Received: by 10.194.54.99 with SMTP id i3mr3135162wjp.86.1479324383051;
	Wed, 16 Nov 2016 11:26:23 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id 197sm686930wmy.16.2016.11.16.11.26.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 11:26:22 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 20:25:33 +0100
Message-Id: <1479324335-2074-24-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479324335-2074-1-git-send-email-rth@twiddle.net>
References: <1479324335-2074-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-devel] [PATCH 23/25] target-arm: Use clrsb helper
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uhCZSGsYEoFg

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/helper-a64.c    | 10 ----------
 target-arm/helper-a64.h    |  2 --
 target-arm/translate-a64.c |  8 ++++----
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
index 77999ff..d9df82c 100644
--- a/target-arm/helper-a64.c
+++ b/target-arm/helper-a64.c
@@ -54,16 +54,6 @@ int64_t HELPER(sdiv64)(int64_t num, int64_t den)
     return num / den;
 }
 
-uint64_t HELPER(cls64)(uint64_t x)
-{
-    return clrsb64(x);
-}
-
-uint32_t HELPER(cls32)(uint32_t x)
-{
-    return clrsb32(x);
-}
-
 uint64_t HELPER(rbit64)(uint64_t x)
 {
     return revbit64(x);
diff --git a/target-arm/helper-a64.h b/target-arm/helper-a64.h
index d320f96..6f9eaba 100644
--- a/target-arm/helper-a64.h
+++ b/target-arm/helper-a64.h
@@ -18,8 +18,6 @@
  */
 DEF_HELPER_FLAGS_2(udiv64, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sdiv64, TCG_CALL_NO_RWG_SE, s64, s64, s64)
-DEF_HELPER_FLAGS_1(cls64, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(cls32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 12621ff..f73d63b 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -3971,11 +3971,11 @@ static void handle_cls(DisasContext *s, unsigned int sf,
     tcg_rn = cpu_reg(s, rn);
 
     if (sf) {
-        gen_helper_cls64(tcg_rd, tcg_rn);
+        tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
     } else {
         TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        gen_helper_cls32(tcg_tmp32, tcg_tmp32);
+        tcg_gen_clrsb_i32(tcg_tmp32, tcg_tmp32);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
         tcg_temp_free_i32(tcg_tmp32);
     }
@@ -7592,7 +7592,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         if (u) {
             tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
         } else {
-            gen_helper_cls64(tcg_rd, tcg_rn);
+            tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
         }
         break;
     case 0x5: /* NOT */
@@ -10262,7 +10262,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     if (u) {
                         tcg_gen_clzi_i32(tcg_res, tcg_op, 32);
                     } else {
-                        gen_helper_cls32(tcg_res, tcg_op);
+                        tcg_gen_clrsb_i32(tcg_res, tcg_op);
                     }
                     break;
                 case 0x7: /* SQABS, SQNEG */
-- 
2.7.4

