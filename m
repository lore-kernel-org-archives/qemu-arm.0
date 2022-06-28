Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2888751lft;
        Mon, 27 Jun 2022 21:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4bkk6GJWiT7rCl33NeaVwB5AE5BxH/PZILOIpdn5Ly6/pKZ2BBzhJz53TEfC5G/1lC36z
X-Received: by 2002:ac8:5893:0:b0:305:21cd:cf6 with SMTP id t19-20020ac85893000000b0030521cd0cf6mr11921863qta.183.1656390910153;
        Mon, 27 Jun 2022 21:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390910; cv=none;
        d=google.com; s=arc-20160816;
        b=D3T96CHSq0TctzD1We59Ac4EoFjMVlMzZQAcqTn1K4wvH+IdrS6pjARwOfyZQ3BzKN
         W9uebjQWdi+EUFvQ7+H2lWnZOwQcTzdXOUjO4JwsNHTRvQKB+2gB2tZwCJ1ekKsl2gW4
         VnxhAETGhYSkQYtiBQH1nPEoUGQigTUo1BQ9hBnP4kZAj/DrMYvD+KXgmDnV6I3S8XjO
         LXmhwMMzctfnYdZx/rjUDOqztpz3tMD/4rsu9wprEy4EJV/8dwk3f9CqQdx3BGWYnZ94
         QVAUlKz8jvsY6B2TmgBud6oJgj7XoL8/OewZ8pomAnCGZ856NGT0aZmk6DjyFhWt8wa1
         C4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=etMuVHeaAxa7UcmLEv5W86A71baIUw+lp8OsVjYF6WM=;
        b=bW7d3PhL/D+LqYYGcKo7tQ8eDTJzXitzA1xdfyRw0BcNUZydygilhK8madJN5O1I2q
         8Vjh2tBocGIb5E9WNo5mV5awin+8dukp3kikwzn/Zadg1RrteeXiI5HjweGSiONdhaFX
         yGHgAMzVrHMN0thug3KhEScaujc7VTveSTym/zNCd2C3qoevRO3Qibnce5aK6hSRz81H
         7HexZluU/v7b59ZbuYj3zkkVdqbRuix0n8I1QNfY5eJZyCWOIh7FMm6LnuMWoXXG01QD
         rhh5U8E4V+GhoUZqleiGXObJIPAcjerD6BV3gskU8doARqvExE2S2rF0zYP9zELMC0pZ
         l33A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="puj1I9y/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020a05620a254800b006a794796588si8118314qko.460.2022.06.27.21.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="puj1I9y/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62wP-00053e-K4
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k0-000279-9y
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:20 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jx-0003hL-3e
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:19 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 184so10986344pga.12
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etMuVHeaAxa7UcmLEv5W86A71baIUw+lp8OsVjYF6WM=;
 b=puj1I9y/VtHkwVJGHxevoTOBp1e2q2AntNADVlFiTKf2CkV7X5+wD8Kf7Aq+Hji1HS
 JXWepixmwfbIJsYQUyN/6+2VttmQ2dJtwy9F8Kj4l1h8k0/WrlsGxt0s/8nAvXwXaatJ
 o3Tu8LOaTqAjCpl3iWFAuKPrCMNK9Lvh4M6cXi8lz/ynUs/25mXJcTITWzEuSaMlHc6p
 YKP8BYJS3kSW0k1yQ0OGWjF/wmmwTfJRBbCom7SWs4oenBcGm553MVkynQJpaaqJajaL
 UoEaM4vpgo0jCZSZ4NjH1GfNUZOoxBvYIHlDX2wMZSI0yZVvoLdys6N/aEOY+X/cjhpY
 +Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etMuVHeaAxa7UcmLEv5W86A71baIUw+lp8OsVjYF6WM=;
 b=qC5q00tW9dfwSkp/t92cRfaoOE1gct4Enca6mfK4y0ffK8Me9RRV47XEPhUYfiynKw
 /KtTtsYq8vTy8H6fHt9VCIICUVruEBHxlT+0n1cP8fLt6TW3cKl+R2M3jLWgZJfIALd9
 YxAULhm8RG7soM1zncWgKr6myakB508B3ues7goc6QvWwebGMv3ZU6sD7/sZELOuJP/N
 fxisB+nIb1klLcdEr5IAcvS44pbFkYg6zHKkcw4Iv7BkVmsER1xfU0yGzzO2aCz4z03s
 r+T2L1TFlvz4wCm0oktOuQvowWbD47SQST+NDb5ZqUiOW4E0k5uOVOHg1QXJt/T4GB1G
 urFA==
X-Gm-Message-State: AJIora/rosNbhyrfq7Ow8BDKXTM+rLmkdNF6RG/1tdIMrHStq50r2q5S
 DaHair8ZTXI1MDXPEJnLE0BmDA==
X-Received: by 2002:a63:3e47:0:b0:40c:fa04:dd6e with SMTP id
 l68-20020a633e47000000b0040cfa04dd6emr15900035pga.224.1656390134643; 
 Mon, 27 Jun 2022 21:22:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 22/45] target/arm: Implement SME LDR, STR
Date: Tue, 28 Jun 2022 09:50:54 +0530
Message-Id: <20220628042117.368549-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2urCWeZgI8k

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index f9846f137f..87bbf9ab7f 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -246,3 +246,27 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, svl, a->rn, imm * svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1

