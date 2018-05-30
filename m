Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4926044wre;
        Wed, 30 May 2018 09:20:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJz5c8oMOkMg5ADQlDzcW1wbJOdSQjtWWiNsTVpVt/47dmYjjE54tbbLIyEDatObCzYpUim
X-Received: by 2002:a37:9804:: with SMTP id a4-v6mr2899908qke.371.1527697239345;
        Wed, 30 May 2018 09:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527697239; cv=none;
        d=google.com; s=arc-20160816;
        b=e6HEJ2Q8rilxN8ecNmxpXVH9oA+iHwNbpcmxmn4wkseoEBy1YOXaRh+hEXN+x2RdXe
         sMcT9zBlyWPZx35tMf5Pa0HhsAmH2AYHuIgylxoNLuZ2JHbnMDQ10S5OuSeVUieRkPgp
         PbJvD5jJLSEBCWNKjvqJqsj4ck67a5km/Hcj5RXa5tfW5gUDCI97RJQbQXgb7a4fmgyD
         Usf0ysqKFD+uuz8LzNv3iO7COwvrcs8vmQ9k2+GK5G/LldvVZYEiyfCi2Rt9FQL5gKbG
         lDKeJ8Lz24sselfypdnVh4WkXplzQSCz+77Tl4iawQY8tmVpPyiY+grRO3swbk98M/s+
         TT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Q81dMuK2wW8/ZnUJZy4E2v1phvgl2ngU/l74HTlTRUU=;
        b=QTIftyNePbPAt8SJe7Y6BRhR7Mk7j22RdIlNkBJg6zw4pMuDrF64Wxjhz71y8a0+6p
         W8VPVJp9InC9dC9GRRM/RsVT+k26JmLgCTTwbgtQvwHrDG+cXiS+TJI/N2yDHHB8+xy4
         mMUf/lGiFjbVIZyGjY6hz+/LRXjqbEl4BmCHuDnWpxwZZFAgYSVe50e7QetnTHaDdUvL
         uDuY++X33NcN+ROT3Do/RsqM9TWvpqcFsgbnsKEmzlMKnz4wz5xDt9eDg60EHsjVcq9j
         ODbZ9dPFpChIMBkyjJVhrMKD6MfTWILmTyLMVetATVvSyYJNjrOBopqdo2sW8J7zCoI7
         Oyrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g21-v6si705743qki.316.2018.05.30.09.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 09:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO3q2-0008J5-Rd
	for alex.bennee@linaro.org; Wed, 30 May 2018 12:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fO3oE-0006zH-0T
	for qemu-arm@nongnu.org; Wed, 30 May 2018 12:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fO3oA-0008Dc-Qa
	for qemu-arm@nongnu.org; Wed, 30 May 2018 12:18:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60010 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fO3oA-0008Cs-Ju; Wed, 30 May 2018 12:18:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03724401EF13;
	Wed, 30 May 2018 16:18:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-212.rdu2.redhat.com
	[10.10.120.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C929C83B6C;
	Wed, 30 May 2018 16:18:35 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-3-git-send-email-eric.auger@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
Date: Wed, 30 May 2018 18:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527690380-9782-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 30 May 2018 16:18:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 30 May 2018 16:18:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Add virt-3.0 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+FhrAL9TZtp

On 05/30/18 16:26, Eric Auger wrote:
> Add virt-3.0 machine type.
> 
> This machine type supports highmem 256MB ECAM by default.
> This feature is disabled for earlier machine types and
> if highmem is off.
> 
> The high 256MB ECAM region is chosen instead of the legacy
> 16MB one if the machine type allows it, if highmem is set
> (LPAE supported by the guest) and (!firmware_loaded || aarch64).
> Indeed aarch32 mode FW may not support this high ECAM region.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> RFC -> v1
> - check firmware_loaded and aarch64 value
> - do all the computation in machvirt_init
> ---
>  hw/arm/virt.c         | 31 ++++++++++++++++++++++++++++---
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d4247d0..83c2b5a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1275,6 +1275,7 @@ static void machvirt_init(MachineState *machine)
>      int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> +    bool aarch64 = true;
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1389,6 +1390,8 @@ static void machvirt_init(MachineState *machine)
>          numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
>                            &error_fatal);
>  
> +        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
> +
>          if (!vms->secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
> @@ -1447,6 +1450,8 @@ static void machvirt_init(MachineState *machine)
>          create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
>      }
>  
> +    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
> +
>      create_rtc(vms, pic);
>  
>      create_pcie(vms, pic);
> @@ -1697,7 +1702,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> -static void virt_2_12_instance_init(Object *obj)
> +static void virt_3_0_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> @@ -1740,6 +1745,8 @@ static void virt_2_12_instance_init(Object *obj)
>                                      "Set GIC version. "
>                                      "Valid values are 2, 3 and host", NULL);
>  
> +    vms->highmem_ecam = vmc->no_highmem_ecam ? false : true;
> +

I think this should be written as:

    vms->highmem_ecam = !vmc->no_highmem_ecam;

With that change:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Obviously the series has to be reviewed by others as well.

Thanks!
Laszlo


>      if (vmc->no_its) {
>          vms->its = false;
>      } else {
> @@ -1765,10 +1772,28 @@ static void virt_2_12_instance_init(Object *obj)
>      vms->irqmap = a15irqmap;
>  }
>  
> -static void virt_machine_2_12_options(MachineClass *mc)
> +static void virt_machine_3_0_options(MachineClass *mc)
>  {
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
> +DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
> +
> +#define VIRT_COMPAT_2_12 \
> +    HW_COMPAT_2_12
> +
> +static void virt_2_12_instance_init(Object *obj)
> +{
> +    virt_3_0_instance_init(obj);
> +}
> +
> +static void virt_machine_2_12_options(MachineClass *mc)
> +{
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
> +    virt_machine_3_0_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
> +    vmc->no_highmem_ecam = true;
> +}
> +DEFINE_VIRT_MACHINE(2, 12)
>  
>  #define VIRT_COMPAT_2_11 \
>      HW_COMPAT_2_11
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index e9423a7..10a5c71 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -95,6 +95,7 @@ typedef struct {
>      bool no_pmu;
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
> +    bool no_highmem_ecam;
>  } VirtMachineClass;
>  
>  typedef struct {
> 

