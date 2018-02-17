Received: by 10.28.71.27 with SMTP id u27csp2108203wma;
        Sat, 17 Feb 2018 11:18:31 -0800 (PST)
X-Google-Smtp-Source: AH8x224OsT0g1Z9n072Wg2QO+jpRxBWf12PDM8P1IjFIHAoKuW4ky6jZbzwyk3qRS5JGd/uG1P1l
X-Received: by 10.129.153.88 with SMTP id q85mr6459669ywg.305.1518895111030;
        Sat, 17 Feb 2018 11:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895111; cv=none;
        d=google.com; s=arc-20160816;
        b=CosGwtJQXl4LMR/FY3TtPWeRXf1hwWoTssFFAHALEYQqI9ZqcfDRHZZjCPNok885nc
         SAz7P0RHOYXOPcbuwvo3clnLR1qwteMXcgM3QrpNmPvlCLdCQKiMIIKO4cqaxB+KVaLH
         waQ2KQv82hW8HlWSl7qB0Yr7yLP1k/2kg1PD3l4TlSU9X55MVKasq0tOL+ryHvGTKKFq
         A90zv/rQ/cnFwVhCnHa1lsMMuHggmkO6LYJspk9r0QgrzLIupRZ/TSxG2gySugaZg96R
         yxBCwndeLckldSP4CToRphM9ega3em7+RfsSMHsZ6Ykqvvz4zaXn+wBECh7M3ZHcI46+
         Xyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6iBAAbIc0nm8fljouk+VAtJA8NE1VxP/6Uk4XqY2ALY=;
        b=JDdHCz8wurcQyJkZ2zJx07HtkhfX2bWntZq0+/jAlna+36pQZPrGhaLagTCQ9nphSN
         7JNvyrALUd/tosYMk3wJGoDrTg+LDdigFPhgcJbdkrn9FBPPcjdp7G/Za0gftRdMDN3B
         XzrjPNpeEmArS05p4bBPgpmNnHR47QGZlKxxFW+Sg71nxnTFRk3dY7cMBkRgs3GM5JLT
         FvLB31nICDuZRSnNPpAMtReS45dIWv/MlILFLP46JVZOo+E7sANqW0+e1h/ZrKiLxdaH
         SV67MmuizFxKjX2mFY6Fxd9Q1jN5agZJ8WpDUQQX1zjyqvFU0ZrAnpe7rI7My6W3UKQm
         iXzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bQsteFdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185si3575128ywb.552.2018.02.17.11.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bQsteFdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en80E-0005T6-B8
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AP-0001gA-TT
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AO-0002C8-J1
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:57 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:39668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AO-0002C0-An
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:56 -0500
Received: by mail-pl0-x243.google.com with SMTP id s13so3437634plq.6
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6iBAAbIc0nm8fljouk+VAtJA8NE1VxP/6Uk4XqY2ALY=;
	b=bQsteFdJvY671q2PALBpD3G4VVdIP0C0wcHJJ4m0VEPbrtH2lOA6Zf1imZNajZFqCA
	Q2PtAQaa00CaJNHPIuqSzaio26WDT3AVoFWbl+K06Bz2ZRRBrHu7HhxjTrON1FkO4Nly
	ajvjiycfrYGfbms2GB42To+oQCFBC/e44OxN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6iBAAbIc0nm8fljouk+VAtJA8NE1VxP/6Uk4XqY2ALY=;
	b=FrhFpSsXR222+GsFI5MeQR6yRiPSGyDkPu55NXcC7UOz7ISTbAnL0300hLeKSPav28
	DbuoESBrOYVkAuHCgjsrI/wC5apNxFaKEU394NjLM5wJj1dNfcIx43xTrygB7JAe0JpJ
	RAGZzcVRgY8CtwnqwlgxehO/s/MViqtR5nLe2llh0VRkt+IZlOqeHqxi2l0oUJ/Go04v
	eoEVtDYs40J6m20U1bKt33jg4FTGWz3XBBXHoooi7M1Ya5QmhnHDOnEjZJCmEC9fLn5V
	3pRQCl1Ha+ptibfV/EILE8xUeoFoWlBSV1YzDuOjjxBvowmv/hjdlYpR8wz4Y+L+UOAa
	kdwA==
X-Gm-Message-State: APf1xPBqR6/kmag7sFkUi4ckWfsk0KcCQiuMyMdDiBAI/fjvUM9UWIhK
	dNwDywNWxDiKKS4XEo+PsV+UaA==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
	i2-v6mr1484963plt.368.1518891895405; 
	Sat, 17 Feb 2018 10:24:55 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:12 -0800
Message-Id: <20180217182323.25885-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 56/67] target/arm: Implement SVE scatter store
 vector immediate
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ygFB+bGtTlx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 79 +++++++++++++++++++++++++++++++---------------
 target/arm/sve.decode      | 11 +++++++
 2 files changed, 65 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6484ecd257..0241e8e707 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4011,31 +4011,33 @@ static void trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a, uint32_t insn)
     tcg_temp_free_i64(imm);
 }
 
+/* Indexed by [xs][msz].  */
+static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][3] = {
+    { gen_helper_sve_stbs_zsu,
+      gen_helper_sve_sths_zsu,
+      gen_helper_sve_stss_zsu, },
+    { gen_helper_sve_stbs_zss,
+      gen_helper_sve_sths_zss,
+      gen_helper_sve_stss_zss, },
+};
+
+static gen_helper_gvec_mem_scatter * const scatter_store_fn64[3][4] = {
+    { gen_helper_sve_stbd_zsu,
+      gen_helper_sve_sthd_zsu,
+      gen_helper_sve_stsd_zsu,
+      gen_helper_sve_stdd_zsu, },
+    { gen_helper_sve_stbd_zss,
+      gen_helper_sve_sthd_zss,
+      gen_helper_sve_stsd_zss,
+      gen_helper_sve_stdd_zss, },
+    { gen_helper_sve_stbd_zd,
+      gen_helper_sve_sthd_zd,
+      gen_helper_sve_stsd_zd,
+      gen_helper_sve_stdd_zd, },
+};
+
 static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
 {
-    /* Indexed by [xs][msz].  */
-    static gen_helper_gvec_mem_scatter * const fn32[2][3] = {
-        { gen_helper_sve_stbs_zsu,
-          gen_helper_sve_sths_zsu,
-          gen_helper_sve_stss_zsu, },
-        { gen_helper_sve_stbs_zss,
-          gen_helper_sve_sths_zss,
-          gen_helper_sve_stss_zss, },
-    };
-    static gen_helper_gvec_mem_scatter * const fn64[3][4] = {
-        { gen_helper_sve_stbd_zsu,
-          gen_helper_sve_sthd_zsu,
-          gen_helper_sve_stsd_zsu,
-          gen_helper_sve_stdd_zsu, },
-        { gen_helper_sve_stbd_zss,
-          gen_helper_sve_sthd_zss,
-          gen_helper_sve_stsd_zss,
-          gen_helper_sve_stdd_zss, },
-        { gen_helper_sve_stbd_zd,
-          gen_helper_sve_sthd_zd,
-          gen_helper_sve_stsd_zd,
-          gen_helper_sve_stdd_zd, },
-    };
     gen_helper_gvec_mem_scatter *fn;
 
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
@@ -4044,10 +4046,10 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
     }
     switch (a->esz) {
     case MO_32:
-        fn = fn32[a->xs][a->msz];
+        fn = scatter_store_fn32[a->xs][a->msz];
         break;
     case MO_64:
-        fn = fn64[a->xs][a->msz];
+        fn = scatter_store_fn64[a->xs][a->msz];
         break;
     default:
         g_assert_not_reached();
@@ -4056,6 +4058,33 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
                cpu_reg_sp(s, a->rn), fn);
 }
 
+static void trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+    TCGv_i64 imm;
+
+    if (a->esz < a->msz) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = scatter_store_fn32[0][a->msz];
+        break;
+    case MO_64:
+        fn = scatter_store_fn64[2][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
+       by loading the immediate into the scalar parameter.  */
+    imm = tcg_const_i64(a->imm << a->msz);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, fn);
+    tcg_temp_free_i64(imm);
+}
+
 /*
  * Prefetches
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f85d82e009..6ccb4289fc 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -84,6 +84,7 @@
 &rprr_gather_load	rd pg rn rm esz msz u ff xs scale
 &rpri_gather_load	rd pg rn imm esz msz u ff
 &rprr_scatter_store	rd pg rn rm esz msz xs scale
+&rpri_scatter_store	rd pg rn imm esz msz
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -216,6 +217,8 @@
 		    &rprr_store nreg=0
 @rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
 		    &rprr_scatter_store
+@rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
+		    &rpri_scatter_store
 
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
@@ -935,6 +938,14 @@ ST1_zprz	1110010 .. 01 ..... 101 ... ..... ..... \
 ST1_zprz	1110010 .. 00 ..... 101 ... ..... ..... \
 		@rprr_scatter_store xs=2 esz=3 scale=0
 
+# SVE 64-bit scatter store (vector plus immediate)
+ST1_zpiz	1110010 .. 10 ..... 101 ... ..... ..... \
+		@rpri_scatter_store esz=3
+
+# SVE 32-bit scatter store (vector plus immediate)
+ST1_zpiz	1110010 .. 11 ..... 101 ... ..... ..... \
+		@rpri_scatter_store esz=2
+
 # SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
 # Require msz > 0
 ST1_zprz	1110010 .. 01 ..... 100 ... ..... ..... \
-- 
2.14.3

