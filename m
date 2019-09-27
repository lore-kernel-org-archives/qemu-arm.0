Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3676643wrp;
        Fri, 27 Sep 2019 08:57:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk7WohCutChZUhGAWe1bZ0VWeL5s5VLV2e+yyyrzJaghDQY21mPeUnjzXP+8QYs+RZ30Si
X-Received: by 2002:a05:6214:11b4:: with SMTP id u20mr6006262qvv.200.1569599853359;
        Fri, 27 Sep 2019 08:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569599853; cv=none;
        d=google.com; s=arc-20160816;
        b=bfFgNB8a7IgMUlq+qL4vSE+4szIPpOtIfI5/lEd8DqiRdD7V5rq9idJemvrl1YvG6j
         WxVg2vvdIYJVkMRDgPKOJWgwwEODqhw1+s1D8dJm7fu9xnuRN0nuI+LBPg/KQvZ+EQJu
         vyKXOnr4KjrPpc6yFYlxQLIXvw8c0PmeH/rW0rOIex6LNzRkQYYm12FHiz/3L8pKncuZ
         wZMjM/Qd/MBsV/B7Zgb5tIJkWP+2NOuYrKI2dIx+nC5mkXtuLDG4FEbuggZOVgBS8eQe
         ImCUA28WJstMAMnAIwLVd27ih8uPWYYp+HfcysttJ/EtzYa3onSMbV+XSH0mGu/yx5/W
         Srow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=6lmvlz4z4GZXSocpK3fheN2PfJ6S9oSAQp23QeP2Vgk=;
        b=VHmvau+RFLNOSLOJhLlMv7E2D982tRRWOKXnZ6tlcPCcy9rKd441jGzeYW5H6AOTBw
         AKUMU0zNql8TlyOb86noOYVdjt0j3RAKIRXKNs11dVum+6rX7JM0FwiSb/jH9dsCmz/c
         mfZaYyjr7ti6qCKFXmyzxqjrC4niUVDEF2YaqfsiRWv1uYHdypqg1LVHHTVwrAULIpiR
         oX3+H1qzD8gB0iAc1wfbTO/p1X6qy+ZWUnM+YEw6S3CzIws+BDurLiX1mkr+8SFs/3mh
         yH4BxnUatshMknnjmBkI8kYyRzOcKX5QaNrULzsxHZaE22CBlxB7dl3I1v/tSlDI2V95
         dwiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m33si4895187qvg.109.2019.09.27.08.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 08:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDsce-0001C7-2t
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDrTt-0003cV-Fa
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 10:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDrTp-0008Jm-RF
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 10:44:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDrTp-0008JP-H8
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 10:44:21 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C10687CB95
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 14:44:19 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id z8so1130130wrs.14
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2q+9SXfolCGkpiu01Kpc50RZfUmkJV77qGm65Z4aLrw=;
 b=cY1UZawseqU6byGklPaOQCck3Cu9q8pAxxqCu493z5+GGCjf3GZh4m5GMaW48chePe
 QYGTCCe4fiLhW+33bcdHgm8pO4zhpZhw5NWhj7yD0W8alv4ANqPda86to7EbOovsKRwD
 T1LGu6zcWUf7jNh2OzdDMO3lLbPjAq9c6EEvP5ZKqgzL3Rk9ltWHrtHbfGvB1Hml/+nH
 j9gyhXDvMJQQrrO10XT7U6PVEzNUcJ1C+pmqSqA49A/Z9MjLNVp31DZ9D0KANUoKmjmB
 9PysE6pUvQv/mHyMfO2GvBkyK0X1g7ncyPdTcEiK89fYHTiAEcIcfH2IpCgR/ZnP9V9f
 4rfw==
X-Gm-Message-State: APjAAAXAxDCdATO/6a6buqhc6qOerX6InB/eloxq5tF5azJRHXrPGvF8
 fwYaHusyUXEG3OvXGkJV9lrCsAuQjPMGOrZsp0FAM0Wb+MRyHgSV4ofHLvDh8X+F52PxHjPmeGe
 E41n/jEmk1CA/
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr8031928wme.92.1569595458458; 
 Fri, 27 Sep 2019 07:44:18 -0700 (PDT)
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr8031894wme.92.1569595458242; 
 Fri, 27 Sep 2019 07:44:18 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b184sm6552821wmg.47.2019.09.27.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2019 07:44:17 -0700 (PDT)
Subject: Re: [PATCH 14/19] python/qemu/machine: Allow to use other serial
 consoles than default
To: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Cleber Rosa <crosa@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-15-f4bug@amsat.org>
 <CADYoBw11iiK=+O-mGYS5Xp85zVhezOXXXr-wKV_xCg07ZYuzVw@mail.gmail.com>
 <20190927132602.GA19931@roeck-us.net>
 <CAFEAcA8KcJzCNU1iLjiteEKhLsw9jeDyyqXurv0fuvSmLAEF0A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <00b49d9e-0860-161f-a4d4-41fbe7bb2124@redhat.com>
Date: Fri, 27 Sep 2019 16:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8KcJzCNU1iLjiteEKhLsw9jeDyyqXurv0fuvSmLAEF0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: bzt <bztemail@gmail.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Cxugwj+/22D

On 9/27/19 3:36 PM, Peter Maydell wrote:
> On Fri, 27 Sep 2019 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Sep 27, 2019 at 02:54:10PM +0200, bzt wrote:
>>> Hi,
>>>
>>> On 9/26/19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>>>> Currently we are limited to use the first serial console available.
>>>
>>> I'm not so sure. Right now it works like this:
>>>
>>> qemu -serial stdio
>>> Connects the VM's UART0 (PL011) serial console to the host terminal
>>>
>>> qemu -serial null -serial stdio
>>> Connects the VM's UART1 (AUX) serial console to the host terminal
>>>
>>> I think this is simple and good, please don't remove this option. If
>>> your commit does not influence these cli args, I'm not against it.
>>>
>> Agreed. I am using that mechanism (raspi3 uses the second console,
>> not pl011) in my scripts. Please don't take it away.
>=20
> This patch is changing our python infrastructure that invokes
> QEMU, not QEMU itself. What Philippe's message means is
> "currently our code for running QEMU as part of tests like
> this is limited to using the first serial console; this doesn't
> work for raspi because we want to use the second (aux) console;
> so make the test infrastructure able to handle machines like this."

Exactly, thanks Peter for clarifying.

I'll try to come with a clearer commit description.

Regards,

Phil.
