Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp986788njh;
        Mon, 12 Aug 2024 18:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUL6tEaNHt67nm5JSg7li0p5EK7Gt62VGh/d6u3w37/G8gf67VKncno4sFEmdOqwmsC5gv+G5kWgRCBcYKz6iaJXLc4cnE
X-Google-Smtp-Source: AGHT+IFAUB8+KrX+yiZqVpYGC7avKDotSHUVvGiOEBrYrZpSnCQuR81r7hLqsYaJguOO0LntULad
X-Received: by 2002:a05:6870:2407:b0:268:3afe:54f with SMTP id 586e51a60fabf-26fcb69132emr2513845fac.11.1723513558106;
        Mon, 12 Aug 2024 18:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723513558; cv=none;
        d=google.com; s=arc-20160816;
        b=yz28XUO4wltV5kikdJb8Q4yvjmAkrMySEkNN/UahJLv3xg5/uoEpaT5PncpNh4A5x1
         0PLesMimT+u1iW+witRWpSncGPodvSwC7t6QyHe8b4pa73QSblOUHO0p24An4G/tHYmM
         FJda1ghDg0GRJkK614/5YrsEjOVp1aZH2iVHxVXOStPY+r6x4QTrzcEYnM+iR8VP9+Sm
         9JkW4XYjjgPtNOgKr3wn9r7xcQOohI70eKoT0bNIVK/lt9hTK9wGDB9tYKRzhYrHpbJa
         HxYGDn4blUfdjVKoptf1Sea9uPvGRjyUQn70FLg6C82iY2mAlR9pVHwVtpXBxk6mHsyJ
         6Rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=oihBt0ygQnlaX3pL8gqjzoWN8tM4VFTv0fcp9B5+JIU=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=kSPu9bzZ9oawMWOSeMaTzs6rhOrS2HNfZte3R1H2N2OrrFe17qSKfs2KGkkhVxa0h/
         l4ltdbJQbMIM03KaQt/IxfQD+TGS+NS5EP3uZPcJ9GkDcPHi4PiWNgw7eJb7jxIV00vF
         ytV65nGiSJTUktoLAVsPud+yHAtqjtnNyyhblkW8/eWMeWlNNkF+gFfRL3AKbshXZ0uI
         2QIBA6EtRhP240pSF0LuwtmX4taUQH2gIiJ8WwH46QDOWXSOVaHzDqwnEyccKDiU/rXf
         wQJIcAwumfh+NxriYRvhBHjgZez6uGCmEBBbxRqyMNE2b5oN+1Ilq9jcTDdGqHAd8IUY
         1TOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ilrZNn1T;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id 586e51a60fabf-26c7201e7c4si3117191fac.53.2024.08.12.18.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ilrZNn1T;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE593614F9;
	Tue, 13 Aug 2024 01:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C6FC4AF09;
	Tue, 13 Aug 2024 01:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513557;
	bh=c7qNRpyDUtvju/qAk+YMAJaPGvskpjD01S2agnEPCiQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ilrZNn1Te05ZkG2uzeYAKdlwv80dCsj2//lN8yzLyuVj3U/Qyj7iqwjWW4+6Ro42A
	 IWzDqc2V3vtHcBfR1AoBMwl3cFrGLVP041j8EVPqhDA2yH+bq7agTFsbxsTqrx42tq
	 DG3R1GKtLEIhbFK3vPbIDKPGuC0h3WW7ptTqKMpC/FU1a+bazY2t1lnkzKFQFFAJT9
	 9t8u+tgiP3xY+tvMwjuW+BFptD2aFkutHgPHIestZf+yWGiqFAjvHK5wIaH3NWHvl9
	 nuvaMGxA33Mh92kR7w62I+He8YnVAtNXACPTIA99bO8tTcbXotSTuuk4pEPTyA+pky
	 fcVOQAqxDiLXw==
Date: Mon, 12 Aug 2024 18:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 03/10] hw/arm: xenpvh: Tweak machine description
In-Reply-To: <20240812130606.90410-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121647440.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: c061sQNOPRHJ

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Tweak machine description to better express that this is
> a Xen PVH machine for ARM.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 766a194fa1..5f75cc3779 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>  {
>  
>      MachineClass *mc = MACHINE_CLASS(oc);
> -    mc->desc = "Xen Para-virtualized PC";
> +    mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
>      mc->max_cpus = 1;
>      mc->default_machine_opts = "accel=xen";
> -- 
> 2.43.0
> 
