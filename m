Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1000803lfc;
        Mon, 9 Mar 2020 03:56:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuGiz6aU2+UjwpDr0k9Cho6wGNQrH3Q99NrJu9rdoMealFeGm/HlkY3IyhN28rcHcwUXJwd
X-Received: by 2002:ad4:4241:: with SMTP id l1mr14293781qvq.82.1583751376473;
        Mon, 09 Mar 2020 03:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583751376; cv=none;
        d=google.com; s=arc-20160816;
        b=mnSvUSt/Qa0ZxV3g0Let9TmNHpOj206D81wrvdDowA28iT7YiDmSmALZ8naDmGWTJu
         rRtmZNnfxsejeIeiCe7hEJFIUGIR2Hu6JEReBZRwvsRVZPREeVRy5KUw1ZVs66zBh/hr
         fOcsJxrag/mtASX4mG/rB8PoVhZn2A93o2MtgSqZnbxtyheqWcIt+XV8DTPUzv9iruf3
         qfN8DOoJiQIgRSsoNxu5fqsmcSJ6Y9PzY5Gms7rcu6K4Jfa/2OgjOAbCxH1Rmm7uK3II
         MsPuRnY7g/w4pTIcvyppgloBJfkEiS6JihU9gb/fhxBBU60WjPkvdwEDL9Ynyz+mfm43
         WkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=7hMZVD15ZbaO4WFZsSLiDT1OVYnEMdxD7dWmO/5JLvE=;
        b=IM8OzciHyfnLxU20PvfzMgXmMi0Uxp0m2bYoTS1+S+yju13sL9Ob9068WnDJ5V0a7k
         iBMC1e9qC7XTB90jIh91Q4v1kPa76RyZz25GyRQysV2tvAzUYWf43qi+pxpBhmDIZnx4
         FlrKdSszDLuYihfJZYwY9llBTxAjCftLJ7w+o9JupM7QjIXrsAcbK8x4+Nch9SOELS1a
         w2irLWaYw7LXv8QrbDpG/El/XsBJdJouO4v+F1fWsv7EkqYlh2nk7IrdKzLBnmDD/4IT
         6MB7PSD6+xFC/kSfULAkAAX6xtQvMQYnbDmL5CJObJAGsRGX++YosQM7K1Ogz34H0BZB
         dA9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=VZlMWOBS;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v19si6097802qkv.275.2020.03.09.03.56.16;
        Mon, 09 Mar 2020 03:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=VZlMWOBS;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 15CF44A483;
	Mon,  9 Mar 2020 06:56:16 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzoA7oNGDxXr; Mon,  9 Mar 2020 06:56:15 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 015C24A1FA;
	Mon,  9 Mar 2020 06:56:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1262D40456
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:56:14 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAKJ5ouvuIQ3 for <kvmarm@lists.cs.columbia.edu>;
 Mon,  9 Mar 2020 06:56:13 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2077340152
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:56:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583751372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9KEMpMRCvbmPoDMJrLlIGlGrbBg9uKjS59wDa02j2VA=;
 b=VZlMWOBSOb/mijwGCh2CvN3b0sDaHV6gfyIthB60b1yig4klfj35ijWl6Ien4luhp5qSud
 /WknrBNdg2Vk0ir6bm9paquNHOSv2KMMpCQ5LdC+APOkSYZZocxXYLg2x2WMnbpBFaks8i
 VrPWm29wB3wUs16OjIM2V0Se73JyMnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-cfS3j-H4Pq2WMi0xP_RiZw-1; Mon, 09 Mar 2020 06:56:11 -0400
X-MC-Unique: cfS3j-H4Pq2WMi0xP_RiZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8130C13F7;
 Mon,  9 Mar 2020 10:56:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D30A21001920;
 Mon,  9 Mar 2020 10:56:03 +0000 (UTC)
Date: Mon, 9 Mar 2020 11:56:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 03/13] arm/arm64: gic: Introduce
 setup_irq() helper
Message-ID: <20200309105601.3hm2kfhuufgxoydl@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309102420.24498-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309102420.24498-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: thuth@redhat.com, kvm@vger.kernel.org, maz@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: IjdYk5znXFdp

On Mon, Mar 09, 2020 at 11:24:10AM +0100, Eric Auger wrote:
> ipi_enable() code would be reusable for other interrupts
> than IPI. Let's rename it setup_irq() and pass an interrupt
> handler pointer.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - do not export setup_irq anymore
> ---
>  arm/gic.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/arm/gic.c b/arm/gic.c
> index fcf4c1f..abf08c7 100644
> --- a/arm/gic.c
> +++ b/arm/gic.c
> @@ -34,6 +34,7 @@ static struct gic *gic;
>  static int acked[NR_CPUS], spurious[NR_CPUS];
>  static int bad_sender[NR_CPUS], bad_irq[NR_CPUS];
>  static cpumask_t ready;
> +typedef void (*handler_t)(struct pt_regs *regs __unused);

This is just irq_handler_fn, which is already defined in processor.h.
We don't need the __unused, not since 6b07148d06b1 ("Replace -Wextra
with a saner list of warning flags").

>  
>  static void nr_cpu_check(int nr)
>  {
> @@ -215,20 +216,20 @@ static void ipi_test_smp(void)
>  	report_prefix_pop();
>  }
>  
> -static void ipi_enable(void)
> +static void setup_irq(handler_t handler)
>  {
>  	gic_enable_defaults();
>  #ifdef __arm__
> -	install_exception_handler(EXCPTN_IRQ, ipi_handler);
> +	install_exception_handler(EXCPTN_IRQ, handler);
>  #else
> -	install_irq_handler(EL1H_IRQ, ipi_handler);
> +	install_irq_handler(EL1H_IRQ, handler);
>  #endif
>  	local_irq_enable();
>  }
>  
>  static void ipi_send(void)
>  {
> -	ipi_enable();
> +	setup_irq(ipi_handler);
>  	wait_on_ready();
>  	ipi_test_self();
>  	ipi_test_smp();
> @@ -238,7 +239,7 @@ static void ipi_send(void)
>  
>  static void ipi_recv(void)
>  {
> -	ipi_enable();
> +	setup_irq(ipi_handler);
>  	cpumask_set_cpu(smp_processor_id(), &ready);
>  	while (1)
>  		wfi();
> @@ -295,14 +296,7 @@ static void ipi_clear_active_handler(struct pt_regs *regs __unused)
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
> -- 
> 2.20.1
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
