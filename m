Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2070394wrt;
        Thu, 17 Jan 2019 09:20:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+0vOADqxmrel86dmIngUhAtMbgJJTSQZ9VlaM9x2xSywIapWRMde+7uaLXClFm0VlMfwm
X-Received: by 2002:a7b:c853:: with SMTP id c19mr11938970wml.61.1547745621953;
        Thu, 17 Jan 2019 09:20:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547745621; cv=none;
        d=google.com; s=arc-20160816;
        b=piZPP8Ms406A9IQRlEntm/tyAiTmniOrEAy7XTMSmoaKzMHvXCHb/a8NQ5WlW3+975
         pVXlXhB/N7sdJhW8o+hVPm7p7qpAsrtLCp40cFgpxL2X9U+qfTCeu3EwkVY4iSvBkuOa
         cVcr+Ytl/WJyKZwAbLh+ozosKyJwqd4NJZK49RLY6lWrDDUpOdUCYmxUHlFIHRIGWuFQ
         XkDVa2kpKrzoN0L9E8deWmQgJ0MX3Z/eXwHp9R9uom1KSWRP5ibVbqJkLi5UAnq3ssxM
         izf0R/fcUUgA9V7DGcfkPf2r8iaq9DV2J2R2r/BBSPLMxBndStWa/w12AkUleX8P3M+B
         w6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=ntSoTa8Zv4PyFv9I7dTJx2mcT6sK0VyPwY8tf8Wslao=;
        b=ggn0X4vWbHx+WK0daAkYpE+rX2StczbeaLByScYOa4/2hcuaetNqEreUigCYxJVCSq
         koCfCGKmLZx/tyBJLiHFERtgDLUa6I9di2gFXMJVSZi0odVrhdiIE8lJoUfRVrlP1pIB
         1duW8UEtCaNxdg2jqrMZo4SMJFr9ngmWIxTtYQAf0300nt0TgF0euo8h0fk/mAPuIl6W
         M/gZluJWbkzd/jvE43O0TGmgTdVae8lwszviAkmk0xWZw65BMfwAIx0QZHFYykqGQCoj
         ze6oRD3Y1MjorMOLsu72T8f5XApH1P1lhFJDAnhckDfb+iaVC1xQ/WpNKUrBWVWryyOS
         4yHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=VNWKzIoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si25607628wmg.129.2019.01.17.09.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 09:20:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=VNWKzIoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Received: from localhost ([127.0.0.1]:48535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkBL2-00061Z-On
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 12:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joaogaspar_csw_qemu@hotmail.com>) id 1gkAzd-0008FR-Cw
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 11:58:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joaogaspar_csw_qemu@hotmail.com>) id 1gkAw6-0003iR-A9
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 11:54:36 -0500
Received: from mail-oln040092066024.outbound.protection.outlook.com
	([40.92.66.24]:23680
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <joaogaspar_csw_qemu@hotmail.com>)
	id 1gkAw5-0003ev-NU
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 11:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ntSoTa8Zv4PyFv9I7dTJx2mcT6sK0VyPwY8tf8Wslao=;
	b=VNWKzIoJzfBx1KgtkaPQUO5J2cZuqFWLf+c7Fg0s7BbuanhqOq7w3jI0xPBJM9Z19fJGnPv9PygQi3uI9X9kiI4HS1Xc2DjplxVfFgvo7mIUbN0Iwxe2+2Fwo4CeHES8QS4X37IpdFim9YnA94+5e1lMcJ5gjZvHYLnuWQfyXtere8vWSMsxkCTnwITGKyHRsH1+GeeDrZ4mO3Kyd+NLztK8n+0D75RBhVX2uuHZZBkIq24kKMXHFf/IjI4GOv4VY+Hhv68W5aG1bYvjqASTSsvmAeQh1zklRqMwzHg/rAmKMktLZzGzCrP6o8Nt4IAdsimxpuRfURQxLsaG4iLPfw==
Received: from VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
	(10.152.2.51) by VE1EUR01HT089.eop-EUR01.prod.protection.outlook.com
	(10.152.3.110) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1537.18;
	Thu, 17 Jan 2019 16:54:29 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (10.152.2.56) by
	VE1EUR01FT021.mail.protection.outlook.com (10.152.2.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1471.13 via Frontend Transport; Thu, 17 Jan 2019 16:54:29 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
	([fe80::9c2f:fe4e:620f:396b]) by
	DB7PR04MB4505.eurprd04.prod.outlook.com
	([fe80::9c2f:fe4e:620f:396b%4]) with mapi id 15.20.1537.018;
	Thu, 17 Jan 2019 16:54:29 +0000
From: =?iso-8859-1?Q?Jo=E3o_Gaspar?= <joaogaspar_csw_qemu@hotmail.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Problems adding TMS570LC43 - Cortex-R5f
Thread-Index: AQHUrn+RvuL+87yNd0mrmTi3Wjo+z6WzrXob
Date: Thu, 17 Jan 2019 16:54:29 +0000
Message-ID: <DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
Accept-Language: pt-PT, en-US
Content-Language: pt-PT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:5193092681BC486C65FE678133C599CDEAA911495A8CED84E93CCFD44B35AA72;
	UpperCasedChecksum:17CB2423B1515601E23BD3F16601E98A94B4CB0B71E85925D749A20C500F3200;
	SizeAsReceived:7080; Count:45
x-tmn: [UQH0GhAuMv0V5+Wmy2gpqL4UHwa1JSvz]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VE1EUR01HT089;
	6:2zut7OAzp8BEq9CSlNQ85+M9630JfeId1V3i+kz6xhuU39laMjD0PrSRmj1Aw2xIVApgR37cM4yU0S+uBhFPBld8TwNZBLbzEiH26retgtDdUPirPCi+50avO24AMkAguaNX9dW57HR4rXGsUZ01KcrSSPl4DT3UJ0TVkWH6g5/A8Y6sTqvrug7miihKNTVGSl1IeuSdcrsrOy6RxJActshfm9P6N8yGFrZ5zYK6GKNFSs93LYXD13ufTkxU242PTy7CcUZUMbomzGxNeb8jjQGPABFS4/e4jNIeC0b4NIjF/+Gv+aYutif6AIb7z0x40RVZSaEBvDrf/UUGsjYkTm5qQ/OnZOQCoAzDm4xbAvyhYxNRgaFAyzz3tv50FdS4jqkcKfFb1+jfX2rc0+cW1FQJs9mF4wvxJbXV1PEqyxTzSaLkgcq9RsUZ2/X2js3BlT6t6f72Ug9Yqwv4/sdaCw==;
	5:VgzhgqJ6s53el2Uj1G9q6jiTkh91467rDB6N4CPhMDb6N1Toj/VttLgd4EDNFaK6V/vP5JfvWXVpVXStZP5iRRW5g2hwJAlxdvuopkgIsHbT8z/nCmMxw/34BIk8Lv8qmxVt+015wFx188m87GLDcbHWYZZYp0OEhlazADwzTSnDxM8Z1NpEri+wewS8hQef1zHUUbLyJVwEewGVsT9SOw==;
	7:Gv0utVMsgWTmtztL664SEl62Uc/w7XXb6Sogvn8BImmix45iwpfVoZoSXvXBWhW++F1nhWa/SMTeDp/8x3uM/tNrW6CE+/q6uWhyZoSQHlvucA5twgct17QcZ8Bpl5cFM1UAMBjVdn199weA+UsQ9w==
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(9118020)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:VE1EUR01HT089; 
x-ms-traffictypediagnostic: VE1EUR01HT089:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
	SRVR:VE1EUR01HT089; BCL:0; PCL:0; RULEID:; SRVR:VE1EUR01HT089; 
x-microsoft-antispam-message-info: iiGovbtCsX37d2Er1xQNvlMioDfNN8ezsBZk38WtU/Y1Yee7OG5cqy5LZ4v0OJO6
Content-Type: multipart/alternative;
	boundary="_000_DB7PR04MB45057508E2DF87EE77572CE3B9830DB7PR04MB4505eurp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-Network-Message-Id: 851e4295-1720-4291-f741-08d67c9c727b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 16:54:29.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT089
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.92.66.24
X-Mailman-Approved-At: Thu, 17 Jan 2019 12:17:27 -0500
Subject: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SYaMdRUKW/34

--_000_DB7PR04MB45057508E2DF87EE77572CE3B9830DB7PR04MB4505eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!
I'm new at QEMU so I have some questions.

I'm trying to create a new support machine to QEMU, the TMS570LC43 board, t=
his board use the Cortex-R5f microcontroller.
At this moment when I do the "qemu-system-arm -M help" my machine is showed=
 with the name "cortex-r5".
The probleme start when I try to instaciate the machine with the comand "qe=
mu-system-arm --machine cortex-r5 -cpu cortex-r5f", after that I received t=
he message "segmentation fault (core dump)".

Does anyone have an possible cause to my problem or an tip?

I'm gonna let the code too, because probably I'm doing aniything wrong!

#include "qemu/osdep.h"
#include "qapi/error.h"
#include "qemu-common.h"
#include "hw/arm/arm.h"
#include "exec/address-spaces.h"
#include "qemu/error-report.h"
#include "qom/object.h"
#include "cpu.h"
#include "hw/sysbus.h"
#include "hw/arm/cortex-R5.h"

//RTI -> Real Time Interruption
//static const uint32_t RTI_addr =3D 0xFFFFFC00;

//SPI
static const uint32_t spi_addr[CR5_NUM_SPI] =3D {0xFFF7F400, 0xFFF7F600, 0x=
FFF7F800, 0xFFF7FA00, 0xFFF7FC00};
//I2C
static const uint32_t i2c_addr[CR5_NUM_I2C] =3D {0xFFF7D400, 0xFFF7D500};
//CAN
static const uint32_t can_addr[CR5_NUM_CAN] =3D {0XFFF7DC00, 0XFFF7DE00, 0X=
0FFF7E00, 0X0FFF7E200};
//ADC
static const uint32_t adc_addr[CR5_NUM_ADC] =3D {0xFFF7C000, 0xFFF7C200};
//GIO
static const uint32_t gio_addr[CR5_NUM_GIO] =3D {0xFFF7BC00};

/*IRQ
Interrupt Request Assignement
http://www.ti.com/lit/ds/spns195c/spns195c.pdf
Page: 118
*/
//irq RTI
/* static const int rti_cmp_irq0 =3D 2;
static const int rti_cmp_irq1 =3D 3;
static const int rti_cmp_irq2 =3D 4;
static const int rti_cmp_irq3 =3D 5;
static const int rti_oflw_irq0 =3D 6;
static const int rti_oflw_irq1 =3D 7;
static const int rti_timebase_irq =3D 8; */
//irq SPI
static const int spi_l0_irq[CR5_NUM_SPI] =3D {12, 17, 37, 49, 53};
static const int spi_l1_irq[CR5_NUM_SPI] =3D {26, 30, 38, 54, 56};
//irq I2C
static const int i2c_irq[CR5_NUM_I2C] =3D {66, 114};
//irc CAN
static const int can_l0_irq[CR5_NUM_CAN] =3D {16, 35, 45, 113};
static const int can_l1_irq[CR5_NUM_CAN] =3D {29, 42, 55, 117};
static const int can_if3_irq[CR5_NUM_CAN] =3D {44, 46, 60, 120};
//irq ADC
static const int adc_swgroup1_irq[CR5_NUM_ADC] =3D {15, 51};
static const int adc_swgroup2_irq[CR5_NUM_ADC] =3D {28, 57};
static const int adc_eventgroup_irq[CR5_NUM_ADC] =3D {14, 50};
static const int adc_magnitudecmp_irq[CR5_NUM_ADC] =3D {31, 59};
//irq GIO
static const int gio_high_irq[CR5_NUM_GIO] =3D {9};
static const int gio_low_irq[CR5_NUM_GIO] =3D {23};


static void cortexR5_initf(MachineState *mc)
{
    CORTEXR5State *s =3D g_new0(CORTEXR5State, 1);

    DeviceState *dev;
    SysBusDevice *busdev;
    Error *err =3D NULL;

    int i;
    ARMCPU *cpu;


    MemoryRegion *system_memory =3D get_system_memory();
    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);



    //s->cr5_cpu =3D ARM_CPU(object_new(mc->cpu_type));
    cpu =3D ARM_CPU(object_new(mc->cpu_type));

    //object_initialize_child(obj, "cpu", &s->cr5_cpu, sizeof(s->cr5_cpu), =
ARM_CPU_TYPE_NAME("cortex-r5f"), &error_abort, NULL);
    object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);

    memory_region_init_ram(flash, NULL, "CORTEXR5.flash", FLASH_SIZE, &erro=
r_fatal);

    memory_region_init_alias(flash_alias, NULL, "CORTEXR5.flash.alias", fla=
sh, 0, FLASH_SIZE);

    memory_region_set_readonly(flash, true);
    memory_region_set_readonly(flash_alias, true);

    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
    memory_region_add_subregion(system_memory, 0, flash_alias);

    memory_region_init_ram(ram, NULL, "CORTEXR5.ram", SRAM_SIZE, &error_fat=
al);
    memory_region_add_subregion(system_memory, RAM_BASE_ADDRESS, ram);

    //SPI
    for (i =3D 0; i < CR5_NUM_SPI; i++)
    {
        dev =3D DEVICE(&(s->spi[i]));
        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err=
);
        if (err !=3D NULL)
        {
            //error_propagate(errp, err);
            return;
        }
        busdev =3D SYS_BUS_DEVICE(dev);
        sysbus_mmio_map(busdev, 0, spi_addr[i]);
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l0_=
irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l1_=
irq[i]));
    }

    //I2C
    for (i =3D 0; i < CR5_NUM_I2C; i++)
    {
        dev =3D DEVICE(&(s->i2c[i]));
        object_property_set_bool(OBJECT(&s->i2c[i]), true, "realized", &err=
);
        if (err !=3D NULL)
        {
            //error_propagate(errp, err);
            return;
        }
        busdev =3D SYS_BUS_DEVICE(dev);
        sysbus_mmio_map(busdev, 0, i2c_addr[i]);
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), i2c_irq=
[i]));
    }

    //CAN
    for (i =3D 0; i < CR5_NUM_CAN; i++)
    {
        dev =3D DEVICE(&(s->can[i]));
        object_property_set_bool(OBJECT(&s->can[i]), true, "realized", &err=
);
        if (err !=3D NULL)
        {
            //error_propagate(errp, err);
            return;
        }
        busdev =3D SYS_BUS_DEVICE(dev);
        sysbus_mmio_map(busdev, 0, can_addr[i]);
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), can_l0_=
irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), can_l1_=
irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), can_if3=
_irq[i]));
    }

    //ADC
    object_property_set_int(OBJECT(s->adc_irqs), CR5_NUM_ADC, "num-lines", =
&err);
    object_property_set_bool(OBJECT(s->adc_irqs), true, "realized", &err);
    if (err !=3D NULL)
    {
        //error_propagate(errp, err);
        return;
    }
   // qdev_connect_gpio_out(DEVICE(s->adc_irq), 0, qdev_get_gpio_in(dev));

    for (i =3D 0; i < CR5_NUM_ADC; i++)
    {
        dev =3D DEVICE(&(s->adc[i]));
        object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err=
);
        if (err !=3D NULL)
        {
            //error_propagate(errp, err);
            return;
        }
        busdev =3D SYS_BUS_DEVICE(dev);
        sysbus_mmio_map(busdev, 0, adc_addr[i]);
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), adc_swg=
roup1_irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), adc_swg=
roup2_irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), adc_eve=
ntgroup_irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), adc_mag=
nitudecmp_irq[i]));
    }

    //GIO
    for (i =3D 0; i < CR5_NUM_GIO; i++)
    {
        dev =3D DEVICE(&(s->gio[i]));
        object_property_set_bool(OBJECT(&s->gio[i]), true, "realized", &err=
);
        if (err !=3D NULL)
        {
            //error_propagate(errp, err);
            return;
        }
        busdev =3D SYS_BUS_DEVICE(dev);
        sysbus_mmio_map(busdev, 0, gio_addr[i]);
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), gio_hig=
h_irq[i]));
        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), gio_low=
_irq[i]));
    }
}



static void cortexR5_machine_init(MachineClass *mc){
   //mc->name =3D "Cortex-R5f";
    mc->desc =3D "Based on TMS570LC43x";
    mc->init =3D  cortexR5_initf;
    mc->max_cpus =3D 1;
    mc->ignore_memory_transaction_failures =3D true;
    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-r5f");
}


DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)



Thanks in advanced,

Jo=E3o Gaspar

Enviado do Outlook<http://aka.ms/weboutlook>

--_000_DB7PR04MB45057508E2DF87EE77572CE3B9830DB7PR04MB4505eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm new at QEMU so I have some questions.<br>
</div>
<div id=3D"signature">
<div>
<div>
<div><br>
</div>
<div>I'm trying to create a new support machine to QEMU, the TMS570LC43 boa=
rd, this board use the Cortex-R5f microcontroller.
<br>
</div>
<div>At this moment when I do the &quot;qemu-system-arm -M help&quot; my ma=
chine is showed with the name &quot;cortex-r5&quot;.<br>
</div>
<div>The probleme start when I try to instaciate the machine with the coman=
d &quot;qemu-system-arm --machine cortex-r5 -cpu cortex-r5f&quot;, after th=
at I received the message &quot;segmentation fault (core dump)&quot;.<br>
</div>
<div><br>
</div>
<div>Does anyone have an possible cause to my problem or an tip?<br>
</div>
<div><br>
</div>
<div>I'm gonna let the code too, because probably I'm doing aniything wrong=
!<br>
</div>
<div><br>
</div>
<blockquote style=3D"margin:0 0 0 40px; border:none; padding:0px">
<div><span>#include &quot;qemu/osdep.h&quot;</span></div>
<div>
<div>#include &quot;qapi/error.h&quot;</div>
</div>
<div>
<div>#include &quot;qemu-common.h&quot;</div>
</div>
<div>
<div>#include &quot;hw/arm/arm.h&quot;</div>
</div>
<div>
<div>#include &quot;exec/address-spaces.h&quot;</div>
</div>
<div>
<div>#include &quot;qemu/error-report.h&quot;</div>
</div>
<div>
<div>#include &quot;qom/object.h&quot;</div>
</div>
<div>
<div>#include &quot;cpu.h&quot;</div>
</div>
<div>
<div>#include &quot;hw/sysbus.h&quot;</div>
</div>
<div>
<div>#include &quot;hw/arm/cortex-R5.h&quot;</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>//RTI -&gt; Real Time Interruption</div>
</div>
<div>
<div>//static const uint32_t RTI_addr =3D 0xFFFFFC00;</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>//SPI</div>
</div>
<div>
<div>static const uint32_t spi_addr[CR5_NUM_SPI] =3D {0xFFF7F400, 0xFFF7F60=
0, 0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};</div>
</div>
<div>
<div>//I2C</div>
</div>
<div>
<div>static const uint32_t i2c_addr[CR5_NUM_I2C] =3D {0xFFF7D400, 0xFFF7D50=
0};</div>
</div>
<div>
<div>//CAN</div>
</div>
<div>
<div>static const uint32_t can_addr[CR5_NUM_CAN] =3D {0XFFF7DC00, 0XFFF7DE0=
0, 0X0FFF7E00, 0X0FFF7E200};</div>
</div>
<div>
<div>//ADC</div>
</div>
<div>
<div>static const uint32_t adc_addr[CR5_NUM_ADC] =3D {0xFFF7C000, 0xFFF7C20=
0};</div>
</div>
<div>
<div>//GIO</div>
</div>
<div>
<div>static const uint32_t gio_addr[CR5_NUM_GIO] =3D {0xFFF7BC00};</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>/*IRQ</div>
</div>
<div>
<div>Interrupt Request Assignement</div>
</div>
<div>
<div>http://www.ti.com/lit/ds/spns195c/spns195c.pdf</div>
</div>
<div>
<div>Page: 118</div>
</div>
<div>
<div>*/</div>
</div>
<div>
<div>//irq RTI</div>
</div>
<div>
<div>/* static const int rti_cmp_irq0 =3D 2;</div>
</div>
<div>
<div>static const int rti_cmp_irq1 =3D 3;</div>
</div>
<div>
<div>static const int rti_cmp_irq2 =3D 4;</div>
</div>
<div>
<div>static const int rti_cmp_irq3 =3D 5;</div>
</div>
<div>
<div>static const int rti_oflw_irq0 =3D 6;</div>
</div>
<div>
<div>static const int rti_oflw_irq1 =3D 7;</div>
</div>
<div>
<div>static const int rti_timebase_irq =3D 8; */</div>
</div>
<div>
<div>//irq SPI</div>
</div>
<div>
<div>static const int spi_l0_irq[CR5_NUM_SPI] =3D {12, 17, 37, 49, 53};</di=
v>
</div>
<div>
<div>static const int spi_l1_irq[CR5_NUM_SPI] =3D {26, 30, 38, 54, 56};</di=
v>
</div>
<div>
<div>//irq I2C</div>
</div>
<div>
<div>static const int i2c_irq[CR5_NUM_I2C] =3D {66, 114};</div>
</div>
<div>
<div>//irc CAN</div>
</div>
<div>
<div>static const int can_l0_irq[CR5_NUM_CAN] =3D {16, 35, 45, 113};</div>
</div>
<div>
<div>static const int can_l1_irq[CR5_NUM_CAN] =3D {29, 42, 55, 117};</div>
</div>
<div>
<div>static const int can_if3_irq[CR5_NUM_CAN] =3D {44, 46, 60, 120};</div>
</div>
<div>
<div>//irq ADC</div>
</div>
<div>
<div>static const int adc_swgroup1_irq[CR5_NUM_ADC] =3D {15, 51};</div>
</div>
<div>
<div>static const int adc_swgroup2_irq[CR5_NUM_ADC] =3D {28, 57};</div>
</div>
<div>
<div>static const int adc_eventgroup_irq[CR5_NUM_ADC] =3D {14, 50};</div>
</div>
<div>
<div>static const int adc_magnitudecmp_irq[CR5_NUM_ADC] =3D {31, 59};</div>
</div>
<div>
<div>//irq GIO</div>
</div>
<div>
<div>static const int gio_high_irq[CR5_NUM_GIO] =3D {9};</div>
</div>
<div>
<div>static const int gio_low_irq[CR5_NUM_GIO] =3D {23};</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>static void cortexR5_initf(MachineState *mc)</div>
</div>
<div>
<div>{</div>
</div>
<div>
<div>&nbsp; &nbsp; CORTEXR5State *s =3D g_new0(CORTEXR5State, 1);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; DeviceState *dev;</div>
</div>
<div>
<div>&nbsp; &nbsp; SysBusDevice *busdev;</div>
</div>
<div>
<div>&nbsp; &nbsp; Error *err =3D NULL;</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; int i;</div>
</div>
<div>
<div>&nbsp; &nbsp; ARMCPU *cpu;</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; MemoryRegion *system_memory =3D get_system_memory();</di=
v>
</div>
<div>
<div>&nbsp; &nbsp; MemoryRegion *ram =3D g_new(MemoryRegion, 1);</div>
</div>
<div>
<div>&nbsp; &nbsp; MemoryRegion *flash =3D g_new(MemoryRegion, 1);</div>
</div>
<div>
<div>&nbsp; &nbsp; MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);</d=
iv>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp;</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //s-&gt;cr5_cpu =3D ARM_CPU(object_new(mc-&gt;cpu_type))=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; cpu =3D ARM_CPU(object_new(mc-&gt;cpu_type));</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //object_initialize_child(obj, &quot;cpu&quot;, &amp;s-&=
gt;cr5_cpu, sizeof(s-&gt;cr5_cpu), ARM_CPU_TYPE_NAME(&quot;cortex-r5f&quot;=
), &amp;error_abort, NULL);</div>
</div>
<div>
<div>&nbsp; &nbsp; object_property_set_bool(OBJECT(cpu), true, &quot;realiz=
ed&quot;, &amp;error_fatal);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_init_ram(flash, NULL, &quot;CORTEXR5.flash=
&quot;, FLASH_SIZE, &amp;error_fatal);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_init_alias(flash_alias, NULL, &quot;CORTEX=
R5.flash.alias&quot;, flash, 0, FLASH_SIZE);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_set_readonly(flash, true);</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_set_readonly(flash_alias, true);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_add_subregion(system_memory, FLASH_BASE_AD=
DRESS, flash);</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_add_subregion(system_memory, 0, flash_alia=
s);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_init_ram(ram, NULL, &quot;CORTEXR5.ram&quo=
t;, SRAM_SIZE, &amp;error_fatal);</div>
</div>
<div>
<div>&nbsp; &nbsp; memory_region_add_subregion(system_memory, RAM_BASE_ADDR=
ESS, ram);</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //SPI</div>
</div>
<div>
<div>&nbsp; &nbsp; for (i =3D 0; i &lt; CR5_NUM_SPI; i&#43;&#43;)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dev =3D DEVICE(&amp;(s-&gt;spi[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; object_property_set_bool(OBJECT(&amp;s-&gt=
;spi[i]), true, &quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err)=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; busdev =3D SYS_BUS_DEVICE(dev);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(busdev, 0, spi_addr[i]);</=
div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), spi_l0_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), spi_l1_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //I2C</div>
</div>
<div>
<div>&nbsp; &nbsp; for (i =3D 0; i &lt; CR5_NUM_I2C; i&#43;&#43;)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dev =3D DEVICE(&amp;(s-&gt;i2c[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; object_property_set_bool(OBJECT(&amp;s-&gt=
;i2c[i]), true, &quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err)=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; busdev =3D SYS_BUS_DEVICE(dev);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(busdev, 0, i2c_addr[i]);</=
div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), i2c_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //CAN</div>
</div>
<div>
<div>&nbsp; &nbsp; for (i =3D 0; i &lt; CR5_NUM_CAN; i&#43;&#43;)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dev =3D DEVICE(&amp;(s-&gt;can[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; object_property_set_bool(OBJECT(&amp;s-&gt=
;can[i]), true, &quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err)=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; busdev =3D SYS_BUS_DEVICE(dev);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(busdev, 0, can_addr[i]);</=
div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), can_l0_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), can_l1_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), can_if3_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //ADC</div>
</div>
<div>
<div>&nbsp; &nbsp; object_property_set_int(OBJECT(s-&gt;adc_irqs), CR5_NUM_=
ADC, &quot;num-lines&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; object_property_set_bool(OBJECT(s-&gt;adc_irqs), true, &=
quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp;// qdev_connect_gpio_out(DEVICE(s-&gt;adc_irq), 0, qdev_g=
et_gpio_in(dev));</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; for (i =3D 0; i &lt; CR5_NUM_ADC; i&#43;&#43;)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dev =3D DEVICE(&amp;(s-&gt;adc[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; object_property_set_bool(OBJECT(&amp;s-&gt=
;adc[i]), true, &quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err)=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; busdev =3D SYS_BUS_DEVICE(dev);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(busdev, 0, adc_addr[i]);</=
div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), adc_swgroup1_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), adc_swgroup2_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), adc_eventgroup_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), adc_magnitudecmp_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>&nbsp; &nbsp; //GIO</div>
</div>
<div>
<div>&nbsp; &nbsp; for (i =3D 0; i &lt; CR5_NUM_GIO; i&#43;&#43;)</div>
</div>
<div>
<div>&nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dev =3D DEVICE(&amp;(s-&gt;gio[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; object_property_set_bool(OBJECT(&amp;s-&gt=
;gio[i]), true, &quot;realized&quot;, &amp;err);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (err !=3D NULL)</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //error_propagate(errp, err)=
;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; busdev =3D SYS_BUS_DEVICE(dev);</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(busdev, 0, gio_addr[i]);</=
div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), gio_high_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; sysbus_connect_irq(busdev, 0, qdev_get_gpi=
o_in(DEVICE(dev), gio_low_irq[i]));</div>
</div>
<div>
<div>&nbsp; &nbsp; }</div>
</div>
<div>
<div>}</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div><br>
</div>
</div>
<div>
<div>static void cortexR5_machine_init(MachineClass *mc){</div>
</div>
<div>
<div>&nbsp; &nbsp;//mc-&gt;name =3D &quot;Cortex-R5f&quot;;</div>
</div>
<div>
<div>&nbsp; &nbsp; mc-&gt;desc =3D &quot;Based on TMS570LC43x&quot;;</div>
</div>
<div>
<div>&nbsp; &nbsp; mc-&gt;init =3D &nbsp;cortexR5_initf;</div>
</div>
<div>
<div>&nbsp; &nbsp; mc-&gt;max_cpus =3D 1;</div>
</div>
<div>
<div>&nbsp; &nbsp; mc-&gt;ignore_memory_transaction_failures =3D true;</div=
>
</div>
<div>
<div>&nbsp; &nbsp; mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cort=
ex-r5f&quot;);</div>
</div>
<div>
<div>}</div>
</div>
</blockquote>
<div>
<div><br>
</div>
<div><br>
</div>
</div>
<blockquote style=3D"margin:0 0 0 40px; border:none; padding:0px">
<div><span>DEFINE_MACHINE(&quot;cortex-r5&quot;, cortexR5_machine_init)</sp=
an></div>
</blockquote>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<span>Thanks in advanced,</span>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Jo=E3o Gaspar</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; ba=
ckground-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-serif">
Enviado do <a href=3D"http://aka.ms/weboutlook">Outlook</a></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB7PR04MB45057508E2DF87EE77572CE3B9830DB7PR04MB4505eurp_--
