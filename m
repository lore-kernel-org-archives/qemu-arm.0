Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4210071wrg;
        Tue, 11 Jun 2019 04:06:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxY7kV4boGVvH6JZVEbd7jQ4EVMTgQJvCQGyeXwkF83xkjj0+Ab3C4CxBw/qIbMfmccHQfP
X-Received: by 2002:a0c:ae50:: with SMTP id z16mr10773869qvc.60.1560251195575;
        Tue, 11 Jun 2019 04:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560251195; cv=none;
        d=google.com; s=arc-20160816;
        b=vZAQgG/n8LR53rz6Qb+4SRAdRTRQqtpvoEGV0yqA4Hd9258qvt88UJNlL/NgksCZOL
         15bpC4qi3Y1FUL6JLTteYFXC4AVhoMmYVBaN+K8P9FhHYdTBEgiwqEztx0NlWa9b+35o
         XamL3n0B76tpndp0TN1+JC+Hoc6MKv45Uvdae1sg07lnUZnD2zRqQnDKVLktuoSJc+k2
         m8RPNwmXyEKBqDT9C49EcL/eQA4I/+l+qrDJpJzPH5wJhuoRlMI2VKT/5/ZXGFGgev4r
         lBF1i1JsMCLTV28zm7kuDNIT3PuKbjyxOmqi5ujbnhigG6tK0Eigae1nI9DVDqKsNFQJ
         0Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Re3Rqp+76+/FOhH4NrXDuyW0zbLxDuCIwdDqY4GSpxA=;
        b=X5kCvAVGWdVaqRkyOWMse6WultHtoI4Ldq10GDxWOlIJTI88YIim2hEB4ZSOgDcmoh
         IgcIQ4CZ3VTQ2GI6niTQcHqrmyPEbIOtDnXN9K6jLPZI/uO64mIERJyWw2xE/pj3lNrJ
         ALy2OSEtT5adD5bWDxmTGHd03PgtSVFMYVyIhsnl2TXWtw0qOvajLE65j541oDOHDbex
         58IPxr4vsToepYMVlN3cBPbv25l1OTT5RYu8OrqdRHi5kaVGI/kfmdGrf/NHS5VdFwfL
         3CcpiEWwOyb4wH0k0tJutNq8hfnvHnVspqrMRWM95D0QR2TUSsC/LfBqz5uGF0nLcHcu
         PaWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h3rUufnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si3990170qte.239.2019.06.11.04.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h3rUufnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haebr-0001lt-2m
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ3-0007Mz-Qo
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePz-0007Z0-9r
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePy-0007YC-Vk
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:19 -0400
Received: by mail-wm1-x343.google.com with SMTP id x15so2420683wmj.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Re3Rqp+76+/FOhH4NrXDuyW0zbLxDuCIwdDqY4GSpxA=;
 b=h3rUufntCtQj8CL09lEs84BRqUreCI9ffxDlFGY09Fn1UKqdBoRqXP9ByEuegCcMde
 A3veoIw9W8ubydh3CVW+3CQXt4PDsOYqtctgh1S8xJWI75TcEuq1kaioeTaReevJniMO
 kzbVseB1dcvg2gGZzmYGTv8pPwFZparlPAsxtWPy3zNY1HHdujrZ/Fq19/jCb8U+zoN4
 MGL9UeAr4+jqy8OcLwgHXbl4jBkWTg8XiDE6kKmF4/szCt8XLPHeXdtBxh/SGcVa2Ty/
 7QQ2IwKMCfkxENBiof+caFHpCOpmqRGdExDVIvX6UzHkuiK9zOBbNiEkaHN001xfEs9A
 8BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Re3Rqp+76+/FOhH4NrXDuyW0zbLxDuCIwdDqY4GSpxA=;
 b=kB4OFRczyaaavNFA612SgIzZkymAZAgry0x23SNw1QX2KEMah/PoyHy+6YJ86WIoPm
 QfDZDKaY4WScyx4XkpawH45n+OCyTFL2XyL4DidIWF9eJ7yNgMFO5MYWcYYAJ14PNf47
 8ieps9irGY0+OkoBPYSOKmY4iDq9qS5510R/F/1MaoeNFNprXe/kAcR0kWYtdDNtPLnl
 cwRrZ4JaUiYOYb9MAcxHjFH4PqYCcjpIx135tY896BcIcv5jRtJiN1sBG7kpSDSHGU4q
 l3NT2W5v7SOQntmzO5g6aIICMcHM4t1swQ6akmtp4Dyf2CCaO8NPE8mjIRyvqS3EgONq
 sfMw==
X-Gm-Message-State: APjAAAUYTY3xn80KRPbQzbTEgSQtx98f6ITmPoQDezWZVSGxg3j9B4QW
 aaVwb7PD9Z1FNzFvokkIJEnyjqC+nZYzkg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr9243045wmh.68.1560250457857;
 Tue, 11 Jun 2019 03:54:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:31 +0100
Message-Id: <20190611105351.9871-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v2 22/42] target/arm: Convert VMUL to decodetree
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
X-TUID: wuVPfqh9s+yG

Convert the VMUL instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  5 +----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 8532bf4abcd..a2afe82b349 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1417,3 +1417,13 @@ static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMLA_dp, a->vd, a->vn, a->vm, true);
 }
+
+static bool trans_VMUL_sp(DisasContext *s, arg_VMUL_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_muls, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1f83723b81a..96790e65c6f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3112,7 +3112,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 3:
+            case 0 ... 4:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3298,9 +3298,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 4: /* mul: fn * fm */
-                    gen_vfp_mul(dp);
-                    break;
                 case 5: /* nmul: -(fn * fm) */
                     gen_vfp_mul(dp);
                     gen_vfp_neg(dp);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index c50d2c3ebf3..d7fcb9709a9 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -117,3 +117,8 @@ VNMLA_sp     ---- 1110 0.01 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VNMLA_dp     ---- 1110 0.01 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

