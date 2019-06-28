Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2340038wru;
        Fri, 28 Jun 2019 03:40:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziaX39C2bKfa1DSOOs26dhF40JTi5DVsU0ceQ4cT4xPi2fTj7X3Mf664D2ov/Hd3KM23p7
X-Received: by 2002:a17:907:2130:: with SMTP id qo16mr7907269ejb.235.1561718456837;
        Fri, 28 Jun 2019 03:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561718456; cv=none;
        d=google.com; s=arc-20160816;
        b=fcbN/VT1pV6YP8YYmx7ukw4TSDDTgLdeL94Onz5/kLeM+lIBAjEYGuy8hR+FZQoc/x
         tDkE6UVCAiK7Mk4PyzX+NcJnpCZw/OuBCOAPw3VnaM1WKZU/hzI2iV7iJCAiBt+G7g1e
         0H5/O6tsQxhSiWNT8Kpr5rIXy286kDTRlkNtyzJJMAuUpUBPAveF7ziVGzPtZXiaNTkt
         IN6EwFN26Igm6tQlA+dA6zeNWpFHH+lbWPrF1t6Qdziu/NkrEL9Sw0kqepI50JaZlFEd
         iQ2EF5Q+j2+ZHruc5UfnqQdI2ExDHeB+6vSH8qt3Y2p28Ye8+3yrJHbNYqcRnCTyQeOl
         NWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rs6GbXG/E5+NJU9n+8F17TVRZrJJVYB1KvKPEoTOFPM=;
        b=a/XrwSDmyvSTEp/vh6FHwzHTtEs1hXFYw6TyVOAIGiZCQ+dPt3YhsVCUNvk+udaRxF
         QVccwERWXYLFTLUJ/eINev2vK6E56Y+ouP4XXk9DgLtsAymhlheLzjkahP9ItGK8L+0P
         FRx4M2tYudvJV3xWzvz6GjXiAqPLpEPu51rfjCHa8If/hwzr1XdIoAm3E1XVxIR438de
         Q9nXAQc2nofAmyNv+zhNfL0xGfWA/DRIqzvjMM1HHUDBAlssBdNw6V4tHVrqtXnDQEVm
         0pybaUe6n9982EKr5ltUQgR7UhmFcmziQpOh15B58hY1bhuY3v5xldyAtoSs/sCQCZAO
         nw7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si1549608edb.356.2019.06.28.03.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 03:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgoJL-0002fV-U6
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 06:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60517)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIn-0002G7-OQ
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIm-00066U-Mx
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIk-000628-Q2; Fri, 28 Jun 2019 06:40:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 321D044BD1;
 Fri, 28 Jun 2019 10:40:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CAD60C6A;
 Fri, 28 Jun 2019 10:40:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 302EC17536; Fri, 28 Jun 2019 12:39:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:57 +0200
Message-Id: <20190628103957.9504-7-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
References: <20190628103957.9504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 10:40:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 6/6] ati-vga: switch to vgabios-ati.bin
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0ohqFZ/8dV6

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190620151104.2678-4-kraxel@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index e1bde5e0b1e3..0cb117384839 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -910,7 +910,7 @@ static void ati_vga_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_DISPLAY_VGA;
     k->vendor_id = PCI_VENDOR_ID_ATI;
     k->device_id = PCI_DEVICE_ID_ATI_RAGE128_PF;
-    k->romfile = "vgabios-stdvga.bin";
+    k->romfile = "vgabios-ati.bin";
     k->realize = ati_vga_realize;
     k->exit = ati_vga_exit;
 }
-- 
2.18.1

