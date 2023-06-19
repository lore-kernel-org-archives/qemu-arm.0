Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884615ejt;
        Mon, 19 Jun 2023 08:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5UCoCYqt/Ha2fTcSZK6nosqXGAIQMUONXxFzZq+igRBPng2uhu9wRRvek4hFu6QLj2HVKJ
X-Received: by 2002:a05:622a:1901:b0:3f9:7251:3101 with SMTP id w1-20020a05622a190100b003f972513101mr13154456qtc.8.1687190370100;
        Mon, 19 Jun 2023 08:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190370; cv=none;
        d=google.com; s=arc-20160816;
        b=qPbSiV7RVgU6skR5+ZPcfYfLr0VzDs2WyDFYF2cCaB5Bj4LWh8XGds/ktErJ0g7GYk
         4oHNYrYG6xOnBx913uQthFCtu+s3F3UOANPdS7t70MKxEQAC5gWc87em5mirO7QObjQl
         yCrCvoi6XUDN/xG5oYLkeK6qbQk7mwgUPYvPuULAFdjBJQChf7wMw4YJ8+HH2iH0bL88
         lDXNxPEVmyDQEuRjMTrSqNanLQSNvxzVX4uQm5qwbIeusIqWYdrwPCAf/MK1k36MOD+R
         GOtFm4GX4sQXIlM5FBPabahBqYTD9icOiEKfKrQMTmlQoATMbXkztric4gTygF/rucFm
         jwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cwyvfHZPNQ11c4/mh/YpFzb69VIPygsGSZVclqK2vfA=;
        b=GCj56LRjU0fKuhmh3lPSbpTfbe6WLu3eht1t4TruRzP2bSfAPSN3obbIwtFYP9ZphG
         wBQp9w16hx+AD//gU9/foIAMcQ//OGP3TVrOrArJD8uEaIuK1BheEg+zJf7ufQ4qDFc2
         O4+ZrN2u9vHyXFC73oZYursEjVX2/+hywcpiLejybuYvHWDG6XrhXQShfmjp1f+1E9xN
         r/xloYeH+wuomvV9dJt3I45pZj9uV9fNuKbA02HX1hlWGQorSw9Vi/nF6VGNdYjHvzm5
         toMOItOmbywrUZpAxxq7tww1m2IvRij8GQS5nTjdIwLQJxfcc3d9ctbJb/DfA3vDd2/Q
         YS3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvE95LfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05622a101500b003ff1fe3856dsi28812qte.138.2023.06.19.08.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvE95LfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHGU-0002To-UX; Mon, 19 Jun 2023 11:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHGI-0001Ke-0A
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:51 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHGF-0005N7-7S
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:49 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-988b75d8b28so142939466b.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190265; x=1689782265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwyvfHZPNQ11c4/mh/YpFzb69VIPygsGSZVclqK2vfA=;
 b=uvE95LfGZYh2BMO6LjSCuZv7DrzxLXTeVmf1iEcOjfgM/jNILBj6FWBKLtzy7WXF/F
 hJyJIx1ChAUeYzUAbP/aqh/qR6UEGF30oUhuE4HBvBjUngOcDhhs5Ag/a5eb0k+FaWe5
 xMJmkllTZXROi2m84dLHtvHJkzu7MVziAeZSJdpZ093QQMghsl7rBogNJoDTlV48cluL
 ebF4w7200Q/r43Rm+OQf1PSkzIYO6X2+SibKFg1gE/wFiWjXndtl+NdU4zVn/VRrOWiI
 D9rqswJz4AZNfYOMyp0bvjp0ek7hYbH/Uv/Ov5uNBzrNRj5QpnfAjelxlZuffrotlDrR
 WH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190265; x=1689782265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwyvfHZPNQ11c4/mh/YpFzb69VIPygsGSZVclqK2vfA=;
 b=NPYu2uc0cICK+U3W9AuR9QtDERV89r41Xr8nOsLB3j+4wY9sgdo4dVFFqHIjTxDx/B
 bF2KvY5w+2pIPEIs0KGcA7ye8HXQ9WZJ9gUXv/IEo0pOCkfMv2rbEpD9Kqq5yMt9pH9h
 0JX54Q3uLAI06jlsnlZt8OTnA+V7gdt1YrKm5bx/i5X9AtfU8kpNE6chDbZh8et+thVD
 bLlwwPSW4uAI4l18O7ufh6MBCdiXy+2qW3UPAMTk0gbR/s6txOHD83ri/sdZi+hqkINB
 vkz65Tz0gPHYp63gXR1zD4KTz+GsfiwYF4jUdETi5hnhH2e7J5JsiZfNZEzMNeguo3g5
 4fxQ==
X-Gm-Message-State: AC+VfDxwup5hKbaAGBUKD1bqEw5d5dv4l/6dAtOigsDLscITALJQeq1k
 29PQZt4c2v2qtqrG7b3WZjlfHw==
X-Received: by 2002:a17:907:320e:b0:96f:912e:5ec4 with SMTP id
 xg14-20020a170907320e00b0096f912e5ec4mr8509343ejb.16.1687190265375; 
 Mon, 19 Jun 2023 08:57:45 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 pj20-20020a170906d79400b0098822e05eddsm3090316ejb.100.2023.06.19.08.57.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:57:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 33/34] target/arm/tcg: Rename 'helper.h' ->
 'tcg/helper.h.inc'
Date: Mon, 19 Jun 2023 17:55:09 +0200
Message-Id: <20230619155510.80991-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IIim3oHofBUO

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'helper.h' as 'helper.h.inc'. Since this file
is TCG-specific, move it to the tcg/ directory.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.h                | 2 +-
 target/arm/{helper.h => tcg/helper.h.inc} | 0
 target/arm/debug_helper.c                 | 2 +-
 target/arm/helper.c                       | 2 +-
 target/arm/tcg/helper-a64.c               | 2 +-
 target/arm/tcg/hflags.c                   | 2 +-
 target/arm/tcg/m_helper.c                 | 2 +-
 target/arm/tcg/op_helper.c                | 2 +-
 target/arm/tcg/psci.c                     | 2 +-
 target/arm/tcg/tlb_helper.c               | 2 +-
 target/arm/tcg/translate.c                | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename target/arm/{helper.h => tcg/helper.h.inc} (100%)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 13d59d8417..6516852c06 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -8,7 +8,7 @@
 #include "exec/translator.h"
 #include "internals.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/helper.h b/target/arm/tcg/helper.h.inc
similarity index 100%
rename from target/arm/helper.h
rename to target/arm/tcg/helper.h.inc
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 31165b92a5..b32852e947 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -15,7 +15,7 @@
 
 #ifdef CONFIG_TCG
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63ed29b841..425cc86c7a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -26,7 +26,7 @@
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 58a573e21d..5573c0c15e 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -34,7 +34,7 @@
 #include "fpu/softfloat.h"
 #include <zlib.h> /* For crc32 */
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 83a1aa08e4..e75cb0100e 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -10,7 +10,7 @@
 #include "internals.h"
 #include "cpregs.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 1991eafe05..4100161775 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -24,7 +24,7 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 24205074cc..e1aadd63f0 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -24,7 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "cpregs.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index 2822a6b96a..e00b9b1493 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -24,7 +24,7 @@
 #include "internals.h"
 #include "arm-powerctl.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index e663aef2fd..3f8cb358a6 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -10,7 +10,7 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index bb8756d0ff..00b73c9151 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -40,7 +40,7 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
-- 
2.38.1

