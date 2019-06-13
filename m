Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp42644wrg;
        Thu, 13 Jun 2019 11:05:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyajaFWu5iMjslxrYnCxDMBBOHZ0XrqmtnOqLpdF912LwU9HvPJzNgNw71z4gE0ynQFnwXf
X-Received: by 2002:ac8:4413:: with SMTP id j19mr8231840qtn.281.1560449151350;
        Thu, 13 Jun 2019 11:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449151; cv=none;
        d=google.com; s=arc-20160816;
        b=UsDovOKVr40VOrrqrFjWNsAu5/FY2WNA/w/MaJrfDSfn9V2l3GknIrET1rFP3iBrQY
         ijxO0zXGY73vTQ09xlZ5TqtQxSb3y3d14+ZpXyJqvR9jJ86NiT63IZI1+i+WW94qHFkl
         8Xmh4RQnN0hGkYFNi6yTauHCCJ4cLlKQl+d/cw1g14yq+MWpJG1K+mboa5inrvNQm4ly
         FzB3q6QNrz5+aEVzIHnGScg9hVdd4+fhKCRQmqR+s6d0J24tTEUEfa2Dml2ksyotgapI
         Du3oHbXVrTiME6nY43XVxsJdsqaQnFWfNz8xMQLQWUkziWik2iDty/QuUi+wR9Xx37X2
         Otww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Gokt4IdrDcmmQcCA2l5TV7aYVHlbnHYyswQ2I9MjocE=;
        b=RjWJV7mxdrwtXRRM/28nAmKZSLXpG6eInFn3Dozn76Qh23TTf9Gbo7eGE8Wrl33cQj
         eBu2dW+/b3SvpagFcpYIPpw9zANW0ZeOMKkpKpkEby4PEIIK8Czv0P+GiTnbEkp5sJEP
         xD/gpY45AYWcJ42l65E48+NuYdG+IKoj+ZH3WnGm43+dUJ1Eg0gabgtDA8BdBZWU5iHb
         lSvKIgAA+I29hX6+UIfni95X9QM1gTLpyIb7Dy05UCWjdg9QzHVNXR6Q6y1MyVlG3O3D
         PnpfO1QlHSJXd8qO+vzkJlHvzZPwsU7AA2SKbfZrFIfqC66HZmYA/CjeZpcVt/mIkQgn
         u11Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BL1q1qQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y200si231251qka.34.2019.06.13.11.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BL1q1qQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbU6g-000375-So
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53651)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlD-0003to-7Y
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSl8-0002o1-01
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:33 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSl3-00020J-Iz
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id f9so21465165wre.12
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gokt4IdrDcmmQcCA2l5TV7aYVHlbnHYyswQ2I9MjocE=;
 b=BL1q1qQed6sniZLbZricKmNJ1j42K79dZlrXG1nsxyCYust+0sy7c8/fSrz3ZFM2of
 jxfQ9obcZRGmAhFzeKFT+rKMv50w2O/BVEy08pWrgT/bswn5j+QjIC2n9dUHCKoHB6li
 cFhITtjdw3kNP3E22bhKpPJXD0fbuXa9EWRQ2jclzEIUBw/0HF4M+eOdMI9Gxzhu3S3Z
 dDZwFeIx/ZBEaCvWioAfoitpB5jYc9i1hYTylgnvzBokNLeLrW8oyuJCa6dGweHFEyFu
 Ylqq+9BwNL6sYzgUF531KKKl7PP1XxfvfrRrMH/2G+IiB+mrBM71+TNjcdqjDb4cil7f
 YK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gokt4IdrDcmmQcCA2l5TV7aYVHlbnHYyswQ2I9MjocE=;
 b=b7fecfIAVpSo5pd3k81+lYPwZS92HbnAWfBc896UBOQzciAQmNu+7phGKJC7HNuIHN
 k7Ukse1rTJxQql74+gqy3aBAySG00Y7DlgDBywONR4cJ04C6otPK6elBYymEN1IgbK5v
 Ky2QI3iYwhlDPWzVG5Khr/z4KAjrQVQ5XfhWCsUXgPLrUwupbgGLiwoG64YAyHfHuYyN
 OvF0xrjcSF1a8J++C6ftlQ61lnsVmXpcsqCq2RWBgcEhHuRcFluQZMhg9oMIWNNoZak9
 Xi11kM/vq/4d4fwxbbn7Y5VqBPMgbOLkXenrV/EW0m/xrZW5qvgpeYhs/gBtYSBsL7vC
 1dfA==
X-Gm-Message-State: APjAAAULz51sDOJvOqLLPSn3jCOjxfglVYHId1pJLTunN5UWFo7Dd/AF
 WVOLRgxtFLG18PG2W8xyhSzCYmj+B3GgDg==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr15426905wrs.136.1560443961497; 
 Thu, 13 Jun 2019 09:39:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:07 +0100
Message-Id: <20190613163917.28589-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 02/12] target/arm: Use vfp_expand_imm() for
 AArch32 VFP VMOV_imm
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/6dAsVg/1zU

The AArch32 VMOV (immediate) instruction uses the same VFP encoded
immediate format we already handle in vfp_expand_imm().  Use that
function rather than hand-decoding it.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 28 ++++------------------------
 target/arm/vfp.decode          | 10 ++++++----
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a66084f6e36..8b732761f26 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1842,7 +1842,7 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
     uint32_t delta_d = 0;
     int veclen = s->vec_len;
     TCGv_i32 fd;
-    uint32_t n, i, vd;
+    uint32_t vd;
 
     vd = a->vd;
 
@@ -1869,17 +1869,7 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
         }
     }
 
-    n = (a->imm4h << 28) & 0x80000000;
-    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
-    if (i & 0x40) {
-        i |= 0x780;
-    } else {
-        i |= 0x800;
-    }
-    n |= i << 19;
-
-    fd = tcg_temp_new_i32();
-    tcg_gen_movi_i32(fd, n);
+    fd = tcg_const_i32(vfp_expand_imm(MO_32, a->imm));
 
     for (;;) {
         neon_store_reg32(fd, vd);
@@ -1902,7 +1892,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     uint32_t delta_d = 0;
     int veclen = s->vec_len;
     TCGv_i64 fd;
-    uint32_t n, i, vd;
+    uint32_t vd;
 
     vd = a->vd;
 
@@ -1934,17 +1924,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         }
     }
 
-    n = (a->imm4h << 28) & 0x80000000;
-    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
-    if (i & 0x40) {
-        i |= 0x3f80;
-    } else {
-        i |= 0x4000;
-    }
-    n |= i << 16;
-
-    fd = tcg_temp_new_i64();
-    tcg_gen_movi_i64(fd, ((uint64_t)n) << 32);
+    fd = tcg_const_i64(vfp_expand_imm(MO_64, a->imm));
 
     for (;;) {
         neon_store_reg64(fd, vd);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index ea24365bb4c..a67b3f29ee5 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -44,6 +44,8 @@
 %vmov_idx_b     21:1 5:2
 %vmov_idx_h     21:1 6:1
 
+%vmov_imm 16:4 0:4
+
 # VMOV scalar to general-purpose register; note that this does
 # include some Neon cases.
 VMOV_to_gp   ---- 1110 u:1 1.        1 .... rt:4 1011 ... 1 0000 \
@@ -152,10 +154,10 @@ VFM_sp       ---- 1110 1.10 .... .... 1010 . o2:1 . 0 .... \
 VFM_dp       ---- 1110 1.10 .... .... 1011 . o2:1 . 0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=2
 
-VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
-             vd=%vd_sp
-VMOV_imm_dp  ---- 1110 1.11 imm4h:4 .... 1011 0000 imm4l:4 \
-             vd=%vd_dp
+VMOV_imm_sp  ---- 1110 1.11 .... .... 1010 0000 .... \
+             vd=%vd_sp imm=%vmov_imm
+VMOV_imm_dp  ---- 1110 1.11 .... .... 1011 0000 .... \
+             vd=%vd_dp imm=%vmov_imm
 
 VMOV_reg_sp  ---- 1110 1.11 0000 .... 1010 01.0 .... \
              vd=%vd_sp vm=%vm_sp
-- 
2.20.1

