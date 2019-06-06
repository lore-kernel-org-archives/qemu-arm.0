Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753850wrg;
        Thu, 6 Jun 2019 10:53:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+SnptKqTssMy9ukKI79U5IaiL4E/SkFO1hZgZZjj2/3eTsI5cPqzp7gshL2lMHS6NTF4h
X-Received: by 2002:ac8:3fa1:: with SMTP id d30mr36064945qtk.54.1559843615956;
        Thu, 06 Jun 2019 10:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843615; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9/t2yB6ME/qrkUkYXMiiJfxT2VCAKv3FBgOfG8dM135yQ/0CABm2zQHB3wbjacmDk
         3Z84kU3bJawww16A+4HhYz8EkQ+r6LGAEv5AZhe6/dqj7DOD3LWJp3QXchNA7nxgEGbI
         CLxG8tHGKI11Rgh/HRg7adW9N8aihdUcg9YBRdBZsPXOIvVUDwJAHGtGrg3NJN0CuJVx
         2kL2231n87LnhzUwoNSeKkT6nL3M9g8VDfSpCW+kExqfZmPrE1Y0LACyY8oj0+56kYMH
         rjnttYTvc5GkLgMgHfcBlGE4PNj81SgMW0yNesrZXys5baxpGWC62V+9HzSZM6lg2Spt
         iDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VVY23NUYf6hml3iiJOP9cZFQC9OmaRTh9VCnK8KY7K8=;
        b=YpHVotUZpbHtCPAvkf86q4KDdTKGpjpb8GNFD7Bh3+dswhnL6xHTsRDiOW7aIieEF1
         tExJHd+w+pUF5DDd0/FBA+/E80M8HyZjPMpapPfag9WIRaw+xEfwTzWYxAW6Wv2gZ1fA
         v9wzt7cf8/oX74Dnqsq+fEdK+EgGGjXVnmMlBMrHuOD1GQvACkKv5wVol4cdnrSDp7NA
         fpqwLX+zRgNRyM5Im5CgPDF8BR7h//NUlL7EQhh2UHRLgLPsR1Lxe1Ej0G7Guvjp1Tci
         sgYtDVe/TNeXyHbb9Ii1OIBEzEMhi+g89vLae4op+Fq4TWO2G/zWQSOREwEj0Edcy8cO
         XYNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvqDhxVr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si2305986qtl.182.2019.06.06.10.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvqDhxVr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwZz-0001kE-Dl
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:53:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTr-0004BU-PM
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTo-0003fE-A0
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:14 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTm-00035D-BH
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:10 -0400
Received: by mail-wr1-x441.google.com with SMTP id r18so3319249wrm.10
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VVY23NUYf6hml3iiJOP9cZFQC9OmaRTh9VCnK8KY7K8=;
	b=QvqDhxVrlbh0pyQTtEEIgOgaAoYZt1PrMWJoF5V1NSZ29w7FONx02btRnQRugrOkG4
	0ppGv77XbSMCSVViSUA7hfrCeRzi17nS9gdG5KQl3N4FOyqpDs2TVYnRbGEa3XLLFuqR
	7XNyOI3OmpJPFqQ+HDqhlLyaI65yvflktXU60YYDz6BZ4ZQIoCOY/Afq8haEjkxAY7u/
	dc3+IqE0OQ2dAXTeb3cwPY9DPVZCgDVMfcdvcbB/oM+exk+RfVbsuZgJ3j+us8nTk3oi
	oUw8rUo9BJaQIkyjCap75uNZ9jesMy0o9IIWv1otch06YKFH/qHDDUq89I/vFwN7ZVbw
	pCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VVY23NUYf6hml3iiJOP9cZFQC9OmaRTh9VCnK8KY7K8=;
	b=JC29wUnROYfNucgWA3u+o9S4jKisDF5u7bGX0GMsLbyDqRq5YDto8UmLu//adYW1Ov
	09kbgW9UHfCp3kiAH7gw2IOKv2+mOMqOkZiKGYSnYHoLQWbWdjPTzEH4d/a+LZKMvgBZ
	doBBdv4z+m2d8Kp0zVu+KWNyaiTCfwBICfS3akSEmNinPRg0fZW+WloxPxbQuow2ApEF
	x0fo6RdzvaUw2Rzqp5avsawXNKenxEtU1Max1hHYYUqbmanePuXzsezj3NjU/YFD/5oc
	tVVwjWhs0GUXd9KqZIp70Ho1JrHrcyylo9JZs9nggbjbZrGTiTZHnPjlPsEIAOt0/YC9
	PRHw==
X-Gm-Message-State: APjAAAXA51zCLSa3xB6uYGDSmTQCxz4kYid/PpqIrGC+kfVVMGL6x8jA
	Su/UbUKsw1zKRHd3uNsLJ3KA1Mt5Xk1ALw==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr13044625wrw.26.1559843194725; 
	Thu, 06 Jun 2019 10:46:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:48 +0100
Message-Id: <20190606174609.20487-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 21/42] target/arm: Convert VFP VNMLA to decodetree
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
X-TUID: ZO7TbJIUy0Z9

Convert the VFP VNMLA instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 19 +------------------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 1d7100debe4..8532bf4abcd 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1383,3 +1383,37 @@ static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMLS_dp, a->vd, a->vn, a->vm, true);
 }
+
+static void gen_VNMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMLA: -fd + -(fn * fm) */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_negs(tmp, tmp);
+    gen_helper_vfp_negs(vd, vd);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VNMLA_sp(DisasContext *s, arg_VNMLA_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMLA_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VNMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* VNMLA: -fd + (fn * fm) */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_negd(tmp, tmp);
+    gen_helper_vfp_negd(vd, vd);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMLA_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bb86c603712..73b30ed33d1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1393,16 +1393,6 @@ VFP_OP2(div)
 
 #undef VFP_OP2
 
-static inline void gen_vfp_F1_neg(int dp)
-{
-    /* Like gen_vfp_neg() but put result in F1 */
-    if (dp) {
-        gen_helper_vfp_negd(cpu_F1d, cpu_F0d);
-    } else {
-        gen_helper_vfp_negs(cpu_F1s, cpu_F0s);
-    }
-}
-
 static inline void gen_vfp_abs(int dp)
 {
     if (dp)
@@ -3122,7 +3112,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 2:
+            case 0 ... 3:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3308,13 +3298,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 3: /* VNMLA: -fd + -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_F1_neg(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_neg(dp);
-                    gen_vfp_add(dp);
-                    break;
                 case 4: /* mul: fn * fm */
                     gen_vfp_mul(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 08e4f427408..c50d2c3ebf3 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -112,3 +112,8 @@ VNMLS_sp     ---- 1110 0.01 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VNMLS_dp     ---- 1110 0.01 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMLA_sp     ---- 1110 0.01 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMLA_dp     ---- 1110 0.01 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

