Received: by 10.223.197.9 with SMTP id q9csp6777180wrf;
        Thu, 19 Oct 2017 05:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R5jqOAJdh+pm82ExHjCwvYbMN1izE+tFMTN6xlwSFt2wWhrnDtCqQLe0QBOIVU7j5xEeuR
X-Received: by 10.55.149.70 with SMTP id x67mr1787210qkd.62.1508417867795;
        Thu, 19 Oct 2017 05:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508417867; cv=none;
        d=google.com; s=arc-20160816;
        b=bXNCM9yzLHlq2Zl436mxZIctD7b9xXOlieTiHEeNjWYVtyI8zF1/BmJarUKM/HQNDO
         CLfOhp7s9uQJjOnygkUzLxBghEkyH6Mrj1R6ybS/gwQqpmdNXMWjnmMBw7PGkhcosSJP
         akernIyEot1j2UBKJAt+7JQ8SJBG/VbJh4Emx3HmQXvPpkb9Xz3PEacdNHPXNTnZ3Ys1
         Zm86ZfGKEcqVDgCFsPGo+Kldm3VG01VuhG2hyjLtTOhQd8MFBWQea2DEmBnEfeyj/KEH
         o9LrZ3Ox0fT0sywKXlEM841/e9gjPMC203QWmKRPRz1JK97HbTJdWGYKmkAGE90dSOgC
         gsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=NhkKwmn8l18oOSLQYqC9nudttbHw4sHw9oLm4/I4HYE=;
        b=UD+9b5jFD5cGo1PuUliLKrT93GQHW842pdtnsNzvVozMlQQd6VGAGILTxAZ/CQ2GqW
         jewOhEMq/ZY9C/wCYIFAJHxw99jUiTDShtAHOFzJVl4ZPQnrLJAjQqEMoeD7FRBvnJFz
         jt7fUJKpvJYwpU3N8ihvSCuHFIwsWNWXIg9nhhOOuRGrJnxBEmQatCbJlMklVvQ2DyR3
         MUtyRMX5PusWdDeMo6PbylO1N7AqzS+rAE+pfzBILVpTQoWJSLyD/wQp+i40GZZwy4LH
         yuOaD/BxzpzJ1pxca/klqBx+tBy0GY46IjCvJiynLk9zPC0rDmHzFQT21/N75dCihu/B
         0XXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b12si13026791qta.152.2017.10.19.05.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 05:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5AOP-0003uM-Hz
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 08:57:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5AOF-0003u2-Dz
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 08:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5AOA-0006Yo-HE
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 08:57:35 -0400
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:56025)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5AOA-0006Wh-Ap
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 08:57:30 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id A0032145DA9
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 14:57:28 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 597088008D;
	Thu, 19 Oct 2017 14:57:19 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171019100410.26239-1-clg@kaod.org>
	<20171019100410.26239-2-clg@kaod.org>
	<CAFEAcA_xM93zxp-QqwXd+Fxj9LE6sPn+9zWbiL4tK1GZOqKNYw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ad2bd2fd-dbad-7f1c-66df-9c5d638df127@kaod.org>
Date: Thu, 19 Oct 2017 14:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xM93zxp-QqwXd+Fxj9LE6sPn+9zWbiL4tK1GZOqKNYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11616472290208615364
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.204
Subject: Re: [Qemu-arm] [PATCH v4 1/8] aspeed: introduce a dummy ROM device
 to catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckrBCd5jkYSG

On 10/19/2017 01:06 PM, Peter Maydell wrote:
> On 19 October 2017 at 11:04, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> Some legacy firmwares access unimplemented addresses on the Aspeed SoC
>> (old U-Boot code using variables in the bss when it shouldn't do).
>> Let's add a dummy ROM device to catch the invalid writes and support
>> new board without using the 'ignore_memory_transaction_failures' flags=
.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ab895ad490af..e44733153819 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -166,6 +166,19 @@ static void aspeed_board_init_flashes(AspeedSMCSt=
ate *s, const char *flashtype,
>>      }
>>  }
>>
>> +static void boot_rom_rw_flash_write(void *opaque, hwaddr offset, uint=
64_t value,
>> +                              unsigned size)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
>> +                  __func__, offset, value, size);
>> +}
>> +
>> +static const MemoryRegionOps boot_rom_rw_flash_ops =3D {
>> +    .write =3D boot_rom_rw_flash_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>>  static void aspeed_board_init(MachineState *machine,
>>                                const AspeedBoardConfig *cfg)
>>  {
>> @@ -209,6 +222,7 @@ static void aspeed_board_init(MachineState *machin=
e,
>>      if (drive0) {
>>          AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
>>          MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
>> +        MemoryRegion *boot_rom_rw =3D  g_new(MemoryRegion, 1);
>>
>>          /*
>>           * create a ROM region using the default mapping window size =
of
>> @@ -221,6 +235,16 @@ static void aspeed_board_init(MachineState *machi=
ne,
>>          memory_region_add_subregion(get_system_memory(), FIRMWARE_ADD=
R,
>>                                      boot_rom);
>>          write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort)=
;
>> +
>> +        /*
>> +         * Create a fake ROM region to track invalid writes done by
>> +         * some legacy firmwares
>> +         */
>> +        memory_region_init_rom_device(boot_rom_rw, NULL, &boot_rom_rw=
_flash_ops,
>> +                                      NULL, "aspeed.boot_rom_rw", fl-=
>size,
>> +                                      &error_abort);
>> +        memory_region_add_subregion_overlap(get_system_memory(), FIRM=
WARE_ADDR,
>> +                                            boot_rom_rw, 0);
>>      }
>=20
> You're already (in some conditions) adding a memory region at this
> address -- you can see it just above. I think you probably want
> to be always creating this region in the same way, whether you
> need to do a write_boot_rom() to it or not, rather than creating
> two things at the same address.

ok. I didn't think that was possible. Let me try that.

Thanks,

C.=20

>=20
> I think that currently memory_region_init_rom() regions will
> MEMTX_DECODE_ERROR on attempts to write to them -- that's really
> a bug, which we might be able to fix, but for now you can do
> this with the init_rom_device() and a comment about why we
> can't just use memory_region_init_rom().
>=20
> thanks
> -- PMM
>=20

