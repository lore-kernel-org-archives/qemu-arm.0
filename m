Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4756613wrg;
        Thu, 6 Jun 2019 10:56:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWmLH5X+YN6aoVbwvCndWQrFh4sgW2ItfCtnHZdgFSkfYEIeWIg1Ik+VLlvwUbtZfGsUTs
X-Received: by 2002:a0c:d610:: with SMTP id c16mr40705573qvj.22.1559843796894;
        Thu, 06 Jun 2019 10:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843796; cv=none;
        d=google.com; s=arc-20160816;
        b=LgltchACrHVjkTS04Hth8NgQJtpHBB0KKgVRrs023R5S0yVxrrrywLYMNKKL3KD3vf
         IAz+TllL2db+7ulbhN8AyjEOXTwyGI0qjp47zyeoZeHZIABRNBsK/U7vz5zKQnux4XzE
         aIdZ5AC3Za+qJ1zGpCYlG6xM3OlbYh9kSTgkuP9dYeOTIim5d/Af9AGETHEC8nb0QrhA
         kAQ/nXcSIYHjRatVKelm8WtZVtMx0gBJtwyiZdK2PwDqvPATJq+i4/JbPOpTl1r0GoYQ
         DxS3kz9h5o0zgsWjg6sz2jVNv0MI6qt2f0Wq2zejaeWTluVhzLfRChwL/c7fMxSGGP3J
         TzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nUY4whzXyU6WP8ecPGM+NaX0pvWgHVw5NXfobszfOy8=;
        b=EXp/QQdpOX6UbZXTDSGIHLQVlKeyPC7GiioMH6yLbTmFd3T8I5fi+MYHt1W6LOv+Sl
         3IndXPpfC26WS3bd4SUfE/CV3kw1eW4aEVLynO9pVxaudERk0BmWYX8je+izqqNa7hZM
         M2p8J0zwHMRB9GW9gkwWfMzH4lbQRjBwXadL3t+vN2yUp9GnVgRPg+aH0CYXe2rYqmE+
         fjrdvC/BYDCpGoXwm9FlLeO9tHWR3rojTIuPUgtAPTU2UO9mzEFXkO41RQLoQttdpQF+
         WewFirFe1IOw6Y30iIXRO1cMs5FwfMmB+BsgFR68aDqkK546Ibrc2ky/ylPtIq8zmSUo
         e6KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XIocGkdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si714677qvb.30.2019.06.06.10.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XIocGkdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwcu-0004O3-CW
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:56:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTz-0004Kp-Ms
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTx-0003st-1h
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:22 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTt-000377-6W
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:17 -0400
Received: by mail-wm1-x342.google.com with SMTP id 22so829084wmg.2
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nUY4whzXyU6WP8ecPGM+NaX0pvWgHVw5NXfobszfOy8=;
	b=XIocGkdbUohjdpc4QxP5z6w9olsbcw6lZk/w7nNiQQ0tCw5AGHYVhb9Ft0HOsE7vsN
	WvKY73o4Z5L6o6xkIqug2FfZZViFPQVDuS4KwNov2mN9QzBQchsEmoaxyI+6W8nq7TFU
	N1ir+JJSokfXkGORffm5FmKV6uTTl+KA6uEKuZf06gxNdry6xSw65WpUrTt/xYcViDre
	2cn/amSOFjgXBQzaQNsQ9M0mmC31vm6gZRzaRimvHJVe8IEJ5iL5qfocqC8kpByprYhe
	AXllxYSrVrVL/R1pl51kX/L3wMGuMkAjUZrqGVfp9kOmU++DnBEnLwagyyEnB3oSIGCi
	0uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nUY4whzXyU6WP8ecPGM+NaX0pvWgHVw5NXfobszfOy8=;
	b=PUBIr1L0zhV0wVJyrPwTDyKZjqx10dGerOpU3sQP305rz8DaMhuVcBwFORCT7n1DvQ
	VctjhXpGv1A/B4iKEbNYO21mEauSGB4uOn2pcd48phyw+ztL6i5VMPidkgFbeYwfyR2e
	YfdHgNL61r66k7EKNbQagqKmFpd7gZU3CgUuZfVOkIbLueVrfs6afTGe00S9Aj4diEiu
	cXhVPCEoXpEjnxpSXR3SNJ+1kYoov1EuriCa2mkwkYgC2YkuuYMTwrRk1rxCOufta9KY
	JtnYxDTl9rEBsTk0CtfQmLFT/3J8Ncv2mjBfhVwVkONa2qmgICcrha8mFaa9LvGsa0QB
	rVxg==
X-Gm-Message-State: APjAAAVs6i3LFsxAqymxU9nYmRWXQp8U3ZHy88oqX492mB2gllCbv058
	bihL54gEoB//5zTNq11RXXKeq5LrYvEMew==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr825826wmc.29.1559843196978;
	Thu, 06 Jun 2019 10:46:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:50 +0100
Message-Id: <20190606174609.20487-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 23/42] target/arm: Convert VNMUL to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j1sPaFzy6d6u

Convert the VNMUL instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c         |  7 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a2afe82b349..4c684f033b6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1427,3 +1427,27 @@ static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
+
+static void gen_VNMUL_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muls(vd, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+}
+
+static bool trans_VNMUL_sp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMUL_sp, a->vd, a->vn, a->vm, false);
+}
+
+static void gen_VNMUL_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muld(vd, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+}
+
+static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 226f1006ced..23addcf53d6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1388,7 +1388,6 @@ static inline void gen_vfp_##name(int dp)                             \
 
 VFP_OP2(add)
 VFP_OP2(sub)
-VFP_OP2(mul)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3112,7 +3111,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 4:
+            case 0 ... 5:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3298,10 +3297,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 5: /* nmul: -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_neg(dp);
-                    break;
                 case 6: /* add: fn + fm */
                     gen_vfp_add(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d7fcb9709a9..3063fcac23f 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -122,3 +122,8 @@ VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

