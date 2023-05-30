Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2393509ejb;
        Tue, 30 May 2023 12:20:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5RSR5xxap2s3Pssq0vb0QZj1o63/b/XYIBoRooi4wSZI/Tq9Y7xxCzJ0IjdDydVZNhZyAM
X-Received: by 2002:a05:622a:54e:b0:3f4:e3b1:8d36 with SMTP id m14-20020a05622a054e00b003f4e3b18d36mr3307868qtx.20.1685474459197;
        Tue, 30 May 2023 12:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474459; cv=none;
        d=google.com; s=arc-20160816;
        b=fgS39570xS6utSEO8/hqagselC2iSVl077RcriJHNCeH+9t8hviBakSgcc6+aHNMyk
         uBMqePug4sPmpPB3QyUIigbDooW4mznshRDXMRTBU9zG93aUL0NUHGFVFLRXI2jv6OJM
         Lfe/r6UaptATJD/11f+PQUs4kxVSwwasKP60w15R4LHrTzIQ7B0qaW2iEOTDxT9Nsude
         2soi69+BNsxQ1SAeP2ao4+D5GMRJtRyp6IXEbDMngLSJX10mciDH7t4jY0n2AZgqeatP
         iWN2fKfK0p+kZejBXDFw4zbYygZURK65tiP0x0nQzUJBKuQAsusJJjcXOx5FxBcCNkaW
         VZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oznYYgRZlnX+t2EBlDXRv+m0lTb2+8Xh7ZDPWTosV5I=;
        b=x2MqbPsM9lx9M+1gUQKsMCjZ3Z8siuvzwJNVx9Z6R6ZwBQ9EtTq2xCSbTCZGzTvSDW
         jEbE/ZA+IRhlyzpCMCC85MqRRYddJEVXnTvDT7skVBqgtJulEpK5z5UByaPBD7+Yrt0O
         X9R6No+U/4GjBoEy0tDhBi7SxjrN6lQyvt3BKmUL3dofocGdWBJ+B7mg4xz04q5M9TN8
         C26QSGFM2RMDXCAy3B/pBE6nmyuzlfMqhe9IDVsBQT1PYCgwx1dte0aTUNEg7dMsHSkC
         +cPKCFGYqtak76j6hLbXimvSXhknSnSuUwoaeIqAQ2WvT7sdo9+kw+iPALwqHFpiHF2t
         mbIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlFDRvo3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ac85c88000000b003f6ac2d5e6fsi6717538qta.468.2023.05.30.12.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlFDRvo3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44o1-0006JY-MM; Tue, 30 May 2023 15:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nv-00063v-36
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nr-0004cT-Tj
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:46 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d2da69fdfso5601584b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474082; x=1688066082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oznYYgRZlnX+t2EBlDXRv+m0lTb2+8Xh7ZDPWTosV5I=;
 b=MlFDRvo3276gw6duv8oO1KLBnmYGMDOXRqb6xJ18gxMqQWdBurGWIV02Tu5HP+BJgz
 66JPevtPzhqrSwD5MM17u5IEW9r45G1ndXuWMH+i2GIsOIcQUJCa7nQshivU1Pkt0Ydh
 tb1TwlD8ezKFxs3+lUoPB7jHDH5FSHmS0rxVYFADeGP/oHbXhctsNj88vNsjw2p27/Fm
 dqa2BWlm6gi/fJJdzWs2AbqFFLxUC9a95kOAsSvpVH1AQ+JUjT/T9oXRtk0L8pJTUOS3
 9WZMHWtRC6ckmueP+sTIWnYwgHdcU5z8cRz4yU9sVqDDqhs+69ix1y6HRGYeQndhJSpX
 aqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474082; x=1688066082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oznYYgRZlnX+t2EBlDXRv+m0lTb2+8Xh7ZDPWTosV5I=;
 b=hglmERIC5MDLdlJeeHGP8vNwLfLO/arLAXgV7s2yOrCD/WhDgib/cge5AQu7f60MMu
 x2V7DkriT7S4fyw8eFdVFupr/wCWu1ylCgWrATj55GlRAw62OvcMigKb5tOHbDpntAcG
 OogtvLN2lvh9Fz2CbjRbVBp2KS3a5HIUG0pOhhCEIUsmmFd6ZwUyMUdAsobKdYeltCHW
 60c0FwlknsIqA9tZAD9uEq3ykaSGAsRVzepyTrYYOaOkkayMwQ7fm2yWWo/3IP/aO9BD
 wfbgNVeOhBOsAEN61y2AbyNgghe6kreckSEHcoroGy7V0+sqd9zz8a92YjfGk6yIVWEI
 dxZw==
X-Gm-Message-State: AC+VfDxknGq5TiJN+Z42D93GipctO+OqUkqYgGQ6xlK6tUDj2Sm0h2Q0
 N/Wol8gLcPNNDF1VFXBkgc6L5g==
X-Received: by 2002:a05:6a20:160a:b0:10a:ef03:3346 with SMTP id
 l10-20020a056a20160a00b0010aef033346mr4021874pzj.9.1685474082649; 
 Tue, 30 May 2023 12:14:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/20] target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
Date: Tue, 30 May 2023 12:14:22 -0700
Message-Id: <20230530191438.411344-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DTZEyOCTyuCx

While we don't require 16-byte atomicity here, using a single larger
load simplifies the code, and makes it a closer match to STXP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 967400ed68..0e720f2612 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2398,14 +2398,14 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     int idx = get_mem_index(s);
-    MemOp memop = s->be_data;
+    MemOp memop;
 
     g_assert(size <= 3);
     if (is_pair) {
         g_assert(size >= 2);
         if (size == 2) {
             /* The pair must be single-copy atomic for the doubleword.  */
-            memop |= MO_64 | MO_ALIGN;
+            memop = finalize_memop(s, MO_64 | MO_ALIGN);
             tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
@@ -2415,21 +2415,30 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
             }
         } else {
-            /* The pair must be single-copy atomic for *each* doubleword, not
-               the entire quadword, however it must be quadword aligned.  */
-            memop |= MO_64;
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
-                                memop | MO_ALIGN_16);
+            /*
+             * The pair must be single-copy atomic for *each* doubleword, not
+             * the entire quadword, however it must be quadword aligned.
+             * Expose the complete load to tcg, for ease of tlb lookup,
+             * but indicate that only 8-byte atomicity is required.
+             */
+            TCGv_i128 t16 = tcg_temp_new_i128();
 
-            TCGv_i64 addr2 = tcg_temp_new_i64();
-            tcg_gen_addi_i64(addr2, addr, 8);
-            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
+            memop = finalize_memop_atom(s, MO_128 | MO_ALIGN_16,
+                                        MO_ATOM_IFALIGN_PAIR);
+            tcg_gen_qemu_ld_i128(t16, addr, idx, memop);
 
+            if (s->be_data == MO_LE) {
+                tcg_gen_extr_i128_i64(cpu_exclusive_val,
+                                      cpu_exclusive_high, t16);
+            } else {
+                tcg_gen_extr_i128_i64(cpu_exclusive_high,
+                                      cpu_exclusive_val, t16);
+            }
             tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
             tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
         }
     } else {
-        memop |= size | MO_ALIGN;
+        memop = finalize_memop(s, size | MO_ALIGN);
         tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
-- 
2.34.1

