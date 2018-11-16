Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp150813wrw;
        Fri, 16 Nov 2018 01:29:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5eQpF11oSDAqBbB+EEU3UGfp4up5uPYo1vqiB1SZ6fhIaCXHSH1CCFRwgOgETlJObHXpsZh
X-Received: by 2002:a0c:f584:: with SMTP id k4mr9583143qvm.22.1542360594558;
        Fri, 16 Nov 2018 01:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542360594; cv=none;
        d=google.com; s=arc-20160816;
        b=mHhr5oCV09P66P3KbVH4m0vqO3IF0Fjb5AIrl15rbuENfV2Lw64hzJBhXDPAcUEkZS
         66Z3lvRMG+kkwXTw3SNRAvs0NRVRTs9Oex5h0RszweNtfv1o+DcOxLP8XHw/JgjEsCAc
         hOQIlm2cVopgssdoWPJIB7evqRiUDAASPcAZMHbf5D2VWnXana7d9MSiTk436OINKBYn
         JmU1gYuXu16DwtGw1NiGqf4KZEp8U6YHWK/ynjEIzEQTASGTvF9IT9RNYH0kX1pszQsn
         yWMQS3nwv4rMqhbZaZ8gjq875Mi1O4mLkNia3D50epulfCS+xzLhsbfQu9zWJReAgqMA
         LCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=rqin+2LRGC0m0KB+WBmViRkrBz2VWm58CtTfHI2JtrY=;
        b=jHGmLWF0rUoRTM+RK60XLgz+O9s37bYGSUhU+kcD1uZe44BwLwr41GuX288cWeuiek
         UnKxu5NjCE8ozFkOrgavHXp3a18WThhz2zNfrehqUubo+OttIzgSjITF5w7SzTcSMTBd
         x6tQoGdetkqCPJ0OJ/7ohS7le5oNm1485ulHfXtL0DwvZaz623PM4pl7A5DeDIqdm0pm
         U38DiodBj3RxM7KliTu+LhdmAT9G0stZ9N9FscjKg1RXptWXfk3CmCMmezYwO/3ThNTY
         QXMfXms0ZsKaBLTGpum8JK7nhcHOAhRCNHPkvsYddgsOFlXRKa2hjZo4fAsARuVo5Z4I
         LGIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si1959486qkd.63.2018.11.16.01.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:29:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNaRl-0002y5-VX
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:29:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNaRH-0002jQ-ON
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:29:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNaRC-0005cf-1I
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:29:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gNaRB-0005c3-OZ; Fri, 16 Nov 2018 04:29:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C9F42D7FC;
	Fri, 16 Nov 2018 09:29:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FCF760BEC;
	Fri, 16 Nov 2018 09:29:12 +0000 (UTC)
Date: Fri, 16 Nov 2018 10:29:10 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181116092909.vlsynzuuivlzjoyf@kamzik.brq.redhat.com>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
	<1542365406-81310-7-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542365406-81310-7-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 16 Nov 2018 09:29:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V7 6/6] pvpanic : update pvpanic
 document
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uhC5g4Ov55tW

On Fri, Nov 16, 2018 at 06:50:06PM +0800, Peng Hao wrote:
> Add mmio support info in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  docs/specs/pvpanic.txt | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index c7bbacc..4e1f69d 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>  
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>  
> @@ -9,6 +9,13 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>  
> +Some architectures do not support ioport, just like arm. So add mmio
> +support.

This isn't a commit message it's a document. We shouldn't be using the
word 'add'. Anyway I don't see any reason to put this sentence in the
document at all. It's clear to users of machine types without an ISA
bus that if they want to use this device they'll need a different
interface. Let's just tell them what interfaces this device has, like
what's done below.

> +
> +When pvpanic device is implemented as a ISA device, it supports IOPORT
> +mode. If pvpanic device supports MMIO mode, it will be implemented as
> +a SYSBUS device.

pvpanic _does_ support MMIO mode after this patch series. So the 'If'
doesn't make much sense. You could do something like "Since QEMU v3.1
pvpanic also supports MMIO mode..." though.

> +
>  ISA Interface
>  -------------
>  
> @@ -19,6 +26,13 @@ Software should set only bits both itself and the device recognize.
>  Currently, only bit 0 is recognized, setting it indicates a guest panic
>  has happened.
>  
> +SYSBUS Interface
> +--------------

Missing two '--'

> +
> +The SYSBUS interface is similar to the ISA interface except that it uses
> +MMIO. Pvpanic exposes a address space region 0x09070000--0x09070001 in 
                         ^an                    [0x9070000, 0x9070001]

Using the brackets indicates that the addresses are inclusive. I would
also write something like "For example, the arm virt machine could put
the pvpanic device at [0x9070000, 0x9070001]". That way users see this
is just an example and not guaranteed to stay the same nor need to be
the same for their machines.

And again /Pvpanic/pvpanic/. "pvpanic" is a device name, we shouldn't
change it, not even for grammar.

> +arm virt machine. Currently only the first byte is used.
> +
>  ACPI Interface
>  --------------
>  
> -- 
> 1.8.3.1
> 
> 

Thanks,
drew
