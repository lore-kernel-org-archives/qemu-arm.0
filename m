Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2183534lfe;
        Sat, 21 Mar 2020 07:14:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuSaN0ITabbh5SbEBUNrNoOUReQ/bmrKoZC5SdymeXKR6hKl4+1H9vDN8n0goD1Uk1OOwl2
X-Received: by 2002:a0c:cd8d:: with SMTP id v13mr12808124qvm.189.1584800080955;
        Sat, 21 Mar 2020 07:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584800080; cv=none;
        d=google.com; s=arc-20160816;
        b=gnL3A7qKMJ+l2KElbXri5EVjny86jaXJ4nLvuHrI2d8kPO2RmCCdAkJX4cpzkAeY0L
         0tfyyVXeBPo+HNMNUi4BM9goYBDs001rk7v6aU24uC62tNCA4FbKcweF1LDM3Lpkll1r
         Tgx09N6FBrY19pUDsOAkXFgqvRl5qNJ39bY2T2lMLacSv966NpFsczbqev03H4PYb9FI
         AXef2EKuQO0TR7MWJmmVTtEzOYM93jt+TS+UmBUyB0KRwWh1RulOPijDBv8N8bp4xQJ8
         3veQwo5df/hGr4r65GC+ppWJO7XuRJXQCj6FCsaG4Dly35wYZmbdNM8xDWLh30NDQPyq
         5WbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I4YPJfNJi4WWcG7pY6jdJqKE/BIVLG+Ljgkk1E7R0Ec=;
        b=g9sJRSkuHoMWZPxrQ2I+n94L8uzbG8grqwFUs0/BKMC45szvpePeeRHVXimLyQjW8g
         Y98+wu0qjC576E4z7GoYK6QHm9s8Su+PCInlBYEKY6X2s/Kp2Ml88vLsVWMqyHYl187c
         uzL44dpQCo3DUPjlKlb28RGScw5amHlq+Y9Xy2Ov20S0DbKtoYlnVjMir/oBGY7cJrio
         NEEccSHkriXfa+rmEUp1sRAmAf1CE+vvLMq8XBJUCwaMXy7DJkCOfWqQuuqAVhD5ejsZ
         qaH36crRn/ftVm+iEDeCTnyI4Rde7VQ4Z0ukMmeMVFZupBZQHrWlB7Cryp8eEQU3cyL5
         bK+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZT5cDXEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si5135687qvj.201.2020.03.21.07.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZT5cDXEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFetc-0003Qy-Ce
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFetL-000379-F6
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFetK-0008NG-BF
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:14:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:32076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFetK-0008N1-8X
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4YPJfNJi4WWcG7pY6jdJqKE/BIVLG+Ljgkk1E7R0Ec=;
 b=ZT5cDXEagIXBdpcLq0K3QU+HLtEUFaLRr9REARFn/RR30HjLaqvLyFhjDP4JQQEgUAQm3Z
 tWxatFyuRPZFOokAJvv9399xg2KfwzLr94ki2EPj5mso5OsDDqOxzQnSmYyn60lu9AIJYg
 QxvOZTokV9Wnh9LTHiPdaKGDGYYieX0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-J7buDpr8NLiTLeUj0ajz0A-1; Sat, 21 Mar 2020 10:14:19 -0400
X-MC-Unique: J7buDpr8NLiTLeUj0ajz0A-1
Received: by mail-ed1-f70.google.com with SMTP id y10so7503952edw.23
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qt1rHCnwTVKvmp4ECYAy2Qr+S1/Jr4/xJXDIyI0NVHs=;
 b=PlHwvjineYneIFYNPRcqCOb9rn+vwd2XrPmSyl9kYJVZt8wvBw3nfKmOVVpcwYb5Hz
 ZRSkymTCnQfLpRZ9zLx9J49v3j5DWzJ78crM5Zo5btlUMm9HxPUUo6lzbAy+6nV8YlJo
 7C59+A65nj6at9tkPjTUiWWgf1aETd26Oz6WZgqeUl7Z5z0w1PPd6MzDuky/RIbxTyTe
 M6G6VDNY208H7CH2HS99eqqJdMgd9J/6PVzJvteQEAl6U4fer8HLqzQmHQYFJ0ZyjweC
 UlH+M/12+H2X0M0zapFZ9z8EfVwHUprd6qg57nylujKDQXdEPPf2lxX5/x4uyNiBoVUx
 rEvg==
X-Gm-Message-State: ANhLgQ1JsDmCwXtiEknghqD6DrBQ71+5KjhvtbQ9g8wT2r/3oAQJgyDn
 Sb1O9g5boRmai4T7IC0sQlOOJvShRR+PnPvS5zqWaCNrDmC4PmtdsHrobAWNDOO+vBSBosQ43RD
 m1T8FtgfBEpE9
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr2095871ejb.298.1584800058081; 
 Sat, 21 Mar 2020 07:14:18 -0700 (PDT)
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr2095843ejb.298.1584800057627; 
 Sat, 21 Mar 2020 07:14:17 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id z22sm599472edl.6.2020.03.21.07.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:14:17 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Date: Sat, 21 Mar 2020 15:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-TUID: ewXudWAvn8b2

On 3/21/20 2:39 PM, Aleksandar Markovic wrote:
>=20
>=20
> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om=20
> <mailto:philmd@redhat.com>> wrote:
>=20
>     Fix warning reported by Clang static code analyzer:
>=20
>      =C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 hw/ide/sii3112.o
>      =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is nev=
er read
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~
>=20
>     Reported-by: Clang Static Analyzer
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     ---
>      =C2=A0hw/ide/sii3112.c | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>     index 06605d7af2..36f1905ddb 100644
>     --- a/hw/ide/sii3112.c
>     +++ b/hw/ide/sii3112.c
>     @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque,
>     hwaddr addr,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (uint32_t)d->regs[1].sien =
<< 16;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>      =C2=A0 =C2=A0 =C2=A0default:
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>=20
>=20
> There is another function in the same file, having a similar switch=20
> statement. There is no warning for that second tunction, since "val" is=
=20
> its parameter, not a local varioble, like is the case here. This means=20
> that the proposed change introduces inconsistency between two functions,=
=20
> therefore it is better to remove the initialization of "val" to 0, than=
=20
> to remove this line in "default" section.

No clue why there is no warnings emitted for sii3112_reg_write()...

Do you mind sending a patch?

>=20
> Regards,
> Aleksandar
>=20
>      =C2=A0 =C2=A0 =C2=A0}
>      =C2=A0 =C2=A0 =C2=A0trace_sii3112_read(size, addr, val);
>      =C2=A0 =C2=A0 =C2=A0return val;
>     --=20
>     2.21.1
>=20
>=20

