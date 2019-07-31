Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5810187wrv;
        Wed, 31 Jul 2019 08:44:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzChaAPugw8gQZs84tSB/lzigAQDeX7Xtr0zwtwa0AtPJ2bc0h80DvUzC+0wXq2GOpemfkV
X-Received: by 2002:a50:d65e:: with SMTP id c30mr107803800edj.38.1564587853066;
        Wed, 31 Jul 2019 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564587853; cv=none;
        d=google.com; s=arc-20160816;
        b=zQsxNSu/HlZO9EtBB5V1EFlN8FXkGtOcKuTy43HKWv/NLIFTbDVzaIL3cFLxmp3cdu
         aHGuLNO8P03MgPzK6R5yu0503gq8zo9t1iB+HlVq8AUdtw7Zbkas6ty9fd27h3y8SUwb
         s8MuxAl/WHD9TNCs9PZ6UJ+8MzTtaSVbGV/01+kkXldbszmIKyMbr+fbLwcDxRB0wYSM
         DuPhfQJxkxi84I0aF1GarvEIwrvsrcyG6R7jexq4D2Z6fwbvdzSBnXXm0MOGPLKSW2Ti
         07SxOnWQ4ou/AbYCPrSITrjRaSqk1S9brg9JXMPfJvpfagLsV6VZn1bH3W23nz5xILRi
         g9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=BmtWFEQ71ckZRKFzlwHzJVzOsYbJhCGLypGFKaN+G10=;
        b=TS/g0WrTW8VHuMsEV4WVIC8LIliCWrdv2ezLEw6k2V1t9YpMpWU0wQVQ+C5cWqN7//
         oPZVNAKdNWx/nu0wVCo4FOT+PEYaaKFnp3Z51CDzdMiB7jNrkc2ER/SvZs3FEct+piR8
         VWJY6+COVz4wqUxIWMXU4DjBRJ1KF/OAC+BE1YDWnLZDzvmk1FSmNB05cwTZssdwtELK
         +WhjrFdo24C+MxJakDI2UoJiAgYx0e7pSbxK6T/5Ac8l4frYBkuD8j/G9xKjkda1mVGH
         Mu8sxeC4+tDTYapTHxLuqGU/WdtyKNewvM0KKB8gApWigA4oKV9dkyFIByoJ12H8hOsH
         +ipA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si19863552ejr.343.2019.07.31.08.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqlw-0007pC-46
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsqlc-0007nB-AQ
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqla-0005Lz-It
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:43:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40563)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqlT-00056D-TB
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:43:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so70192606wrl.7
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmtWFEQ71ckZRKFzlwHzJVzOsYbJhCGLypGFKaN+G10=;
 b=QEHZouhIQ34U4qhsNZPddFz5X2afn4XXkmU1bHC5WAFT9yQRCD/P4j1ve0CV/bld59
 Ci1cGO9GVc/SSq0IacP70wipDxYiO/3BoJAkMiwgB+9YOQeJJfg081i1ApzJUnIfAouT
 ssNGuk19tGwXquvKa5QO/7YF9Ks+c90rITgAk901V38jB+gbV2h1EnY9gzYoNT1lJHzI
 8wbcwSeDqf3j8BiIgKL3fzIKEBri/T/ViDOdOuGPMZwaqf3Vz7A+LDSPhvV8cXIcpXSv
 subhISho/Jooqbk0Msizl0n05wZHYehrWfZG3cN04xW8/glDRHarKrTqSRz66XRDx2LA
 HVXA==
X-Gm-Message-State: APjAAAWCn/k5IY1gomsZchctPukH09nIB25Tb7gA0jlxh+ddwQ/V9OnO
 GcsVXP+9i08SoYYOzE/WowtoBg==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr110195451wru.297.1564587815967; 
 Wed, 31 Jul 2019 08:43:35 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id b15sm84899155wrt.77.2019.07.31.08.43.34
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:43:35 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <6ea54e80-63cd-5759-337b-1eb1686453f5@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e979936e-3545-87fb-eec6-e3a098785113@redhat.com>
Date: Wed, 31 Jul 2019 17:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6ea54e80-63cd-5759-337b-1eb1686453f5@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] RFC raspberry pi sd-card reset
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BiUHkI3OesCO

On 7/31/19 4:21 PM, Damien Hedde wrote:
> Hi,
> 
> Concerning the reset on the raspi2/3 machine, I ran into an issue with
> the sd-card.
> 
> Here follows a subset of the qbus/qdev tree of the raspi2&3 machine as
> it is initialized:
>  + System
>    * bcm2835_gpio
>      + sd-bus
>        * sd-card
>    * bcm2835-sdhost
>      + bcm2835-sdhost-bus
>    * generic-sdhci
>      + sdhci-bus
> 
> raspi_init does 2 things:
>  + it creates the soc
>  + then it explicitly creates the sd-card on the bcm2835_gpio's sd-bus
> 
> As it happens, the reset moves the sd-card on another bus: the
> sdhci-bus. More precisely the bcm2835_gpio reset method does it (the
> sd-card can be mapped on bcm2835-sdhost-bus or sdhci-bus depending on
> bcm2835_gpio registers, reset configuration corresponds to the sdhci-bus).
> 
> Reset call order is the following (it follows children-before-parent order):
>  1 sd-card
>  2 sd-bus
>  3 bcm2835_gpio -> move the sd-card
>  4 bcm2835-sdhost-bus
>  5 bcm2835-sdhost
>  6 sd-card  (again)
>  7 sdhci-bus
>  8 generic-sdhci
> 
> In the end, the sd-card is reset twice, which is no big-deal in itself.

The machine cold reset implicitly cold resets the sd-card.

IIRC the sd-bus shouldn't (cold/warm)-reset the sd-card.

Only SDBusClass::set_inserted() can cold-reset the card.

> But it only depends on the bcm2835_gpio tree being reset before the
> generic-sdhci (probably depends on the machine creation code).
> 
> I checked and it seems this is the only platform where such things
> happen during master reset.
> 
> IMO this is a bit hazardous because reset is based on the qdev/qbus
> tree (and with the multi-phase I'm working on, even if it still works,
> it's worse).
> I'm not sure what we should do to avoid this (and if there's is
> something to be done).
> 
> The easiest solution would be to initialize the platform with the
> sd-card at the right initial place (I do not really understand why it is
> created in the bcm2835_gpio in the first place since we move it just
> after). But it won't solve the issue if a reset is done afterwards.
> 
> Or maybe we could move the sd-card on the proper bus in a machine
> reset code so that it's on the right place when we do the sysbus tree
> reset just after.
> 
> What do you think ?

There is only 1 bus, the SDHCI bus lines are muxed with the GPIO ones.

bcm2835-sdhost-bus should not be child of bcm2835-sdhost, the sdbus
might be child of bcm2835-peripherals and shared by both sdhost and gpio
(as a link property?).

I tried to do that 2 years ago. I thought I posted the series and Peter
rejected it but can't find it, maybe we had an IRC chat. I won't have
time until next week to dig for it.

> 
> --
> Damien
> 
