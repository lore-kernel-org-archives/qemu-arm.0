Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp664319wrg;
        Mon, 20 May 2019 14:45:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyWhAWEWvCzFlMheaI+zw63TnLebpD0MPDW6yntNNJPy6i3fwcmtqokx3/pFbZaJPTpMfK
X-Received: by 2002:a50:974d:: with SMTP id d13mr79341476edb.209.1558388719286;
        Mon, 20 May 2019 14:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558388719; cv=none;
        d=google.com; s=arc-20160816;
        b=g6LFoiuNoLr9EnVVvB2Ju5PKQhsvrCT1iXLxfDOej0wjeB6C0/pwHO7YGoGP/mHkiF
         75PDc+KOECWSJrWlgpm7usuGaqS/6MG9+lVX0vlDd/kuHDPAn4k6tRV/+hsjj4fScEhP
         VIfBnh4Uw/UmOURNl0AJpUIDV3co4zn976GVVCC01l3koswToRpb7RXbYaYNM0xyfPFY
         84oFZDnCX5j/3z/Sda/j492LHjvIozwWia3h3UiUOHPSzPcZy1j3Yn1F4NofjVRWC3KV
         KNXtdj+8UUGo7eKwKYrpualqUMycKo992t5Z75hYttUXZdoLxklOjeD3g3Qt7c2E4jBv
         nO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=f7IplBlIrfbeEgdtB6c1dXvzuwfQ6iOKxgq7aZY0bqg=;
        b=MrJg/J3ontBrY49XLZ3dBjDK6lB3t85Za9b6Py+mscrilRJ0xAuJHMyozdU1HCryCR
         5LC+tTjwX7AmLbMIl5MkeutqE1VShfEtN++++XfXcrz225ok5k3aM1Cw8daIh+tM0KpN
         RiqEp2Nj+AwN+XDJBi0v1jSybnNEQnBTmpRCSVIFmy2B77kgrLmsZiX2hpL0QHqVLV6G
         XxBKdTIrJjVUBnpKxnTyWOHZ/3q02ptfGCuJmJ/D09wxS/b/wR/J/9tsh7E8GXIW7UQP
         8GXnThqwj0K8mc2gC/+q08RcURrsjoXuvgXjUdV9mjFRtp0bXl95c07h0B9+0JSfelNF
         BxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si2574470eja.379.2019.05.20.14.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSq5u-0007lV-95
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:45:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4q-0007eB-SF
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4p-0000K5-LW
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:44:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hSq4m-0000GS-VX; Mon, 20 May 2019 17:44:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 294D3F74A0;
	Mon, 20 May 2019 21:44:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 813CE1001E6C;
	Mon, 20 May 2019 21:43:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:43:41 +0200
Message-Id: <20190520214342.13709-4-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-1-philmd@redhat.com>
References: <20190520214342.13709-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 20 May 2019 21:44:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] hw/arm/exynos4210: Add DMA support for the
 Exynos4210
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ThaKNiQCASf

From: Guenter Roeck <linux@roeck-us.net>

QEMU already supports pl330. Instantiate it for Exynos4210.

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
No SoC datasheet available, Guenter got it working using the
"look into the Linux kernel code and then play with parameters
until it magically starts working" method.
---
 hw/arm/exynos4210.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index af82e955421..19009b76e7c 100644
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
     Exynos4210State *s =3D g_new0(Exynos4210State, 1);
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
2.20.1

