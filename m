Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2593497ejb;
        Wed, 25 Oct 2023 02:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdP/Lt4VchTYFShTtAyGW1tsaY2UVDlXv1iMA4Bz0qAZeWOaado6HiCbwQQ/LaQdCsU7VM
X-Received: by 2002:adf:f68f:0:b0:32d:9e13:1bca with SMTP id v15-20020adff68f000000b0032d9e131bcamr10640089wrp.27.1698224529590;
        Wed, 25 Oct 2023 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224529; cv=none;
        d=google.com; s=arc-20160816;
        b=s3DJYDE/9Lf+xvfjav8myX5dqqW8TCRBj4NYkO7Eiadvd6Cs6dI+ONPt7CupUjz6DS
         cb6g+VEb+0qLRWXyVDBqWi8Y023qXifoLVcEMSpw+Ui7nnIQGfsSGz155t91OFVenYID
         tED48QROjaMjP08n0g74cEjdaHC317Bu/jlK5x0P0t6PldTtVeRP0c1FZwOFmUMX1fu9
         m70/HCg6I1HUeuzDveykOVNDr7kGSZMAzkvTUh9KJ9i8yZZGwSQ9eU3eaplEyawvYuvF
         zA8PmCAOrh83gpq7LxsFAQojsT1CqwVwb37vJ2vG+0ntFLA1HwKRWCe+DuRREQTVfElg
         ZfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0uD0KVJq+dJcbbQ8RmRBgAFk1waL97XSi4IS4aQx+HE=;
        fh=2AKgK1B3EYiX6882ovZW+CwIStVbar5zReCRX1lYnfY=;
        b=uhzOyHAhRygIHPnAJutkkHIr0KD3hH2MY01xdeV79EdPnffTpRmueOQbKV6rI/Eykv
         Zzeyl6iDxXm8sUHiZ6uXsZt7+ynm9T+iuVW4vJVK8uxD2U2UG1+9M2ry2Qmon/Sj9opf
         et+2h+oMj9gDDw+Oe6ars9xPxkP7SAe/8PafAe5GOuEpq3sDzJAmyXHzT94gto8UYCb4
         rSuIsFaD/BP9Zy0EVzB6jPK3lN1wAMNsa5Ey9IV/1FfIOOXLNQpQCLaOwvEUIdrqJBc0
         FRsvqJBgcAZSxOtGBc3GFHDo2Guq2HEy9TgfY1niWcUxzNc1EMcPMzG6kTRCqzgvORUb
         FLIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs4-20020a056000070400b0032d9df9acd3si7287178wrb.633.2023.10.25.02.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvZkT-00007r-Co; Wed, 25 Oct 2023 05:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZk9-0008Eg-83; Wed, 25 Oct 2023 05:00:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjv-0004U0-AQ; Wed, 25 Oct 2023 05:00:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjYG2Vjzz4wd0;
 Wed, 25 Oct 2023 19:59:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjYD5j1cz4wnw;
 Wed, 25 Oct 2023 19:59:44 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/12] hw/arm/aspeed: Check 'memory' link is set in common
 aspeed_soc_realize
Date: Wed, 25 Oct 2023 10:59:18 +0200
Message-ID: <20231025085921.733686-10-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025085921.733686-1-clg@kaod.org>
References: <20231025085921.733686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: cqJulfOxHxw0

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc_common.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
index b66f769d1807..828f61093bfa 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -114,6 +114,16 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
                                         sysbus_mmio_get_region(dev, 0), -1000);
 }
 
+static void aspeed_soc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSoCState *s = ASPEED_SOC(dev);
+
+    if (!s->memory) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    }
+}
+
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
@@ -126,6 +136,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->realize = aspeed_soc_realize;
     device_class_set_props(dc, aspeed_soc_properties);
 }
 
-- 
2.41.0

