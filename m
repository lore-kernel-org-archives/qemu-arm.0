Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1446312wme;
        Tue, 22 May 2018 05:43:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo3VAeRQDZz2nSZwkGjr16rkvtzorSXuZtsC74bBVvaF7QgymKPND/Z0yyndPkfudVFYonR
X-Received: by 2002:ae9:dd41:: with SMTP id r62-v6mr18566410qkf.346.1526993023608;
        Tue, 22 May 2018 05:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526993023; cv=none;
        d=google.com; s=arc-20160816;
        b=gkO0uNoBw7/0kOPPlUWwjCb7akOB7CZF0ypPVqqojGMaJtfnkUghJ1An7xHbW+Noel
         XneorYpUskT1FuRtHs9uRvRI2SkJkj9AVy23MLQxgHh/5mMp7b8u/qzj8/zpxcvQ68xw
         VLLbI4T0VvAFBFXMJcxl5jt4w1zRwAPmYHGiBpWN3ygH0zdcCJvKVhwAfOYvbMmb5eRY
         6/GRs5WuP2bvNagVSqOsD7eCRlZvZVZIP2ibnt293AUv3R1HyAOfKX7T8ItNlKyk6EfZ
         g8t1OmKXwuhnqqjYCdyK5KdI94+ZSWvLCJQz0Ml6cWuQZ/PokpK+uzol8iodFX/s2Fkj
         KAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eA/JWz+aPjF5AOXODiHGNS6bMjwCVJAkb3z2kQzUG7c=;
        b=lcku06BosjjLFwP+1/bWwOtYjLfISEoCuLSXE4tLYWjc7+hNFTfiabnkUbvntZWx0M
         nX4xiImrZqkRsMJkyhOCLxaoI4EoamkLZpcq2elz1pWtKNlfEd5Zim7f6guoVuPb6Ik+
         qInJzP6A8B76jCi5dwPrH+f31mZT56kIt/3Ecejt3FtQf1W7yoWjZ9U0HRwRZ2+48fM1
         FpoytoyQwiiG9nLbMPgRYknlpkmpNvKMmem44lvnd+3X3GjT8oMOpRLik3qYUdg6bhqp
         U7I3z0VuPLSqILnw5jCSE/wsp1+Eg/MID5eF2X+8BJYeP5nTnbowaXi+ccsPvAl1H+Ct
         YBmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJVBz0Dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r41-v6si2349115qtc.165.2018.05.22.05.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJVBz0Dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6dj-0005Gd-3O
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6dV-0005FM-IQ
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6dU-0005N3-LB
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:43:29 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:32965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6dU-0005Mn-Fw
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:43:28 -0400
Received: by mail-oi0-x242.google.com with SMTP id k5-v6so16048618oiw.0
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eA/JWz+aPjF5AOXODiHGNS6bMjwCVJAkb3z2kQzUG7c=;
	b=gJVBz0Dr3T8AeMMhYfemlUbg7getDAVHGBU5R5mrDRzye6dLdzEIGEbmWHbR23/wRq
	xXIRIVO785j+Ug+qrlhOOl8CCzgndCyJXtqbHP8yxRd6BPE37LhBC5smNjhAaR9r5cHG
	sxFsyJkGC7y7Rcrn+DDvUNak/N5N2438nlTTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eA/JWz+aPjF5AOXODiHGNS6bMjwCVJAkb3z2kQzUG7c=;
	b=qQrf7GpJSV/HUoLos2JPWp1dkK1yz7Z8lemP6LRRnkY1n4HelFwLYUUDTanWMFAeSt
	9jyqWszGjii7xCTOJn5qNy1iO2zj5rm2C7brD4bqVsw43YL8fbCrxs6IDp3Odz6D8uGZ
	YI1udeYH+5sCATDSJO3v9hbwF3+txjmcMNgIi+9CXWdnQMLHiDVsm9Xpg9Ojwi29uE8g
	FZbnHPD7njEPkIe+LD+/AIHxolnxKXVZQtECjf4Itga4cq/WYD7FXTNpThD94oBemsUz
	pTr5iYSCL5pWeTP3AC8/bh7U+oIERyiJV77vpzrUMMIQ21QIcC599uXDPWpI79cDAqf1
	HJJg==
X-Gm-Message-State: ALKqPwfWYq1Gg+yTuhyAbQuGsgFQUIKX+Jn7tJhV4AdfcMwhS3BIauBz
	xiNZe9epiIhbd0tzTbg10y5Hv8hHScK7VmWPSqlGrQ==
X-Received: by 2002:aca:b855:: with SMTP id
	i82-v6mr14169826oif.12.1526993007733; 
	Tue, 22 May 2018 05:43:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:43:07
	-0700 (PDT)
In-Reply-To: <1526222114-5324-8-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-8-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:43:07 +0100
Message-ID: <CAFEAcA9772Q3OG-YfzLwGWcZ_L5evC7qP_PXqSi8bVr-p-PhJA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [RFC v2 7/7] hw/arm/virt: Register two redistributor
 regions when necessary
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: By3cJVtOw/kP

On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> With a VGICv3 KVM device, if the number of vcpus exceeds the
> capacity of the legacy redistributor region (123 redistributors),
> we now attempt to register the second redistributor region. This
> extends the number of vcpus to 512 assuming the host kernel supports:
> - up to 512 vcpus
> - VGICv3 KVM device group/attribute:
>   KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION
>
> In case the host kernel does not support the registration of several
> redistributor regions, the GICv3 device initialization fails
> with a proper error message and qemu exits.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f35962a..8d43c51 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -531,6 +531,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      SysBusDevice *gicbusdev;
>      const char *gictype;
>      int type = vms->gic_version, i;
> +    uint32_t nb_redist_regions = 0;
>
>      gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
>
> @@ -546,15 +547,26 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      }
>
>      if (type == 3) {
> -        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> +        nb_redist_regions = virt_gicv3_redist_region_count(vms);
> +
> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count",
> +                             nb_redist_regions);
>          qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
>                               vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
> +
> +        if (nb_redist_regions == 2) {
> +            qdev_prop_set_uint32(gicdev , "redist-region-count[1]",

Stray extra space before comma.

> +                                 vms->memmap[VIRT_GIC_REDIST2].size / 0x20000);

This is going to ask for more redistributors than we want (cf
earlier review comment).

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
> @@ -1346,6 +1358,7 @@ static void machvirt_init(MachineState *machine)
>       */
>      if (vms->gic_version == 3) {
>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
> +        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;

Slight pity that we can't determine whether we can support multiple
redistributor regions here, but I guess it's not a big deal.

>      } else {
>          virt_max_cpus = GIC_NCPU;
>      }
> --
> 2.5.5

thanks
-- PMM
