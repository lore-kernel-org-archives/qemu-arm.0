Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5782427wrq;
        Tue, 26 Jun 2018 21:54:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpePgzV4BB5/4rla7wK9/PJa89mujCbxtddvkXkht7J4v9Phq+08oGLc/27jz0RZSHem4O2v
X-Received: by 2002:a0c:a185:: with SMTP id e5-v6mr4057216qva.73.1530075265015;
        Tue, 26 Jun 2018 21:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075265; cv=none;
        d=google.com; s=arc-20160816;
        b=IUOxn+YAEXlk4DHchnC8Ll6XdrjC1OKSQb9PYlGbrORxYkN9/ASCxT/b1ApBPp5Dvn
         lPqw1U0VU3yeyeo9eso05U8UvWhDrWegNV9KL2huzXP38BGV3SOnKxsOpQXPT2xbAvtb
         38H1YwU3bN2YLDfbvRraDMrVo+rX0hTf9bquNdFHezahSXv4/YHspIgb7/g+FJMIQbv+
         KmlnszMOnjTETSHVxvFOtryQ0Mh6Cvfk9JYF8SOVLCs9H8FMDwLFmRuvjY5NaSbhie2s
         XSysTOUDgIQktI2ZiuaTazIfdMPgO+MJRU/y0QmBXB60wmrJQjEYqIluUZ2bdiaMim5y
         Ndbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aQtfq69suyZFnSQntfxBl6/IxAKwudRlVXWZxIK1/oo=;
        b=BeYP3AEEJXHSUIi+YIf1uyB8SUKOuYE0s4RE0jAtD7uoe4PLFTG2RAqa59iZ6Hxvyo
         2R04YtLAG5rYUNUOxEJpqTIdTnB7Vvgbk5+QrXPjaxaoUpBwaU11mpUnffB98f7LbPzf
         n1n/8Y+O2iQmJm0Rxv594uy1C9aNQ1uWw2u1aLWOWZa0nkkM1tEfyOXjftJSr5HxfJQk
         xcyPrZhrBNCxaaJVxbXotdzgHcfurfVm2Wy53ba9WEod0jWg6ByKUjwVTVXedFi+86oV
         MX9caSwLbAeC51TlxFFzM3z6kPwzxv05dVMcFC4GG68FvH7XfGhM3xS9PoB+3DTJ1UpT
         wWqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sl35h3Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13-v6si3053911qtl.354.2018.06.26.21.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sl35h3Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2TI-00043j-Dp
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29i-0004Xb-1v
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29g-0000vS-TM
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:33807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29g-0000uV-Mi
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:08 -0400
Received: by mail-pf0-x236.google.com with SMTP id g3-v6so391883pfi.1
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aQtfq69suyZFnSQntfxBl6/IxAKwudRlVXWZxIK1/oo=;
	b=Sl35h3RwZXpLhYT1l20GWAfBzUBVT78xnEEjlQ7iDgAUUoC1KA/1saARwmaIoSakAE
	ZJ9j1rnaKvYHNMwgkA7ulADf/a+y+o4p4AIuqiZnZU93JPIKkuh3PmLbpR4Ds7a1qdrz
	hUAAtU6Sc6gyXwQT5CEOstcL1xhMsvdT8wfpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aQtfq69suyZFnSQntfxBl6/IxAKwudRlVXWZxIK1/oo=;
	b=Y8QouKRqdFgeUgTYeVIu8015sfwflDnxrlYZusGT8ADUH8hpmnR1P/0brVIsflCMJn
	NVMrnr8X5h0/iYk+mpvIOfjYUCuvOA7Jh4G3m5k46TKNTKgJijvZxiDR2DfKIXxl+C+4
	bGCCVh9/ByYnsmrqSWurnMlSKrPr/FrayeGenRAKzOFvzA0odQeyb9w5Qd8Zf9K5j/qx
	Lxi/Ffx/Me0PDBEqb06jLLRDEJ+nPRpIPaTTuWrKhdrq82g0CwcFeL4W8KlD5Q1rRZgl
	Q5S4RWlKUQ9905lUbUnZovTgPrHHmdEUKqwEaSKrmAvNfw2zO/SzadbUF6aM+hySRu/r
	O/Pw==
X-Gm-Message-State: APt69E3BoQECViymxWogJewXCkxYPhQIHtOJsVLkfR6uH9FGptWdX6dn
	z+GYx98JH7Ik4q6BbcdIdVTNCJqvSe8=
X-Received: by 2002:a65:6491:: with SMTP id
	e17-v6mr3776006pgv.44.1530074047823; 
	Tue, 26 Jun 2018 21:34:07 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:19 -0700
Message-Id: <20180627043328.11531-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: [Qemu-arm] [PATCH v6 26/35] target/arm: Implement SVE
 floating-point unary operations
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 83gd8H8Fxiw/

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++++
 target/arm/sve_helper.c    |  8 ++++++++
 target/arm/translate-sve.c | 26 ++++++++++++++++++++++++++
 target/arm/sve.decode      |  4 ++++
 4 files changed, 52 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 36168c5bb2..891346a5ac 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -999,6 +999,20 @@ DEF_HELPER_FLAGS_5(sve_frintx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_frintx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_frecpx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frecpx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frecpx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fsqrt_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fsqrt_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fsqrt_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index af8221c714..83bd8c4269 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3298,6 +3298,14 @@ DO_ZPZ_FP(sve_frintx_h, uint16_t, H1_2, float16_round_to_int)
 DO_ZPZ_FP(sve_frintx_s, uint32_t, H1_4, float32_round_to_int)
 DO_ZPZ_FP(sve_frintx_d, uint64_t,     , float64_round_to_int)
 
+DO_ZPZ_FP(sve_frecpx_h, uint16_t, H1_2, helper_frecpx_f16)
+DO_ZPZ_FP(sve_frecpx_s, uint32_t, H1_4, helper_frecpx_f32)
+DO_ZPZ_FP(sve_frecpx_d, uint64_t,     , helper_frecpx_f64)
+
+DO_ZPZ_FP(sve_fsqrt_h, uint16_t, H1_2, float16_sqrt)
+DO_ZPZ_FP(sve_fsqrt_s, uint32_t, H1_4, float32_sqrt)
+DO_ZPZ_FP(sve_fsqrt_d, uint64_t,     , float64_sqrt)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 270bf9101b..ff8ae67e2b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4117,6 +4117,32 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return do_frint_mode(s, a, float_round_ties_away);
 }
 
+static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_frecpx_h,
+        gen_helper_sve_frecpx_s,
+        gen_helper_sve_frecpx_d
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
+}
+
+static bool trans_FSQRT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_fsqrt_h,
+        gen_helper_sve_fsqrt_s,
+        gen_helper_sve_fsqrt_d
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
+}
+
 static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e45faaec3a..2aca9f0bb0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -854,6 +854,10 @@ FRINTA          01100101 .. 000 100 101 ... ..... .....         @rd_pg_rn
 FRINTX          01100101 .. 000 110 101 ... ..... .....         @rd_pg_rn
 FRINTI          01100101 .. 000 111 101 ... ..... .....         @rd_pg_rn
 
+# SVE floating-point unary operations
+FRECPX          01100101 .. 001 100 101 ... ..... .....         @rd_pg_rn
+FSQRT           01100101 .. 001 101 101 ... ..... .....         @rd_pg_rn
+
 # SVE integer convert to floating-point
 SCVTF_hh        01100101 01 010 01 0 101 ... ..... .....        @rd_pg_rn_e0
 SCVTF_sh        01100101 01 010 10 0 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.17.1

