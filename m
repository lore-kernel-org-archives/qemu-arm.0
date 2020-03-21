Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2194629lfe;
        Sat, 21 Mar 2020 07:26:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv83DJDBqWJYOLLcBiT0cZu3W0erq7jODHdo3y6PvSqGf4T+q35cAt9MDe5IDYIzzqSGVhh
X-Received: by 2002:a37:4cd1:: with SMTP id z200mr11563514qka.324.1584800800161;
        Sat, 21 Mar 2020 07:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584800800; cv=none;
        d=google.com; s=arc-20160816;
        b=iYukZgBhSTYb7JK63Se579sEfCzYQP1iekPDrp/dZUWKuRLE08EUsal8HtJVPPqJRe
         VF5mfAbPxz8MoJgVt8sMgZVO0snqMGX0dwkQVKGwRAmBYCk65z5+SK4m/SScsKm7w+cZ
         DrGSjyySvOxzHPStNPsINmO4a9UlSN104nokRVdaIkRTlHxOh1zINd3N7I0bqPTEHycd
         G3ynH5vRGq8X590NTREfJJuqMRq8C/zSDb/MPJkYe8iRNjVcUQJ2VkVJ/gmTfBzOuFnW
         QRbGPHNyqTcrSVT+h8ZJsQZwnDw14f1P8c3WRntBzmG5j4oWLXpUl2Fwg0/i2L3NJSMi
         Zvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=8Z4ixueJjJ4ubeAjWuW5nAjaqvlbdw9Nl7/+fHva+CU=;
        b=ja2QIBW8+NHDgjDestmzHXUbRm/03mtXxo+0O/IJ2NQ+pY9AEfSJDv63wLpq2l3lhj
         cenBjrWLZwK50G411LiZbKrjso8CU2to1+vNckmXRbVE24huNRvqR7MOCCoWRGPx1nM3
         XHvKOpX5NaXXXQJ7fJ3nBWYz1Gc3Li4xK/fzWl3aKHkwrexN/a5ymnzbE0XSTdlCXAXo
         eSlx0IaZAZYNAoPefD1Vwb447FeJC8Eyk/ZCCiGyYVJSCz6+xNtwf2KdTVPxunOKu0hN
         lQjelzY6hvdMMwHPwtAlD7nxQaLmec9jcS8YQLatbOF7ZnBexdeK+dpa+UmCA+4SH6ug
         O2ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RkRi+Ldo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si5419755qve.176.2020.03.21.07.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RkRi+Ldo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFf5D-0002Yq-Hb
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFf53-0002Xk-FE
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFf52-00084P-4r
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:26:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFf51-00083y-W0
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z4ixueJjJ4ubeAjWuW5nAjaqvlbdw9Nl7/+fHva+CU=;
 b=RkRi+LdoW0teX4WOpkhzqGk6sT+x2Ub9wCDdo6K06kApI+wv/4E6VrcXP+CBiwOPTIDCAc
 xT36QdTJ/7EBFrkqhou+icLQkIi3zh1TRhR8i/1WYBwF19Sjz/cPahFXZAX9EX08yd5bV/
 qFnzDXSv7KKIDdVnma1bvP+ztNF0ZsI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-_LJugzMbOZGK0r6nFcDwgA-1; Sat, 21 Mar 2020 10:26:25 -0400
X-MC-Unique: _LJugzMbOZGK0r6nFcDwgA-1
Received: by mail-ed1-f72.google.com with SMTP id u1so7602494edr.4
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fXzrylgCR5TsnuGN9CDtaZ0d54miYJjDG0GGxm3NPM=;
 b=A0WPH+5m9vqOeC0adVnBWtDMOTFeiEblw9Pz9LnLdZncQCQu6Iuj2268gycka9Zh2H
 phm6S6qmyzS2IKSlMhm7Oykkis3Xhx/xhfUiJUC5HP6leQzyU7OTnGhBpqT8ETj++T33
 TCdegHrv4fA8Ek0uFi9cydvG4SDP5ftW8KBNHipsmtUxRknMjVfIFvGr0sF0TlYDxVve
 tZuaVerqYx7k7OwqT3NRjP7JE/m3qXANv6/CVclMsXJSx7ZT+EJ9Zi16Xp1UXHg11aTj
 M00vcBT+Ei/H/7ZLYXSF3nCq/8OIPI4Oqf6zwv3zT1sqCLjrqQ8/KDSS8CbRVy0qgBVx
 ICJg==
X-Gm-Message-State: ANhLgQ0Jbo1atjMhS3TclQ7qFq6olDzER5hu8GUiJpOI1Wht+w15djCo
 +ucTf26I44XtL/8wbX7ybu5TYjNF8wZVgp3WM1J+LpRD7kGG344mLj/RS/bshqgdbpPdpU6wdSi
 DAL4YloiX8Je+
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr7073503edx.96.1584800784460; 
 Sat, 21 Mar 2020 07:26:24 -0700 (PDT)
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr7073462edx.96.1584800784104; 
 Sat, 21 Mar 2020 07:26:24 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id e16sm563771ejx.53.2020.03.21.07.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:26:23 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Message-ID: <7117b1dd-074b-04bf-61f5-da215faa0b7b@redhat.com>
Date: Sat, 21 Mar 2020 15:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUVht4gkLosB

On 3/21/20 3:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/21/20 2:39 PM, Aleksandar Markovic wrote:
>>
>>
>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com=20
>> <mailto:philmd@redhat.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 Fix warning reported by Clang static code analyzer:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 hw/ide/sii=
3112.o
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 hw/ide/sii3112.c:204:9: warning: Value s=
tored to 'val' is never=20
>> read
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=
=A0 =C2=A0~
>>
>> =C2=A0=C2=A0=C2=A0 Reported-by: Clang Static Analyzer
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@re=
dhat.com
>> =C2=A0=C2=A0=C2=A0 <mailto:philmd@redhat.com>>
>> =C2=A0=C2=A0=C2=A0 ---
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0hw/ide/sii3112.c | 2 +-
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletio=
n(-)
>>
>> =C2=A0=C2=A0=C2=A0 diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 index 06605d7af2..36f1905ddb 100644
>> =C2=A0=C2=A0=C2=A0 --- a/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 +++ b/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(=
void *opaque,
>> =C2=A0=C2=A0=C2=A0 hwaddr addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (uint=
32_t)d->regs[1].sien << 16;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0default:
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>
>>
>> There is another function in the same file, having a similar switch=20
>> statement. There is no warning for that second tunction, since "val"=20
>> is its parameter, not a local varioble, like is the case here. This=20
>> means that the proposed change introduces inconsistency between two=20
>> functions, therefore it is better to remove the initialization of=20
>> "val" to 0, than to remove this line in "default" section.
>=20
> No clue why there is no warnings emitted for sii3112_reg_write()...
>=20
> Do you mind sending a patch?

Don't worry I'll follow up.

>=20
>>
>> Regards,
>> Aleksandar
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_sii3112_read(size, ad=
dr, val);
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;
>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2.21.1
>>
>>

