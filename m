Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956412lfg;
        Tue, 9 Mar 2021 08:22:39 -0800 (PST)
X-Received: by 2002:a9d:3a4b:: with SMTP id j69mr24661131otc.47.1615306959670;
        Tue, 09 Mar 2021 08:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306959; cv=none;
        d=google.com; s=arc-20160816;
        b=wBzZ6VHe8mCES3R7qc5q8ofaWLRyIJ4+mKURf7bUWhNKxeAEgeJryJTjNEr4bnk54S
         sNFuEc70wiPIptVNoFrP2f+6swmn9KPEcA3at5Yp7MMR7nyPK/NGD4K8iOK2weflf150
         fp5a08KBzngU/X5mGDVS6+4yVT/RSYkHc9E2DSBaJwr1JDavNvHN2vot+K4nMBRCowAN
         tHzNlYXHzhyv4u9Y/aCMhFUllOaoxDlFHvUF/0jjvaS/AQvjcwzGb52Un187A14Zt5NM
         jbT7POB7l0iOWX42D7lLHb8M1ARID0ldYAJNJVMikp+ge3Ss/Y1thryQ0DDgvCg4sSDp
         TVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LvTrM/eXKhblOjuZfTaVJavnaVQDrBaCdov+m5Ya39I=;
        b=Hh7PWmQ6fM96rzH0V5r97b0ztdrKUpKLZzDCi2WMbEeSt409BvzjxchJoCa6qRkvDo
         dEeoL8NtHr+yzJtCE6KvHyIVY2CVpkgMsryHr2nRAFmQjwkrSyEPVT+ln0VZMpB2zti9
         biv8wFXBtQxYczY2b3VcBjfGjqD3Lasj7Vn8cmyp2tSjFx+LOab5+Y+H6MDl+fqN071j
         h8SC4ZwPXf3fWs09ldEqE9fcplmlbY0DwcO45QyijNrv/OAfCcQtU2bBeDrIgF47tkIs
         VTSj0e4ovvE8GYPJfujstJ/QD5C4csVp04/UTQ0kd8jVjf4UtItNUHFYvi9ql0fnv0S7
         WfYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTqbY1oC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l1sor3367820otn.158.2021.03.09.08.22.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTqbY1oC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvTrM/eXKhblOjuZfTaVJavnaVQDrBaCdov+m5Ya39I=;
        b=wTqbY1oCNnPeKD7rceZHto++6npcutrPKfKgEq9223TW5NSPOt2VXCn/532Kf8zVSR
         h9LmKE5Z6ACm8DD4ya/QY/eTXuaVKiAmTI4sOuI2gr651tmHDmKftZQLEEHJK/b702g/
         rFz/mzJLl2mJ5mXbLdVvQ4SbmbsjcKhQ92ebvr0cIomffHcnHbt2O5qa7tKUlYxS88lv
         tfv84S66ZlNzCFIUJFz6v6Y1ZXX+8IGwwyFVrtAZsXybB0h8eMYnYAI49MH4hhpYvfOn
         /Q96xxDQuO8xD8ZIcmxBdqzXkzHyWF8QCbBArX3XVk+glKLnShzkMgdewdaclN6HZT7e
         xEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvTrM/eXKhblOjuZfTaVJavnaVQDrBaCdov+m5Ya39I=;
        b=SvVDCnWeuxiRoHYOwKb5W0BWZ0lSQ4XK5y1UV9DlRbxuQX2nE9yQgZ1qFjzHPVXaqJ
         +A1xz/uLxK7lWOObvRB1dBoIf9M9JogLP88y8M6tTjG/ihAcmv1vkcMqrbOKpKVD/iyC
         T/WdrSeIc2R5o7mUtLuAuezn0vUIXr3tWzl/ETvI+9hwvsh7rPbPWifnVkDiFbDry+Wh
         czGX2ofvY/hmQXNtUDWQlUqtiqs6ejSLelf9nTohfWl5JCkliOdNJuLGbYdmRH1JmzlT
         SOJJ6Zj9ruGq0U4+gHm04b0oHUOg7gBA9DRpz4H9ID7uxwwSe6WPH8vlf4dFja6ok9/1
         pspg==
X-Gm-Message-State: AOAM531FalcTwEe0ytwncfQ1/HYwtqkDuKXMU2C9T867jbJMpfMFLbHo
	5Nch06xtp49eoLhdNoHtqvTRltnf
X-Google-Smtp-Source: ABdhPJxjJSWSl7bGlxO06hl8UkrZ7pFAZcVdioCMX3X41oQ2bUAMy6Tfw8jqx0S0EZT4VbJEy+yDmQ==
X-Received: by 2002:a05:6830:1da1:: with SMTP id z1mr9808514oti.64.1615306959262;
        Tue, 09 Mar 2021 08:22:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 75/78] target/arm: Implement SVE2 bitwise shift immediate
Date: Tue,  9 Mar 2021 08:20:38 -0800
Message-Id: <20210309162041.23124-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: x67Xdb4GvLTY

From: Stephen Long <steplong@quicinc.com>

Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 33 +++++++++++++++++++++
 target/arm/sve.decode      |  5 ++++
 target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
 target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ddda7f35ed..43ee4238de 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2738,6 +2738,39 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_srshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqshlu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 78452d416d..f2a66a159a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -342,6 +342,11 @@ ASR_zpzi        00000100 .. 000 000 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSR_zpzi        00000100 .. 000 001 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSL_zpzi        00000100 .. 000 011 100 ... .. ... .....  @rdn_pg_tszimm_shl
 ASRD            00000100 .. 000 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHL_zpzi      00000100 .. 000 110 100 ... .. ... .....  @rdn_pg_tszimm_shl
+UQSHL_zpzi      00000100 .. 000 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
+SRSHR           00000100 .. 001 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+URSHR           00000100 .. 001 101 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHLU          00000100 .. 001 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
 
 # SVE bitwise shift by vector (predicated)
 ASR_zpzz        00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d879ffce9e..d08da9fdc1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2204,6 +2204,41 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
 DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
 DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 
+/* SVE2 bitwise shift by immediate */
+DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
+DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)
+
+DO_ZPZI(sve2_uqshl_zpzi_b, uint8_t, H1, do_uqshl_b)
+DO_ZPZI(sve2_uqshl_zpzi_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZI(sve2_uqshl_zpzi_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZI_D(sve2_uqshl_zpzi_d, uint64_t, do_uqshl_d)
+
+DO_ZPZI(sve2_srshr_b, int8_t, H1, do_srshr)
+DO_ZPZI(sve2_srshr_h, int16_t, H1_2, do_srshr)
+DO_ZPZI(sve2_srshr_s, int32_t, H1_4, do_srshr)
+DO_ZPZI_D(sve2_srshr_d, int64_t, do_srshr)
+
+DO_ZPZI(sve2_urshr_b, uint8_t, H1, do_urshr)
+DO_ZPZI(sve2_urshr_h, uint16_t, H1_2, do_urshr)
+DO_ZPZI(sve2_urshr_s, uint32_t, H1_4, do_urshr)
+DO_ZPZI_D(sve2_urshr_d, uint64_t, do_urshr)
+
+#define do_suqrshl_b(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_suqrshl_h(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_suqrshl_s(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, m, 32, false, &discard); })
+#define do_suqrshl_d(n, m) \
+   ({ uint32_t discard; do_suqrshl_d(n, m, false, &discard); })
+
+DO_ZPZI(sve2_sqshlu_b, int8_t, H1, do_suqrshl_b)
+DO_ZPZI(sve2_sqshlu_h, int16_t, H1_2, do_suqrshl_h)
+DO_ZPZI(sve2_sqshlu_s, int32_t, H1_4, do_suqrshl_s)
+DO_ZPZI_D(sve2_sqshlu_d, int64_t, do_suqrshl_d)
+
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ef2ca6a0b6..4002bc5ed4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1044,6 +1044,66 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
+static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Bitwise Shift - Predicated Group
  */
-- 
2.25.1
