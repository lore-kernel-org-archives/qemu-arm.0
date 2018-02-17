Received: by 10.28.71.27 with SMTP id u27csp2089728wma;
        Sat, 17 Feb 2018 10:52:25 -0800 (PST)
X-Google-Smtp-Source: AH8x226UfvQ2x6r/f5gLc+pJoM23tzNmtHgBVYIY+q07i8zMLvmW/VJy522pz2XijuqDlwSwwr1j
X-Received: by 10.37.85.197 with SMTP id j188mr7381239ybb.215.1518893544935;
        Sat, 17 Feb 2018 10:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893544; cv=none;
        d=google.com; s=arc-20160816;
        b=np0vYQr4Bg0hJduUcOq6n7GewtvSAycNO8Tsg+i9QzFG0Q95jdbV98w/Ud2sTwDEUB
         0VbREuLhU224+cL+C2hbswC4ohiqB2IlFiHxtJtxE0/mGfUFFvvCqcVZEQY2NA3dpSpm
         qlkFeFQ9Wp0eTvY/+kutBvhUKpF6III2/eQUeQwoKGSz3mSC7Pn2+GGnYhIwpNmhYP9G
         fjfArkqjyGUbmkkzPtjm6VaLvL0c7Wp2dsIX/D8i3V6JreTGSJ9YF1/ZbzJs2zosokF6
         o0LxY4cqCOoS97j0UmN2U31SbIr5S7Jel2B+KukGbF6ilgcoyh5nqo8VLa6Rok2kGIZG
         R6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9GMGFACpQiacf69ZW381VkQYNsWKfIiV8Bn1CblnjWs=;
        b=biRgb+fSA1aSffGKO67YdbBNnQKVd8fjEaTJjYGWhKCmOScPOUckHglNKgbgVMgYso
         HYGBxNEsz/RcHRnAP6GoA4R+rfsBOGnzLElOwD7QtmqmEEvj+CPVaxeAhb4cc52WRcNZ
         TuRzfCJUBsB84QhMMYJKGkZFwwnwIyf/1FHbmGDGFEPygOCBw7yPjp/HfgFiE6BEUm7W
         C74ZjWcFmWiUolsaKjUNMEOIynTk/ERbGVi/Jel/ZdaQCZdP0uIZMLGd+VAq4H8+OOB1
         fkiITrNbNXMpbB/rKUZ9c5NbXrKxfTE8e7kj0HaiY6q9889TrVWNfSFheMstvuv5Unos
         wS0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHcQszaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g27si328726ybe.57.2018.02.17.10.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:52:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHcQszaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7ay-0007Bo-9t
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:52:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79t-00015H-7C
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79r-0001uY-GT
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:25 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:39594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79r-0001uC-A7
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:23 -0500
Received: by mail-pf0-x242.google.com with SMTP id c143so591866pfb.6
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9GMGFACpQiacf69ZW381VkQYNsWKfIiV8Bn1CblnjWs=;
	b=OHcQszaSDvmydmEZUcVx9HWAMwPJljsXAMcbnzRABqEvtzNnr9f+QXd0dK87lrRcXO
	6Dd+LNdDkjrLGzuCvLkuOpJlSPumIxC/jBRksdsXmIL7vfNiZ6zba9Yk4FdAInQAuumn
	NrQ5N6//rbvGBiTnPFDrK+fKWLVmivKqcDLfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9GMGFACpQiacf69ZW381VkQYNsWKfIiV8Bn1CblnjWs=;
	b=JimLZhHQwPlV10tPMgs9JkapYL15zWa9Rbh5XqVpCzxP0MpxTkzKbz1Bk6K+F+NxTA
	8YTaUJcv12GAPcnpF+TBkBcpcHQ4akl6Y67iNCj/gQ4ZyWDezyp4vkqeVchPTWleoWHI
	JFIfBuoOFpJQgdUoGGkl/NYr1/7LrBlZFkgJhJGeyULOc7XxyHgvzud72oBM9K486Mna
	mNYa57XI2n2ZazMGjkgyHfc0/VyHGNvg5KTaiEd641za8TXz4BvQWfkF+e1pauA6gHin
	Nczn5jxdHvGhK7KEjtrvw2OCGKb6+rRR/cLrVj/k3cH8Ytwu0FKdweGDVjXA82OgROmV
	HhlA==
X-Gm-Message-State: APf1xPDb5ec5OATQZxaL/lCWBiv6yyY4d60IhX50vgfGnhS8IsqVzzTJ
	8qmFRDi6O9zY0yGf76EGLJlmiQ==
X-Received: by 10.101.81.76 with SMTP id g12mr8489946pgq.24.1518891862350;
	Sat, 17 Feb 2018 10:24:22 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:51 -0800
Message-Id: <20180217182323.25885-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 35/67] target/arm: Implement SVE Select
 Vectors Group
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
X-TUID: UQb+ZwO793Ko

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  9 ++++++++
 target/arm/sve_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 target/arm/sve.decode      |  6 +++++
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c3f8a2b502..0f57f64895 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -195,6 +195,15 @@ DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f524a1ddce..86cd792cdf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2125,3 +2125,58 @@ void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
     }
     swap_memmove(vd + len, vm, opr_sz * 8 - len);
 }
+
+void HELPER(sve_sel_zpzz_b)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_b(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_h)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_h(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_s)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_s(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        d[i] = (pg[H1(i)] & 1 ? nn : mm);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 559fb41fd6..021b33ced9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -361,6 +361,8 @@ static void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
     do_zpzz_ool(s, a, fns[a->esz]);
 }
 
+DO_ZPZZ(SEL, sel)
+
 #undef DO_ZPZZ
 
 /*
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 70feb448e6..7ec84fdd80 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -99,6 +99,7 @@
 		&rprr_esz rn=%reg_movprfx
 @rdm_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
 		&rprr_esz rm=%reg_movprfx
+@rd_pg4_rn_rm	........ esz:2 . rm:5  .. pg:4  rn:5 rd:5	&rprr_esz
 
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm	........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
@@ -467,6 +468,11 @@ RBIT		00000101 .. 1001 11 100 ... ..... .....		@rd_pg_rn
 # SVE vector splice (predicated)
 SPLICE		00000101 .. 101 100 100 ... ..... .....		@rdn_pg_rm
 
+### SVE Select Vectors Group
+
+# SVE select vector elements (predicated)
+SEL_zpzz	00000101 .. 1 ..... 11 .... ..... .....		@rd_pg4_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

