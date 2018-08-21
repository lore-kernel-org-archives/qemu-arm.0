Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1958884wrd;
        Tue, 21 Aug 2018 07:08:25 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwYRgytB0KCtTnU7tym9f3agUGSDeUiVt+ipIs/2/L4tl17DkuUa9/4I8c49XBUthhyLjNQ
X-Received: by 2002:a0c:96eb:: with SMTP id b40-v6mr46074759qvd.235.1534860505475;
        Tue, 21 Aug 2018 07:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534860505; cv=none;
        d=google.com; s=arc-20160816;
        b=BE6mzKkuIDkhVqztryq5ms8JxlTqji9DRoEE7ieRNfKlGwp8WuGFI8vkKos1ZmluEv
         HFAlFp+80a3JVkOBeSUSCqs9tQNgV5/Dw1ONknt9PUYR0fHEEEAWkY1Rz0C/PWRTGC4C
         0dRccdZNANSqXJ7UKUwiDjRL5twRKAH5PO3h5c2ALZS9GNYn9qZFRs1zCCO90f1jw1yV
         fBz6Ls1RbtJjXJSYrRWLF27hxmKoOVRIgmCfRA0tft6gofzfMCzzb9F95/C9UkpQi3He
         lzAs64+6KlTvaO0dfdmOCMEfXXhpFFLEtYfCnx9mZ+9bl54sX20yY+UimOU9WmsEsRYR
         EuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qAYLBtbJko9TjyG7O0OE8iHL5ARHwqiC7l39u4grpWY=;
        b=v3rd4JehL6QOJQCxLV5HLrqB60dY0I9VA6Ta2tznlpjMoktVVWSIIruwzaltgeqWBr
         Fl0tvLRb9ODZzK8TENvJCFidbMzPmlMbti4CCXGqhbDchPUDtTWOLOQz82CWtL7vGBI+
         JKS+vyzqFffLP8r2l0nLPvKFSg3rT+eS3lgi9XKtjQupcASgnVYCxK2E+v4E7xTVOHQX
         UIG/S3UhK0vw31oZx+2LOPpc1dPKlmX8tuV47eje8x8JNEbFxGt/tGA1GoMaDnU9g8ld
         bbpoJLhCQ19Cf53yTWkrbFx/4d6XyQHz0M1cyX7tnaoFMCC1YrD2n6flenFuHaYynBj7
         Hi7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65-v6si4262330qke.135.2018.08.21.07.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7Ka-0003ZM-QG
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:08:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i6-000639-JQ
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i4-0003sQ-D2
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6i2-0003S5-Pj; Tue, 21 Aug 2018 09:28:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hk-00049L-Ct; Tue, 21 Aug 2018 14:28:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:04 +0100
Message-Id: <20180821132811.17675-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/9] hw/intc/arm_gic: Make per-cpu GICH memory
 regions 0x200 bytes large
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6++PEMhy4ekA

Reduce the size of the per-cpu GICH memory regions from 0x1000
to 0x200. The registers only cover 0x200 bytes, and the Cortex-A15
wants to map them at a spacing of 0x200 bytes apart. Having the
region be too large interferes with mapping them like that, so
reduce it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index c1b35fc1ee2..542b4b93eab 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -2084,7 +2084,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         for (i = 0; i < s->num_cpu; i++) {
             memory_region_init_io(&s->vifaceiomem[i + 1], OBJECT(s),
                                   &gic_viface_ops, &s->backref[i],
-                                  "gic_viface", 0x1000);
+                                  "gic_viface", 0x200);
             sysbus_init_mmio(sbd, &s->vifaceiomem[i + 1]);
         }
     }
-- 
2.18.0

