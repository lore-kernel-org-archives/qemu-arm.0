Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2219606lfe;
        Sat, 21 Mar 2020 07:54:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvOXVOpg/VIDtVl2wsFpNo+ek/T9g2BSobKBFeUNsGg+57V9CGbGJvWcDdQ1m5JiZq1kYaG
X-Received: by 2002:aed:234a:: with SMTP id i10mr13618540qtc.155.1584802474252;
        Sat, 21 Mar 2020 07:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584802474; cv=none;
        d=google.com; s=arc-20160816;
        b=hpdXTVFDw3bDrIOFTq23Gli7T6IJAT7xBBbcTDi4KgcuQpUdyr+ldh24EMFUynZbKl
         ZWA/bZUQQEWoeEQtrgYlGuSiUsOh+M3To/qb8i2MyjLt4w/3AiD8Ip2KVuPG4+GSb6pJ
         h7t5ljYyAdhwV303a0Z+K3LWGkT5h1TDGiYRCMZk6ula0jGvBpJzZf226gZUH4XYqHJM
         uN4oy/KHlifpWEm06BsF0ahKXOra4UMx+4T5nTowv3Jbo2IyyvOPbTAevcXl2tOFDzgE
         q3gVM1HJrK7iL/A7UBes3vLHEy/GI1k3MNNwuZ6fvB9UrLiDEratMi2+7G11/iRIq+m/
         3mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xP1X/vYsg9JeRGG0cK/lMXeLtyzTis334aQojn7RlgE=;
        b=0lmJ72jhIy+9OwZg8DFZmAVlwRNKv195cUMwEBj2guxJ9qwHvDTNdFoBRIGvedvzfe
         ewiQFXEPM75s2YBsLOwI2ocPQtuRndoDlTQ7tcf0ZzJE0op2VBi2Uqpj7ceTeAmr2vWz
         wZgKUeOsTfkZcCc4gVDKKtPva59Hoary/YIVlGyQPUzH6RzC74h5HBFxSxgq2yu0iTVE
         KowpQsRhgSXFYRB3hAS9QPQzrvWZKu5hUi0lJUr6Uxr30hHQsVEqd4qm87QrxxmlN3gR
         ko5gTf0cLeMNFRibdOPqaJjrKgwMnHJBSsRzMd54pFlq8e8UKn3Byopt+qB/9aU9kl8F
         OW2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CIwhjoaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m35si5710966qtm.329.2020.03.21.07.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CIwhjoaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfWD-00071c-MS
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfLn-0000NE-Gb
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfLm-0000Pq-Ae
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:43:47 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:48255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfLm-0000PV-7Z
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xP1X/vYsg9JeRGG0cK/lMXeLtyzTis334aQojn7RlgE=;
 b=CIwhjoajFP2vRsam09vR87FQ2c3CbbkOUQmq/ROl2YqcasYczT1J+bjUpLTjXCwUP78vzy
 xMrDl0/WX7Dx0addBrWWhNaML3kYl5sMkwkWlk/uSt/c8C00KQW6WQyV3mXfzcN+0LZdnM
 Obkz87qw0/Y50Zjfs4UDVuKodUEqASw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-h4V2iQsUMe2cuk8NZA1fKg-1; Sat, 21 Mar 2020 10:43:40 -0400
X-MC-Unique: h4V2iQsUMe2cuk8NZA1fKg-1
Received: by mail-ed1-f70.google.com with SMTP id w23so7553144edu.18
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F/OLVnoElxwEF3rlTbyB1ANgms+SlUxPt5Z/ioqo0ws=;
 b=Lh9Iztj1Yc+Gsfmx+WHFoar0FHj/Rn/DisxB3NvOD/78RL7VAewsZeJ9RDt+VGaa5b
 Mm4sj7DsXE0zHmpQWd7Hmya8/npp+znzslx+1F3OHenIQ4O/FWPLfR3O1spuo+eKKmr/
 t39ObCfcEbe4jzoe3jkTJKtxGQeQ1vUgBMAzLbAuRMJT4ohloE62qiPJOzpdQbrji5Q5
 +6emx0ZFp86zPxdY8ujC6WftiTL/GFu8W6mEZTisZ/NJ8jD9+63phZdNnnX5aDrGsXpq
 GtIHu6ZXMSugf9jgBgzdctqzliJ2hvNDAIqUyzPh7PF4UHZLwzS5PqQrYDUE7PmH0EHq
 Nigw==
X-Gm-Message-State: ANhLgQ3o05bIb+NAIx87teu90Rk8WOmLx2UvkT/JkgqiFR3JgGuKIMVt
 L2M3N16GfD6OHTXF2eBurBDaOCvAwh0orwjhWXIsx5+fmKRcrV/Q8RNnF+7BxAKtxJ9fmx8OaYp
 VjLb0vO5oRSr6
X-Received: by 2002:a17:906:9451:: with SMTP id
 z17mr12858632ejx.176.1584801818842; 
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
X-Received: by 2002:a17:906:9451:: with SMTP id
 z17mr12858601ejx.176.1584801818627; 
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id t13sm613293edw.49.2020.03.21.07.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
To: qemu-devel@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f16abe6b-f0d5-60f1-71e4-f4c40e08aa33@redhat.com>
Date: Sat, 21 Mar 2020 15:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aqwLay2C2VBV

On 3/21/20 3:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix trivial warnings reported by the Clang static code analyzer.

I forgot to add the official Clang static code analyzer documentation is=20
on https://clang-analyzer.llvm.org/ and on Fedora I simply used it as:

$ sudo dnf install clang-analyzer
$ ../configure
$ scan-build make

>=20
> Since v1:
> - Addressed Markus/Zoltan/Aleksandar review comments
>=20
> Philippe Mathieu-Daud=C3=A9 (11):
>    block: Avoid dead assignment
>    blockdev: Remove dead assignment
>    hw/i2c/pm_smbus: Remove dead assignment
>    hw/input/adb-kbd: Remove dead assignment
>    hw/ide/sii3112: Remove dead assignment
>    hw/isa/i82378: Remove dead assignment
>    hw/gpio/aspeed_gpio: Remove dead assignment
>    hw/timer/exynos4210_mct: Remove dead assignments
>    hw/timer/stm32f2xx_timer: Remove dead assignment
>    hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
>    hw/scsi/esp-pci: Remove dead assignment
>=20
>   block.c                    | 2 +-
>   blockdev.c                 | 2 +-
>   hw/gpio/aspeed_gpio.c      | 2 +-
>   hw/i2c/pm_smbus.c          | 1 -
>   hw/ide/sii3112.c           | 5 +++--
>   hw/input/adb-kbd.c         | 6 +-----
>   hw/isa/i82378.c            | 8 ++++----
>   hw/scsi/esp-pci.c          | 1 -
>   hw/timer/exynos4210_mct.c  | 3 ---
>   hw/timer/pxa2xx_timer.c    | 1 +
>   hw/timer/stm32f2xx_timer.c | 1 -
>   11 files changed, 12 insertions(+), 20 deletions(-)
>=20

