Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3695830wre;
        Tue, 29 May 2018 08:27:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKXI2xcfdJfAN/WdOsN8AtBrya2A5H/5B72Guw6O1tytr1douSQDSsUeWlZnJHCvaxx+xyG
X-Received: by 2002:ac8:30b1:: with SMTP id v46-v6mr7765802qta.353.1527607643225;
        Tue, 29 May 2018 08:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527607643; cv=none;
        d=google.com; s=arc-20160816;
        b=Tu6q9EJfi6HAR+AYBgJv6iHXhJfVtZ1kTKtu+WlG9xLL/4l8FE2UtSpZ1QsuIw5OmQ
         S/FUzACQHT+5ZWWwAj/6CCeuFOJVPwSTZTwRpvWY/UquqAerX/ISHNJS95LvCRSy/Lek
         Lsi8a2b/I7rWgQtrElOgw/Fi+4GGcQs7KkdH4zOzuEOjgseL2TWoD3XJpptfBJbp7zuq
         a63TqWbLBUDliWBEqkLsk9h3eyT0nboNLik2QWfOmG62zm2utQFnDjgGxaW475FRv497
         3m+T0uAieKqE+AvXm/IS8LkqCHc0IPzeKwiQ5W5Q0LT2zQQEUPOZyXu6F0YFJYcCJVeU
         Q73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=n9M1rDbRqSYTQC2kzgBNiXNAZqxoQv2iIwtxXb4vfYg=;
        b=sLwo440L/SGWHzjio6F4sXieK+4FW1Fd73wAs2gJwG5T+r5iuIIaa0C4+l41W5Gpx6
         g+qkwi7YPx2KTfJYyQNUdBe19TbivOs6qf5ILdJsb6kL1nID/YdTohcJvW5yfAbhzh49
         2NAwg14h1GpicTNpc+GZkSJA6LfzaX7c7xUJ/kCKfURoPuZsCsexvpqnjSYNetcwzHEO
         9FxxXLjYrBM2ydBBDTT4nLZLOANuC42011tHajFuT0/2o8rFgArr86rHyXamNfuSju8B
         q5S6La48MEYDbdSCxLTl2kmAPld98zl2A7RSukJ29Iic5NzDbsSDBP47XuUFvMW5NXy9
         e3jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7-v6si5540036qkd.186.2018.05.29.08.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 08:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNgWw-0003cD-Np
	for alex.bennee@linaro.org; Tue, 29 May 2018 11:27:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fNgWl-0003aU-QS
	for qemu-arm@nongnu.org; Tue, 29 May 2018 11:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fNgWi-0001uv-HX
	for qemu-arm@nongnu.org; Tue, 29 May 2018 11:27:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35148 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fNgWi-0001uj-EA; Tue, 29 May 2018 11:27:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03E11406E89B;
	Tue, 29 May 2018 15:27:08 +0000 (UTC)
Received: from [10.10.125.63] (ovpn-125-63.rdu2.redhat.com [10.10.125.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 462582026DEF;
	Tue, 29 May 2018 15:27:07 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
	<ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
	<e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
	<c1078250-30a0-0d4c-d830-88591fb6ba43@redhat.com>
	<713f16f9-3faa-7644-38c6-0797252d5922@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <63a61375-ef2e-970c-7f43-6cfe1d7666b1@redhat.com>
Date: Tue, 29 May 2018 10:27:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <713f16f9-3faa-7644-38c6-0797252d5922@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 29 May 2018 15:27:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 29 May 2018 15:27:08 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt:
 fix null pointer dereference
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdIxD2AjpFzr

[adding Markus, as the error maintainer]

On 05/29/2018 09:33 AM, Philippe Mathieu-Daud=C3=A9 wrote:

>>>> Ok I see, Clang is unaware than error_setg(&error_fatal) is a noretu=
rn.
>>>
>>> Indeed, and that's because error_setg(&error_fatal) is not in preferr=
ed
>>> form.
>>>
>>>>
>>>> Patch dropped.
>>>
>>> That's a shame.  Rather, we should patch this file (and others) to av=
oid
>>> all the inconsistent uses of error_setg(&error_*), to comply with the
>>> error.h documentation.
>=20
> I started to port/clean this up.
> To avoid future inconsistencies, do you think we should/can enforce thi=
s
> check in checkpatch (which is stricter than human review)?

Sure, automating good code style is worthwhile.

> Is the "Qemu error function tests" section a good place to put this che=
ck?

Probably works.  I'm not familiar enough with checkpatch as a whole to=20
have any different suggestions off the top of my head (basically, any=20
time I've touched that file, it's been grepping for something that is=20
similar to what I want to be tweaking, rather than reading the whole thin=
g).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
