Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5769933wrq;
        Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeEEo1Hw0JSWFcPiHCwHVVItGJWoV6pO6NzdFghmnH6T1TWKuZA7ujTzBjheb1z3i/ugJkt
X-Received: by 2002:a0c:8dcd:: with SMTP id u13-v6mr4063169qvb.167.1530074051369;
        Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074051; cv=none;
        d=google.com; s=arc-20160816;
        b=CCElYhvAjLaXsCqfrbWoSsnizpeGiXzwf8v7b0jjCPyKpjSRZgS7OzqNkG+h0PiSIQ
         IW1b/ocUPZlKZDGdKjt1VWjkg86IUiNBRiNGkuzx0zBa1pbQske+AJjn4D4or57BP62q
         9lbo96uF8pL+6VR+MXH5EO++xeRhzqhP6X/G7raB9BVpjeZZO9raaC3nTnSQ6Stlh6Jk
         8Pazu4zbJQIJG58YFBOMHKfomPC1MuJ+2LqAv9FNAsAzJAuRlYIXKrZSRlLPhfSSn0OR
         Xbk/WBiYyIC5xzEzeowO2vuVITqpMTc/626om/yNLxGR1ltdhM1rrDl4K/smsmTdrqKj
         fxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=h035EMECAETS5Qbemtcsd16Nx9M5+Aleay4ARYrkoMU=;
        b=IHCrnY/ETov4nBlgiAjlNcCvrE/E5IgoxHl6heJfubZ8uj160HnDXjMRcuTdqv/75/
         nF/l8sTa5TRtEog+nRNtozsWHs9CE3qzppw6W5JeTBp7OLtqwkKSbnBDS/3YWzEoQlPg
         ufQZoytocDGVCY87yDUrF4jSFPWHJ1wc0teQtZQF0vmg4U0U29Um/+b4VxC8ZdtdF3+/
         0Bg/BBRZEWO09DK4MmxI0LLxaB7QJ4rmS1Zt3levk6Bh32QA4ngRvqtClhivUnlD5GqE
         LURr6oMA9ujSEEDN72yr3fQcTt8NNYAmfL3axCMyxeZeXV7OehkwD2o2BPTTA7Ck5hxW
         Pgog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dwhYF9Be;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r16-v6si2913520qvn.243.2018.06.26.21.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dwhYF9Be;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY29i-0004I4-PY
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29D-00043O-I0
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29C-00005e-5G
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:39 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:41872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29B-0008Vm-Sg
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:38 -0400
Received: by mail-pf0-x229.google.com with SMTP id a11-v6so384392pff.8
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h035EMECAETS5Qbemtcsd16Nx9M5+Aleay4ARYrkoMU=;
	b=dwhYF9Be/IrvgBbsEyF7HHE9Egfxd6iRYwvv/w+k820hGF/IQLKW5X5LWEXVb1uGV1
	fUgaDFxMpZw0OE2sRkF0ei6eWKfGTilkU0Ft62bFyE9t1GyIWV2rDHMG1+ez7v79GsCE
	DLGqgJzNVs3odU2klwtgqZGRHRUKlgIt8JVeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h035EMECAETS5Qbemtcsd16Nx9M5+Aleay4ARYrkoMU=;
	b=oeF+EN3z29em4XYeG2ViM8PMyOsfykQQsKYecZJr/o35T0JTb5Z4TvWI3j7jinFhFH
	ApbVl+h6IkU/mKjCeIhEwiM6DAreiH9+X3berLJ8j8H7u1rxSdnhe9za/Og3llyhIb0B
	uGNZejIlB1Wgj5A89tATBFqUYLDIycKXC7hessMVtH7OJimpb7e2cxCM/xEaRiog1sIg
	Xof51tCmXjAEfED4chEILoiTADk9fQiiAxOv9/kkoS4rsKIbY41GLqt7tPESg38X8B4O
	FOD5I5NJbp4fHZzxrRkv/k8UjdeeZzQVvPiGEgV4D9SGNn4zP1L9fFmonEvBGhVU74+1
	RVYA==
X-Gm-Message-State: APt69E1DWIlY1zZo197P886MFiISRvSh2kBzmJnYtTs4DnOAFwymNq8Q
	QpLGc6T1wS9tPXbR/5KGfW2S4Q==
X-Received: by 2002:a63:b047:: with SMTP id
	z7-v6mr3399792pgo.335.1530074016943; 
	Tue, 26 Jun 2018 21:33:36 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:32:57 -0700
Message-Id: <20180627043328.11531-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: [Qemu-arm] [PATCH v6 04/35] target/arm: Implement SVE load and
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BeT/mWqPBohx

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  9 +++++++
 2 files changed, 61 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b25fe96b77..83de87ee0e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3717,6 +3717,58 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     return true;
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
+static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
+{
+    if (a->rm == 31) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        int msz = dtype_msz(a->dtype);
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+        do_ldrq(s, a->rd, a->pg, addr, msz);
+    }
+    return true;
+}
+
+static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
+        do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
+    }
+    return true;
+}
+
 static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                       int msz, int esz, int nreg)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6e159faaec..606c4f623c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -715,6 +715,15 @@ LD_zprr         1010010 .. nreg:2 ..... 110 ... ..... .....     @rprr_load_msz
 # LD2B, LD2H, LD2W, LD2D; etc.
 LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
 
+# SVE load and broadcast quadword (scalar plus scalar)
+LD1RQ_zprr      1010010 .. 00 ..... 000 ... ..... ..... \
+                @rprr_load_msz nreg=0
+
+# SVE load and broadcast quadword (scalar plus immediate)
+# LD1RQB, LD1RQH, LD1RQS, LD1RQD
+LD1RQ_zpri      1010010 .. 00 0.... 001 ... ..... ..... \
+                @rpri_load_msz nreg=0
+
 ### SVE Memory Store Group
 
 # SVE contiguous store (scalar plus immediate)
-- 
2.17.1

