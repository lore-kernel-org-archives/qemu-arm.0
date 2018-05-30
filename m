Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5032550wre;
        Wed, 30 May 2018 11:15:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKF1aSoxGgxfkr5134IsrcwuWxgXVw0Z0UD9GyiQGot52+1icK5YzbnS/Cn7zfn0LyIc/Zb
X-Received: by 2002:a0c:c602:: with SMTP id v2-v6mr3609462qvi.11.1527704136795;
        Wed, 30 May 2018 11:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527704136; cv=none;
        d=google.com; s=arc-20160816;
        b=Sa0fpugLPqGB7/MThMKp1S2JwsuLTlkA1bwzhRI80GpLtG3SmTC1HK02IisbB4QCbf
         RkI4+L89VFV2mYLcvWFdaK5xtdm6oA4UI9QemjzJv4Rk3x1wSFiLvdEfs+YNlF9p8uBe
         n47zIxjzkwq1lE0+tW76Ak7sHcBND4i9af/C1VEopN33NBeDxTJvcfoeTT0rNY40CeZX
         5GYipF1DBGsfIO+rx+C5cjmxoBhZ7SHvly7LKdbwALSKppDrZYtTsN2AFF1MjJpOmPi9
         evwKs+QJCZPj9HUGiMJXNVhKFPmVf3DaPz7m6Wf+Drc5ZabN3Nvg7VAsXHsybjRstF4U
         2REQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KjHaYoglkEEDpj+nxjmOWg1p1VMDQ/DgG8iObr4ysR8=;
        b=PXvN+GT4aJ69DrvloJ4q2UFLmRz008gZk9g9kYjT9FRWCsqZsHv6iSyTS2/LAjsxq/
         N7lWn0HCCcxuQlY6N0qfx+hagOoO/WO3VumAO/rnbn6tNc/76aCZiDo9E6Z57FkE5u5h
         b3tF67eXNPV1510JRMwbwbjIIQuNqKe7MzIgBxiklXgdTdVon8N4ssSKhpu6Cc5ZolGS
         BSJ3iG+yg71fzgKGrHTLog60q/fwvxOs+V1Xbl26Ilq7XneLVdShzJ35QLaBdNksw9XP
         Vq7YmwvyrJ9eHmc506ShP7IlN2TuD6yUFgrEgwbVwIEgL7xNqooXtVa/iLQXgp/jl2Rc
         RRsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L7GWtWiV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g90-v6si1002245qkh.133.2018.05.30.11.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:15:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L7GWtWiV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5dI-0004Eh-BN
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:15:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Q1-0002B9-J8
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Px-0004on-LL
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:53 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:37307)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Px-0004oC-E3
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:49 -0400
Received: by mail-pf0-x243.google.com with SMTP id e9-v6so9408629pfi.4
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KjHaYoglkEEDpj+nxjmOWg1p1VMDQ/DgG8iObr4ysR8=;
	b=L7GWtWiVYPk9CDmUHdrzAlCUExEWGKPkp3KkfvnEk1tSSqkl2enwZPpmcR+a+DZB11
	TON2xn1QiTNQQshRPVIv6cN6fY5kC9V3q6I+w7sm7+3BdzsykTsBcHcD2+RX8QQ75g84
	vxXppW9QOs8SkeV/n1yu7RY0qxFUNaJoyv4pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KjHaYoglkEEDpj+nxjmOWg1p1VMDQ/DgG8iObr4ysR8=;
	b=hOoE+ox6PQ2ed0WdHRVlGmDqu+6IsSyLauVud+eEt520RA9yKJvk8jq7wZkgJsJrxe
	0jsibRbZCjzR4WxCUqTpDl2yka+vSC3RFu5IyyC95OH22XyTU19HDIti+Rq86mdTlT7f
	GjELrMeXoSDi1ivXfsWY4Yka3ghT66hOoQk1L0Xuq6ySO1uvxR5Hl6KFx3nF/YMWInCF
	Vyau5gwbC935LFDOh/lhCECOckAZVwohy3ffI4wJGCSs7DFp7cxxSBjuNrUUzRj6sxKh
	lrLUR1ytvQLVmmAW7Fffw0jyfEi/gTcs3nth/FqWGOQutJNfeheFUzl2VPJCXOFIVe+C
	VG6Q==
X-Gm-Message-State: ALKqPwelXswx3LNRVDIG7i8yHy1lkEkaLJv79T8+Az/sjSjjU+Zm6fKn
	P2X+L9x0hIsQZCibEcLpQdBVcc/YH08=
X-Received: by 2002:a62:1bc2:: with SMTP id
	b185-v6mr215234pfb.225.1527703308041; 
	Wed, 30 May 2018 11:01:48 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:18 -0700
Message-Id: <20180530180120.13355-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PATCH v3b 16/18] target/arm: Implement FDUP/DUP
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
X-TUID: 7kK0zctqmuLt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75eb36f110..e470f3b745 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3183,6 +3183,43 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Integer Wide Immediate - Unpredicated Group
+ */
+
+static bool trans_FDUP(DisasContext *s, arg_FDUP *a, uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        int dofs = vec_full_reg_offset(s, a->rd);
+        uint64_t imm;
+
+        /* Decode the VFP immediate.  */
+        imm = vfp_expand_imm(a->esz, a->imm);
+        imm = dup_const(a->esz, imm);
+
+        tcg_gen_gvec_dup64i(dofs, vsz, vsz, imm);
+    }
+    return true;
+}
+
+static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a, uint32_t insn)
+{
+    if (a->esz == 0 && extract32(insn, 13, 1)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        int dofs = vec_full_reg_offset(s, a->rd);
+
+        tcg_gen_gvec_dup64i(dofs, vsz, vsz, dup_const(a->esz, a->imm));
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 4b718060a9..b8bd22aff7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -614,6 +614,14 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
 
+### SVE Integer Wide Immediate - Unpredicated Group
+
+# SVE broadcast floating-point immediate (unpredicated)
+FDUP            00100101 esz:2 111 00 1110 imm:8 rd:5
+
+# SVE broadcast integer immediate (unpredicated)
+DUP_i           00100101 esz:2 111 00 011 . ........ rd:5       imm=%sh8_i8s
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.17.0

