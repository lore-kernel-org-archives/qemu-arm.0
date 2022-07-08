Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp351544lft;
        Fri, 8 Jul 2022 08:51:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4RGIVicMukRJjtbQ1aRi1z5LUf5hkxE2wrK98doigvOla9BIGYphEbAd8s2Tlr3EeBohI
X-Received: by 2002:ac8:774c:0:b0:31b:ed23:28ae with SMTP id g12-20020ac8774c000000b0031bed2328aemr3544997qtu.651.1657295504177;
        Fri, 08 Jul 2022 08:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295504; cv=none;
        d=google.com; s=arc-20160816;
        b=Qa6pYlLWW4g1EHkLxeoEG+YOB+BMWp5AxYY2pNd1WNhHKY79ve6fXUzwgIQwfarr6/
         5CLXIh1Cy/LtH/yDNDJ5au0Cqr0nfDzlKyMjRdbAM+PZf7wPw2IXEBLUmqNVcu0gg+Yn
         91NZDQ308UX1fLLq2rXVo7hUF4iTdpGg9ssc8L/ZsJm7UEdmccm22LG08ZonWphx+Xp+
         67SJXDWIlYGhLJFD2nAHekrX7oQ5uq6xRUzpdTZDPnudGfNiecEcyNU5G7io+ZzYmoL6
         FFQqg11GATVjTnXVVPHX+RyxGZ/QSBk8hn9r06QbiDzrhqwd7K5TiTDXDKCLAApUuCCr
         0xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yhKgrJaomw461n0G8r0qwjF4jfQCq4qrekPPxrMl0oY=;
        b=dwkVlqgOa5rysY/HtnXvjDZr6aW8Tbk+nuxMHzyN6Cw+hkHi00Va8JwzFRGQFQdmPZ
         UR/Op8fj+DR+RCJNPpKRm4NNJJ7wk63HVb3IILX1p93ibwjcT0U5ng41xUpV4UsFTqaU
         CyEBPBcM9z8sXgFhnZwxibFSgLB6F7POD8YXSKLxidXv9ffQ1ax2BNtbSAJrk/Xewkt1
         WEWMl+Jq8Ra0yUdzTPALKBCzOesr2I4FaySePvleAMc5WWWu5ZfiiNCyoBfAF+PVSVKR
         4zy8YFUNi5DFe+leME9TVFocv7p/snRYivQcR6+9Sur4FTZov/IggD8sRF/V7U2utB4f
         NhaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K50VoL0X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im11-20020a056214246b00b0047316c8fc14si6110551qvb.231.2022.07.08.08.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K50VoL0X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qGd-0003eo-Jc
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjK-0004Gg-KS
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:18 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjI-0002Py-Qs
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:18 -0400
Received: by mail-pg1-x536.google.com with SMTP id q82so15439009pgq.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhKgrJaomw461n0G8r0qwjF4jfQCq4qrekPPxrMl0oY=;
 b=K50VoL0XGnWjHINp1/GMgweMk7v3hcTWzlYN9ePN/rOZYoZDHkLL+iMI0QMVl7BzFx
 dK+YlgZk8Vqcb3oE2WdGh5CiT6Ep809TFJJlXIoGXIA8g3jpXFAFQk9vWL57r2Zw+Fp4
 6X9BJA9rKpdO2446fu6E43C1nPRb9OZV2SMnDLe0FO7qnxfmZ72LszJEVRojO4b4bZVM
 uVGDJScATeE9sfHkxahRBXtIqs/vxfJ5X4YfGEUjc6v+biHvKXAzTAH3uamkxtomdu/n
 FENOKy+BN/eY58pVgkLmQottUMme4hl3I4hWov7QIYToxuiuuz/+fgsEVQeMV4SZzQLc
 TrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhKgrJaomw461n0G8r0qwjF4jfQCq4qrekPPxrMl0oY=;
 b=k34xAKkilUpJWfp68W4aC4uIjiAL4gGonibraiqJAHuaKzwmbg46WPZhQlJM8JWeB6
 jcUUQhVy4ThZYHq52WXwnIJSEa6SdWph0EroxMCvlxcFgQEypC8Ceku3E7r7vwL+IiDB
 Xc8WUrS6dc1qYLfr8eSQ8uUjbeoJCIyR10zTervOXXfHollESaYPiBW6AhulkvQem+T1
 dZsQjbET2pR9PgM72Sy+tkcEIuiVZ7ae5avJN1hB8BVux+MXGEeS6iVyyjjqxKaLXfmr
 hcwCkMCPOeUpl0u3FqC8phOturBBazO+pmoxqUDFRgrONbXcxbuPSt7F6OAOFgvSsvI4
 w/Og==
X-Gm-Message-State: AJIora/7xG6P+bdf7KpTSdbu+qpyOY0IF1y+xMY8G6Roov0nusqkhgO4
 wNxw/BI89VS1c6Z5utEy5K0QDYV/V/b9xZQV
X-Received: by 2002:a63:f415:0:b0:408:808b:238f with SMTP id
 g21-20020a63f415000000b00408808b238fmr3660350pgi.469.1657293434384; 
 Fri, 08 Jul 2022 08:17:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 29/45] target/arm: Implement REVD
Date: Fri,  8 Jul 2022 20:45:24 +0530
Message-Id: <20220708151540.18136-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mW3FIm6KPNc7

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
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
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 966803cbb7..a9e48f07b4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index df16170469..d6f7ef94fe 100644
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
index 24ffb69a2a..9ed3b267fd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2901,6 +2901,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.34.1

