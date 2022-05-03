Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1229620lfj;
        Tue, 3 May 2022 00:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0dJHDt3tyiAm/SUJfyjgoCwv0q4qnCOCRIk6UqAzpvfKbsjp4Nq4+eWMekdCCzopwVi/j
X-Received: by 2002:a05:620a:2988:b0:69c:712c:6230 with SMTP id r8-20020a05620a298800b0069c712c6230mr11442999qkp.278.1651561866793;
        Tue, 03 May 2022 00:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561866; cv=none;
        d=google.com; s=arc-20160816;
        b=vWY+oYTs+v61KwLg/hxSM/vOP9x60a0iVT07Wfh/App1S9T8W8t7NwCGM90GCjQoWv
         6ezyvrwocfYe385Vw+9sFwxz3JwkrjdHUwg63QZvraMUs3f2zsh6aaBwKD3nLB6pwY9h
         2HlBPP4kDL8mxgJ8iaBjOk7Qfb2Tb0MNcnshdidkk5Qdx1L/9Zg4HT70LUC/UJOpOQLc
         u7xZbKt507j3qvg7Oi9H8H4dRM9a5bJWgmw1er92pgEb/Jv88IAkyIUnikFTq3Xhqceu
         mbHybsQtVGo9BDvTRx7eaudvlqf4y6ZXy7PK/pzZeItlLC4iwcovEN4Ihth31jflJgIv
         rgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Ey7qbFhUtqwcYmhTIo1/wimoRh1jHJ76L9MjKgMOTrg=;
        b=aFi1WuOXhppQOzu/cQtKovYOn9oym82wMt5CWyle1d8sOyYf7AgfVQKp6/a4Qbm3WP
         4pvNsnoVTTkSeVGril86Td1mcFW2/IohSg+pdf5DZlI3Kwxk1T4VWHiMkZEBsIwvLoRj
         S47JTCgNybflgZpWL9JlYGSyMWHyq1dS0NUjVyCmWagD30wvi9DgzC4A24ngqblejvZ0
         C57pYNBLPU7Dssnhww+AnhBbF+OXXXmB8EYzq1Nw33lGkiSph69OSccnWQmYNDcP2dCF
         PETpvL5E1on42eYI6JtM+lSGrO3PsAXDyeLLRFjaj+u/TFALy8UOA9MtcBcaSQ5otX9Q
         R67Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a05622a164c00b002f3a9a54366si1905376qtj.332.2022.05.03.00.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmgc-0002f1-9t
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV3-000362-0p; Tue, 03 May 2022 02:59:12 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57185
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV1-0007Sa-7q; Tue, 03 May 2022 02:59:08 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRB50ZSz4yT1;
 Tue,  3 May 2022 16:59:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrR86Y57z4yST;
 Tue,  3 May 2022 16:59:00 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/19] aspeed: Add eMMC Boot Controller stub
Date: Tue,  3 May 2022 08:58:33 +0200
Message-Id: <20220503065848.125215-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: PjU8DdKgDcni

From: Joel Stanley <joel@jms.id.au>

Guest code (u-boot) pokes at this on boot. No functionality is required
for guest code to work correctly, but it helps to document the region
being read from.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220318092211.723938-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index da043dcb454d..12dc4c42a8aa 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -112,6 +112,7 @@ enum {
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
     ASPEED_DEV_SBC,
+    ASPEED_DEV_EMMC_BC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
     ASPEED_DEV_SDHCI,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c1e15e37739c..eedda7badc37 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -48,6 +48,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_ADC]       = 0x1E6E9000,
     [ASPEED_DEV_DP]        = 0x1E6EB000,
     [ASPEED_DEV_SBC]       = 0x1E6F2000,
+    [ASPEED_DEV_EMMC_BC]   = 0x1E6f5000,
     [ASPEED_DEV_VIDEO]     = 0x1E700000,
     [ASPEED_DEV_SDHCI]     = 0x1E740000,
     [ASPEED_DEV_EMMC]      = 0x1E750000,
@@ -257,6 +258,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
                                 0x1000);
 
+    /* eMMC Boot Controller stub */
+    create_unimplemented_device("aspeed.emmc-boot-controller",
+                                sc->memmap[ASPEED_DEV_EMMC_BC],
+                                0x1000);
+
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
         if (sc->num_cpus > 1) {
-- 
2.35.1

