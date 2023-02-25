Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2640621ejc;
        Sat, 25 Feb 2023 01:25:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/smuHGOSsA7skTSnr3r6Zu68d9JxnysudbSpdN5nrsXKiIB81/S1AapMjwCQV16fcdnz/w
X-Received: by 2002:a05:6214:e42:b0:56b:ec1f:db0d with SMTP id o2-20020a0562140e4200b0056bec1fdb0dmr33372993qvc.34.1677317142291;
        Sat, 25 Feb 2023 01:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317142; cv=none;
        d=google.com; s=arc-20160816;
        b=QA9hfvyw2b2blHchKf7Oq+qq2fZdqCG9ZP/+9woqHInfnl7tzLcw3Hl0ul7rva5DAq
         adjZa2EyJBtf9k3KIeCH/w5uNRMd3+lVD65pLwYynklGj8z5QR9iLm2JcM6aOGnK0JlQ
         lPXT8Enh0YrrUfAvOmfQm1DbWCzyZLV2Sd22m1IjkurichDHVXT6CMZH7G0sidBI8kjy
         I1OHHN1/p0xrHyVdxvwPKYUzlW1bLAg9pPijrowrF9WqnKpU4xp3LTx5aCobjv/oY8SG
         wlXkUYrV5uRk0HJp6ua/byJCXS5ur3Neg13p1SZXXDAGa+du+rtBgoBKl3vrq7lkRzik
         2cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
        b=V8Z2rvmvc+U8577xxIMdKu+z0CAXSl4GFsdtKHtKhAms7B1MfRiMmGlSLxiz+uKGlw
         qheMzj3FYCax1FaOZVUfi6OmlU0e3d7sk/ae6vIw3nlQOog+z3wkfk6QMEuOgAUAUcZB
         eceE6Mq/xPCrzjqDEX7pPwUIWdLjSxu3Vc2zblhuu/DoZ1+diJ3tYYFNe24X61i88mSa
         2yxe+wFCBGWa+a/Ky78ZLXeV0ZA4/PSLm2oRRFuTskhY0c7u2fGOvOX2ZfXM2p6G07ex
         uff3/QmU3MsfpEArzU6Lt/LJW2mNKLDRawPTRXYhUW55vegks2g+Bcdl0K7dQoKljpBN
         uRKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcXQpl7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0c9d89000000b0056eda074e9esi1580664qvd.102.2023.02.25.01.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:25:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcXQpl7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjn-0000Q4-Vx; Sat, 25 Feb 2023 04:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjF-0006N0-Gh
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:31 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj7-0003LG-LI
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:25 -0500
Received: by mail-pl1-x629.google.com with SMTP id z2so1852534plf.12
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=gcXQpl7ctKdujWVcb6yCFa3kmgklC0n0XJkEh1FFUz2+v5oJeqHTOmNT09NsymdHTD
 oXAE7ys/f2U9qcw++xXqSqWuG/Po5NgfmjydyGl/R49ryzP37C4t3c4mLMbOpk63kIaN
 +sT5q72q0ncgdkx01nUL60zDtUdtFKmY//FrH7sNkhuAMRdfBHnDoJk6fe9I017/qzho
 92+5J+uFShpaZj2V4/tBvK9HaVJQZmKqGniJind4gMqsTPaE4gthQUc4NGXujK7uMTHE
 bDrWDDDmihLhm7o629wo2FIM7r5S819xyeHjy/J7GzfV3iS6WKScJ2T+laMb6ZBkpl4v
 BZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=rPxAftr8/Tvp2sb3tK/4I/Fj515YNsm3C58G/ww+opHJdA6eJmfN93pmTNcH/9pWNQ
 kJ3CFU52Yqq0AMqzZXFSPYC4QuBtZAQEkA9PTiJ6OZHRopdl7GhE4WY52RjPNyp/257f
 NyNACvHL4r4WmR4WNhDZKgSOd6/6xV+njYmb1/aNommL/bL4WUbEhBsYGJ9aeEO/wCKT
 ewRdgyUNPsAoTcTh56VagVzNpVsLk3vPeeBtjkqSseHxy0uAoQVwFMcSFkRyRKAwe7Ob
 3mJfJsgMG7bFdH7L1+GbUJQj06C8k1Dsrg4c0REjMAypJPdArXh8lLTtvZnLZM1o1Gls
 g1Pg==
X-Gm-Message-State: AO0yUKU3glZdlxGGUkj341zVzeumLMABGd9dqXiorFLMVjKaU+tbA/gS
 HFoGrjx6MUTHVBAhaB28gGUr6g==
X-Received: by 2002:a05:6a20:bfc5:b0:cc:1ec7:45e5 with SMTP id
 gs5-20020a056a20bfc500b000cc1ec745e5mr7220125pzb.35.1677316816971; 
 Sat, 25 Feb 2023 01:20:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 63/76] target/s390x: Remove g_out, g_out2, g_in1,
 g_in2 from DisasContext
Date: Fri, 24 Feb 2023 23:14:14 -1000
Message-Id: <20230225091427.1817156-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jC1qJLACesXB

These fields are no longer read, so remove them and the writes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index c431903c67..9974162527 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1061,7 +1061,6 @@ static const DisasFormatInfo format_info[] = {
    them, and store them back.  See the "in1", "in2", "prep", "wout" sets
    of routines below for more details.  */
 typedef struct {
-    bool g_out, g_out2, g_in1, g_in2;
     TCGv_i64 out, out2, in1, in2;
     TCGv_i64 addr1;
     TCGv_i128 out_128, in1_128, in2_128;
@@ -3159,9 +3158,7 @@ static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mov2(DisasContext *s, DisasOps *o)
 {
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3171,9 +3168,7 @@ static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
     TCGv ar1 = tcg_temp_new_i64();
 
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
 
     switch (s->base.tb->flags & FLAG_MASK_ASC) {
     case PSW_ASC_PRIMARY >> FLAG_MASK_PSW_SHIFT:
@@ -3202,11 +3197,8 @@ static DisasJumpType op_movx(DisasContext *s, DisasOps *o)
 {
     o->out = o->in1;
     o->out2 = o->in2;
-    o->g_out = o->g_in1;
-    o->g_out2 = o->g_in2;
     o->in1 = NULL;
     o->in2 = NULL;
-    o->g_in1 = o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3708,7 +3700,6 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
         o->out = tcg_temp_new_i64();
-        o->g_out = false;
     }
 
     i3 &= 63;
@@ -4874,7 +4865,6 @@ static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
     o->out = tcg_const_i64(0);
     o->out2 = o->out;
-    o->g_out2 = true;
     return DISAS_NEXT;
 }
 
@@ -5142,7 +5132,6 @@ static void prep_new_x(DisasContext *s, DisasOps *o)
 static void prep_r1(DisasContext *s, DisasOps *o)
 {
     o->out = regs[get_field(s, r1)];
-    o->g_out = true;
 }
 #define SPEC_prep_r1 0
 
@@ -5151,7 +5140,6 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     o->out = regs[r1];
     o->out2 = regs[r1 + 1];
-    o->g_out = o->g_out2 = true;
 }
 #define SPEC_prep_r1_P SPEC_r1_even
 
@@ -5375,7 +5363,6 @@ static void in1_r1(DisasContext *s, DisasOps *o)
 static void in1_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1_o 0
 
@@ -5409,7 +5396,6 @@ static void in1_r1p1(DisasContext *s, DisasOps *o)
 static void in1_r1p1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1) + 1];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1p1_o SPEC_r1_even
 
@@ -5464,7 +5450,6 @@ static void in1_r3(DisasContext *s, DisasOps *o)
 static void in1_r3_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r3)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r3_o 0
 
@@ -5595,7 +5580,6 @@ static void in1_m1_64(DisasContext *s, DisasOps *o)
 static void in2_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r1)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r1_o 0
 
@@ -5630,7 +5614,6 @@ static void in2_r2(DisasContext *s, DisasOps *o)
 static void in2_r2_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r2)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r2_o 0
 
-- 
2.34.1

