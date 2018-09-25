Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp722873wrt;
        Tue, 25 Sep 2018 07:10:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60DdNKg+RQw3E7DwBtrYSsMuGET48SccsdmwlBRwv6Fq1eR/oVhX4TgKSUzx2hSJPA63JDD
X-Received: by 2002:a37:25c4:: with SMTP id l65-v6mr860041qkl.21.1537884632998;
        Tue, 25 Sep 2018 07:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537884632; cv=none;
        d=google.com; s=arc-20160816;
        b=zdjaLe4Hxd0cQqB9l+1OnDfgSy0RIckqy9D9pUvRbGDuR90uvV82yDclJbfbX3zLtW
         gzAoGR54IihgXrfeKGVYWRQV2RTeHXTn81CLLoclA3qmCwgeqvCgVQ+IK9Xg+xOBUgHF
         T9KiFGMXB6k+0voqkOIziowA1JsdbrIRfY29KbWFvA3zn/3SClUqdv4qbHdfTUB26SO1
         pxru283uYIl4L2i3HFky7Z4s5oi3YaHVwnUm4RQpphOyO26AFrmVpFGYyF3FeSe1S4KX
         VQNObP2E1dHRPqgF+5RH6VViNYAIrY951h2dLNq0hOrNHZgOIapqboPK+ygg094VrQq/
         WEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=51i4T/Fv0vLIPkOZ9tk1r9Ck2PDUnIovs2dFTlizcrU=;
        b=lh2DIs/yuWxhb1pkpIRctC/4uvy8c5C7D2EtMO5cuZxN45qQIjzngClG7w+nD95UaW
         ItpNVr52MkAwxTEEGX4mdeLYuHxsurS2gGRWMFiar2CW/d7sXJTf+5KeWkaBPy5yjm85
         D03rlMxzuzukPRxbFOEjT+UJsw6un4/rlAQW+HF/OVdiweYnZKCgbCP50LpoLyvUTcru
         o0HdCxeNendafzOsD24CWSwTBfv5LbJpaF+WyrN+WqOJK2MItrhkNC1yeO9GOvHtEQAE
         Kotg6iQKVfWjK+KDi1wSRMoKm7tWxCPiAAgl1liqh+zR55skxvWG/vyjCFYtgx2jDDpA
         QF8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1-v6si1703066qtn.235.2018.09.25.07.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4o2p-0006Oa-T5
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:10:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4nz5-0002p9-7G
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4nyz-0004ms-4o
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:06:38 -0400
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:57106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4nyy-0004ld-RC
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:06:33 -0400
Received: from player690.ha.ovh.net (unknown [10.109.159.159])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4ED0913667B
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 16:06:31 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player690.ha.ovh.net (Postfix) with ESMTPSA id E0DBF5400DB;
	Tue, 25 Sep 2018 16:06:22 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-8-clg@kaod.org>
	<CAFEAcA-k86WNgeXnAx=MYfv6VA6Y-pPXcRPqy+h_PBQAHD4Dwg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <48c75a5b-315a-ea43-8914-049c5358a82e@kaod.org>
Date: Tue, 25 Sep 2018 16:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-k86WNgeXnAx=MYfv6VA6Y-pPXcRPqy+h_PBQAHD4Dwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4676706741460569028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtuddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.38.232
Subject: Re: [Qemu-arm] [PATCH v2 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
X-TUID: R0S2QZOtngDT

On 9/25/18 2:26 PM, Peter Maydell wrote:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> The setting of the DRAM address of the DMA transaction depends on the
>> DRAM base address and the maximum DRAM size of the SoC. Let's add a
>> couple of properties to give this information to the SMC controller
>> model.
>>
>> Also, move the SDRAM Memory controller realization before the other
>> controllers which need it.
>=20
> There's that "Also" again :-)

Arg. It seemed convenient at the time. OK OK, I will split :)


>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ssi/aspeed_smc.h |  4 ++++
>>  hw/arm/aspeed_soc.c         | 28 +++++++++++++++++++---------
>>  hw/ssi/aspeed_smc.c         |  2 ++
>>  3 files changed, 25 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 1f557313fa93..d7090bb5e9b7 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -97,6 +97,10 @@ typedef struct AspeedSMCState {
>>      uint8_t r_timings;
>>      uint8_t conf_enable_w0;
>>
>> +    /* for DMA support */
>> +    uint64_t sdram_base;
>> +    uint64_t max_ram_size;
>> +
>>      AspeedSMCFlash *flashes;
>>  } AspeedSMCState;
>>
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index 2cbacb4430bb..bbc05d172fe1 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -209,6 +209,14 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)
>>      }
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
>>
>> +    /* SDMC - SDRAM Memory Controller */
>> +    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err=
);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE=
);
>> +
>>      /* VIC */
>>      object_property_set_bool(OBJECT(&s->vic), true, "realized", &err)=
;
>>      if (err) {
>> @@ -252,7 +260,17 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)
>>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>>
>>      /* FMC, The number of CS is set at the board level */
>> -    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err)=
;
>> +    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "s=
dram-base",
>> +                            &err);
>> +    object_property_set_int(OBJECT(&s->fmc), s->sdmc.max_ram_size,
>> +                            "max-ram-size", &local_err);
>> +    error_propagate(&err, local_err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &loca=
l_err);
>> +    error_propagate(&err, local_err);
>=20
> I don't understand why we have several different variations on
> "do this thing, and if it fails then propagate the error to caller"
> here. I was expecting all these things to be in the form
>=20
>        some_thing(..., &err);
>        if (err) {
>            error_propagate(errp, err);
>            return;
>        }
>=20
> Is there a reason you need to involve the 'local_err' variable
> in some cases ?

I tried to reuse the accumulation pattern :

      Error *err =3D NULL, *local_err =3D NULL;
      foo(arg, &err);
      bar(arg, &local_err);
      error_propagate(&err, local_err);
      if (err) {
          handle the error...
      }

but I am doing it wrong. Another reason to split the patch.

Thanks,

C.
=20
=20
>>      if (err) {
>>          error_propagate(errp, err);
>>          return;
>> @@ -278,14 +296,6 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)
>>                          s->spi[i].ctrl->flash_window_base);
>>      }
>>
>> -    /* SDMC - SDRAM Memory Controller */
>> -    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err=
);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> -        return;
>> -    }
>> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE=
);
>> -
>>      /* Watch dog */
>>      for (i =3D 0; i < sc->info->wdts_num; i++) {
>>          object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized"=
, &err);
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 6045ca11b969..500de6d16d09 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -800,6 +800,8 @@ static const VMStateDescription vmstate_aspeed_smc=
 =3D {
>>
>>  static Property aspeed_smc_properties[] =3D {
>>      DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
>> +    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
>> +    DEFINE_PROP_UINT64("max-ram-size", AspeedSMCState, max_ram_size, =
0),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>=20
> thanks
> -- PMM
>=20

