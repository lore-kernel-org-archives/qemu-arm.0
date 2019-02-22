Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7180382wrx;
        Fri, 22 Feb 2019 09:12:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYJDn8REGcaiZavVLnIJwnnlj7y7PqIUmFRE/ooGCO+qKUrkeOQNQAbmieSP0I1ZbSEJZ1/
X-Received: by 2002:a25:da12:: with SMTP id n18mr4298270ybf.236.1550855561835;
        Fri, 22 Feb 2019 09:12:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550855561; cv=none;
        d=google.com; s=arc-20160816;
        b=i4l4SAhtBQ4GCeB+QZyWrm6+xa3hEb3CntEDxkoGCjwwceBdrEIRYAcwug/9tsoWMt
         g2BTwLMihLceZO02KSoU8unj9KMglLfpeLYmPts9d5XR8LiBvlsASpqWq8YIjvk2YpDr
         Nvucn+or0M1b0foX59ZxDohLtQ1m4QAJa6KYtzlvcQZ7d+Df0Ri2htiYOmVxcJQyeSNQ
         6BmvpUr2cMCYeFO9suxjTORjr/v8LMaV6+c+tt8nBk/a4XGeLK1vwxUzkbINT6oIVCFO
         HNEKa4NZYtKSBMChD43PACJZbyzVdNYNTLVr1LcQdqHM2+1yKCY8jATUJkeDqmL1hWMD
         iK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9Y2fmsp12Tf3NP9yxnPACBVe0lEx7m4Aj9FlcnxqqZc=;
        b=M5xxykv7is0Y1RQMo1a1/thkUD7S0rEYwZoqrOv6cCjgI1/e4vnazGFV2i1zDZTKx0
         64lTrCLtZCTh8vLK1mJr8QPY7H+mLdynWwPdhjbUG76NPUk/HYdv7J/HoCuWHhf2+fCH
         1ZvIhdLRoeZPFhNTc4yIXiyX2EMTyMuaAdwDDZF6TVevsDc5O93QYkb8Q2XpbU0WtnJ3
         G2ZzqU8asuOukyISqjJ00IuoNDbiGyVJPCSQk0RSRj2IT6um0r0D++h6+fj/gbvU4Dsl
         ESLljW9x2KiNrHAPq12ot4hPdU+SR55rP406NwcOvxqP0P5ZmbS1omCqq3nuxHNZa2La
         KQwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzheUzVf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si1126548ybi.363.2019.02.22.09.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 09:12:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzheUzVf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxENN-0007dA-A8
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 12:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKz-0006JT-DR
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 12:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKv-0001h5-Gp
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 12:10:11 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gxEKu-0000uI-TG
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 12:10:09 -0500
Received: by mail-wr1-x444.google.com with SMTP id w2so3134923wrt.11
	for <qemu-devel@nongnu.org>; Fri, 22 Feb 2019 09:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9Y2fmsp12Tf3NP9yxnPACBVe0lEx7m4Aj9FlcnxqqZc=;
	b=nzheUzVfNUNTDRN0YH+G8dhIGCNgoIKpfelurAPUhwjMNPZdEu5ZApQNQ31hOxBYEC
	V5NTpjgs06DR0gSZ9ddxsUVSClyl6SFg7JpP7P5y3QBjJKVVgjwdVsx5WilCcwixUej/
	5160cXhPCcz/crPGc0CHexaZE9w9oEKxF7CHiTq3z1Zpx6K9Kykp1yhLIRVQ31JPj2jv
	t2eTOcQrWm1bJIQbtFLcEHIsn6N4G8rtpro7WLBVHEvqXlAjUBW/v+lWHNvCIfUJnKXc
	K72nDZsbJxyy6ANVTauad3TzCNZZIABJySkRSwcLw0FzQmt6NVAoLN38/tgBrO5HP9Mc
	8RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9Y2fmsp12Tf3NP9yxnPACBVe0lEx7m4Aj9FlcnxqqZc=;
	b=ob5CHogUCg+khahe6+fXLVHleGJlutvLdyz5UyD5ijOpPNH3eiPbfn69p+Gn8vFenY
	2BKqqJFHhcTYmqk8yQqYgHE+gIJmk4UogwOi3yNSOUaOz5s/wO2AcLx8DaTHy3BX1DeG
	RdPDWZ0cx9uUjpyu3gdHc6TFZK3rnwvyfe3Pw4+ezybnLnOAwiOmTM6JeN1ZXJKkSOUN
	l67gpHBY5jJaeXJCn0g2KPM/r0Cvgt9DPlA/uNKJ+m0Pp4NNZIVYPaY7f0YWriPS0m78
	iBDWE78J6tZuEUYO6hpkn7V+6697K4M5YjhGKzxYdyLr7cfsaUlwGd76bPg1lDuxLT6x
	1D6w==
X-Gm-Message-State: AHQUAubfyhIRn4SkN+nYNCQeu1cRmlTmYsbPMx3LY6pLKaBka/kMAaFp
	8Bp0X4wmw5EWEIASAGZJHSbD0A==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr3946648wrp.54.1550855381548; 
	Fri, 22 Feb 2019 09:09:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id f6sm2829077wrt.87.2019.02.22.09.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:09:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Feb 2019 17:09:36 +0000
Message-Id: <20190222170936.13268-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222170936.13268-1-peter.maydell@linaro.org>
References: <20190222170936.13268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 2/2] target/arm: Gate "miscellaneous FP" insns
 by ID register field
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SUH6jyCb1LoN

There is a set of VFP instructions which we implement in
disas_vfp_v8_insn() and gate on the ARM_FEATURE_V8 bit.
These were all first introduced in v8 for A-profile, but in
M-profile they appeared in v7M. Gate them on the MVFR2
FPMisc field instead, and rename the function appropriately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 20 ++++++++++++++++++++
 target/arm/translate.c | 21 +++++++++++++--------
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 36ea3b58567..ff9ba387b42 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3328,6 +3328,26 @@ static inline bool isar_feature_aa32_fp16_dpconv(const ARMISARegisters *id)
     return FIELD_EX64(id->mvfr1, MVFR1, FPHP) > 1;
 }
 
+static inline bool isar_feature_aa32_vsel(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr2, MVFR2, FPMISC) >= 1;
+}
+
+static inline bool isar_feature_aa32_vcvt_dr(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr2, MVFR2, FPMISC) >= 2;
+}
+
+static inline bool isar_feature_aa32_vrint(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr2, MVFR2, FPMISC) >= 3;
+}
+
+static inline bool isar_feature_aa32_vminmaxnm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr2, MVFR2, FPMISC) >= 4;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b7702fb49f7..af8f9e669b8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3357,7 +3357,7 @@ static const uint8_t fp_decode_rm[] = {
     FPROUNDING_NEGINF,
 };
 
-static int disas_vfp_v8_insn(DisasContext *s, uint32_t insn)
+static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);
 
@@ -3375,15 +3375,18 @@ static int disas_vfp_v8_insn(DisasContext *s, uint32_t insn)
         rm = VFP_SREG_M(insn);
     }
 
-    if ((insn & 0x0f800e50) == 0x0e000a00) {
+    if ((insn & 0x0f800e50) == 0x0e000a00 && dc_isar_feature(aa32_vsel, s)) {
         return handle_vsel(insn, rd, rn, rm, dp);
-    } else if ((insn & 0x0fb00e10) == 0x0e800a00) {
+    } else if ((insn & 0x0fb00e10) == 0x0e800a00 &&
+               dc_isar_feature(aa32_vminmaxnm, s)) {
         return handle_vminmaxnm(insn, rd, rn, rm, dp);
-    } else if ((insn & 0x0fbc0ed0) == 0x0eb80a40) {
+    } else if ((insn & 0x0fbc0ed0) == 0x0eb80a40 &&
+               dc_isar_feature(aa32_vrint, s)) {
         /* VRINTA, VRINTN, VRINTP, VRINTM */
         int rounding = fp_decode_rm[extract32(insn, 16, 2)];
         return handle_vrint(insn, rd, rm, dp, rounding);
-    } else if ((insn & 0x0fbc0e50) == 0x0ebc0a40) {
+    } else if ((insn & 0x0fbc0e50) == 0x0ebc0a40 &&
+               dc_isar_feature(aa32_vcvt_dr, s)) {
         /* VCVTA, VCVTN, VCVTP, VCVTM */
         int rounding = fp_decode_rm[extract32(insn, 16, 2)];
         return handle_vcvt(insn, rd, rm, dp, rounding);
@@ -3427,10 +3430,12 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     }
 
     if (extract32(insn, 28, 4) == 0xf) {
-        /* Encodings with T=1 (Thumb) or unconditional (ARM):
-         * only used in v8 and above.
+        /*
+         * Encodings with T=1 (Thumb) or unconditional (ARM):
+         * only used for the "miscellaneous VFP features" added in v8A
+         * and v7M (and gated on the MVFR2.FPMisc field).
          */
-        return disas_vfp_v8_insn(s, insn);
+        return disas_vfp_misc_insn(s, insn);
     }
 
     dp = ((insn & 0xf00) == 0xb00);
-- 
2.20.1

