Received: by 10.223.197.9 with SMTP id q9csp6981164wrf;
        Thu, 19 Oct 2017 09:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ShKFtEQagxd1jd2rKgnb0WocgUwRkJA7xmvr59aQfqwh11hDa9y9ObFO+DX3etY6XodasB
X-Received: by 10.233.239.140 with SMTP id d134mr2689342qkg.308.1508429695476;
        Thu, 19 Oct 2017 09:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508429695; cv=none;
        d=google.com; s=arc-20160816;
        b=WV6YrEn8xSAdftCqZ/z12SGVQnfR+SSQJq2Nw1YnHChTjd2hLI1p2te8x6Tzh8SG+u
         hiry+KpHSeyLvuE2M8PUMo0fxeqRZvBYlh7I+XjHAjpUGer7yjSjL37gd9Bq5JABFWCL
         zc+jUOpznxVuwgcrgPQngEf1M2LNmn3b3NsO/WzJVAEkSdY/upYugaAICGhjkD/Zekyb
         kdSaN1M2GRZJrVyYYSY9y0OhI9fmoUpeosYoz3KVvJnJkrCLBgMSQhiCKaWekovl0Uvt
         FZa28RfxJIirRkZvbTF8qR7gSiPvH9MlU1V7lhAJhy/u+y12nwapNNwFWkFIhdFiUBmD
         HkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=smwsWHHHN3vJV8y8mAfo0CP9qC9Bzas2z2Ut/Ode+Bg=;
        b=NNKFYEn/B/AGo5BzIdwq2muXyMB9IZgUPjs33bK9DkGxrggPw6LORDaupNu6UOKDJv
         sIHtqbZMQqCiSd38EOYaYsQSNmevUbt4JlCk1LNLIWTe0iO9kXlroNnVq4t2SLft3+ML
         ttPE/C1xWTLgpMnoFsuUyzO0fLD7PhhV6gmzarUDkSuzJI9pUR2/uubULyXY3xhd98Ll
         8S756mMEh2SEaF1kWo8y2T+HpFWICppKB4UK5tSDzc72Zx1PfTIhovzolW6djgQKEqKf
         ECRHzno7kGwEOkVVrvR/EEUQNnWr+xD8O4DH/2kuHMXxZ/KhXFwOTatO1NhZ8vsXQKHZ
         4YYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a34si1614143qte.293.2017.10.19.09.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5DTB-0002dD-Bq
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DSv-0002cf-Ag
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DSr-0006EF-9p
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:14:37 -0400
Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]:38225)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5DSr-0006Dc-2p
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:14:33 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 26916143A49
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 18:14:31 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 56AEC80077;
	Thu, 19 Oct 2017 18:14:23 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-2-clg@kaod.org>
	<CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d885fed2-f8a4-6593-67ec-16522dc109d0@kaod.org>
Date: Thu, 19 Oct 2017 18:14:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 14944632417021955012
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.51.82
Subject: Re: [Qemu-arm] [PATCH v5 1/8] aspeed: use a ROM memory region to
 catch invalid writes
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
X-TUID: BNc3j8OKhbnj

On 10/19/2017 05:44 PM, Peter Maydell wrote:
> On 19 October 2017 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> Some legacy firmwares access unimplemented addresses on the Aspeed SoC
>> (old U-Boot code using variables in the bss when it shouldn't do).
>> Let's use a ROM memory region to catch the invalid writes and support
>> new boards without using the 'ignore_memory_transaction_failures'
>> flag.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>
>>  Changes since v4 :
>>
>>  - use a ROM memory region
>=20
> Probably worth mentioning in the commit message that this
> is a migration compatibility break for these boards.

ah. Indeed :/=20

I tend to forget about migration for these emulated machines=20
but people are starting to use these Aspeed guests on large=20
Intel hosts as if they were real BMCs. And so being able to=20
change host is a valid requirement. I will add a comment.


>>  hw/arm/aspeed.c | 22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ab895ad490af..d88a8b5120b6 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -166,6 +166,23 @@ static void aspeed_board_init_flashes(AspeedSMCSt=
ate *s, const char *flashtype,
>>      }
>>  }
>>
>> +/*
>> + * This is to track invalid writes done in the ROM by some legacy
>> + * firmwares
>> + */
>> +static void boot_rom_write(void *opaque, hwaddr offset, uint64_t valu=
e,
>> +                           unsigned size)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
>> +                  __func__, offset, value, size);
>> +}
>> +
>> +static const MemoryRegionOps boot_rom_ops =3D {
>> +    .write =3D boot_rom_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>>  static void aspeed_board_init(MachineState *machine,
>>                                const AspeedBoardConfig *cfg)
>>  {
>> @@ -216,8 +233,9 @@ static void aspeed_board_init(MachineState *machin=
e,
>>           * SoC and 128MB for the AST2500 SoC, which is twickende as b=
ig as
>>           * needed by the flash modules of the Aspeed machines.
>>           */
>> -        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspe=
ed.boot_rom",
>> -                               fl->size, &error_abort);
>> +        memory_region_init_rom_device(boot_rom, OBJECT(bmc), &boot_ro=
m_ops,
>> +                                      NULL, "aspeed.boot_rom", fl->si=
ze,
>> +                                      &error_abort);
>>          memory_region_add_subregion(get_system_memory(), FIRMWARE_ADD=
R,
>>                                      boot_rom);
>>          write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort)=
;
>> --
>=20
> Don't you want to create the ROM device even if there happens
> not to be any contents specified by the user? The thing is still
> there in the SoC even if it's empty...

Do you mean that we should create the boot ROM device even if there=20
is no file backend ? I think so yes. Let's do a v6 :)

Thanks,

C.
