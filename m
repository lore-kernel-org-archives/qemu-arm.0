Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1527926lfp;
        Thu, 6 Feb 2020 06:43:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKY31/qThmZslGEhMJgYFg75EsCCU1m460kaGy3ER2Fv5xSF3MJUN2ybyXLGX+OzhMehe5
X-Received: by 2002:a25:d204:: with SMTP id j4mr3248416ybg.140.1581000191827;
        Thu, 06 Feb 2020 06:43:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581000191; cv=none;
        d=google.com; s=arc-20160816;
        b=ezhS+LJc0ZuPG1cU/oXZlo+kYf8euMvNzaUF8lAikRyXUTQGG0Q81s358qycH17yT8
         dtyaiOhqu7okd/yuzVlzS4h4YGH6VMoWUCDyMicxwKmY6EHYc0xc3RJwoG3E04w5gEuW
         yjx323gH1XkCTXSU82DApTkgaHy+X/SkqrlfYTkLy8PiE1OnURRomVXvA0FXb7p7r2ov
         DKppBo6dNFusin/uyOz8h10NCRBfPixY07V3a5edItE1PymdwvEk08aHCcvwkFnXZ2Ez
         evEklH3f5kVpbFCR1d/S8NvOtVzICr8xCJ5ixyGmeejlY+aFVw2+D6H/hv8j5VO3Gsjt
         0j1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sNSoM/jbKaYz7kq4M705HNnusVQQuDoTRX40NEeqqrs=;
        b=RXielHcSPZY4DfLf/WBopcLJGeb6Ge1IjftLSwI4Pv413gnx7kqt4VCYfVcUF5U2gv
         X5jRtVZqaTO3I966MgOoU/O0fqHUc3QkU2Kh4twJb2uq1MeluAnjcZ+QzqTISNxDxB9y
         HHPfaSsH+ydfCD7amMdZRPK6sjtfkWmIj2qXUmAgHxp2FFfhYriRii/OLcuCWM39GBZf
         SsuuAM4hauwyvQUBMFc5uA7UPsjU4VsJcYMWouwvJO3WsgC5sCO8An5maeROqZLrcefH
         En3sij/qcsOcnd4W1vY5y+efS6f0hKT2usWlVs+Yh7JCZYuU7Lg3x96X/409GrjLE8CC
         KKMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WizQ4AY0;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id y201si2244675ybe.152.2020.02.06.06.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:43:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WizQ4AY0;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581000191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNSoM/jbKaYz7kq4M705HNnusVQQuDoTRX40NEeqqrs=;
	b=WizQ4AY06hNSmY3kdNlxtoWpCLx+W3v/vqffKo5SdQugAVVrIQPV1bGP2tuqlpBxPzUHb8
	dT3VyTIhqsMP+03bZbKS3xOQUwI5nVlBjW+7nDgvQk3Eo8bK8Uvl6y6PhdGu+FSjRO3aX2
	a56yT/YYU0LHdHXZ5JOHU3tcn+Jk+Lc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Q6PD8CJcM36hxw1My7breQ-1; Thu, 06 Feb 2020 09:42:53 -0500
Received: by mail-wr1-f71.google.com with SMTP id z15so3520790wrw.0
        for <alex.bennee@linaro.org>; Thu, 06 Feb 2020 06:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BqVdkPSfFrlSiqisiJMa5lZAuzM02Lkgy3y9qPtfwWk=;
        b=m7i/4uJEv/qvMp6QFudp7HPOoRxT49WHxlgpxQV1jt36i+BfnltW9CIJVFxajwDkuH
         IuxAiF4duxve9oe54uB605Fg0wjAseMwzjINhjlj8JxY+Cq2I0h9rqIejcqg3G/66gjG
         MZlkRqtGqK9Ab17adq4sGAfGnTEW/pZzhSkjJdtRV40fchZ6BUMBo2eB+6sOIsVZXmgC
         wlsW/MhbsleOjprsmR1Pmvgr4U6Nb0Ccpqa4+RO+SFStDaAtBo8hg7IukDIKAkqgZ5vh
         7r52GcYetT10LoAcGKB7UUX2blb1Z7IfwHWA0o3YAd8pBn8sq5/WN6EM+icpDB0F8dQL
         WYlw==
X-Gm-Message-State: APjAAAX0tcreosl51ZdXKMbyWWGVlJUMpzWPT0Osf7AKnt4s3P7dF6qa
	9oZwzpyQuvmphb5xsyeikho0DYfFwuzF+rmadvOGPynnxa5Eto96fBJdUkfXcP0csPzcEHaP8sV
	mOFHHKx9n8Y+Y3KQr
X-Received: by 2002:a05:600c:2150:: with SMTP id v16mr4870655wml.156.1581000172220;
        Thu, 06 Feb 2020 06:42:52 -0800 (PST)
X-Received: by 2002:a05:600c:2150:: with SMTP id v16mr4870643wml.156.1581000172014;
        Thu, 06 Feb 2020 06:42:52 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id a62sm3945162wmh.33.2020.02.06.06.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:42:51 -0800 (PST)
Subject: Re: Is STM32f429 discovery board fully supported on qemu?
To: Liviu Ionescu <ilg@livius.net>, Mohannad Maklad <msala.work@gmail.com>
Cc: qemu-discuss@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>
References: <CADxp150RUQXjDFjrQcrJCfoWto=ERaGVd=neo9s_2=3XsyS9XA@mail.gmail.com>
 <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
Date: Thu, 6 Feb 2020 15:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
Content-Language: en-US
X-MC-Unique: Q6PD8CJcM36hxw1My7breQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: R581/Pv66rpZ

Hi Liviu,

On 2/6/20 3:34 PM, Liviu Ionescu wrote:
>> On 6 Feb 2020, at 11:23, Mohannad Maklad <msala.work@gmail.com> wrote:
>>
>> I'm trying to emulate STM32F429I discovery board using qemu & eclipse ID=
E.
>>
>> I got the blinky example running with the led turning on and off on the =
graphics screen but I have tried an example to run the on-board screen and =
it doesn't seem to be running, Is it supported?
>>
>> Also, many drivers fail when simulated with qemu (sdram, rcc, ...) How c=
an I know exactly what peripherals that are fully supported?
>>
>=20
> If you are using the xPack QEMU (formerly GNU MCU Eclipse QEMU), the docu=
mentation page is:
>=20
> https://xpack.github.io/qemu-arm/

https://xpack.github.io/qemu-arm/#why-xpack-qemu-arm

   "Even more, support for semihosting in the public
   QEMU version was broken, and the verbosity required
   for integration with the QEMU plug-in was missing,
   so it could not be used with the GNU MCU Eclipse
   plug-ins."

Too bad these improvements aren't shared with the whole community.

Note there have been a lot of changes/improvements related to ARM=20
semihosting recently in the mainstream QEMU.

https://xpack.github.io/qemu-arm/#supported-boards-and-mcus

   The boards currently supported by the xPack QEMU Arm are:

     Maple =E2=80=93 LeafLab Arduino-style STM32 microcontroller board
     NUCLEO-F103RB =E2=80=93 ST Nucleo Development Board for STM32 F1 serie=
s
     NetduinoGo =E2=80=93 Netduino GoBus Development Board with STM32F4
     NetduinoPlus2 =E2=80=93 Netduino Development Board with STM32F4
     STM32-E407 =E2=80=93 Olimex Development Board for STM32F407ZGT6
     STM32-H103 =E2=80=93 Olimex Header Board for STM32F103RBT6
     STM32-P103 =E2=80=93 Olimex Prototype Board for STM32F103RBT6
     STM32-P107 =E2=80=93 Olimex Prototype Board for STM32F107VCT6
     STM32F4-Discovery =E2=80=93 ST Discovery kit for STM32F407/417 lines
     STM32F429I-Discovery =E2=80=93 ST Discovery kit for STM32F429/439 line=
s

Quite a nice list, it shouldn't require a lot of effort to contribute=20
these boards to the community IMHO.

Regards,

Phil.
