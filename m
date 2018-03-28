Received: by 10.28.71.155 with SMTP id m27csp7711wmi;
        Tue, 27 Mar 2018 21:02:50 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49HYgQYwXAbjgv7W/ygSWysKGUyUf4hBnwEPAwfJPQySgqLurMUj0gMwMKXgduIxy9h+toy
X-Received: by 10.237.44.164 with SMTP id g33mr3101512qtd.285.1522209770752;
        Tue, 27 Mar 2018 21:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522209770; cv=none;
        d=google.com; s=arc-20160816;
        b=iB6soPeDwv38viXez9NH5hifo4emv+sQr0sneKI3HAsJ/3wsTIYVTQpnhyvw6wDc6a
         vQAHD8tFj07PJtjClCLaEkwahHjxAcLtiJVuirEzy4G1wpsRf7jc8MS9QFabnqfnzb5N
         Z+XLrngd8uJFidviVc1FmyZwhQO3Yqo6w8dHt/CRrdQ1UwISspfqBOgjNVOaXt3fta3e
         m0TQoW7qY05MD5mwbkfaYHd4EG6s9giS0TFebu37sYPBJqnO52m+XVG5Q1p+fG9+yPki
         aDPG6KJgkPA1iV88qO5yuXKl5PDWwUNKRw17/glmKeDQNkzoW1fHuLWgET/siHKYPn6w
         zMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=dqYJvXy8WnhBa/vGOj/iFzatItsuCcjbf1NbRAMN3Dk=;
        b=CEmun/Rt/v10Oq1fnDjC4RzBJJ/ZACyPx1tKBbGOBRMDrMe6/o2qfqZ2b2Wuv8Hy+d
         x18eEG8PWi74o8EhjxPisrFEFrSV1YjZoksfX60EG1d5yNf86mJ2IsR02tsNW3x07Z3P
         74c7nY0M0022TT1aeFWBraUxBDlCy4LvyP3lFnEhk5jXk0ong2AvT3Rhkp76/BR+emZG
         9MxwpDEbRrbf1uJ8yxKGqKmadHkkKcAln7MzL+RUiD1F2VRJJMMB93eOf4/mmb9pEOxn
         mrrE1dbfCsGqw6P/mEP36bWFAf5xgVod65BcGbOTOYKi2/2zxE4H37TldM7HPFpYU+rf
         YVIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si3087707qtz.95.2018.03.27.21.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 21:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f12IU-0008LE-AU
	for alex.bennee@linaro.org; Wed, 28 Mar 2018 00:02:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1f12IJ-0008K6-Dw
	for qemu-arm@nongnu.org; Wed, 28 Mar 2018 00:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1f12IE-0004wm-Ih
	for qemu-arm@nongnu.org; Wed, 28 Mar 2018 00:02:39 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2611 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1f12IE-0004w0-7R; Wed, 28 Mar 2018 00:02:34 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E6C969AF532CF;
	Wed, 28 Mar 2018 12:02:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.361.1; Wed, 28 Mar 2018
	12:02:08 +0800
Message-ID: <5ABB13BC.8060809@huawei.com>
Date: Wed, 28 Mar 2018 12:02:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-9-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ULvf2zaOpRe9



On 2018/3/27 22:15, Eric Auger wrote:
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
One concern that this will limit the guest ram size to RAMLIMIT_BYTES.
If we want to support larger ram size in the future, this may be a problem.

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
> 

-- 
Shannon

