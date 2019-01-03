Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp428203wrt;
        Thu, 3 Jan 2019 01:21:19 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5fNRvHWau+J3+dw6AMzjWs6BlAIteA+60AEKn6dt+CC5fWPUIkEKF6/bKHtJRs57O1vcen
X-Received: by 2002:a05:6214:c7:: with SMTP id f7mr47042991qvs.44.1546507279037;
        Thu, 03 Jan 2019 01:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546507279; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1i3eIyMyuvwZSajXysGAMrF4SMktOYbJBva96ppuasQ7K51+OdG7XPB/M2+7xGXoI
         OqGsmywgM5dE9uIrSEOJyImxFJuAZZLSlLeOWu5Fn1pfB0lq0/AdfP23LzXWTbSQ9/O+
         XzL2fsNtc/zV4hsN1fzU+KpxwG/F3h6GgEiLrIDDLQ2kp806zR/0RbFhrk+eW3emL93A
         WGpJNyP/hgieeyPsAiJvBORnhib+nKhyOx7dA6NxWD7T2G+ilDVuy/K9DT2lhx2zrYkE
         n7W6rMSGczZVdZberPNsTxHmo2GLGmjr30fQ0ncHBIbpzJ1rn7nw0fasCxw2G2EVnr6e
         acVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LhKc/IAdPPKEP2fqMM/lC1xCmN4mLBHaTruT1CwinCk=;
        b=0FsKYIInSvj1OQvtyKxIiqXbvOFT5spY/pR8Sttv3i61gsDzEcEXxNrnNsm9HvtvVh
         khRJUGN+lAjongCklK8Fz3Usv1lEubrDkRkTp3BlJtCng5FW3qXvpY4gUD/wdrLSX8Zd
         9cvLSfVmX6Lf/92/m7JKBnCJobtNOco8eKVO8fs2PodaeGatCRnqDMA2VMIWWbLfM6WJ
         UK1/uPJaKTXFPQKE5RwRvskE5nqJOi/q16uwJedE5lFgv+IZg0IQAlnent+zDprfE0LL
         VeVBFcfGtKYlCda4YjkPEbBmJs7oZVr63xRSdEGGG+ij5dXTx7y7CVwBXWt12VCr0sfP
         fSOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y65si3620123qky.128.2019.01.03.01.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gezBm-0004Fe-Dd
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:21:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez43-0003wo-To
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez41-0006pW-TZ
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez40-0006o4-6i; Thu, 03 Jan 2019 04:13:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52C4E13917;
	Thu,  3 Jan 2019 09:13:15 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979545C26A;
	Thu,  3 Jan 2019 09:13:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:19 +0000
Message-Id: <20190103091119.9367-12-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 03 Jan 2019 09:13:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 11/11] arm: Add Clock peripheral stub to NRF51 SOC
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B2gFvromsBlB

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

This stubs enables the microbit-micropython firmware to run
on the microbit machine.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/nrf51_soc.h |  1 +
 hw/arm/nrf51_soc.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 39e613e1c9..e06f0304b4 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -38,6 +38,7 @@ typedef struct NRF51State {
     MemoryRegion iomem;
     MemoryRegion sram;
     MemoryRegion flash;
+    MemoryRegion clock;
=20
     uint32_t sram_size;
     uint32_t flash_size;
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index ef70bd62fa..1630c27594 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -34,6 +34,26 @@
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
+static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
+                  __func__, addr, size);
+    return 1;
+}
+
+static void clock_write(void *opaque, hwaddr addr, uint64_t data,
+                        unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
+                  __func__, addr, data, size);
+}
+
+static const MemoryRegionOps clock_ops =3D {
+    .read =3D clock_read,
+    .write =3D clock_write
+};
+
+
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s =3D NRF51_SOC(dev_soc);
@@ -130,6 +150,12 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
                                             BASE_TO_IRQ(base_addr)));
     }
=20
+    /* STUB Peripherals */
+    memory_region_init_io(&s->clock, NULL, &clock_ops, NULL,
+                          "nrf51_soc.clock", 0x1000);
+    memory_region_add_subregion_overlap(&s->container,
+                                        NRF51_IOMEM_BASE, &s->clock, -1)=
;
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
     create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
--=20
2.19.2

