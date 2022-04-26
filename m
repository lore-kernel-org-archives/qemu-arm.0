Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp371534lfu;
        Tue, 26 Apr 2022 09:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5nNeG1BWsmqAYttUk6y7esnOdL0ZvZYDYH624vXe8XbBkswbtqAyw2AxIjnkfOKotT99/
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id m3-20020a81c703000000b002d0cc6b3092mr22618468ywi.449.1650992174422;
        Tue, 26 Apr 2022 09:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992174; cv=none;
        d=google.com; s=arc-20160816;
        b=xdjDxv4A93BN/fDU8L0swSMUV89zOC4N1kPD+poiUIfu9gGZVg9pegrRZ8NtsYdIPb
         lxsFNEgI9enaKpmkd/xvGTBdzeP5EeC/9p+mqdFGOv0Km17X9F3zegqzcMjhxdqKTKlu
         0i63Vx7qUizDOY/WfgklmgUxNiWX5RMhqld9ROTzN9KM+db677g+Hg2YqmG4K6FyzRWr
         l1DQIZ1j0aGKBnDLpzfvyyXNTkfdSk0gJGjlXP4+R3gtHeHkJRzu73k70k3VBP3xHAx3
         gNnf+yrkZISXo6OpQIgQd9q0DfSUxRkfLOcWTuVCnIaBGbwGKs1wPcXhB5EYVB5o1HAa
         B9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YpVs0/2D2cp0hUUGtxDD8k8vZGg2jdZBOZb+I5K1m6k=;
        b=VZjhxBxKKAOsN+qJ18siXPQJLC9j3f/+NapHqgfNghN3cjczp7bIdzYgCLO5eBVDix
         Rm1h8iw4yFbUKrRJsvOHMw90GnrpI54CaOUQx1hi+SEx6Cu2oj5N0Nxy2zvJ8g58WPqh
         OFzoOiNkZOl+k4FZu1xi2ezJ2HqX2kjH9pTAsTIfl5AH9uMTqcTV8IimEBDsb/OtnhRX
         HLwwtxyySRxc6h4dmwAED5KfUEdicdjVAEPISy7ocBf+izax9KBF8TZOxyE778qEt8Xa
         VDTzrMbxaZLH4f7EiT1hXdqe5NyhRrUxttOSp7ix4D6JHOHK0xvogSs779O0wpvU7N28
         jTiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jB0PpkXV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z132-20020a814c8a000000b002e5de7e4184si13875615ywa.335.2022.04.26.09.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jB0PpkXV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOU1-0002GQ-PP
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00039G-Mq
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5s-0003uP-JO
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id p6so3566879pjm.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpVs0/2D2cp0hUUGtxDD8k8vZGg2jdZBOZb+I5K1m6k=;
 b=jB0PpkXVDcFxRznSedfvgGZQIOEZ8l5W9TfuJgkltcOVu44+0DDGnwnHqOCMffWBpC
 I/gFzzD/G0Pk9jLDA0bbJIQVOhpG2NgkOuOLSgyEFLp3HmlXRnIcC3rq8evOEiww+CLF
 z598SFi1H3th36EmHMLZ5zDdP5w8XnCTPKLJNMj8QJmuny8wgQkNe8IWExfhvSnu6Ipr
 Mi23yiFsabWmVbO8jNbkHyqG3XPEd1nFVjmPuEOS97XYRJV0qeiUAgHNvzOMa6BPwBCX
 VayifpSJCCQ/ZC0T7AcfLM9AW+MA4YOjKDanhf57elLPz0SfuI7nVofuxy1Xj5Q/VxQ9
 6SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpVs0/2D2cp0hUUGtxDD8k8vZGg2jdZBOZb+I5K1m6k=;
 b=jpiKxhgBsKltPtnRLjutWXIbMr/38WA0GfAwb9b+6EtwpIlOnr/ECGd5Fsw5WwwIda
 OnxbejVu0VUk0OpvmlER1/5dOdOSzgiLaTe4DJ9eiRnzcLt93t6E06Y3QB3P7mDYNg2C
 vY8J7Tyv80zlYB1XHIaUept/GGcuP5vSkNl6PJFSxyzKz5cZP1/gi38yZPwo4OFANhlT
 5U0mgHQfgtFaBmJwa0owRcU6BlEWJFPmm4JVqIEgt2Iq0EAhHtgqS3wDx7U+INq11tSM
 LNBEmyDhjNlOH8WGXb6Omq0xXujWjwt5QO8SM7vKSdW9vqedWBz9eLXLBtBS5c6tuuzv
 ZmsQ==
X-Gm-Message-State: AOAM531842Jikutt2elsYYuLpX1eEe5ehRZaaIkWVt7H/R2Dhqj25ucD
 8RokImj0hexBN/TOht1t1xxgZg==
X-Received: by 2002:a17:90b:4c46:b0:1d9:f9e1:254 with SMTP id
 np6-20020a17090b4c4600b001d9f9e10254mr1634983pjb.24.1650990673596; 
 Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/47] target/arm: Use tcg_constant for TT, SAT, SMMLA
Date: Tue, 26 Apr 2022 09:30:27 -0700
Message-Id: <20220426163043.100432-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b776HbKshkT0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b604a820c0..24e522e1d6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6596,8 +6596,8 @@ static bool trans_TT(DisasContext *s, arg_TT *a)
     }
 
     addr = load_reg(s, a->rn);
-    tmp = tcg_const_i32((a->A << 1) | a->T);
-    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tcg_constant_i32((a->A << 1) | a->T));
     tcg_temp_free_i32(addr);
     store_reg(s, a->rd, tmp);
     return true;
@@ -7564,7 +7564,7 @@ static bool trans_PKH(DisasContext *s, arg_PKH *a)
 static bool op_sat(DisasContext *s, arg_sat *a,
                    void (*gen)(TCGv_i32, TCGv_env, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 tmp, satimm;
+    TCGv_i32 tmp;
     int shift = a->imm;
 
     if (!ENABLE_ARCH_6) {
@@ -7578,9 +7578,7 @@ static bool op_sat(DisasContext *s, arg_sat *a,
         tcg_gen_shli_i32(tmp, tmp, shift);
     }
 
-    satimm = tcg_const_i32(a->satimm);
-    gen(tmp, cpu_env, tmp, satimm);
-    tcg_temp_free_i32(satimm);
+    gen(tmp, cpu_env, tmp, tcg_constant_i32(a->satimm));
 
     store_reg(s, a->rd, tmp);
     return true;
@@ -7915,9 +7913,7 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
              * a non-zero multiplicand lowpart, and the correct result
              * lowpart for rounding.
              */
-            TCGv_i32 zero = tcg_const_i32(0);
-            tcg_gen_sub2_i32(t2, t1, zero, t3, t2, t1);
-            tcg_temp_free_i32(zero);
+            tcg_gen_sub2_i32(t2, t1, tcg_constant_i32(0), t3, t2, t1);
         } else {
             tcg_gen_add_i32(t1, t1, t3);
         }
-- 
2.34.1

