Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5213066wrt;
        Tue, 2 Oct 2018 08:49:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63ajZ5s+kkzhgkJdUUctRwMxPuUIU8PvqlCKL/d/pQEg8BUyTbh4m3SjW8FEP6XzDyO/kxT
X-Received: by 2002:a37:14d4:: with SMTP id 81-v6mr12102137qku.201.1538495353646;
        Tue, 02 Oct 2018 08:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538495353; cv=none;
        d=google.com; s=arc-20160816;
        b=EqcvbwQzwzdeNT486PBTmkC1PIABiHDTkFAhm2BkSeuhR1UlfyhI/ROOsNplVRg1UV
         ZWVWzok897x7l0o+m/gLPhrTS3xborFbHblAvRP/FxVRufatW+VAakUxN79ZAv3G45WJ
         L3ySL5uCUbBazRvfmEJ1N2MDtDgTjOfrfViv4sO7yeQfSDJkp0pBAAuPv8px+vTapgxA
         RWcIE/hq9fPVKw7jY9qdqcFKsn2Ha0zY69wdU1Z9cCrnL/Z7e2aFkV2CHfhrfmB0DJHg
         hrKPzxZBBcgYOJivQ0lMCtwQwEJucx53h589OLoWz4EWFqJFALhHYP83gSYCdyzQw9iW
         D/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=HpkUT0jiQhk8TQRtcFpsDpMNa57bkdtBSG9nDmP3MKM=;
        b=sZCG0YSLw6/vJwEG0nVgzAM//nADhJ+Kf9L0yG+2b6ehzYcEenIondI5OCXsV9MTXe
         QSZQkM9Ld/fUs7JNOmpuG2ECoIDA849g/ItHB776hwoVJ/uWMxUg29++b+r7OBUi9FR3
         UM1BkDqtZLRjUhVspnCzH0MCDVac3FTmd6wH+W+7dIhgdRCqcWk31vjyJmcy3bmryKkp
         7T6PKnjagOwp2jYL+aAWhPEahV8HfwEA87B/jnRbbI5Dt03ouJLRcPNawMmNKjRGrfDB
         D9q61gatGyKFQpHRrNrpjPSRp0wkgOmXaET+ba05nxALQCETTklArRfZZo1pjZPOx+81
         53yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68-v6si3969899qkl.339.2018.10.02.08.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7MvB-0003qm-5H
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:49:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7Mv2-0003qF-On
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7Muy-00073c-NR
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:04 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:52254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g7Muy-00071X-F4
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:00 -0400
Received: from player687.ha.ovh.net (unknown [10.109.160.239])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 636061CE377
	for <qemu-arm@nongnu.org>; Tue,  2 Oct 2018 17:48:52 +0200 (CEST)
Received: from zorba.kaod.org (unknown [145.131.95.179])
	(Authenticated sender: postmaster@kaod.org)
	by player687.ha.ovh.net (Postfix) with ESMTPSA id 855242C0093;
	Tue,  2 Oct 2018 17:48:43 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-9-clg@kaod.org>
	<CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
Message-ID: <f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
Date: Tue, 2 Oct 2018 17:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10620613824464849860
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtddtgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.46.10
Subject: Re: [Qemu-arm] [PATCH v2 08/11] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1QWx2xZMZBg

On 10/2/18 12:56 PM, Peter Maydell wrote:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> The FMC controller on the Aspeed SoCs support DMA to access the flash
>> modules. It can operate in a normal mode, to copy to or from the flash
>> module mapping window, or in a checksum calculation mode, to evaluate
>> the best clock settings for reads.
>>
>> The model introduces a custom address space for DMAs populated with
>> the required regions : an alias region on the AHB window for the flash
>> devices and another alias on the SDRAM.
>>
>> Our primary need is to support the checksum calculation mode and the
>> model only implements synchronous DMA accesses. Something to improve
>> in the future.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>=20
>> +static void aspeed_smc_dma_rw(AspeedSMCState *s)
>> +{
>> +    MemTxResult result;
>> +    uint32_t data;
>> +
>> +    while (s->regs[R_DMA_LEN]) {
>> +        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
>> +            result =3D address_space_read(&s->dma_as, s->regs[R_DMA_D=
RAM_ADDR],
>> +                                        MEMTXATTRS_UNSPECIFIED,
>> +                                        (uint8_t *)&data, 4);
>> +            if (result !=3D MEMTX_OK) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed =
@%08x\n",
>> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
>> +                return;
>> +            }
>=20
> Does the device really not report DMA read/write failures via
> a status register bit or similar ?

The Interrupt Control and Status Register (FM0C8) has a DMA Status
BIT(11) to indicate that a DMA transfer is in progress or not. Nothing
for errors.

There are a SPI command abort status BIT(10) and a SPI Write Address
Protected status BIT(11) but these are for the command and address
filters.
=20
>> +
>> +/*
>> + * Populate our custom address space for DMAs with only the regions w=
e
>> + * need : the AHB window for the flash devices and the SDRAM.
>> + */
>> +static void aspeed_smc_dma_setup(AspeedSMCState *s)
>> +{
>> +    char name[32];
>> +    MemoryRegion *sysmem =3D get_system_memory();
>> +    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>> +    MemoryRegion *sdram_alias =3D g_new(MemoryRegion, 1);
>> +
>> +    snprintf(name, sizeof(name), "%s-dma", s->ctrl->name);
>=20
> I would suggest using g_strdup_printf()/g_free(), since it's not
> immediately obvious here that s->ctrl->name is guaranteed
> to fit into the fixed-size array.

yes. sure.

>> +    memory_region_init(&s->dma_mr, OBJECT(s), name,
>> +                       s->sdram_base + s->max_ram_size);
>> +    address_space_init(&s->dma_as, &s->dma_mr, name);
>> +
>> +    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
>> +    memory_region_init_alias(flash_alias, OBJECT(s), name, &s->mmio_f=
lash,
>> +                             0, s->ctrl->flash_window_size);
>> +    memory_region_add_subregion(&s->dma_mr, s->ctrl->flash_window_bas=
e,
>> +                                flash_alias);
>> +
>> +    memory_region_init_alias(sdram_alias, OBJECT(s), "ram", sysmem,
>> +                             s->sdram_base, s->max_ram_size);
>> +    memory_region_add_subregion(&s->dma_mr, s->sdram_base, sdram_alia=
s);
>=20
> Rather than having the DMA device directly grab the system_memory
> MR like this, it's better to have the device have a MemoryRegion
> property, which the SoC sets with whatever the DMA device should
> be able to see.

ok. I see, but it seems I have a chicken & egg problem.=20

The MemoryRegion I would liked to grab is the bmc->ram one in aspeed.c=20
but it is initialized after the SoC is. I don't know how to lazy bind=20
this region in the Aspeed SMC model using the Aspeed SoC model as a=20
proxy to pass the region property through a link or/and alias.

If I could find a way, the model would be much cleaner. =20

> Otherwise, patch looks good, though I don't know enough about
> the device/SoC to review those details.

For the moment the only use of these registers is in the Aspeed custom=20
u-boot of the SDK :=20

or in the rewrite I proposed in mainline :


Thanks,

C.
