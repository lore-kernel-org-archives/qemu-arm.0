Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955452lfg;
        Tue, 9 Mar 2021 08:21:28 -0800 (PST)
X-Received: by 2002:aca:484:: with SMTP id 126mr3435691oie.81.1615306888078;
        Tue, 09 Mar 2021 08:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306888; cv=none;
        d=google.com; s=arc-20160816;
        b=N0z94N44ECVaAXb6wdzZbi2/N6MaoykSg9ODMr++eea3jmTi4Tvgiu0dR6L5x5H0se
         Yx8zNSzb7lju/hPRNEPzjqgbXXEBA6X0bQTELBRf13Kvh/d9rxwJ6x6D88I5ScbGCZiI
         BRyKUvGOu/hzjqfY5StwL4bH9ZqPJ3GRJydG+5ZjJ77Np/MUK7MKveLmB1vbivi1FUxF
         Untncta+bk2AvjCK8MSLzn1wECXDSDYpbcHL3Subeb7K8yn+4RCtMyKDV4joXmoT0rbT
         3PLOD5ttWL3FSJYmtB4z+OpbA/PMNW8XXNJh/60zDPr5zXaoAxvpg5TsRODMx2greXbp
         rZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z/S0kD58xUXjkywGS7Cu/nFSr7dKf86ON5tXYzK+tQE=;
        b=UDztGV9BK5I63Tu1JRH0F7YfjV9+XcUrUzquEIrhwlaiMLQ23qzIEsl0Ev39lysPEu
         aG/IfTvFJtfh4aGZEkJnqutBzr/FIdF8FKqA/M8VsRTeuHlFZEqaFCz5XYY9KmA99VVV
         POMRBXeUCZQV3sSWHkQ2q1cu7nAcOIVSlPGQWkwPnH1Bd7DpOxATL6A1cNHQC3m9nZ+a
         IhE70Gnq/An9ZXtqohb5UIggBnaxc3wKpk+/5KHEVzO/etNwMpvemdWp9a2hGC+vaOm8
         +4oPs7Q6k0SPo+ktZo6EnQFMzudYkZSbMxci5LzCOxxbteMaLSdP+h8ll/FgVBNa2sBq
         CT9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEXGMtxa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b11sor152010oic.45.2021.03.09.08.21.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEXGMtxa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/S0kD58xUXjkywGS7Cu/nFSr7dKf86ON5tXYzK+tQE=;
        b=pEXGMtxaFB0INmat8EhJqD9dBV1gQg5n7Ji8nQryvwZHAzIZBw4TZqc8vBDhpJhKMA
         uneUtcvgQhv3sh3b9ZMYv3OS7CvthkHpKHJCCkDZrkiknrQk6ZpX1JKV6MOPXGLGw85C
         H4OEnJY6H96NG7MXdqfzEZaB+8s0GKDPcG6lXPnjSFDzdqdu0SilOIqYXEjPZKwQLTgU
         YGcoPeuvGdG+QddHxOB6upGuwuTCpskBuZwCaOK68UoGTrGCHpjNGaSBeZdd5IWiEAlx
         gKjbXGCUXHX9UHYJXfYi/cCjelITu7ySvy9QGztkPoBUb+O7HxjX3yRC2Y620HI1QMde
         /qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/S0kD58xUXjkywGS7Cu/nFSr7dKf86ON5tXYzK+tQE=;
        b=hgaCgocZyPAFSoYhsqMqSIZiAqvQFX6S46rhCqevpTXDpJJz/DYJKO0IttzLv6LUVs
         DYCmCCK0RrD4o0kwMvX9igkjUSghcPFxNQ0KGT/3V86j5SGi4udt9ApA2eiT02/lf8MW
         9uDBhafU8pRk75XrlR/6lNMsKfseuvWztJmC5M2baI/6ALMNc2y6ip/RKsnu98hvCHjN
         d04L8QkmKfgn5h9IKxNAuPe/SXdWdQXJ+cGlR97ASP+QDylY95HMaggG+aXhCoBzuodf
         qTCDL6JpRliQxO5gGVs9NFvayLVWUyRA2S7mMqA2CZttI7kZMAKgQuTllDV5WvJhWkxD
         xaUA==
X-Gm-Message-State: AOAM5325K2RXNVmE7qSzhkY86EQWquMn8fCSbfmJxy1BplrrsFPY55/5
	dsrBM4nbKgO62hSL5czUUBv/VF63
X-Google-Smtp-Source: ABdhPJxfPTstR9Aata8nt0FomA2E34lNNjAh10/2VvttF3kaJLteRtlE5kjFpAI0SdBbS+DsDHzNGw==
X-Received: by 2002:aca:de82:: with SMTP id v124mr3483571oig.125.1615306887676;
        Tue, 09 Mar 2021 08:21:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 39/78] target/arm: Implement SVE2 RADDHNB, RADDHNT
Date: Tue,  9 Mar 2021 08:20:02 -0800
Message-Id: <20210309162041.23124-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EG68wBxlePmt

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a369fd2391..8d95c87694 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2517,6 +2517,14 @@ DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_raddhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 72dd36a5c8..dfcfab4bc0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1324,6 +1324,8 @@ UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
+RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2e2ad8fb09..8be0d28a8a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2135,6 +2135,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 }
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+#define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2144,6 +2145,15 @@ DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
 
+DO_BINOPNB(sve2_raddhnb_h, uint16_t, uint8_t, 8, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_s, uint32_t, uint16_t, 16, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_d, uint64_t, uint32_t, 32, DO_RADDHN)
+
+DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
+
+#undef DO_RADDHN
 #undef DO_ADDHN
 
 #undef DO_BINOPNB
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 931f1177a5..375f75e086 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7475,6 +7475,8 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
+DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1
