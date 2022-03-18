Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1365322lfo;
        Fri, 18 Mar 2022 02:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxghHb8PKQUFmUNsic7A333F/gYJFvJvknI0u4uLfx8ihYTrxlXtIok4WiguHMtRlynKmDr
X-Received: by 2002:a05:620a:468a:b0:67d:9a9c:68c6 with SMTP id bq10-20020a05620a468a00b0067d9a9c68c6mr5208389qkb.36.1647595386792;
        Fri, 18 Mar 2022 02:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647595386; cv=none;
        d=google.com; s=arc-20160816;
        b=wx3vbRE7aUyVzab+7rNh+1IF5U9Sl7WwV7MXE9G8xFrvSMl5PoYYsaeGdstCxT0GG1
         S5yPzbON+Jkkzwz6CthmstGOFGYkP+hpqtQ6R6KJALAT6pt6gN/VXiZKfCkNWMSvDTCf
         YwQS+l5ahtUVGTi5YwQ90Czz0pH5a4SM/jgvPSgDyL3fsVMPdSVPF2OWcblFjKgLMVe8
         6V3fjxdc+STH4nFJyIM9MIVd9VCLLE/VT2aZfZgal+7mzUjFDUC5+w9H5tjwouVs7XIx
         L27AyacaTagu7kzKHdwLVLjBXCM6SbbC7jSuvknC+iYHWhjHWDRQcGzxSJIhlkR3YpHu
         VTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nHGETHaVXNtsPi0lco553fyJznNW89sINeC8HeBuvX0=;
        b=JXEw2cahNxT+0wVzpMDIM6E78xGC8pQqD153swMRPRjHFySiPbiC+sFYT9TnSvSzR6
         7FQMTPwqUAxZSUXPRjFvDfQAyhifb5vlqRAlUWs/NzZKAiinhYKmdDzLQM+3MaOo49wJ
         5pIpIjLSvkq6ro8OUi8nzQ2avV28ZORVyN22jeYHr7GIS837yVJqMnLGrxHZ487BDVFL
         vSxPg8bzCsVFK5W10wZ7Nv+guAeLYjTSXzdeC/xuUfa5uLPVXOx5cealP5YHE3Qe24i1
         GRNUqKm1UJJw+xqvDN8V5G7ES4RB5HRm4rTG+XCJuLVbzoKh+xeuilmGXF3qfp7Q5FwV
         3ojA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZopFsOss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj23-20020a056214529700b00440d35b05c1si2245302qvb.397.2022.03.18.02.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Mar 2022 02:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZopFsOss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nV8p6-0007L9-Uz
	for alex.bennee@linaro.org; Fri, 18 Mar 2022 05:23:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nV8oV-0007Kj-Oe; Fri, 18 Mar 2022 05:22:27 -0400
Received: from [2607:f8b0:4864:20::62c] (port=43537
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nV8oT-0002KB-GA; Fri, 18 Mar 2022 05:22:27 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w8so6523144pll.10;
 Fri, 18 Mar 2022 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHGETHaVXNtsPi0lco553fyJznNW89sINeC8HeBuvX0=;
 b=ZopFsOssHX1y2smNJgmXUDD+MOSEwO503991IuASLvr2FHuBApiofNurRiHS1wxnpD
 J2RG/k1qdcpdtvi8t7cdMEns22z79Rj2VrMJBAh66TvyRvB1EAByKlH1B+N4vFNlQu6O
 gwu4sTjeJcJXkQi/8MBuTiTYfeUUkDuR0gJDjzCU3jFwfocTMiFDRO70gnxQcmOFWB6t
 qZP2PeTA+sYDN75cXFhQkVpHbjrkvRurlo+e1EP1sy+kfs/bcXBdOl3R63LFi+8zUK2Y
 U1AyF0GF5rmyVALiiPzUCRBw6VjMY2HHfVo/XQP+xUHmD3lTGujir5MuxzWlEwH9BHbp
 rHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nHGETHaVXNtsPi0lco553fyJznNW89sINeC8HeBuvX0=;
 b=as+OXEB/zoJRu9pyd6jNfA0f1PIpcW34fgkUf/5wPZmal3KdXW4iaHhd1h4TRg0Hqk
 YkLM1qvEuMQxpE6B3lG87cSV1fHBjY6lOf4PaE4syB46K1wPFTB4nA4W2vNhl/5YkAnP
 QQ0W9zJJFfw/ThII4q08jHOaY0vvc9MvQoOoiB0EltahkoqiFOAUHCHfanpVIv5xiN31
 QAw6BL1/0HXAls8KPWl1S6JYU28Ro3mnnOkkG8oH4ph9vdtyNX0J2w3AALPMHg3JOCu9
 YLgz0sJ4TKY7aEqWOKiddEwSAiKwYYdH8cc35+A95NDzds/DNrBW5NF5Hj2lQASe//72
 Zlzg==
X-Gm-Message-State: AOAM531PCtJSfbmZcsyKxzmhjE+i/d8pdxEXrKCsJknJHDabmWY0cNNO
 uhHxvF0uxY9VcADxuji22kI=
X-Received: by 2002:a17:90a:730b:b0:1c6:781a:312f with SMTP id
 m11-20020a17090a730b00b001c6781a312fmr9911020pjk.53.1647595342128; 
 Fri, 18 Mar 2022 02:22:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm9438146pfw.188.2022.03.18.02.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 02:22:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed: Add eMMC Boot Controller stub
Date: Fri, 18 Mar 2022 19:52:11 +1030
Message-Id: <20220318092211.723938-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nuZB5F9eZdKy

Guest code (u-boot) pokes at this on boot. No functionality is required
for guest code to work correctly, but it helps to document the region
being read from.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cf484eae0e60..b9cd51119608 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -119,6 +119,7 @@ enum {
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
     ASPEED_DEV_SBC,
+    ASPEED_DEV_EMMC_BC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
     ASPEED_DEV_SDHCI,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 25ae916e31ae..11cb6cf86bd2 100644
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
@@ -267,6 +268,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
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

