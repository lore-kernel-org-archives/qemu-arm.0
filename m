Received: by 10.28.71.27 with SMTP id u27csp2094276wma;
        Sat, 17 Feb 2018 10:59:42 -0800 (PST)
X-Google-Smtp-Source: AH8x224MOJdFowiZh5CickLZAeMW6LCNsQdXNMLNv97EWP5XLibRhsITVWG4qR4olVBrxgIkanBz
X-Received: by 10.37.244.16 with SMTP id q16mr6982693ybd.149.1518893982775;
        Sat, 17 Feb 2018 10:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893982; cv=none;
        d=google.com; s=arc-20160816;
        b=IYnjLVUJcNru5NXXdcL3NTx4Pa/qnHUL9LgFcXByALlLvfly7tRLKwgxP5iCCbyyE/
         /dagpe9Gb10zaRtaqVb7NPaA7TIQAr+53vqpXudBFiyahUibjasP2ue6btPM3XB1nisC
         lCgiOLHuSfdwUN0fNOmClDnsXUNsyLjuweHhRPBS48Ihg9PP13NUG0C+O+xGT0j1Psn/
         ouila/FqDxjyoTKWONV4tDFQ5372GAx5W9L5HL2eJaGGvpYmiz292x1BqYtxmSAux3wT
         URvC0OFaHc9hnPlvdoMcyDj9cPsDpJ8hv0QkjbgpE0wwH/CCsf96RFc5PEYaUqLscySA
         4l0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=II2r4Y9ASLSI8Rc5w2Vv6jfGjVTNMqTbvzEJXx6d0Hc=;
        b=UptufPN90is2ZSPpJ9ksc6YlBcPAZaU38yd8mvm3S5cn6ehcrK+vUDRfPv8FUvAZ/3
         qXBD3OADJhTkhWd/XAf+HIXU6HpFli16s30oLh3D6EmZzYE/roJDLDA2qvc5BeSkInOQ
         yfOWHAHRcQp6bEevEI21k8MDjAYR7VfHfVNKRMy+vjASFXxcxX86JRx7KsdW7KXC+Eeo
         5XabWS9/NZityNRDjyp5evgPi4bGdVrWM2iNRPLs/V57OCRH4YHAuAX/qWgn5szdHcv8
         d6QXgcHsACvjoSpyYCmUuV/rDEIngYpfiekYdq62reACSwxdONrZawRhLNFRKY37kvh5
         tcvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qia6tOaq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e137si754674ybf.224.2018.02.17.10.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qia6tOaq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7i2-0005Qx-1X
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:59:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AB-0001Mq-7I
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A8-00024l-DD
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:43 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:35793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7A8-00024I-7q
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:40 -0500
Received: by mail-pl0-x242.google.com with SMTP id bb3so3441332plb.2
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=II2r4Y9ASLSI8Rc5w2Vv6jfGjVTNMqTbvzEJXx6d0Hc=;
	b=Qia6tOaqHgc7H7ev7GQWax4fPoDob0/7CxzJ8E2Fyk/vfwGx33RwY2Bteuttts/scb
	TS1yxMlfKb/MW/+4ZtTfrHulNKnuA9FquF0Kf2cv00+laYe2WsjK5K36Sj4PQ8ZaXUSN
	ayHYBeG5suo6/ulYCeH8yvRHKNGGxSJIHOzNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=II2r4Y9ASLSI8Rc5w2Vv6jfGjVTNMqTbvzEJXx6d0Hc=;
	b=GGRlQxkyjjYJd3p54w9HPt9VdG6ixgIHGHAcQL+ODUSEHy7brxdpZYLagsrLaveMSg
	1p46HDUse/oZVBrk/npB0fyV6gfUqNa3dAxLI1a6ohU/I+ZlPOiTq2dqbhBFPX7ZMcr+
	myPnQDsXajbpN0A4K67iIJhBemHulSPqDos+x3cPJgMxz9CTCWJP30k7SI0QowMaePLe
	zuVOd3M9PdGwn5h2FcEmOOw9DKpjGXcBAz+cWjusU8mkEWKNTmlIVXpUF47kvl6Y7CN+
	UaOZ7Y15/T+Qp3EZcllS0VApbUKLR4e5d0sYB+4Ls1QpNICJ+lSuQgazCI8v2TVarOmf
	G0rQ==
X-Gm-Message-State: APf1xPAf+KhkpXw7ppsPgjQsiPHiXw8SUSkaynM8NxYlsypvYasv50g/
	AHYzJo3x9Ioqt953z64azFJV/Hloy+o=
X-Received: by 2002:a17:902:9686:: with SMTP id
	n6-v6mr9303607plp.333.1518891879340; 
	Sat, 17 Feb 2018 10:24:39 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:02 -0800
Message-Id: <20180217182323.25885-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 46/67] target/arm: Implement SVE load and
 broadcast quadword
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
X-TUID: cUQXZcm+xWSi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  9 ++++++++
 2 files changed, 60 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fda9a56fd5..7b21102b7e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3398,6 +3398,57 @@ static void trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     trans_LD_zpri(s, a, insn);
 }
 
+static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
+{
+    static gen_helper_gvec_mem * const fns[4] = {
+        gen_helper_sve_ld1bb_r, gen_helper_sve_ld1hh_r,
+        gen_helper_sve_ld1ss_r, gen_helper_sve_ld1dd_r,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr t_pg;
+    TCGv_i32 desc;
+
+    /* Load the first quadword using the normal predicated load helpers.  */
+    desc = tcg_const_i32(simd_desc(16, 16, zt));
+    t_pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
+    fns[msz](cpu_env, t_pg, addr, desc);
+
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i32(desc);
+
+    /* Replicate that first quadword.  */
+    if (vsz > 16) {
+        unsigned dofs = vec_full_reg_offset(s, zt);
+        tcg_gen_gvec_dup_mem(4, dofs + 16, dofs, vsz - 16, vsz - 16);
+    }
+}
+
+static void trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
+{
+    TCGv_i64 addr;
+    int msz = dtype_msz(a->dtype);
+
+    if (a->rm == 31) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    addr = new_tmp_a64(s);
+    tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
+    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+    do_ldrq(s, a->rd, a->pg, addr, msz);
+}
+
+static void trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
+{
+    TCGv_i64 addr = new_tmp_a64(s);
+
+    tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
+    do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
+}
+
 static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                       int msz, int esz, int nreg)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 41b8cd8746..6c906e25e9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -723,6 +723,15 @@ LD_zprr		1010010 .. nreg:2 ..... 110 ... ..... .....	@rprr_load_msz
 # LD2B, LD2H, LD2W, LD2D; etc.
 LD_zpri		1010010 .. nreg:2 0.... 111 ... ..... .....	@rpri_load_msz
 
+# SVE load and broadcast quadword (scalar plus scalar)
+LD1RQ_zprr	1010010 .. 00 ..... 000 ... ..... ..... \
+		@rprr_load_msz nreg=0
+
+# SVE load and broadcast quadword (scalar plus immediate)
+# LD1RQB, LD1RQH, LD1RQS, LD1RQD
+LD1RQ_zpri	1010010 .. 00 0.... 001 ... ..... ..... \
+		@rpri_load_msz nreg=0
+
 ### SVE Memory Store Group
 
 # SVE contiguous store (scalar plus immediate)
-- 
2.14.3

