Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2119931lfe;
        Sat, 21 Mar 2020 06:05:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtz/FpPJBw/09wEIOEZoF5wiN7OFJmpBSlAxpFYMFgw7xp7VDhNeRv25jxguZYGuGYZ8CJc
X-Received: by 2002:a0c:ed34:: with SMTP id u20mr12734599qvq.226.1584795917689;
        Sat, 21 Mar 2020 06:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584795917; cv=none;
        d=google.com; s=arc-20160816;
        b=j/+AJyY60OSqSP8bkgH3MrSE2fRycydE1G+f9zZ3yPPr/NhhnUdZxafU/74TQM8+Be
         2AVbsnJRagz6QjP68slogWYg0dmZPwcryefgznjMK8e4Up9qe/WRnPj9UVgbH/40nLN7
         v6ZOeCMfHmjA1pggFZGH2GHnIa4vOAxpZWw4D4TJePpoi6x8EIMfEAsL/LxnFMedw8SB
         z+HZgd2sa/fYDqhYvA99mPUWjs0EM7e3znxIJOPA7ZCenkSvJAE3VfOdGv+K4MLxTvVJ
         aZjmtyJVxPWeERrWl//GPjgPqnPI26z5Kc5cYop6RaBj44L9qmevHq3rOqjfehTHMN8K
         8Wdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=GD117oZwfhek7Ea+c8LfVrm9s2hPBEMaiVnYpX6TrNs=;
        b=nd0DxbXUQbbS+1Tr86jjqKmqQqpZOyvnEES+94cL5JhdW7j0ABRXl5aiYqPy0a12zi
         mgRKQ6AS2R3swh6QPQSXYx1jHl/+S5JTWrXXcGGSfwaOKxmQlWju8SQC9F8uO3Tu3eQr
         MzPqbYx/FsnaxAcovIGbk4Iz0QNB0LXAwCVg/VU9gj73Dk+WYaOy8XFcVhldLJBxF4d3
         8Qkq2ERW+XvtvnF+yDy7K80B6809IBtUmFM8IsxaIjo/p8I6wbtLTfpbCgLX9f1LTXcc
         aUZAcq0u85vNMNjA/D2lBVm7PhxZybvuu6vKiFt8/r814/3tr2DAP08gsRHBGlWUjwOO
         3SJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si3815316qvm.64.2020.03.21.06.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 06:05:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFdoS-0006Jm-VF
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 09:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdoH-0006JR-Vq
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdoG-0000tu-PR
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:05:05 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFdoG-0000bi-JP; Sat, 21 Mar 2020 09:05:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D56DA7476D5;
 Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B3F187475F6; Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B1BAB746381;
 Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Date: Sat, 21 Mar 2020 14:04:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
In-Reply-To: <20200321114615.5360-6-philmd@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211400040.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-68472195-1584795899=:82121"
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ym3Mt72I9IFW

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-68472195-1584795899=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>
>    CC      hw/ide/sii3112.o
>  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
>          val =3D 0;
>          ^     ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/ide/sii3112.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 06605d7af2..36f1905ddb 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwad=
dr addr,
>         val =3D (uint32_t)d->regs[1].sien << 16;
>         break;
>     default:
> -        val =3D 0;
> +        break;
>     }
>     trace_sii3112_read(size, addr, val);
>     return val;

Value is clearly used in trace and return so don't really get why the=20
compiler complains here. Looks like wrong warning to me. It's true howeve=
r=20
that since val is init to 0 at the beginning this assignment is not=20
strictily needed and this should work as well, so

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan
--3866299591-68472195-1584795899=:82121--
