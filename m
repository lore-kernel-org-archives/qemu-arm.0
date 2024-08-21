Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp101544njb;
        Tue, 20 Aug 2024 17:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTY2uic6T4DyEPXUMX13G6iiR6Y60UqS13TZK2odeeTU1U1OH6JiLbWDD47ENQVnRvdzIbkMNISLnveA==@linaro.org
X-Google-Smtp-Source: AGHT+IHyXPTYmirzepGfucaTmZAXf2OHSah2dITC6Iwx1b5JMOCaHNzxK/LuMUvA3GDD/KCLSEz8
X-Received: by 2002:a05:620a:3726:b0:7a1:e9a3:7ed5 with SMTP id af79cd13be357-7a674028608mr138196285a.21.1724201761354;
        Tue, 20 Aug 2024 17:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724201761; cv=none;
        d=google.com; s=arc-20160816;
        b=fedvTDFhN2JUSzznndyG4uoEkTlLGgJ8/2xC8U5xetAujNNr4JtD8QQPDZWFkoXQ5K
         8/ezLrV3mB94eVNd0zJpsmNvn7vqPnN5Lks7WUyr5ZyJJJCRiQ0PKwRY5/kNcaM+VR6j
         RZi4nlTfWCgrzVRQgQ72lj0hSnuGWd/jPf3hSEblvd4dCn3L/l4lt+HdU09wVvBfw1rT
         osBvt74pJuNI/2kaLgJZ1Dl8zD17Fi4gg5DS5XP4wYiYW3OTg2qXOEN730P3EYLGaGDS
         BKWs9UWMTyJ65HnBEy4LNHbLQyPshQrwIzBumOrUcfEWS+CZkNVCdyUZxx+OBdCbgjTB
         E22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=5qJ8oVxo6ieoXhdFct20gUdmfrbXQe98Dm1xu3uXO2w=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=SfAD3j8cGWgW7rHcXaJw3p2djzQxX/wDgD0fVOutzzJuQ/98DNiz++/jRsftxtmGDJ
         cQJIRYbRlMsm6bfwNxfnajasfFVcON/yWmWfSzMy/GlN7xb1LBwIYUrudRTBnYUYGFz/
         r213DddXGAVHaeXNpF4k+GfLKwnRdjFSl+LuDVc1BmJtp0cs23gPxVl68TUaWVeoZdoV
         cZ/56i88zcEARscJ20eEynkcMmSa06CcJL5AdYi045HsLPKq4//XDda+wWNyJNyf7gux
         bOf+4qJ0qPQuw2Y18rc0vw+ThWqM/mzeaKjKRGuBbuyhTSSlRglZrZzSdhw3w7YnCf6m
         MHAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iI83DkJv;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [2604:1380:45d1:ec00::3])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff124952si1437810585a.714.2024.08.20.17.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 17:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) client-ip=2604:1380:45d1:ec00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iI83DkJv;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28EFAA40BDC;
	Wed, 21 Aug 2024 00:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAACC4AF0B;
	Wed, 21 Aug 2024 00:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724201760;
	bh=zt+bRCw1JFD/aYFu4ktsx31ttxki0L5FzmNifjsxUGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iI83DkJv6j8k3NwYp3USCf0B3ZclwH5Y1YWOB1Tna4gSgKqk2zmAd9N/mD4VDBvvv
	 +A/jNt2WgABrEJ6EE4SmE64oNTLlJGfTs5oPUgirlfbd/Hv21IJkKvnlDuxHBJKute
	 ki2g/3OvEer63dOW0xuoNak1WYxdb1mtUTu+nNKKY8lMCxHe2PHkHvjgSiPnvWlVJd
	 ukCOwkU1Wu7xfKiF+GlqYB0GMs5ZcBSEFaCSH5IcbzLAuka3BmMMc+Kh7mcznbcVFi
	 CNB+f8ZQFX+qGhDUXztlAUrsKzsfMGlSw8VqKXqUvFt7l6UV7+uFPZWqdn26jRSQmp
	 gBmwgbn77MXbA==
Date: Tue, 20 Aug 2024 17:55:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 04/12] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <20240820142949.533381-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201755430.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: AVTdWpk85oQc

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add SMP support for Xen PVH ARM guests.
> Create ms->smp.max_cpus ioreq servers to handle hotplug.
> 
> Note that ms->smp.max_cpus will be passed to us by the
> user (Xen tools) set to the guests maxvcpus.
> 
> The value in mc->max_cpus is an absolute maximum for the
> -smp option and won't be used to setup ioreq servers unless
> the user explicitly specifies it with -smp.
> 
> If the user doesn't pass -smp on the command-line, smp.cpus
> and smp.max_cpus will default to 1.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 5f75cc3779..fda65d0d8d 100644
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
> @@ -218,7 +218,26 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
> -    mc->max_cpus = 1;
> +
> +    /*
> +     * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
> +     *
> +     * 1. If users don't pass any -smp option:
> +     *   ms->smp.cpus will default to 1.
> +     *   ms->smp.max_cpus will default to 1.
> +     *
> +     * 2. If users pass -smp X:
> +     *   ms->smp.cpus will be set to X.
> +     *   ms->smp.max_cpus will also be set to X.
> +     *
> +     * 3. If users pass -smp X,maxcpus=Y:
> +     *   ms->smp.cpus will be set to X.
> +     *   ms->smp.max_cpus will be set to Y.
> +     *
> +     * In scenarios 2 and 3, if X or Y are set to something larger than
> +     * mc->max_cpus, QEMU will bail out with an error message.
> +     */
> +    mc->max_cpus = GUEST_MAX_VCPUS;
>      mc->default_machine_opts = "accel=xen";
>      /* Set explicitly here to make sure that real ram_size is passed */
>      mc->default_ram_size = 0;
> -- 
> 2.43.0
> 
