Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5780698wrq;
        Tue, 26 Jun 2018 21:51:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdhw1nTcmZeQ/yyglCJYjkDXzFWkOPwRyciceoYwQ3CYbhkvvwE9DEAMtatWgFp3WxcU96n
X-Received: by 2002:ac8:317b:: with SMTP id h56-v6mr4180286qtb.191.1530075098614;
        Tue, 26 Jun 2018 21:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075098; cv=none;
        d=google.com; s=arc-20160816;
        b=p9vN///iNlcXRydVGaTyP9WZoUTptzS1OPSsjBzQ8Zk/LGeJ2qhX7P3Y2EpqrAfgeg
         BG9fetNaKxpasogw2jht/Vvn/ALn2A+nwCKJaSa0nTPxpWTqay2/Q7dEAtvknBZkyzqt
         XF0OVfg9epmxLUmfTqLiBvwnfszwvhZcmPoJPG/fIa/ViUNkQ+sIsb5oBoATyKf59bbe
         YYv6eF39XqnH8+1K4wYkwqWlx6AwJuliB6MtQ8C5uE3Id5NwUzWALAzyCT6ZKK/tjmez
         /n44tLdoApnUXsQjjXmmgXgmxdm2RJiUd7PpkdDtMD1iRWkkvGcoiXlQGlFRROfPDTah
         nKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ARHrlhgg1qoi/kKQH76w+UP/4e6kfGk5NvSiCi8sUrE=;
        b=Q2rh194B26Dp31KfsaW3YAswkvqXwwUEggT5/c/xlgxNcD5F5/+pAjA4CGwY/B3RPU
         mjdzinzHcuC+RREvk4xc2rL2EwvkIMLvVpBtUTC4oNUooBkRERX0nY0qIFMKXx5NhTY3
         ZI06TXBNUkxxpeeX4lXjD1StUzuB8rvZNa4Gq+j3W2Pe2RugUsslueq2ZArQjxv2Wm8O
         8aypTa0zCmRB2vQURB3b2NMGYzytLutRe23Ujb8MKbRmJwGrWZxusT4l4ZJXP1VnynwQ
         JFQsjCSDZZIV+Fvd+0ebE+szPffL1C0/zeI5CdM48kKCmToEUAZDeXNRFrKbXEIi3wic
         YCbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jtn+ygzI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q71-v6si3018769qka.348.2018.06.26.21.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jtn+ygzI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Qb-0001lt-UP
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:51:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29e-0004X0-Co
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29d-0000qg-1P
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:06 -0400
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:40028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29c-0000ph-Pm
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:04 -0400
Received: by mail-pf0-x230.google.com with SMTP id z24-v6so385776pfe.7
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ARHrlhgg1qoi/kKQH76w+UP/4e6kfGk5NvSiCi8sUrE=;
	b=Jtn+ygzIuXNiS/zIzmIn2rYUzjEF8F8Ym7d0YrquinSL7nWmuRADgOJGW+twiLp2x2
	9H87RD0jAVOoR9ewWeCKJY1T24y3wb3IQC9YJNE+yUQRBn/QBgm7xtdJPfCZV6MXm3M5
	fXStuFY8vOJOtt8HLtpaYE95eSwJd3tDESyFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ARHrlhgg1qoi/kKQH76w+UP/4e6kfGk5NvSiCi8sUrE=;
	b=gUq2ZE2+sp0l60ADRhRnLUbcazch7d4y41jN0ujF8VJSO7nQGGIW8T1/7lC0F7TICl
	7DbDXi5G3Zo6a3w/4u5CsEBE81r8JO/yRD04dDC85BW3ajakqpX1JdLJoosGP57FZUYA
	dGyh8AvJlUm7jFd5rnFtS0pd14vI+De/jbkJw4rw2hm9T6tIPtkvrWTVLMgwcMeQZcFD
	uP/1ViuPqbSULJD6JEqc7lWorVCfR4Tszr/xw6/jK8fEJLtRAKcJzyVBm+yu/HfnMWFk
	nhRZLiZJWU1x1uX/vVoHfZl+l5k6f/72AuNlVfX/zcFsk2zgL1oC3KHYOoOHoYsefTxt
	RPWg==
X-Gm-Message-State: APt69E3fNSPZ3xxOBMsDXCFxgGczbLy0gfS+u5vVyb+skGyIyK0DJ0Io
	bzt5S7BouCBGfH+jyDDpIXz2TyBJBdA=
X-Received: by 2002:a62:4ad3:: with SMTP id
	c80-v6mr4267754pfj.23.1530074043517; 
	Tue, 26 Jun 2018 21:34:03 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:16 -0700
Message-Id: <20180627043328.11531-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: [Qemu-devel] [PATCH v6 23/35] target/arm: Implement SVE
 floating-point convert precision
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2nv25V3PGqNf

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Squish fz16 a-la vfp_fcvt_f16_to_f32
---
 target/arm/helper-sve.h    | 13 +++++++++
 target/arm/sve_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 30 +++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++++
 4 files changed, 106 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index aca137fc37..4c379dbb05 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -942,6 +942,19 @@ DEF_HELPER_FLAGS_6(sve_fmins_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmins_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i64, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fcvt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_dh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 79358c804b..4b36c1eecf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3147,6 +3147,61 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc) \
     } while (i != 0);                                                 \
 }
 
+/* SVE fp16 conversions always use IEEE mode.  Like AdvSIMD, they ignore
+ * FZ16.  When converting from fp16, this affects flushing input denormals;
+ * when converting to fp16, this affects flushing output denormals.
+ */
+static inline float32 sve_f16_to_f32(float16 f, float_status *fpst)
+{
+    flag save = get_flush_inputs_to_zero(fpst);
+    float32 ret;
+
+    set_flush_inputs_to_zero(false, fpst);
+    ret = float16_to_float32(f, true, fpst);
+    set_flush_inputs_to_zero(save, fpst);
+    return ret;
+}
+
+static inline float64 sve_f16_to_f64(float16 f, float_status *fpst)
+{
+    flag save = get_flush_inputs_to_zero(fpst);
+    float64 ret;
+
+    set_flush_inputs_to_zero(false, fpst);
+    ret = float16_to_float64(f, true, fpst);
+    set_flush_inputs_to_zero(save, fpst);
+    return ret;
+}
+
+static inline float16 sve_f32_to_f16(float32 f, float_status *fpst)
+{
+    flag save = get_flush_to_zero(fpst);
+    float16 ret;
+
+    set_flush_to_zero(false, fpst);
+    ret = float32_to_float16(f, true, fpst);
+    set_flush_to_zero(save, fpst);
+    return ret;
+}
+
+static inline float16 sve_f64_to_f16(float64 f, float_status *fpst)
+{
+    flag save = get_flush_to_zero(fpst);
+    float16 ret;
+
+    set_flush_to_zero(false, fpst);
+    ret = float64_to_float16(f, true, fpst);
+    set_flush_to_zero(save, fpst);
+    return ret;
+}
+
+DO_ZPZ_FP(sve_fcvt_sh, uint32_t, H1_4, sve_f32_to_f16)
+DO_ZPZ_FP(sve_fcvt_hs, uint32_t, H1_4, sve_f16_to_f32)
+DO_ZPZ_FP(sve_fcvt_dh, uint64_t,     , sve_f64_to_f16)
+DO_ZPZ_FP(sve_fcvt_hd, uint64_t,     , sve_f16_to_f64)
+DO_ZPZ_FP(sve_fcvt_ds, uint64_t,     , float64_to_float32)
+DO_ZPZ_FP(sve_fcvt_sd, uint64_t,     , float32_to_float64)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a86ebc0a91..37ad1c9459 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3940,6 +3940,36 @@ static bool do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
     return true;
 }
 
+static bool trans_FCVT_sh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvt_sh);
+}
+
+static bool trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hs);
+}
+
+static bool trans_FCVT_dh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvt_dh);
+}
+
+static bool trans_FCVT_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hd);
+}
+
+static bool trans_FCVT_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
+}
+
 static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fdcc252eaa..18c174e92d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -821,6 +821,14 @@ FNMLS_zpzzz     01100101 .. 1 ..... 111 ... ..... .....         @rdn_pg_rm_ra
 
 ### SVE FP Unary Operations Predicated Group
 
+# SVE floating-point convert precision
+FCVT_sh         01100101 10 0010 00 101 ... ..... .....         @rd_pg_rn_e0
+FCVT_hs         01100101 10 0010 01 101 ... ..... .....         @rd_pg_rn_e0
+FCVT_dh         01100101 11 0010 00 101 ... ..... .....         @rd_pg_rn_e0
+FCVT_hd         01100101 11 0010 01 101 ... ..... .....         @rd_pg_rn_e0
+FCVT_ds         01100101 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
+FCVT_sd         01100101 11 0010 11 101 ... ..... .....         @rd_pg_rn_e0
+
 # SVE integer convert to floating-point
 SCVTF_hh        01100101 01 010 01 0 101 ... ..... .....        @rd_pg_rn_e0
 SCVTF_sh        01100101 01 010 10 0 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.17.1

