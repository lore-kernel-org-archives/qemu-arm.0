Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp255800wrt;
        Mon, 26 Nov 2018 12:27:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WruQJyDvpM48nInOkuNrs/nKdhVubYz8wRyx1AHfHbXupp5Vwf0X6ZCJ76E+pnv8qLtkWB
X-Received: by 2002:a81:d201:: with SMTP id x1mr21188266ywi.9.1543264048761;
        Mon, 26 Nov 2018 12:27:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543264048; cv=none;
        d=google.com; s=arc-20160816;
        b=izQTY0HXdoiOChygj16Le66ui60W3aiKTfAKbpp3WuftBNoh0IVNxEHglOElymsGkK
         xJdrAdaQWUfIfqs/OU3UKLx0Ea+aX297BfxvHLvhXUjjYCiCut2WmVxR6mwZXfCWenyj
         2MriciO93MIblKm/PL3/kdHrFt31m4KdFzmxxpuOl6Jq5hVemCodCwPgyxLjQP7kJGrY
         0/3RMA3UbsEIBH0kVN1Y1ewd2yThoPp8qSGlE8BiqgUyBjrYUWn65lfUKgSCxX400C8R
         B1Vm6jS9ZTaMduu8AoYVxSl52OS4wXE8X1ffC7JBLZPCwWnETdZLTpOhTAOgCDeE2HLk
         l4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to;
        bh=JNCDjlbTfQ04lD5aj24b6mndT7e/YpIy+bH4lPAjtYc=;
        b=nPcMp8LmQ+EoOuPSSd89PcFaFe+BLFgt5u2x17aJyidv49PjMh4ETj6bT8lb/GxAIp
         rAR5oOsIhj6jsxEg0LeoNIWkqmUiYLlkjKBSYZGmiVcrVJgXNDlu/hoqW6reVTC9Uly6
         U1HGG69xLHDnstXbqOp7osIWwIDlpohWBtEKqYLl4BcUOiohuEwTDlhTBgzScgUrp87e
         L15wV3vKy2behEuLwDdnjNMZlYM0erqU+Wj4zSEMeUvfTCFijN+iWbHilhZmOOfNGile
         pDasSR9XSZgw6vxoprRxLvnvs1h6BojSNLie3g92wLf30IQL7KJ+1cIC3AEsbKCKvwbU
         gMcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m39si1025251ywh.329.2018.11.26.12.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 12:27:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRNTc-0004u6-88
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 15:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gRNCB-0005yc-0c
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:09:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gRNC6-0002CO-UK
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:09:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gRNC3-0002Bb-48; Mon, 26 Nov 2018 15:09:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F3B0C0495A2;
	Mon, 26 Nov 2018 20:09:16 +0000 (UTC)
Received: from [10.10.124.147] (ovpn-124-147.rdu2.redhat.com [10.10.124.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA7C5C63A;
	Mon, 26 Nov 2018 20:09:11 +0000 (UTC)
To: Peng Hao <peng.hao2@zte.com.cn>, peter.maydell@linaro.org,
	drjones@redhat.com, philmd@redhat.com
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
	<1543262162-6351-10-git-send-email-peng.hao2@zte.com.cn>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <48580284-d439-456b-2c6a-a10c0a9280ea@redhat.com>
Date: Mon, 26 Nov 2018 14:09:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543262162-6351-10-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 26 Nov 2018 20:09:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V9 9/9] pvpanic : update pvpanic
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tduGb2i59JNU

On 11/26/18 1:56 PM, Peng Hao wrote:
> Add mmio support info in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>   docs/specs/pvpanic.txt | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index c7bbacc..67f5591 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,14 +1,18 @@
>   PVPANIC DEVICE
>   ==============
>   
> -pvpanic device is a simulated ISA device, through which a guest panic
> -event is sent to qemu, and a QMP event is generated. This allows
> +pvpanic device is a simulated ISA/SysBus device, through which a guest
> +panic event is sent to qemu, and a QMP event is generated. This allows
>   management apps (e.g. libvirt) to be notified and respond to the event.
>   
>   The management app has the option of waiting for GUEST_PANICKED events,
>   and/or polling for guest-panicked RunState, to learn when the pvpanic
>   device has fired a panic event.
>   
> +When pvpanic device is implemented as a ISA device, it supports IOPORT
> +mode. Since QEMU v3.2 pvpanic also supports MMIO mode, it will be

The next qemu release will be 4.0, not 3.2.

> +implemented as a SYSBUS device.

Grammar suggestion:

The pvpanic device can be implemented as an ISA device (using IOPORT), 
or, since qemu 4.0, as a SYSBUS device (using MMIO).

> +
>   ISA Interface
>   -------------
>   
> @@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
>   Currently, only bit 0 is recognized, setting it indicates a guest panic
>   has happened.
>   
> +SYSBUS Interface
> +----------------
> +
> +The SYSBUS interface is similar to the ISA interface except that it uses
> +MMIO. For example, the arm virt machine could put the pvpanic device at
> +[0x9070000, 0x9070001] and currently only the first byte is used.
> +
>   ACPI Interface
>   --------------
>   
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
