Received: by 10.28.4.212 with SMTP id 203csp729996wme;
        Fri, 20 Apr 2018 05:55:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqrGvIJQX+/UEgO2+13FXNWLgH4UOw2RbJ2yMLlcHx1iovpKEwbo+JTXWt+JAoH9LxEuZhz
X-Received: by 10.55.74.19 with SMTP id x19mr10426705qka.345.1524228948956;
        Fri, 20 Apr 2018 05:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524228948; cv=none;
        d=google.com; s=arc-20160816;
        b=mO90Oat0eJ20ukyxL6VmwDVacf4p5JLnoZhCkMf/n2nvxOSdxFGpkmHHOeB27Y4Zdn
         aSBc0zCTcMzSrd8nnRLL1cE2Uez3g5ci81jeh9zM6oAWhDIaJAoBOUBCELMTNbC2rtbC
         lZZmOhXspa5LDD+/KlzocnINyW+zItlwrT5hgLZH2psmED4KlbPdsNENfYXms2LnBcOd
         7vF5s/idvumHUjlh4X4IdmK5POsgsV5zAmIXV/oK5OhwFDrG6I3FC9h/rc4kN1H7/llr
         4kHDLYVUi5KuoD8zXb5d4HxQ35N6pJlsV8NpHjN0F/m23Qtf86rdIfQq9B/gloN5RQ1p
         TMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dZGhnFxdKp4EU3mvJrUxXKvM3nIY6uelg6WbEp7TyGo=;
        b=HbNGQy2P9ve3Np91QCulx3BkoklaWWUKnHrfGnkU9munhZZpMmY22TV0lfgdVKLsN1
         8sfixu2TgBHyDCHz7QZSplKEX3FGQNDuJGpdnvUizGfqa45jyM2hFBpeDz8+EMcROcJl
         XHSVIRFBAnJcJR/EZQC6zJVSEXpGfaQwPGkvmVKMdEwTJ86l9wzgDdLPZv8e9j8f6J2f
         bCWhfFM9m5tfIdAJU/5IJxytTdRX+NK4h5uj4HzXTRQkKnbQ25p8N2dH+QAEwmWej1dQ
         w8bQ33Du+u3hduIq+0DCWWhVHU27GFF224VJyO4PTlqa7gA8Z/1xmHPnPu/0oyY5ll1S
         irBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o55-v6si1259626qto.271.2018.04.20.05.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 05:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9VZs-0002Gt-ET
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 08:55:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZd-0002FI-TX
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZc-0008Q0-Dq
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9VZc-0008EW-4M; Fri, 20 Apr 2018 08:55:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9VSw-0004nA-OM; Fri, 20 Apr 2018 13:48:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Apr 2018 13:48:35 +0100
Message-Id: <20180420124835.7268-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420124835.7268-1-peter.maydell@linaro.org>
References: <20180420124835.7268-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/aspeed_soc: don't use
 vmstate_register_ram_global for SRAM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jRSjFAzLswiw

Currently we use vmstate_register_ram_global() for the SRAM;
this is not a good idea for devices, because it means that
you can only ever create one instance of the device, as
the second instance would get a RAM block name clash.
Instead, use memory_region_init_ram(), which automatically
registers the RAM block with a local-to-the-device name.

Note that this is a cross-version migration compatibility break
for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed_soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 30d25f8b06..407f10d0d4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -186,13 +186,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram_nomigrate(&s->sram, OBJECT(dev), "aspeed.sram",
+    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
                            sc->info->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
-    vmstate_register_ram_global(&s->sram);
     memory_region_add_subregion(get_system_memory(), ASPEED_SOC_SRAM_BASE,
                                 &s->sram);
 
-- 
2.17.0

