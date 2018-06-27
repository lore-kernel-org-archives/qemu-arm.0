Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5781399wrq;
        Tue, 26 Jun 2018 21:52:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeAk2S6woppr9ZFIrV+fIrrexdoNfYDIiry9w157OiGC0ZWKEUqpfhORqsds+Vcq71z1EaR
X-Received: by 2002:a0c:88ad:: with SMTP id 42-v6mr4059667qvn.61.1530075167429;
        Tue, 26 Jun 2018 21:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075167; cv=none;
        d=google.com; s=arc-20160816;
        b=A7HuA3BHsRxVU5G1EyOT9vuNMaWaB6Hw7f7JdeEzCDtu0YF11fuFp8+AENgWynqtx6
         uWcBLHAVrNVz2iQlK/SlNVosUB5cnx+Bv0jQFO6U8e9qLs3YBxvnYrcWoxpw2JMy+TOc
         91jkA5XSXXddQdyHRkRC0FC4pHKQtR28BslNY2iy3cyW82phn+PIlY3kb80I4KK5TSOD
         qp2qC7ry7tzQ1yuWJNQI6i/5G5veh793F5EKgqQZwZ2cqkiD1Zx7LR4p9DE/K+bgAykX
         kngh5CWh5XlTUCmeIUueBl43moCKA+WCUNJlULC++Vpf4ayBqcHQT82buADRfS+KnRxa
         Mt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=A9fH4Y/CsOq2xS27tz8HpWWa5Nt50JQqxNt4bJzisd0=;
        b=zZrxZ08BpBmGQwe7+21So1k1CCCSHcvMEGn8j1azPX4KNgbai9JAbZDGICPFWkYi7g
         He0mnTkCLpWRCaoWW89yC3kNL4hYEJZYjJoJfrsarVCd0IpHkvhROf1Fn4AZgkMtGIoG
         m14GCqXAg11dfjj/3t0kVGab5f7J5BCBjpJlqDzPq2r5SYMbmaETh1yPWsTnA9oSAoVT
         TkL3JlEzOb3JSxto7ntUzrHECtiTOZbypwf03k3oBPsm8hc1jf9BykpViNiXF7rGXeA1
         5IYQxRAg7GWl2rCfU5mSf4qEtG3RAGtRCu8I4faTmqlcQ1n7I9a9NO7CfqWmB4maIiXl
         ubuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dT7Ss+eC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si3022727qki.21.2018.06.26.21.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dT7Ss+eC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Ri-0002Xn-SF
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29a-0004S5-98
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29Y-0000kO-UU
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:02 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:37196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29Y-0000jn-KX
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:00 -0400
Received: by mail-pg0-x232.google.com with SMTP id o11-v6so364985pgv.4
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A9fH4Y/CsOq2xS27tz8HpWWa5Nt50JQqxNt4bJzisd0=;
	b=dT7Ss+eCFWTfxQ0PXtUUeme7cGsCttKYzHg2qYGTDQIvwhDWMn6v6sqUzrZ8sqUHE1
	pOHlhDSl9RZVboz3EOBVNkNGaGvukBLrjH0ncS2YziYa3EzadFeLKSvURpmSXbjPASbn
	s2DipVRf5pLXBxOcvLa3MEbpdrk4ZXHjDFRqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A9fH4Y/CsOq2xS27tz8HpWWa5Nt50JQqxNt4bJzisd0=;
	b=ZgL30GHn51lO9fdMLB8O4gPIiVAU3lV7vyXzGwUVEI+5ctpUvv/ehDUTmDM7dUh91U
	LYEAgFR4DOJmGEzYK6YaQ9Obd40EU7lKEfCVDood1uxBtFzFZp7kwH07dB6mWCqcQvkC
	UHkysZ19hKElrmh549BLaTWazwh7/Ja64gJnZ9ZjwlabHbuVALSfXulurbe5wJHwSB/n
	MZGcXO5LOPc/DFCoPo09au08Ou4Lv6CdtrslStCDlESFky6+oHnjP1sJmISFxJxK4uK+
	61EalB5UEUQCXWeIlj6MNVHgqsi3HOxDxemW5UfLQInE253mTvPUfMqiedfy8dOD5yAy
	WibQ==
X-Gm-Message-State: APt69E0T4Gv3iKV2iAiChVENMG2kAH6mThDzzHswxyi5bcjbr2bI7STT
	g3Iuy0ES9WXrMsh9Hr67otuGlUhJ+gk=
X-Received: by 2002:a65:61d1:: with SMTP id
	j17-v6mr3820198pgv.447.1530074039342; 
	Tue, 26 Jun 2018 21:33:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:13 -0700
Message-Id: <20180627043328.11531-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: [Qemu-devel] [PATCH v6 20/35] target/arm: Implement SVE Floating
 Point Unary Operations - Unpredicated Group
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
X-TUID: T7C01akWdsD4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  8 +++++++
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 20 ++++++++++++++++
 target/arm/sve.decode      |  5 ++++
 4 files changed, 80 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 56439ac1e4..ad9cb6c7d5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -601,6 +601,14 @@ DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_frecpe_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frecpe_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_frsqrte_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frsqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frsqrte_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3b009193a9..1dcc2d38c9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3507,6 +3507,53 @@ DO_VPZ(FMAXNMV, fmaxnmv)
 DO_VPZ(FMINV, fminv)
 DO_VPZ(FMAXV, fmaxv)
 
+/*
+ *** SVE Floating Point Unary Operations - Unpredicated Group
+ */
+
+static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       status, vsz, vsz, 0, fn);
+    tcg_temp_free_ptr(status);
+}
+
+static bool trans_FRECPE(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2_ptr * const fns[3] = {
+        gen_helper_gvec_frecpe_h,
+        gen_helper_gvec_frecpe_s,
+        gen_helper_gvec_frecpe_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        do_zz_fp(s, a, fns[a->esz - 1]);
+    }
+    return true;
+}
+
+static bool trans_FRSQRTE(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2_ptr * const fns[3] = {
+        gen_helper_gvec_frsqrte_h,
+        gen_helper_gvec_frsqrte_s,
+        gen_helper_gvec_frsqrte_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        do_zz_fp(s, a, fns[a->esz - 1]);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 97af75a61b..073e5c58e7 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -427,6 +427,26 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+#define DO_2OP(NAME, FUNC, TYPE) \
+void HELPER(NAME)(void *vd, void *vn, void *stat, uint32_t desc)  \
+{                                                                 \
+    intptr_t i, oprsz = simd_oprsz(desc);                         \
+    TYPE *d = vd, *n = vn;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                  \
+        d[i] = FUNC(n[i], stat);                                  \
+    }                                                             \
+}
+
+DO_2OP(gvec_frecpe_h, helper_recpe_f16, float16)
+DO_2OP(gvec_frecpe_s, helper_recpe_f32, float32)
+DO_2OP(gvec_frecpe_d, helper_recpe_f64, float64)
+
+DO_2OP(gvec_frsqrte_h, helper_rsqrte_f16, float16)
+DO_2OP(gvec_frsqrte_s, helper_rsqrte_f32, float32)
+DO_2OP(gvec_frsqrte_d, helper_rsqrte_f64, float64)
+
+#undef DO_2OP
+
 /* Floating-point trigonometric starting value.
  * See the ARM ARM pseudocode function FPTrigSMul.
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 66b0fd0cc4..ca93bdb2b3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -743,6 +743,11 @@ FMINNMV         01100101 .. 000 101 001 ... ..... .....         @rd_pg_rn
 FMAXV           01100101 .. 000 110 001 ... ..... .....         @rd_pg_rn
 FMINV           01100101 .. 000 111 001 ... ..... .....         @rd_pg_rn
 
+## SVE Floating Point Unary Operations - Unpredicated Group
+
+FRECPE          01100101 .. 001 110 001100 ..... .....          @rd_rn
+FRSQRTE         01100101 .. 001 111 001100 ..... .....          @rd_rn
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.17.1

