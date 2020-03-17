Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1375074lfe;
        Tue, 17 Mar 2020 03:47:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvsNJJZVUSfHHfHC+SMJTwrG94XqNEN0QdWasrUfszggHFhPgw/03ZCZCdnNTzzS++LaWc+
X-Received: by 2002:a37:4e94:: with SMTP id c142mr3681511qkb.13.1584442054723;
        Tue, 17 Mar 2020 03:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584442054; cv=none;
        d=google.com; s=arc-20160816;
        b=zKRJrurBzev4aDCuHDafxd4V14v5LCmcQqCtK4OkbkcxLt4zUmGL5JAT2rh3S1HV9g
         gUN5t8jWo7w76QNSnx+yM6uYmTbHoFNSr0FPFCI5ihf2/X+TUgToOzkknYIyvbW7afjL
         mQKKMni//GnOs9p4V8z4NC7Haj6rgT30nam3ywB3MMxAr6x1CQzD63uUzvLXw+0UFXYP
         VdgLOhEbZkkrpcvN1KFY4pdtQjI8Aw+SEvZcatO8eFZib3n31uU6vsRzCAwHsW8r0rhP
         o8ECdOJKbPE1tirPFASzx8vcQ1Bt1GhAxrbMd62iXTfJ8W25XqdBjhO72pDufOHn0E5k
         uaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hOFa0QkNgttDsW6uWI5I7ymnkTRXnXuBlAOmrcaUR8g=;
        b=X1kkw2l0RGIqbZOcVRFktv+agh1DeJIoPE25UYbCx7tBE+sx/9d3ZCQ4G40dPmQwcn
         fBw5iRp1Nap+N36+7UOiqgaFlHcmrnC3SyjgJdGWIlPvDSzp5RpK6Avx10VLRHr0pWbL
         c8fFJFyH4CAoLQX641a8NAODdDImQeY+pA8ZodA2dS9Wsqsktz2lcYDMO+dw633M8Cvt
         vbnbiJbEx/vF92I7aY3xWSaNyjmsy8SjstaPbkjPSb8cCU9LPHQ6S9LBJ+p/glLlIekU
         QOZiihsPnAUpLwdqVDxsT40HDgl4Xq7F21imicRXtoHzwSqtEJhz3WUDX7ExajHEh0et
         JycA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ABKB+DrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21si1446971qtt.282.2020.03.17.03.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 03:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ABKB+DrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jE9l0-0003lO-4w
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 06:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jE9kj-0003k6-MZ
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 06:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jE9ki-0000k0-F2
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 06:47:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:34701)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jE9ki-0000gU-A9
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 06:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584442035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOFa0QkNgttDsW6uWI5I7ymnkTRXnXuBlAOmrcaUR8g=;
 b=ABKB+DrMgR2IyFR4ITJQtcXyk1QTRKBrFwQGG5CzPbTHqM7zKcnhfTVfkfJsEgtfBQveNE
 SS362Zt5QA+mpwMs2+SGFRXf5RfqKuPicXJRt+UmH1b6v0nTBaXHYrHiz+Qv3arttqHDEC
 noJmK0hxoT7V9ra4wQCY/V8qToYn1hc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-WwqLt2RhPKCswcwGYEYzNA-1; Tue, 17 Mar 2020 06:47:10 -0400
X-MC-Unique: WwqLt2RhPKCswcwGYEYzNA-1
Received: by mail-wm1-f71.google.com with SMTP id y7so6977406wmd.4
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2020 03:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BVKKzGOrmX0AKRh5Gyr6rnvTXSip4bHXX6R/JGyx4N4=;
 b=PHXI39mNV5O6THKfv+ovea29t6Ovbd5U+5OmwCh13kIthlmyP0sh7nAxh/MDNLS5No
 oYCtdE0AdRavWN4mPL9sRETO5Zwqj86mzt9G2/WdjdCJ3lDcnjdsqXdh55wEh4qFFSLh
 r/5w2GXixQGTO7Q01d1ie0N49oHT5+DboUOyt1wBAyEsWDnnFrGqPiFxuOTornZTTFHg
 dG95AU/+7fpZstf7Clb4mKTMX7wI1CNZH6vVVd9ZdQ8Zc+rcgbHzpF7u7QsoGCCo03de
 B8OTOpJfCQsKRiI686LJeVLri4a0dm8BcnvOCiEd1SWY2vEP73gHj935iWqjCi8JB4Bu
 hVug==
X-Gm-Message-State: ANhLgQ2GGf7afK/yHn0fdGXDShBvoFELrTLCiCkBLswuVr6heSE2xSUi
 8+pxNBI8rod3allg03eH9NXlrmAy9CbpyVbUJcdeMjD7Ad/TcoszOXXIt/l1N1D84wdyG9/tt7U
 NQpaXfs2z8Raa
X-Received: by 2002:a5d:440a:: with SMTP id z10mr5451498wrq.177.1584442029432; 
 Tue, 17 Mar 2020 03:47:09 -0700 (PDT)
X-Received: by 2002:a5d:440a:: with SMTP id z10mr5451468wrq.177.1584442029195; 
 Tue, 17 Mar 2020 03:47:09 -0700 (PDT)
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id u25sm3400281wml.17.2020.03.17.03.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 03:47:08 -0700 (PDT)
Subject: Re: [PATCH 0/6] hw/net: Make Net/CanBus can_receive() handlers return
 a boolean
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20200305175651.4563-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74bab3ca-fd8c-5c27-0376-2c3728cb18e4@redhat.com>
Date: Tue, 17 Mar 2020 11:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-1-philmd@redhat.com>
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KkkomZoolOe

Ping?

This series is fully reviewed.

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The Net/CanBus can_receive() handlers return whether
> the network device can or can not receive new data.
> Make it obvious by returning a boolean type
>=20
> Philippe Mathieu-Daud=C3=A9 (6):
>    hw/net/e1000e_core: Let e1000e_can_receive() return a boolean
>    hw/net/smc91c111: Let smc91c111_can_receive() return a boolean
>    hw/net/rtl8139: Simplify if/else statement
>    hw/net/rtl8139: Update coding style to make checkpatch.pl happy
>    hw/net: Make NetCanReceive() return a boolean
>    hw/net/can: Make CanBusClientInfo::can_receive() return a boolean
>=20
>   hw/net/can/can_sja1000.h |  2 +-
>   hw/net/e1000e_core.h     |  2 +-
>   hw/net/i82596.h          |  2 +-
>   include/net/can_emu.h    |  2 +-
>   include/net/net.h        |  2 +-
>   hw/net/allwinner_emac.c  |  2 +-
>   hw/net/cadence_gem.c     |  8 ++++----
>   hw/net/can/can_sja1000.c |  8 ++++----
>   hw/net/dp8393x.c         |  8 +++-----
>   hw/net/e1000.c           |  2 +-
>   hw/net/e1000e.c          |  2 +-
>   hw/net/e1000e_core.c     |  2 +-
>   hw/net/ftgmac100.c       |  6 +++---
>   hw/net/i82596.c          | 10 +++++-----
>   hw/net/imx_fec.c         |  2 +-
>   hw/net/opencores_eth.c   |  5 ++---
>   hw/net/rtl8139.c         | 22 ++++++++++++----------
>   hw/net/smc91c111.c       | 10 +++++-----
>   hw/net/spapr_llan.c      |  4 ++--
>   hw/net/sungem.c          |  6 +++---
>   hw/net/sunhme.c          |  4 ++--
>   hw/net/virtio-net.c      | 10 +++++-----
>   hw/net/xilinx_ethlite.c  |  2 +-
>   net/can/can_socketcan.c  |  4 ++--
>   net/filter-buffer.c      |  2 +-
>   net/hub.c                |  6 +++---
>   26 files changed, 67 insertions(+), 68 deletions(-)
>=20

