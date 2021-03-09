Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956297lfg;
        Tue, 9 Mar 2021 08:22:31 -0800 (PST)
X-Received: by 2002:a4a:6c19:: with SMTP id q25mr22977908ooc.42.1615306951246;
        Tue, 09 Mar 2021 08:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306951; cv=none;
        d=google.com; s=arc-20160816;
        b=L5KNN4cb8eUTurGTXSxehdqNSoJzTV81hXUD5m+00kUjJV2wK9B4j3dRSlM5PUVuvI
         TL823ka7/i+BeiTuyw4afyRhbZVVtC2/5B7TYEMHKvNrGxY46ztrASxWXMaaNCzLOky5
         EaRutV12jXIIwsONdT75MBnvlV8j0uOP7YRtXIXfdX8WFi/3/A6e1ZlC1/lOJtjJu51+
         p252UO1MzsVCNFD2PVn3AeWqVEJHCxBau3vGsUbVJsjd1WzgwE9e+RLLNUGh1oSyW+cL
         WbkHUft/a8no4JnLA1VKViCvP3u2mm3BADxneXgCIiTP1najdD5jUnUDuyApzgtGDVSf
         i/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2LRthBYH3plyRGRdELd90NdrMXuX6CtYeCD9OlWaRNY=;
        b=n+nrx770femkFAd8a8sTOo2eEw3dXkI1neTNUOfJ3GGdUziRCBzMF5L0oNxJJZdepo
         lariih68TaWbEVto2Ny9SZiffClsfJ90VzavQcHV0xUmHYQ/arLMfCiFPkq0JnPX5oI9
         migAwi8rQmplJZmONpKnsOxClCAgqVRejSPwcBTMk9elweu2JHf5qJ9bplqb/GaBbFVV
         a3RAVZTA2eevXYfRIdZrlUJdkANSpyHMffVqj0H44UEg59KpNDl0Oa3YeX6YHO6pKnJM
         LTvyAdRAHRuZkrls3twH+qEENfRnFFnMz4oyQaGwjQNMgkqIQyjkduezdGgcd0ukMwy7
         UCXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhqUF+Ff;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w25sor3281813otm.99.2021.03.09.08.22.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhqUF+Ff;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LRthBYH3plyRGRdELd90NdrMXuX6CtYeCD9OlWaRNY=;
        b=WhqUF+FfAtW2uKJ3oe2r6CJaDgeRBKSjGdDyy1KNVwEV/SsogVVNxVWrfbIQJ3xlAQ
         O4UiNc23+s9x1F6aPVHzBhOY70eWlTWBRvp0GFtyCpLao+0fwgojFdrnanIlA1/i37qB
         m8f+IAvhWhBLu1eYD/BLf9DXtZ7opHPW/IeMDzpToLMoh3mLGlC7awb3qnpZDqIo+JoQ
         JkjKYFSJHndtS3eALo5Y71HoPlkhN3mnRchZH11daCsi1RRQrrJY+8nXKqMY5aMLHKhi
         y2N2/FZ/5hdjU2YIrFb1OGvx9BXJJSZwrns455Vdik0+DRd05VmKxdVjVilibGkZhZxW
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LRthBYH3plyRGRdELd90NdrMXuX6CtYeCD9OlWaRNY=;
        b=l3lt/r+V+01D12XjZ4hAr7jcs2GLOzncFh0OfEHGu0MGjmPMdLo9hGVjmA24xLWSiJ
         9w2NSXbAEapMg2W36uQmV2GF0OcaX5ncYZ4GyFcrLtZPjddVZQwQ+Qn4Vgz79bv34m1s
         a1GKKpfTCORgkxcjiNhvV/plE/LuyGg7MJlvreDo9abAtVTvVeq6Ww7V52BKULN9D/ue
         L6TbYtp3D/3Ixc9NnYIcz30tLrMlkyr9+H49BculiukW7HGjeVRjAqe+Knc3oBU+GkUE
         2ComeABfZKqVNtZXXogkXPNnvZhYPmHrfMaJNRN9bNW9B2ehHgXQAKeIhRCqLDo+R6CA
         1cqA==
X-Gm-Message-State: AOAM5309zwBmiiklASdAFkhZIDWQd2Tm2zwXGY52zjRJzI/t1/D80lEV
	mHmL3Xlaec9xCK3F4X7Ivb015tU7
X-Google-Smtp-Source: ABdhPJyyeLV8UO0R8N2rjwBgXXgRTOhuynvMO40iD4pixUFWmtuBQPFrC3ifDuM+oXLe9QO4EC3NBQ==
X-Received: by 2002:a9d:a0a:: with SMTP id 10mr25057090otg.181.1615306950877;
        Tue, 09 Mar 2021 08:22:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 68/78] target/arm: Implement SVE2 FCVTNT
Date: Tue,  9 Mar 2021 08:20:31 -0800
Message-Id: <20210309162041.23124-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PIkpthwXzi7R

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c85cd85a0b..eedb70eb50 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2734,3 +2734,8 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9bf37e322f..2c38fe4691 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1573,3 +1573,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c406ae289c..b719a3aacf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7600,3 +7600,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6959cc9d9c..83fab9a6fc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8221,3 +8221,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1
