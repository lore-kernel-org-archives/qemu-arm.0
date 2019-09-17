Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5036783wrp;
        Tue, 17 Sep 2019 03:08:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzN04KJuHYiNe+6xerTgM3TsAX1B3u87GuTnaBoq84umGLVyBxBEwcSk1rd3irhIoHBbbKx
X-Received: by 2002:a37:782:: with SMTP id 124mr2857312qkh.10.1568714924232;
        Tue, 17 Sep 2019 03:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568714924; cv=none;
        d=google.com; s=arc-20160816;
        b=v+ZRrOogFOvD7/ELG0Us7y4oUrClAHXdYOR5xVyezr4wMI+qI4mr/7U5OTQ7BsqxZQ
         8MFYIlvDjcvGMTlEIXJviRrrj59q/5+xh5kZ0XbGr7L9y4INtuOujg0lmLtf1ztvpbNH
         /J3ip7SEE3HjG2AZ400/BcTyYUDgKIWeD5o4X89YV9Gu5Ndo97IFipCOJgC68A2CiZPF
         K5L+HK+dZOwYZqx1ViuGHY+NioaGyqKlzTgeGWvFnSjj37sS/ZOKYVLIZL6lSNfIqr5n
         pDVguMvsj/SE+26+X3XwwPpGKgNGEeq2mpZnMuMGOiUxV5dKYsbuS0HHM7PrpvoA2bxC
         +yfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=LciMgDcu229Xu/QozefD4nd8uVq+/9dGr6+tqd2w7wo=;
        b=OeFfG42H1Zb0MfJwXqt3cq3T12sxIse6h5sgMVSSH235Iy/W9x/qAmWrb/UausN06o
         dH80SBFLYETTGNvDw8l8MeJ5fJ1S2gPcNHj2cCvzsxwOlLrRgjjgWtwW0dEqw2ZkrMFM
         KObq4XKNR/x0BpY4QVZZBdKzjGd7PIq9d/AxWRq2QjZVNxyJL2VI8XgBzIU3NJJMyuaz
         CbPg11CueRC93Ikm8QCWqCedb3HjJG1J/o1nnplGjGWeZr3omIIxWn8n/FtunbFkyHX9
         PiLaEPy11MSsWZyQwWSQwAhxYF2+IrtyukmwAJq9fZu7fpFYEH8e/PwBRHtCYR2vDCK9
         t27A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196si1112299qki.263.2019.09.17.03.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAAPb-0000xw-9f
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iAAPO-0000tN-KK
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iAAPN-0005yh-B0
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:08:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47398)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iAAPN-0005yP-3A
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:08:29 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3DE0368B3
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 10:08:27 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id 124so575539wmz.1
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 03:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fd6mmlQAZKPTTxeuK9yalfHsfMzT+EjHiGe/wbHjyA0=;
 b=TL+CCFM0hXwO0I59wAG7o8Vl8Ktst7UCUjc6I9rO1ZreCZLFoBBciM+MX9J9apeSO3
 +FKqAPu+Rul/wxNDIwUh6ARsDV9vIXY9DtFN8Ska+UF95TaH3EMpySaQ/fNLeIGgDkhF
 eXFJ6c3cjvJ96zcoqW9FtwBtNhHP61nl9TVASUojFukykQgL6FvKXNSfQypSw7u/5MgG
 sPMy98ZwUG+nwpX1r0k+IwdIrOPV2snw//y6F9FRwHGe4lG51q8dJHZcbDmeK4DVyo1S
 ZXSIEdyIaMhaiG8rM2khsdrm0LtuSe8wXh8fMFNF4hqE4ww3yi5KmXPt8EHjqcuOMESX
 +uoQ==
X-Gm-Message-State: APjAAAWzA4zQ9vWY8vcxUROxpYtl+uE6pM9RimhwV5E8m/w7jXNg/xfH
 fMrcTQo0BQEfl+ZXdVBtKd/tr7n5XlbtsfcvKfAe3OBD+iB52ChCFs7BGEMLz2mbOFZ0imSAzuT
 C3w60ecRUgUoO
X-Received: by 2002:adf:828d:: with SMTP id 13mr2340440wrc.115.1568714906743; 
 Tue, 17 Sep 2019 03:08:26 -0700 (PDT)
X-Received: by 2002:adf:828d:: with SMTP id 13mr2340422wrc.115.1568714906540; 
 Tue, 17 Sep 2019 03:08:26 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id j1sm2572597wrg.24.2019.09.17.03.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 03:08:25 -0700 (PDT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-5-philmd@redhat.com>
 <20190917022510.GD8842@umbus.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <790ba518-e906-6c3b-1280-25f005c9768a@redhat.com>
Date: Tue, 17 Sep 2019 12:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190917022510.GD8842@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 04/13] hw: Move M48T59 device from hw/timer/
 to hw/rtc/ subdirectory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hi7lBzBD/Ffu

On 9/17/19 4:25 AM, David Gibson wrote:
> On Mon, Sep 16, 2019 at 05:48:38PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
>> The M48T59 is a Real Time Clock, not a timer.
>> Move it under the hw/rtc/ subdirectory.
>>
>> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>> ---
>>  MAINTAINERS                         |  4 +-
>>  hw/ppc/ppc405_boards.c              |  2 +-
>>  hw/ppc/prep.c                       |  2 +-
>>  hw/rtc/Kconfig                      |  3 ++
>>  hw/rtc/Makefile.objs                |  4 ++
>>  hw/{timer =3D> rtc}/m48t59-internal.h |  0
>>  hw/{timer =3D> rtc}/m48t59-isa.c      |  4 +-
>>  hw/{timer =3D> rtc}/m48t59.c          |  2 +-
>>  hw/sparc/sun4m.c                    |  2 +-
>>  hw/sparc64/sun4u.c                  |  2 +-
>>  hw/timer/Kconfig                    |  3 --
>>  hw/timer/Makefile.objs              |  4 --
>>  include/hw/rtc/m48t59.h             | 57 ++++++++++++++++++++++++++++=
+
>=20
> Uh.. this file seems to be coming out of nowhere, which doesn't seem
> right for a code motion.

Good catch!

>=20
>>  13 files changed, 73 insertions(+), 16 deletions(-)
>>  rename hw/{timer =3D> rtc}/m48t59-internal.h (100%)
>>  rename hw/{timer =3D> rtc}/m48t59-isa.c (98%)
>>  rename hw/{timer =3D> rtc}/m48t59.c (99%)
>>  create mode 100644 include/hw/rtc/m48t59.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 481f2318cb..679b026fe0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1064,9 +1064,9 @@ F: hw/pci-host/prep.[hc]
>>  F: hw/isa/i82378.c
>>  F: hw/isa/pc87312.c
>>  F: hw/dma/i82374.c
>> -F: hw/timer/m48t59-isa.c
>> +F: hw/rtc/m48t59-isa.c
>>  F: include/hw/isa/pc87312.h
>> -F: include/hw/timer/m48t59.h
>> +F: include/hw/rtc/m48t59.h
[...]

Not sure how I ended not removing include/hw/timer/m48t59.h, since I
used 'git mv' in all the series. I might have missed a conflict when
switching between branches...
Ah I now remember, I had to rebase after Markus big header cleanup, this
is probably when I messed with this one :)
