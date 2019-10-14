Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4670820wrm;
        Mon, 14 Oct 2019 09:55:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyES6vAwFDNTRXCorUauybO0ttqcZxICAcOLDnVv/NywfCgLDpPg/gGTZxQkmtphDLSLgz3
X-Received: by 2002:ac8:6683:: with SMTP id d3mr32512732qtp.85.1571072126323;
        Mon, 14 Oct 2019 09:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571072126; cv=none;
        d=google.com; s=arc-20160816;
        b=jVjZ5RF7HtlmHx3OxDF/2hnbxmO31LUsy0DxW+qFXFsw2RE96P4bgaWG9dt3qUHQUO
         lckgpKm6cr0GOKpM9F8GKocTt3TJZWm42pNytPcqAquwHafqoz2pdY0RPwH5Hwhd3VZO
         /xO+C91F2XvEAkQeUGOK6Wnaa3z4SxyikQXdn8v75vGHx9azDQ+adXZr2xSLuKaqqNcO
         PecumU+IQL7aHYjw8PfVLIJ7Hp3Yk8Vm3w5IW/lcXFYO/wQbLv6lTmbRtWvekkzvlF8A
         2Bwkn86u6lOwmlJsdc1s9RuNzhN3wgeBlTvkcssbvOHI55OzmatpYOOBNM3iBodcU6Zu
         ybWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=DcXgWkyOh1fgXICM01ruV2uk9CbdGMUHaoXAtuHaEPk=;
        b=ADGPsdhwscZqjNz1VMCt+EEWpJqM6CMSyo9O3rZHnbG2PPiZCGc8gHF/uDtuCxuDk/
         29vioTki7ymRv7FCPLs5V4Rnb/5vE0ZiGGPHf8DQvoTAzLy7vwWxnV7nzpchYi/ttBSi
         oEaRxXigUQMFRzZeO1n+ROQVKXV/seZJmejDzGSCTBaV5z+vuzl16OyzxAoPkjD3KucC
         UCUDrjCdH9lyZjvIgYR+GOD96klS4yIzenz6JJB9AEuOLtz3/DWhQC3aam/pC1IZH+kc
         VjnMlbS/ypfalX7oHiqZRAIGC5LGYi06CnH7zBqAVjGD3KjZJQ1sSaJHH6siu+Na7Ebm
         inyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si18079304qtb.213.2019.10.14.09.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 09:55:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK3cz-0000jA-E1
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 12:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK2sP-000818-8f
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK2sN-0000hX-Tx
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:07:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iK2sN-0000gj-Ky
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:07:15 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D7815945E
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 16:07:14 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id i14so8687731wro.19
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PHFpWThQhnJj62Bl/tihULoYzZMcq0hbNQYAPPTHm9w=;
 b=cEuAQiSu3oVz/NNMaK6URpZLULuZjokkQ6U9ckJPUE/ENKni8XPzOaqiiCEJ+ZRQs6
 bkHUMZCbNzAi9tO5S6BcnKuJ8qCtgX2rSvWBm+imSa8Jtb79KAJNYB77kU9rHZ9dzsF8
 EM4W/OgkW9i2foXLbuToYiUzfLWqpoVyHe8uIfGABI54J74KPHhQRxj92iVnQxMzXg9k
 ax7kdNm+cM0ykWxFKVzwBUwC5sIjTs+Cdac3PC7SlOalYIor3mZkJYwuIwsyUEOI1kHK
 4MV2879x9nUlEniitWiUqhOwBx3CdksVI4hGYrhEYLFZvHLb1XV51NaM0yLlCrt/hsBx
 Pdug==
X-Gm-Message-State: APjAAAU1sCxiSbovhXSKidbIN2bnLod2lzJUd+1bXZcoX1geId36ZMbG
 5EhGmbGED3nDen2UOjWDuCvdplrYqcG3s5auYXYR7izfZNhpmS6Yk7M6dgyHOegFZBJY50AfbI0
 +fcccHjSOgrE/rqE=
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr8929606wrn.334.1571069233392; 
 Mon, 14 Oct 2019 09:07:13 -0700 (PDT)
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr8929574wrn.334.1571069233185; 
 Mon, 14 Oct 2019 09:07:13 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id g3sm22545742wro.14.2019.10.14.09.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:07:12 -0700 (PDT)
Subject: Re: [PATCH 00/19] hw/arm/raspi: Improve Raspberry Pi 2/3 reliability
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <CAFEAcA-2ovf5Y4uaCteRB7Ytt2bcOS1BgfQNRr8G6z5_VobKZw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bf9829b5-395b-eec3-7824-408d35febc44@redhat.com>
Date: Mon, 14 Oct 2019 18:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-2ovf5Y4uaCteRB7Ytt2bcOS1BgfQNRr8G6z5_VobKZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+7AnkM7BS0W

On 10/14/19 5:45 PM, Peter Maydell wrote:
> On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>>
>> Hi,
>>
>> I previously posted a RFC for the Raspberry Pi 4:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg642241.html
>> and got it almost working (boots Linux kernel to userland, sadly
>> I'm still having timeout issues with the eMMC block).
>> However since it is quite usable, I started to clean up to post
>> the series and realized it is way too big for Peter Maydell, so
>> I'm following his rule of thumb by splitting in 3 sets of ~20
>> functional patches.
>=20
>> Philippe Mathieu-Daud=C3=A9 (19):
>>    hw/arm/raspi: Use the IEC binary prefix definitions
>>    hw/arm/bcm2835_peripherals: Improve logging
>>    hw/arm/bcm2835_peripherals: Name various address spaces
>>    hw/arm/bcm2835: Rename some definitions
>>    hw/arm/bcm2835: Add various unimplemented peripherals
>>    hw/char/bcm2835_aux: Add trace events
>>    hw/misc/bcm2835_mbox: Add trace events
>>    hw/misc/bcm2835_thermal: Add a dummy BCM2835 thermal sensor
>>    hw/arm/bcm2835_peripherals: Use the thermal sensor block
>>    hw/timer/bcm2835: Add the BCM2835 SYS_timer
>>    hw/arm/bcm2835_peripherals: Use the SYS_timer
>>    hw/arm/bcm2835_peripherals: Add Clock/Power/Reset Manager blocks
>>    hw/arm/raspi: Define various blocks base addresses
>>    python/qemu/machine: Allow to use other serial consoles than defaul=
t
>>    tests/boot_linux_console: Extract the gunzip() helper
>>    tests/boot_linux_console: Add a test for the Raspberry Pi 2
>>    tests/boot_linux_console: Test the raspi2 UART1 (16550 based)
>>    tests/boot_linux_console: Boot Linux and run few commands on raspi3
>>    tests/boot_linux_console: Test SDHCI and termal sensor on raspi3
>=20
>  From this patchset, I'm going to apply patches 1-5 and 7
> to target-arm.next, since they're good cleanups that have
> been reviewed. I've given a few review comments on
> some of the others but mostly it seems to have been reviewed
> by others already (so thanks to those reviewers).

OK, thanks!
