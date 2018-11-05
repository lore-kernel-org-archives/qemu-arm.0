Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2361334wro;
        Mon, 5 Nov 2018 01:39:29 -0800 (PST)
X-Google-Smtp-Source: AJdET5fCO/ExY48OtsJYo+jN5HcuzK+Hdc0ib95yqFao93afNBdAZmPdBx2IF1TYQGPUDK/iFOvP
X-Received: by 2002:aed:2dc5:: with SMTP id i63mr11315166qtd.173.1541410769842;
        Mon, 05 Nov 2018 01:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541410769; cv=none;
        d=google.com; s=arc-20160816;
        b=wqnJfhplaRMQ9jVDdT0PxR8nyiYM6sodM4O7VgA/HITYz0s0A4CYuVW2B9v91yqsEA
         uiYeuvYDc33SurN+k/nEtUzT0Q8swe7JGCf5l19RTz8M22eApYvSjapg62vhAtleGnZ5
         1nZ/lSi8/k6SXwEgOD0wTt/A9QdO2S93ewOD4EfZvwG9KvGL5vSOOdQGxQ1/AknKETef
         qc/XcRNHjrJOyElIn2vaXosOz5TRlhANum7oTcWAsDCSLzq/TVxr2yO7R5p5bPV7OU9i
         4IsSUcZ3Dg+fhEr7j0jvOjT4CGkqd8xnf4t/dLbmpKdkjE4+itMXvxLWgRWcnTej74ZA
         IAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=jo2dUJ4R0db/87PcaX6DlA0Fd2lmdkETsp975GaMOSw=;
        b=CPI9p8pAy8H1AHHZ4FfZElxcH8eLXsp2V6dYbhaAs2VIQtVfVTXpIHTzNHQAZflR9f
         Yr9gWcm1zgFdxX8OOsN+KkXj9gqgmvCBMUIQPpzXvb6+ifM+9TvkkGH7EZdSRg2UVIda
         Fth0KjH7RUT1zGdQjuLwfcQIo9xXnoPp+9Hkseg+JJeRspc/2dSQuQO24kp9tsOuwIQI
         EK+zfPbYs3pDRdh271UuCBPXQxbfSckOc4qi2X3jnmvMbjUovm+uztISVX7VPLGWqj3a
         A3BIaVeDHQVnTOjKSqjQTGd0mXYSjt6xSsD6pKyf+AZ+SxXmuxQ/04E/moa90CDcRXiT
         kO4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x55-v6si1783542qth.369.2018.11.05.01.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 01:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJbM0-0001dd-NX
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 04:39:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJbLt-0001dI-Me
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 04:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJbLp-0005I2-4B
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 04:39:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gJbLo-0003pR-Ph; Mon, 05 Nov 2018 04:39:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D7B6307CDE8;
	Mon,  5 Nov 2018 09:39:08 +0000 (UTC)
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 372325DA63;
	Mon,  5 Nov 2018 09:39:02 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180927115454.31471-1-geert+renesas@glider.be>
	<20180927115454.31471-3-geert+renesas@glider.be>
	<2f7f45ec-c689-2cd4-e44f-90c82b47d151@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <634eb7a6-5eca-37b8-bcb3-70677ebc2e99@redhat.com>
Date: Mon, 5 Nov 2018 10:39:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <2f7f45ec-c689-2cd4-e44f-90c82b47d151@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 05 Nov 2018 09:39:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] New crash
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mVFrKsuIAHER

Hi Thomas,

On 11/5/18 10:17 AM, Thomas Huth wrote:
> On 2018-09-27 13:54, Geert Uytterhoeven wrote:
>> From: Auger Eric <eric.auger@redhat.com>
>>
>> Up to now we have relied on the device type to identify a device tree
>> node creation function.  Since we would like the vfio-platform device to
>> be instantiable with different compatible strings we introduce the
>> capability to specialize the node creation depending on actual
>> compatible value.
>>
>> NodeCreationPair is renamed into BindingEntry. The struct is enhanced
>> with compat and match_fn() fields.  We introduce a new matching function
>> adapted to the vfio-platform generic device.
>>
>> Soon, the AMD XGBE can be instantiated with either manner, i.e.:
>>
>>     -device vfio-amd-xgbe,host=e0900000.xgmac
>>
>> or using the new option line:
>>
>>     -device vfio-platform,host=e0900000.xgmac
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> [geert: Match using compatible values in sysfs instead of user-supplied
>> 	manufacturer/model options, reword]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> scripts/device-crash-test reports a new "crash" with current QEMU master
> branch, where QEMU aborts like this:
> 
> aarch64-softmmu/qemu-system-aarch64 -S -machine virt-2.9,accel=tcg
> -device ramfb
> hw/arm/sysbus-fdt.c:422:vfio_platform_match: Object 0x564cf9ae8f80 is
> not an instance of type vfio-platform
> Aborted (core dumped)
> 
> I think it is likely due to this patch here ... any chance that you
> could make this a little bit more user friendly instead of aborting the
> hard way here?

thank you for spotting the bug. We should use object_dynamic_cast() to
test if the device is a VFIO_PLATFORM one.

I will prepare a patch.

Thanks

Eric
> 
>  Thanks,
>   Thomas
> 
