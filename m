Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883361ejt;
        Mon, 19 Jun 2023 08:56:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4xOv+k4gk0to85DYUvVnMuZbrwgRz87cvVpXlqwk8Fbm/2P60pZhmP7w1BB6jPsOzrDQu2
X-Received: by 2002:a05:620a:a1d:b0:75d:557e:320e with SMTP id i29-20020a05620a0a1d00b0075d557e320emr9818507qka.33.1687190194573;
        Mon, 19 Jun 2023 08:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190194; cv=none;
        d=google.com; s=arc-20160816;
        b=xdOlE4jyIz+BLI1BjVitymE6NyMWkWfJGhDFv/82fE5Cq7EfRU+fdeLtUTpFB7hYgv
         YSg+AySnuCEPV2JBnccMpTXwl+P/fd0maqrg0CIpELyZnE9uonO3rYZa0JValkOZIgj6
         YO+QNipCQbHd8YBiD6vnogXVpvmj2aYIP1H1aSBbcR0QKQsZT1PfH/qz640iPsFzt1of
         jacZ5+Q5ZI2K2a4tujU1a8mB+OLHwaiBuQteaomjH9vnyc7MTXpAAWvXb1al3a2KFoS0
         neaOxr58IR1Z7RBjmzcKnuobid6j/WdwBKVRBaTJoMvtk90Ty2NmB7+dp/GtTdwvJTIA
         aUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+FfBnF7eu5o4C7RrZixbN9t5b0QC+QNTTXtKfSoVnZ0=;
        b=STQbT4+87O8eMDuGaXf8h2F+oJP+igPrGxWG0KKQsBi813xn/422f6JOFu9iyOgEaY
         CieTudLhaEU34xbi4dgEe2/O//iefKLiMSLMTWEa7xAblUP/pEhoIccbz7IxmOSfI6Bs
         znn9E9TnbWdvSnpT30ap152a/m4vCTToXdbzW9rvigTTNzWY7438S1HHkKngl+ebEoGp
         7FQLc88xb/O7eKqBcrGaojBnUuR/jmtB2lqQ/pg3Q6nEQXj/z3RhOf7jZkUN0qkugL7n
         YWzjApdUPWhH03yTpqjGELh5KRRw+mznQd5C+E8zGqk1SEIwZkpaFaAUvm+LqPUI5E22
         XJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zll6Jsdx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05620a070f00b0076255d1bc16si35780qkc.730.2023.06.19.08.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zll6Jsdx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBHEJ-0006db-VI; Mon, 19 Jun 2023 11:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHEH-0006d6-DO
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:55:45 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHED-0004mn-Nv
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:55:44 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so510995966b.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190140; x=1689782140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FfBnF7eu5o4C7RrZixbN9t5b0QC+QNTTXtKfSoVnZ0=;
 b=Zll6Jsdxd/Vi0Wgi3j/WGEw3TVcR17N4hXozeH1vZ9IlzvIzOhiv/5/sacy/RHDlA5
 3Jurt/gk07DyrXfX99BYToo+f5UFwqxkLzmcR/kEwg8faMyGMBHsZSiLRW1+ZDX+hGlU
 ez+PDtK5ojRYdw+wGwVusQMNQYlBbl1yNbFDUkPWF6Xe0c/coYmZ+6XqP4slG329y/I9
 tRK0UlMdBLbt4l0mjA0JFe4/sw/VsIT5+ac4a1rltCgOlfhk57LiQyYdvExbD/m7g9cX
 HkImuaQ7Bye3Z9ihAsMK2hKFWiqAR8TIpPu/I6wMxUH/kFzQbTacY19GkAKP+lEbioVL
 ZV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190140; x=1689782140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FfBnF7eu5o4C7RrZixbN9t5b0QC+QNTTXtKfSoVnZ0=;
 b=XqrrOgRipPqrsHz3nU5HGK0IR9bzCcId/yisGoFh4v9DuUIpQfR+efJ7+9Fesbn7BY
 uJ3mAbyNRc18ZKPGG6WG1g8U000+SX+89hmV2oUvMAG3MVEoB6TmAFg5cJhgNVkA/+PG
 uuqSMc07K5fH1kXtrk95CnslTz93bdnVUsw0NHLZllgLP1fAoeU8N8DjvWO2wvHjvoh3
 0mUvCQaLl3nBFO1VjiMGU9VQUOElafM/rVi2rI9GQTat78ZCXH8uBbmBNdaPBjjdtLi+
 ZbePyTaBWj6hk2oE+kXcH0p/Dhn4hirnp1lpO/r4/y5kjkJalKBaRcWCl5gPak8WXXGA
 Mwzg==
X-Gm-Message-State: AC+VfDyn5bYV4Ve3yqWBzZ2u2LS5KCd5ZC300f9U+Afu8wOdQBsekYQ1
 NYru9JE6hehjKKAdk5+BOhBXQPxYUrdY0r/e1eUBXA==
X-Received: by 2002:a17:907:d0f:b0:94e:e30e:7245 with SMTP id
 gn15-20020a1709070d0f00b0094ee30e7245mr10812799ejc.8.1687190140025; 
 Mon, 19 Jun 2023 08:55:40 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709060e4200b00982362776cbsm9456814eji.118.2023.06.19.08.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:55:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/34] target/arm/tcg: Reduce 'helper-neon.h.inc' inclusion
Date: Mon, 19 Jun 2023 17:54:50 +0200
Message-Id: <20230619155510.80991-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2s8eey3Cakhp

Instead of including helper-neon.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h             | 1 -
 target/arm/tcg/neon_helper.c    | 5 ++++-
 target/arm/tcg/translate-a64.c  | 4 ++++
 target/arm/tcg/translate-neon.c | 6 ++++++
 target/arm/tcg/translate-sme.c  | 4 ++++
 target/arm/tcg/translate.c      | 4 ++++
 target/arm/tcg/vec_helper.c     | 4 ++++
 7 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2600c150f4..819d27d597 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -577,5 +577,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-neon.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index cd668eb43a..6a4b3a8abf 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -9,10 +9,13 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c0727c900f..22caf89bb0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -30,6 +30,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 497aba2e39..9a1831f849 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -28,6 +28,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.c.inc"
 #include "decode-neon-ls.c.inc"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d0054e3f77..24796e5d9e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -21,6 +21,10 @@
 #include "translate.h"
 #include "translate-a64.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a352fced6e..2b3951cece 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -29,6 +29,10 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 013ca1b05f..af325577f0 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -29,6 +29,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
-- 
2.38.1

