Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4049102lfm;
        Mon, 24 May 2021 19:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGcxJTavatJYqRkVawC0Ix+7XU28IO6WnalseTvf7Enl1PiTkZ4D8huh0ewmcPSCEiNw2t
X-Received: by 2002:a05:6102:c2:: with SMTP id u2mr23892692vsp.33.1621908202471;
        Mon, 24 May 2021 19:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908202; cv=none;
        d=google.com; s=arc-20160816;
        b=Sq5fLj//XU7r+v00L8QpEm+2jo3Rx6umN9x+2n1zMJdUCvcF5+yVdd1GJzmnNKHWLm
         HBJcNVcD9/a3iTr/1255c7eRKrD9D7kze1TuhVvCS25PySSbf9eZSLg53HjX0Nmvh456
         t2w6z/FgL0lxoijQNsf3Ks5t05sJRaxeG8pSL8VOHi+ZhyoXmDrzcjEMenvoI/4jlJsw
         s5SD78VsuHkjWx6s0OQ6ETDosNk5a78+ikeHPsgIzbfY/FQju/Hk/wiRYRk8f3oqn5F1
         ECc1bbFrvCEBcWVair8bfNV5ZKZGLhpKU4Ck24E7XhauLJLZr6GBRzczYQCUjmhB9z2p
         GJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TSJhIg/oEj78OAJlzsUKkaERruGiMdx8U7Tjdyc3i70=;
        b=v/R76XWZquiUnS/kxQ5Wst8SP4GNU3T/6P678AO55XEdJ82jv/jy8Dn/KwjZtNXonq
         LaQ8JBiDwJTbNc0+EDuC7ETaM9Di4iL9nqGZAfJDLMnrxyFiCfMLIAVhCGtwFK3GmECy
         DEs15oilkhlaVsjwswDZzzaU/60t9mB8LxfFayBwWXb1Em7Lq7hh/NWkp4QFvq73pd0K
         DteqM1dpNkvElPROkzjksGvWbhzjxHeBsW+vMVw56qx5wk8msvVSwqvFtJWFIxsSggO/
         NEpApo49HEP11SAX/4Cmxnr4n4l5tkuIhZMWd9QnrQKwAw/nqA77E7bhk3RrcepEUsYf
         EXjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UpeH7HGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si6010142uap.73.2021.05.24.19.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UpeH7HGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMPh-0001SZ-P9
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYJ-000087-Oy
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:11 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00045z-P1
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:11 -0400
Received: by mail-pg1-x529.google.com with SMTP id e22so5665271pgv.10
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSJhIg/oEj78OAJlzsUKkaERruGiMdx8U7Tjdyc3i70=;
 b=UpeH7HGx3DEoqpbxxdl1btOB4yS91c6cBOZqmH9T67vPVoRYtEG2lk0stVvr4eHB4R
 A3RUnM8VcuCwo0Y4M+C0aBSr7cvIWWjPBiPsyCYHjexbcFmoNJvKC0tJAkIVAxAxGKk7
 Mh6jTMflxELLGyMjqr4GqWso3tJTIpABwhvbVRRmXXD9FkiQY/GPJP7ZVpt3l+BWKo2l
 3/Prs35f38DYZlFWHKliSxB+FKtXNmOWDb6zKTR9aJGIiH4N3L5UHPtGSFYau8IZDher
 jUSkLQa4GbIopGRbhPx63BgAIDrRiqd39J8O9ntisURDsnwhmVYbH7SYJixgOdd2gTcU
 /dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSJhIg/oEj78OAJlzsUKkaERruGiMdx8U7Tjdyc3i70=;
 b=ikUT+O8v2o3VPilfEHXhYE/xO3GtqRjEEnI9uOPYo/KNBK29qrMqB+nWDFBFezc7Vd
 PSmXEYteI4Fy3bpXf6o/DmO12+R6+jBvNOkd5bxgnH11gTcYvAMl+mCkxnkEEzlpshhN
 zsd9RWi5Q0bmHQixqlddb15IIYYvPShbcdh99hUiOas4fmIrQcLlM9PGzCWqXeNxL75m
 4Zo29TNaChWtiKuXAcdQm7S5dpZZrp8ThHPV9/qk1aA90V2vW6vWgufSzPefYtJmX4dQ
 fMk4dhkWfeKu18CMPbd+pcrno8znH05Xt27HVPwXd3ZCI+5T9dql3venjO8cIWo3sM9i
 v9tQ==
X-Gm-Message-State: AOAM530r5+FfJqowyU2Zg+hfTDjqSpxvWfsFNSd3rADURivLzkrDYJZf
 RxYr7QOTYvNrh7NuDi4/vi6yOQ==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr16266249pgb.178.1621904859504; 
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 65/92] target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}
Date: Mon, 24 May 2021 18:03:31 -0700
Message-Id: <20210525010358.152808-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: fllFlD1o4ib6

We're about to add more variations on this theme.
Accept the inner loop for the _h variants, rather
than keep it unrolled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_helper.c | 160 ++++++++--------------------------------
 1 file changed, 29 insertions(+), 131 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index cddf095c74..1c4266a9c0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -569,139 +569,37 @@ DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
 DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
 DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
-void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
-    intptr_t index = simd_data(desc);
-    int32_t *d = vd, *a = va;
-    int8_t *n = vn;
-    int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
-
-    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
-     * Otherwise opr_sz is a multiple of 16.
-     */
-    segend = MIN(4, opr_sz_4);
-    i = 0;
-    do {
-        int8_t m0 = m_indexed[i * 4 + 0];
-        int8_t m1 = m_indexed[i * 4 + 1];
-        int8_t m2 = m_indexed[i * 4 + 2];
-        int8_t m3 = m_indexed[i * 4 + 3];
-
-        do {
-            d[i] = (a[i] +
-                    n[i * 4 + 0] * m0 +
-                    n[i * 4 + 1] * m1 +
-                    n[i * 4 + 2] * m2 +
-                    n[i * 4 + 3] * m3);
-        } while (++i < segend);
-        segend = i + 4;
-    } while (i < opr_sz_4);
-
-    clear_tail(d, opr_sz, simd_maxsz(desc));
+#define DO_DOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);                            \
+    intptr_t opr_sz_n = opr_sz / sizeof(TYPED);                           \
+    intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);                  \
+    intptr_t index = simd_data(desc);                                     \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m_indexed = (TYPEM *)vm + HD(index) * 4;                       \
+    do {                                                                  \
+        TYPED m0 = m_indexed[i * 4 + 0];                                  \
+        TYPED m1 = m_indexed[i * 4 + 1];                                  \
+        TYPED m2 = m_indexed[i * 4 + 2];                                  \
+        TYPED m3 = m_indexed[i * 4 + 3];                                  \
+        do {                                                              \
+            d[i] = (a[i] +                                                \
+                    n[i * 4 + 0] * m0 +                                   \
+                    n[i * 4 + 1] * m1 +                                   \
+                    n[i * 4 + 2] * m2 +                                   \
+                    n[i * 4 + 3] * m3);                                   \
+        } while (++i < segend);                                           \
+        segend = i + 4;                                                   \
+    } while (i < opr_sz_n);                                               \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
-    intptr_t index = simd_data(desc);
-    uint32_t *d = vd, *a = va;
-    uint8_t *n = vn;
-    uint8_t *m_indexed = (uint8_t *)vm + H4(index) * 4;
-
-    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
-     * Otherwise opr_sz is a multiple of 16.
-     */
-    segend = MIN(4, opr_sz_4);
-    i = 0;
-    do {
-        uint8_t m0 = m_indexed[i * 4 + 0];
-        uint8_t m1 = m_indexed[i * 4 + 1];
-        uint8_t m2 = m_indexed[i * 4 + 2];
-        uint8_t m3 = m_indexed[i * 4 + 3];
-
-        do {
-            d[i] = (a[i] +
-                    n[i * 4 + 0] * m0 +
-                    n[i * 4 + 1] * m1 +
-                    n[i * 4 + 2] * m2 +
-                    n[i * 4 + 3] * m3);
-        } while (++i < segend);
-        segend = i + 4;
-    } while (i < opr_sz_4);
-
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
-    intptr_t index = simd_data(desc);
-    int64_t *d = vd, *a = va;
-    int16_t *n = vn;
-    int16_t *m_indexed = (int16_t *)vm + index * 4;
-
-    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
-     * Process the entire segment all at once, writing back the results
-     * only after we've consumed all of the inputs.
-     */
-    for (i = 0; i < opr_sz_8; i += 2) {
-        int64_t d0, d1;
-
-        d0  = a[i + 0];
-        d0 += n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
-        d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
-        d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
-        d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
-
-        d1  = a[i + 1];
-        d1 += n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
-        d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
-        d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
-        d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
-
-        d[i + 0] = d0;
-        d[i + 1] = d1;
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
-    intptr_t index = simd_data(desc);
-    uint64_t *d = vd, *a = va;
-    uint16_t *n = vn;
-    uint16_t *m_indexed = (uint16_t *)vm + index * 4;
-
-    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
-     * Process the entire segment all at once, writing back the results
-     * only after we've consumed all of the inputs.
-     */
-    for (i = 0; i < opr_sz_8; i += 2) {
-        uint64_t d0, d1;
-
-        d0  = a[i + 0];
-        d0 += n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
-        d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
-        d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
-        d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
-
-        d1  = a[i + 1];
-        d1 += n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
-        d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
-        d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
-        d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
-
-        d[i + 0] = d0;
-        d[i + 1] = d1;
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
+DO_DOT_IDX(gvec_sdot_idx_b, int32_t, int8_t, int8_t, H4)
+DO_DOT_IDX(gvec_udot_idx_b, uint32_t, uint8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_sdot_idx_h, int64_t, int16_t, int16_t, )
+DO_DOT_IDX(gvec_udot_idx_h, uint64_t, uint16_t, uint16_t, )
 
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          void *vfpst, uint32_t desc)
-- 
2.25.1

