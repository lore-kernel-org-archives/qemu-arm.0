Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp503771lfg;
        Fri, 30 Apr 2021 14:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWvfXAfFKfUwPBcFMDk0PJmIs5Q9oA0wxTDRS5hfExrdvXjWdM3ktGoD+uidC9DdXKXl/l
X-Received: by 2002:a02:c618:: with SMTP id i24mr6843231jan.15.1619817508720;
        Fri, 30 Apr 2021 14:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817508; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsGn1o/WJFCi9U12moGcqgKz3inEtzgBxbKLu9/VSjMVRpy4cnC1j6Xs3mCtYXMwnQ
         aPilRnSzgqpFtCJhu5Z+RTSg9rPVmmSUiWsL2PL6ejFIQG4C9rJqCUW7Aglofv4y3vrQ
         dXoIlIRy0nVCUCMwCMwSdD6KpscDmlESlyUT54gC8ag2RY5aS+YgXIAiFkp4RB595Dzx
         oOyaiSuuh4QZJL3U4LSnj1fVi2EF5WE8Y1xPOk5vRzLwm5Eh1+Z3WNYIhJjkfiyc6LQb
         K48kXlXlvyF5V0HmmcyXDjD6rozpkHZ6NUgkhlsyOS1uaao/SqQPMuuHR/FHu1CEHu0K
         h5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1m4KD6Jjgt61SLAO+2TZcBYwYJOymz2qy3ZggTsf0vg=;
        b=qcz5BiQFDorr9L7wmmmjpT1B/7ity+kEN81qtfSwetwCRw/miiVyFUSfST5qa2jDHG
         f3/YeGV9g3GV0i9VXHE7fVcL4lg6TI7WnjwzpxFFo1I0Gtnv/nFLZXoYuYX7UlmRF3RO
         aQh9MTZQBaeyD7aTai29WyPFGOtAsroDkz+RQ630kh21by49TJQB7v4IJwJMjOjIRUjN
         WGyCF5VeOX9doLIsvAmKr7GRhKXjnEy5CWbClM1ORvZ2zimrKKYxm854V9RJEHfKfeC4
         oaKzizht/XZcvNMBKTbrFd3jy+Fpk0MBMUQUw0g94rqpMOmyfSIzl4I9ezx95s9e8QDx
         8oIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xPYZFV/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si3911387ilo.126.2021.04.30.14.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xPYZFV/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaWp-0004Hq-V4
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmI-0004RC-T9
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:22 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007jM-7d
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:22 -0400
Received: by mail-pg1-x532.google.com with SMTP id i14so5682440pgk.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1m4KD6Jjgt61SLAO+2TZcBYwYJOymz2qy3ZggTsf0vg=;
 b=xPYZFV/tybMZlLV13BVsuTxoxUc2SR6uUZ2OHvY+2NBKo6/sgrI2+5NJXHfWau/JE8
 cM6vtI9cRnsuEnXPayE1ph9zL+bziSTV4y30lkikeZEtXVRvoPCeDiVnM+w4TILFvmW5
 QxODNp4KOI9EYDWP2I4GB7PdVGwV8T3lyKkcNb/gidtuexlLNSPtobZWnG0/TP22JlAc
 VTJTvXn2/hjz5VSABqGUMdzckwLwcTZvIqCOzZN4Kpd66RrH6wFYULMmrIFWdRoP9jT/
 LNqeyXbX5oSpVr/PV8pf4VdKqeSWGfJWmVhyFFPbH0NUT9pYoTrZh3xBBlBQUrRFlYFF
 ejPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1m4KD6Jjgt61SLAO+2TZcBYwYJOymz2qy3ZggTsf0vg=;
 b=MOyFtw4Td1my9LHjDstjrWZm4Qd1ifJ1f/y74c4qzFKrSsjgZDcS8+whnThLM9f8ct
 +UTcsd3RWcX6oRlAmPCuzC8hKh9qayMpodaVYuVtRIlvFMdeegWPSEoOdQcUWBFLtmcg
 f+76Qgxo6M+OF7JjbLJt3VmkOcu5gGSN2l5hannWJzzxi6PWd4T+jeeONQxj9DWcicjr
 tOaYtkAhqtcynoB2hNIalWyQ9tERw3aLx16tXQOXiLYpn+GFbggcNSkLCV5260wxtwSx
 GAYeb5AiTBp/IszgQuUMIw4fZEaYNaviLBAKzm9NVmyqSw8bXStXX+yriUOAlIlmJbtL
 zY1A==
X-Gm-Message-State: AOAM530t8Ih+JwCzIEgmHI6lnztJhCtiuxexVhy3zVl7Z23hUTzxZXtj
 Gp+dNT7ej56WMOWjlrtlZmG3YouD+pmY/Q==
X-Received: by 2002:a62:1d8a:0:b029:24c:4aa1:ad01 with SMTP id
 d132-20020a621d8a0000b029024c4aa1ad01mr6385504pfd.27.1619814584739; 
 Fri, 30 Apr 2021 13:29:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 54/82] target/arm: Implement SVE2 saturating multiply-add
 high (indexed)
Date: Fri, 30 Apr 2021 13:25:42 -0700
Message-Id: <20210430202610.1136687-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45fUj8XrzEgI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 +++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7e99dcd119..fe67574741 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2665,3 +2665,17 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(fmmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(fmmla_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9bfaf737b7..1956d96ad5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -791,6 +791,14 @@ MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
 MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
 MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
 
+# SVE2 saturating multiply-add high (indexed)
+SQRDMLAH_zzxz_h 01000100 0. 1 ..... 000100 ..... .....   @rrxr_3 esz=1
+SQRDMLAH_zzxz_s 01000100 10 1 ..... 000100 ..... .....   @rrxr_2 esz=2
+SQRDMLAH_zzxz_d 01000100 11 1 ..... 000100 ..... .....   @rrxr_1 esz=3
+SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
+SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
+SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f285c90b70..fc4a943029 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1487,9 +1487,49 @@ DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
 DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
 DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
 
+#undef DO_SQRDMLAH_B
+#undef DO_SQRDMLAH_H
+#undef DO_SQRDMLAH_S
+#undef DO_SQRDMLAH_D
 #undef do_cmla
 #undef DO_CMLA
 
+#define DO_ZZXZ(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);     \
+    intptr_t i, j, idx = simd_data(desc);                               \
+    TYPE *d = vd, *a = va, *n = vn, *m = (TYPE *)vm + H(idx);           \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {               \
+        TYPE mm = m[i];                                                 \
+        for (j = 0; j < segment; j++) {                                 \
+            d[i + j] = OP(n[i + j], mm, a[i + j]);                      \
+        }                                                               \
+    }                                                                   \
+}
+
+#define DO_SQRDMLAH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_D(N, M, A) do_sqrdmlah_d(N, M, A, false, true)
+
+DO_ZZXZ(sve2_sqrdmlah_idx_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_ZZXZ(sve2_sqrdmlah_idx_s, int32_t, H4, DO_SQRDMLAH_S)
+DO_ZZXZ(sve2_sqrdmlah_idx_d, int64_t,   , DO_SQRDMLAH_D)
+
+#define DO_SQRDMLSH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_D(N, M, A) do_sqrdmlah_d(N, M, A, true, true)
+
+DO_ZZXZ(sve2_sqrdmlsh_idx_h, int16_t, H2, DO_SQRDMLSH_H)
+DO_ZZXZ(sve2_sqrdmlsh_idx_s, int32_t, H4, DO_SQRDMLSH_S)
+DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
+
+#undef DO_ZZXZ
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4fdec08f46..d9d444d3ca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3887,6 +3887,14 @@ DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
 DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
 DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
 
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
+
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
+
 #undef DO_SVE2_RRXR
 
 /*
-- 
2.25.1

