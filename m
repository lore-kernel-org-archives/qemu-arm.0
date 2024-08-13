Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp987122njh;
        Mon, 12 Aug 2024 18:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULI6MZpHxF8Y55gU+n6GY72rZ+pMKTCfQuY7FZBHKc8mcvdr+cmgDFwsn3+Zq7APBiG2sbPy+L+xFSkLSZI4AxsIo+yKCQ
X-Google-Smtp-Source: AGHT+IEV4cAaCK8nIjo4a09rS3qUNWip1wnoaECq1ig8s/+rs32N+yNDNCq+CWjNx9KyWs4nD7cT
X-Received: by 2002:a05:6820:821:b0:5d5:a28b:f4a3 with SMTP id 006d021491bc7-5da689dac53mr2894945eaf.7.1723513640853;
        Mon, 12 Aug 2024 18:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723513640; cv=none;
        d=google.com; s=arc-20160816;
        b=XXfKuKFLYdVoCvzQvwpXtw+hTPeAYANQKB9zmbTq25xyr3m/bXDV9pCqOkX+wByCDu
         PMrC2z9oo0ndv5K8FKKj8bgl21/CcGl+C50kjqteD6Uxh8vawZa58vxO9L++/or+xWCU
         DUhYC0Dn6II7uhdHNO1zSDNHxFkAceeSbeGVXGGDlE57rqhi0QXB6wkpGH32mZ2N8TMf
         5JphzSHNvxNXR8yrmlqhqZZzOeTdVsjO5/Y1kPjM3D2vLnC7vaI/kX0LDhp2tkMpWl1T
         D5hyZN1A7r7osAxO2fbnPe6Wf3WdXtR6ZVboqK4YgRBdujURm3BK77zrPsj/IgjMrVmJ
         G5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=1yc6eVSqXKfhxfQsKc+fh4sdFmxvfK5uQIuLddHnAqY=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=iYLkwK+WgP92oioQZuByC0JxFNoV0Pt6pxfTUGn0tZ7x7NfwHEP5e/pFOS48ujk1+M
         /aRLixLBBObVXgdaZ55dw7IxD1MbgVYE8KNYc+MyfQ5A48cUTSgKjXGihKVQkhNcWZnh
         MXVkA1aMTjuW23hiStV4e06M/92EGsLim1JBtZh6pZGL/a5/ZAMHgDHEziZPhcx4I5Dt
         LkwAaa7DXQUc4DWslG2aVsVx0ru2oN12rEqSWV1l+M1UYqPhpNLrKtbf5ynLYUPXlQeR
         pVc6gplB6SATVPl0H+1kFjw6zR5wy22Ov2B/U2OfBAhRqn2vvc9/uzgPkPqf1NeA7Mp3
         EVlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=urp84KlH;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 006d021491bc7-5da3e77faa2si2761050eaf.79.2024.08.12.18.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=urp84KlH;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F0B06151C;
	Tue, 13 Aug 2024 01:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFBC4AF0D;
	Tue, 13 Aug 2024 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513640;
	bh=fMn8dtUROSmqJUNq0JhJUJsk6JPdhvOhOc2jEf7/A9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=urp84KlH+9mVHG3gXIHHqyYE9L/j0qFLU5qEooK4sM9aGZ9oCL+FLaJb8+fVvC4Ff
	 CjKD9eBGmyK7Laxkdq085YiJhqISw3IenQHdSrzDE73lgB4+r/SjEakswvLj8GjvWd
	 R8rzz0dNDPzLxTYxYr9Fa9wHC5CIHfjM30QpN30ElK6fn112oU9G5wvxuEu9WHzpoO
	 eayk5KUaukLhOcFkGP7DZhQXGSbLbyTla/XO9ayBaaca2+gqjaYF9NcbFXQnRdSa5U
	 P2Mh8GirKSOPN30GARr/a5FpJ/H4Slslzl8zF4dcYHqEgNE95vTtPsgAOTmLz3kElX
	 7a3GPUSMMxHrQ==
Date: Mon, 12 Aug 2024 18:47:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <20240812130606.90410-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: METyF55eLE0H

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> servers to handle hotplug.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/arm/xen_arm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 5f75cc3779..ef8315969c 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>  
>      xen_init_ram(machine);
>  
> -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
>  
> @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
> -    mc->max_cpus = 1;
> +    /* MAX number of vcpus supported by Xen.  */
> +    mc->max_cpus = GUEST_MAX_VCPUS;

Will this cause allocations of data structures with 128 elements?
Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
later on with the precise vCPU value which should be provided to QEMU
via the -smp command line option
(tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
