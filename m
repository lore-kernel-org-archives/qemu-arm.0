Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956373lfg;
        Tue, 9 Mar 2021 08:22:37 -0800 (PST)
X-Received: by 2002:a05:6808:148a:: with SMTP id e10mr3147401oiw.138.1615306957036;
        Tue, 09 Mar 2021 08:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306957; cv=none;
        d=google.com; s=arc-20160816;
        b=SY5uyyWSVBQy7O9L7veaEna99P2X3NYVW7LJ3BR6mzHvOKCrM+a5degUVXwswaRvf8
         sApXWQvM5rxnNLoReXAJZtrnknubEpeNEXCGDltsKTuTmifZVSnR+6pKmJLeWzlSou0X
         yBr2pfQDZYEp3F+xL/JiMbAmrsvJ/jgO8iat4fJ/VlHXcF8lRtNmvM1LIuzuLmMprurg
         D2/YlXP28iACqcFdrghCcOaCwNtelT8asOw+qrCO7cWiTLhs/iaS99yygdUESTN8BRDE
         5y8UPdH4BAGy0kYwl7s/VdkXsyXI5Q/77Mm3EFS0w4yweq07VQRSSmgvgOeGiadJ59/S
         Hslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gp/V5Vy9Sz7v8gKnc23SVNqKOB8MLAcvhTvbwZmR4cw=;
        b=ChvHmLYJqwTSD0/2hvBAUzUS92b+hbMcD5RMl71SGObES/AxcyvwmtKMKmphvH5EnH
         fJMzNK9bEeGT6wAUoM7nvg/FwOstgsDO97qiCNqDm26Ez6Ru41oV1wOW1BEh1ol1bL1x
         MOoDFksFDgV6D0wD6CbJVSDUBIabEUoHlx5U9cZW6GOqnhvK2P2xYlK6hnvpJacY44ib
         oGOBlgh+T4iNnkjksu+1CcKMA17LDGXb0+bcQa/EP3lUtTP2cxhwpcsfBrzsTq9Ozj28
         IjfQBg9pNOnVsIhuEirsPMwMYe1VQjFKcqY8jBybdEdjsUwN+IgxRDoIUEbVI18epH+M
         BC7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjtuEqSl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p27sor3296259ota.13.2021.03.09.08.22.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjtuEqSl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gp/V5Vy9Sz7v8gKnc23SVNqKOB8MLAcvhTvbwZmR4cw=;
        b=QjtuEqSlAxWuqa9Eru5+j3X3/uCBcKVXR8N0W5nUmfC77AX0WYnFs0rjxIu9Lpsxol
         nZ3QGzm9BsMQWnoILqgEUkWR7iSm2ZAFrTskYgCzbWT1UUoM7tYpnU/Gc89vp0DNJjNx
         mE11AQaEIznKY06yeMEKPjrLT9AD++1GF5zDwCaS3opkpnetyDOM1LmV6q8yAlzMWCZF
         WSH4Goe0QRiYewswc03bF0S+JORZbuuTi4G8V85gvnDsIQNwofUcmMdrDSVLPdV8eaek
         eop+rowTwtHimdqmATTzUsExyqiVIdV7fyAZON72mKBm4zD1zAEKkO2L/E8I6qjTXbXH
         9gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gp/V5Vy9Sz7v8gKnc23SVNqKOB8MLAcvhTvbwZmR4cw=;
        b=DOQ+O+WNtDtIgWalgvHJRg6hQlqvk/wK2CQvMfnP2perZH2kXp2qkHUBQcn3rvgJOo
         V2SHVR6pVoJA+cDwK3Li6RYTXjf1yY8aDbQiqIhwHn/P3kSaIpFz1fnh7EfixXzJs9gW
         YTwYfaENF5aqxV1RRHJyALJcBphrfrplY5q9wgiCDL0gVLO41PXRN9/B2L26t46tr//a
         rxn/Q7Jq2AIL9YkXEMbzNATXXF1tdqI4xG3pgRjm1jtPTIwsUqy2dSJUcbhg3kkuk1Em
         m02B007neBR6tyVkr/Go0SVCTHKvkjbk4v2QN44hVgk9s/07AAoGufNZBa3HgdcNv5k3
         iaBg==
X-Gm-Message-State: AOAM530SAy3tiVMChyaR001j/PzpduM+1bXgP4YpMxkWlg+REwedmKy+
	ZDkRGh9dP4vMfBxx6ihkyWjdRWFB
X-Google-Smtp-Source: ABdhPJzrd1tRCUXS6BijxdipJ7GYZsxD9tnYATDVDWb6kZRSpHsx72x2tLYmzm8EIWLY18fYb6dswA==
X-Received: by 2002:a9d:12a4:: with SMTP id g33mr24446868otg.308.1615306956664;
        Tue, 09 Mar 2021 08:22:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 73/78] target/arm: Implement SVE2 LD1RO
Date: Tue,  9 Mar 2021 08:20:36 -0800
Message-Id: <20210309162041.23124-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dN096dysdiBD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9ad017d4d1..f3b405b741 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1119,11 +1119,15 @@ LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
 # SVE load and broadcast quadword (scalar plus scalar)
 LD1RQ_zprr      1010010 .. 00 ..... 000 ... ..... ..... \
                 @rprr_load_msz nreg=0
+LD1RO_zprr      1010010 .. 01 ..... 000 ... ..... ..... \
+                @rprr_load_msz nreg=0
 
 # SVE load and broadcast quadword (scalar plus immediate)
 # LD1RQB, LD1RQH, LD1RQS, LD1RQD
 LD1RQ_zpri      1010010 .. 00 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
+LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
+                @rpri_load_msz nreg=0
 
 # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
 PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 130abea7a5..58bebbfedd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5637,6 +5637,103 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
+static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned vsz_r32;
+    TCGv_ptr t_pg;
+    TCGv_i32 t_desc;
+    int desc, poff, doff;
+
+    if (vsz < 32) {
+        /*
+         * Note that this UNDEFINED check comes after CheckSVEEnabled()
+         * in the ARM pseudocode, which is the sve_access_check() done
+         * in our caller.  We should not now return false from the caller.
+         */
+        unallocated_encoding(s);
+        return;
+    }
+
+    /* Load the first octaword using the normal predicated load helpers.  */
+
+    poff = pred_full_reg_offset(s, pg);
+    if (vsz > 32) {
+        /*
+         * Zero-extend the first 32 bits of the predicate into a temporary.
+         * This avoids triggering an assert making sure we don't have bits
+         * set within a predicate beyond VQ, but we have lowered VQ to 2
+         * for this load operation.
+         */
+        TCGv_i64 tmp = tcg_temp_new_i64();
+#ifdef HOST_WORDS_BIGENDIAN
+        poff += 4;
+#endif
+        tcg_gen_ld32u_i64(tmp, cpu_env, poff);
+
+        poff = offsetof(CPUARMState, vfp.preg_tmp);
+        tcg_gen_st_i64(tmp, cpu_env, poff);
+        tcg_temp_free_i64(tmp);
+    }
+
+    t_pg = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(t_pg, cpu_env, poff);
+
+    desc = simd_desc(32, 32, zt);
+    t_desc = tcg_const_i32(desc);
+
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
+
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i32(t_desc);
+
+    /*
+     * Replicate that first octaword.
+     * The replication happens in units of 32; if the full vector size
+     * is not a multiple of 32, the final bits are zeroed.
+     */
+    doff = vec_full_reg_offset(s, zt);
+    vsz_r32 = QEMU_ALIGN_DOWN(vsz, 32);
+    if (vsz >= 64) {
+        tcg_gen_gvec_dup_mem(5, doff + 32, doff, vsz_r32 - 32, vsz - 32);
+    } else if (vsz > vsz_r32) {
+        /* Nop move, with side effect of clearing the tail. */
+        tcg_gen_gvec_mov(MO_64, doff, doff, vsz_r32, vsz);
+    }
+}
+
+static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    if (a->rm == 31) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+        do_ldro(s, a->rd, a->pg, addr, a->dtype);
+    }
+    return true;
+}
+
+static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
+        do_ldro(s, a->rd, a->pg, addr, a->dtype);
+    }
+    return true;
+}
+
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-- 
2.25.1
