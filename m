Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2757777wrg;
        Mon, 13 May 2019 05:44:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEgUB3qRd8ZxkmtH2bhOenV4o/Djp8JeL2jC7v01WmiqcDNwhhcHQJgcH8K8schjD4+9er
X-Received: by 2002:a50:8bbb:: with SMTP id m56mr29541957edm.230.1557751441802;
        Mon, 13 May 2019 05:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751441; cv=none;
        d=google.com; s=arc-20160816;
        b=vo7Q59DXQOjFII5spsFY7ynLmFLA2NVIHQvEn6rm80TXfLyoNgJws22bgjYtukKBwQ
         JT1p61BUkZrBTWhoHXVYtKuPPy3frFw5IUhCQLIVZFziEx33kFxTX6vVwcjTJf5OaKHZ
         reOFfk3t5jtH3lZ0DmkkuEyyPIWQvDwA7xy6H7Yx/vdUCWp9P/8F+xUZK2+t6UJNy2Og
         OFapWr/5NXPvfLv2rC3+9jE251I79Fb/6CAMAW5i3149FsHK98kzUC2cpkeNT8lLjCzi
         /a7890hu1eXfP3oUDrd9AX1/ALKIJuDEAscwc0xQAslnscAiDs8fCjz86640+o1LaBwM
         h6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=rtX0c6XRTCpj6kwf/+8yNwSfCFdLlHh0nLHTEOsN4Ag=;
        b=Di1bp4bYddKBZlSYuBwuKkuZcehUgTlGXePJ+Om7oJ0ojjfXoZsYSpmrFixKktX05L
         CA1RWnO14WEdU4+V/PNJCRC99sA5+ADpxbMoyTWBloRGouk2KaJTjQq6vrLXdsDqEBFJ
         SXrib4icuy9Vh8ayl9qboevaGRqR94pZS1bOMc3P3e9kpEZUrUCqdiEPopNm0wT9YCVn
         uJlqfkPcSoY2flIe45jA41nkTKtOQPStW3q0iF58ar+wBiByqXuNlkPjZWMb3olYRN//
         yIu+pYS0vWk/RjkDvZGH64k68hWWzaEaKU5S9pkOPsdxwqRbI/mbJIMoDJl6Ct5cPj0W
         +epQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id r3si4597405ejj.99.2019.05.13.05.44.01;
        Mon, 13 May 2019 05:44:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B77C380D;
	Mon, 13 May 2019 05:44:00 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1719F3F6C4;
	Mon, 13 May 2019 05:43:58 -0700 (PDT)
Date: Mon, 13 May 2019 13:43:56 +0100
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
Message-ID: <20190513124356.GG28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190512083624.8916-6-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: X3/ZTGeUJFgu

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
> +        reg.addr = (uintptr_t)d;
> +#else
> +        reg.addr = (uintptr_t)q;
> +#endif
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);

Will this silently go wrong if more than one slice is required (i.e.,
the register size grows beyond 8192 bits?)

[...]

Cheers
---Dave
