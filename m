Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4091290wrq;
        Mon, 11 Jun 2018 07:07:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI29gKLGVlji4Hn45fQhOUCDIxRJEM5y0WTm30RarIkn/xOVKoNXp2jlzz3kEgqGndZ1J1M
X-Received: by 2002:a37:1707:: with SMTP id i7-v6mr14678594qkh.433.1528726048099;
        Mon, 11 Jun 2018 07:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528726048; cv=none;
        d=google.com; s=arc-20160816;
        b=Ne7TpmbAwGrTUXEHibNXwV/Nor9VanEyxHTez8KwPnPnkG80GywZvU8GUbXRQvnejZ
         X4eN8vJKxgruXIyDAhC+3dhfuTwfQNOy6PXUoBOu10TpeGrOqV/a26MYDNVDwJ7AfiSS
         1nO4mdpKJn6CfqA1PN9PCYiTd0JTF90OniQZv+PQtajjVgsTaJ2/VUtAOdoWYiQnQXjr
         454qHyreeVEDIP5Iv8w/DlZmPlg3jitZgVF5VUwY1vq4Fj8MqDZ8PlxzZqcmjKAjUjNW
         oGCUMP5UCdW8r9zy8SEisbTZvhqwzS8T6Lqix9dQEuDQkMK5Afb0DKekN6qiqtagOpPc
         OvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8jeWzZoZtWyfcHqfAqlnO9+a4IWX9mV7nq+jZ2nni1o=;
        b=xqjstMf1dnthr/3uISx9PJke1g+U8K2Ht0ZNhFbeE8XUdXI/qAaLB2xWuTNRjVVFfm
         9bKbbbmv0RGh81ERlTZVxRnr+eoKhEI1xUe3eiujHzK2XcGCh3KFzKmtVB1G/hylYa0u
         o482u7Uq7LJgQSsoUTA5U2P3buj349RhvXSHGOY6PIK2xIkWN9j4sxmQLr4z3ZItXwsn
         Ni40o74Zj4/XjUelrWbxtf0L5nKQOZ2rIis4zWQ27D48EfiqZySP2Uf2Tqge88Jexj8O
         FpRHrMMrmZoXOjaYvf3HPMedefiFzuX3vRUwchr9do+BhexxbPO0c2rd5XzsYD6ZtrU+
         iv6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FsQst+r5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l63-v6si3012990qkd.301.2018.06.11.07.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 07:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FsQst+r5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSNTj-0003Uf-E5
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 10:07:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNSU-0002gj-C8
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNSK-0001LQ-Ix
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:06:10 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSNSK-0001L5-E6
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:06:00 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so23903765otj.0
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8jeWzZoZtWyfcHqfAqlnO9+a4IWX9mV7nq+jZ2nni1o=;
	b=FsQst+r5ljzpUsgzLm5DMLTOmMbb3SnmgclGPTIr3rABu7X3LSQjunmIM81oPaI6+3
	t1xMp4kf0T3VWa56NC9jsz4E09JUaPTHgRE1MZtrnJXztsw/Lle9KJp7qnMiuj394h9+
	XAE1BW/haABHuow/pteS6TLxwHuoItpVVsV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8jeWzZoZtWyfcHqfAqlnO9+a4IWX9mV7nq+jZ2nni1o=;
	b=hdzhM+0clvqzdDge05oPkdrHnzyKcn89o18EzMqyBMiraz4g4tG0CjqKWD1aA+5Goi
	N9EE9SVw6GQbkTmC9VgFhEg/uO/+m+8Q8enIMp4MN6LyUbdP/pzJ837L+UscsFYQTF9+
	M9FQlXgS+wU/qXdfA0VcNiIhsBM3d332+XRToKBebQE5NzVFx95UUQVD7ZbwrVMtbd/H
	l0m0Hs2u9scN3TdN06dNxgD5RAE/bkn5q3syVqq3C9O8tOQyrXg+LAg1+EWk250Mr50y
	XecgF8TJvWyNQozWeFvJsd1Bj8QS4UkgmkOp32wjk7TX6pONmCfb1j18yBE4BbAOBXtv
	T3Lg==
X-Gm-Message-State: APt69E0Q8JtT6N1IeZ5SDhmmvVGd0NJkABMJ1oJXsfkjI6nocpkWeB45
	9gqWu0xq8CM87J8v1qt4xiGSBh95SjedJgJVO5Q0eKWs
X-Received: by 2002:a9d:705d:: with SMTP id
	x29-v6mr10461662otj.308.1528725959690; 
	Mon, 11 Jun 2018 07:05:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 07:05:39
	-0700 (PDT)
In-Reply-To: <20180601160355.15393-1-peter.maydell@linaro.org>
References: <20180601160355.15393-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 15:05:39 +0100
Message-ID: <CAFEAcA-9skxQ7AifPvL+BbUuPKm4PWQ+CycuERahpfNvettO3A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] arm: Don't crash if user tries to use a
 Cortex-M CPU without an NVIC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8o6wQy1tppS

Ping for code review?

thanks
-- PMM

On 1 June 2018 at 17:03, Peter Maydell <peter.maydell@linaro.org> wrote:
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
> --
> 2.17.1
>
>
