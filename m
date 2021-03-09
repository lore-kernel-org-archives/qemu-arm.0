Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956119lfg;
        Tue, 9 Mar 2021 08:22:19 -0800 (PST)
X-Received: by 2002:aca:5d82:: with SMTP id r124mr3473532oib.59.1615306939400;
        Tue, 09 Mar 2021 08:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306939; cv=none;
        d=google.com; s=arc-20160816;
        b=j24rXHsAhHufe7gKCp/n1tH+fPsk5vR2g4Y+3NRfbaPEv3irhLY9tg4OBREQj7D/yf
         CIT/RAK4vU5D2D0E8tBF10twpfjNJdBMNzg3s352OXdX6l0gT9g5FfCL6VOp0mM5wjJm
         slHYSBtobAZoixqUjnPtLRgMV+Ub3lrKk+3R613gAbT6uvjs6RfOi8bTZv0IQLNXpVgB
         3j5En82Gs1REqwTN7HUnFOl+9Mig6ywk38f5ScCyfVp3tej8HA1BJFaKt/BIPRdSRmfW
         ElaJHKLvyPw8fLBqVm8Fd5RswR31iUwPIsZQ8BBWVmUxx7yVKZtiEfuauIHWz9NgUyqn
         N7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n5+mVnW6j6a5LEyFP98f4FS2kW0fwkO2c1u4z0El7gk=;
        b=mJ7asrgKYsY+dWVrEtSr1cHFJZTPtWFIY9aMxluTsIeEdtJI6r+FPK0cDRX7mgM+6u
         Pp99yw6i5sduBs0MC3z0j5Bt11aIysUxjvTB5gu984XzLdVb9zj/ziiNHteqhMzGpbY1
         4JTuscZGqE6K8ovhzXB5pXiFcMdatgwXouevSSxbdEXpf1zyHwd4XynKjwR2fmVDqc57
         YUrZwuOEurnIx+SJAlSXkX/iCr8JCF+GhEVZ6EQw8jqnvXx5OtlCEfrYhuZ2QSPvC6zl
         jJ6KG65UzFTGKzY+GswtgaBT80x5zV5JQAl2L5YU7Z3FiJo+YVtWOmdLIfPc/4FMopIS
         q0ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsiAzyPX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y25sor2029201otq.35.2021.03.09.08.22.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsiAzyPX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5+mVnW6j6a5LEyFP98f4FS2kW0fwkO2c1u4z0El7gk=;
        b=hsiAzyPXdjdgysBMTktOGPo6fAPQzYOum+zleUo4r3I/1eJM6vezTRuBIbhEHnvPSg
         9v8MMKzXgnSxz816g5Zz7JCOlN0JlKlhJP3+MXgvrDnOvkknL0tXi17fjMAW/o76UTRo
         LEtZm5hJOlLagHWikzMzqR5N2QpECWsasQTkLRTiaTInKLan6H7rv7V8hhNAZzhZ9fFi
         w1PQLe0582JoQCm2nOjCIaTUecjVa0rZ7rBbJPjc0xyTnHMP5ZSJ1YLdS97W8Q7whDR4
         oaorxmEM2/DJjv4ei1QX2Tgbb49bglBniDckXj/zeUCfLt3JjmZSwAUdEZzMMMaOa2xr
         2yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5+mVnW6j6a5LEyFP98f4FS2kW0fwkO2c1u4z0El7gk=;
        b=lx9rj2wzSPUQntKJzVZATNLHzz/gkRfhbLg9QRcJuCGwMPjs5nl6nTVU3YNeWvU0UK
         lj187gqxHHJFa1DBTvjpPozSPDeJXTCV7DjDAmTRsqJiyEjw0Axaei3WTFmioKHdqRMt
         4iSH8l9cT8joPeXPHwIsIYm0RU3hfhFH197Ev9LXrTFpZ3WqvwKOfnAloHBjNQ6tBy92
         5BW8kiSowroECHaR5aqfE5qAHuQssOFfMLc3UdF0qmsoSDYAmeOvCOjgjwkIBBnAa6oA
         CfKZKV8QXYpG9aXo5oV+dj1FYs/T4DM44v6bifj/QuGIv1raKfW6pne86vH+7uEqRQEz
         /EZQ==
X-Gm-Message-State: AOAM53041fk0qVqRbEVrac0ufXODCa9Ivv8sXkI/g8Ai96+Yj1G6l01H
	RJIbMsc6INKte/I+ugxfjzPBDqzf
X-Google-Smtp-Source: ABdhPJxguUGoYh2s8rxva6EzUyG2LKTdUh3P/gNkV+vzaw5aeVTFccdAR4k8/ldO33YMreRQyFmnYA==
X-Received: by 2002:a9d:4e1a:: with SMTP id p26mr903207otf.202.1615306938661;
        Tue, 09 Mar 2021 08:22:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 57/78] target/arm: Implement SVE2 saturating multiply (indexed)
Date: Tue,  9 Mar 2021 08:20:20 -0800
Message-Id: <20210309162041.23124-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MYx+yhcAWEXB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 5 +++++
 target/arm/sve.decode      | 6 ++++++
 target/arm/sve_helper.c    | 3 +++
 target/arm/translate-sve.c | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a3690082af..548dedf24c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2693,3 +2693,8 @@ DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ebb892748b..a0c930ed66 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -835,6 +835,12 @@ UMULLB_zzx_d    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_d
 UMULLT_zzx_s    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_s
 UMULLT_zzx_d    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_d
 
+# SVE2 saturating multiply (indexed)
+SQDMULLB_zzx_s  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_s
+SQDMULLB_zzx_d  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_d
+SQDMULLT_zzx_s  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_s
+SQDMULLT_zzx_d  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b64e1f243d..95bda0ae38 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1581,6 +1581,9 @@ DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
 DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
 DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
 
+DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZX
 
 #define DO_BITPERM(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6376a21b98..9b27f32b54 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3880,6 +3880,11 @@ DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
 #undef DO_SVE2_RRX_TB
 
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
-- 
2.25.1
