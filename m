Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp792592wrx;
        Fri, 1 Mar 2019 08:08:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVRFkFiJneeO2HOuaD1mMBE9zoupvW0XOT4TexM5b78XqIa3wBiQgvCWzCxaW07UDj6D2P
X-Received: by 2002:a81:9958:: with SMTP id q85mr4270998ywg.390.1551456528671;
        Fri, 01 Mar 2019 08:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551456528; cv=none;
        d=google.com; s=arc-20160816;
        b=i1LJgGRzLOV6KoKqG9khHahXV90JyMnA2cWjWbRXSBOklDIdWuB7xeX6UZBNrxwWkP
         3XhkMX57iLC/t/KHo9coKwFvjbAVI5eDfF/IwFGnYyqt73ZZyEoEH3P9MuOb05OtRmS2
         hHlZ33eFLk+iGWTh7jouLxyneTS/Xx8ap03UUpBHJ9vA9pmHzVPsQfsFnhy7APP/8I5j
         lBtinIT/gbNBJ3xAmklfYfU/vIMQuDf9Oj5RExWXolsUHOXxF5Yj9Jg53zyAnxyaydi4
         Y6TAH6zbEA7CTpTeObiONBQiXXfvyCoToaN0o5J5yEQWluP9mn/M8Qc+GVwV4YQYzjUt
         jgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=G3Blk06kaszH9FLclkpv4vCJEanatzyo60wRKT0VabM=;
        b=xT5tfsx52WHG/RarXudrnN+qHHWzaL6wVIcnJxnuiZIm7vqIwGu3q25KdZJ8Wu4eMV
         e1adlJyd9rZkkzc23d8FLOkW51vrQUr0PSOJ0siMpxzmV7Q2Aw3h+B/N6XuPdhaLMC+t
         ymWUNuTn74jY8YS3kcnPQ1k3NQJLX3dkvEJ7VcsCqHgpCHC35pzF3NoLFUclelMwG4V9
         K+FOU2AdrCtFBQlMqHHmoBhKKUG8irks3SXDuxCqH1nCX6FyYUkg/eJOKOvDgpjJfhPs
         t1Msxq6SXeBHJTR+7UxlrslgMJJSaWthPogC+NUAiJbk1KIVp5bEtQvxfsnLyf1YCgm9
         mLcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f205si10501729ywf.334.2019.03.01.08.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 08:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkiO-0005k8-3a
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 11:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkg0-00044k-Gw
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 11:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkfu-0000nt-S2
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 11:06:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkfu-0000mb-76; Fri, 01 Mar 2019 11:06:14 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B6D03088D82;
	Fri,  1 Mar 2019 16:06:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD3B819C69;
	Fri,  1 Mar 2019 16:06:06 +0000 (UTC)
Date: Fri, 1 Mar 2019 17:06:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190301170605.55e5abdb@redhat.com>
In-Reply-To: <20190301134709.4695-11-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
	<20190301134709.4695-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 01 Mar 2019 16:06:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v11 10/10] hw/arm/virt: Bump the
 255GB initial RAM limit
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
X-TUID: cwEJb23zzByz

On Fri,  1 Mar 2019 14:47:09 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Now we have the extended memory map (high IO regions beyond the
> scalable RAM) and dynamic IPA range support at KVM/ARM level
> we can bump the legacy 255GB initial RAM limit. The actual maximum
> RAM size now depends on the physical CPU and host kernel, in
> accelerated mode. In TCG mode, it depends on the VCPU
> AA64MMFR0.PARANGE.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
> index ab70e4a657..aa06570050 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -95,20 +95,7 @@
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
> +/* Legacy RAM limit in GB (< version 4.0) */
>  #define LEGACY_RAMLIMIT_GB 255
>  #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
>  
> @@ -1516,12 +1503,6 @@ static void machvirt_init(MachineState *machine)
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

