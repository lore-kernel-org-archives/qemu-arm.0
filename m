Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3844937njb;
        Tue, 10 Dec 2024 22:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUS5S2GqoIJOUW+hgZEHbY+BG6JSqSVvxuphnsVccz+iHAUCvHg4rlj+8368V/f5czkVZWVVlfiEiwGsA==@linaro.org
X-Google-Smtp-Source: AGHT+IHam6zZNRi9bOkKKTa4BpM9iHCEBxUQDPVTOFxXJsCjWewneh2vs+h6A4fkrc9f7P7Iep6w
X-Received: by 2002:a05:620a:2724:b0:7b6:d959:59e with SMTP id af79cd13be357-7b6eb42fa63mr347070785a.3.1733898727183;
        Tue, 10 Dec 2024 22:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898727; cv=none;
        d=google.com; s=arc-20240605;
        b=Au570A+e41bpLa48fILmz+GmszpzkGnq49rYLj5hs298QnVj8lfxxroy2axY2uKX8x
         yKka3TMMT3X/pVvxDgYycJdmCldO1aBzqeBDaaq65Pohw+k0MXFMY9fAl50ng8mLrNnw
         4npaxykmw5W3W88cjRq2htrKjda6TZah4Og5fdMjZgyZaKnk/FdMOYwXvfZV0dKNfYG1
         8ruWnCw+g/JnLGSqxl/aNKAWin4WBe1JiUeTKsEYdgH5G4zbcsZ7ES6nv0IunMIxu5aS
         k4LXB24bSbeB2FcGxGI+NvKdZ197sQm8xZx1SNv4VSzgRKwgqu5S07w/x6n7kGCUmiqi
         Z9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aB+xyCpAu0fwyBlNlIaTk+3CdreftADrn3CAZZfGXIM=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=JC1POR7eP30h5KtjGof844/gruKao0nyC3RG3/S9ShpILdP1ul1o+n+XUyQMfzBW3Z
         Vbzwvb4aKSdYVbBCGzuwnjY6cwNhOq8FNLNa/6019Y5Dtf/KNuk/3iVmR1j+M7exWO24
         aVZlbvOKD/5iXPBk0LnCuirk6EQKPn4iLIW6HrseJ2pLTJmLNHwpndudfXf3elSE6xTz
         wforeL9/60fKAPtCJJD9F1br8VZACDeRxbWKNq3qrZ5C0c5ydwo8xQt/dquJ3FfH50F9
         GU+SuUlYVcSJeAyUJio67biUX/wmrY5y/MUPlvzlUEBUEUc217GzkprkqtHnuC7ghn3K
         upCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HoGZWxve;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6cc11de8bsi23463785a.306.2024.12.10.22.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HoGZWxve;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLGGI-0004rN-5P; Wed, 11 Dec 2024 01:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGG2-0004ct-Jk
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGFu-0008SX-Ey
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aB+xyCpAu0fwyBlNlIaTk+3CdreftADrn3CAZZfGXIM=;
 b=HoGZWxve5iIlPSJLhTVbKTVmgpanOwFR3KEV5TtiCe9KVqNsSjmx4DFSJJpQWcJ2DfFpOj
 7yzI4CCYqViejLVXy+WrVbX/ZTYyvBkH7fxXbRHENCLCwo1p06/ZE7VR/vRdIIUZ0H6CkY
 vPaRE/+PjiWmUvuCDymAMxHYuhfX6vI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-aphORo-UMxixbAXsBcbolA-1; Wed,
 11 Dec 2024 01:31:24 -0500
X-MC-Unique: aphORo-UMxixbAXsBcbolA-1
X-Mimecast-MFC-AGG-ID: aphORo-UMxixbAXsBcbolA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DCF39195608F; Wed, 11 Dec 2024 06:31:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7E3E11956060; Wed, 11 Dec 2024 06:31:22 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 07/24] aspeed/soc: Support eMMC for AST2700
Date: Wed, 11 Dec 2024 07:30:41 +0100
Message-ID: <20241211063058.1222038-8-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /or0XCWDfmPq

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add SDHCI model for AST2700 eMMC support. The eMMC controller only support 1
slot and registers base address is start at 0x1209_0000 and its interrupt is
connected to GICINT 15.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241204084453.610660-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index baddd35ecf7d..23571584b2f6 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -391,6 +391,12 @@ static void aspeed_soc_ast2700_init(Object *obj)
     /* Init sd card slot class here so that they're under the correct parent */
     object_initialize_child(obj, "sd-controller.sdhci",
                             &s->sdhci.slots[0], TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "emmc-controller", &s->emmc, typename);
+    object_property_set_int(OBJECT(&s->emmc), "num-slots", 1, &error_abort);
+
+    object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
+                            TYPE_SYSBUS_SDHCI);
 }
 
 /*
@@ -701,6 +707,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
 
+    /* eMMC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->emmc), 0,
+                    sc->memmap[ASPEED_DEV_EMMC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.47.1

