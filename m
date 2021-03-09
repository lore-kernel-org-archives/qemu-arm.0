Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955436lfg;
        Tue, 9 Mar 2021 08:21:27 -0800 (PST)
X-Received: by 2002:a9d:12a7:: with SMTP id g36mr20424884otg.304.1615306887014;
        Tue, 09 Mar 2021 08:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306887; cv=none;
        d=google.com; s=arc-20160816;
        b=iBa3V7Jz7OTEQ4h6R9Xv+jPIO9EZ7z0KvCIKHX5kpLJ3fSNeX2LkbRd8XMWw0/V1Jo
         IcupIsR1cX6mXGHu0Ubi7gaD8PU2dzq9boyNwAOGumnqm/FzumlaH7jOJg1H8F6q2dO4
         RWz8LRNBMYf4IV65fTCdTFZuOuoNczcS2XMSpO90HeUKUhHiJwZj0gPB7JGQTk40ikaG
         IfcXBRwZH+M732fJ8Wsrt0VvxDdIxRqemMr40wwvlnk7Jc4smPVggObmof8H9NLehukl
         R207vV+eovnOYGBTKzq6vKSoaoo4w//WZvNHProXNYz54QHahWs46mzjmOEDrBKBwKP2
         lSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IBLMO5eVc4EnK/tNZqjKH+YJHmSPUKVvxUQrcUP5MI8=;
        b=gkEnItrGCVpo+k74YRjd4bhX1NGFnRRiE2yqlwGtzFHQO33j0WP8VLz7/HDVrZthEo
         NiMisof7rSi8lz31cTEf24a/99ukUCsZlTL45Lr2ahUqoqWIvlYP0EuMcOORvXBnuF6z
         IN5Uoei9mYf8pplw/3fpPHzV1ImJP0aSL+3ZIVeBidDoxJA216Qh+bZM+y7mkWb3+KJ7
         vjWu/N2qjvG5DJkB/T6rmNEKjmB47ZEnq01epDzTlkIMYNFeYuAeSt7NKGwUS584SjOn
         ACOUl9u5cxXy78VjdQz9SBtCVPeDKQ39oapgE8rIgg9bEYkKDxg7cV7ocfmAm7Mc4Gdb
         j/vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXSIVygG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c6sor3256946otp.108.2021.03.09.08.21.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXSIVygG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IBLMO5eVc4EnK/tNZqjKH+YJHmSPUKVvxUQrcUP5MI8=;
        b=RXSIVygGg4iGOzB5iKHMhMSKEdQFqKnl996mj4LBAbmVqdy+WIh1V3fCPmX62H/6mF
         zvrfDdp/kjKDII5hy5sZz5MizJKWkxW/2reGoCOqrdzh/+uaOVHDdmYHWO4NYy/xiLjz
         cdMR/q8KuSBNSdPr7a48l7BAn9MZvilFxgyyIqEsRHaLmuX06jggOo6g18nsvDpAO7av
         SW0QEYKKxWLXQ8h58OutEYSFTC8dRN4AyH9k5g6bCAjLdck8k5ssCQFS6qxL7oRMgCc0
         epdeQPigV2WKgItf221UyhDL4/a40AbpLMPECG3BrT/u3GrA6SD0PunAuhacfAU6N065
         TF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBLMO5eVc4EnK/tNZqjKH+YJHmSPUKVvxUQrcUP5MI8=;
        b=Q97z4MZo6MQxDS3WPBAlmpyGK0kwZ0Vb25eIjOScpqk18ce52Py/DgBrT5kin0Ulmy
         L2v1ZTxUOoTqg9cKl9nttoEMjUcrKrZ359XLGvc6+hGMaxE82ry7my5JRKFds65aDOy0
         FX1cp5zR9Zm7bxR7t0tZfOOq3BmLOVe0CSDTC55IVzGJf1KMzG5721xRrjLVdOa8Y1/b
         CYyAlYVGDA1YfT7/0Bc3VnOviEriXhbvvZRZi068/hevm8YQME18Nwz9UMf+P255Nhgt
         qtW97LcEsIljHEV6UEcSTtTV4xPy/04kOj/N+8Mx3LbyQskLmgSWr5kih1tf15ErhUXI
         Xo1w==
X-Gm-Message-State: AOAM532PakfRvdG3CLns2oleJKd9yoeau+fw9qpfYBObu+2GFxRMPp06
	A3MvkoGvJtfwYIjMfRZYRgKwuLtL
X-Google-Smtp-Source: ABdhPJwc+yLHxEJz9dwl6pevL7JR8ApQ0Hn5ivKZ20k/dESuQNtCe57oRiZZap+uoWYewNze1+e8OQ==
X-Received: by 2002:a9d:4e14:: with SMTP id p20mr16852972otf.94.1615306886661;
        Tue, 09 Mar 2021 08:21:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 38/78] target/arm: Implement SVE2 ADDHNB, ADDHNT
Date: Tue,  9 Mar 2021 08:20:01 -0800
Message-Id: <20210309162041.23124-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oyYHNkehqztN

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 13 +++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d154218452..a369fd2391 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,14 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_addhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 936977eacb..72dd36a5c8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+## SVE2 integer add/subtract narrow high part
+
+ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
+ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+
 ### SVE2 Character Match
 
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3bf81d96ae..2e2ad8fb09 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2112,6 +2112,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
 #undef DO_SHRNB
 #undef DO_SHRNT
 
+#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + i);                                      \
+        TYPEW mm = *(TYPEW *)(vm + i);                                      \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
+    }                                                                       \
+}
+
+#define DO_BINOPNT(NAME, TYPEW, TYPEN, SHIFT, HW, HN, OP)                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                                  \
+        TYPEW mm = *(TYPEW *)(vm + HW(i));                                  \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, mm, SHIFT);         \
+    }                                                                       \
+}
+
+#define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+
+DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_d, uint64_t, uint32_t, 32, DO_ADDHN)
+
+DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
+
+#undef DO_ADDHN
+
+#undef DO_BINOPNB
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 29d33389c2..931f1177a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7463,6 +7463,19 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+#define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
+{                                                                         \
+    static gen_helper_gvec_3 * const fns[4] = {                           \
+        NULL,                       gen_helper_sve2_##name##_h,           \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
+    };                                                                    \
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
+}
+
+DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
+DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1
