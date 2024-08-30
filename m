Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp300006njf;
        Fri, 30 Aug 2024 08:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuxvXYcgzsD5MqZ3LX3Yv64w1s1z2DZHxNWnXKNWY0//etlj46O6GyORFuXjPKwAFA0jocAUDTCtD19A==@linaro.org
X-Google-Smtp-Source: AGHT+IERMLvz7asd9XfsY0fYRGgI2663OdDivVe9nP2AZ2L11s5woSdQJrr6tJgm1Fl0qbIDx0z3
X-Received: by 2002:a05:622a:6189:b0:454:e669:c8dd with SMTP id d75a77b69052e-4567f53106fmr61698981cf.20.1725031328637;
        Fri, 30 Aug 2024 08:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725031328; cv=none;
        d=google.com; s=arc-20160816;
        b=x6E/ex0Wmrm60ieupzgd2tBX22GQfPt4LSPm1Uz5HtJpQI7NRSE2w6EaI12e7c+tBF
         uMLnW1FUhHjGlAWsJtsbCRcFKTrNllpSURpEzVQWZuhmD3kzHmFx+ZZ6Z4ACIyCt1m1+
         wi/vEAXOcOfKDgU/+rxzfgUe5sn/SNJhH9am3X6hGep5veJCe/RgU+wHU83D37dI3d5i
         ejUCPgd13z9xRwy9vrslTrlgxdwoBMwhvsY0z6eV8hYPm+eKD+v4vbjPglvUi9Dnlai4
         vG3UCYUm7JFuDGl7wzbAo1nsh/zCD98YddqR80AAypfrj9nwcIjeibXJLinGvgv8fpNL
         MmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NG8BT4wk2wwlWq+dR+64QDBVzrTHfzbABoSBLNWlxsw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=N6QbADO1q+r8dxq+PwNM1pST4lB3f9xRmKZ5od8pnT97xsijhO4zJjEeKErgEcpI/j
         d0kKKA22q1amssJryyZeaV4LQxLFB53VSypAU5yOmoYFCPeDX+THWq4rS3TkQBjZj90V
         ADA5QnjDjDUuv6JA14HwKVr1gOMuCNJ+kn3MvYumHNfjhKLVFiWgiZfAyCaU2Fx9ZR4M
         W6+4SayqRlSlYvquJStDdGqTrbj4a5znzpw/sQbX0JWeD3j6QdPIgj7xOvAcSp0jQINT
         Ja6WxWORuEMlhrZv4sIQssHOG3ETGr/O2f6k7Y5vdkIUktiZS9360Z4TXviXoNClrJ0N
         An8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sY0Fd/vx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682db15c8si42545381cf.542.2024.08.30.08.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 08:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sY0Fd/vx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk3Rq-0007Fx-R2; Fri, 30 Aug 2024 11:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk3Rp-0007EO-Cd
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 11:22:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk3Rn-0007RB-Dm
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 11:22:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so6228325e9.0
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725031318; x=1725636118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=NG8BT4wk2wwlWq+dR+64QDBVzrTHfzbABoSBLNWlxsw=;
 b=sY0Fd/vx3s8XNB/yAfZQ5T/BaQYS9MZtkDFXhm+oHK/HzF0d1zf0rKfWjCljeuhE5M
 8zoxxWxndZOiLK0JDhdwNVv6QwEHYEw6SuG3a4gwAB75OTmAueFu6iD7iVrQwYZRWbPA
 +6Nab2+P4pzwJzmdzYE4yY/ksjxDw984jKebZV1t4QShM1RIIajce58wF0nk9vEdSpIe
 VGIvCQkcCqTA/pHzYQzu3B1o518Fn0mqnUANnP0aTpgLBjhJsFv5SxVqYvMmI5yJp7zZ
 /pCJdlAIkSWjhnpp8umpSR2Hug9yDl6HxH5ig828CCcKNnTqjqb2IgMHm/IxqN/ztFK2
 V4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031318; x=1725636118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NG8BT4wk2wwlWq+dR+64QDBVzrTHfzbABoSBLNWlxsw=;
 b=DBdiPob8Vy5ITQcAj5x0vVPyxPOBj0x4inmB1Ssx7vvTVe9s4IGfIS8RsUQe/jX6Rl
 MI2SNMIwxOU4vQIFOHOm3hWBF7TuIWqSTLDzwYLUIe9Asi7TaZXkexu6ADD1MXc8l6vI
 oiTJA2RJ4BpbSwu2oehsSPAcxt7y4h7C5Po+mwew2AKqCHcndqJJLUrvBeziTslpfJvd
 q8Fi+4lbsLE7a5gfTcWfEPZdvuMI04zl4Tdssptp8CjZ3u2Dr4WRbh9ZoLdfvtYR2XPj
 LfVu+ABY3fGs+VoIHelc10C7vkWI5M/pm1vbMOTwRvhcG5lv8AThQheKtt8W+xMtAl53
 jJdg==
X-Gm-Message-State: AOJu0YxoKZeYVDoZ75sJUNvgw83AgROJnCwHV5rdvvhb1eDVdoSYoSF8
 d9POPuSaoM23F91CDHfksMiRmIYXCFNLHbfonQzCy2g3wyGnxoofBi7Av5z5ijdrcClO3rswGgS
 0
X-Received: by 2002:a7b:ce0d:0:b0:428:17b6:bcf1 with SMTP id
 5b1f17b1804b1-42bb01c225bmr53225295e9.22.1725031317417; 
 Fri, 30 Aug 2024 08:21:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf7fa745sm64189335e9.31.2024.08.30.08.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:21:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct names of VFP VFNMA and VFNMS insns
Date: Fri, 30 Aug 2024 16:21:56 +0100
Message-Id: <20240830152156.2046590-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sv4LHl2Lluvf

In vfp.decode we have the names of the VFNMA and VFNMS instructions
the wrong way around.  The architecture says that bit 6 is the 'op'
bit, which is 1 for VFNMA and 1 for VFNMS, but we label these two
lines of decode the other way around.  This doesn't cause any
user-visible problem because in the handling of these functions in
translate-vfp.c we give VFNMA the behaviour specified for VFNMS and
vice-versa, but it's confusing when reading the code.

Switch the names of the VFP VFNMA and VFNMS instructions in
the decode file and flip the behaviour also.

NB: the instructions VFMA and VFMS *are* decoded with op=0 for
VFMA and op=1 for VFMS; the confusion probably arose because
we assumed VFNMA and VFNMS to be the same way around.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2536
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vfp.decode      | 12 ++++++------
 target/arm/tcg/translate-vfp.c |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/vfp.decode b/target/arm/tcg/vfp.decode
index 5405e80197b..2dd87a27089 100644
--- a/target/arm/tcg/vfp.decode
+++ b/target/arm/tcg/vfp.decode
@@ -141,18 +141,18 @@ VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
 VFMA_hp      ---- 1110 1.10 .... .... 1001 .0. 0 ....       @vfp_dnm_s
 VFMS_hp      ---- 1110 1.10 .... .... 1001 .1. 0 ....       @vfp_dnm_s
-VFNMA_hp     ---- 1110 1.01 .... .... 1001 .0. 0 ....       @vfp_dnm_s
-VFNMS_hp     ---- 1110 1.01 .... .... 1001 .1. 0 ....       @vfp_dnm_s
+VFNMS_hp     ---- 1110 1.01 .... .... 1001 .0. 0 ....       @vfp_dnm_s
+VFNMA_hp     ---- 1110 1.01 .... .... 1001 .1. 0 ....       @vfp_dnm_s
 
 VFMA_sp      ---- 1110 1.10 .... .... 1010 .0. 0 ....       @vfp_dnm_s
 VFMS_sp      ---- 1110 1.10 .... .... 1010 .1. 0 ....       @vfp_dnm_s
-VFNMA_sp     ---- 1110 1.01 .... .... 1010 .0. 0 ....       @vfp_dnm_s
-VFNMS_sp     ---- 1110 1.01 .... .... 1010 .1. 0 ....       @vfp_dnm_s
+VFNMS_sp     ---- 1110 1.01 .... .... 1010 .0. 0 ....       @vfp_dnm_s
+VFNMA_sp     ---- 1110 1.01 .... .... 1010 .1. 0 ....       @vfp_dnm_s
 
 VFMA_dp      ---- 1110 1.10 .... .... 1011 .0.0 ....        @vfp_dnm_d
 VFMS_dp      ---- 1110 1.10 .... .... 1011 .1.0 ....        @vfp_dnm_d
-VFNMA_dp     ---- 1110 1.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
-VFNMS_dp     ---- 1110 1.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
+VFNMS_dp     ---- 1110 1.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
+VFNMA_dp     ---- 1110 1.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
 VMOV_imm_hp  ---- 1110 1.11 .... .... 1001 0000 .... \
              vd=%vd_sp imm=%vmov_imm
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index cd5b8483576..b6fa28a7bf6 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -2190,8 +2190,8 @@ static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
 static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
 {
     /*
-     * VFNMA : fd = muladd(-fd,  fn, fm)
-     * VFNMS : fd = muladd(-fd, -fn, fm)
+     * VFNMA : fd = muladd(-fd, -fn, fm)
+     * VFNMS : fd = muladd(-fd,  fn, fm)
      * VFMA  : fd = muladd( fd,  fn, fm)
      * VFMS  : fd = muladd( fd, -fn, fm)
      *
@@ -2262,8 +2262,8 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
 #define MAKE_VFM_TRANS_FNS(PREC) \
     MAKE_ONE_VFM_TRANS_FN(VFMA, PREC, false, false) \
     MAKE_ONE_VFM_TRANS_FN(VFMS, PREC, true, false) \
-    MAKE_ONE_VFM_TRANS_FN(VFNMA, PREC, false, true) \
-    MAKE_ONE_VFM_TRANS_FN(VFNMS, PREC, true, true)
+    MAKE_ONE_VFM_TRANS_FN(VFNMS, PREC, false, true) \
+    MAKE_ONE_VFM_TRANS_FN(VFNMA, PREC, true, true)
 
 MAKE_VFM_TRANS_FNS(hp)
 MAKE_VFM_TRANS_FNS(sp)
-- 
2.34.1

