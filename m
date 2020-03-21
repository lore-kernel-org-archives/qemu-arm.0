Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2188904lfe;
        Sat, 21 Mar 2020 07:20:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv7/uA+r2eFXoiiNR8tc0ReXgIuJflRYx14FG+V9T9NRym+7Fz5HkbpJpQsRtbOStz1sCfa
X-Received: by 2002:a37:4986:: with SMTP id w128mr13576885qka.189.1584800433176;
        Sat, 21 Mar 2020 07:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584800433; cv=none;
        d=google.com; s=arc-20160816;
        b=XETvLLvHx/NcdTIeszvYV1zveSvhGhu4zwSJzAVnxMdMI0A4lxrzR1r91v6QsAJWg+
         bZv3AhlVbfI2Ek+EP1hJ1dWUXVj2xOoN/ZyD4aqt+WXxH5kOuG3XnVop1pl2oYBdJVZk
         ySrPbdRmUA3LbeCZXbzOb0+bUjF6jGUH3GAeQ8tW3vUP8EcW9vPk/Qk6Qgmq55p1fXTO
         EfvbgsgXdSy+DnqpuSHZrcpwipCQdHE1VTT9nmWbnl9V2QoLM5/LWV4St6hnTS7M5OVw
         UjxQVocy1EqBuIV9tOyY/UGSCpB+wDSpunl5EzzZIhsVHrVmwX5CqZMESFN7FkMJopqP
         KfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=gNjOHW8r7OMkO76lwWfFXByTJHihlkr/+njTZ4qygTg=;
        b=Vl839QD7yVgKKPzNeMw+bTP1UuB6yCHN/1a6KhPt5htZLHQ+GCWLS3uTkWmsJsH11G
         kwWBRrOfIllYCJZWFSgVRem5aRIAZQFV8Zsp1l3/4dPBY2MkPSaUUa06I9hMggZP0Wnw
         eUBe+NZZmIPlzNmwfdFgCuYq9TnAq2Hzmw3lqFmhgQpiPIgK2vBWnwE1U69RwB92QiR5
         kcI+3PwYWU7RRGvw1eC4JsKZSxT7nsMp/VHonE7k7WnHdgjyhUGCbfHFBIwAkS43P4D+
         hcmUrBwqJYU82a68ET7OcZZb6pXQbTbpND7NqHJOPgQV/slOhcpUoJ3oiOuj/Lg6OoVn
         tZJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si5544408qkx.19.2020.03.21.07.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFezI-00081b-Gr
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFez9-00080H-MJ
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:20:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFez8-0004jn-B1
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:20:23 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFez8-0004ii-58; Sat, 21 Mar 2020 10:20:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 495027475F6;
 Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2143B74638A; Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E965746381;
 Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Date: Sat, 21 Mar 2020 15:20:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
In-Reply-To: <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211518410.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
 <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1442607649-1584800420=:82121"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s3Zo533RreXp

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1442607649-1584800420=:82121
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/21/20 3:12 PM, BALATON Zoltan wrote:
>> On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
>>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com>
>>> wrote:
>>>=20
>>>> Fix warning reported by Clang static code analyzer:
>>>>=20
>>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw/ide/sii3112.o
>>>> =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is nev=
er read
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=C2=A0=C2=A0=
=C2=A0=C2=A0 ~
>>>>=20
>>>> Reported-by: Clang Static Analyzer
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>> =C2=A0hw/ide/sii3112.c | 2 +-
>>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>>> index 06605d7af2..36f1905ddb 100644
>>>> --- a/hw/ide/sii3112.c
>>>> +++ b/hw/ide/sii3112.c
>>>> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, h=
waddr
>>>> addr,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D (uint32_t)d=
->regs[1].sien << 16;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>=20
>>>=20
>>> There is another function in the same file, having a similar switch
>>> statement. There is no warning for that second tunction, since "val" =
is=20
>>> its
>>> parameter, not a local varioble, like is the case here. This means th=
at=20
>>> the
>>> proposed change introduces inconsistency between two functions, there=
fore
>>> it is better to remove the initialization of "val" to 0, than to remo=
ve
>>> this line in "default" section.
>>=20
>> Oh, actually I think the warning was for that statement not for the on=
e=20
>> patched as it makes more sense there where val is assigned in void=20
>> sii3112_reg_write() where it's indeed not used so maybe that was meant=
 to=20
>> be patched instead?
>
> Ah, the warning is for hw/ide/sii3112.c:204 but I incorrectly patched=20
> hw/ide/sii3112.c:128 =3D)

Now you may patch both to replace val =3D 0 with break to keep symmetry. =
My=20
Reviewed-by stands (even if apparently not much use). Thanks for=20
Aleksandar for spotting it.

Regards,
BALATON Zoltan
--3866299591-1442607649-1584800420=:82121--
