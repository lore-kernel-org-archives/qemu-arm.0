Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2182007lfe;
        Sat, 21 Mar 2020 07:12:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsK67+pFXbgBDnQpR7akEvR6pTmq6cWtyo/gyap4uQe8UOw/AzIgp64vG3UO7wOUtEDCvyv
X-Received: by 2002:ae9:e894:: with SMTP id a142mr13337177qkg.379.1584799979809;
        Sat, 21 Mar 2020 07:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584799979; cv=none;
        d=google.com; s=arc-20160816;
        b=mo06Ry7QjmPcQeOAFXOZJRV07DyDu6K8vJTiKFjrX0Qh5tzwdCAhJnyoqpSMCM+XXM
         hL2lj9YNXKKNaKvCT4Pijn9T7jzGw4B7zbupu3u3jGQJ+ABQBYw31AwEBijVTHRzmnBX
         kohj1JLuO3d3AyegrUSDulaXsljY5YvpOnW3+FirnJi9bv6Xc92sr1kf9Pfy1V8txeYJ
         6JEOToybLsPKCzmeYdFNP0g0YOzAqenx0sj/q4Uv7nCm2XI6y5xfJNVFy4xyA2N7MljT
         ifVpEZO1jM1F3/A+n/q7gjIuE9F1lkfphS2nDaVFE1zPwgpc3ThhCU7si47j5yyXq4BP
         6ZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=WAIWNxiCcB90l8kwYTCJPgC797C6Gl0pL3/yL60LzcE=;
        b=gNaNNDiUahyavRmaCzUvyNseub3/tqPANsg5k4inXGleyND8HH1xaG8Z/diNCdKg2O
         vIJgb/x4bHKyMKmrnjCAq+XDQ1sG1pZOGbTtbEWSGZOP/S7gU3Y16FHPCwrFqVFQPD+C
         6fTbDiBYaBAlwW9zq7ZaRo4XmuiBs/C8bKE1pgfkaq1rNWGUMNcJVpdMVjhY5jIwyWXJ
         NoWPORQoFtghcZaOY06Q10F5YQOfd/2DJIZccSF6iRjLF1/q+p7frLEqeaysTbzGJi8u
         +ARO8fCF4VGBgTBEFirj6/zQ3DVFKkZMbGt7Ou+EjFkOVs/YQMytXwXyWR6jHGVmAUry
         qFHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si5477927qkm.187.2020.03.21.07.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFerz-0001lX-8X
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFerq-0001in-Jq
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFero-0006Hx-Uf
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:12:49 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:35595)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFero-0006DI-OJ; Sat, 21 Mar 2020 10:12:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C9D97747DCF;
 Sat, 21 Mar 2020 15:12:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A9E567476D5; Sat, 21 Mar 2020 15:12:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A7DC47475F6;
 Sat, 21 Mar 2020 15:12:44 +0100 (CET)
Date: Sat, 21 Mar 2020 15:12:44 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
In-Reply-To: <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-195879098-1584799964=:82121"
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
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rFsXBuLGmfH6

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-195879098-1584799964=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
> wrote:
>
>> Fix warning reported by Clang static code analyzer:
>>
>>     CC      hw/ide/sii3112.o
>>   hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
>>           val =3D 0;
>>           ^     ~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/ide/sii3112.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>> index 06605d7af2..36f1905ddb 100644
>> --- a/hw/ide/sii3112.c
>> +++ b/hw/ide/sii3112.c
>> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwa=
ddr
>> addr,
>>          val =3D (uint32_t)d->regs[1].sien << 16;
>>          break;
>>      default:
>> -        val =3D 0;
>> +        break;
>
>
> There is another function in the same file, having a similar switch
> statement. There is no warning for that second tunction, since "val" is=
 its
> parameter, not a local varioble, like is the case here. This means that=
 the
> proposed change introduces inconsistency between two functions, therefo=
re
> it is better to remove the initialization of "val" to 0, than to remove
> this line in "default" section.

Oh, actually I think the warning was for that statement not for the one=20
patched as it makes more sense there where val is assigned in void=20
sii3112_reg_write() where it's indeed not used so maybe that was meant to=
=20
be patched instead?

Regards,
BALATON Zoltan
--3866299591-195879098-1584799964=:82121--
