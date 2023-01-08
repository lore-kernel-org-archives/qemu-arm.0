Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1326714ejc;
        Sat, 7 Jan 2023 18:42:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuhqf548QoTHTFwP1rj5l40bPUSUKl2GAEQv3aUzWae8JmR1pjPaxER341RkQutIIkS6g+h
X-Received: by 2002:ac8:4f53:0:b0:3a7:e02e:7cc4 with SMTP id i19-20020ac84f53000000b003a7e02e7cc4mr77904250qtw.32.1673145730652;
        Sat, 07 Jan 2023 18:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145730; cv=none;
        d=google.com; s=arc-20160816;
        b=ooHWB1v7eE12hbKutUJWsXI6BegkXThM+51EsAUWX+LPtI0UDISpt3ECNYjzj6dEd8
         bBLd5lSVp6HzUCSkFuJ1c5/0t1qVuC4b1uVijG9fOnbNaw1zwXL0tRoGOhjwFi+M02gI
         U9N7DsAeZSO5uKps6Mrxmed+ECTf64h9sjL2xpFPJmifrVl0WJDutdv83For/dbkOdtu
         JnO50SJ+1t4L9j37gorgsomxVfLhJYh1n/pzUz5BYHYBIJPQmImj3JUxzHf7yTZ4TbwM
         W84MN4mp/ez8TiheC/17xNgwCDOB9lJ53R1OeMwGmCm4dyLdw2DfyBBxWX9Um5aFtiNe
         f8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
        b=W+X+ENK5AUQuQQQ7Y+ojV0Y5ZinqVsXyL+P12PW/z6QEm1FgeBIr6oEqKUOAqoYj4m
         BbDCHFyqu6Kjmg3fiGfm/m6mZ0TwLZDgT/x6FpM3KtbeWMwaxpCjPXIOrFMaHk96gdDc
         m5I67rvxfLeoIWoixFD0Sm7f1UlfTrr5nGW01yYBtx6FtqqnfGiT+GS+Xdlul5jbbJuO
         9N8tS9yQUXNS9Kj9RkHgzno8ByzbE7QdDFvFAyeY9yNLpNH2SoMaDXdnjY3fiu6qNu5D
         qocJblGel4ySnacGWwjXa6NLvF5XsnOcdh/1lsuuNFwNN4jFImJxdFSV1ZUvQ7I3QIuf
         UAIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kx3dZpEn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb15-20020a05622a598f00b0035cb8f99cccsi2772997qtb.484.2023.01.07.18.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kx3dZpEn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaF-0006Ia-P1; Sat, 07 Jan 2023 21:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaD-0006Fk-Ub
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZK-0004l7-8l
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d3so5854373plr.10
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=kx3dZpEnOsRyJybrCApOMyixn7rk94XTr86uSFAz4gz4LCGvDUzT8H3U2TvjF/zo4U
 shqAEmhOxZxKOdvz9+dVhcG7otKDN35yjmul1xbZ02fFffIkV3cEfnSwL34W2F/gtyeE
 EVl/vBlO5zfUrrhOsrSpBl3NhR8u5OBEKApfMEo6eOsvlFS9sOHF0s0IqwI2aPBJDhZm
 4RniVlYOeDWSx0pB/+tjO8kscq1pqJ23fJMT3CToo6q/HvjmB/XcPOuTAryvjKrjxUqP
 P0WMbvcJs06QrCb0iGqqT4/5e/FTyIQT3aqPlnl13F92l5ysLVI9yyiQM120ORH3dpeS
 iYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=kETHA7Rrt8L31cKLXcUiJx92OzvXjIfVmh9yzzU3f5nt0aolgMW2XVKwc3KqhfNQ52
 73HJZfVhGd+XwJUT7U7FsR79DQCVbQ5L43Qmpkmw+R38o2USfl1ZBHerA0XgyhWGfuiy
 vq03wTDFChbiefpfdEFEQ6BuHfcLimjhWHB7Gxtb0YlusxOZ1zWEHcsCvgUBsHSWqNw4
 d/scFcT0k7bY6xbHv6i+hLpeJKEaAhNq94ViqVew61PiJheYmjxFDcRtcuQ4BCwib+9d
 j+G9BCe+TkypU7MFZyziyI7j1QiGv5lx5qwkSRRcINklxDTxUflGvsoix3ApSkm79EeM
 tJEw==
X-Gm-Message-State: AFqh2kqvv/mzFdo/81KG6unK4gDQgxjBFsK3Pr3dCW9kwLAy1a/lEDgW
 b41HEhFpTTQFXjJsTCG/Ci0PGTuQfl8KbOwB
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id
 b4-20020a170902e94400b00189d8fb1523mr70590119pll.36.1673145473024; 
 Sat, 07 Jan 2023 18:37:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 29/36] target/s390x: Copy wout_x1 to wout_x1_P
Date: Sat,  7 Jan 2023 18:37:12 -0800
Message-Id: <20230108023719.2466341-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EVYgxqT5IOwM

Make a copy of wout_x1 before modifying it, as wout_x1_P
emphasizing that it operates on the out/out2 pair.  The insns
that use x1_P are data movement that will not change to Int128.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.h.inc | 12 ++++++------
 target/s390x/tcg/translate.c     |  8 ++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 79c6ab509a..d0814cb218 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -422,7 +422,7 @@
     F(0x3800, LER,     RR_a,  Z,   0, e2, 0, cond_e1e2, mov2, 0, IF_AFP1 | IF_AFP2)
     F(0x7800, LE,      RX_a,  Z,   0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
     F(0xed64, LEY,     RXY_a, LD,  0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
-    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1, movx, 0, IF_AFP1)
+    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1_P, movx, 0, IF_AFP1)
 /* LOAD IMMEDIATE */
     C(0xc001, LGFI,    RIL_a, EI,  0, i2, 0, r1, mov2, 0)
 /* LOAD RELATIVE LONG */
@@ -461,7 +461,7 @@
     C(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64)
     F(0xb302, LTEBR,   RRE,   Z,   0, e2, 0, cond_e1e2, mov2, f32, IF_BFP)
     F(0xb312, LTDBR,   RRE,   Z,   0, f2, 0, f1, mov2, f64, IF_BFP)
-    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1, movx, f128, IF_BFP)
+    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1_P, movx, f128, IF_BFP)
 /* LOAD AND TRAP */
     C(0xe39f, LAT,     RXY_a, LAT, 0, m2_32u, r1, 0, lat, 0)
     C(0xe385, LGAT,    RXY_a, LAT, 0, a2, r1, 0, lgat, 0)
@@ -483,7 +483,7 @@
     C(0xb913, LCGFR,   RRE,   Z,   0, r2_32s, r1, 0, neg, neg64)
     F(0xb303, LCEBR,   RRE,   Z,   0, e2, new, e1, negf32, f32, IF_BFP)
     F(0xb313, LCDBR,   RRE,   Z,   0, f2, new, f1, negf64, f64, IF_BFP)
-    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1, negf128, f128, IF_BFP)
+    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, negf128, f128, IF_BFP)
     F(0xb373, LCDFR,   RRE,   FPSSH, 0, f2, new, f1, negf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD COUNT TO BLOCK BOUNDARY */
     C(0xe727, LCBB,    RXE,   V,   la2, 0, r1, 0, lcbb, 0)
@@ -552,7 +552,7 @@
     C(0xb911, LNGFR,   RRE,   Z,   0, r2_32s, r1, 0, nabs, nabs64)
     F(0xb301, LNEBR,   RRE,   Z,   0, e2, new, e1, nabsf32, f32, IF_BFP)
     F(0xb311, LNDBR,   RRE,   Z,   0, f2, new, f1, nabsf64, f64, IF_BFP)
-    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1, nabsf128, f128, IF_BFP)
+    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, nabsf128, f128, IF_BFP)
     F(0xb371, LNDFR,   RRE,   FPSSH, 0, f2, new, f1, nabsf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD ON CONDITION */
     C(0xb9f2, LOCR,    RRF_c, LOC, r1, r2, new, r1_32, loc, 0)
@@ -577,7 +577,7 @@
     C(0xb910, LPGFR,   RRE,   Z,   0, r2_32s, r1, 0, abs, abs64)
     F(0xb300, LPEBR,   RRE,   Z,   0, e2, new, e1, absf32, f32, IF_BFP)
     F(0xb310, LPDBR,   RRE,   Z,   0, f2, new, f1, absf64, f64, IF_BFP)
-    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1, absf128, f128, IF_BFP)
+    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, absf128, f128, IF_BFP)
     F(0xb370, LPDFR,   RRE,   FPSSH, 0, f2, new, f1, absf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD REVERSED */
     C(0xb91f, LRVR,    RRE,   Z,   0, r2_32u, new, r1_32, rev32, 0)
@@ -588,7 +588,7 @@
 /* LOAD ZERO */
     F(0xb374, LZER,    RRE,   Z,   0, 0, 0, e1, zero, 0, IF_AFP1)
     F(0xb375, LZDR,    RRE,   Z,   0, 0, 0, f1, zero, 0, IF_AFP1)
-    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1, zero2, 0, IF_AFP1)
+    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1_P, zero2, 0, IF_AFP1)
 
 /* LOAD FPC */
     F(0xb29d, LFPC,    S,     Z,   0, m2_32u, 0, 0, sfpc, 0, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f3e4b70ed9..d25b6f3c03 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5518,6 +5518,14 @@ static void wout_x1(DisasContext *s, DisasOps *o)
 }
 #define SPEC_wout_x1 SPEC_r1_f128
 
+static void wout_x1_P(DisasContext *s, DisasOps *o)
+{
+    int f1 = get_field(s, r1);
+    store_freg(f1, o->out);
+    store_freg(f1 + 2, o->out2);
+}
+#define SPEC_wout_x1_P SPEC_r1_f128
+
 static void wout_cond_r1r2_32(DisasContext *s, DisasOps *o)
 {
     if (get_field(s, r1) != get_field(s, r2)) {
-- 
2.34.1

