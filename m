Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956216lfg;
        Tue, 9 Mar 2021 08:22:24 -0800 (PST)
X-Received: by 2002:a9d:6c18:: with SMTP id f24mr17501020otq.117.1615306944333;
        Tue, 09 Mar 2021 08:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306944; cv=none;
        d=google.com; s=arc-20160816;
        b=T+F06IRXsVJYFT7ha8pNLc3jj35xouaCPNOojqv30EiURqLN3t3K4moXTv2M916IhB
         p4PpnvXYAkioLz5jiG0t8sV15XI5RMYPLrdP928+8Y5rc7o5CrFcOLP9EY4kZPfFfagH
         ivc6ryte77aew5zj9DCt9u3nJbzZZP2l2ym02D6gUMDBPRR/q5ftceAjGhb5Ip9524gE
         AqU09/gAor8gdnOxn4w6TSFJqtLCZS6aave9Id5kbbtwT/GazpcmhhRCvIizRmZDBWb0
         pnob2W0P88KPx+vbQLMuq95DNuVRfoo4kw/9MADa8nmIz5dgicYuKEljbuTryPBa6lWl
         WcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HqfAKqJRxXesCfGA44gwR9XW/bgbySRjf69IpODQuuc=;
        b=gBERHtaDiCJGA261VIKdg32HCI43k7n7KwudyrFroVsXiEj/AofD8hLQ4IoYBunFcE
         Ty48DjPI/HCqFH9lU7ZQOhsUqkhYRzY701lNSNzfZZIZWDCTfWuDXmupNSxdzmTqwZgd
         Qw/aT6ZJff2H4BpNbDyLNU7QUX7gzA+IgXLn8wksiSFPczCg6P2m5ceCpHuWikPClNHD
         x4QsFkh2/Zewhypg75uBvHRz0iRUq/e3QnZ0K+bAtFl+vY2G1UZKUXZY5m1umoMibnmO
         Gn2AXsRq+Th63a7eiynTdNmF6eowkv/TobgatJeaw5k+fcegF5oKZzHnosUTtAqH4VhM
         WVeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYGlgVBa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g17sor2171692otn.15.2021.03.09.08.22.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYGlgVBa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HqfAKqJRxXesCfGA44gwR9XW/bgbySRjf69IpODQuuc=;
        b=BYGlgVBaECI92X/MxzkpS6XxpHpgEKgZ+OUA4/tJZ/u69SJdyJBaQxkHrfZ3um9q6h
         tO/ZyVXjfQ1hFAiy/BJ8s0JdMn2mmxI1pcH6V8cfY1XDx/hyi2aJsNMN6ZhKceI25QOj
         wXkYarbJ4Vy2S6LI/JgMQr8NmUq9YK1IrYBVMJ/8yM3fgOADGPwdkN0VQuhOz1rEHMvg
         V9BDZ/amZPuhstfRE7A6hfHcw9II/EGw2IzfZeArZNNalGUSWCAbAn88MOnelims4xMd
         WhvsHFnVytAddXwTTntqgDaCssPYgfirk2BY7zOAEG36dnuE8eZUhChuvn/WWmon9lZm
         mrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HqfAKqJRxXesCfGA44gwR9XW/bgbySRjf69IpODQuuc=;
        b=M+2X5f2FArMmVO8s2dkcmrMgb4MjfAd9Sr77EH2gN9xRURju97r0iAAMBs8sPjC+YL
         9cuDWlP3Guz1bQz834rgkDraDDSTQtV1NFv+U//2/THuEueiYKQNMK+GWoAwg51Y+K8i
         wzTMagoipJh/fUX1FS5U4HSPYUvVvOfpfddMP1XKIINXRL/THTu4NmbxAUcq8EWTb4Ul
         X7/Dcj6JtwFKQSfMMaVgjBU9gVYuIc0Msb/qLepzq7AzmrX2/Cv905mhFCFROZ6Tgo1T
         Ppgbt2usQiq/WzznwCsvxZvLkLts/Qx0ymN31LNbSvaYHLUK7mNTH/phr+CO1puzy+Vq
         8vtw==
X-Gm-Message-State: AOAM532UzCT3Dzq/058u3HI2ZrjjezJ+KXWRpHz20l/5SteQq4O2SOuB
	oCxijF7OiSw2vcochFpccFIiSynp
X-Google-Smtp-Source: ABdhPJwDpfEpkAAbBK0Vkujn691wKLNPH0Db97ZwBu/UMNzDOaLHbI3qIKaNEIfir4Kz57Fci+iNvA==
X-Received: by 2002:a9d:70c9:: with SMTP id w9mr11116233otj.62.1615306943932;
        Tue, 09 Mar 2021 08:22:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 62/78] target/arm: Implement SVE mixed sign dot product (indexed)
Date: Tue,  9 Mar 2021 08:20:25 -0800
Message-Id: <20210309162041.23124-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TPXi7GcLM6NP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 target/arm/helper.h        |  4 +++
 target/arm/sve.decode      |  4 +++
 target/arm/translate-sve.c | 18 ++++++++++
 target/arm/vec_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3f19c4cbed..8c84bfb62b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_f32mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
diff --git a/target/arm/helper.h b/target/arm/helper.h
index e7c463fff5..e4c6458f98 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -621,6 +621,10 @@ DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sudot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9117196352..499d989087 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -815,6 +815,10 @@ SQRDMLSH_zzxz_h 01000100 .. 1 ..... 000101 ..... .....          @rrxr_h
 SQRDMLSH_zzxz_s 01000100 .. 1 ..... 000101 ..... .....          @rrxr_s
 SQRDMLSH_zzxz_d 01000100 .. 1 ..... 000101 ..... .....          @rrxr_d
 
+# SVE mixed sign dot product (indexed)
+USDOT_zzxw_s    01000100 .. 1 ..... 000110 ..... .....          @rrxr_s
+SUDOT_zzxw_s    01000100 .. 1 ..... 000111 ..... .....          @rrxr_s
+
 # SVE2 saturating multiply-add (indexed)
 SQDMLALB_zzxw_s 01000100 .. 1 ..... 0010.0 ..... .....          @rrxw_s
 SQDMLALB_zzxw_d 01000100 .. 1 ..... 0010.0 ..... .....          @rrxw_d
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 371e8cf05a..6f80c944d3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3838,6 +3838,24 @@ DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
 DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
 DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
+static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,
+                        gen_helper_gvec_sudot_idx_b, a->index);
+}
+
+static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,
+                        gen_helper_gvec_usdot_idx_b, a->index);
+}
+
 #undef DO_RRXR
 
 static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8b7269d8e1..98b707f4f5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -677,6 +677,74 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_sudot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    int32_t *d = vd, *a = va;
+    int8_t *n = vn;
+    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
+
+    /*
+     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        uint8_t m0 = m_indexed[i * 4 + 0];
+        uint8_t m1 = m_indexed[i * 4 + 1];
+        uint8_t m2 = m_indexed[i * 4 + 2];
+        uint8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_usdot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    uint32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m_indexed = (int8_t *)vm + index * 4;
+
+    /*
+     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        int8_t m0 = m_indexed[i * 4 + 0];
+        int8_t m1 = m_indexed[i * 4 + 1];
+        int8_t m2 = m_indexed[i * 4 + 2];
+        int8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
 {
-- 
2.25.1
