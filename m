Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954864lfg;
        Tue, 9 Mar 2021 08:20:52 -0800 (PST)
X-Received: by 2002:aca:314a:: with SMTP id x71mr3509438oix.55.1615306851847;
        Tue, 09 Mar 2021 08:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306851; cv=none;
        d=google.com; s=arc-20160816;
        b=Qd/fS9f38is8s5V8gNuEl8bHHD1Wax5LN30NSiiDHKqq2A7IYEl4UJcYeq6af9GdkY
         7Tb/0Miytr3baauin7Z8m9+yVP/mZoaG+BiMfU/vmGxBaYYpxqcCMUecjBh/zWBoNETJ
         a7gH8I4L2cHQ6GmgC/WYydEfx1qOSkRPnqEtvWS13Yno1EqEq0OnWKvcTdlkPihQnSJ3
         ChtMSllzV3E/wpiUt/9cIT9m7W0EnPS8sksRfRIp33S3Tdq2F1PUGHHaZUAkIPhh4teK
         UiWr4QjpTMr92qGrNVS53QtfSOj1FVw2VZxgP4pwh7TR250L50ZdYYwKBQuXvpVdWsdF
         eQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=boAjEAjRJcOocs6tCIDq/S2Fa1ZUyTzEni2HeQU7C9w=;
        b=Vl4NdAinvfp73oFa9CF1sgdajx3DauneylfEBeOnLGSK8bccCDgRbcr+15uXQt2uft
         ckMFa/aJw+dONtidTnzM2RBblfD2dQGQQi/uNHYYY/BRlDusuVaaZduKwn++QuECHkqa
         VQ+FG0oCKbsqXmZmgaMY+/Nmxp3mdBLn/CojGDQ0U1IUEP6u9gBy4D5ILZM7sK7K9k7X
         pjmGmrd/WCy60Bhv+PRttdPh9ZUpDW0Z4nIUZmrsmBdRRc6QFNXres9l4H0eMhfBC5ln
         4xbdJqw/k0zAESoaXKGuC2RGCRnnIK+fz1LJAlRHc7wl16JrlcbxIqoj1ecjNq8P2ik6
         B/lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJDpIg+b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b11sor4160362oiy.136.2021.03.09.08.20.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJDpIg+b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=boAjEAjRJcOocs6tCIDq/S2Fa1ZUyTzEni2HeQU7C9w=;
        b=TJDpIg+bytAmngBdyi6xgjrXxFTzXxroidOugO3DEpTlrhe3y+yo6IFkXokmXHuHoH
         +pUUsoMLadytQOCAjmgyGgsexRxD+dbNFJMQp7EOKn+noQfp83XE9BNhDEwj/fNmURAV
         kCBIY2gUKPfJClE2dnR+bpVIFKmEs709NWgB1UO8yfi8zltt6x7HcJCuUmZpU4xh4JYk
         senlB2nVGSoWQtUj8I8vK1p4nPS4klFANjXXyEuQLtQui4izh9VSFvRZmIgkToaheFkR
         7S5/RUP/GNfmddaECoe3irrWr3NbcfCOwJqn7qdn+25TAf0XGJDUeM8pyFytQ2HwpN33
         lhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boAjEAjRJcOocs6tCIDq/S2Fa1ZUyTzEni2HeQU7C9w=;
        b=VEchKobvOvhEtzZDqaWBkeak/jUBJ3Crcgrfo7WRumlOOF4rUf4aZt9uzvXjvbcnoJ
         SK2VMKUicqBLoxv0iHR2qvpM59UV/5djyuozGjTOhP+8VAznlam9Z0fS3982TWOD6Au/
         OfijF+X9sN199/Tb1cz7OjGMwfEu0M0ksMcOn3U/4g2ijDKhjwvKapwni1Luy39DyXbk
         3Q3uN+Vir6P8mAkwbFjWfS6zOlEth2y9RfSpu+DvQIBB0ll+gHttbZhpLjhwKduJKCRu
         91ZuV+i7bpmZ6TgZVeoxX5+op86KaG1Zf85GfhHuC8cSyapOpWGS8QzQH5IT7oD8zR0x
         viFQ==
X-Gm-Message-State: AOAM532gDxMIqMdXLpX0/S0SFX939ChQXJcZymHTlRbJd4blCkudew7D
	tX8u5pxTRIJ07Lsk+pQij5sgQ0DY
X-Google-Smtp-Source: ABdhPJyzW4FEDQCp9gd/H+hZQK0Wdq30GEjpuQVNr+A9KW2ulnhhHd0TvRSWTu1aSU8zR9edyQmrOw==
X-Received: by 2002:aca:b555:: with SMTP id e82mr3426409oif.65.1615306851437;
        Tue, 09 Mar 2021 08:20:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 07/78] target/arm: Implement SVE2 integer halving add/subtract (predicated)
Date: Tue,  9 Mar 2021 08:19:30 -0800
Message-Id: <20210309162041.23124-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Kre0sDUWqaqv

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 62106c74be..5fdc0d223a 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -226,6 +226,60 @@ DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 93f2479693..58c3f7ede4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1129,3 +1129,14 @@ SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
 UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
 SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
 UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
+
+### SVE2 integer halving add/subtract (predicated)
+
+SHADD           01000100 .. 010 000 100 ... ..... .....  @rdn_pg_rm
+UHADD           01000100 .. 010 001 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 010 100 ... ..... .....  @rdn_pg_rm
+UHSUB           01000100 .. 010 011 100 ... ..... .....  @rdn_pg_rm
+SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
+URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
+UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5c911963ec..a7a934f3a4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
+#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
+
+DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)
+
+DO_ZPZZ(sve2_uhadd_zpzz_b, uint8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_h, uint16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_s, uint32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_uhadd_zpzz_d, uint64_t, DO_HADD_D)
+
+#define DO_RHADD_BHS(n, m)  (((int64_t)n + m + 1) >> 1)
+#define DO_RHADD_D(n, m)    ((n >> 1) + (m >> 1) + ((n | m) & 1))
+
+DO_ZPZZ(sve2_srhadd_zpzz_b, int8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_h, int16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_s, int32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_srhadd_zpzz_d, int64_t, DO_RHADD_D)
+
+DO_ZPZZ(sve2_urhadd_zpzz_b, uint8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_h, uint16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_s, uint32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_urhadd_zpzz_d, uint64_t, DO_RHADD_D)
+
+#define DO_HSUB_BHS(n, m)  (((int64_t)n - m) >> 1)
+#define DO_HSUB_D(n, m)    ((n >> 1) - (m >> 1) - (~n & m & 1))
+
+DO_ZPZZ(sve2_shsub_zpzz_b, int8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_h, int16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_s, int32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_shsub_zpzz_d, int64_t, DO_HSUB_D)
+
+DO_ZPZZ(sve2_uhsub_zpzz_b, uint8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0950c32c09..07e1315cca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5950,3 +5950,11 @@ DO_SVE2_ZPZZ(SRSHL, srshl)
 DO_SVE2_ZPZZ(UQSHL, uqshl)
 DO_SVE2_ZPZZ(UQRSHL, uqrshl)
 DO_SVE2_ZPZZ(URSHL, urshl)
+
+DO_SVE2_ZPZZ(SHADD, shadd)
+DO_SVE2_ZPZZ(SRHADD, srhadd)
+DO_SVE2_ZPZZ(SHSUB, shsub)
+
+DO_SVE2_ZPZZ(UHADD, uhadd)
+DO_SVE2_ZPZZ(URHADD, urhadd)
+DO_SVE2_ZPZZ(UHSUB, uhsub)
-- 
2.25.1
