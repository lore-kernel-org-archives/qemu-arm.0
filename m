Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4181708wrq;
        Mon, 11 Jun 2018 08:28:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKiLPMmwqbfTAbh2WFZJcgBxBAQ0FemS89c+I+skGk22ZLvCV4Dd/lv4WzqTahxIlXo2M1E
X-Received: by 2002:a0c:8167:: with SMTP id 94-v6mr11788035qvc.221.1528730901924;
        Mon, 11 Jun 2018 08:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528730901; cv=none;
        d=google.com; s=arc-20160816;
        b=NffwsoFLVuH4CUNUM75ssJVVmvvb36OdBh5RaMEpk6fk3cmyrM7FZks7CVfNkkrd1C
         KhraiIJB+I+lEL02/8Cr1S/6Ych6nuc8cE1fLodjnbw4OAlXarlSjs8ixqgIxHpnfX1Z
         geSxD3BUaKtM3etzDh2YU23eX36ChwDxkYVeRVGbOFtm1Zcoer1C9i8sn2gmkhX+k6Dx
         Ek54d98MNHlZcpNaaeCOfXSUEQmUM5r9l9ndM3cy5WJ5zz+hps0ztjtfv2+8ZESb44Dq
         qri+E9Y1vLgakQqVmFgdzzb1r7jt94/htXZxShdRHfV6mrJGGFgtDNE/paJavP5W3ros
         GTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=D0SfyDxhCJfSxoDDG7/yKfBECiZu3zEfKbMxBxfwv40=;
        b=FgA35UGf4UM0HVvU/tiMPJaG686e9pSnC4XU1y3VBXnsrOT5HLBzUqYQuwAsS8b79M
         KtbNR14yxG2w9Vx6DXsHOjTs5T2VQfGgRpAF7XRLyxlDO5cKOODuAlstPXrDE1cycvI+
         gMgEYue0UX6etIef6NZc1HQtnQ5Rwzndadt+fB6uemuTnkifTNcjqalSogQWYc7UeyOu
         vx6mvW2LrRTxVsaVrMt1dhoTU89d8Sm5N+r5wE+dUfh2jKe4JWEoVwP+ztxmVMyItOUl
         5tWFaXY5ymXSKSzWfGZZaIKCoMZtwZ/YshTQ0+qvpai/rhuIHtLfRgVLT6RRS7jvQQUS
         Ly4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f25-v6si4594610qtk.241.2018.06.11.08.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSOk1-0004HU-F9
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:28:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fSOic-0003cX-JG
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 11:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fSOib-0005c3-7y
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 11:26:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35848 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fSOiV-0005aS-J2; Mon, 11 Jun 2018 11:26:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD3117D668;
	Mon, 11 Jun 2018 15:26:46 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15AD52022DF5;
	Mon, 11 Jun 2018 15:26:45 +0000 (UTC)
Date: Mon, 11 Jun 2018 17:26:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180611172644.5eeef770@redhat.com>
In-Reply-To: <20180601160355.15393-1-peter.maydell@linaro.org>
References: <20180601160355.15393-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:26:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:26:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH] arm: Don't crash if user tries to use a
 Cortex-M CPU without an NVIC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QXEwLbs6fz85

On Fri,  1 Jun 2018 17:03:55 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> The Cortex-M CPU and its NVIC are two intimately intertwined parts of
> the same hardware; it is not possible to use one without the other.
> Unfortunately a lot of our board models don't do any sanity checking
> on the CPU type the user asks for, so a command line like
>     qemu-system-arm -M versatilepb -cpu cortex-m3
> will create an M3 without an NVIC, and coredump immediately.
> In the other direction, trying a non-M-profile CPU in an M-profile
> board won't blow up, but doesn't do anything useful either:
>     qemu-system-arm -M lm3s6965evb -cpu arm926
> 
> Add some checking in the NVIC and CPU realize functions that the
> user isn't trying to use an NVIC without an M-profile CPU or
> an M-profile CPU without an NVIC, so we can produce a helpful
> error message rather than a core dump.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1766896
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c       |  7 ++++++-
>  hw/intc/armv7m_nvic.c |  6 +++++-
>  target/arm/cpu.c      | 18 ++++++++++++++++++
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index a4ab7d2069..9e00d4037c 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -178,6 +178,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>      }
> +
> +    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
> +     * have one.
> +     */
> +    s->cpu->env.nvic = &s->nvic;
> +
>      object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
>      if (err != NULL) {
>          error_propagate(errp, err);
> @@ -202,7 +208,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      sbd = SYS_BUS_DEVICE(&s->nvic);
>      sysbus_connect_irq(sbd, 0,
>                         qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> -    s->cpu->env.nvic = &s->nvic;
>  
>      memory_region_add_subregion(&s->container, 0xe000e000,
>                                  sysbus_mmio_get_region(sbd, 0));
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index c51151fa8a..661be8878a 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2183,7 +2183,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      int regionlen;
>  
>      s->cpu = ARM_CPU(qemu_get_cpu(0));
> -    assert(s->cpu);
> +
> +    if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
> +        error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
> +        return;
> +    }
>  
>      if (s->num_irq > NVIC_MAX_IRQ) {
>          error_setg(errp, "num-irq %d exceeds NVIC maximum", s->num_irq);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5d60893a07..eda1ce14fc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -767,6 +767,24 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +#ifndef CONFIG_USER_ONLY
> +    /* The NVIC and M-profile CPU are two halves of a single piece of
> +     * hardware; trying to use one without the other is a command line
> +     * error and will result in segfaults if not caught here.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        if (!env->nvic) {
> +            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
mentioning board in CPU's realize seems a little bit strange,
maybe something similar to following would be better:

  "Cortex-M CPUs require device_foo for working"

> +            return;
> +        }
> +    } else {
> +        if (env->nvic) {
> +            error_setg(errp, "This board can only be used with Cortex-M CPUs");
> +            return;
> +        }
> +    }
> +#endif
> +
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);

