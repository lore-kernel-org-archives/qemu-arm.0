Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp795763wrg;
        Fri, 14 Jun 2019 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/Seyg843gHq/5e70hesi19pCr0XA/+cDfhfX83/J3yJ51NZpc/LfclDCi6NxcyrEIuLGo
X-Received: by 2002:a05:620a:119c:: with SMTP id b28mr24242802qkk.104.1560509230210;
        Fri, 14 Jun 2019 03:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560509230; cv=none;
        d=google.com; s=arc-20160816;
        b=TkBobDkIr7VLT+dsppiSm5HNT/sBC5/evJD/F9W6Dc2o0XzFTW/JXR5lcqIK5tnsIv
         YRYXTWRQCePUPOhVPkEiGQf12oLx2ADZkCNN4xn79q/IJVLJEg7Gpw7EmVA8djHznNU0
         YHwLcewLDTV/rQwlCzkTxY3ibOM9VlB2rIjnah2FZcoD42bBpJx0ckJkyD8mZ/6a5U0I
         qnLhChrqefiO7vBSV6FaZ0DZIvj+AWpvSrFA1xFswrEU06pnzkh3BC/2oyre95Qbg2HD
         bIBjVOq/u5e7lApk6P+AfEnzzxfmYaNPtwalgI2PLp5UyEjjoPf6XtZ7TSPXLR5SHB51
         Zw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LB0bsaVvZA3zcHPIjDXxrbeOwWsnpZuqgC546jWarVg=;
        b=t1HrDHOsC0cawI+fhVWJGr1vuKPcfmUq8/VtTh5ovOlL3o3nBL0dREGDDhtue7awq8
         VlmfQKPuj8It+O6wgPVX9ejC4sX7PuRUBZqck+oNxLDct0jnFIVi88VkKGianlI+94J9
         OhjFn8K21XCgIJl+PEneaIK5fkkwotygIJWZtQ9JtF7ZZTatZX7JgIaj4Vkh8Wa0RtiY
         N4w6q2Ss/4uVxNWtdh6hkuhferbu0WpyQsl7B1JoFFxtRhMtY7QZ8KDRz6JzvsPitPBl
         43JJMlCwAZ5S9XpFlJmi6W6zSIZtF/fjzI4i665yQsEf7QiH+VrRCTXqzSV2Pju2h9Gc
         NBDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwuECIDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h57si1370728qvd.131.2019.06.14.03.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 03:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwuECIDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbjjh-00080J-Km
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 06:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbjhg-0007x6-9F
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbjhd-00076B-VY
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:04 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39562)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbjhd-00075P-PB
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so2005099wrt.6
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LB0bsaVvZA3zcHPIjDXxrbeOwWsnpZuqgC546jWarVg=;
 b=YwuECIDa7tIxSn4IleGBjVqDNCpwhKkSmQfRQZe3z6Ena/KgZTI/E00OBVPv5v9M+Z
 +LCwlQqGngExMbgO0YHSeyDtjaR0slsoJ7f0KNru9pnwvcQ58Md/xuYRgUy5WU2gCo8k
 /Tz+/hTzZzbrViPOD2QYaYmtOSdvqyfQIJRNDazSJffSlh76/SAsi5yJbYJseXL9zJtQ
 2fSAhZtso90rqbyCIgTqXe8vsqxOHkZtAiwpLjbWKGTJPk5vuM7EhtYQL7qTYe6f6q0y
 jtZ4V8ddOz1w1c7inxYfevB8CyXjoUt9FzDDeJmVKDrPD+Syh0pZIfpDh6xS7YFQdlgX
 VzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LB0bsaVvZA3zcHPIjDXxrbeOwWsnpZuqgC546jWarVg=;
 b=FZewZPyU1bardumRQ1rhhmhvrAAitAiWXQkukkXqYBE5mOW0C7A1M/zT/1Gf6XHWsJ
 9PNBxOs3CJvGPkbI3PDrqQlJRLM+6lDs9ghSftIwKbl4or3s1SVsAxGjqNtBcJ8Q3pnU
 uE1KD/MlQzRLhpIuPCbIUhNt+8iIvz2mtNvS5bOnGfsVpnNlhtpEQ7xM+hTlKuaj3wMD
 huQ8pdjjWja/l1v5G7z5nvK2C6fvGvaDP/G3786ieBCC7HN+rZx2Fl/APxSqnHYtgYnH
 FFGWrcX+GvGgoy/y/fpUDFJJuqTVjVy6cfUhK69m0ico2BS151VqHYN9wrdDXH5cn8tX
 rqOQ==
X-Gm-Message-State: APjAAAVlyUeMZ5COU6X6gIG1uDGHJSN2HTtdTCkOFt2gNDYtHtL/xqVp
 JUWxfDk0vdU4baygWjxnu69dA6mG6EXeiQ==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr1388772wrm.191.1560509100350; 
 Fri, 14 Jun 2019 03:45:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y24sm2091238wmi.10.2019.06.14.03.44.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 03:44:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 11:44:56 +0100
Message-Id: <20190614104457.24703-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614104457.24703-1-peter.maydell@linaro.org>
References: <20190614104457.24703-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Fix typos in trans function
 prototypes
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
X-TUID: sKvbhV2B8jbS

In several places cut and paste errors meant we were using the wrong
type for the 'arg' struct in trans_ functions called by the
decodetree decoder, because we were using the _sp version of the
struct in the _dp function.  These were harmless, because the two
structs were identical and so decodetree made them typedefs of the
same underlying structure (and we'd have had a compile error if they
were not harmless), but we should clean them up anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 709fc65374d..85187bcc9dc 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -835,7 +835,7 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
     return true;
 }
 
-static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_sp *a)
+static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
 {
     TCGv_i32 tmp;
 
@@ -910,7 +910,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     return true;
 }
 
-static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
+static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
 {
     uint32_t offset;
     TCGv_i32 addr;
@@ -1500,7 +1500,7 @@ static void gen_VMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     tcg_temp_free_i64(tmp);
 }
 
-static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_sp *a)
+static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_dp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLA_dp, a->vd, a->vn, a->vm, true);
 }
@@ -1538,7 +1538,7 @@ static void gen_VMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     tcg_temp_free_i64(tmp);
 }
 
-static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_sp *a)
+static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_dp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
 }
@@ -1580,7 +1580,7 @@ static void gen_VNMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     tcg_temp_free_i64(tmp);
 }
 
-static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_sp *a)
+static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_dp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMLS_dp, a->vd, a->vn, a->vm, true);
 }
@@ -1614,7 +1614,7 @@ static void gen_VNMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     tcg_temp_free_i64(tmp);
 }
 
-static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_sp *a)
+static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_dp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMLA_dp, a->vd, a->vn, a->vm, true);
 }
@@ -1624,7 +1624,7 @@ static bool trans_VMUL_sp(DisasContext *s, arg_VMUL_sp *a)
     return do_vfp_3op_sp(s, gen_helper_vfp_muls, a->vd, a->vn, a->vm, false);
 }
 
-static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
+static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_dp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
@@ -1648,7 +1648,7 @@ static void gen_VNMUL_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     gen_helper_vfp_negd(vd, vd);
 }
 
-static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
+static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_dp *a)
 {
     return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
 }
@@ -1658,7 +1658,7 @@ static bool trans_VADD_sp(DisasContext *s, arg_VADD_sp *a)
     return do_vfp_3op_sp(s, gen_helper_vfp_adds, a->vd, a->vn, a->vm, false);
 }
 
-static bool trans_VADD_dp(DisasContext *s, arg_VADD_sp *a)
+static bool trans_VADD_dp(DisasContext *s, arg_VADD_dp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_addd, a->vd, a->vn, a->vm, false);
 }
@@ -1668,7 +1668,7 @@ static bool trans_VSUB_sp(DisasContext *s, arg_VSUB_sp *a)
     return do_vfp_3op_sp(s, gen_helper_vfp_subs, a->vd, a->vn, a->vm, false);
 }
 
-static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_sp *a)
+static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_dp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
 }
@@ -1678,7 +1678,7 @@ static bool trans_VDIV_sp(DisasContext *s, arg_VDIV_sp *a)
     return do_vfp_3op_sp(s, gen_helper_vfp_divs, a->vd, a->vn, a->vm, false);
 }
 
-static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_sp *a)
+static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_dp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
 }
@@ -1741,7 +1741,7 @@ static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
     return true;
 }
 
-static bool trans_VFM_dp(DisasContext *s, arg_VFM_sp *a)
+static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
 {
     /*
      * VFNMA : fd = muladd(-fd,  fn, fm)
@@ -2201,7 +2201,7 @@ static bool trans_VRINTR_sp(DisasContext *s, arg_VRINTR_sp *a)
     return true;
 }
 
-static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_sp *a)
+static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_dp *a)
 {
     TCGv_ptr fpst;
     TCGv_i64 tmp;
@@ -2257,7 +2257,7 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     return true;
 }
 
-static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_sp *a)
+static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
 {
     TCGv_ptr fpst;
     TCGv_i64 tmp;
-- 
2.20.1

