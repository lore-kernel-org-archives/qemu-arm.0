Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608654lfy;
        Mon, 24 Aug 2020 07:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAWbMcaO/ceEB+HP3wfzHMjer8DlfAirqbClUQaCLhVB/SLF+kzVNZQaR2KrpFNEimmXHd
X-Received: by 2002:a25:ae59:: with SMTP id g25mr7707698ybe.135.1598279593321;
        Mon, 24 Aug 2020 07:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279593; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeHGlUsrOAQMtmXX8vub/Gt4ykjJmufkNHhBJHOp2M74Up4TQrmaQDJYZsoOodh0aO
         pX6rhbP9yy/HawEQQVEiKhHO/hu+/ny9Xv5JYw96EHURSOQ5f8jg/AYPbCJDCofAU/h1
         Cm7h+YgnyvaqZnNqRdb77cHiE3BZsRbKfBsCFRGNZHS8jVLBi7CtD4Th1aQ3SiesRjwt
         glP0xNnVxWz+S5DXIe40gEHexIQqmZL3voeA9fqYQMRmGl2Q6Mfko3SLoZp+Pvi9GMpz
         vx0y253B6XHY8FLvMMfSLru9c7ba1xNsIJ2zWhpBNhKKnMfIGhuQG4f7PIJllcjpj/eN
         rwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IWRcaA8/wlrHD8pgz5xTOhWNZhjrxV7FX8GxKOdWsX0=;
        b=kC4k+4E/ZBEE5/NnMOShKTbnYI5kCxrmStIiOvkH8WN9yxKqiAv9auOFnC4hB2BjgA
         09XhHmoEc4blXi3In/jC20uZeVm3QYAqbGbDddyfMKzTOMIpXhjZQBds3dpzR76CU63T
         a9lG65ZWQ0BsUBDMjm0cuCsxqWMTF4+Cn/MWiJo5gIsRIcsHoKJ7ZOVJoWixOfnq+R+k
         nN7cS5uFYyJ6z7RYzs9NNfZIQgmhDsTmk8JzrguP+GRV7HKjErqYycptjegq6jpMchci
         COTa1KDTrJwkFqyWsrcA/WOI4v8TsF0r0qr1s5Sd4GS+jnN9VIehnuAIghvDZZcWWkVJ
         oCyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t+N/8Knb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si12046358ybm.341.2020.08.24.07.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t+N/8Knb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADX6-0005b7-Kq
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTq-0008Mc-GT
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:50 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTo-0002hV-0x
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:50 -0400
Received: by mail-wr1-x443.google.com with SMTP id y3so8898756wrl.4
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IWRcaA8/wlrHD8pgz5xTOhWNZhjrxV7FX8GxKOdWsX0=;
 b=t+N/8KnbXTmBR1M4tC2ZyENx8oIQX1H86/vJJoyahGzv3EYtqA0OHijlJKtTyrYGa0
 Eewq199eJOLxpgE5DXk5mvWjo4llJy7sZg48w2ePM0dNw5hrsXEnw4rd7dYP2goyRSQj
 xBucSXTWTQg6Aubx5fF8i7SbcTWNcjQO2GsK6DdGR8RI6tJ9rxYcY92dH4bWZ2/9HfD1
 xbYEji2YufzdQ9bPOU4SKASvsomJ2rHwa4E23H7wh0PL5A3yFPG9Q3VGvW+4nXel0Z8g
 7we2+6X9tt8rFNN73B/NWgl7qciGcyFSg4nkOLPW/zBWdWKxTiuPE2weZ+YV3SgBxr9v
 YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWRcaA8/wlrHD8pgz5xTOhWNZhjrxV7FX8GxKOdWsX0=;
 b=buEiS6HXTmxvtDMxDhsiazmgwCti+88ZA1ThLpO/YgVZziFYgNeh/4vgDDAEcQCo5p
 LV5g90CVBI5WJkI+t9IFVvlIQMmYUvuSeXQm2m8eCRnbAOzmo3tb5d7EmpoqFG4zpB4y
 GRBVNJkHccNa2aaR6z7gRJnoGxK6+jHB1Nx9Z9XA8JuuKqCCanwXm7rGXx5foaqBrxRX
 pGjT7vFmV9aSiHLOsAfBZshXM6Cy6o3/jbRipl9+nhDzjmmrxb6vcOej4ufp2VdcNUaW
 33o87ajsNqTWiDbRdXBZL7egTTDE17ubxHPpqwc++ufg+GHqxlFdADR9RI9RDczgTePj
 tZdg==
X-Gm-Message-State: AOAM532fxt+dPrw5hhZac9/LUB66Ng2y7dEHYILwuX1Nj4i90jDJB4SG
 aUana8UWZhX4OA3CTm4msecZzucBprhgo84C
X-Received: by 2002:a5d:5086:: with SMTP id a6mr6123315wrt.304.1598279386408; 
 Mon, 24 Aug 2020 07:29:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/22] target/arm: Implement VFP fp16 for VMOV immediate
Date: Mon, 24 Aug 2020 15:29:21 +0100
Message-Id: <20200824142934.20850-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BctDUeoTtVga

Implement VFP fp16 support for the VMOV immediate insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          |  2 ++
 target/arm/translate-vfp.c.inc | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 5c64701dde0..c898183771b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -154,6 +154,8 @@ VFMS_dp      ---- 1110 1.10 .... .... 1011 .1.0 ....        @vfp_dnm_d
 VFNMA_dp     ---- 1110 1.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
 VFNMS_dp     ---- 1110 1.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
+VMOV_imm_hp  ---- 1110 1.11 .... .... 1001 0000 .... \
+             vd=%vd_sp imm=%vmov_imm
 VMOV_imm_sp  ---- 1110 1.11 .... .... 1010 0000 .... \
              vd=%vd_sp imm=%vmov_imm
 VMOV_imm_dp  ---- 1110 1.11 .... .... 1011 0000 .... \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 99b722b75bd..c864178ad4e 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2161,6 +2161,28 @@ MAKE_VFM_TRANS_FNS(hp)
 MAKE_VFM_TRANS_FNS(sp)
 MAKE_VFM_TRANS_FNS(dp)
 
+static bool trans_VMOV_imm_hp(DisasContext *s, arg_VMOV_imm_sp *a)
+{
+    TCGv_i32 fd;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fd = tcg_const_i32(vfp_expand_imm(MO_16, a->imm));
+    neon_store_reg32(fd, a->vd);
+    tcg_temp_free_i32(fd);
+    return true;
+}
+
 static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
     uint32_t delta_d = 0;
-- 
2.20.1

