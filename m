Received: by 10.28.71.155 with SMTP id m27csp772306wmi;
        Fri, 13 Apr 2018 06:42:08 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48VTEvQgf55K1E/IauYfYmTxP5ZDRPveDztRcN0jL4RLeTs/T7b+GqPvAbzfqdz98gMf1tr
X-Received: by 10.13.252.68 with SMTP id m65mr4606411ywf.315.1523626928872;
        Fri, 13 Apr 2018 06:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626928; cv=none;
        d=google.com; s=arc-20160816;
        b=s+//1LQeblavY5QSXKIEbR5f6Xiekv0BZrOBHRUCJOCFabweqVpcbgwtr85f2UpsVa
         v2fB95XtLDKA3AP5TSEkx11a8t+2GidxpMp3sKurJL8CqVVl8E/W8fwYYPJ/I9WQqkeQ
         48PNrc1euLBSpZPBFhxHLSlVjXqQtaGO37aquk9xiOlWUPl1zb8cLbOVmTdxdRDwlXx+
         AJNpY0Cv+iCrzVJ87GrjekvOWAM0X5JmhFUl/J547ozsiddEv0khRvc07BBgh0XRjPY1
         /P+JFr3DrkQ0Yqzd34kbMZdnJVbapAirB/xMBIKqZp88lhsCY8KdQyYgKptKGe4Xs8Wc
         BgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+/CTy9PLX/hXbUy+2fMpEYt65OLeD5vG1LT4On0/y+E=;
        b=lF+3RqR0VCk+MsvTVMSSsSOEHi7GjQwTvvpj2Z3/ddRJZbb8pjUCNB4WWdk3IaJwY0
         rrmcui3j0PVgl1TSv7bHlkSxRw9ZAVIF/rEPub0tvgY5A2EjzM0g59OIg0Y2obl57GZl
         K6bOSZtZ+1RfGEC69m+bmZPxuOPRBeatl8lH+LEJnfRPw8lQ2oTiNT5hQ0Qvzb5h0F3/
         RAacQJwKXJ/AoipJ9+FSn9g/L397OWmOPfVtT2dPcueYNFA2GN4qy1jQr26oOQwkuVeN
         jERqIKh+NmQUT5iTeXykaBh6Hr8CdHlwuSkf6h66f3lf750vnjdt03R+TSq5j9dKku5c
         IxWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7/Fi5/P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si725870qkb.402.2018.04.13.06.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7/Fi5/P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6yxs-0004kc-AV
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:42:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6yxi-0004jE-CW
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6yxh-0004Xt-Bi
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:41:58 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6yxh-0004XW-5J
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:41:57 -0400
Received: by mail-oi0-x244.google.com with SMTP id q71-v6so8385343oic.6
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 06:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+/CTy9PLX/hXbUy+2fMpEYt65OLeD5vG1LT4On0/y+E=;
	b=P7/Fi5/P0oAiVmZqFtj+dW0z9MgIHptyAG9ZJO07ONgV2b24Qh4Q0Aad7RFXC0Ya6T
	2MTOYivZ5+jRE9fFZq9UIZ+bVxmAXPpFHzQVvp2h7qdZHDs44bLa//lvjLGnGsnv/pTI
	T82cpHDtglg3gKGLe7JnuMat0Qyi7IUwgvvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+/CTy9PLX/hXbUy+2fMpEYt65OLeD5vG1LT4On0/y+E=;
	b=c/baeMlDZW40nPX5UA1dspvnszFllQByVwG9ASICgZfIycykai/Nh5x3wp5zaAR4IL
	TSyRdAmqxsmJVU02j9mmj1Y56hr1c4H4hqcWsbBfNjZxIThlPvNibPTthbuLAI0VKR62
	oHL4/dd9gNi9X9gUFs7Smg8SDxlXbE327m4EWuhVZlYv17c7GuS+WS49R00/ZU+bvTwV
	mQha64JfTTV7S5O4he9cr6ZxkZGYKgieVkQ86HQF5nr9m+Vmm1MNHKG3tazcuZt8H5RQ
	Tj3Sden4FPuGH/7tjGoXvNXbPMEbBNM45DS1joiuvBjt4rNN1zd8P7v1S1LG6+w+PP7J
	dLjw==
X-Gm-Message-State: ALQs6tC9ipn8z6nB7IT/UZnIsiVXTk1WN/MrrwyDm0loqm9wdGo92FEi
	2Fx7FNQXZwgHnf6t/AAzM8O223dzi3ObJUzPmVESdw==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr8106209oig.164.1523626916485; 
	Fri, 13 Apr 2018 06:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 06:41:36
	-0700 (PDT)
In-Reply-To: <1522160122-10744-9-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 14:41:36 +0100
Message-ID: <CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
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
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fGkCStU+kqAV

On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
> With KVM acceleration and if KVM VGICV3 supports to set multiple
> redistributor regions, we now allow up to 512 vcpus.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c         | 17 ++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8258f6f..cdb1a75 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -149,8 +149,10 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },

Maybe we should make the 2nd redist region go up to a slightly
rounder address rather than making it exactly big enough to get
us up to 512 CPUs? (Why 512, by the way?)

>      /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x8000000000ULL, 0x8000000000ULL },
>  };
>
>  static const int a15irqmap[] = {
> @@ -553,6 +555,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>          agcc->register_redist_region((GICv3State *)gicdev,
>                                   vms->memmap[VIRT_GIC_REDIST].base,
>                                   vms->memmap[VIRT_GIC_REDIST].size >> 17);
> +        if (vms->smp_cpus > 123) {
> +            agcc->register_redist_region((GICv3State *)gicdev,
> +                     vms->memmap[VIRT_GIC_REDIST2].base,
> +                                 vms->memmap[VIRT_GIC_REDIST2].size >> 17);
> +        }
>      } else {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>      }
> @@ -1284,6 +1291,14 @@ static void machvirt_init(MachineState *machine)
>       */
>      if (vms->gic_version == 3) {
>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
> +        if (kvm_max_vcpus(kvm_state) > 255) {
> +            /*
> +             * VGICv3 KVM device capability to set multiple redistributor
> +             * was introduced at the same time KVM_MAX_VCPUS was bumped
> +             * from 255 to 512
> +             */
> +            virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;

I think it would be better to explicitly check "do we have
support for split redistributors" rather than looking at
KVM_MAX_VCPUS. It's not impossible that a distro kernel
might have chosen to backport support for one but not the
other.

> +        }
>      } else {
>          virt_max_cpus = GIC_NCPU;
>      }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index d168291..801a4ad 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -60,6 +60,7 @@ enum {
>      VIRT_GIC_V2M,
>      VIRT_GIC_ITS,
>      VIRT_GIC_REDIST,
> +    VIRT_GIC_REDIST2,
>      VIRT_UART,
>      VIRT_MMIO,
>      VIRT_RTC,
> --
> 2.5.5

thanks
-- PMM
