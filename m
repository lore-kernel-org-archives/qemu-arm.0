Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955834lfg;
        Tue, 9 Mar 2021 08:22:01 -0800 (PST)
X-Received: by 2002:aca:4d4e:: with SMTP id a75mr3476019oib.107.1615306921099;
        Tue, 09 Mar 2021 08:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306921; cv=none;
        d=google.com; s=arc-20160816;
        b=M3fN4AK0gzfXf2xPDDpTvuVv9PsFjXlF2vb51Yzrhui8CJ+CSz1xzyO9p/+33xRRTc
         wZbDyiwSD0OueSjfRVYOWqQ2HjDufyBHk71hXlIbbjBo5pU6ObU5EF7GzFUV5mSZmgsK
         SfTq2a4mCKyPFrdsmKAtAzll0YD8pOk54lnK4UC9OX0zZpEM9IrMCUkRJr6KE3gzuFIE
         8HA6x3jrW/N6Slhh4egePAgczAkM/y4R7XvYDPzxzwT41dcaMIeBEyCWXlwS9rtK8shL
         Qtj60kjNS4T5a30T/8tAbKcICVn5FQmZ69htjWtx7eZuiPqLIdSPiPQTwgg7NoS6Ar+M
         x9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hd9WE+PagjBcQKfB5basSfMLdVZ3AAupsplglzUvPSg=;
        b=f4wcz/7n84R0k9ihfigSWuhm8/vZ1zKwRysoMGKRpvHmY/0b1G2auAXqA/m7e9LS1c
         tVVXwt+pBJVxPF/BznU2xzZTFepdTY9nHvMThyc1dL/aIaJZIUQ41oox5Aa3tFI96tAg
         56yonh2JeIti7y2gqzFpomaGxs80An7OwAZTls+UsOf9Xwyi7wI9qz4ks3KPV5JqTFG/
         yykt5VF+63U9wCS+53xXPyCfz0LCXSnzvNMlrhNCjUvXJDJOKgnWY2gRVanINTyDgtWg
         6Qyf+Ayo7ivXos97mxRDy1G59ohixz7R9xrwUW/4o6pY3kF2KBIHXaSbqXHkAW0Aazz6
         AQvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkzuxtEK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z5sor358127oic.157.2021.03.09.08.22.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkzuxtEK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hd9WE+PagjBcQKfB5basSfMLdVZ3AAupsplglzUvPSg=;
        b=wkzuxtEK7luGbXzArxop8L2YAqXPwJj30XO+XdjUasAVq9Zq8zR2CA4DrYaD30uRSP
         /6BhRwl68BcM+mA+zgQL89lAZG8BZcCbhKN+ZXCrxrioWFf9aXZTxqiJw5EXSO7WZCi1
         BABFSH+NxZVpaUW+vOPXSF5O9T6EaSdYjK51VyApJFGenlPK6iTnFkRYl4n6s/FDyxRf
         a426mkfwpVG91J8VLa+VxyYTVhRHP1nSfkY9EaXt9suUBOBf9iqImbuT3Lzc+Z3zFAVR
         H+sMeYAOXlBBzAP7FF62YFG8Bq2Ker/ip1zqKTjNX+adHOfeYmX0PZ4Pva3gLcktA8qC
         Y7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hd9WE+PagjBcQKfB5basSfMLdVZ3AAupsplglzUvPSg=;
        b=IzPmKPhwQp0YoJASGduOpvxj2sUD3xV+InI7xWf100swEdTlXUpEqHBBZ1fzyVH7il
         xzDAxsFUJKu92JqDo+Hyffxqk29uNPuVNhhWuexiDiIVAPAedCeKojzxQLwzb+2bdVTL
         nEuuNwyLFDstMzb6EFm/AN34KF30Gp8wp/bLUP01g5t18qp4YinQW7Op0Q9DMd4FM3P7
         /ERjQ2CqLAPYKSHvgDkioTeU2jgiO2C8YJXK2Y5Epltk5ILvDMXV/ePNpjVx4QUt8+pv
         ifOivGBFVy04pxV7rIQsMaHOSKD5tf+hXfr7TUdBxG97Z7pjNvAlLBytniQlsopvBnfz
         +/Zg==
X-Gm-Message-State: AOAM531fVrvXticmmzQuSsh2qeu7bUHiVQDGVYDxSntPQoq/HOcro+Qq
	e2RgIjc7GeOKTXldobQg2H7kp4kU
X-Google-Smtp-Source: ABdhPJyhedfI1u8qz1vMPV7oxDJsCG/XPhtEkCDvUhxt44uzuflkirDrBl+EjW1CfQvWcQJX3cD+tg==
X-Received: by 2002:a05:6808:148a:: with SMTP id e10mr3145299oiw.138.1615306920747;
        Tue, 09 Mar 2021 08:22:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 41/78] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
Date: Tue,  9 Mar 2021 08:20:04 -0800
Message-Id: <20210309162041.23124-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Fq0D/6+gCIGh

From: Stephen Long <steplong@quicinc.com>

This completes the section 'SVE2 integer add/subtract narrow high part'

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
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
index 3642e7c820..98e6b57e38 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2533,6 +2533,14 @@ DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c68bfcf6ed..388bf92acf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1328,6 +1328,8 @@ RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
 SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
+RSUBHNB         01000101 .. 1 ..... 011 110 ..... .....  @rd_rn_rm
+RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 229dde282e..860ab564cd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2137,6 +2137,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 #define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
+#define DO_RSUBHN(N, M, SH) ((N - M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2162,6 +2163,15 @@ DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
 
+DO_BINOPNB(sve2_rsubhnb_h, uint16_t, uint8_t, 8, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_s, uint32_t, uint16_t, 16, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_d, uint64_t, uint32_t, 32, DO_RSUBHN)
+
+DO_BINOPNT(sve2_rsubhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RSUBHN)
+
+#undef DO_RSUBHN
 #undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 792ec38cb0..08622432bd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7480,6 +7480,8 @@ DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
 DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
+DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1
