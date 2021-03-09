Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954848lfg;
        Tue, 9 Mar 2021 08:20:50 -0800 (PST)
X-Received: by 2002:a9d:1ca1:: with SMTP id l33mr23360375ota.368.1615306850550;
        Tue, 09 Mar 2021 08:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306850; cv=none;
        d=google.com; s=arc-20160816;
        b=PQPc1hHD0Z8qMzCU7LjS6n7gkOcY3wL+GusK9GCQLeCCtBH3jP8yxzmkE6xdDLXWgZ
         wF9zm32zzOgGaqgJOnTaAdAIb9T0EjRxwTAxtdLA/MmLohSJGN50tHB0BJXPTkIpjDhq
         ZoKLirkTb7K7IwibH0kgMqkBfpBXo6VT1Vb0SMAnX0PGwDrVe/VbecaKoZG2s4DTZPuJ
         Smto69MHRpFzsrhoBVAiDZSaO4z2lob2F5ObEVBfbC6MPEJVlWneoEaUozAiw0eqsNIf
         +r7ZOd8OcOWz01XmptDqvqghB4nZ8vhRJcKCBE/YiOln9Z6fPtywcyu3cFQeVSmeBP/7
         Swyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tvbQbRXJincws9vxpJQp1b+ub8fQnU0GehgSc3qlp/c=;
        b=ztGQH20yY4TuVv9nBB89TBU6Mk67p7w5wSpS+Fe0gCF4xkBNEkvE4yc62Wzq/oYWHf
         SKdfz4xlonvvLuIzabjrje9urT4LSSoYngDxZfYm8KMn8q3UipbikCo9FL5DO7BfBgzx
         Hq1/PKmV0Vo6bRhXevLXk/THa3TRJIsV20Tly+XHq0P6snlYdXyGEAeiW2x+O1sS692r
         qxcD2MfbL7nW4Wc+XY2JG8J6bmlLvGbuIx/NUUyYjlbLaWFAGVr0CMYW74nDfPGdpjJQ
         s0QLXS+sVpPHZpiU1OJW01ionETrbiaqJmlb2XutptnUgdR/sqZ0yV/vqGK4YFgXWyZx
         nL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i++NZKyT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c19sor3322039ots.57.2021.03.09.08.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i++NZKyT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tvbQbRXJincws9vxpJQp1b+ub8fQnU0GehgSc3qlp/c=;
        b=i++NZKyTPMraH8mGWhiUQdr2rI7JdzM/08WahnLiXRJi2d7bslqygx/XmB2dsNIu5N
         KPXHrPPyMUILWdpwLnTdVVLQko/rbuGYPEnD2m/DMZB8U9l6gvdeQf/2UGt/5+4dv12z
         fmzAgp3KuXUVS2qRdtA2CUNxCPMJiKcmbLLJK748jiC0HLpBWiwblz+UIMclK3UFSQbK
         BbkdQw3lVP6p5J6JLy+NZ22HlPY66muhLH3jSWN5gXmUJNlhrOu0VIGbv+p6b1e97QrA
         5cnDcPLahEHjvO8Us8elmfuHzHkvRsQVo0T/JBfwmiNReSm/RMUUFOjblH2eQYbyBgre
         FXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvbQbRXJincws9vxpJQp1b+ub8fQnU0GehgSc3qlp/c=;
        b=NBpMselPOgUc6ct1kVcdXWSxyLyQTzt/hUVHG7Lmb0UJvRZUM9bd1lI8pFkXGFylnQ
         ovhg3Gw4jpaHGSOpNvAxNUjQ2wqVMFbI3/Vp/A0Q7F3p7J/b3IoUw8HVe123v+UoaJHA
         2SPWbBJm99EewtGJuefYls9cs6qNcakQg+d+f9VxUxDI0oSn+vjGn0vy7l5WpCTwnQaQ
         8sQB+XlgCJmfCu+CsDkJchx31hks5P5s+KUH3Si8zHLiz7p9Y0zm/GH7fKLblR87RAE3
         waiJQ2zQqeVbecowC23oGUZNRc0/1UyOurUQTaX1wqvCJXXq91T5mOEX6LHDX7Xvtaks
         iRVQ==
X-Gm-Message-State: AOAM532HLXnuOXx/ULp93Tr8jmoFgVFhK0ZMEVBPRj1LCL58rrdpv7hY
	wJAnHpW0F71n6K2D0zmG98ozx1mm1PLH4FLKbsg=
X-Google-Smtp-Source: ABdhPJw7m7WhbxKnCYRNZWvMA45UN4lJHqbT/bj0L+jqKOu5jOPRlwoWdmt7kNq4X1DVauaG1QYlsw==
X-Received: by 2002:a05:6830:1f55:: with SMTP id u21mr25823401oth.103.1615306850169;
        Tue, 09 Mar 2021 08:20:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 06/78] target/arm: Implement SVE2 saturating/rounding bitwise shift left (predicated)
Date: Tue,  9 Mar 2021 08:19:29 -0800
Message-Id: <20210309162041.23124-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HeLesWGl9+Fg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift values are always signed (laurent desnogues).
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 +++++++++
 target/arm/sve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 18 +++++++++
 4 files changed, 167 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 9992e93e2b..62106c74be 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -172,6 +172,60 @@ DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5ba542969b..93f2479693 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1112,3 +1112,20 @@ URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
 URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
 SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
 SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
+
+### SVE2 saturating/rounding bitwise shift left (predicated)
+
+SRSHL           01000100 .. 000 010 100 ... ..... .....  @rdn_pg_rm
+URSHL           01000100 .. 000 011 100 ... ..... .....  @rdn_pg_rm
+SRSHL           01000100 .. 000 110 100 ... ..... .....  @rdm_pg_rn # SRSHLR
+URSHL           01000100 .. 000 111 100 ... ..... .....  @rdm_pg_rn # URSHLR
+
+SQSHL           01000100 .. 001 000 100 ... ..... .....  @rdn_pg_rm
+UQSHL           01000100 .. 001 001 100 ... ..... .....  @rdn_pg_rm
+SQSHL           01000100 .. 001 100 100 ... ..... .....  @rdm_pg_rn # SQSHLR
+UQSHL           01000100 .. 001 101 100 ... ..... .....  @rdm_pg_rn # UQSHLR
+
+SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
+UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
+SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
+UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5dcdd26db0..5c911963ec 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -26,6 +26,7 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
+#include "vec_internal.h"
 
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -561,6 +562,83 @@ DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
 DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
+#define do_srshl_b(n, m)  do_sqrshl_bhs(n, m, 8, true, NULL)
+#define do_srshl_h(n, m)  do_sqrshl_bhs(n, m, 16, true, NULL)
+#define do_srshl_s(n, m)  do_sqrshl_bhs(n, m, 32, true, NULL)
+#define do_srshl_d(n, m)  do_sqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_srshl_zpzz_b, int8_t, H1_2, do_srshl_b)
+DO_ZPZZ(sve2_srshl_zpzz_h, int16_t, H1_2, do_srshl_h)
+DO_ZPZZ(sve2_srshl_zpzz_s, int32_t, H1_4, do_srshl_s)
+DO_ZPZZ_D(sve2_srshl_zpzz_d, int64_t, do_srshl_d)
+
+#define do_urshl_b(n, m)  do_uqrshl_bhs(n, (int8_t)m, 8, true, NULL)
+#define do_urshl_h(n, m)  do_uqrshl_bhs(n, (int16_t)m, 16, true, NULL)
+#define do_urshl_s(n, m)  do_uqrshl_bhs(n, m, 32, true, NULL)
+#define do_urshl_d(n, m)  do_uqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_urshl_zpzz_b, uint8_t, H1_2, do_urshl_b)
+DO_ZPZZ(sve2_urshl_zpzz_h, uint16_t, H1_2, do_urshl_h)
+DO_ZPZZ(sve2_urshl_zpzz_s, uint32_t, H1_4, do_urshl_s)
+DO_ZPZZ_D(sve2_urshl_zpzz_d, uint64_t, do_urshl_d)
+
+/* Unlike the NEON and AdvSIMD versions, there is no QC bit to set. */
+#define do_sqshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, false, &discard); })
+#define do_sqshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, false, &discard); })
+#define do_sqshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, false, &discard); })
+#define do_sqshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_sqshl_zpzz_b, int8_t, H1_2, do_sqshl_b)
+DO_ZPZZ(sve2_sqshl_zpzz_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZZ(sve2_sqshl_zpzz_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZZ_D(sve2_sqshl_zpzz_d, int64_t, do_sqshl_d)
+
+#define do_uqshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_uqshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_uqshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, false, &discard); })
+#define do_uqshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_uqshl_zpzz_b, uint8_t, H1_2, do_uqshl_b)
+DO_ZPZZ(sve2_uqshl_zpzz_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZZ(sve2_uqshl_zpzz_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZZ_D(sve2_uqshl_zpzz_d, uint64_t, do_uqshl_d)
+
+#define do_sqrshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, true, &discard); })
+#define do_sqrshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, true, &discard); })
+#define do_sqrshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, true, &discard); })
+#define do_sqrshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_sqrshl_zpzz_b, int8_t, H1_2, do_sqrshl_b)
+DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
+DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
+DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
+
+#define do_uqrshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
+#define do_uqrshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, true, &discard); })
+#define do_uqrshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, true, &discard); })
+#define do_uqrshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_uqrshl_zpzz_b, uint8_t, H1_2, do_uqrshl_b)
+DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
+DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
+DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2d8b9d2e70..0950c32c09 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5932,3 +5932,21 @@ static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
     };
     return do_sve2_zpz_ool(s, a, fns[a->esz]);
 }
+
+#define DO_SVE2_ZPZZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[4] = {                           \
+        gen_helper_sve2_##name##_zpzz_b, gen_helper_sve2_##name##_zpzz_h, \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d, \
+    };                                                                    \
+    return do_sve2_zpzz_ool(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_ZPZZ(SQSHL, sqshl)
+DO_SVE2_ZPZZ(SQRSHL, sqrshl)
+DO_SVE2_ZPZZ(SRSHL, srshl)
+
+DO_SVE2_ZPZZ(UQSHL, uqshl)
+DO_SVE2_ZPZZ(UQRSHL, uqrshl)
+DO_SVE2_ZPZZ(URSHL, urshl)
-- 
2.25.1
