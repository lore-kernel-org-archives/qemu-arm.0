Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6056209lfk;
        Mon, 15 Nov 2021 07:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmr2hDwoyG9z4VZuOs/+aWtkvPYo/ISL2dj5WFyCYXWZK1xQJVH/bO844M4OcpcgfpMG1h
X-Received: by 2002:ac8:7f86:: with SMTP id z6mr52782qtj.162.1636991891884;
        Mon, 15 Nov 2021 07:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636991891; cv=none;
        d=google.com; s=arc-20160816;
        b=Xod76t/13acqxEOYheIdpeb6wOLZferH4Bf8PRDkbuhdXHqqlefnpteX8TnM+ioC+e
         acLe3YBIFGqHfYzHHUcZyRTq84gLA6Q7b+L7tcJNv7jCsDCL4FAXWs1vcmwYHaYsYrWm
         5eh4QH47qnHLdBEU0+xti9bj2i8goK9f6fybwC2z/IyFT4qDzsAyrcUE8XX7emxDRFeI
         3qyaXlbtx0xJ2/OHd39cIhWgwNxY+PSqphzmhR3eNpJWHjy3iTe3lpX7LZLX3d0ze3zD
         1MoOS00KNHlN2AIXTCLL1IcQeWqCdtEkF9VaSgy1qiKyAT729p/ifldFcPGvXvu4yzTs
         656g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=3gi4j7Q0fmlkvxwVBhmxnE3e8X2pmiSjeAHke/jDw6s=;
        b=c3Dem0p8Q/MOS+u65+k+Di5WuxoPnhSgDOwZ6LrVEVnettk1awju7KKipxlUZ9Yl+a
         MYioBGgQ2oD9o8GIrWx+45oQ4CDuK8njHnY2RHnuLUQDbnTX2uTRJodQAKHuWuBPcNqr
         a+mXBHWMo6k8yNW++jTiEF/PeNJXUxWq7fbB7Cr1Yb1OuPQPNskB7nil5BMX5FKEzeZj
         7tkx+UGrjo1QA/85IW9wYlnDddYXBghzR062Wx+vBGGvRJs21PjjfCYykLPrgOAIwUu4
         s8b+Ne7in/ClZdyzzeBlg0XXlmOkLGsdgApPd/5MwMoq/xB5EfiTmuJI+JCdtdebluH2
         dQDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eRwYRdiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b38si17975340qkp.92.2021.11.15.07.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 07:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eRwYRdiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmeN1-0003uf-8a
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 10:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeMm-0003u1-H5
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 10:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeMi-00085H-N4
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 10:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636991871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gi4j7Q0fmlkvxwVBhmxnE3e8X2pmiSjeAHke/jDw6s=;
 b=eRwYRdiIXmyXTWfoK45pHOUqvL3UjiMHFHbW7SQ0GJaRxmmS/SDsJKOHr/4ZOVnsdn2wDJ
 +nk+5IWJzFSnEZitbMSsLRqUentOXLXrpxbcT+evojiiunMpwia395sk9EEOwIlzcLrwQz
 NO+MMUzCdzb7LEp3JjFVbm06h+3lF0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-sgyDoI81O0SMi5sFZTYf_w-1; Mon, 15 Nov 2021 10:57:48 -0500
X-MC-Unique: sgyDoI81O0SMi5sFZTYf_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837EE19253C7;
 Mon, 15 Nov 2021 15:57:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FAE519D9F;
 Mon, 15 Nov 2021 15:57:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7BF1811380A7; Mon, 15 Nov 2021 16:57:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
Date: Mon, 15 Nov 2021 16:57:40 +0100
In-Reply-To: <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 15 Nov 2021 14:59:51
 +0100")
Message-ID: <87lf1pfm2z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, jcd@tribudubois.net,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HnCfEdbj6yXT

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/15/21 13:55, Markus Armbruster wrote:
>> drive_get_next() is basically a bad idea.  It returns the "next" block
>> backend of a certain interface type.  "Next" means bus=3D0,unit=3DN, whe=
re
>> subsequent calls count N up from zero, per interface type.
>>=20
>> This lets you define unit numbers implicitly by execution order.  If the
>> order changes, or new calls appear "in the middle", unit numbers change.
>> ABI break.  Hard to spot in review.
>>=20
>> Explicit is better than implicit: use drive_get() directly.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/sysemu/blockdev.h           |  1 -
>>  blockdev.c                          | 10 ----------
>>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>  hw/arm/cubieboard.c                 |  2 +-
>>  hw/arm/imx25_pdk.c                  |  2 +-
>>  hw/arm/integratorcp.c               |  2 +-
>>  hw/arm/mcimx6ul-evk.c               |  2 +-
>>  hw/arm/mcimx7d-sabre.c              |  2 +-
>>  hw/arm/msf2-som.c                   |  2 +-
>>  hw/arm/npcm7xx_boards.c             |  6 +++---
>>  hw/arm/orangepi.c                   |  2 +-
>>  hw/arm/raspi.c                      |  2 +-
>>  hw/arm/realview.c                   |  2 +-
>>  hw/arm/sabrelite.c                  |  2 +-
>>  hw/arm/versatilepb.c                |  4 ++--
>>  hw/arm/vexpress.c                   |  6 +++---
>>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>>  hw/arm/xlnx-zcu102.c                |  6 +++---
>>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>  hw/misc/sifive_u_otp.c              |  2 +-
>>  hw/riscv/microchip_pfsoc.c          |  2 +-
>>  hw/sparc64/niagara.c                |  2 +-
>>  23 files changed, 49 insertions(+), 52 deletions(-)
>
>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *mach=
ine)
>>      }
>> =20
>>      for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_=
SD));
>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>> +                           drive_get(IF_SD, 0, i));
>
> If we put SD on bus #0, ...
>
>>      }
>> =20
>>      if (bmc->soc.emmc.num_slots) {
>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_S=
D));
>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots=
));
>
> ... we'd want to put eMMC on bus #1

Using separate buses for different kinds of devices would be neater, but
it also would be an incompatible change.  This patch keeps existing
bus/unit numbers working.  drive_get_next() can only use bus 0.

>                                      but I see having eMMC cards on a
> IF_SD bus as a bug, since these cards are soldered on the board.

IF_SD is not a bus, it's an "block interface type", which is really just
a user interface thing.

>> --- a/hw/arm/vexpress.c
>> +++ b/hw/arm/vexpress.c
>> @@ -625,7 +625,7 @@ static void vexpress_common_init(MachineState *machi=
ne)
>>                            qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_=
WPROT));
>>      qdev_connect_gpio_out_named(dev, "card-inserted", 0,
>>                            qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_=
CARDIN));
>> -    dinfo =3D drive_get_next(IF_SD);
>> +    dinfo =3D drive_get(IF_SD, 0, 0);
>
> Can we have one interface refactor per patch (IF_SD, IF_PFLASH, IF_MTD...=
)?

Peter asked for one patch per "board/SoC model".  I'll do whatever helps
reviewers.

>> @@ -657,7 +657,7 @@ static void vexpress_common_init(MachineState *machi=
ne)
>> =20
>>      sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
>> =20
>> -    dinfo =3D drive_get_next(IF_PFLASH);
>> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>
>> -static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq i=
rq,
>> -                                         bool is_qspi)
>> +static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq ir=
q,
>> +                                        bool is_qspi, int unit0)
>>  {
>> +    int unit =3D unit0;
>>      DeviceState *dev;
>>      SysBusDevice *busdev;
>>      SSIBus *spi;
>> @@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t ba=
se_addr, qemu_irq irq,
>>          spi =3D (SSIBus *)qdev_get_child_bus(dev, bus_name);
>> =20
>>          for (j =3D 0; j < num_ss; ++j) {
>> -            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>> +            DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit++);
>
>> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
>> index 3dc2b5e8ca..45eb19ab3b 100644
>> --- a/hw/arm/xlnx-zcu102.c
>> +++ b/hw/arm/xlnx-zcu102.c
>> @@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>>          BusState *spi_bus;
>>          DeviceState *flash_dev;
>>          qemu_irq cs_line;
>> -        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>> +        DriveInfo *dinfo =3D drive_get(IF_MTD, 0, i);
>
> If this is bus #0, ...
>
>>          gchar *bus_name =3D g_strdup_printf("spi%d", i);
>> =20
>>          spi_bus =3D qdev_get_child_bus(DEVICE(&s->soc), bus_name);
>> @@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>>          BusState *spi_bus;
>>          DeviceState *flash_dev;
>>          qemu_irq cs_line;
>> -        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>> +        DriveInfo *dinfo =3D drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS =
+ i);
>
> ... I'd expect we use bus #1 here (different connector on the board).

See above.

>>          int bus =3D i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
>>          gchar *bus_name =3D g_strdup_printf("qspi%d", bus);

