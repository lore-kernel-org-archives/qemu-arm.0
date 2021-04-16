Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp751016lfr;
        Fri, 16 Apr 2021 14:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp2vhjO6eWlyjWRHHk0vfZoA/X5FhNS0LPTR2tt8EnhP2f1YD1qh3lEhd+ZxwkXj3h9ekF
X-Received: by 2002:a5e:a515:: with SMTP id 21mr5251076iog.164.1618609709287;
        Fri, 16 Apr 2021 14:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609709; cv=none;
        d=google.com; s=arc-20160816;
        b=AULUkzPdXsQxHJL4NSwQzJq9o4zHXcwvVstzKJYCTWhmK2WGeqFBMtUXVy7gFqp1+x
         5CTHlSorhcpfnMqda4B2/F02Dt5RisMbrlJicokF9R/TTk5+NjtzI9zwh4rr5NPmq3+e
         zK2mwqjWq0np/mQQbWzGzS7JfLuIsSPZ3cUwlRV9EAx5AaqiQzS/sLjMcB052sof6mVX
         5UptdcpFoHd3YvoXTpdJ4NwLsQp29JIx0G5lSg1yZsYtCnUXjN9Q/0+7N1zQJ3OX2LNs
         y5tUJjHUwSh40iZKlm47dEAF+FLGPx20p98mZ3ZOZgcbiaeCk9EAVfZbw+yIk5/kNXd4
         XAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YSDZDgwTisSXoeVIgFgCvP0NdTqkSYat+07hmk+/QA8=;
        b=D/sqtAC7UthiRw3eQk8FOs98OD/qYEgQ50h8T/PXBiWj3WW1x1aUe6K+kflAQCotYo
         IZOAkC0Q92Rk0OCb3cYrRXfaRo+OsW0tiD3Hb8lxQsh3x1Sb/uRrPHixjv8x4VF9LbJE
         CBgUYbHWNO9yBh4qgu7eCZ/sjiXvF32M/l2XFn7kmf6F4IToT99QmD5rI//Wp6EEA1GX
         jpZdpDb/e14DAKfhSCPs8HmkyvvwRzNVnev8CVQgTubWSBMw5P3ySOoDOgTkaORvkeeO
         wl2vBU/ttHKa8QfqBo2tUXC+3tj4JnH/23fwsh3N+YFJiMzWjR+WrchBUt43RYC8PdbK
         1lew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jiQnotNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si7872831jak.24.2021.04.16.14.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jiQnotNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWKC-0002fO-H7
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVde-00064d-BE
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdK-0001iG-Ub
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w8so15667080pfn.9
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSDZDgwTisSXoeVIgFgCvP0NdTqkSYat+07hmk+/QA8=;
 b=jiQnotNJe9Ot9+i+JZAtEZhnqvsjm7J8JHZm5VjcPBzuUzmjsS3fjghrHawXwv5gfy
 lgPIBMTqISjVdYHaCaNYRXxO+vqM2tEcigpPWILkBMoKI583r1PvM25D08K7zhBFI4W6
 EKPEASrmK+HczxWWMn2zwS9HBxgD0eHtJIPMjC9Zm8GWDWPALQh+9bjQpHgAUKUF666b
 oLVOXOqxJslwVeJY2QDufBJrIOZIwZo8SuxqVbW8AIbVA0NJdDuVdMMXDLF25sPqYcBW
 o6HIa/hroBrDC0jtBE+qCJ4nmE0EP6/x7mkp7bxBICIES4eZB2P2FkKy6MNnVpkira4X
 qafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSDZDgwTisSXoeVIgFgCvP0NdTqkSYat+07hmk+/QA8=;
 b=Fw1uS5Qauq5qfqC2myOQ+scs/VlW3pFSH52VTkME9DPLAWWqQibHYcKlpPF//NLfCX
 IEBdi3gmxQHvQuBuDwgjZKJDtaqXihclh62Y4wMCsagnrzJF6LpMTc4flacqyq0i8aTc
 fwk8JvF0yxx2DaISd0w6fzgpV2oKSTqw0MU/tkY+ZO34YkcBr+scqVtXy/U0DMaXL3sn
 iYuhkhNChrM8qdtopgn1M5vrKoRqrCTxOoorOh1BhcED+x6SpSc/QMGA6U4Bgiret/rS
 +OXmG4rSEsNMIJLlycXlmRazztxfwsW/KtNabBXAssnjFcqESUpcmOZ5YHHyf/WZtXk4
 fzlw==
X-Gm-Message-State: AOAM532XM/GJiguL6ZAcZOhCs2SA4Sx3mVDph9tdqepi1uz+uQ5InFCh
 8n0D8LNPOfb3KgJfjNRRsoInUA==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr796647pgm.363.1618607045307; 
 Fri, 16 Apr 2021 14:04:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 54/81] target/arm: Implement SVE2 saturating multiply-add
 high (indexed)
Date: Fri, 16 Apr 2021 14:02:13 -0700
Message-Id: <20210416210240.1591291-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: qQHcU0NQBg0q

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
index 25dadabe28..42d8582707 100644
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

