Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp772407wrx;
        Thu, 28 Feb 2019 08:30:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyombIMGhZoc/p5wRm7tmehvKRPambJ6TykkOdxCQeQFgJ5BktzmW+uvcByf+Ku17zdSwkr
X-Received: by 2002:a25:770f:: with SMTP id s15mr199251ybc.47.1551371420294;
        Thu, 28 Feb 2019 08:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551371420; cv=none;
        d=google.com; s=arc-20160816;
        b=rhJW3ZYhlIziq9Z6QPrnpAWL94VS32Rodcvi+mYK8dXmbrYIQsqDxwNMf00l22CwOr
         YG4VTewmM3hsVhQz8qQQDj9Gt99uIAYgAY3x1vgUCe78VunImDzWXiqOyufn4NQwLVFK
         2AOiOTgJ7SmnL7JmtYmFYxdfK54wkA5+lsyShKp4ZhdnYbhgChE57fNn7aIgUFtsbylx
         D6IcimhGojOqsW0VK6TI9PHP23dgcPp+sVmGR//IDAFXtIXRsa7elz3aOKEv3G659bDR
         w6svQsvrmOd/mhZH8a4IUZk62DJH0e92zV9Ko3fo9kpsOmwbz8UmyjZLMJYdDLSxqGeT
         GDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Fh3bhctFcqZ91Mvgw+tiZGkeV7T4EFYkyhxabsd+Tpo=;
        b=QIyoOS8PT8sKVXUBzX8d7YYQSCh0OJ/J1if7DJyoE0MA5U+sAQUk+6mmf5+i3iExDB
         hqaZlWfZv5OlBj7EwQrxs0r8OpL1ekBR8BNBhrUrDB6VSzGprx8LvH4Y+ru/m/qVsvdJ
         SQRhEYc1ZkrSdIwqZBrkyJI/CUOkaS712Bl7DA3SvuJuuPiOoijs5q39CZp9aF+5Upiq
         fB27O2a7ywUiPAWW9SwZgmiwp1Ljid8z8ZfSGNeMHSY5DYrnR9hD4sCWNHR7TwkVeUPu
         pOm0jCb2xpJ8ku5weLPx6OZzoiie+V3Iif8ImD1YZTtycvijBktEsD7xFyYh+ZMgjaYn
         y8Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e126si10515120ybb.244.2019.02.28.08.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 08:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzOZf-0002bY-R4
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 11:30:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOZV-0002Zv-I3
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOZQ-0000yV-HN
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:30:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzOZE-0000rJ-RP; Thu, 28 Feb 2019 11:29:54 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D19DDC0EB228;
	Thu, 28 Feb 2019 16:29:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F9401018A03;
	Thu, 28 Feb 2019 16:29:40 +0000 (UTC)
Date: Thu, 28 Feb 2019 17:29:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190228172938.1993ed57@redhat.com>
In-Reply-To: <20190228150324.25973-11-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 28 Feb 2019 16:29:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 10/10] hw/arm/virt: Bump the 255GB
 initial RAM limit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zK9hv8y+V4V

On Thu, 28 Feb 2019 16:03:24 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Now we have the extended memory map (high IO regions beyond the
> scalable RAM) and dynamic IPA range support at KVM/ARM level
> we can bump the legacy 255GB initial RAM limit. The actual maximum
> RAM size now depends on the physical CPU and host kernel, in
> accelerated mode. In TCG mode, it depends on the VCPU
> AA64MMFR0.PARANGE.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v7 -> v8:
> - TCG PAMAX check moved in a separate patch
> 
> v6 -> v7
> - handle TCG case
> - set_memmap modifications moved to previous patches
> ---
>  hw/arm/virt.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a3da75a5ae..a45f0fcf79 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -95,21 +95,8 @@
>  
>  #define PLATFORM_BUS_NUM_IRQS 64
>  
> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
> - * address space unallocated and free for future use between 256G and 512G.
> - * If we need to provide more RAM to VMs in the future then we need to:
> - *  * allocate a second bank of RAM starting at 2TB and working up
> - *  * fix the DT and ACPI table generation code in QEMU to correctly
> - *    report two split lumps of RAM to the guest
> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> - * (We don't want to fill all the way up to 512GB with RAM because
> - * we might want it for non-RAM purposes later. Conversely it seems
> - * reasonable to assume that anybody configuring a VM with a quarter
> - * of a terabyte of RAM will be doing it on a host with more than a
> - * terabyte of physical address space.)
> - */
>  #define RAMBASE GiB
> +/* Legacy RAM limit in GB (< version 4.0) */
>  #define LEGACY_RAMLIMIT_GB 255
>  #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
do we need to keep these couple around?

it's used only in
 [VIRT_MEM] = { RAMBASE, LEGACY_RAMLIMIT_BYTES },
and doesn't have any effect whatsoever.
I'd set initial  VIRT_MEM.size to 0 and drop LEGACY_RAMLIMIT_*
maybe add comment above entry that size is defined by ram_size

>  
> @@ -1515,12 +1502,6 @@ static void machvirt_init(MachineState *machine)
>  
>      vms->smp_cpus = smp_cpus;
>  
> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> -        error_report("mach-virt: cannot model more than %dGB RAM",
> -                     LEGACY_RAMLIMIT_GB);
> -        exit(1);
> -    }
> -
>      if (vms->virt && kvm_enabled()) {
>          error_report("mach-virt: KVM does not support providing "
>                       "Virtualization extensions to the guest CPU");

