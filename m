Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2055366wrq;
        Thu, 14 Jun 2018 06:45:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL9u4tvAJm1igujq6GyYc20vVqkQpmeDA62C9g/ABub9SKkvmh2XI85uRoNmOy5ep7sIv9k
X-Received: by 2002:ac8:358a:: with SMTP id k10-v6mr2330735qtb.248.1528983928766;
        Thu, 14 Jun 2018 06:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528983928; cv=none;
        d=google.com; s=arc-20160816;
        b=mY+3UrKOTZXT5OhqP32pTlwc7tcY/nBnlcIDnEA/iBEcMF1zbqB5ChK18Esc9/h3XV
         j5Us87J4zH9xkSVPYTbot7uTZQzxdh561R6W32fa3IkNEMrs0v7Z3Ye1pqjaPLfYMhL0
         AA2lMNc+1Nls/tyRK5xbSyiouNSKNCv2Sx3IGU8hDnC8fBINUj6fpZpeiNz78ywxjZJ2
         95I+vPeqYBHfz/JrmVB1cdUMsG5xFJbkksFdVwJrR75kr/1o2xRWZMy0IuE7OEuw0wuI
         uNNzfIKELewebD4RmsvQ1D6CZONLM0oTdZNR6I3o8qBRiJ386hBJTiL1Gy1ulp9PMgEW
         YpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=QY4+kAN2S71+HoNjVvk3/BNlxjtGNHmBz97NxjydxAY=;
        b=NNSbh9OX2wzRHjkZMVsJhV7Sv2txDlk7mB+8rVlAj18NJ5PvSFmId9Jtg2zD3DvhpR
         hD2MxmD83JmbsKgp1T0dTRW0rzIaW5KbiJXshvJSDkQIfQpg7Y6+sLw9DcyI4mk5hG3L
         Ms+fQz7sINXDPuyLVTV1GD9mC1d4Yri8jtlJwpXiaB+P0S0BIEhHDP/E7pX3N/FkDErL
         Ilr7ssE5QpMJQlZQf2oDeYYr2xUtaxi2f5GnI8CjO5FtWk79y41ci87D2IQtfrqbU+82
         fjar+4tE2LIAKBkjoCeKMcxlF1S6/3poex2MVHqr1kNMnXKc3XUhRMrDOjYj1iAQ891E
         jm0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d142-v6si1194027qkg.382.2018.06.14.06.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 06:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTSZ6-0000li-Bi
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 09:45:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSYz-0000kc-7m
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSYx-0003HS-Ud
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:45:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40310 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTSYx-0003HJ-P5; Thu, 14 Jun 2018 09:45:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3243381A8721;
	Thu, 14 Jun 2018 13:45:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596E62017D10;
	Thu, 14 Jun 2018 13:45:17 +0000 (UTC)
Date: Thu, 14 Jun 2018 15:45:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180614134514.fxae6m2ucsfpczpl@kamzik.brq.redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-8-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528879723-24675-8-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 13:45:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 13:45:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/9] hw/arm/virt: Register two
 redistributor regions when necessary
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XGfNkcLG0ySs

On Wed, Jun 13, 2018 at 10:48:41AM +0200, Eric Auger wrote:
> With a VGICv3 KVM device, if the number of vcpus exceeds the
> capacity of the legacy redistributor region (123 redistributors),
> we now attempt to register a second redistributor region. Up to
> 512 redistributors can fit in this latter on top of the 123 allowed
> by the legacy redistributor region.
> 
> Registering this second redistributor region is possible if the
> host kernel supports the following VGICv3 KVM device group/attribute:
> KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION.
> 
> In case the host kernel does not support the registration of several
> redistributor regions and the requested number of vcpus exceeds the
> capacity of the legacy redistributor region, the GICv3 device
> initialization fails with a proper error message and qemu exits.
> 
> At the moment the max number of vcpus still is capped by the
> virt machine class max_cpus.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - remove spare space
> ---
>  hw/arm/virt.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5c02cc5..2a1c0fb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -528,6 +528,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      SysBusDevice *gicbusdev;
>      const char *gictype;
>      int type = vms->gic_version, i;
> +    uint32_t nb_redist_regions = 0;
>  
>      gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
>  
> @@ -547,14 +548,28 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>                      vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
>          uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
>  
> -        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> +        nb_redist_regions = virt_gicv3_redist_region_count(vms);
> +
> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count",
> +                             nb_redist_regions);
>          qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
> +
> +        if (nb_redist_regions == 2) {
> +            uint32_t redist1_capacity =
> +                        vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> +
> +            qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
> +                MIN(smp_cpus - redist0_count, redist1_capacity));
> +        }
>      }
>      qdev_init_nofail(gicdev);
>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
>      if (type == 3) {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
> +        if (nb_redist_regions == 2) {
> +            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].base);
> +        }
>      } else {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>      }
> @@ -1350,6 +1365,7 @@ static void machvirt_init(MachineState *machine)
>       */
>      if (vms->gic_version == 3) {
>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
> +        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
>      } else {
>          virt_max_cpus = GIC_NCPU;
>      }
> -- 
> 2.5.5
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
