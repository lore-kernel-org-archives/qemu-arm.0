Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956031lfg;
        Tue, 9 Mar 2021 08:22:14 -0800 (PST)
X-Received: by 2002:aca:4d55:: with SMTP id a82mr3497056oib.23.1615306934760;
        Tue, 09 Mar 2021 08:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306934; cv=none;
        d=google.com; s=arc-20160816;
        b=Gdg9QaSva2bnpaI4JeUxpCp4vQ55T2NndWAUXpcKU2mE22u0mEOwGo6/cFRho9vU90
         N//9vURiBFobcd2aEELLALOCEQn3ESXHmoGSxnNiaHbSemZ6ahSEHEDhhN3EUjUEuvec
         kuWP3Pq9NFxdBs3fST539zsoWJsPm9AkY+seLy2jkjU9LfB0/XAlD91Af7XCCAKt/ASD
         87IPB4T6STn+3evClSBYrytSi3bBWhscDkR2/Wuv3Q0O6hIKuQOObSdG+PB2+pZvxTmR
         q6BUy1uLYvCL4hDqsugJWOFKTk6y4P/G6rOfe/URNjUf+uzTnSt75Na0bi/bbiKbCIO7
         gZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0olgZkdMsWEvekxSRg+Mk6d/nWiC65iXDYtyv4A1kpY=;
        b=wBZkGwOFOBdIx2q/0QxnLHmO2PDw/Oe3GfGgJE1I0V0VgUNnUkTSbkv2qOADGRpdxV
         1KBETpQwLNgRhI6+4E5P4xjb3MRRGrj8/iH9HnrUzrJpTMfJ265hUKxq7xBAb5etEkWE
         V0c8lfmg68t/Q3TbdaHvUNPcFYCeoHRmTGL3BN/mK1yVl7IyV5vwLuYiMXf+hpS/qVqF
         hZePGxRPNpWXKfzOOPUSd+fZ3K5ORmpOWAxdPk2tMWYeKstmpIlU84wtKP0/Zhbo/Y9n
         aWGaVkDPaFSYfLGh0PK+IMlb5OYIjTJ+Yf1xUlQIrbDPPpfZZjzcZyo/F457npI3qmGT
         U0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKNJl1GU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j25sor1266295otk.55.2021.03.09.08.22.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKNJl1GU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0olgZkdMsWEvekxSRg+Mk6d/nWiC65iXDYtyv4A1kpY=;
        b=mKNJl1GUCbXJOkcwk5bvuCPDXnf4TqSJf/thUR3zitcEI2Sttr80kgloiqe79QR6Jg
         ajhUAZpvcAM57d/qdVQHbjNARH+1u9j89T59tdYQEKwzZSq9+LRriC8Gblzp/9RFAcp+
         m6k+2kU/cr+HV2XISkwWRIau2keuqVV5F5vWhwplASKARLp9xhIRs0DmiZP7bljBOHIF
         Ivk/OZ6ILbsI5cbi04Ya+o/DD5hf+Q4ql4RHSlsGddA4keqgXlAwg63fQMw9f+6yxHPW
         nwL/zUmyVpRSQpHXlfh8fsvEmUgDF0cgonEC639MKWhJ8exCaF+PoB0j45CEmlQeBq8P
         esyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0olgZkdMsWEvekxSRg+Mk6d/nWiC65iXDYtyv4A1kpY=;
        b=szQTVAvnz4P3FTSCVtZOz3K2biU4dmMryc21EcRwRxAeLRjvxihODFfYlfbh8dnENR
         cr55UX2+wDxNQMrNMf+pNmVCS52ya9uhbFa5I2X7CeRMKEDYKW8MzeSZQm8vWm3HeoGE
         nJIlwE15zauwWdZES3MQgqDh4FcDj3xU2ChVYyqKlNekP8c0xGWeZEiTD8QLbWKG6U+D
         a/KAzjyil87AyarrA6GcGHY6BzGPsJ75lZuVesvaLhg3LfpRPHsZqVJ2fdR69qoprlAP
         EQMtaOXw2yESSYSlXJ/xV4UsPAr948Q3ZSxuR7DiVPf5+MsPwzMnIzG1thAQEI/qfOOY
         YRiA==
X-Gm-Message-State: AOAM531I21VwiL8yauNH5CRLGLKkCk9DtN0bgr2AWyDFVnjtEuaISfl2
	vbl+HrBjwx7qFew8ie3K3Vdoo4zVZrOOIXN1+24=
X-Google-Smtp-Source: ABdhPJxv5Y2V5HSLQhMa2ELdPlNRuug9RxOkIebYHP3zBVshfN+EnVD4++3KlZEGCYE+G71xM8Ojhg==
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr23919051otf.21.1615306934421;
        Tue, 09 Mar 2021 08:22:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 53/78] target/arm: Implement SVE2 integer multiply-add (indexed)
Date: Tue,  9 Mar 2021 08:20:16 -0800
Message-Id: <20210309162041.23124-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fbe2X57NSOwd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5d20392887..8d761edb74 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -785,6 +785,14 @@ SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
 UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
 UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 .. 1 ..... 000010 ..... .....          @rrxr_h
+MLA_zzxz_s      01000100 .. 1 ..... 000010 ..... .....          @rrxr_s
+MLA_zzxz_d      01000100 .. 1 ..... 000010 ..... .....          @rrxr_d
+MLS_zzxz_h      01000100 .. 1 ..... 000011 ..... .....          @rrxr_h
+MLS_zzxz_s      01000100 .. 1 ..... 000011 ..... .....          @rrxr_s
+MLS_zzxz_d      01000100 .. 1 ..... 000011 ..... .....          @rrxr_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ee2ef91355..bee3e5a235 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1
