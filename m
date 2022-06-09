Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp694131lfb;
        Thu, 9 Jun 2022 13:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMeTb/Mln4QJDrfpTEbwkBQV4Lrc4m/MtCNBvMwRuXdp/dMkijOMqSTm+t4tTnKVvGYniv
X-Received: by 2002:a05:622a:14ce:b0:304:ed21:f10e with SMTP id u14-20020a05622a14ce00b00304ed21f10emr19240982qtx.250.1654808391260;
        Thu, 09 Jun 2022 13:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654808391; cv=none;
        d=google.com; s=arc-20160816;
        b=MTT8DVCBmNxrKFmKfyaiXAwGC7aUSifL85LMaJsKdpBJ3HK5LZwZFSry4qz1SVHqQh
         sGCMPsQwNyQ/m/6PdsGr7IwBGHY00Z/f45N7yl2DUbwed3hkzXGJoZMESbOlfhwTkI2q
         /Gv72iYOFT26tb71aY7OOOeYy8+EQLhAbVgk5pOOa9V+JTRKIVkXPbLLeph99ccRiTpM
         eG7XoFBk8mEZ0FOFqLviswnpOs8ezD6+innvzbB0gLzSeC6ae+XjCDQYtMEkE63Fbav8
         BLPJQP9gnLKdIy1vNG55DGsbpoFfkoZgm0xZKykpkO0i6VlAacE7LP9ru+vLVvbe0q4S
         J24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+8pdwGU+0yoxMh5SE6yAGZhMV/fFIOLe/XYFBrqv9Rs=;
        b=xDKxh/btJ1xGozgNdqtTIGlZOQpo6/jdyDpTIdX+G/rpPR8/jNl1FEDjif/H6BCdkv
         8yp9AGZykdL4WazGcbJekLnatIWrdfGtc0wDkZnvdx4DXl/PV7gDHRx3+LvciyenmHVp
         vaOP+oWKjQbkgTnY/qWAwOFZDVDe9ei8YdBUuX0MUxSsv5F1rC8IpQy9ZUrE0UVyH9MQ
         HMSV8UL6hVQ43Y8WYcLSSsQVGpnK5Ifb2wWIDRmmLYUxQHHRN5RMfls8ALKGFFz625zq
         Nd/j+CO2Vf4ohNi+WjRfmX1eLKWvKHNsCIIy1nbOyNNYNdEIaKQVf+u/9byze5ZTpMdM
         d8+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPgPlJlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a056214062800b0046b938bfa35si3568781qvx.576.2022.06.09.13.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPgPlJlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPFu-0003yM-LQ
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmP-00044q-Ue
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmL-0008VT-Dx
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id f9so10674108plg.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8pdwGU+0yoxMh5SE6yAGZhMV/fFIOLe/XYFBrqv9Rs=;
 b=oPgPlJlfZjbUYgZUzozivO2NeLRXciIzuAJfreX47HhFV+CgH8xszk7voqY/AML7Ff
 eqiHt4D+PU1WZMVYJxxsHEvTROv0/UGeXrHvWqWU1TQPXPF7Ta0zVNS2JW2GlK8LNc7R
 8bwULEGnsG69hUYEsIvG8JdxCQ9iJucWFiWUTCq+DxXX6niAgW39LiMa/qNS8pVgzdhV
 tKQLQf+wduDIqceqKdgVlUXwzJfiqBL9rsCsXyphPQEmpQRjQwbQb7tEEIDtd3dQdliT
 e2V969gKQ35lVw4HxZsI+t+0wASGw9JIvxpXx22sfdWT6OGxJivk7yfiOCb+CngZMt/v
 RT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8pdwGU+0yoxMh5SE6yAGZhMV/fFIOLe/XYFBrqv9Rs=;
 b=gD73qRSsaY1cMabKqrvVyPs8yvOpp/UGhkrzYl7ogSqNUkZlRm2DCGRFJljND6ufPs
 UuQtwsuKcrv/cDjD3FIqADHCFrWw90NGt+UHlN8+x6lLuvARiZfzRPITJrvT1mE6aka8
 w1Wonx+07EaZ+4ItpVLAiMozCrFvYX1MbPc0hDN9kA1y2m88GkAIOfZbnu+s58Lw0jsD
 S/tNNZWF8Z4PUnjazsKLRfE3D45F5rIPNRXXjKmG93j+Bs67KYliJG8lG9DcrmbYK5bX
 ypJ5OHIfUs/nrJVCSm9BjbHeX41JctP07efwN1PWkN+xeugjVGm1pyJ2Rl9LR0pWCBVY
 vUAg==
X-Gm-Message-State: AOAM530RbabrYe25P0hUMQ0PexghlKFmYd+8kK2tfwyEzH8KoE0HZ6XX
 9fRVTjm9f5G32JZ3XaFSoA4ifpqePWNfPQ==
X-Received: by 2002:a17:902:b090:b0:167:7ae5:e13b with SMTP id
 p16-20020a170902b09000b001677ae5e13bmr22908263plr.170.1654806556009; 
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/23] target/arm: Move gen_exception to translate.c
Date: Thu,  9 Jun 2022 13:28:53 -0700
Message-Id: <20220609202901.1177572-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: bRQEcLNDS9XY

This function is not required by any other translation file.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 8 --------
 target/arm/translate.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8685f55e80..850bcdc155 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -328,14 +328,6 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
-static inline void gen_exception(int excp, uint32_t syndrome,
-                                 uint32_t target_el)
-{
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
-}
-
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b8a8972bac..fc5eafaeeb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,6 +1086,13 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
-- 
2.34.1

