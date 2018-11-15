Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7068918wrw;
        Thu, 15 Nov 2018 06:26:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5fbU4mlBzMnWGPpqfZb1DrHEaw35h7FphA26q7H/sstRxVPqIYUgVt+Ay50qXd3C5mqK2Hm
X-Received: by 2002:a0c:b11a:: with SMTP id q26mr6425622qvc.2.1542292005799;
        Thu, 15 Nov 2018 06:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542292005; cv=none;
        d=google.com; s=arc-20160816;
        b=nOuRi6LctijnBBYI1nXYXutFD9EsLNKtfYNn0PUuKrpXkALHSFwfzVcBI+FLsfiEn5
         I0Nc+EzmswuwiQ9abQys5sbnt6+Fkzcb2iWdeKv971RGV2/8znjzFgm5QCv4qSELlL/O
         QYTaQLPn0CCr6pLMDur/HonwMJHCURlgmA0AiBDrJ65vnteUgaNpp+SwxMdm+qWcInZ4
         OZmRHWNB5ruiMrqjIRri6EVVVYIbDMdPQXut57STrgXBMe2RL6LuSBnEmqlq/UXLCFWF
         9KjD7hxmRgZbzoQwuK7NcBm4rRVoxzXw9VVRk6qf/jyxKNs+kLU7HQOmm+2yhmWPl9ij
         2+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=/744sMMRs0cwu7eqhGvUSbnx80w08NtGCAAYS3iC9pk=;
        b=XNwwkIJnI5ayMxBuqtkdlDK2wcK0tw/QNg7xGOYSdls/Jq1rvOO35/HKm2WvaGv0nM
         mtMlMxfBibP3n5yjkOffAVkPirHIlIa2zS+jz15biM0qtA13RGj/NajQEXxGRbUsrecC
         /sxZyt/rCKlnKha/ItH/SIh4j23BQbKXJPjpw9TGloYrSPkptEQ17WJMW4gzgJP4QOlP
         ZCbinGFdCauq9vY7WRkbygmT2rToOcf4Ot6XUC1bciuurR6+iTR8cXGOTw295UXzikNf
         S18podEJ3ftJ29c5d/Gu2KsRuGABKsfniecFxHA0kdiMRAIOO6dIXx53Gion9jWrjSkR
         a6Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si67240qtd.319.2018.11.15.06.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNIbV-0005eB-7v
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:26:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNIai-0005Yn-Dc
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 09:25:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNIag-0000hg-H5
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 09:25:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gNIaX-0000ZV-RN; Thu, 15 Nov 2018 09:25:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFDB589ACB;
	Thu, 15 Nov 2018 14:25:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6311852D;
	Thu, 15 Nov 2018 14:25:35 +0000 (UTC)
Date: Thu, 15 Nov 2018 15:25:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181115142532.ppvacfmw753dfq26@kamzik.brq.redhat.com>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
	<1542022940-46849-7-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542022940-46849-7-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 15 Nov 2018 14:25:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V6 6/6]  pvpanic : update pvpanic document
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3q7PNvl0Phm8

On Mon, Nov 12, 2018 at 07:42:20PM +0800, Peng Hao wrote:
> Add mmio support info in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  docs/specs/pvpanic.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index c7bbacc..5d8e9dc 100644
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
> @@ -9,6 +9,10 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>  
> +When pvpanic device is implemented as a ISA device, it supports IOPORT 
       ^the                              ^an
> +mode. If pvpanic device supports MMIO mode, it will be implemented as

When the pvpanic device needs to use MMIO mode, ...

> +a SYSBUS device.
> +
>  ISA Interface
>  -------------
>  
> @@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
>  Currently, only bit 0 is recognized, setting it indicates a guest panic
>  has happened.
>  
> +SYSBUS Interface
> +--------------
> +
> +It is basically the same as ISA interface except that it uses MMIO.

The SYSBUS interface is similar to the ISA interface...

> Pvpanic exposes
> +a address space region 0x09060000--0x09060001 in arm virt machine.
> +Currently only the first byte is used. 
> +

I would drop the above lines. They're not correct anyway. The region is
9070000-9070001 (inclusive).

>  ACPI Interface
>  --------------
>  
> -- 
> 1.8.3.1
> 
> 

Thanks,
drew
