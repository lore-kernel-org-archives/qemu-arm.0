Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6002470wro;
        Tue, 30 Oct 2018 12:31:42 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dRC1i737XBhg3DTJEFQoIkKWOW07exj+YR1q/ttJWsdzbMPyJ8E31SXQ8uZ+XXNSmBM3Gx
X-Received: by 2002:a37:8d81:: with SMTP id p123mr8714qkd.241.1540927902477;
        Tue, 30 Oct 2018 12:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540927902; cv=none;
        d=google.com; s=arc-20160816;
        b=QAPRWJlYEnKTBMpsVa7PnaUuCsoGPikQeu4V+4PJTqN1cchbdMlPJNigBYsKQJDzE2
         SjNIYLAX3WllEPBtu8e4dF6vHDqRuKK6lrxfjoDqsEgfE5ytNTK21SUWh7Sas/SpHPQD
         yQrkoxclOeingaR60e2V2i/0goMSHDwlBvN1kyh7TPXjNYSb/bD++y5FAl6YEhFGgdCA
         hyvm2OSPpyA3dBS3rky6QCRhedxVwXTF28iXllrDGbwYN44PpZpVBkdJkFbpdJ3YdFM+
         eRSW767OZHc4SshNzqiImYCxMKP67kKKa7HRqYJaJPKlDubA7Zr4mjK8p+wULS3B210u
         bTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=MJ7KFIuV351JS9Vidou1V2iz/LCgoVVSJhEpJ5TPnk4=;
        b=hiKbZOegQEyIvU83KfpGAu+kWYlILDJHOy4Bho26/k9eKB5yEcuAP5aHG+vSmeggcE
         UVgYX7Ff9PJx7QDjeR2X4p8vHSCEGq4Mayueukk0cqgAn0/T2eUJMgGReS1RBRJ9YbTF
         368+H0h7tGkx8yCGJTL0ZspoTmB9Qdz9KwsarOg6/uhmwNTUd+PyjZ3Sk+1RF7enCfoW
         W+myDNTGnMoGAWLj8SOcAc+s4Ug3ay/PAkX3aBrJlE9Fq+AdkRjZJGKrfNHOFLPOcfdA
         XqOCF7p5omx+XDHFuxQTMKIOQr37Ei9gn2hD5zwb4pIAqnaZqb4H4attZwHPcaQYANJA
         2pIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si463373qvq.39.2018.10.30.12.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 12:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHZjq-0005VS-12
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 15:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHZjV-0005S2-8B
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 15:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHZjR-0007qo-6Q
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 15:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHZjP-0007pZ-TA; Tue, 30 Oct 2018 15:31:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0F46308A95D;
	Tue, 30 Oct 2018 19:31:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-205.brq.redhat.com [10.40.204.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F57C1057042;
	Tue, 30 Oct 2018 19:31:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 20:30:43 +0100
Message-Id: <20181030193044.25954-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 30 Oct 2018 19:31:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] arm: exynos4: Add dma support for smdkc210
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+BRr/i7a8ox

From: Guenter Roeck <linux@roeck-us.net>

QEMU already supports pl330. Instantiate it for smdkc210.

Relevant part of Linux arch/arm/boot/dts/exynos4.dtsi:

/ {
    soc: soc {
        amba {
            pdma0: pdma@12680000 {
                compatible =3D "arm,pl330", "arm,primecell";
                reg =3D <0x12680000 0x1000>;
                interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
                clocks =3D <&clock CLK_PDMA0>;
                clock-names =3D "apb_pclk";
                #dma-cells =3D <1>;
                #dma-channels =3D <8>;
                #dma-requests =3D <32>;
            };
            pdma1: pdma@12690000 {
                compatible =3D "arm,pl330", "arm,primecell";
                reg =3D <0x12690000 0x1000>;
                interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
                clocks =3D <&clock CLK_PDMA1>;
                clock-names =3D "apb_pclk";
                #dma-cells =3D <1>;
                #dma-channels =3D <8>;
                #dma-requests =3D <32>;
            };
            mdma1: mdma@12850000 {
                compatible =3D "arm,pl330", "arm,primecell";
                reg =3D <0x12850000 0x1000>;
                interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
                clocks =3D <&clock CLK_MDMA>;
                clock-names =3D "apb_pclk";
                #dma-cells =3D <1>;
                #dma-channels =3D <8>;
                #dma-requests =3D <1>;
            };
        };
    };
};

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[PMD: Do not set default qdev properties, create the controllers in the S=
oC
      rather than the board (Peter Maydell), add dtsi in commit message]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Another intent to salvage previous work from Guenter Roeck:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html

Since v2: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06459.=
html
- rename init -> create
- create controllers in SoC rather than the board (Peter Maydell)
- add Linux dtsi in commit message

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06335.=
html
- Do not factor out pl330_init, which resulted in buggy v1, see:
  https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06448.html

 hw/arm/exynos4210.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 827318a003..cd27b9387c 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -96,6 +96,11 @@
 /* EHCI */
 #define EXYNOS4210_EHCI_BASE_ADDR           0x12580000
=20
+/* DMA */
+#define EXYNOS4210_PL330_BASE0_ADDR         0x12680000
+#define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
+#define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
+
 static uint8_t chipid_and_omr[] =3D { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
=20
@@ -160,6 +165,19 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
=20
+static void pl330_create(uint32_t base, qemu_irq irq, int nreq)
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
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
     Exynos4210State *s =3D g_new(Exynos4210State, 1);
@@ -410,5 +428,13 @@ Exynos4210State *exynos4210_init(MemoryRegion *syste=
m_mem)
     sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR=
,
             s->irq_table[exynos4210_get_irq(28, 3)]);
=20
+    /*** DMA controllers ***/
+    pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(35, 1)]=
), 32);
+    pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
+    pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
+
     return s;
 }
--=20
2.17.2

