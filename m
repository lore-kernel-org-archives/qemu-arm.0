Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289827ejb;
        Fri, 9 Jun 2023 03:49:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6raq1feBwGpqsg2rHpYR895vm7E2purrOOY8volQrWjH9E5RZUfBiAyohJiQ6/gtktdIE+
X-Received: by 2002:a05:6214:2021:b0:61b:5dad:1b6f with SMTP id 1-20020a056214202100b0061b5dad1b6fmr1196311qvf.3.1686307778110;
        Fri, 09 Jun 2023 03:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307778; cv=none;
        d=google.com; s=arc-20160816;
        b=PJXVpSnHg/C9/Qol/Jy8FaP18jntmj/MUbt/QPaFw+j6c7pxJnqcey6E/AUj/TzTQi
         K52D/I4QaUV0UEqAa5x3cVqet8mTRVxgkGMT0u47t2DP87hNXrEwuQNZJWaW40WLKuxG
         Zi0OM1PrRShkVFEo7R/NtEW1EGNrATrhIK70mBpNn2xBjUqTt6IAaBYtAWwzPjullyD+
         mmWBzt4uKRS0J0UmUV3iHE/PofpeY/2cWMbnRVZ3rOYZusadIZCP21qZIZ5OtL6tvUVD
         pqvkAxNQcBPoD3S9x2EQ38sH+TC7fJU7uayaAqYyXHgvEBitEgqHOkVjacM5B9ZfnM/W
         2u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9vVibkDFYfG6DFhVF0ZSzLEwHPzqjB5BANscN4p9qZ4=;
        b=jkA4hAOwgFecYHy20do2/UEpp8By3711J6ehU1mehSnjMAyIJ83Vje9KQWa5NsCkJQ
         z8QGPSOsE1XAYxKurvHTr/aUMTzNDKYXbbIdb2o3zC+L/fov8hScC3chgwPtVK1kIpMB
         Gt3DFE1sEY5bAAxBis7I0V+22587M/sjEimNiLXi7/nm1Ap+iM1gBgkFdg75glV8n765
         pDfWcnx3DZOslMVjajei3whPbfslI7LekS9uxH2Qq5DS+OugiQQmnlhJtnXfb3rpG2eU
         8ukaQ4ycRe+w+BBlga2RSrB0lqRMcm2/RPvtJPM678XYnydUJXGlEn/l8F5yNqyvtszh
         Fgmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=snXUvl+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc21-20020a056214411500b005ef6e02d541si2068014qvb.188.2023.06.09.03.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=snXUvl+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7ZgC-00072T-UP; Fri, 09 Jun 2023 06:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZgA-0006iS-M2
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:49:14 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zg8-0001eH-Lz
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:49:14 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so2049794e87.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307751; x=1688899751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vVibkDFYfG6DFhVF0ZSzLEwHPzqjB5BANscN4p9qZ4=;
 b=snXUvl+Dkxo33YpZvAGQs08bEAuQ30El4p/XugjuVXSuXKj03u5wrU6aN8mwkPLPRo
 kun/4YMok3Cr9orZTqTO9ZjGfOJgZ9UlULxMXyY2HQterlpglIgPkQxeYhdo4pbdlMAx
 MZN18La3m7W15scj9K/kmbqo/So5epWv9y9R9CbYn03yNZTgLivxM4eRwlc7Pllr/GoA
 xWYB0HwlLz3GwRdrHFcODEsSP0tCIm/BWyBs6uOjR/e/4ssU4dnrT+G5cXPxwNVUmPiF
 eVRcSUPZE1TzKtEtb1+LlhkW3gUSQ4NllDru2dBYxhUFaTAmJ8bnn4FYh3Up7x2EmHFI
 RnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307751; x=1688899751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vVibkDFYfG6DFhVF0ZSzLEwHPzqjB5BANscN4p9qZ4=;
 b=lblgdzCwDa1/lGrrrICeowjjZQDNamGKi6V1FKw7kFqGiv4m/UYRZ0TFypQSgY0MXc
 XXx1B+BPCdYncYtOTuDEVYXCRtX4lwHiOqi1PqXNAff6P49qwsNhQxCB51Aj96m/dcto
 oy8tfMISMhLr89TZM1HYtnpB0zUsld07YgaMe2LYsMxozNcHDilsiU2ov7FZL8N/G5Xb
 UdOA2aHMMEBaa/QjgnSNW86ICw+e/gUsym3khYGX9Rhgxh5CeWR2mMRNRFytf+7REAkD
 P1YogoxwegRvFhAWSolfDWKHp9T/9gJUzt8D0T8aG0VNT4vHKfbBGguicyf9AD3uECYz
 FsaQ==
X-Gm-Message-State: AC+VfDxpuh6DA98WVggIWvVXq1d9ETTSiZQJbJQ9+lQw2/ltKiEZKcbn
 KILYM1kTe3n2AYWaW4V9uk3lRQ==
X-Received: by 2002:a05:6512:b0e:b0:4f3:bb14:6bac with SMTP id
 w14-20020a0565120b0e00b004f3bb146bacmr599722lfu.56.1686307750991; 
 Fri, 09 Jun 2023 03:49:10 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a1cf60b000000b003f7ff6b1201sm2231660wmc.29.2023.06.09.03.49.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:49:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/22] target/arm/tcg: Reduce 'helper-mve.h.inc' inclusion
Date: Fri,  9 Jun 2023 12:47:12 +0200
Message-Id: <20230609104717.95555-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: klf4vVkcELel

Instead of including helper-mve.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 2 --
 target/arm/tcg/mve_helper.c    | 5 +++++
 target/arm/tcg/translate-mve.c | 6 ++++++
 target/arm/tcg/translate.c     | 5 +++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8983489cf0..4e431c2116 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -560,5 +560,3 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-a64.h.inc"
 #include "tcg/helper-sme.h.inc"
 #endif
-
-#include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 9914f45b16..fc003b7c7d 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -32,6 +32,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 static uint16_t mve_eci_mask(CPUARMState *env)
 {
     /*
diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index bbc7b3f4ce..8577dc4377 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -21,6 +21,12 @@
 #include "translate.h"
 #include "translate-a32.h"
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 static inline int vidup_imm(DisasContext *s, int x)
 {
     return 1 << x;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7bfced1bc6..da3e0445b2 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -34,6 +34,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
-- 
2.38.1

