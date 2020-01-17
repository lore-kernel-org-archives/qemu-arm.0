Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9476795lff;
        Thu, 16 Jan 2020 23:57:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgeBKdNKTdF6+LbUh/qBvu1+Q9b+gL2DNqK/VqqDNW54ttfA9cvVK66l5s4QjWQH2X780B
X-Received: by 2002:a05:620a:955:: with SMTP id w21mr37186387qkw.122.1579247831136;
        Thu, 16 Jan 2020 23:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579247831; cv=none;
        d=google.com; s=arc-20160816;
        b=QULnGB36712PGa3jJJi1GKYbz/hRuAjKXtbKB/xMsYfwItFSyJu4rsgf9OxNXcMLug
         VO1c4Hy6GtHYIZKE56M9DMaP71NjGUE4a1/yax763N4KrjkmWm2/74gm/9S25JaX/OgQ
         X+LlnlL5UB+Ozi621hBA7Tyt3bYX/Z03vNyKyhXK69fcll7K3f3LwgDwmP2i6t5jLXzW
         fkh5WzOVYSg1h0RPXliWYVoeW9rLgJvu30dhnE6TOD3G0qttFoim2ynQJG10T8ukaeLg
         X/Bu1LqtYzh9SO5zOTk19x/rXezTb9RQlvAKEMvxa9sDp9fwx8WJwpF3SAOHyjS41xbD
         TqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=E0SFl10Bf2Ut+3eA5hO87Tn+PKdtFMN/pv6J3hWQ4sY=;
        b=Mkw/KDO/3QBZoYb4HpMUi86s+XPWV1nx8vaDkDlLLxWAbiHVEuwUk6vwDH5tWppQaG
         XK53FagzVODoMD3LyxsI9x9wlqvgDQu8XQscDgV5/xX5GJnqH0lgiWKoXijEqdYnElVi
         HsI6ixmmXnwqBijG6myxGjAunpKSA2lfTjW7J46ltTCCDFpWrDIK1c3xqzDVX/bFoG8+
         YiihDmzn7BrjLF7zM06FIbt2Chrlaoe8kLkr+AwAyGXOfl5uWuU9kJMZwNPehnM419+5
         dYDXoH9K9nZhKx6iJlgHCoLfOXqXmhC4f5a2NyS87uwNiCRYPsw4GHmYTmX6UBuu40MG
         RQ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t53si14573525qtb.226.2020.01.16.23.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 23:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isMVB-0006cy-Vk
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 02:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1isMUw-0006W7-L3
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 02:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1isMUu-00074R-VB
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 02:56:54 -0500
Received: from 6.mo178.mail-out.ovh.net ([46.105.53.132]:48418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1isMUu-0006zz-Oe
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 02:56:52 -0500
Received: from player778.ha.ovh.net (unknown [10.109.146.137])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 346F98C828
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 08:56:43 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 32447E55C351;
 Fri, 17 Jan 2020 07:56:37 +0000 (UTC)
Subject: Re: [PATCH v2 08/86] arm:aspeed: actually check RAM size
To: Igor Mammedov <imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-9-git-send-email-imammedo@redhat.com>
 <83481ccb-38e4-d0a2-18b5-66fcd7248521@kaod.org>
 <20200116183538.2f84604c@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a2b7c17a-1f09-3272-d327-aff9688fdacb@kaod.org>
Date: Fri, 17 Jan 2020 08:56:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116183538.2f84604c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7546625603812953043
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.53.132
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BtGpItGbdLrt

On 1/16/20 6:35 PM, Igor Mammedov wrote:
> On Thu, 16 Jan 2020 09:41:03 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
>> On 1/15/20 4:06 PM, Igor Mammedov wrote:
>>> It's supposed that SOC will check if "-m" provided
>>> RAM size is valid by setting "ram-size" property and
>>> then board would read back valid (possibly corrected
>>> value) to map RAM MemoryReging with valid size.
>>> Well it isn't doing so, since check is called only
>>> indirectly from
>>>   aspeed_sdmc_reset()->asc->compute_conf()
>>> or much later when guest writes to configuration
>>> register.
>>>
>>> So depending on "-m" value QEMU end-ups with a warning
>>> and an invalid MemoryRegion size allocated and mapped.
>>> (examples:
>>>  -M ast2500-evb -m 1M
>>>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-conta=
iner
>>>       0000000080000000-00000000800fffff (prio 0, ram): ram
>>>       0000000080100000-00000000bfffffff (prio 0, i/o): max_ram
>>>  -M ast2500-evb -m 3G
>>>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-conta=
iner
>>>       0000000080000000-000000013fffffff (prio 0, ram): ram
>>>       [DETECTED OVERFLOW!] 0000000140000000-00000000bfffffff (prio 0,=
 i/o): max_ram
>>> )
>>> On top of that sdmc falls back and reports to guest
>>> "default" size, it thinks machine should have.>
>>> I don't know how hardware is supposed to work so
>>> I've kept it as is. =20
>>
>> The HW is hardwired and the modeling is trying to accommodate with
>> the '-m' option, the machine definition and the SDRAM controller
>> limits and register definitions for a given SoC. The result is not=20
>> that good it seems :/=20
>>
>>> But as for CLI side machine should honor whatever
>>> user configured or error out to make user fix CLI.
>>>
>>> This patch makes ram-size check actually work and
>>> changes behavior from a warning later on during
>>> machine reset to error_fatal at the moment SOC is
>>> realized so user will have to fix RAM size on CLI
>>> to start machine. =20
>>
>> commit 8e00d1a97d1d ("aspeed/sdmc: Introduce an object class per SoC")=
=20
>> moved some calls from the realize handler to reset handler and it
>> broke the checks on the RAM size.
>>
>> I think we should introduce get/set handlers on the "ram-size" propert=
y
>> that would look for a matching size in an AspeedSDMCClass array of val=
id
>> RAM sizes. The default size of the machine would be a valid default an=
d
>> bogus user defined sizes would be fatal to QEMU. =20
>=20
> That's what I'm after, i.e. board either accepts user asked size or exi=
ts
> with error.=20

We should be able to catch bogus values with :

    object_property_set_uint(OBJECT(&bmc->soc), ram_size, "ram-size",
                             &error_abort);

in aspeed_machine_init() and let QEMU exit.

> So as far as there aren't any fix-ups it should work for
> the purpose of this series
>
>>
>> We could get rid of the code :
>>
>>     /* use a common default */
>>     warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
>>                 s->ram_size);
>>     s->ram_size =3D 512 << 20;
>>     return ASPEED_SDMC_AST2500_512MB;
>>
>>
>> 'max_ram_size' would be the last entry of the AspeedSDMCClass array
>> and, anyhow, we need to check bmc->max_ram is really needed. I am not=20
>> sure anymore.=20
>=20
> I'll rework aspeed parts taking in account feedback.

OK. We will give them a try. I don't think you have to bother with=20
bmc->max_ram for the moment. It doesn't seem to be in your way.=20

Thanks,

C.=20

>>> It also gets out of the way mutable ram-size logic,
>>> so we could consolidate RAM allocation logic around
>>> pre-allocated hostmem backend (supplied by user or
>>> auto created by generic machine code depending on
>>> supplied -m/mem-path/mem-prealloc options.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> CC: clg@kaod.org
>>> CC: peter.maydell@linaro.org
>>> CC: andrew@aj.id.au
>>> CC: joel@jms.id.au
>>> CC: qemu-arm@nongnu.org
>>> ---
>>>  hw/arm/aspeed.c       | 9 +--------
>>>  hw/misc/aspeed_sdmc.c | 5 +++++
>>>  2 files changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index cc06af4..525c547 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -213,14 +213,7 @@ static void aspeed_machine_init(MachineState *ma=
chine)
>>>                                  "hw-prot-key", &error_abort);
>>>      }
>>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>> -                             &error_abort);
>>> -
>>> -    /*
>>> -     * Allocate RAM after the memory controller has checked the size
>>> -     * was valid. If not, a default value is used.
>>> -     */
>>> -    ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "ram-si=
ze",
>>> -                                        &error_abort);
>>> +                             &error_fatal);
>>> =20
>>>      memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram=
_size);
>>>      memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
>>> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
>>> index 3fc80f0..b398e36 100644
>>> --- a/hw/misc/aspeed_sdmc.c
>>> +++ b/hw/misc/aspeed_sdmc.c
>>> @@ -165,6 +165,11 @@ static void aspeed_sdmc_realize(DeviceState *dev=
, Error **errp)
>>>      AspeedSDMCState *s =3D ASPEED_SDMC(dev);
>>>      AspeedSDMCClass *asc =3D ASPEED_SDMC_GET_CLASS(s);
>>> =20
>>> +    if (!g_hash_table_contains(asc->ram2feat,
>>> +                               GINT_TO_POINTER(s->ram_size >> 20))) =
{
>>> +        error_setg(errp, "Invalid RAM size 0x%" PRIx64, s->ram_size)=
;
>>> +        return;
>>> +    }
>>>      s->max_ram_size =3D asc->max_ram_size;
>>> =20
>>>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
>>>  =20
>>
>>
>=20

