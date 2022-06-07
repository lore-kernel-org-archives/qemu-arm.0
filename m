Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2431477lfb;
        Tue, 7 Jun 2022 14:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/hFvqy5OEE8DYqXt3IqqDhDFHW35COJ6CUbTv69SOYDsUbSz5xxbaV895y71DQn3lmQq8
X-Received: by 2002:a37:2750:0:b0:6a6:9ee2:5f5c with SMTP id n77-20020a372750000000b006a69ee25f5cmr16170060qkn.558.1654637982686;
        Tue, 07 Jun 2022 14:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637982; cv=none;
        d=google.com; s=arc-20160816;
        b=l6gFvuH9WLbauFizTdISPvgByP98TENeD+ufjR+/RNEPgyMZOYr/lmBnaEITEkMkYo
         l58JMVM7f0ip8fQLzD1sUwzFwUCqlXdV1xl1UapWmMmLeLTBrytS1BpQMjOEZ//hn3aM
         9iw2Tz/dagSpJjFLybvILwuU1nrENUkn0qA7yVl/FaisTvjxjMac+xucAR9xfEPKjBxk
         rxwXimRwQefrj1syQUWHF3Ud3CEd9P11C4JvYDTeKgYvytEHYZgFoF0iNjxaZ7TH0bI8
         8QqtX+7sAbAdX1IyYJoKqmFkDndvAzly+V6TihH8zOlEfsZB358R8ZAk6nD6rZGfaSOQ
         Bqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kgNhNU/XiqyTZsu7aQuRX50+5jVucITpw0VqlhU/LDU=;
        b=OL5dgsx2hzxReV2fuJzGLz1/y0FpJDMXBsTyquFOakXfTcezMmISuCAXwnRTGITkyt
         lizWUXXRfxWybeoZNVfdkNWtr9T68xwWRgAtCaXSmV6TeOuaz29eRkL11u3yRuQH7GHo
         UnPCJD+L9j4Ea+QP13M9Fn+hpHkke3rH8GTMa9TpRp20my5U0MA6B77b0TXoVmHTPNkA
         oTy8BvwUdpKQE9dAXYmusmy5UPA5JgiyrPDckTfbuZ77+DuTsuHjB3kI02vm/j/2lo+X
         6nLYGWxWJaz6M+0twIXA9rA9BWViM4YQuTjhe3iz45kryLBTEyVxJqhc7+ToHoOX2BzC
         TgoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3wHS6J2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a05620a24c400b006a665dd52dasi10655927qkn.394.2022.06.07.14.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3wHS6J2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygvO-0004aD-5A
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwp-0006ya-PM
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:07 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwi-0008Ix-Sw
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id 15so16522545pfy.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kgNhNU/XiqyTZsu7aQuRX50+5jVucITpw0VqlhU/LDU=;
 b=w3wHS6J2IzEwwi3G/1scDqa71vEA9V0hj6L5RhEBGCjBxLrC1r9LozbFpfUpivI4bS
 zfxdWt0dUax8Y0rfIFADHYa++gTE+Gl03B6ktC3+EbX5jWB4TCCEj5lgzPzs7TM+dVSJ
 PqQXJK3hpXK3ArBf1g9BboS2IDT/X1F79pHBGZKTirLD4E/g4WQYDDAbsH30BL1tJews
 OKkP0Sdkzl9rxfAfQznJdP9mK/alvJEAKZE7KqFXPAdkZXRyAkIxZlZTeawoZdgXVIZ6
 josYsxHcuUV6/hDPPDgUA9xgP9V1HtYZQeuvnoZMOFhBtkBAnOqyzsCYA+EWyr5cp8hU
 h32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kgNhNU/XiqyTZsu7aQuRX50+5jVucITpw0VqlhU/LDU=;
 b=l1VThWCj8rV4eo4OUkExi6S2NzV1vMRWpbYI2vg3sTPGTfib48ecEwYupZHGFdUgbY
 WbivGxgt25fRLsS0RaIIXX1VWRGCbYvzGO9hkr2hBJS/l2nVxFQkyOdtNaMLUj4lP6en
 jGpwRMp+Ok2lBYXGuS7sBCQg83zK1cXdm1PbKf51DN5IYDksJ1shMX3QHIhGRl9c+bwl
 o23V7nomOCCRyNaFMaQg/gMYHday8ejsjkjuwdrMvMkBNslQ0ZPLOAwR1FnHkDfCNUC2
 w2IXLKqeXuLYwVj0GON88cZamx/Zr7tFll/m/NY3FGfY5Wm794NF97WYaG69nO2FT5i6
 DyiQ==
X-Gm-Message-State: AOAM533PPYLmGyyNPy8If7sjiOD5Y/fqW+IJCi41QxTmM0zQboaJARuZ
 nqQl+CvhQSRSAyTGrA3Yxv+dBD6V1AsuWg==
X-Received: by 2002:a63:2447:0:b0:3fd:b97e:7f0f with SMTP id
 k68-20020a632447000000b003fdb97e7f0fmr11047793pgk.516.1654634218665; 
 Tue, 07 Jun 2022 13:36:58 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 55/71] target/arm: Implement REVD
Date: Tue,  7 Jun 2022 13:32:50 -0700
Message-Id: <20220607203306.657998-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R4alddSDoENn

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 target/arm/sve.decode      |  1 +
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f..cc4e1d8948 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9a26f253e0..5de82696b5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 58d0894e15..1129f1fc56 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2896,6 +2896,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf561c270a..d1e229fd6e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
-- 
2.34.1

