Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753626wrg;
        Thu, 6 Jun 2019 10:53:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIyLpS70BJtPumwpCz8ZQYbUeobyKzCiSTdZQjnlB8qNFq5JynVYeShV1svD+ECNte3KaG
X-Received: by 2002:a0c:a066:: with SMTP id b93mr39039321qva.140.1559843603159;
        Thu, 06 Jun 2019 10:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843603; cv=none;
        d=google.com; s=arc-20160816;
        b=RXDAGEO/jbZ63O9jVtRFVOCmlpklIJuRYrM8efrQ2ooJadJDE/ks7SgbNWd37Q5dUC
         HIN9nFdnJoUImetoE0bzYMluW3WDHFzOa+9sqE4KozG1G+nmE+9n5fKcFSujN3CWc6Wq
         4OEs0lcI6SE/o/lXPz4LwkmBvCOJUXGJoiNk+dEAxWYKwSrfpaCeqGOOu9x5TAQ+Dv8V
         b8gwI0aV4Wa6sK2aVzK/SjfmAXRy7OAu2dobOThpYmArjIIegBJECLxE0vrOkhZdyT0E
         Sdn9w5ro+TJ161xzD3OhurOwa9Kwa+Eib36s4639E6gHeFvTuPd5vlsz3BqBg6PIvN14
         Z0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7cJ3cFmAyElsbk0Hu0rymmkEdd46OTUs5chKPb+2SUk=;
        b=QqiAFnkWBx5VQ+Hz6NaPkhbF5lYxjrwMEoKgBC2xfqeRWfstv5r2DzpeXDxFI2MRHs
         W57xigiAtGp9bbhVgt00Udwb4cCrQFGr2E6oDbi8+p4uBqj6DXAtsV3T9stYZk0ey7Fe
         DI4s2C+mHOLhUa3he0rNV6NEBg5VlrosjNKUj9hh5noEeNNe5q7dUb8Z/j2quLw21haH
         38kB2qgI1JvrXbbC1LygTJt4LDqQe+vup2k6ryoIyaK/dnBJpwBtDGjIqao9ZPLUM1t0
         q9CC8PLDQ56TkttfAK6LsAjEV9aov1R6YaLC3V0kW1U7oPkECPGyJS+VII77u4i7eJ1n
         iSCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PuzlN0rO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si415756qtc.52.2019.06.06.10.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PuzlN0rO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwZm-0001Wr-IR
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:53:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTt-0004D4-5O
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTr-0003jl-5k
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:17 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTo-00038F-FU
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:13 -0400
Received: by mail-wm1-x341.google.com with SMTP id u8so827522wmm.1
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7cJ3cFmAyElsbk0Hu0rymmkEdd46OTUs5chKPb+2SUk=;
	b=PuzlN0rOoe+tct2TDQT9IC5tcPr1vkND3v3RXksDDziqk71KN+I8TM4mGsw6gjSsOC
	zc0I5GCHYLuY2iIPqWRRmNzYATGQXE4iQUwk8bvjPykHMgepqJdVu9xi8QUiNW2/7k3m
	zdeTw5IQndN3DmT48esq9QVncIiIWXyX9UimzoVeGedZqdGybV4c2S0aBCYtTVQto4i1
	Yk3ODpGi6XUxjgJ+d6+PKN8aD/61vnjxXGNZqTclD+1rNlJrfMyvgIShncRbNdGEN3W0
	HqprcflwaiJiFUN4o8D7doQYbrlWUsXsdrhaI7e8HK6eQCfAtLrvI3nsCCuqWewHazXQ
	+Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7cJ3cFmAyElsbk0Hu0rymmkEdd46OTUs5chKPb+2SUk=;
	b=Wh4l0tWaL5Y6IxP+qWFJf2Nv5HDhZq9gvKJ1JfYpn4nvkD/hdRMOpIL959dBm9CRgn
	qZsSLNcyjhTEL4LHaF/Hm+8XgCQgh3bVnu0LKYWUwXN3ogOSOBIxefkUWYb7OwEsLSq8
	4EOBTLedFlCVOYQGLZlsHhN7N4wOhLAmswV9wtO5BehzYAeM4+f/8pVZcMoPZqOFAjmc
	eyW7G1zzED250kQ56SE7tj13oz/TrBxfLPIJ62HHRcdGFIKom5TZtgnadig7NGa2Ejff
	O+lHQYU9Mdh5RgYDeaAJ5T4jF4YwNJt5Tn5ttto7/snFrY6LHoO3V5zQ8LLSOaTQllPM
	LGZA==
X-Gm-Message-State: APjAAAXlwEsW3lMpe4yYS+JJDxr5WoBIDkkqJ1/7b/iLLAa5e/8vy1ew
	RXoU7tQnWTEcBWzFHH8hgOKT+ACKZWxTBg==
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr753998wmh.148.1559843197969;
	Thu, 06 Jun 2019 10:46:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:51 +0100
Message-Id: <20190606174609.20487-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 24/42] target/arm: Convert VADD to decodetree
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
X-TUID: X4/9xRRGPR7O

Convert the VADD instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  6 +-----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 4c684f033b6..14aeb25f597 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1451,3 +1451,13 @@ static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VADD_sp(DisasContext *s, arg_VADD_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_adds, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VADD_dp(DisasContext *s, arg_VADD_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_addd, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 23addcf53d6..7fa255f6598 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1386,7 +1386,6 @@ static inline void gen_vfp_##name(int dp)                             \
     tcg_temp_free_ptr(fpst);                                          \
 }
 
-VFP_OP2(add)
 VFP_OP2(sub)
 VFP_OP2(div)
 
@@ -3111,7 +3110,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 5:
+            case 0 ... 6:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3297,9 +3296,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 6: /* add: fn + fm */
-                    gen_vfp_add(dp);
-                    break;
                 case 7: /* sub: fn - fm */
                     gen_vfp_sub(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 3063fcac23f..d911f12dfd0 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -127,3 +127,8 @@ VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VADD_sp      ---- 1110 0.11 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VADD_dp      ---- 1110 0.11 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

