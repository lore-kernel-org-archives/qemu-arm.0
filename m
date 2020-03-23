Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1542249lfi;
        Mon, 23 Mar 2020 07:46:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuRQuntG9yioubLuuf+g3kg6el+atSZ3MjbHJEibJZ65YTjD70S7r9drb8JlkPDx4Ajbq+2
X-Received: by 2002:a37:9f42:: with SMTP id i63mr21527498qke.192.1584974799663;
        Mon, 23 Mar 2020 07:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584974799; cv=none;
        d=google.com; s=arc-20160816;
        b=TjY0c21+L8Hg59XLR8ZHtRo8Z1l9st0Pq2sbSDydvdykbqM5AVxne/sYJxEEvO6fIY
         xzs+3Fj5gNd6+IbmRLS1R2LalodbHaU/J87fP9PC9us7DSPyB32XwUzP32g4Gn7uY8Y8
         l035GOBXBVBFbX0Vmt901Dh1kThcIwTXaPybyXhfH7PHQ1xxKkAH2GjuyaO3yHJZ15pb
         zFf/wO6VefYQLAadLlewDB9pv/SKFzI+qi/Mbdlob1ichwgiyF5NENqCObczrTxoOBpn
         HR/kMDA0dh9Oc5/PHdTaCXTntSH6SEnxM/vFyJ/QE6YMMK2bYhJzzPXrh4EoulVVTkCL
         7Dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8rbiNVhEwOTNTE5kCQAB4GuD6vGvYD7Ldckz1YJB6Cc=;
        b=j1XFrYqHzkSibeD1KF11y/4KXFzFYUZrmiIpApxLe9uBXltJtoqcAaAel/yNcg4cOL
         v7VmRQx/3GSPfMN4y4RUnGgAojqpinQzfhbFSfVZPbKg1FbqOQ/QNqKKaVJ3RjdY2SFe
         Gqk+mzsWIjfTmbTcycmWtwBbWPMcn7Bwl8uHOwDu/5P4VG2ItfSO6BidWZn7Uwap0eDv
         3RBwTBiS5kcQbHsMKwnzYaf6GhA0ht4NNYySFFGX3Et6EafuZW8AyacygCnmBW/GTckE
         UvYPXtcVXkg9M/0KyOWlKUxroWfLWW61F9LH9tIptvRcTIY0qECkWA+HTfilscldUnbK
         AHeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iwMJ/70G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si8930099qke.2.2020.03.23.07.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 07:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iwMJ/70G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGOLe-0006II-Ow
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 10:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGOLB-0005xt-HS
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGOLA-0001D2-70
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:46:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:54873)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGOLA-0001C5-3F
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584974765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rbiNVhEwOTNTE5kCQAB4GuD6vGvYD7Ldckz1YJB6Cc=;
 b=iwMJ/70GsJgLl2JdZTglbZq/PgxmPOtv0QvVkeO+lCQGOs2GZqZ7Ow9ZRvI3DwlfPg1pvy
 wjcsiuoycmu7U9k8jHQeJ4iPIx6lIzjmkSkHAjuSGgXE7PMJyxTzcgcyF11mP2gkHILrLM
 YOblKC5XboUe5KuIY8Xo50gmK8Hq6F8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-6O-Dsoj3MdOC__W_7rqXVQ-1; Mon, 23 Mar 2020 10:45:58 -0400
X-MC-Unique: 6O-Dsoj3MdOC__W_7rqXVQ-1
Received: by mail-wm1-f71.google.com with SMTP id y1so2112089wmj.3
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2020 07:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V2ANNl8/EtbHEsvrQEItRdzFbI+QSLZWoQl4H0q+yj8=;
 b=jZkD/vuHR9NpEAxT30Xb4NzSPytLehLaj7ED7q74MKjEFdkq9FSN89NzOI9rYvyLXI
 bYZfsJRXbFJmq8NGQnnj9I6yDK1c9tYdD+0rbz9PeH0YA3bdEpO/Nag45CJxQQSnPzrs
 SWvSu8EuTG2bP+r+fzI+EyJYMhqCDFU6Mp9Y9hI8/kdSxNN18Viwgmv/Qit0t8feazB4
 N5BtBEBtce367YHKia63idnCJ8y6i5tTJL+21IEp9qmCCKO9CzVyMx0gVYyB+DZ6Rb1A
 CqeH3oZOIBu0uyyZ6ig4ELQimgfHbDl+t8f2Idyc4hyIuWh09KLw9H87Yym3vWLGJFR7
 XYfw==
X-Gm-Message-State: ANhLgQ3pEk68xEGpfiws4wFGmZsBaytE1WxZM0wHGJZTEVRxcHHoTXPm
 o5oxMvd39lpRsOIlaZyYeTj/YeAjXex3coPiaixFi6CsmizaeORwa0bpSfBw4kvF8Ek0R7nhwLC
 /nvP+G0RZWN7I
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3837600wmf.46.1584974757509; 
 Mon, 23 Mar 2020 07:45:57 -0700 (PDT)
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3837522wmf.46.1584974756932; 
 Mon, 23 Mar 2020 07:45:56 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm22270879wmk.2.2020.03.23.07.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 07:45:56 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
 <1c711740-6166-c730-ef67-d07511add1e6@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <262f8318-1590-1c48-f4de-a6482fdc3071@redhat.com>
Date: Mon, 23 Mar 2020 15:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1c711740-6166-c730-ef67-d07511add1e6@vivier.eu>
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
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eX7ltHcfAEOU

On 3/23/20 3:32 PM, Laurent Vivier wrote:
> Le 21/03/2020 =C3=A0 15:40, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> Fix trivial warnings reported by the Clang static code analyzer.
>>
>> Since v1:
>> - Addressed Markus/Zoltan/Aleksandar review comments
>>
>> Philippe Mathieu-Daud=C3=A9 (11):
>>    block: Avoid dead assignment
>>    blockdev: Remove dead assignment
>>    hw/i2c/pm_smbus: Remove dead assignment
>>    hw/input/adb-kbd: Remove dead assignment
>>    hw/ide/sii3112: Remove dead assignment
>>    hw/isa/i82378: Remove dead assignment
>>    hw/gpio/aspeed_gpio: Remove dead assignment
>>    hw/timer/exynos4210_mct: Remove dead assignments
>>    hw/timer/stm32f2xx_timer: Remove dead assignment
>>    hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warnin=
g
>>    hw/scsi/esp-pci: Remove dead assignment
>>
>>   block.c                    | 2 +-
>>   blockdev.c                 | 2 +-
>>   hw/gpio/aspeed_gpio.c      | 2 +-
>>   hw/i2c/pm_smbus.c          | 1 -
>>   hw/ide/sii3112.c           | 5 +++--
>>   hw/input/adb-kbd.c         | 6 +-----
>>   hw/isa/i82378.c            | 8 ++++----
>>   hw/scsi/esp-pci.c          | 1 -
>>   hw/timer/exynos4210_mct.c  | 3 ---
>>   hw/timer/pxa2xx_timer.c    | 1 +
>>   hw/timer/stm32f2xx_timer.c | 1 -
>>   11 files changed, 12 insertions(+), 20 deletions(-)
>>
>=20
> I think your series covers cases already covered by:
>=20
> [PATCH v3 00/12] redundant code: Fix warnings reported by Clang static
> code analyzer
> https://patchew.org/QEMU/20200302130715.29440-1-kuhn.ch

Unfortunately [for me...] I don't have v3 in my INBOX... *sigh*
This was 3 weeks ago. *sigh*.

I can see the series in the archives:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00219.html
But I can't find the outcome, was it queued in the trivial tree?
Any idea when this will be merged in the master tree?

What a waste of time...

>=20
> Thanks,
> Laurent
>=20

