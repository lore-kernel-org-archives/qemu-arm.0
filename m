Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1365477njl;
        Mon, 16 Sep 2024 16:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlLyuzPZJz5qm373ClHvczolT0/0u2Jem0/tmz1dlYIcwbjaY7Mw4W+LVU2FYLtg/tcIjhEKVlnhnD8g==@linaro.org
X-Google-Smtp-Source: AGHT+IHJGvcgHCfhOqwfzuBtTrtGSniTKrpdiN8YQX1xxPIJDf/CGJy/4UhnT7DV8y2VnXaZreSo
X-Received: by 2002:a05:6830:2d8a:b0:710:f926:709c with SMTP id 46e09a7af769-71116c67bf4mr6944990a34.25.1726530616762;
        Mon, 16 Sep 2024 16:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726530616; cv=none;
        d=google.com; s=arc-20240605;
        b=PQXpcgdAajTPh4CfYpwA1lCd4FNU9bBFmLAlWcI8Grt1oMNmUHhTvO/mImbmkkEF35
         wisbs1KSKA/rce1GSrC4ivyY7pCCXVYQ1/T5I/eIKc5SSFl7nbBwSvx/3/tksxh5BFMD
         7NtrHmSLJJxTndQyKubW3CezJ6yzv8osUUz2frXDziBRNFgKnFUm/IIzotrVs/IQRZ3/
         EVqz8YSnl/OGEEyN8d0LtUOqXCoIBd/Bl/i6KfqOuNzqVvUR/KOjtzwF5PdvJatk8aCR
         p4AV51byZR7YVQulullUWMjVl2iO+rIEpNyRoFmkz/bMFSaKXG7PEbVKENAqNcakJ34/
         LkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=uyqzA7rNpcKMNqei5JFZog+aPJ2g+DIynsOh2DW/nEY=;
        fh=ZEuEjXPqpFtr5zJEqku2PXYCgKV/36FA5A0e7PvRSpg=;
        b=PnP27e7rZKMiJGTPk+2KmyKR/0kZrvin+Kbf/h/N2fFV2YeZAKQ0XJwA8Qy4x/v61C
         kWsEwHC7kpY7Tt2pPE2k76rLAK2Cyb5x/UqGMyl1y7cjoX6Ym+Zwo1zwOitqGbnRCXUm
         982+a9wd9Qo3cDHvBpqjlcvdDQYEsSufXG6c80/ZRU/r5kKFIiRkNk1jd1tOUI4GHGSB
         53FkIXWPkeKMgnIgBn8PDGwK1Bh1CRchmKOiHT1QvSzQh4HFX6Kds77DvozUNMGqNTBi
         J5LPLZoGhCinA0HJXxg0nX2ol0LYLN6HY7INHbnB/fehn1NPu38BST7Okqdc/us01Fk1
         PiDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RGB2J96z;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id 46e09a7af769-71239f7073fsi2598734a34.347.2024.09.16.16.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 16:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RGB2J96z;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B23245C3114;
	Mon, 16 Sep 2024 23:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154FDC4CEC4;
	Mon, 16 Sep 2024 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726530616;
	bh=EcihBU2MW+o0k8STiYL5wfgfRi+z+e3ydSW7l+a5gAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RGB2J96z0XM6/2N1YgdJL1hrET9dwWbaDhoLTvF8NJVBBzsOIyCxVhID0f9Mm7/FI
	 MDo1dFqc2ihsQb+75KauXTS95u5y7oB7kHJmJ8qMOv8nogC7ApweXU5PWRTKrTJmKE
	 azIVOi20Ms9eLdjkPk9P9apALizLi5pnnfCeq5+PgYXW9V2UT0yYWQdaRsX13sOmq1
	 KXrKpowqs+eUrVw1K5icr9oY6KsCKXROLDykw+7TaV3Aa9ntu0FHeOvv5ND1S1MtDZ
	 FgW1X7STNq2ASK9rVzamI1jlbQulGfwtsbf0dJ7EJZzgndGWQg8LL4YmVGQ9Zaewpx
	 BQmMWPto4BNxA==
Date: Mon, 16 Sep 2024 16:50:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org
Subject: Re: [PATCH v1 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
In-Reply-To: <20240916150853.1216703-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409161649590.1417852@ubuntu-linux-20-04-desktop>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com> <20240916150853.1216703-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: AW9r+mPwDuYL

On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Enable PCI support for the ARM Xen PVH machine.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen-pvh.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 28af3910ea..33f0dd5982 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -39,6 +39,16 @@ static void xen_arm_instance_init(Object *obj)
>                                           VIRTIO_MMIO_DEV_SIZE };
>  }
>  
> +static void xen_pvh_set_pci_intx_irq(void *opaque, int intx_irq, int level)
> +{
> +    XenPVHMachineState *s = XEN_PVH_MACHINE(opaque);
> +    int irq = s->cfg.pci_intx_irq_base + intx_irq;
> +
> +    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> +        error_report("xendevicemodel_set_pci_intx_level failed");
> +    }
> +}
> +
>  static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>  {
>      XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
> @@ -69,7 +79,11 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      /* Xen/ARM does not use buffered IOREQs.  */
>      xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
>  
> +    /* PCI INTX delivery.  */
> +    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
> +
>      /* List of supported features known to work on PVH ARM.  */
> +    xpc->has_pci = true;
>      xpc->has_tpm = true;
>      xpc->has_virtio_mmio = true;
>  
> -- 
> 2.43.0
> 
