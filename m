Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883472ejt;
        Mon, 19 Jun 2023 08:56:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mUxxmfgLuws2mRiL7M3NDWbEYTvkvzOBbi5c55/zxX2GrpQc23kps85A5TUFwaO0EQfKW
X-Received: by 2002:a05:620a:b06:b0:762:4ca3:8c2c with SMTP id t6-20020a05620a0b0600b007624ca38c2cmr1558807qkg.34.1687190209290;
        Mon, 19 Jun 2023 08:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190209; cv=none;
        d=google.com; s=arc-20160816;
        b=RYVUAcqTSwBNc6pzPExyQnuHxIKruisggbX5ctL6okH6zsyamkOjizvk+8RIiAlIYU
         AWLUANA+SoQQWLgu5C/nW62tDbArgSXDzEsz78Hduhx1ScWon9EY9o2erTdzSSUnYbwh
         rDJRLNYe3Plc31KmviKak6d07zhJCtR8sETWvRlAfsYgtrXYeApUwVGzJRP8o/IUf2MS
         boaQEHwx69sE88AtAmhxEocXzmAjdmPbxXloXVqfBBeYkIcOtT5se2AT1qLKGLn+siCp
         hb5ogANRJ/bqy7AAokApL9UrTUD0AhJJc2Qhm4KWJK793KyAz/SZTwgLrKEySWPokaX1
         wj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a3kwbOXAaLcpr0Lk81NO100VRflwTlZG6+ZD+RFnb4I=;
        b=vIfLP9+4a2kV+f4sWxFBj9Fot+Hhe/2wLQQPvz4Xmtb9ZVcC1iu1CJxdRRyYW4W4SG
         UYSrkLKXcmT/mjhBcq4l8fDmQDyAz3TtQb/prD4vwZ7HLeZciZktPJurvnvYEEj/jPPv
         Pgu53Y2sOEsq2wL0988CjF+X37C9ZnJDu3pv/u/a3ohtMyTlA3EyLfdoNFNalCRPyNhQ
         n6rKYojNw0Pe4DFiK7Xb95732N4HfZhPqv1W3NXZ/m2aZNLqED74JMpX3RbAkthBwLD4
         aBhdsMNGoc5K76BzG3o3LuktN+TAA8XOOOHYdHTE8mOwhzKhMQgD4OFvnEs3wDZx9sQ5
         M1PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWYZLRRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa42-20020a05620a832a00b0075f0463c4b1si86082qkn.27.2023.06.19.08.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWYZLRRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHFI-0007je-4d; Mon, 19 Jun 2023 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFA-0007aM-DF
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:42 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHF8-00054m-KR
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:40 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b4769a2ee5so20091131fa.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190197; x=1689782197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3kwbOXAaLcpr0Lk81NO100VRflwTlZG6+ZD+RFnb4I=;
 b=LWYZLRRu2/zRkqVdlheGwOGP1LZL82QdH66YF9CtQxfd0YvqrcghmAJa6iTEm0qamL
 dJ/frkLmgIiJmPsNFHglKm/969NodfJ+sr40zkR8a3f9XUjZOnv6vBIpR7xHH+RL3mL6
 oM85H5p6cEYv/CneBQjIK+sxf0n4ob32OP3996ODmrW5qa1LMIZ06ld/ulXKWjSU+AKj
 r96A2rSgtXhjFrZRWoe9zYjzfh0D7HiXwxYtkWyp4eweLnqGOxg9e01y6S4w78CHbV+D
 8DCJkX0fKjX+1vivvZJnr8MoTZTwHykuKkXWgjgnjLRHlaP+XDBZruAPbqVIbKqUi6+A
 u1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190197; x=1689782197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3kwbOXAaLcpr0Lk81NO100VRflwTlZG6+ZD+RFnb4I=;
 b=QjqcAaT31Nu8U2/FE3QgTqL2IA9qSADWsrh8XxBDzysWuXO4WZim1Yrm3tvYLyoUid
 SbWMKork5JAJVLlHTLmN+A5ON6r9gnD0P95eC92dgCHTUhFbrC5X01HUYRWb/Nqqc4mL
 NOpwZ0aWw85mYVIZTvFyGCT48toyvt/w2wRm09ScaxFB3A1SxMxOPxqUXt+JAoO6WVlJ
 VrIhuFLiHjOXt1G1OoXWe4oCFQuPMMgNosZsO7VxwsWZ07iYDpBZjzRGZ2n7u1YNLEfz
 kx5tPTY4EidorFEviugUfiJDyVK2guDVseTxcM/c8iXIk89CjvayT8CaLRlZjLhHN6Fi
 ZHVg==
X-Gm-Message-State: AC+VfDxUwKbY2BR4hdN0k2CXjSaLpqZNBxLws+1DoIDWs/NfuJ0FZlQE
 ErcXS//JlGhXVOc29QRWcRXLcyz8VV6IkcWK3/F02g==
X-Received: by 2002:a2e:9d44:0:b0:2b4:738a:c32c with SMTP id
 y4-20020a2e9d44000000b002b4738ac32cmr2399066ljj.4.1687190196912; 
 Mon, 19 Jun 2023 08:56:36 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 j21-20020a170906831500b00986d8722e46sm4230118ejx.17.2023.06.19.08.56.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:56:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 22/34] target/arm/tcg: Reduce 'helper-crypto.h.inc'
 inclusion
Date: Mon, 19 Jun 2023 17:54:58 +0200
Message-Id: <20230619155510.80991-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: exwZ9NVuQQTM

Instead of including helper-crypto.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h             | 2 --
 target/arm/tcg/crypto_helper.c  | 7 ++++++-
 target/arm/tcg/translate-a64.c  | 4 ++++
 target/arm/tcg/translate-neon.c | 4 ++++
 target/arm/tcg/translate-sve.c  | 4 ++++
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 175589cbb4..e132969837 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -111,8 +111,6 @@ DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
-#include "tcg/helper-crypto.h.inc"
-
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
 #include "tcg/helper-sme.h.inc"
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d28690321f..75d9e57e3d 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -12,12 +12,17 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper-crypto.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 union CRYPTO_STATE {
     uint8_t    bytes[16];
     uint32_t   words[4];
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 924bbdbf1d..46428ef034 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -38,6 +38,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-crypto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index fa13e7e8cb..ba9f1a9801 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -32,6 +32,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-crypto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "tcg/helper-neon.h.inc"
 #include "exec/helper-proto.h.inc"
 #include "exec/helper-gen.h.inc"
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 87f92b4d1d..0fa3a14512 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -26,6 +26,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-crypto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "tcg/helper-sve.h.inc"
 #include "exec/helper-proto.h.inc"
 #include "exec/helper-gen.h.inc"
-- 
2.38.1

