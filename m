Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp987258njh;
        Mon, 12 Aug 2024 18:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGVtTV1LeClKnAFmGa5LIffoFt5/4ScIUmz1eGWedeu2ZdD3EQsZa8Sye2i0KHMTKJcdwyKiZ0edMmG0k03ParZ4BhTfb+
X-Google-Smtp-Source: AGHT+IEItZGBOyYuAZsFGu30t94a0eeNdeoKgnneiYtJYFkBONN2WnliSS1WH63rfGrDzjIRTIQi
X-Received: by 2002:a17:902:e5c1:b0:1fd:70c4:8389 with SMTP id d9443c01a7336-201ca129b17mr21524035ad.7.1723513684975;
        Mon, 12 Aug 2024 18:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723513684; cv=none;
        d=google.com; s=arc-20160816;
        b=UCqo/behBm4f1QQjPw7b62C0IFbwCXM0GAuV0bjkzW0shX7WcnwA4m3ZlzNmemjHmj
         X4R4oHGjVilTo5yoD1xtVJeuQfWeLHb0lQMkexueFErvUfIQ86w1ySoUYW8R58+fFJTZ
         n83vMr50kfzQem7wLRyGpTbVTTRMgyesMGIRKjGaPW5BK8/JKra+igLECaaArTMzE0h8
         74mswLa+r+R27/tznwz6k8io/heM4n8VVJetKndu6oANiL9qaq/x8aSkhlu/lvENcP76
         N8gTM1QQ/1F/DAaB8O1PhKU/ZBCaKiN/OBqdFOEJT5J+SP1iKYV1CSeOubMJ30Th4rVc
         KqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=S23CAiqDOo7tUZeWOwqXKd581ZE1WFq2Gp4wNIpYVxM=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=q/LeCAGmxsNojin6ubi8rZub0t6QlSx4snVjVL38SYrMFrjOZjgnsGGQBuTazE52AN
         gH6opd3l9sQXaWQ2VWYNx/R3UGvMq+sTXNsI4YvHAMdQoVADPNlXJ9jBM5GUcTBgQKk4
         ThV2fBeK8pZpptHXcaqiALuaM2TuuoIoT3rbTiHow2ZLCXUcEef5zhS1DELKZUI8iqno
         sai/91r+5Ux/FVBd+wnDVv7ta+kNnrg0QaatIQXtKoSkDA7t+qhE6ZzVr5ZrBwiQ7KT2
         nXBlU9b12dtaElj+uK0Ftd1ZVjgnJh1YJTDmJ/cdM+NnPImmZM3mZllOtByt3AKFDVM5
         qSpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uEeLSfLH;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from sin.source.kernel.org (sin.source.kernel.org. [145.40.73.55])
        by mx.google.com with ESMTPS id d9443c01a7336-201cd132589si6408315ad.1.2024.08.12.18.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) client-ip=145.40.73.55;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uEeLSfLH;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A5F60CE1153;
	Tue, 13 Aug 2024 01:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CACC4AF09;
	Tue, 13 Aug 2024 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513682;
	bh=VkK9y3PftMujevNgRvLFeHhq9QPvuE6tdab0J9rfRrQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uEeLSfLHcLEgcCu0BjrGZDwg1HpxlafoArMgDFX7h2PUDazcstMjFJVFo9gArJXH9
	 AwU66a/gXHvf4ey3lfyNuynXq8IXsgRRihLrK4FBpZ/lm3STkUy8W8DU1Hzu2lAq/8
	 KCzrRWXk9eS+WizWjlNg6bnW7O4gw9tpWKt6zp6F5OmKS/VK2psZ+01bv2B0d/wo4S
	 ZUQ8sKnhyMGvK2hxoH1JvbHT4OxtEmrs7lCqljTelHTep9nEHkPbweg53AlXcl855i
	 S3xYjYgQ8qXps0jq+zd8DblXZ7Ashp+HJxnlos8sg+t0l5SBqzys3gtlKKEs5w0tyg
	 BEvEv7QJ5tLFw==
Date: Mon, 12 Aug 2024 18:48:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 06/10] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
In-Reply-To: <20240812130606.90410-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121812210.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: wQVi+syqge0p

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Rename xen_arm.c -> xen-pvh.c to better express that this
> is a PVH machine and to align with x86 HVM and future PVH
> machine filenames:
> hw/i386/xen/xen-hvm.c
> hw/i386/xen/xen-pvh.c (in preparation)
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/meson.build              | 2 +-
>  hw/arm/{xen_arm.c => xen-pvh.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 0c07ab522f..769fe9ec1a 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -59,7 +59,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> -arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen-pvh.c'))
>  
>  system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>  system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
> similarity index 100%
> rename from hw/arm/xen_arm.c
> rename to hw/arm/xen-pvh.c
> -- 
> 2.43.0
> 
