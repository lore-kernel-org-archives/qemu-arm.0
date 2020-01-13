Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4366445lff;
        Mon, 13 Jan 2020 08:54:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYVYEGR6PMTI8k7W3nrS2JzLIcgNmX1cE6nsBUCG5yrJ3e0gl0ebeYP3OCukp9ey8AOb6X
X-Received: by 2002:a9d:10b:: with SMTP id 11mr13919110otu.222.1578934439768;
        Mon, 13 Jan 2020 08:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578934439; cv=none;
        d=google.com; s=arc-20160816;
        b=d+frECTHl562XselAJt9c6dbv1xWr+3gH5ltMX2L6vt20bXs1kXp+Wt+KzesEgtjZe
         wsC5Pu0hzdkgYWVmXyDRrJqH0mE5kfnbRLWXl8mguoH6z4wn6NNOEXdTGXME8kNhmHAZ
         BslvQXDzWyDZMpRvL02gQ6ugWOd2Y/I46/mX1fLMp94wgI+nVw/UxAWDEYYIV4V1IWAT
         lriKxeb86EIY/gHQUezWafVhyQ8Zdn9E7Uygm6xzYtopnLmZnwCBeol/l53zDHDyUBRa
         x3xDhmhY92k7jOyb17L40qhsQZ3hF85Qvz2DjSXUp2HegAE9URu2IvdU6p2Ff+vYpC/t
         MAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CKtxRdjCaSaqdi2jWz4A6HjyFFAIp8K+BeneL4oy634=;
        b=NxZme4b8LKDy0v03K1Gb1h6hWuMwFWQdJKZ9EJgc6L//a/Nb5ftbzC0miApyNYkEdc
         yVnrYARcmkS1OMtfO8tBEHOMZ73RIIeet968rXTHhuB64rWj3UhfLi4wE7+ryOxYBI3a
         e0EZCdMMzgNRZ+jYnuAkH3T8Kg/oDVuYtp5mxaKNq+iA1IO4lNn5OiKgXfn6SxY8dwT3
         DkaRIBj4hZBgWZJicY4rP4d/BwHPpYjxyWwny09/r5cXr57NOcuL48JzfpowvefL/ru0
         3Lll/LZneODtblu1AWsEtrtPS7W2cHYerAzid3lyjK7z+pnLXIdJ0uNNugY7UkLAsWoY
         RskQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tyy5hYm3;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id y3si6957895oto.98.2020.01.13.08.53.59;
        Mon, 13 Jan 2020 08:53:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tyy5hYm3;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgAMQx6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 11:53:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33467 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726567AbgAMQx6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 11:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578934437;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CKtxRdjCaSaqdi2jWz4A6HjyFFAIp8K+BeneL4oy634=;
        b=Tyy5hYm3c+N8Gr1wdbU8fkB+h6/KrlwIsViDYohSjwZqPHqX2SqcYM8edg6iCrffLBnV+/
        XUUbSRUJSZPW4S9CBe2LqVqW99sq+7Iz5KxFdPjlaGOAOd4qEjfM8voorPCggYcz+jjdjU
        p37hZz66/ttLY0dPM+18YlHn4jtM6Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-FbMHeSghMTyHtWaMDHSR7w-1; Mon, 13 Jan 2020 11:53:53 -0500
X-MC-Unique: FbMHeSghMTyHtWaMDHSR7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E441800D78;
        Mon, 13 Jan 2020 16:53:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D82CD5C1B0;
        Mon, 13 Jan 2020 16:53:46 +0000 (UTC)
Date:   Mon, 13 Jan 2020 17:53:44 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 03/16] arm/arm64: gic: Introduce
 setup_irq() helper
Message-ID: <20200113165344.2focia4mhxtixutg@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110145412.14937-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JH8gPvf+ePXD

On Fri, Jan 10, 2020 at 03:53:59PM +0100, Eric Auger wrote:
> ipi_enable() code would be reusable for other interrupts
> than IPI. Let's rename it setup_irq() and pass an interrupt
> handler pointer. We also export it to use it in other tests
> such as the PMU's one.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arm/gic.c         | 24 +++---------------------
>  lib/arm/asm/gic.h |  3 +++
>  lib/arm/gic.c     | 11 +++++++++++
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/arm/gic.c b/arm/gic.c
> index fcf4c1f..ba43ae5 100644
> --- a/arm/gic.c
> +++ b/arm/gic.c
> @@ -215,20 +215,9 @@ static void ipi_test_smp(void)
>  	report_prefix_pop();
>  }
>  
> -static void ipi_enable(void)
> -{
> -	gic_enable_defaults();
> -#ifdef __arm__
> -	install_exception_handler(EXCPTN_IRQ, ipi_handler);
> -#else
> -	install_irq_handler(EL1H_IRQ, ipi_handler);
> -#endif
> -	local_irq_enable();
> -}
> -
>  static void ipi_send(void)
>  {
> -	ipi_enable();
> +	setup_irq(ipi_handler);
>  	wait_on_ready();
>  	ipi_test_self();
>  	ipi_test_smp();
> @@ -238,7 +227,7 @@ static void ipi_send(void)
>  
>  static void ipi_recv(void)
>  {
> -	ipi_enable();
> +	setup_irq(ipi_handler);
>  	cpumask_set_cpu(smp_processor_id(), &ready);
>  	while (1)
>  		wfi();
> @@ -295,14 +284,7 @@ static void ipi_clear_active_handler(struct pt_regs *regs __unused)
>  static void run_active_clear_test(void)
>  {
>  	report_prefix_push("active");
> -	gic_enable_defaults();
> -#ifdef __arm__
> -	install_exception_handler(EXCPTN_IRQ, ipi_clear_active_handler);
> -#else
> -	install_irq_handler(EL1H_IRQ, ipi_clear_active_handler);
> -#endif
> -	local_irq_enable();
> -
> +	setup_irq(ipi_clear_active_handler);
>  	ipi_test_self();
>  	report_prefix_pop();
>  }
> diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
> index 21cdb58..55dd84b 100644
> --- a/lib/arm/asm/gic.h
> +++ b/lib/arm/asm/gic.h
> @@ -82,5 +82,8 @@ void gic_set_irq_target(int irq, int cpu);
>  void gic_set_irq_group(int irq, int group);
>  int gic_get_irq_group(int irq);
>  
> +typedef void (*handler_t)(struct pt_regs *regs __unused);
> +extern void setup_irq(handler_t handler);
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* _ASMARM_GIC_H_ */
> diff --git a/lib/arm/gic.c b/lib/arm/gic.c
> index aa9cb86..8416dde 100644
> --- a/lib/arm/gic.c
> +++ b/lib/arm/gic.c
> @@ -236,3 +236,14 @@ int gic_get_irq_group(int irq)
>  {
>  	return gic_masked_irq_bits(irq, GICD_IGROUPR, 1, 0, ACCESS_READ);
>  }
> +
> +void setup_irq(handler_t handler)
> +{
> +	gic_enable_defaults();
> +#ifdef __arm__
> +	install_exception_handler(EXCPTN_IRQ, handler);
> +#else
> +	install_irq_handler(EL1H_IRQ, handler);
> +#endif
> +	local_irq_enable();
> +}
> -- 
> 2.20.1
>

I'd rather not add this function to the common code, at least not without
calling it something with 'defaults' in the name. Also I'd prefer unit
tests to call local_irq_enable()/disable() themselves. I think it's fine
to implement this in arm/gic.c and duplicate it in arm/pmu.c, if needed.

Thanks,
drew
