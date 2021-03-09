Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955822lfg;
        Tue, 9 Mar 2021 08:22:00 -0800 (PST)
X-Received: by 2002:a4a:974e:: with SMTP id v14mr22781151ooi.33.1615306920052;
        Tue, 09 Mar 2021 08:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306920; cv=none;
        d=google.com; s=arc-20160816;
        b=g+gmsS2Q9MtEQ7qHq6IvNK0bsA66HLN4JvONWZeQICBAD/4GIAExuovzcFUK0NFGdF
         t2lHX58dobN6hHD/z3wpVAFsVbMwIjsKlvxKty92+MlzOkVYUSPkuiqYCb+/+Nu4b6mj
         5kEMAKSTnR/Q9Y1fX6pePxy+6iWHJjmWjbWCBrB/AD7KbOMhG3UUKwt3u2hcQYJs7BKP
         HEmjKhS4tmhP3kxuII9pDSQetALQV2bEjlt9gZ9PzxDAzUxTbaBzeZHPKdiQX3VeTFFn
         2tGhS4CSva4ITtRyU/G0zgTy8gb5Dz39fzsU32KPtx6Lrs34QqRPM7cDnffAEBajVDT+
         hp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dmOaMq0cyoTud0OTLwGo1bmU+yPSQ++q9U9cjzeKa4M=;
        b=Cww4dYFBOAcQWJ27nhUwtkiT/7/3Yo8/hN+7cgKZOzGpmHEpQfouOkqpc6cYf8ebnX
         gHfU3BHsca7V3tPjXAqkvLgMs8tVUMGenW/MO9+pe4O3OjBSSZIqaRQoQavNp7OheQee
         vSZ1oTx9mGrZWUE+4NSA3aZRVFTTjMa87v1XzdkSCP2nfNvDk6xFiLXJfZMAJBaHFlpR
         pDAEqqUVoWH8aVjgyEAvWoSqPsEQT67l9bCjcMDuvuapyIYWQ9+wQFEjPSkV7rCC1COZ
         ArQ2SWBgzXHxERJclOcp2eHnLQLrDvtRWbVuC3GFALcUzkU71JtHcB+EPOpz8kTl20Cz
         7lmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0x80t9C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b13sor1815149otl.184.2021.03.09.08.21.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0x80t9C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dmOaMq0cyoTud0OTLwGo1bmU+yPSQ++q9U9cjzeKa4M=;
        b=u0x80t9C7FpPKMWMeYbn9liCw4tnVADINA+wbbvfWzhNdoP1sjDVexwTtt+SniWWl0
         FKwM3cJ23RbR8/p0Qh1Qojuk0e6UOtDXGaamO67omqeXV++A1LurS2w5DjRwMsiKaJiH
         D725oJbMT9nBw7US8I3nyat+e95bKQdGqKUP8fOSCOMvN5buwxH0dMXEdy9nMelWORp0
         5UJRT0VlHYP34mGHGbnTRh4OmF655jiGcv+MqD9JlSjqTEljzOFnrGwE8GXzQwAZVUsn
         zB8wjE4v2DMXrw4zWPxLOoeDklztLKcDzhzjQGR6chAh7jB4Pxd4691GofbTrwHk4+Eb
         iBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmOaMq0cyoTud0OTLwGo1bmU+yPSQ++q9U9cjzeKa4M=;
        b=DK2RrUXO76THW0S5MUU4EOu03BN89rvrV9D14TCPK34T0iHjw8FyOLlsR8OfFVYFZg
         l8+b3rrGio7CqjkMERpjQLHxDIjlsX1w/UMAqoVewQVOr5egsNj6M2apWNiefblCQ5FY
         lBUKIvdL3k/fdfoDxGxWZl44hOujsM/kBu9Wi5AR3wWuV9eOqBwTJQu7W1zaJ5zwXfFQ
         6yHHMrIuwGkxWFPmeKg2MRgDcsFWvP5yeMzpz7fhERpOx1ZokUvD0wSwBwFcBAeL0X3V
         QOrFS/PXHsFvlIzt1Jz4LyPm1/Deo8QJjQHRXHpJ92IuWoXWmMG67i6FzE54pRba/qY8
         VS3A==
X-Gm-Message-State: AOAM532XHQVz8PVzFiobU5p/uo7zD48+LtkokLj2B2LC6+nzcTxZA5Wk
	vWaxRL0q5gB1slELO0Oz+xum+L14
X-Google-Smtp-Source: ABdhPJyvCnXL2vdMn8kMTw/kFB8a50NrD9rtiWCeOUHrkVphZ47uQwgF+SWL8fFy4XYux1xjrGjbQw==
X-Received: by 2002:a9d:750c:: with SMTP id r12mr9669622otk.322.1615306919692;
        Tue, 09 Mar 2021 08:21:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 40/78] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Tue,  9 Mar 2021 08:20:03 -0800
Message-Id: <20210309162041.23124-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TPXEHl21eGxG

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 8d95c87694..3642e7c820 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2525,6 +2525,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dfcfab4bc0..c68bfcf6ed 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1326,6 +1326,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8be0d28a8a..229dde282e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2136,6 +2136,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2153,6 +2154,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 375f75e086..792ec38cb0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7478,6 +7478,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1
