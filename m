Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp101665njb;
        Tue, 20 Aug 2024 17:56:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq9EWvdkCcqsNbClOAwiskygJv0Z1ZNbjoG/T75mCAakGReacAKt2qVgsrIQrLsnoA1ZBpKirm4rm4Yg==@linaro.org
X-Google-Smtp-Source: AGHT+IEy3v0Q+g1BeDzPU4zq7kI8Hg3fZrQUrC89NBro8ObO887aDs4uAyfZJmyFU1AkgCxKwkcR
X-Received: by 2002:a05:6808:1b27:b0:3db:284d:976c with SMTP id 5614622812f47-3de194fba0emr1281353b6e.11.1724201806706;
        Tue, 20 Aug 2024 17:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724201806; cv=none;
        d=google.com; s=arc-20160816;
        b=MdgBFvWQb9gB75whLKw28jjyzHqW3VAjg/uLQiQ2AnZ20Or6NhuZ8oAsl6AIwa5JCR
         EzzNIiOHliILu942TQERsZs7jpJBoQlckqcxo2dms7QJNaX1w1eTMcu5VEayBmb7Z/j1
         Nmbezr0+fbwR+bOD4EN7XPVmdVVGKtDDrf47Qa0iTo4JdX2edRkzjkAOa9tgtFsbAM+w
         X9wF1iUkHar+2HdGl/U9iXRbLArxZaKEdDUaT38Uevb7oT69JNAEStHvtuh1lYPwbz7N
         hX5I7A/1PjqHvH0CkYdtgB7GlZU/a3SSm0O8oI6u3z0VQx3J1eWbZfZFegg3PWqKY5aI
         lI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=23UeDdo1sSY3kbI6iGIzhQb32owU91hFPQl2vZKDATI=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=yMBIWYdPXpgi+7v0ARuj6XWKwUX/NwhjruPduM4FsoUyjXnIK4tztGciErM03u5Acc
         qPBgPyZyxKtNDT5kKIY3J1PSJ/8gkteJA4viZLJDvmEoHB67WkzlhR3VyG/MiIFtQytn
         lhAMBuxHpa5ay8R+51XuKWY8ixGrLAhyKSLfxb3MGuMFM8vtcZGxRkuu9Qimh06ECZ5p
         BHxgWmmzLTw36iNGUh0SD0t4NO4CwONHFGTGda12DJWX5Xj8wJ6qeHNyFdvVqV+cayFc
         zpSKRiIhN2K/3tDTOPFau2KLNFPaNsIolXkQ0xm61dlGnfL1eZ5iNEweZz3xDLV4nDiv
         XwUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OoEY54OX;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 5614622812f47-3dd33dbf872si5934203b6e.231.2024.08.20.17.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 17:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OoEY54OX;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A97A60F81;
	Wed, 21 Aug 2024 00:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC82C4AF0F;
	Wed, 21 Aug 2024 00:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724201806;
	bh=iP+o8FjrkW5d8IANhD6wo3Kazu6e02UnaUSXg3Ib1MY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OoEY54OXyjObjVuSMgqtFJw+/EIe5484piVfBINT8oGtG27p2BR0tx9cSSwJQJ2vq
	 1ZHDBUW+tC5wVL5ZApWW7YiXtT5EyAeUgKppKLh/8CJhfuLpXmOoTkFdGybIy11GmQ
	 aZtNPVAga6FFaaUZwUuoxrCAaOQ+NmqkRjI9ibuVdPMIVhQ0qCjjL1/k8TzVIy1KBA
	 rD2Zsk+iE/B8oD+g41hGq8GTEVpyCSYTQy3z0v+Vo9GxsDxlZVs9rHNZGyJ31JrRxL
	 RBvP+AM+6pks3qAbPC0iwRUBKVdc1irT2h7wZ5/7EEoNer6HjoBFQmAxXsuNiVcynY
	 9TcTTIu9iWp8g==
Date: Tue, 20 Aug 2024 17:56:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 05/12] hw/arm: xenpvh: Remove double-negation in
 warning
In-Reply-To: <20240820142949.533381-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201756360.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: 01EjKH9YuskM

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index fda65d0d8d..16b3f00992 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
>      xam->state =  g_new0(XenIOState, 1);
>  
>      if (machine->ram_size == 0) {
> -        warn_report("%s non-zero ram size not specified. QEMU machine started"
> +        warn_report("%s: ram size not specified. QEMU machine started"
>                      " without IOREQ (no emulated devices including virtio)",
>                      MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
>          return;
> -- 
> 2.43.0
> 
