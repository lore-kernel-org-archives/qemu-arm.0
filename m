Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4757236wrg;
        Thu, 6 Jun 2019 10:57:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhX0f//KVqs9V+H1S0W9qFCI4vRKOX2XhaC3HENPpW8sUqM7geXF8aYGEvOGPSx4nCqgxy
X-Received: by 2002:aed:2a43:: with SMTP id k3mr42283811qtf.301.1559843843387;
        Thu, 06 Jun 2019 10:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843843; cv=none;
        d=google.com; s=arc-20160816;
        b=wXeVCzE9yzaZf8UthL7sLcSrkrQZ9QGMklrgATdKL3OqjXGvnPwtVDjxxbq/Ls5F0j
         /PSuwdNnbN6MWMXdEjEohNkG/t0POfNzVmj0m+cCdgVQRmBCCr1q11/HLhTTNz2nNYoF
         IeI/YNEIBjGXM0MaIPNTUCPZxPlMOpYsXNsYkCeRJII4aQcW4vt91ISQKc0IkGpZOCYW
         uUABO2wcZ+/zcg5tVZYiLCd6LO1n+4Xa/PqQmkvOHDfr+Vh2/2ik/Alnbq14diJqxNYC
         zZ5DCABGtiPXW1cjmdshdpZN9EO/YVgGESm0+JWariNZgK+Ta6ajhUOiIgRm6kTfNG23
         j2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nNQjd9/+a2DdLghORqFl+Muzj1ZfiiJpWnJhjxjLPOE=;
        b=qcb3WHdtQC9E7saSuRqb1VtEXAM/B7mUBMzWLKqTgSmmiz4j9LpL9zTAbCC0UbfAOd
         nn9eCTGLG5CtHshTkkqrsGvrcF/ZXx5uAPGNBDaf6bShnMCfz420e6lJDGqjntLBjjKm
         JfuRaq1cpjfgsmowmQMRTq9ufnt7aiwA793jvcMnXBuyutz+k9zaSMgEnXGYzY0zsVDr
         vOPUdhZaCb+hVI7huQDd2sE1aMTw91S7RpJnjSY9YR7YhezR24Dt8M7ImJCj/wEnKjW1
         hOht9/K1/9YZGmTRGXpWJTGSqNHGl8WE83L5STsw52Hjf2ok11JikypoEwPkFCQoeBN0
         SRcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AeivwsWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si2442274qtf.381.2019.06.06.10.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AeivwsWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwde-00055T-QD
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:57:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU7-0004T5-2w
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU5-00048g-Sv
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:30 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwU3-00039C-Pp
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id f204so814394wme.0
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nNQjd9/+a2DdLghORqFl+Muzj1ZfiiJpWnJhjxjLPOE=;
	b=AeivwsWv6H3IMBY0RADPYPO1lUXNcmCV50EZlViQj9rpGM/zN5493L4aRJAyIaNeOQ
	Yk2k7qHXCL3EBHhm+2MP/CTSx7N04cQHVYJCjw2vdVFdrm0cV8X27GlCoR4O/enGbfW6
	dceQC6n7721RoOitNI4VdXQsDYDs6kRXhinqLrGbGet3rek38chCJDlvg5GYjX8lUIhy
	zTRwZdi0U/vFTEdxajMNQ4xN9YfNnEGwTbWt0hJ0sP0cXhfiu4rhlbXam1ZjOW3yjLcB
	xO9N6UZdylICDPYeRQaUyT8sLJZCIlyF0BmRanSelP3XkXEk/8eI6NyQlxrsSagEdeH/
	u0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nNQjd9/+a2DdLghORqFl+Muzj1ZfiiJpWnJhjxjLPOE=;
	b=X0WRnipxRn2r/VWNvslDgkBxBradon8dQ/taoyxo+0x7mmWGOlA15cf0VzE1sH7tv+
	PcnHLwTLHgOAq5jl2gnnL1uoOAGwNs9itE+TJBUT6SJhigYTJsJSG1KqYvWcWjtJ9Vwt
	xKgMBCLYPMdtYaa8UO1wZn6xcZtzBLp+iYvMiIviX0CUJyNoo6BLnwzDG6P5z6dyYdyw
	LI2/GYsAKK4L+vVNeM6y3b494/qmkogHUXGUfvmt2aivW/t2wtYH2AW61nMnNgnqX5Ne
	QDMXC7bbqk22iVvj/43hz8tJkMYXdE/yGXHe0fiVY2lr7aBSEhF5RVL0vURHHo1t3/oA
	SkpQ==
X-Gm-Message-State: APjAAAW+iY7xvCA11mDH3vLbReBaeeEmw/YGCexlY0VwIq5JTGz9vnE9
	X15c2rAsa9NZDvbhtB0jii4oWuzupHlr7A==
X-Received: by 2002:a1c:305:: with SMTP id 5mr824561wmd.101.1559843198881;
	Thu, 06 Jun 2019 10:46:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:52 +0100
Message-Id: <20190606174609.20487-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 25/42] target/arm: Convert VSUB to decodetree
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
X-TUID: jwAsE/IRKUtf

Convert the VSUB instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  6 +-----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 14aeb25f597..12da3b8acb8 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1461,3 +1461,13 @@ static bool trans_VADD_dp(DisasContext *s, arg_VADD_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_addd, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VSUB_sp(DisasContext *s, arg_VSUB_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_subs, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7fa255f6598..433f1cbf2c7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1386,7 +1386,6 @@ static inline void gen_vfp_##name(int dp)                             \
     tcg_temp_free_ptr(fpst);                                          \
 }
 
-VFP_OP2(sub)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3110,7 +3109,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 6:
+            case 0 ... 7:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3296,9 +3295,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 7: /* sub: fn - fm */
-                    gen_vfp_sub(dp);
-                    break;
                 case 8: /* div: fn / fm */
                     gen_vfp_div(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d911f12dfd0..de56f44efc9 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -132,3 +132,8 @@ VADD_sp      ---- 1110 0.11 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VADD_dp      ---- 1110 0.11 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VSUB_sp      ---- 1110 0.11 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

