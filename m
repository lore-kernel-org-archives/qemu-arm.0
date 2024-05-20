Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1459454ejb;
        Mon, 20 May 2024 06:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV06fkpJDkdEb8eorjfSQBh1eX/samlijcGofG76Hy0hv+vRngUp7q4nqX2vor1GFxNj7v0sVuyQdZES0wu5ysJOKCqm8tP
X-Google-Smtp-Source: AGHT+IGGFGnjIPP2vAqhs9sY7veRTI8C/F7N6Ov+GD4NepNgPSbQu2kb8ay33qUmvEzEvsPfVAfE
X-Received: by 2002:a05:6808:15a2:b0:3c9:cab7:dfa7 with SMTP id 5614622812f47-3c9cab7e149mr11443177b6e.47.1716213553949;
        Mon, 20 May 2024 06:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716213553; cv=none;
        d=google.com; s=arc-20160816;
        b=avjUo96TXgcJMi6A7JLqLTpVic5p2hXa2mPaoK4labqzelbrGUXl0FLLhLXUwzYYpU
         u9JAAaiDcx+/j7Q7chvYXNxT2kVUeUQVk8PxQY62qNtz2FRhKsOU2yH3qVSPlSeD1FKn
         KX3vBj35GapXGvoYJFNDwTj9HyI35MiWeZya/V4AG9+vKqO5dLhnIFBlR+Vgq6Vhr5Lv
         1QHUxKwFYWt2ByZNciuWYx1xFRBFn5fPwyEiPtaFDsIZ1IlFxnTmGDp4Iz8VJ/8iHs5g
         v988MrmDzHhG+Tp7kavBrhdPSEwblbRhFU4ti4+wEFw4fo0T1RbomkYteSzp5DsyA9FN
         G/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XUNEEf6o0vIvlGoVCkOBNOApbEzu6uUelzCwIt8oTZw=;
        fh=itlL97t53OQthv3qUNyw5UXJx6VMCz2b+/8edCRI08k=;
        b=tRIU759RVVWP2cp8W4PJrzxT/YIXqPCWyty4SyR2q1luG1YjlNsMSMTDN0p7j8JBx0
         sGnSTqnOniH5m7xJ+NK0TFzXBuA9jVJBtNAvBaUINDbxMq+ODXV/Y6K3K1CkdfU3XV5R
         Huk4YMMPXdFMR9c0z9jz7yeBekJJGwQuTXXMy/12fd6JQljgElyyyV8a0Vqwz2riKtio
         eBYwzPgV490ITg9n/2xRskM4ZIrJVAbkoLOcKKnfDcLQLYC0j5CK4dI7gn1FKnrimdxB
         /VduHLcoQyPiit4G4toZZD6/mk0GW+rkHeQz0JthbOh+FGnBK6+TkI1Ky3foIvRkQRTf
         S8BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRxTfyuc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7948713c713si172827485a.178.2024.05.20.06.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 06:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRxTfyuc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s93XT-0005kw-K3; Mon, 20 May 2024 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93XQ-0005jn-3f
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:58:52 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93XO-0000zT-0Q
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:58:51 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so3044066e87.0
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716213528; x=1716818328; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XUNEEf6o0vIvlGoVCkOBNOApbEzu6uUelzCwIt8oTZw=;
 b=RRxTfyucRxDOJnsc0adxc7pkvSG0SKWyQ0oS0ZITKJn2D0aZzhqE6VNP2mba9dWP18
 +B8m2to+PYgsPWHWnXTA763CdeBLmMhDue6fiB8V5jAnhn5+BWBK/EbJzxgqPqbcWbxo
 dNgaIOPHylEilcFpVrWc93dNKGjeqvLQIXF5M3gcGIzlPIryZiS3Z4CvbAYL0917YMWU
 kwlPuGzFhfqm87AQXiRrm5ECwkxZ4mpZD4Evzb45Y9/0BOT+T2l++coFwyfTNDrH2Dvk
 nnnl995RdSQ9jRe7DCjwlZaeNGuk8nyDG3eFXCLGc73iPVE4CyTJYg04lzXvbBmG+lis
 PDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716213528; x=1716818328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XUNEEf6o0vIvlGoVCkOBNOApbEzu6uUelzCwIt8oTZw=;
 b=D3BI7B84EBoZEFKKD/I9J+UFJoAI+rbmeSeYv7lGklq/C6iY/mg8tU7EvyNcTmcKUt
 RPSGDCM8Y7VewdXQ+gCc8TeXvVSk3wKAmtZHPDYdrMZPDdKx6Y2hRraOxBJN0BOZJ5LF
 /Ks8jsTkOjPX88cyFgwA9B/7WrQLHm6cr7Nwe19MizLsXh//ARjoS8zKtCWFNcZ346TQ
 qvrXXiWGbIi3stuEJEkId8vEOrN3LPUwbn1S/bczBfpSTUmb2YQtQUvLQn+K9cJSxDcd
 2D9863UhlAgBKF1ruS7bCRCSsDUzixTW2Nxwf3uAuZL6PgxqQkkw7trkdG5mYMVQoz16
 KEag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn8bxU2IPs7cZyAqCqfAC/hUUnSY+RzshHG0+5PMqoSi6KRtbQJhIqKysbsZS9jrTb7uDqZbUf1iD/tpsZrHs01/bK
X-Gm-Message-State: AOJu0YwnTXa30Oj+1vH0X6zhBhneS7L3dmsbPe8ehq7C858eCJ/qMwKT
 TUJK08wPojm1WQ9lxsgEqCk9Sc91mqSfZgRsPHsYAeF1P1kIp4ioYzGTYFVhlyOGOZLelWUAs0w
 4VWnHrFA2pNdA6QfWZ+DgoaXh635dukl/e7MV6Q==
X-Received: by 2002:a05:6512:15a8:b0:51d:9ea3:5649 with SMTP id
 2adb3069b0e04-5220ff71d30mr24451019e87.10.1716213527923; Mon, 20 May 2024
 06:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240507130349.86851-1-sebastian.huber@embedded-brains.de>
 <20240507130349.86851-3-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240507130349.86851-3-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 14:58:36 +0100
Message-ID: <CAFEAcA_KBcL9UsqpOMk7GhWwokdEmC3fKZg_q7tdyt9LM7RFpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/xilinx_zynq: Support up to two CPU cores
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: awiKlKmGCEPQ

On Tue, 7 May 2024 at 14:04, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> The Zynq 7000 SoCs contain two Arm Cortex-A9 MPCore (the Zynq 7000S have only
> one core).  Add support for up to two simulated cores.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/arm/xilinx_zynq.c | 42 +++++++++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 078abd77bd..3b858e3e9a 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -184,6 +184,8 @@ static void zynq_init(MachineState *machine)
>      SysBusDevice *busdev;
>      qemu_irq pic[64];
>      int n;
> +    unsigned int smp_cpus = machine->smp.cpus;
> +    qemu_irq cpu_irq[2];

We prefer not to have arrays of qemu_irq like this that are
just passing qemu_irqs from one place to another. Instead
at the point where you want the ARM_CPU_IRQ of a particular
CPU, call qdev_get_gpio_in() on the CPU object there.

I suggest dropping the "ARMCPU *cpu" local from this function
and instead adding an "ARMCPU *cpu[ZYNQ_MAX_CPUS]" array to
the ZynqMachineState struct.

>      /* max 2GB ram */
>      if (machine->ram_size > 2 * GiB) {
> @@ -191,21 +193,27 @@ static void zynq_init(MachineState *machine)
>          exit(EXIT_FAILURE);
>      }
>
> -    cpu = ARM_CPU(object_new(machine->cpu_type));
> +    for (n = 0; n < smp_cpus; n++) {
> +        Object *cpuobj = object_new(machine->cpu_type);
>
> -    /* By default A9 CPUs have EL3 enabled.  This board does not
> -     * currently support EL3 so the CPU EL3 property is disabled before
> -     * realization.
> -     */
> -    if (object_property_find(OBJECT(cpu), "has_el3")) {
> -        object_property_set_bool(OBJECT(cpu), "has_el3", false, &error_fatal);
> -    }
> +        /* By default A9 CPUs have EL3 enabled.  This board does not
> +         * currently support EL3 so the CPU EL3 property is disabled before
> +         * realization.
> +         */

If you're moving comment text around checkpatch will suggest that
you fix it up to our current coding standard, which is that
a multiline comment has the "/*" on a line of its own.

> +        if (object_property_find(cpuobj, "has_el3")) {
> +            object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
> +        }
> +
> +        object_property_set_int(cpuobj, "midr", ZYNQ_BOARD_MIDR,
> +                                &error_fatal);
> +        object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
> +                                &error_fatal);
>
> -    object_property_set_int(OBJECT(cpu), "midr", ZYNQ_BOARD_MIDR,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(cpu), "reset-cbar", MPCORE_PERIPHBASE,
> -                            &error_fatal);
> -    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
> +        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +
> +        cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpuobj), ARM_CPU_IRQ);
> +    }
> +    cpu = ARM_CPU(first_cpu);
>
>      /* DDR remapped to address zero.  */
>      memory_region_add_subregion(address_space_mem, 0, machine->ram);
> @@ -238,10 +246,14 @@ static void zynq_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
>
>      dev = qdev_new(TYPE_A9MPCORE_PRIV);
> -    qdev_prop_set_uint32(dev, "num-cpu", 1);
> +    qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
>      busdev = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(busdev, &error_fatal);
>      sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
> +    for (n = 0; n < smp_cpus; n++) {
> +        sysbus_connect_irq(busdev, n, cpu_irq[n]);
> +    }

Looks like you have based this on a version of QEMU which doesn't
have commit 68a5827b80117973 which wires up the FIQ line of the
A9MPCORE_PRIV device to the CPUs.

> +    zynq_binfo.gic_cpu_if_addr = MPCORE_PERIPHBASE + 0x100;
>      sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
>      sysbus_connect_irq(busdev, 0,
>                         qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
> @@ -357,7 +369,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>      mc->init = zynq_init;
> -    mc->max_cpus = 1;
> +    mc->max_cpus = 2;
>      mc->no_sdcard = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
> --

I'm not making this a condition for accepting this patch, but
since you're working on this board model would you consider
writing up some documentation for it? It's one of the boards
we do not currently have documented at all. This doesn't have to
be very extensive: a few paragraphs describing what the board
type is, maybe linking to a reference to the hardware, listing
what is and isn't implemented, and (if there are some convenient
examples available) perhaps listing some examples of use.
docs/system/arm/xlnx-versal-virt.rst is the docs for the
Xilinx Versal board; the rendered version of that is:
https://www.qemu.org/docs/master/system/arm/xlnx-versal-virt.html
or https://www.qemu.org/docs/master/system/arm/realview.html
is an example of a more minimal board documentation page.

thanks
-- PMM
