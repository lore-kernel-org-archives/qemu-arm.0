Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1429854wme;
        Tue, 22 May 2018 05:28:19 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZovu3flsX7PkRnmUTIhcxvvWes47fMwuU1BFyWxF75w0+rTQ8KKN6wXdwzxCVdKgBZ9SUF7
X-Received: by 2002:ac8:2edc:: with SMTP id i28-v6mr21011818qta.401.1526992099594;
        Tue, 22 May 2018 05:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526992099; cv=none;
        d=google.com; s=arc-20160816;
        b=w3MtPXutukM6c+2KVMVQWuPZbLe9B1xdwrDxZxkqy+d7WqVhlTvSpurRlvngM2dOhd
         P3DlgPon7hCMxcyY1RC4gDyfpV1gJSayrLkulBg4QmLAKKqnDqtuRtVzcH1zcDmgomMG
         VkdPyOY1w861jTT6K7d6K4IdDWF8SLiiiZ42z7tMR0wbkgvJrC2ObR/FAUws3CW2Nwcx
         kqlVDViclp9d2REaODYCN3OU+xF5COofcVnmg0eolSNqSZ+Dm14l9PzGgXQwHfy4Fass
         APa/6b1st6Bs76zO/fXRNYeFkCUG2vPqpNkuVF1LytFtnkfJGHrdKo8GZymJyfsXIwAp
         kvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pcMbbYkIW1hk3SXz2PYlFb9Vv1IhMlCfLsuQZG2inxI=;
        b=TFkF1SpQ59z8aAPz2SgdWyI/8ubrlmG9NbzOQOGPJDxLUvSvVVd/HlA9TnBLfg/4zM
         4tzHyLgi8ofaoojO6RUlLMAuxRH5Z3rgOmjYymrMbojKuOfqVTfqiGMFDjo4t42COkQq
         nBFUVLA6NGWo9CWcWA/rnyRbFPTWbPY/2+o2xjciANIrbnkYJc36e9iYYCsyET0QNnzC
         L3pzaj0lhlO1mFwEJaVdvInQ/QPAuaqYYk8MDPlq8okcNPIGt+vO03mMNn471vbqIpQJ
         SO8K5xQuMddAjkZ3VtbRiGQJn6qy8plslh8sJyeLvvlvMMsQPdT36EbKAJXhuojIlrnX
         XfQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ecwwEuQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2-v6si8266766qvm.227.2018.05.22.05.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ecwwEuQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6Op-0007dJ-3q
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:28:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6Oh-0007d3-1Y
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6Ob-0007GQ-2C
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:28:11 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6Oa-0007G6-Rq
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:28:04 -0400
Received: by mail-ot0-x244.google.com with SMTP id l13-v6so20685561otk.9
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pcMbbYkIW1hk3SXz2PYlFb9Vv1IhMlCfLsuQZG2inxI=;
	b=ecwwEuQICBsIPpPqss6YZptB2lG+XYKDsI8LU12Ual22ynwwrWSEEjcxZkdVunyxjH
	Mfbg+NlZpetlZTEnZDC1sOJQMbJAHicCpyTarvlpYySBOg2Z8yrAy30R2wgjndeasrnz
	uRT7fB9WPPLnnL87rvFYmgixxtd6zXxbAGYPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pcMbbYkIW1hk3SXz2PYlFb9Vv1IhMlCfLsuQZG2inxI=;
	b=QMBo0yE7wAzm4KQqhThmTxELFzFXWbxyOnnBuK/3WJq+1NWbTxgwkSRKR6qn8pjDF3
	kFsUTBR8bRNSKxrPahrIfsHNlIcrK3c8Qv6Zn9s1KPBXD5J/L9h/oE3KGR1Vg0PD2BCI
	IJe3vSemHKmh22GcnxHyqLRIhOKmYiKjaA2WOFJ87sf/HADaJ/apZuG2WyJQcyiAaMn2
	BGm9Sz33kUvT8XDjXgGiMPe0B/YLWHuQVKZnil99mSPPuyY6iz5HC9NGeJG0ueHmTJ/N
	qdwjbm5Tz5+fpxfsJRjvmuGhJJnKaECLuZHuKuAold5U1d2+QdvfpgrBZlZdhPBeMT0K
	1Dfw==
X-Gm-Message-State: ALKqPwcvJ1YwgtQ+uvp9drsnxyb+hdCy3eLqP2Uy/WCMVnwzB/JqeDxu
	2VwEFTU3s5AAAEKKga7kSB2ytYuE6qaPM8VjEXuvaw==
X-Received: by 2002:a9d:2013:: with SMTP id
	n19-v6mr15157882ota.258.1526992084108; 
	Tue, 22 May 2018 05:28:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:27:43
	-0700 (PDT)
In-Reply-To: <1526222114-5324-4-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:27:43 +0100
Message-ID: <CAFEAcA8yo_NKY=mHNYFFTA1+eR-731ePUb5hDum0ubUM2XOxxg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [RFC v2 3/7] hw/intc/arm_gicv3: Introduce
 redist-region-count array property
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
X-TUID: ojrXR4jAnzte

On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> To prepare for multiple redistributor regions, we introduce
> an array of uint32_t properties that stores the redistributor
> count of each redistributor region.
>
> Non accelerated VGICv3 only supports a single redistributor region.
> The capacity of all redist regions is checked against the number of
> vcpus.
>
> Machvirt is updated to set the count to 123 vcpus for the unique
> redistributor region we currently have.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c                      |  6 ++++++
>  hw/intc/arm_gicv3.c                | 11 ++++++++++-
>  hw/intc/arm_gicv3_common.c         | 35 ++++++++++++++++++++++++++++++-----
>  hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
>  include/hw/intc/arm_gicv3_common.h |  6 ++++--
>  5 files changed, 57 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 11b9f59..c9d842d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -525,6 +525,12 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      if (!kvm_irqchip_in_kernel()) {
>          qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
>      }
> +
> +    if (type == 3) {
> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> +        qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
> +                             vms->memmap[VIRT_GIC_REDIST].size / 0x20000);

We used to create a region which had num_cpu redistributors in it;
won't this cause us to create one which has as many redistributors
as will fit in the space ?

> +    }
>      qdev_init_nofail(gicdev);
>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 479c667..38d57ac 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -373,7 +373,16 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> -    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
> +    if (s->nb_redist_regions != 1) {
> +        error_setg(errp, "VGICv3 redist region number(%d) not equal to 1",
> +                   s->nb_redist_regions);

Missing 'return' ?

> +    }
> +
> +    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>
>      gicv3_init_cpuif(s);
>  }
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 7b54d52..f405ae1 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -169,9 +169,10 @@ static const VMStateDescription vmstate_gicv3 = {
>  };
>
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
> -                              const MemoryRegionOps *ops)
> +                              const MemoryRegionOps *ops, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> +    int rdist_capacity = 0;
>      int i;
>
>      /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
> @@ -199,11 +200,25 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>
>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
>                            "gicv3_dist", 0x10000);
> -    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
> -                          "gicv3_redist", 0x20000 * s->num_cpu);
> -
>      sysbus_init_mmio(sbd, &s->iomem_dist);
> -    sysbus_init_mmio(sbd, &s->iomem_redist);
> +
> +    s->iomem_redist = g_new0(MemoryRegion, s->nb_redist_regions);
> +    for (i = 0; i < s->nb_redist_regions; i++) {
> +        char *name = g_strdup_printf("gicv3_redist_region[%d]", i);
> +
> +        memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
> +                              ops ? &ops[1] : NULL, s,
> +                              name, 0x20000 * s->redist_region_count[i]);
> +        sysbus_init_mmio(sbd, &s->iomem_redist[i]);
> +        rdist_capacity += s->redist_region_count[i];
> +        g_free(name);
> +    }
> +    if (rdist_capacity < s->num_cpu) {
> +        error_setg(errp, "Capacity of the redist regions(%d) "
> +                   "is less than number of vcpus(%d)",
> +                   rdist_capacity, s->num_cpu);

It would be better to make this check before we create a lot of
memory regions, I think. (Though I'm very unsure of the rules about
how to unwind what you've done in a realize method that's about to fail;
we probably get it wrong a lot and don't care because realize failure
is fatal for most uses of most devices.)

> +    }
> +
>  }
>
>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)

thanks
-- PMM
