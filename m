Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp847553lfg;
        Mon, 24 Feb 2020 14:28:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZmw+g2OrWP/1IhC0pAzTwKCDbh1dV9aupA/mhVb1O4rmr81bNPlbI1iE/3imQ7Y0A4pxa
X-Received: by 2002:a37:4550:: with SMTP id s77mr15688514qka.336.1582583305621;
        Mon, 24 Feb 2020 14:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583305; cv=none;
        d=google.com; s=arc-20160816;
        b=p6tG7zGhM0THSZSZ5KHJBLD2wiaBhK4qyIB/i+7MPAiDdFKjQEWPPxvQr78SzeYXxd
         V65DVIsHWNFifK8kvNEHwuDg96otMqSVeru9VDokuIkrQTaHqbQlaZbKrE8Bx+/ZjIFi
         mmuY+bET4EldxtGfAfWY/Hsfs5j50gLrNRGlMF686C7HhxwUmLuT6+c/tHMCTwRRFWi1
         zMvk7GWzdlwj3JwWsvZ7k2drphpwrJ6L9TkyE+Ko0dcre16Sr8Ypn1H4rhbigTAkFuAU
         b/E9flObMndBYMlohuDDxqgbeSc/uuEVWFdPT9aUyB5rxur1Htzp8bbkkeZLiwilAd6I
         85WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N2dqLxgdt7qGgHLw+VE7Z3TBav3OjyXi4mGQvjqJ7no=;
        b=acANsFfkET4+5Tu1F6lFBLD5LHeDUZm9+5FlYtJw6ZKaW2XLiJcmCq3IcOYPYCOYsh
         rDwEHRJ35k1/2dTTT9KQPrKQuY4jQQbn0AwwkXzLa2perRdrmHw9COHkZ3wce4jwNe1K
         LbfNxOaVrFXVuTpHfw9LWsRX6tH6gBZIjjhtaHF90ST8YEbcKdLoAiprLVcr6Q6xBWvj
         JmJBea/XYOA+I0N1cHaYM67zpZn+gG8J/WVYOxGfcTTF2zSjrtD1qG6NchUbaBHSEuus
         W8i/J9kOL5xk987mBTHeC6xCkYZ/davKD0Bgk3UynXQoum5HkInR0aM8F2QZhnXubGGb
         urRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHF8Q9QA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm17si6098233qvb.139.2020.02.24.14.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHF8Q9QA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6MDB-00064V-0x
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7t-0004l4-Rk
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7s-0005yO-E1
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:57 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7s-0005xt-8T
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:56 -0500
Received: by mail-pl1-x642.google.com with SMTP id p11so4611773plq.10
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2dqLxgdt7qGgHLw+VE7Z3TBav3OjyXi4mGQvjqJ7no=;
 b=dHF8Q9QAoA5L8xBMfhYW2OB4bDW1HYNPABGNrIYqYAG9fRvqaMdPbdjSCfeElQEpQy
 PwCiAAwsvjKtQ+3h0B0tP+eINa904zjIyQS61S53tcPJzYG34vjzfhgXPiveG9siUzGG
 DsK1Wz1XoSVZVWxXU+WOkbMXiOb4L0wmW8XestPSjCD4mNMxNQZPR4Xt2VKp1wtzYiPV
 NpQhAqncAKVGABN3DLqYIXbcAF0yGrb8pRON8JDmBnXFSxAvAST+BAetVXmttlwLsF0T
 oraing11oa0ncQMSbXq5/27Y1/jYfHP+Xl15hvb2h4zU3i9/RdL7V0Pe2N+Y9fgdnSeZ
 5KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2dqLxgdt7qGgHLw+VE7Z3TBav3OjyXi4mGQvjqJ7no=;
 b=b5DS7lfvJx4DP2eU0wb5nqQCaKGiZZZSqZ9rjjTLPaWp1ofq8OtH90Cg+j2MmyD0cZ
 Ul5k6h0gMPAGE/dMbpUTv3IAQqBg+7IFw3DIPFJat4D5RiQKXcrsBADQzRg6FB+1qXOn
 25MezYpDgCnAQ1zl2+KiXZiLQs8/CmJzmpYzxICP1AKtw8V2eYd8CC3JOC8f2veDjBQG
 rr8gCkJyWxrgn5TsBo4A4JpROHeQpPihmha3GSbB2KKumRHo3spe4u1/mDjiIWDkeXf1
 yUZcddKuPlqrB6igLSZQmMzt4dfadEFo5i004+o95kzNT9T+eWEit64fShqS+Ux6dVeA
 FSLw==
X-Gm-Message-State: APjAAAXWfPuIZus0JRWzyf2TemHRP4gDIeGJ0p0JDYyycTPipqY0rvSX
 09y6UDUVfFBvjrqPD6GgZmlFHw==
X-Received: by 2002:a17:90a:36af:: with SMTP id
 t44mr1414093pjb.25.1582582975279; 
 Mon, 24 Feb 2020 14:22:55 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/17] target/arm: Split VFM decode
Date: Mon, 24 Feb 2020 14:22:31 -0800
Message-Id: <20200224222232.13807-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: 0YItZ8DGZpBU

Passing the raw o1 and o2 fields from the manual is less
instructive than it might be.  Do the full decode and let
the trans_* functions pass in booleans to a helper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp.decode          | 17 +++++------
 target/arm/translate-vfp.inc.c | 52 ++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 4f294f88be..5fd70f975a 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -130,14 +130,15 @@ VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 ....        @vfp_dnm_d
 VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
-VFM_sp       ---- 1110 1.01 .... .... 1010 . o2:1 . 0 .... \
-             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=1
-VFM_dp       ---- 1110 1.01 .... .... 1011 . o2:1 . 0 .... \
-             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=1
-VFM_sp       ---- 1110 1.10 .... .... 1010 . o2:1 . 0 .... \
-             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=2
-VFM_dp       ---- 1110 1.10 .... .... 1011 . o2:1 . 0 .... \
-             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=2
+VFMA_sp      ---- 1110 1.10 .... .... 1010 .0. 0 ....       @vfp_dnm_s
+VFMS_sp      ---- 1110 1.10 .... .... 1010 .1. 0 ....       @vfp_dnm_s
+VFNMA_sp     ---- 1110 1.01 .... .... 1010 .0. 0 ....       @vfp_dnm_s
+VFNMS_sp     ---- 1110 1.01 .... .... 1010 .1. 0 ....       @vfp_dnm_s
+
+VFMA_dp      ---- 1110 1.10 .... .... 1011 .0.0 ....        @vfp_dnm_d
+VFMS_dp      ---- 1110 1.10 .... .... 1011 .1.0 ....        @vfp_dnm_d
+VFNMA_dp     ---- 1110 1.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
+VFNMS_dp     ---- 1110 1.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
 VMOV_imm_sp  ---- 1110 1.11 .... .... 1010 0000 .... \
              vd=%vd_sp imm=%vmov_imm
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 1964af3ea5..41aa67c133 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1784,7 +1784,7 @@ static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_dp *a)
     return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
 }
 
-static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
+static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
 {
     /*
      * VFNMA : fd = muladd(-fd,  fn, fm)
@@ -1828,12 +1828,12 @@ static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
 
     neon_load_reg32(vn, a->vn);
     neon_load_reg32(vm, a->vm);
-    if (a->o2) {
+    if (neg_n) {
         /* VFNMS, VFMS */
         gen_helper_vfp_negs(vn, vn);
     }
     neon_load_reg32(vd, a->vd);
-    if (a->o1 & 1) {
+    if (neg_d) {
         /* VFNMA, VFNMS */
         gen_helper_vfp_negs(vd, vd);
     }
@@ -1849,7 +1849,27 @@ static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
     return true;
 }
 
-static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
+static bool trans_VFMA_sp(DisasContext *s, arg_VFMA_sp *a)
+{
+    return do_vfm_sp(s, a, false, false);
+}
+
+static bool trans_VFMS_sp(DisasContext *s, arg_VFMS_sp *a)
+{
+    return do_vfm_sp(s, a, true, false);
+}
+
+static bool trans_VFNMA_sp(DisasContext *s, arg_VFNMA_sp *a)
+{
+    return do_vfm_sp(s, a, false, true);
+}
+
+static bool trans_VFNMS_sp(DisasContext *s, arg_VFNMS_sp *a)
+{
+    return do_vfm_sp(s, a, true, true);
+}
+
+static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
 {
     /*
      * VFNMA : fd = muladd(-fd,  fn, fm)
@@ -1905,12 +1925,12 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
 
     neon_load_reg64(vn, a->vn);
     neon_load_reg64(vm, a->vm);
-    if (a->o2) {
+    if (neg_n) {
         /* VFNMS, VFMS */
         gen_helper_vfp_negd(vn, vn);
     }
     neon_load_reg64(vd, a->vd);
-    if (a->o1 & 1) {
+    if (neg_d) {
         /* VFNMA, VFNMS */
         gen_helper_vfp_negd(vd, vd);
     }
@@ -1926,6 +1946,26 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
     return true;
 }
 
+static bool trans_VFMA_dp(DisasContext *s, arg_VFMA_dp *a)
+{
+    return do_vfm_dp(s, a, false, false);
+}
+
+static bool trans_VFMS_dp(DisasContext *s, arg_VFMS_dp *a)
+{
+    return do_vfm_dp(s, a, true, false);
+}
+
+static bool trans_VFNMA_dp(DisasContext *s, arg_VFNMA_dp *a)
+{
+    return do_vfm_dp(s, a, false, true);
+}
+
+static bool trans_VFNMS_dp(DisasContext *s, arg_VFNMS_dp *a)
+{
+    return do_vfm_dp(s, a, true, true);
+}
+
 static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
     uint32_t delta_d = 0;
-- 
2.20.1

