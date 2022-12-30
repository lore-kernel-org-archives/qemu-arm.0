Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839109ejb;
        Fri, 30 Dec 2022 03:35:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuAblnhi1BiBsHLOoI5oyh86NIJq7xWunBYKa6+Yec6tO69sZ/As4J8gElxf3/7kXDIJ4KT
X-Received: by 2002:ac8:5406:0:b0:3a6:930b:b3b1 with SMTP id b6-20020ac85406000000b003a6930bb3b1mr45131747qtq.20.1672400153585;
        Fri, 30 Dec 2022 03:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400153; cv=none;
        d=google.com; s=arc-20160816;
        b=LUYyluffGTI1huz0ug/vj572/FTSFAIqQ1DKNp+Vs/FVaOD62j8ySHZtKAtjhI/cB3
         4jy0vqzOsRPa1pd8vFL0zIxjsFIoQo3jqPUjbB28nExm8NpQ2Q6Xc2vfbH9r1qNny2L0
         ZAJTU1yb61bHVoveZlfL6vPR2KoOVJWwcXkHMgsSQiDeVYJfqCSeU3jeAHDIl0dOloxI
         F+Jspfl6ZF9xA4eXBg1gcUU6X1edAK80EbgsOJZwvzI+SIUeeylLpH1gCXaYI1rXBv+k
         S12lGeUiWNUMWxlwVwkzgorwXHh92zZzYWT1rQcrbW7Aqra0S+UAdcHoJOK/O6xuA4iZ
         xwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YI/G5H9E5YA8omUhdoABDbtm2oFm0oJUgcY9rScXwCA=;
        b=ZrZmtsBb4JllIbp+0OTYul6L622Ni3OTpLEr6b8KwQU4/R4qtkPVzv5BuPBu/IXC9d
         db8zFwznt0HXtkrMm2AR3p8zsXcjxTXzWh5oE4p4+xW45FYKAmyW34D+7UjYU7S0aX9b
         WhGuPoL3c40EihiWRpqSFprxaMNR3S3RxOUr/5WgYxGjeTFPwHDCtGf9gbjAxyHYUz1e
         Fm99FcJBroeFnsShpQHY9QNKvilXhdc1HcEtjpq9xzoGY0lwhR0Q/byvut5ybtyLCFgZ
         fbCKfbSvpFJ3vq/ur5fP4/VgbIM1ZFIRNkpM4KqHgQosil70KHCPa4m4/1SR+/o8phwq
         pVOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVFtgJ2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac84689000000b003a6a94f29c5si9608617qto.740.2022.12.30.03.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:35:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVFtgJ2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDfh-0006HJ-2T; Fri, 30 Dec 2022 06:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDff-0006H9-QY
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfe-0003p0-7N
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so18250477wma.1
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI/G5H9E5YA8omUhdoABDbtm2oFm0oJUgcY9rScXwCA=;
 b=SVFtgJ2Lg7daTov8oRsCo8y6i6JXBNA/M9JMe3S2O6ZzuMgbewoJwL/YsXhNCRLRBi
 KKXXOaLsZULNgFFep8vSZTWSHsmJVQ8V3UtYiSGVLs1LTvPby1KdwlQXWyduTPq9u85g
 awmupWGCwtduWRDUm+/GtcG7WYXoDWfuspQNyS0A+7s2yDcwyxOC3+z0WcXwXK3Gf0yI
 +uLZbsyw5HiZTr33I9IyN1tZd1d8m8eCgDVgIYfxcvBoPaPEJijTtMUc1JFBpE5GCvfT
 cuJiXsYlAjd6wH6b5ttARo6VWoSnUa21MXrsTke2ChPCSLw9ywdUnMXi2f8l5ueY2c0S
 NGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YI/G5H9E5YA8omUhdoABDbtm2oFm0oJUgcY9rScXwCA=;
 b=DU/qB9CYg2pJVPb7FTSrPfqyPGd+vMi2GSpSP7jevmIsA2cwEFNcldfG5JTqHGz2UY
 Gyral62/lfP9SxaR0g1zP+JnC6UNgt96LOGTILgliY3qBPrbcK/qEYanfDOJY2ptKqGN
 m7umk+NszLyr6sU5Dg8MMF7WrEmLhOGyJKiJdmQ5BqoJFluvFlt98gf0FfMLgYSVgFDB
 cruWn0YpTRm65d2YS28XZgsj2/YzKfzs9pm3L7/L+cSmQkn360oQ8i+0T5jseH6aiIlo
 dCrwKEekKrkNS5DFSiGtwrF5TT473rjEdE+I+RhhQSR2cYJbfqYO9E4L+dsWZQ1esiLF
 VNxw==
X-Gm-Message-State: AFqh2komsUKgIn4QiLmqwbzTd4A0WSejKVc761LlsgI8bScJQsU4RFjV
 4yJvvVa4LkuacUlir46TyeHwtA==
X-Received: by 2002:a7b:c3d2:0:b0:3c6:e62e:2e72 with SMTP id
 t18-20020a7bc3d2000000b003c6e62e2e72mr22841825wmj.13.1672400129276; 
 Fri, 30 Dec 2022 03:35:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c2d0700b003c6c3fb3cf6sm26627128wmf.18.2022.12.30.03.35.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix definitions
Date: Fri, 30 Dec 2022 12:34:57 +0100
Message-Id: <20221230113504.37032-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CJLsANJTxjCe

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 3 ++-
 hw/arm/aspeed_ast2600.c | 3 ++-
 hw/arm/aspeed_soc.c     | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 122b3fd3f3..3500294df7 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
@@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->name = "ast1030-a1";
     sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
     sc->silicon_rev = AST1030_A1_SILICON_REV;
-    sc->sram_size = 0xc0000;
+    sc->sram_size = 768 * KiB;
     sc->spis_num = 2;
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a79e05ddbd..72df72a540 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
@@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2600-a3";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
     sc->silicon_rev  = AST2600_A3_SILICON_REV;
-    sc->sram_size    = 0x16400;
+    sc->sram_size    = 89 * KiB;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 4;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2c0924d311..677342c9ed 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2400-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
     sc->silicon_rev  = AST2400_A1_SILICON_REV;
-    sc->sram_size    = 0x8000;
+    sc->sram_size    = 32 * KiB;
     sc->spis_num     = 1;
     sc->ehcis_num    = 1;
     sc->wdts_num     = 2;
@@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2500-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
     sc->silicon_rev  = AST2500_A1_SILICON_REV;
-    sc->sram_size    = 0x9000;
+    sc->sram_size    = 36 * KiB;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 3;
-- 
2.38.1

