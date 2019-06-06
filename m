Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753560wrg;
        Thu, 6 Jun 2019 10:53:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHlSgmqFGgBlylzXScEvz3MFVaH7I140QHWJ8E1SH1nNXwyTufXNB0ggEexenMdbA1ss4T
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr2474609qvd.155.1559843597619;
        Thu, 06 Jun 2019 10:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843597; cv=none;
        d=google.com; s=arc-20160816;
        b=a7qq0a9KWB9EiZS8/HZ8rfmpscgtATpf7HCiR74YEqNQaY3MgEAKfBwetlU1BqcJHx
         TOFArXflmROoQpeD7J79kr+AbOQIF4jCh7fiAoSGoD4FR/XZ5zFsJXq1exAVjZRgxjoB
         BFhdykiNQ6QRYR6RWmEQkV2kxfaAYYbQiEWEemoqEso8HkCZYLgSMDEyI0VIjSz8ffJX
         UdE+JxTuXAZOYTeCWnbd4F0V9EZ+RrZxVVJXFPT+Aw9s95uOXiRUhQGfxSobiGm5rOpv
         0RjMqMJul7+gW6JkpsgWS5P3JdROAv7Hzbr3IeM88xyqqqs3GG+0f2r+sn8dxRyaGmMp
         xqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=opQeVxGqpTZMg9p8Wo8mcy6JegGui05JYySUye4cu/w=;
        b=GYUZacG6Lb7UaZzxaBvrDcsKPvMZdCysXIK7TCHB6xLyI5K+sFV3GfIc1euZQvg5L2
         EV2vgfsonVXwrXWWBCpoHtgJ9c6HAr9pAk3gxU5JPMM2g4N2h3cd583eYcJssCJoeIYt
         hURQLdsnnigMK52c33xAoMguSUFtVu4Lmlv501OO31oZe7kL8Dk9xcDj50ZhLRrIvb8f
         cJpAmLBW7XFN062axCvXr20f/pUPOatB4R0jyh1Mqn8DEAp3haY2oaKiagrYiBCslEPq
         c8oPJh0CqKH/aunL9umJ+1G8ztBwjyGQT1c3rxBsTplsC5qmRYa2gNIM7d2B4mPeu5q5
         B0HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iy1tV+8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si2328560qvf.144.2019.06.06.10.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iy1tV+8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwZh-0001Ob-2m
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:53:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTp-00048y-H3
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTm-0003cQ-Bn
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTl-00034F-62
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:10 -0400
Received: by mail-wm1-x344.google.com with SMTP id f10so812696wmb.1
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=opQeVxGqpTZMg9p8Wo8mcy6JegGui05JYySUye4cu/w=;
	b=Iy1tV+8pJS2S1CuC1lkt0zIejGzPmkO94iqXJebAN6lPIoKUd8SDpiFK/0M5mwH7IS
	SR5mou97+cdy0rJgcemD8aw6Bc8zY/UG1osMHM6stSyaTcb5fbRzVETVhw07mShKCTbf
	AOkJnjDNWLcDswoCs7vXuN2ukjnbhZjxO0IqhbisHnGOrDx00bvSipjd47Ww1kx9r44V
	T8biaSiG/x494hRP6vZvEBAxhiqF7bzm9ViJZ8IJ8G/kNQs1q3Fh4A7g1XY9mJjhGY7T
	kjz7z9PdznLBaZmKPtTfTPAzmiil3v8SlZPuZ06bgDYYES1pnZiVs29jlCOj035r4XZE
	ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=opQeVxGqpTZMg9p8Wo8mcy6JegGui05JYySUye4cu/w=;
	b=MJvZll32GHaAjGqEh8X/ETVilo7jdf/9Ru+H4660T1TYRWWAbJbOGrN0peadhw7Qx5
	tWzifVSPYrDaUlkHj7B7JA9zk5Bse+g2LeuWQDB7UCeIaX0CAx4aIs61uDMZRSeueUuX
	+L9SuXikuPBRFLyctC+ph3ILJLIWRzV2D6irIGpSElN/kKNJkyg6T3BRNsUIxuq5P1om
	+1IhP38AY9FwZaR1ksu2wkAxfQU5ACPMxRKusi3WHbnfftyV4KaCrwwnUUxihCUGzuMO
	XZ8k4skHbSkzwaCtZg/6yVzdwl/TfplVoDBnzTz8spD4qil7Kxcns/qRuukly4qKL3Q8
	d3/Q==
X-Gm-Message-State: APjAAAUZdEeBJSuuH9EM5sW4XZxekRYBSMB3tjlBJ+EFhLOvSX1z4bXN
	e4Cr8mUb+Egf/oOVhBVWTlfG8le87o/TXg==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr906210wmf.34.1559843192628; 
	Thu, 06 Jun 2019 10:46:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:46 +0100
Message-Id: <20190606174609.20487-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH 19/42] target/arm: Convert VFP VMLS to decodetree
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
X-TUID: X3ezT9WbO00c

Convert the VFP VMLS instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 38 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  8 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 4f922dc8405..00f64401dda 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1303,3 +1303,41 @@ static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLA_dp, a->vd, a->vn, a->vm, true);
 }
+
+static void gen_VMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VMLS: vd = vd + -(vn * vm)
+     * Note that order of inputs to the add matters for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_negs(tmp, tmp);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VMLS_sp(DisasContext *s, arg_VMLS_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VMLS_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /*
+     * VMLS: vd = vd + -(vn * vm)
+     * Note that order of inputs to the add matters for NaNs.
+     */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_negd(tmp, tmp);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2fa516364f3..dc19d8fcab1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3134,7 +3134,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0:
+            case 0 ... 1:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3320,12 +3320,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 1: /* VMLS: fd + -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_F1_neg(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_add(dp);
-                    break;
                 case 2: /* VNMLS: -fd + (fn * fm) */
                     /* Note that it isn't valid to replace (-A + B) with (B - A)
                      * or similar plausible looking simplifications
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9530e17ae02..7bcf2260eec 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -102,3 +102,8 @@ VMLA_sp      ---- 1110 0.00 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMLA_dp      ---- 1110 0.00 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VMLS_sp      ---- 1110 0.00 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VMLS_dp      ---- 1110 0.00 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

