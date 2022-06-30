Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp253913lft;
        Thu, 30 Jun 2022 04:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzy1M4e9q6xPCHRvcro9Z/IcfVqswFYWg/qUq5y9iFYwtyU/eiJn8uf6doIcOIWBtD79OD
X-Received: by 2002:a05:622a:1449:b0:31a:daa0:e0b8 with SMTP id v9-20020a05622a144900b0031adaa0e0b8mr6945158qtx.539.1656588399106;
        Thu, 30 Jun 2022 04:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588399; cv=none;
        d=google.com; s=arc-20160816;
        b=zFOfLZ3H1ZCtB6nI+cjp+HI+Qwr7WBpq5jRqIkVlyA0LOHiVg7dtb9JmJrxOsUd260
         TUwQrwsMsC+uarB882ALOINE5J3H1JgZ8LGI9Kb0G6rBE7YrYtq/+2NNMU8QP9h5udT6
         RcjJw3SNBsKg/qcNG1Yns+BBqIijDtqteKI3cK8i3hIruC/CX0acG/+amTlOSH3/t7h2
         TAJ/V8ZsS19VtkDwZU+jr3yq739VqEHqpy/zBBAB88HYlex4P6ol++vQEhxFuHNopVSv
         GGdc3rbaoiUaDva1Jay2PJEp0xtGwVFw56/3jpcmcmxurgzoJLcplhr4tCy1NzQIDSgX
         K7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=rHGKlVPVeAhWHIZikbEzlz5UvlNebNgJnizaB+AGMD8=;
        b=jq1ck/9gxDoXKf36Wb05ogpzyGezeTkMs8PCNSmfowrGKREgBQKxWMdLRjuNJwDZof
         UyAIDNIjqhbv0OHnB52ozcJXnjnqMKe5V+uFPpKPgj8802qnlteEp3PXFwiRFP9qUvpL
         ZymlHQt2BmncZWQn0FdkDSoHDoLx+mNud5vKDoOtEqhiMkSvvLj4MiONF/3tJHL3pc+o
         mPc1A0uxJjRjksjNrXakP4kjMm8CKKBcsSHPhrki8rsckJf8H45+KRYJvnyszzBgVz3l
         rKFXePYVlkiEiVo8arUoEST6uVlz4w16WWWbG8dEWfDJqzkhCq3+s7K3iEIG0bIgFz8i
         A5Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a060600b0031776d8d1a3si10673530qta.349.2022.06.30.04.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sJi-0002IC-HW
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHo-0007Q0-Ik; Thu, 30 Jun 2022 07:24:40 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54405
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHm-000201-GK; Thu, 30 Jun 2022 07:24:40 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZs38Yrz4xXF;
 Thu, 30 Jun 2022 21:24:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZq4gfwz4xD5;
 Thu, 30 Jun 2022 21:24:35 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/27] aspeed/smc: Fix potential overflow
Date: Thu, 30 Jun 2022 13:23:51 +0200
Message-Id: <20220630112411.1474431-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: c1EpAb6xWynT

Coverity warns that "ssi_transfer(s->spi, 0U) << 8 * i" might overflow
because the expression is evaluated using 32-bit arithmetic and then
used in a context expecting a uint64_t.

Fixes: Coverity CID 1487244
Message-Id: <20220628165512.1133590-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 68aa697164d4..faed7e0cbe17 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -488,7 +488,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
         for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+            ret |= (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
         }
         break;
     case CTRL_READMODE:
@@ -497,7 +497,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         aspeed_smc_flash_setup(fl, addr);
 
         for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+            ret |= (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
         }
 
         aspeed_smc_flash_unselect(fl);
-- 
2.35.3

