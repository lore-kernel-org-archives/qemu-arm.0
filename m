Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2358191wro;
        Fri, 2 Nov 2018 10:11:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cGfUqzH/ZfLJrUayB1Y1PkezxeuEJmsdW/UG7WUerdliaFa6EDNXqe6HcrNYKauI2B4lMt
X-Received: by 2002:a0c:d8fd:: with SMTP id w58mr11976635qvj.103.1541178697856;
        Fri, 02 Nov 2018 10:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178697; cv=none;
        d=google.com; s=arc-20160816;
        b=WifBSNWuu7i/d6SeykcOD7xpjDVeEwUbp74Pwou8TF0ditUP22xZ+pblosFwn7fH52
         WtM/AXM3KXg7Mq6e9EaWaTSvpDqcXY0YEAZ16avWxZqAjwotz9QVLTLJsQ67YdwZXtED
         IWg3f78H9sFs7TgHsRomCsUtE1IyJIwwWCMIl/pIuhuiE5AV0nb9NDtnzpvHdZT4BVOX
         ZOVVSTvbzsZ/+87Rjvp3HgvRBMRMgAzMNPmoDTPtNiEmvDkgkBy8tjf9hIDz+xlDJCwZ
         mZ4pPTIrAkvm3ZROI0uXwFGNrkAMM9k1iorvElgpSWKqlqGN+qcG0+gKKqtsHqtpaeU4
         Ct7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZZLk+okyttON7yAlNVRY/FQ6D0uue8WTzdYajZi1jaw=;
        b=iNIrCTAmM5vP/gubbI3gKGHIo6KpUkY8JFjszPTu2oush8kzmuZDxdvhlPm1sic4H8
         ImkhNqMCQ5L7RxFyu4ZIf2RpBzkgv0AcUcNrXDSaxT0dmKfqR4QdCPF3xfckPs/NeYNu
         q1UCTaLbqWDJ75ASGWRLUB83NExVGVGkeQbn4W0nx8/x8C5D2ZP0akqNq0v1oYpHjos8
         2ZhHoBrk75tdY+AnURWHzCrgWMugqnbZw55YXCCtwXoh3SfW1pfbe5KzWXo2JIjA4IFK
         rRh+4oTOkQCVIbdQxyvR9eRXLBoFlwlrbuRqHD0BQmNYlIDJgi46ayxuf3cdi2amwR7o
         Ma0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si97510qvc.73.2018.11.02.10.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIcyv-0001Sp-AE
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvp-0007QK-5M
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvj-0004c7-7r
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:21 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvg-0004I3-5x; Fri, 02 Nov 2018 13:08:18 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id BAA474FF73;
	Fri,  2 Nov 2018 18:05:09 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:30 -0400
Message-Id: <20181102170730.12432-14-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 13/13] arm: Add Clock peripheral stub to NRF51
 SOC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8AxPojMIWlUR

This stubs enables the microbit-micropython firmware to run
on the microbit machine.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 36dac03896..ce8c61ae69 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -35,6 +35,26 @@
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
@@ -159,6 +179,13 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
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
+
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 89525dcb39..4610d0c7ae 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -40,6 +40,7 @@ typedef struct NRF51State {
     MemoryRegion iomem;
     MemoryRegion sram;
     MemoryRegion flash;
+    MemoryRegion clock;
=20
     uint32_t sram_size;
     uint32_t flash_size;
--=20
2.19.1

