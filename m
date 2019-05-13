Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2744975wrg;
        Mon, 13 May 2019 05:31:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtJPGfnRIrR9QyaNGdGogCsGkJZsihunuyyvXaXd8qZILZycudjZ5U1kqsDpJiALmlh6Lj
X-Received: by 2002:a17:906:6152:: with SMTP id p18mr21896598ejl.245.1557750676617;
        Mon, 13 May 2019 05:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557750676; cv=none;
        d=google.com; s=arc-20160816;
        b=rs0/5y8JwZxwm8w3QpJu+W5H8Rs4cCCZxaFMB8EzK9yM276TofzAxZ7mO+zom98qSP
         0RUNF9DsbF4QFsjJsB60pDEuL449iwFRgnYSTBMp7xf4iRDgmJ9jzQKEFFKYRwDLZT1g
         yRU+tMJGjU2eG7xxGRM31i4myiYCQbLoLETbWP0wslJqz+4Yn1vKUuJoE0iCaWEZcHs8
         L32DP4b0T6o6yHAa8h5UHgPc3cvmYbb84VpPLvbZ5IGZL6wGmgpZgfKXxK4uvvjuPSUw
         03Z56RI1iR3MxNeylDQPymKqW0CZ4uenkZEUm7fik7l4iDPRmDg5WqBNr7xSgCm2ZKZi
         Cugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=HnMoUj+SOealvX15+XK+KxDMeHkG6iaN+heGplaisI8=;
        b=Y6X7CC8cP4Vif/f5sJ6R19GEW3DO6abBuQIeSA1bIiZxr7dx9AHrYwe0xKfmPkPTQ/
         pLB1mrI6H5xGVCxRdzGTrCoUDMCYHQX+7puPlRnX7K5tpJ099x0l9CKS3tR+ydZt1Tsy
         H5+4QDxAe8aImLqdm7+NeuPpZLa1XLutln/DmHImWKzsPdlIghhRNrayCJFV4FKgIsWm
         ELG8M/Ojn84dA2OPJ18+s2Q11d5R3bRVEQg/yFQyVzyWEqBS/GRjHHMfRP4dX4eWWrY5
         PsdcOiWtWFlenf16R5kbhvbGgY981P70/fQUb1JfdXsvcLJDvK2uTsx/lH1Y8JUwuIs/
         fu4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id j5si2094808ejq.261.2019.05.13.05.31.16;
        Mon, 13 May 2019 05:31:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EE9374;
	Mon, 13 May 2019 05:31:15 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D769C3F6C4;
	Mon, 13 May 2019 05:31:13 -0700 (PDT)
Date: Mon, 13 May 2019 13:31:11 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"abologna@redhat.com" <abologna@redhat.com>
Subject: Re: [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
Message-ID: <20190513123110.GE28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190512083624.8916-6-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: S6wR7jNZmBSG

On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 4 deletions(-)

[...]

> +static int kvm_arch_put_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> +        uint64_t *q = aa64_vfp_qreg(env, n);
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[ARM_MAX_VQ * 2];
> +        int i;
> +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
> +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
> +        }

Out of interest, why do all this swabbing?  It seems expensive.

Cheers
---Dave
