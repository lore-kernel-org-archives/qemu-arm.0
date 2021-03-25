Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp762342lfg;
        Thu, 25 Mar 2021 13:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/9QpvCd2kmXrMo68pnICaCRaf93A9rB7OeHdEnMQTq+3eKvf246PGuzzfUG+SkjMPvDwo
X-Received: by 2002:a05:6e02:1c02:: with SMTP id l2mr8152782ilh.183.1616705517890;
        Thu, 25 Mar 2021 13:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616705517; cv=none;
        d=google.com; s=arc-20160816;
        b=U+cjGS2p6j3EP6HMX/cQ+qZkwbIFaQ4Yr2J1zVmZCBJFbEqJ3Ahr6qi+5GLK8wl+5A
         iB93nrD9d7Nj3ikVukguteVGzANZWlftPONcqcOODjh5LDzNCsRrKxXfDGQJT9bq90E8
         UcUgJDFuvdnGp6LSennSnRGeGsljZWO6BQFOWPs1Dt9stwISmOFPJJk6a0XLtAktzEdK
         QxQkNPUELxxSY9Y1u1VEIiRaKcngcDKl9VSP3eLWUi2zD7YHervWeOSsppvOyy5HvOW5
         et3W3ExURbOuB6zx5SJt+mrofJLXXu0292m4RigyQ/6GYEvm2LUUpZ20poTlfBqLY3ee
         c6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=mwv1rFWgnLF/+Oim3p8bXH4KUvUP47tnG1lbL+636rg=;
        b=NdR8c92AQL3JGKg0suvcDraAIxwn0EWfCSjlgWe6qCRaKloDAP6c4kfrE7segbwQOl
         tbXE8lig4++UXiUixRzOBFjDolE+tcAU4G5y5qAx/dmFcCxemLYvu9Hpi965TqB1BfUO
         QVzUYVabjj5CNRS9SDceClswvRu39DIFV+Jgb32X1Nd7RZhB1e8EpS/8xp4uwAsJGbbV
         dnWz5+SLFeuQ3eN0IHZ678d65veyumfE/7WsBvmlUeatsGhuQUGBHLFeuh5nsv1y7Ihl
         uF5BQCw6rnO/v2KjMf7nUqFPuvwEjcoQxuZfSLBG5TXAKO1UUkIvImm65JdMeD+H0bf2
         URRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si4831845ilo.156.2021.03.25.13.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 13:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPWxR-0001ry-6U
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 16:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPWxF-0001ql-N7; Thu, 25 Mar 2021 16:51:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49498
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPWxD-0003fl-FK; Thu, 25 Mar 2021 16:51:45 -0400
Received: from host86-143-93-99.range86-143.btcentralplus.com ([86.143.93.99]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPWx3-0006af-AO; Thu, 25 Mar 2021 20:51:38 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0fe1a06d-1223-741d-17b3-f8a447935bd1@ilande.co.uk>
Date: Thu, 25 Mar 2021 20:51:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.143.93.99
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8ks4FPd+MlI

On 25/03/2021 15:33, Peter Maydell wrote:

> On the two machines which have the "platform bus" (ppc e500 and arm
> virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
> hotpluggable in the device callbacks, and try to plug those devices
> into the platform bus.  This is far too broad, because only a handful
> of devices are actually valid to plug into the platform bus.
> Moreover, if a device which is pluggable for some other reason (like
> a PCI device) happens to use a sysbus device internally as part of
> its implementation, the hotplug callback will incorrectly grab that
> sysbus device, probably resulting in an assertion failure.
> 
> Mostly PCI devices don't use sysbus devices internally, so the only
> case we've encountered so far is the not-valid-anyway
>   qemu-system-ppc64 -M ppce500 -device macio-oldworld
> but we might create more in future.
> 
> This series restricts hotpluggability of sysbus devices on these
> platforms to those devices which are on the dynamic sysbus whitelist
> (which we were maintaining anyway).  With it, the above ppc
> commandline stops asserting and instead fails cleanly with
>    qemu-system-ppc64: Device heathrow is not supported by this machine yet.
> 
> Patch 1 is an API doc improvement while I was in the header file
> anyway.
> 
> thanks
> -- PMM
> 
> Peter Maydell (4):
>    include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
>    machine: Provide a function to check the dynamic sysbus whitelist
>    hw/arm/virt: Only try to add valid dynamic sysbus devices to platform
>      bus
>    hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to
>      platform bus
> 
>   include/hw/boards.h | 38 ++++++++++++++++++++++++++++++++++++++
>   hw/arm/virt.c       |  8 ++++++--
>   hw/core/machine.c   | 21 ++++++++++++++++-----
>   hw/ppc/e500plat.c   |  8 ++++++--
>   4 files changed, 66 insertions(+), 9 deletions(-)

Looks good to me having been poking around the code earlier today so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
