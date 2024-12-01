Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148435njk;
        Sun, 1 Dec 2024 07:09:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXIeXfIlA/c02fxjZvjDc7rZxRAxWs8+LB29HnyEALQwYSxgB9XGe4hsmCYQL6Fr8y753dIkfNoiT50A==@linaro.org
X-Google-Smtp-Source: AGHT+IG2busTGEjiqJXswcFtJhETqHGVfNCuMCBP05deOrrCXv6NfKqmk8j1sIlik0/s2k7E6tvl
X-Received: by 2002:ad4:5bef:0:b0:6d8:8f81:e2ea with SMTP id 6a1803df08f44-6d88f81e6cdmr110049916d6.31.1733065751900;
        Sun, 01 Dec 2024 07:09:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065751; cv=none;
        d=google.com; s=arc-20240605;
        b=HOHcGOJeXyC7DwkLyEZv3OwbN34MSPslFWc92ORodMELm+PcKVKGXqH6Kh+vpIgN0S
         G82U94dxfmpTlXh3QB1AluwxJ5qmjn8uqPQXywbY4sr4ClBAzdmf4mO6yutPFVgtAwh7
         Ccw1QLJFoO60W7ShA3CmdxYVF8CuZFN/SyiSAF/O6XAuAOY1b2h2g4wfnk9IzCRtc3Bt
         quve2ByEOEX9lkRcIxPw9IFH8DIUyYKTzYfTea5hRhCKtuN0qEr/cleLsVqQihXiqJBR
         gVSdRUt68UeUHZKUFdTBMHhWRoKZtQkpTV1xipAvs1T5nL6HsPKacCX2Twhpz7rXCv26
         rBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WxGGo7JOGQa+HJl4RW+NqfI5tsWT04nNX0044Pz+15U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NPK0ZoMBfrO2LToKcBNDo8dLahZPVeCFALSegam/erOD8TEZn6OFl4U3CO1+FcdDOe
         bOH++oiXE4kmvboQON3yjB/pG8364ulgyIRo7uAnliU/7kVZIZSb72kslUVr9m3f3UyJ
         iV+GlqEOG8+TrHVNJPR4vdQtsxxaIGhnuVO7V9hwrHB/WFX4yFP6Wz9rTML1BJPgTvZb
         Dr4wfeg9s1iVDNVoy36menpmaq8H+/9x+ZhAlGrzyNPP1WXCvJ6YxiIQjZ+Z47E+Ol2L
         VIe0fz866dH4nTTvrd+gnXrfhJpxKMwkFGcld31rIA0pl/rwEqaUqAVcLpcR4tuXTQ6E
         z0Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsuPUq58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875564526si105081326d6.384.2024.12.01.07.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:09:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsuPUq58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlXH-0001gt-Rn; Sun, 01 Dec 2024 10:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlXE-0001fa-8d
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:56 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlXB-0004QQ-UP
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:55 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-71d4d0516e6so1511544a34.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065613; x=1733670413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WxGGo7JOGQa+HJl4RW+NqfI5tsWT04nNX0044Pz+15U=;
 b=HsuPUq58/aKsgKi1fmX8Ko3/kTT3eFwvo0CEZ0Eht3mS17mTEzdh987eQd1TULJWj/
 sFEaVfO+BzeoOLrz3CnFnwwapZclfrGKrYqK+wyP25x5ojWN7MkLP/dEkL9evOn4g0P1
 XbMY6CgD3O951RxHrestRWOBrk1b/yI1VoXJYHFxTgCWLQgVPaLAoacOOiTh4irSSLG1
 qibpMC9PK5l1K68nwEkwkVmX6vDQ3N2lcxQOkLpzxuo5TrcayfD8wYpBh33JJw4YU+38
 /njgZ6iu17O3+Jpvm2xrF36rq7eSIRHEbAkVw9MH0RZgA6aHx1y2VGnvG8UPtX7bXPYM
 o5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065613; x=1733670413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxGGo7JOGQa+HJl4RW+NqfI5tsWT04nNX0044Pz+15U=;
 b=JiQSImzTMIvOtJfc6+ZIaDshECmD1qK4/SdiQo/kFGfJteJosaTEy5Thlo/6EODl42
 SG/YCBnvLRqBmctzyHmKY01LS9YUIUSaVDi7i5Hr2MJMsTwKEuIoBu12kIy/PMKR526L
 S8YNT7BGwfIsX75SbCjespy0tfgRSBggzY7e/7JeL32AZCRcCG14QPHr0jwx3Cyldc2R
 qVNClgQ5Sa1kUOZ3C3MrUjEd4SAuyUWLvdxGVp+ax1fIFJ/KslH9LsoVcyfxLwSPu0qd
 EIh5oiHh/OgV2wuzNQ1p8dM8YU8CtdSkT5/Pt2PHB8eHYcokuRec8bM8591x2MaSsYf/
 q5RA==
X-Gm-Message-State: AOJu0YzZGF768NE7GqHTtOv0KKjT3agfF5LB9snSIdmu4A6O+qzKBY2W
 W0a1ssML/wmAp8GLnO4N7kwvF2ELKHBpULdj/3SVMI2yRM3Q81FZyYvBehQ+koNc3iugPI/GAjl
 jKVc=
X-Gm-Gg: ASbGncsl4c0OdcTDhYXszELpdlqzM8i4t6wVqwz77JeV5y5ZQwyvYFD8LEonywZY8G4
 kbMerC5svWjZ2VytedLq9Xz2hpo26uz8webPNeauY02tQA6vQBhRMN8GbBsjoIHaMQE3PQgyMUc
 Xc4uJ21vTlNho15TvCgMZhk+rVACWjTflB8jert9j+FHLYbJAwGPvZLsK5taUBm0dIzdKoZpQKK
 dfqeZvdALth8bYrAr2aJ4DK3CK2sx+9cRusBmSn4hbpvT1KdiYJ/ycn61QsFpHBlAGr6/qsX8Kc
 0mfLwvtWXz5J2PCoiO+KfnikuzOubQwNRIhN
X-Received: by 2002:a05:6830:3689:b0:718:6cc:b5a2 with SMTP id
 46e09a7af769-71d65cf63b8mr14336574a34.20.1733065612931; 
 Sun, 01 Dec 2024 07:06:52 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/67] target/arm: Convert CNT, NOT,
 RBIT (vector) to decodetree
Date: Sun,  1 Dec 2024 09:05:38 -0600
Message-ID: <20241201150607.12812-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w9/Tki0a5mCw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 34 ++++++----------------------------
 target/arm/tcg/a64.decode      |  4 ++++
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f96b29e5a9..3d08c6e09b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8919,6 +8919,9 @@ static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 
 TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
 TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
+TRANS(NOT_v, do_gvec_fn2, a, tcg_gen_gvec_not)
+TRANS(CNT_v, do_gvec_fn2, a, gen_gvec_cnt)
+TRANS(RBIT_v, do_gvec_fn2, a, gen_gvec_rbit)
 
 static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
@@ -9233,12 +9236,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     TCGCond cond;
 
     switch (opcode) {
-    case 0x5: /* NOT */
-        /* This opcode is shared with CNT and RBIT but we have earlier
-         * enforced that size == 3 if and only if this is the NOT insn.
-         */
-        tcg_gen_not_i64(tcg_rd, tcg_rn);
-        break;
     case 0xa: /* CMLT */
         cond = TCG_COND_LT;
     do_cmop:
@@ -9295,6 +9292,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         break;
     default:
     case 0x4: /* CLS, CLZ */
+    case 0x5: /* NOT */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         g_assert_not_reached();
@@ -10076,19 +10074,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x1: /* REV16 */
         handle_rev(s, opcode, u, is_q, size, rn, rd);
         return;
-    case 0x5: /* CNT, NOT, RBIT */
-        if (u && size == 0) {
-            /* NOT */
-            break;
-        } else if (u && size == 1) {
-            /* RBIT */
-            break;
-        } else if (!u && size == 0) {
-            /* CNT */
-            break;
-        }
-        unallocated_encoding(s);
-        return;
     case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
     case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
         if (size == 3) {
@@ -10306,6 +10291,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* SUQADD, USQADD */
     case 0x4: /* CLS, CLZ */
+    case 0x5: /* CNT, NOT, RBIT */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
@@ -10328,15 +10314,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x5: /* CNT, NOT, RBIT */
-        if (!u) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cnt, 0);
-        } else if (size) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_rbit, 0);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
-        }
-        return;
     case 0x8: /* CMGT, CMGE */
         if (u) {
             gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cge0, size);
@@ -10355,6 +10332,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
         return;
     case 0x4: /* CLZ, CLS */
+    case 0x5: /* CNT, NOT, RBIT */
     case 0xb:
         g_assert_not_reached();
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c3acb5dc37..29f7741bfb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -71,6 +71,7 @@
 @rrr_q1e3       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=3
 @rrrr_q1e3      ........ ... rm:5 . ra:5 rn:5 rd:5      &qrrrr_e q=1 esz=3
 
+@qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
 @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
 
@@ -1643,3 +1644,6 @@ ABS_v           0.00 1110 ..1 00000 10111 0 ..... .....     @qrr_e
 NEG_v           0.10 1110 ..1 00000 10111 0 ..... .....     @qrr_e
 CLS_v           0.00 1110 ..1 00000 01001 0 ..... .....     @qrr_e
 CLZ_v           0.10 1110 ..1 00000 01001 0 ..... .....     @qrr_e
+CNT_v           0.00 1110 001 00000 01011 0 ..... .....     @qrr_b
+NOT_v           0.10 1110 001 00000 01011 0 ..... .....     @qrr_b
+RBIT_v          0.10 1110 011 00000 01011 0 ..... .....     @qrr_b
-- 
2.43.0

