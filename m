Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5469591wro;
        Tue, 30 Oct 2018 04:54:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cjrIwJLyCHIZlSkMFZjLEqIpGnGN4PZtzMwiNlo5IN1rAVCN0DyRlAna7QT2tuO8dzk453
X-Received: by 2002:a0c:f4c2:: with SMTP id o2mr8913578qvm.236.1540900461443;
        Tue, 30 Oct 2018 04:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540900461; cv=none;
        d=google.com; s=arc-20160816;
        b=m8f/3TAjxMOaxWuJp7PXlqfYSvvWS7+PK5i1VdaPP7Hs2bttGcL6B/iEpc0EQbh6pQ
         IA8JQI59e3a5g1U6W9yGmn7TsIYW+NtaZ51pt3Fxx2KE9sP/y1IQIT+FcEhWiulfW1Lx
         q7SIhtOHJT/oEuLe0bDvQpwVkfI61JUKVVDt7ICgiO8UJYkBWYUcAga7yYe1NH25caLY
         ND3ecnOJsK/BAqk7GOUh9BtLxWh99v69bOu6kWQmABzCfq4B1ChtOUVSw54/ckPsUYWl
         iW4f7mrpMxKmWZY01spACnaYyjsGXO37gcxHUDjfAMStGosx6moOMaEb12PQOtlppwXo
         KwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RBrwc8+hCSrUOu2XejkBZcRkUBoe+LuOPUC2+K0KNiU=;
        b=0dCWQsjTYwpclalUv2Uxagzto1jjpYFR0mrenWwGbRNZmQXyswIDVBVe7xvLrxtQ/w
         woMw0s6gZxhQosdcVDUUoQOFD4JLIN9AONUKn7fdl4/Bh3yTj5IXnC7+H1mdlSvIk6W1
         N2DubLeMfiaNX0VEhgnDVl6YQKTgYMNcmL+bAiieQLgG2Olqh0ynR0CbR8Htl8b96as5
         FnptRe+5KrnQ7NqEONgnyaItrVHGDolUqNX13um/EHyrKdZAttrDFOuVAz27nwvX73TW
         cAlAqlRpZ/dUZd720Dfn0s/1QeavfXF4bLLDWYfD9tQOFSf7WJNvWICcv8DHycHkm6dR
         OVtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si1455697qvc.195.2018.10.30.04.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 04:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHSbE-0006Kx-Te
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 07:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOZ-0001GY-A1
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOW-0003ps-TH
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:41:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45078)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHSOT-0003kX-9a; Tue, 30 Oct 2018 07:41:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35DB558E58;
	Tue, 30 Oct 2018 11:41:08 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043045F7FA;
	Tue, 30 Oct 2018 11:41:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 12:40:48 +0100
Message-Id: <20181030114048.21527-3-philmd@redhat.com>
In-Reply-To: <20181030114048.21527-1-philmd@redhat.com>
References: <20181030114048.21527-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 Oct 2018 11:41:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/2] arm: exynos4: Add dma support for
 smdkc210
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6TocvOXKweO

From: Guenter Roeck <linux@roeck-us.net>

QEMU already supports pl330. Instantiate it for smdkc210.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[PMD: Do not set default qdev properties]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 750162cc95..5696b37bf2 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -49,6 +49,9 @@
 #endif
=20
 #define SMDK_LAN9118_BASE_ADDR      0x05000000
+#define SMDK_PL330_BASE0_ADDR       0x12680000
+#define SMDK_PL330_BASE1_ADDR       0x12690000
+#define SMDK_PL330_BASE2_ADDR       0x12850000
=20
 typedef enum Exynos4BoardType {
     EXYNOS4_BOARD_NURI,
@@ -102,6 +105,19 @@ static void lan9215_init(uint32_t base, qemu_irq irq=
)
     }
 }
=20
+static void pl330_init(uint32_t base, qemu_irq irq, int nreq)
+{
+    SysBusDevice *busdev;
+    DeviceState *dev;
+
+    dev =3D qdev_create(NULL, "pl330");
+    qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
+    qdev_init_nofail(dev);
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, base);
+    sysbus_connect_irq(busdev, 0, irq);
+}
+
 static void exynos4_boards_init_ram(Exynos4BoardState *s,
                                     MemoryRegion *system_mem,
                                     unsigned long ram_size)
@@ -171,6 +187,14 @@ static void smdkc210_init(MachineState *machine)
=20
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
             qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
+
+    pl330_init(SMDK_PL330_BASE0_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(35, 1)]=
), 32);
+    pl330_init(SMDK_PL330_BASE1_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
+    pl330_init(SMDK_PL330_BASE2_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
+
     arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
 }
=20
--=20
2.17.2

