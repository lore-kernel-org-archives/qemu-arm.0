Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2237011lfe;
        Sat, 21 Mar 2020 08:12:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv44oNkouWM+NCtLCbDU1Q4Cbom8oKArVJ6TIEOmrBrw6dJBDXBzUmW9sg/a3ARa7BhskmS
X-Received: by 2002:a37:7884:: with SMTP id t126mr13266519qkc.288.1584803531517;
        Sat, 21 Mar 2020 08:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584803531; cv=none;
        d=google.com; s=arc-20160816;
        b=HUksbuiwtz3XbyWshtPZEbFmJ0Y/OPMdd5nlS7uPrH2RcimRczkrlmejk7yLWteduL
         UAbMKN66I9nfpGV0w+yANUstxsCI6VaX86B540u0/il3Wd+OoKoqIST8Z0tpjDsZUzaF
         L7CpEjIsXPFc1/wDqvlWyuU6WRKFx9/m3WAOtB+AUk504fSc1B+svKUrBKtuH+4yxBVL
         7PozeFvSxZ68piuLMX253f9J3I0dIYA/nv+su6BBf7o55d94gWZE2uFJiFYAnhSM4fa+
         dcPVzG4Z4UJqt4j7OZflDHphEZWjYc6/KcfSoG+5XgexAdl2NH2HCr3iHjCbv23FZvMw
         yiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=BFW2ix9b4/hkyUOagOR+0QZWx54y1lnSnEYZBdm4hD8=;
        b=hTwVBP5iusTlbBU7lMfgqvZHy5EDS/S8/AjRdcZm+RJUKvxvM5BJNy70QyBSTl7E6v
         xIfysCJDIdcFsD/ZZBBUg9UG7pESSkFYCozPbCPcfLML7duIOhV6hU/lhUjv8rLDU1cr
         hPZvFmlOSd17IRgFnted9hxfjXV7pxRwF0ERr8DUFK+Vzjr61QNSCo4iwuV2qRGeqhvH
         XX20HycDJgxWc+RAUjiW8giWl35eM77+WJg6ryhPEqhkaS6uKPzqZwp9RUOyhZRvxw+5
         W372mcv0AzLbHzb4pJRhNwnK9ARUqe8TOEbPSHBe4h8Hln7KxPJuVTGVLNZP5ZJHXc12
         LhxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186si5673464qkb.47.2020.03.21.08.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 08:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfnG-0004Ew-UB
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 11:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFfn6-0004Eo-5d
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 11:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFfn4-0001C4-Jq
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 11:11:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52287)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFfn3-0001BP-VL; Sat, 21 Mar 2020 11:11:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 142A3747DCF;
 Sat, 21 Mar 2020 16:11:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E38E6747DF8; Sat, 21 Mar 2020 16:11:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE5A3747871;
 Sat, 21 Mar 2020 16:11:55 +0100 (CET)
Date: Sat, 21 Mar 2020 16:11:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: Re: [PATCH-for-5.0 01/11] block: Remove dead assignment
In-Reply-To: <CAHiYmc5gpHCUfc5bPMs8Qa7NETYkkj8rfV5dTyqZF4ZQTeNa8Q@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2003211608170.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-2-philmd@redhat.com>
 <CAHiYmc5gpHCUfc5bPMs8Qa7NETYkkj8rfV5dTyqZF4ZQTeNa8Q@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1870441923-1584803515=:82121"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KjGxCDjMG1Pw

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1870441923-1584803515=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
> 12:49 PM Sub, 21.03.2020. Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> =D1=98=D0=B5
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> Fix warning reported by Clang static code analyzer:
>>
>>   block.c:3167:5: warning: Value stored to 'ret' is never read
>>       ret =3D bdrv_fill_options(&options, filename, &flags, &local_err=
);
>>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>
> Peter, and others,
>
> Is this allowed use of "Reported-by:" mark?
>
> I did not notice it being used this way before. And was under impressio=
n
> that all similar tags/marks must be followed by a person, not a tool.

I think there were previous patches with Reported-by: Euler Robot which=20
may be similar to this usage.

Regards,
BALATON Zoltan

>
> Regards,
> Aleksandar
>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  block.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block.c b/block.c
>> index a2542c977b..908c109a8c 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const
> char *filename,
>>                                      parent->open_flags, parent->optio=
ns);
>>      }
>>
>> -    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err)=
;
>> +    bdrv_fill_options(&options, filename, &flags, &local_err);
>>      if (local_err) {
>>          goto fail;
>>      }
>> --
>> 2.21.1
>>
>>
>
--3866299591-1870441923-1584803515=:82121--
