Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368359nji;
        Wed, 11 Sep 2024 19:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkeRJdO6u/U7nH0awitDlVc34VLrF5HuEXMs/1y5InJLMiyN3EGDB0bvY7brL3s0h67Bqkpjp4Qx8Fhg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+FxsZfQJhojeKJLzvMgkKy0Dak5SHvMkPZ5n0+10T+1sOtdSOwdrE+BMfopGmpYOd0pRN
X-Received: by 2002:a05:620a:2910:b0:7a9:9ed7:b49f with SMTP id af79cd13be357-7a9e5f3f454mr175941185a.38.1726109006954;
        Wed, 11 Sep 2024 19:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109006; cv=none;
        d=google.com; s=arc-20240605;
        b=c9NbBz3d1zuWcuRRoreCsccXKFBNGhGH0dJvpH9LkOOCfjdyu1o/8bCz20PFGQ8+x4
         q38RD42+i+AjIFnHk7EfkSc83GR9szqIDP8B4kjf0gpms3F2QvimsQ1ieXi1gGUpVnr1
         6dHAU9w0gIp4KCeIRfeONyIh9tlXw1UYnWYK899QwW75uCKu0EvPOqOmY/XUfeGhhS3U
         H0MdwnNkfzEZmA1FxAB656FQTi5ujKqQzSM1LK4veyVQeBsOK0p/CXhBHRiDiLlQNEHl
         OZYscHl0hLFUuWxM2QfkfupPt/5o6gCmkAUpfvUajEbBa/Vk7YDBLPQge3TOzS4S5DGI
         ydrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VN/OyWZOlf14GGid3MwJllcvvXpFY2jXHANTDkgK01A=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=lmmQxfkxmo7yz+GkiHV94IzWZl+YhIRwzYb1FAIL3Z6SCpydfMc4Mu6Dm5AaP159p9
         W0uA/TSWxptZoEiGdcauC7RsGZJxFlqkCfbrDavXIxPyXZgIBn3dYz49E47urKc+IjLR
         m9QreHdqapH8y+8vaX87MxyylPEFFpZUO7jUaleMgzoEVXajIquevYUe45fPf/XA0tHo
         T7tNJ9kRz+jicA1kmEGixO12uWK2l9KM4etEMIOeXWDlXHmllO1LURECG1ZoWgZAduGs
         GXuZNXU6wH3WgjvV3JMOFF7eZ/wdZp1LesYriM0DSiCC3yRSfYWR7EMsUoXSeLdm5eAA
         VPDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAt4d7fp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4582302879asi117423531cf.801.2024.09.11.19.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAt4d7fp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZmF-0004Gn-Lf; Wed, 11 Sep 2024 22:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm7-0003X1-Ef
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:39 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm5-0004El-NU
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:39 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2059204f448so4855585ad.0
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108896; x=1726713696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN/OyWZOlf14GGid3MwJllcvvXpFY2jXHANTDkgK01A=;
 b=TAt4d7fp5ert/ZzRYCNXI2CvVF/xkCLvLOYhufWrgdahXWLS09SG1a58cj7IJNfIIo
 hHbqNd+KC/sFG+JdaeMxYPPzgJihOjcSvFg8SyUSc0F1zhyXx92lx74PS5FHHwlmV8Xh
 ylNbrAODIUBjj5w/1tcipSTFGw/lfr8YHivDMond2562OjnYEnqbX+2rFSw+jJ9Ar4Df
 CX6H7ahSKH25VKGH1xEG3H/eX9H9QIdPDD7BkZOEmT6t0DQ6+SpUofxqkQnd/CyQT44m
 1rfQrVWZFlhSXd9GpVodTI5nQf1TJSljvrDX/Wb0jIbZuxbmAu6VUlT8wjOZUuuIKtyM
 BmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108896; x=1726713696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VN/OyWZOlf14GGid3MwJllcvvXpFY2jXHANTDkgK01A=;
 b=infOb/6e6K5lva/ms4QrcSMPqBG5+BNl5PvJ5fRPnpDb37hvivotgNU+6aUZojWOxZ
 FbqMS6Z4N3o+UqVJIpIWcy5ce6E1FbDzz8jRY4fAvr5zrprh5e275ktirklsHKHIzuY6
 5sojcjpScqFYHWI+omaWMHflhL3JikPK7BDpusPiCbZaKExboqqc0/4hLcuCb15VxiPc
 /v1FHEuaI+iu1m8v4wMQaI6hCiHkNNaWlo9DxUtmFOMPKsY0APVcBKBFFi/ExfFkU8eL
 rs2IDmJGCcBuXOvbFW8RasTzMorTX2DVMmV9+FXrDrlKgVqw1gBev+inysGCniKgF3JX
 g8mA==
X-Gm-Message-State: AOJu0YwwD2e88ephzbxtvnnDcJWHFFyBW9qprRjnojQetPQ0GxCsGEnP
 1riEoyXWZXC6FHrFg24X6POY2mDA/RBfTPEwDcx08UsEx3jXQ34jM8aoexfp6nVYRIlvsevU3rZ
 s
X-Received: by 2002:a17:902:cecd:b0:206:b960:2e97 with SMTP id
 d9443c01a7336-2076e4128femr20234995ad.45.1726108896358; 
 Wed, 11 Sep 2024 19:41:36 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 22/29] target/arm: Convert SHRN, RSHRN to decodetree
Date: Wed, 11 Sep 2024 19:41:07 -0700
Message-ID: <20240912024114.1097832-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lYcqzcd5epIu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 95 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  8 +++
 2 files changed, 55 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f4deacd554..8871087af0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7091,6 +7091,51 @@ static void gen_urshr_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
     }
 }
 
+static bool do_vec_shift_imm_narrow(DisasContext *s, arg_qrri_e *a,
+                                    WideShiftImmFn * const fns[3], MemOp sign)
+{
+    TCGv_i64 tcg_rn, tcg_rd;
+    int esz = a->esz;
+    int esize;
+    WideShiftImmFn *fn;
+
+    tcg_debug_assert(esz >= MO_8 && esz <= MO_32);
+
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    tcg_rn = tcg_temp_new_i64();
+    tcg_rd = tcg_temp_new_i64();
+    tcg_gen_movi_i64(tcg_rd, 0);
+
+    fn = fns[esz];
+    esize = 8 << esz;
+    for (int i = 0, elements = 8 >> esz; i < elements; i++) {
+        read_vec_element(s, tcg_rn, a->rn, i, (esz + 1) | sign);
+        fn(tcg_rn, tcg_rn, a->imm);
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, esize * i, esize);
+    }
+
+    write_vec_element(s, tcg_rd, a->rd, a->q, MO_64);
+    clear_vec_high(s, a->q, a->rd);
+    return true;
+}
+
+static WideShiftImmFn * const shrn_fns[] = {
+    tcg_gen_shri_i64,
+    tcg_gen_shri_i64,
+    gen_ushr_d,
+};
+TRANS(SHRN_v, do_vec_shift_imm_narrow, a, shrn_fns, 0)
+
+static WideShiftImmFn * const rshrn_fns[] = {
+    gen_urshr_bhs,
+    gen_urshr_bhs,
+    gen_urshr_d,
+};
+TRANS(RSHRN_v, do_vec_shift_imm_narrow, a, rshrn_fns, 0)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -10496,52 +10541,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
-/* SHRN/RSHRN - Shift right with narrowing (and potential rounding) */
-static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
-                                 int immh, int immb, int opcode, int rn, int rd)
-{
-    int immhb = immh << 3 | immb;
-    int size = 32 - clz32(immh) - 1;
-    int dsize = 64;
-    int esize = 8 << size;
-    int elements = dsize/esize;
-    int shift = (2 * esize) - immhb;
-    bool round = extract32(opcode, 0, 1);
-    TCGv_i64 tcg_rn, tcg_rd, tcg_final;
-    int i;
-
-    if (extract32(immh, 3, 1)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    tcg_rn = tcg_temp_new_i64();
-    tcg_rd = tcg_temp_new_i64();
-    tcg_final = tcg_temp_new_i64();
-    read_vec_element(s, tcg_final, rd, is_q ? 1 : 0, MO_64);
-
-    for (i = 0; i < elements; i++) {
-        read_vec_element(s, tcg_rn, rn, i, size+1);
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
-                                false, true, size+1, shift);
-
-        tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
-    }
-
-    if (!is_q) {
-        write_vec_element(s, tcg_final, rd, 0, MO_64);
-    } else {
-        write_vec_element(s, tcg_final, rd, 1, MO_64);
-    }
-
-    clear_vec_high(s, is_q, rd);
-}
-
-
 /* AdvSIMD shift by immediate
  *  31  30   29 28         23 22  19 18  16 15    11  10 9    5 4    0
  * +---+---+---+-------------+------+------+--------+---+------+------+
@@ -10564,13 +10563,13 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x10: /* SHRN */
+    case 0x10: /* SHRN / SQSHRUN */
     case 0x11: /* RSHRN / SQRSHRUN */
         if (is_u) {
             handle_vec_simd_sqshrn(s, false, is_q, false, true, immh, immb,
                                    opcode, rn, rd);
         } else {
-            handle_vec_simd_shrn(s, is_q, immh, immb, opcode, rn, rd);
+            unallocated_encoding(s);
         }
         break;
     case 0x12: /* SQSHRN / UQSHRN */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index bf67f8a357..164ed575b9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1277,3 +1277,11 @@ SSHLL_v         0.00 11110 .... ... 10100 1 ..... .....     @q_shli_s
 USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_b
 USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_h
 USHLL_v         0.10 11110 .... ... 10100 1 ..... .....     @q_shli_s
+
+SHRN_v          0.00 11110 .... ... 10000 1 ..... .....     @q_shri_b
+SHRN_v          0.00 11110 .... ... 10000 1 ..... .....     @q_shri_h
+SHRN_v          0.00 11110 .... ... 10000 1 ..... .....     @q_shri_s
+
+RSHRN_v         0.00 11110 .... ... 10001 1 ..... .....     @q_shri_b
+RSHRN_v         0.00 11110 .... ... 10001 1 ..... .....     @q_shri_h
+RSHRN_v         0.00 11110 .... ... 10001 1 ..... .....     @q_shri_s
-- 
2.43.0

