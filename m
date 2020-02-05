Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6484724lfp;
        Wed, 5 Feb 2020 02:08:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxcNfiRnyAaTkYOV5aR7jiL7STv+5PFVdVB2gCNZcORCSDD049BHsb0rQiAc0LxHdc1U33
X-Received: by 2002:a05:620a:557:: with SMTP id o23mr33445259qko.246.1580897312087;
        Wed, 05 Feb 2020 02:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580897312; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/K2KOrjU8bGCyNnclPc6xCCtAXbhrRSKaS/zdgJMwQmlGecIWKgpSMGx5uBhYwM9f
         VRwy9UhhPYy4SLJSTUL6eoDGcZH4g45Axf3AGxpevlrWg8tehd5GO5q2UtSzT0fC1+aS
         V4ZkaILBXEagLG54/znerbxcT/sY982KfAmpC9t2Z8M3CoPnWpa4wF0SzPHPvu7WzSRx
         EevcmIzTvBM81wsj2eZyV3FHyFdwYk1LfrissRcNytO7W6jQteIE/Vdn5GUgzb03TX1G
         3dzEypGaPb9Wi/IQdc1vdLqK9gfaYmsbWMFFWL6eXHf+YbVC7n0mj0rfwRp0vZK+68Zz
         RiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+8UeOsnh001H7zhvl5iAdLTAndiHoLcAVqA6Nu1TDvo=;
        b=kkb13PvLyRlNUC1bgi4eVPvUSVdfrjnzm7AYwpJ5MASJNMkPqyMBSiazk4o6hc/V3Q
         Su1QSCSeNlgRoay5C7Jh/osE5YgSf+CF/8LoSaJZI82yU5o0kINVOGG971GCUHCj34i7
         MbytRn6tztsxVJT8F4OtdOvyz3JLJAXdKwi4pqBH6rtxmZeDrEOnN7RHlB7RLzmOaHe1
         WXUKDOKfA99Vl+VHmoUe0PgjejQyqSLXkW8eE1QmXbQ4Qv2i2ulijRfCAXWvh0NClJsw
         CGTW2Gbk4WrD1U4RYWmfGq+b775rzcC6FJprJ3RJ2ugzbHsmXKGSvfWY/GyO2a0ToJP8
         gM7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si14159238qvz.60.2020.02.05.02.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 02:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izHbj-0005jV-Hk
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 05:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izHbb-0005jA-PH
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izHba-0000oC-NA
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:08:23 -0500
Received: from 1.mo7.mail-out.ovh.net ([178.33.45.51]:37287)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izHba-0000dl-Hm
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:08:22 -0500
Received: from player770.ha.ovh.net (unknown [10.110.103.115])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 70757150EF4
 for <qemu-arm@nongnu.org>; Wed,  5 Feb 2020 11:08:20 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 4CE29F1A3DEE;
 Wed,  5 Feb 2020 10:08:08 +0000 (UTC)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
 <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
Date: Wed, 5 Feb 2020 11:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10670153421237947360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrhedugdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.45.51
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKLdDias9ruh

On 2/4/20 3:28 PM, Guenter Roeck wrote:
> On 2/4/20 12:53 AM, C=C3=A9dric Le Goater wrote:
>> On 2/3/20 7:09 PM, Guenter Roeck wrote:
>>> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
>>>
>>> For unsupported commands, keep sending a value of 0 until the chip
>>> is deselected.
>>>
>>> Both changes avoid attempts to decode random commands. Up to now this
>>> happened if the reported Jedec data was shorter than 6 bytes but the
>>> host read 6 bytes, and with all unsupported commands.
>>
>> Do you have a concrete example for that ? machine and flash model.
>>
>=20
> I noticed it while tracking down the bug fixed in patch 3 of the series=
,
> ie with AST2500 evb using w25q256 flash, but it happens with all machin=
es
> using SPI NOR flash (ie all aspeed bmc machines) when running the Linux
> kernel. Most of the time it doesn't cause harm, unless the host sends
> an "address" as part of an unsupported command which happens to include
> a valid command code.

ok. we will need to model SFDP one day.

Are you using the OpenBMC images or do you have your own ?=20

>=20
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> =C2=A0 hw/block/m25p80.c | 10 +++++++++-
>>> =C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>> index 63e050d7d3..aca75edcc1 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t =
value)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; =
i < s->pi->id_len; i++) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s->data[i] =3D s->pi->id[i];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (; i < SPI_NOR_MAX_ID=
_LEN; i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
->data[i] =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> It seems that data should be reseted in m25p80_cs() also.
>>
> Are you sure ?
>=20
> The current implementation sets s->data[] as needed when command decode
> is complete. That seems less costly to me.

ok.
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


Thanks,

C.
=20
> Thanks,
> Guenter
>=20
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->len =3D s->pi->=
id_len;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->len =3D SPI_NOR_MAX_ID=
_LEN;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->pos =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->state =3D S=
TATE_READING_DATA;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t =
value)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->quad_enable=
 =3D false;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->pos =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->len =3D 1;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->state =3D STATE_READIN=
G_DATA;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->data_read_loop =3D tru=
e;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->data[0] =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log_mask(=
LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>
>=20

