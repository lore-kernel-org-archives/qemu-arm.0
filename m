Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1246527ejf;
        Fri, 7 Jun 2024 16:52:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd54qApJG9nHethP+REoZt9UBClF38Lco9xUmLhpz56cvCNebiBKHF2zvfDBi93qCggA1j8GhIa81II+KbZa0KWeVj0sSj
X-Google-Smtp-Source: AGHT+IGa3EJ3Ut2dPU50hQFmxgqF9iz4cYf3CZCAN4OFB8dfLCOySJTZyvbNZ2qbTaKmxnsxAuki
X-Received: by 2002:a05:622a:2d0b:b0:440:4881:647f with SMTP id d75a77b69052e-44048817564mr20729451cf.61.1717804360774;
        Fri, 07 Jun 2024 16:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717804360; cv=none;
        d=google.com; s=arc-20160816;
        b=etzEiLUhI0qYEuXj0zmsiEtoMmXijzhGgzGkALFzpaislosHPQQjDha68Zw5DNyg8a
         SfeZbr8Bz822gyQAsbCOFfuBtjbtUQfj6TKnsCB+5DOh5BzOLyz55rYrakBRjPBnYh7T
         rog93uulC8aKRah7SxNUvS0hCwGYFquNFPo+piww4DiuyQ5sZcTYEAm3l/xchtKRiLS5
         kiI4LMnWEPBYdEojs/jnOnCp71JZXUHBTzqI4h5yMT/nECkg4cay0uTFCDk24vB5Aq98
         mHm3Nob6JBLUSD2uvEmBOKXGJN/juuDDeS4haXhSCMNrf+n7/uPw3D2XQYxZSkiQYD0W
         z8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RHsLqbA0ARigZErh3p5J1JPw7aHC7YUyqGXlvJ7XIi0=;
        fh=XN+cwQGK/E8qEdMl4I7KZrjmq4rFLUYJTfJYfW8pVVM=;
        b=T5k9xEKKxpfG84qcw889iQInI5FCTbEep92LiesJPTtaS12wuX4p/7Ra8GL9Jcgb5J
         dHIS/eh7gGpPTV9pGLU+XQ06IYguH5m8yvEFI8D+DtXw9hRo4z3pQo/XqQ7lrrKr77Yz
         jSCOimBt2/L5PaoNqNu7j/Z4AHauT6uWUrsj9C79mlUSNjoSYORIn/ynagJK+t+nOKQa
         i64fHHf/+4aW+svS9Ni6dRRstGvc8/IVPu2s3zFBaNT4qngWfr0tzVkiUp/LQhIm6Vp5
         Z3ziIj2QwlztBeGg4bm8snQr5QeWzVW6mmMQ93yDrbETasUkOjimEMoDOZMxIu8Ki8S0
         qYNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKdhBr7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038a8603bsi51897581cf.215.2024.06.07.16.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 16:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKdhBr7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFat0-00088h-W4; Fri, 07 Jun 2024 10:48:11 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFasz-00088Q-Qc
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:48:09 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFasw-0005F7-Pd
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:48:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57c614c572aso454466a12.1
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2024 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717771684; x=1718376484; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RHsLqbA0ARigZErh3p5J1JPw7aHC7YUyqGXlvJ7XIi0=;
 b=oKdhBr7UF2ZyWUETKEd6Wx1dZIingvEsLAiGw5nWQVQxCXruy7L7Qf8pFQGzjtbJHG
 YKsBxD3CI8uoHowPMsABWxCS/5gylGhGkVP36MXPdZF3yJNXCUeC4a9DFt2OAX+JKliJ
 E6GE9MjDW6GfPzZ7mwx7IohXkIrOHi0J09XILnpDFOWNPxkUqqmtapONRas1LZ3CG5/a
 GCyWsCGq8gtSmGfmyQKaw7lUtwejgzx2Ayt07faJJ/frsHy+Fue+4gwAnOu4vgb6e6v1
 QE+4ynb2PxnFNNAL1YSbm0kcd/lvTzQRnb5ytP7n7tXeYdHZe/lKpwj/PUTy9eiSMxtJ
 WjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717771684; x=1718376484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHsLqbA0ARigZErh3p5J1JPw7aHC7YUyqGXlvJ7XIi0=;
 b=Mt2ch2w8Wj4RCyJgL7I3g3veKp8sA8mKr4TfGOPeuyI6nWf3E7LrkRbLmvm5d9n7dY
 9ejs4tzjx2ptqAB32fMcDkhNy0gsa3XdvuJgIzjomcBpSqYt5NJx9kp0mogkf7MP7PFO
 ZRd4PUFFEvRNH6a+5pA+Sr+dP80wz172X5SwSl4tEAJgkUg1bXLTBGTLV/uZnAbKCIsE
 TEZNGPHbkA9XZBKKngl5wUgk+6xXZ0IYKAzs64rYrcM5RMC0lQeC7cA3WO36DOOc/XqI
 sk9nh/kx38IGdJMy9ovLDQetfnk4AEfideJamKuegIisU5qRKwiBdWh8myiTRG92nQdC
 hDfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhWqMnhsutHEIN1E+/+fkkGXXAXZb0xka+zwajZmsnJRJz4tBR8kaYi20W0j5u1Qv2tOUAM/LXNKtb2YTiqvu2eBDB
X-Gm-Message-State: AOJu0Yyuy1Unz+qUWTmPqSHiotmQfiSQSwJ9WZtDGYezI4BPg5QDs9BW
 HdhmcA2rs2msbwSCEJB7Eb6KYSm+h4o/mg1cjbjPOnBH4zgEKBPrUHchZsdoLVmEeCXFkrHM/BS
 ySTXFE8+LUSGByMvWYOjCq6wqlopld1KFRA44hA==
X-Received: by 2002:a50:cc96:0:b0:578:36a2:7073 with SMTP id
 4fb4d7f45d1cf-57c509a811amr1490294a12.29.1717771684201; Fri, 07 Jun 2024
 07:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
 <CAFEAcA81fqWKXL_7m6LTi0-zkmtMQC0RY6_ZNP49cdWCVJK+1Q@mail.gmail.com>
 <cdfed70e-9dd1-4169-a73d-6a6c98c41ac2@embedded-brains.de>
In-Reply-To: <cdfed70e-9dd1-4169-a73d-6a6c98c41ac2@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2024 15:47:52 +0100
Message-ID: <CAFEAcA9auJ5A_YSBgwTM_9r=NYPcpieZhw_+yNKB-HnCy4EWEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Zynq 7000 Improvements
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zRnnPQiE+oll

On Fri, 7 Jun 2024 at 15:28, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> On 30.05.24 12:30, Peter Maydell wrote:
> > On Fri, 24 May 2024 at 13:08, Sebastian Huber
> > <sebastian.huber@embedded-brains.de> wrote:
> >>
> >> v2:
> >>
> >> * Add Kconfig support
> >>
> >> * Add array of CPUs to ZynqMachineState
> >>
> >> * Add FIQ support
> >>
> >> Sebastian Huber (2):
> >>    hw/arm/xilinx_zynq: Add cache controller
> >>    hw/arm/xilinx_zynq: Support up to two CPU cores
> >
> >
> >
> > Applied to target-arm.next, thanks.
>
> Thanks, for the integration. I did some more tests and there is an issue
> with the IPI support. My test case worked with this change:
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 7f7a3d23fb..8d84eaf070 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -253,9 +253,9 @@ static void zynq_init(MachineState *machine)
>       sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
>       for (n = 0; n < smp_cpus; n++) {
>           DeviceState *cpudev = DEVICE(zynq_machine->cpu[n]);
> -        sysbus_connect_irq(busdev, (2 * n) + 0,
> +        sysbus_connect_irq(busdev, n,
>                              qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> -        sysbus_connect_irq(busdev, (2 * n) + 1,
> +        sysbus_connect_irq(busdev, smp_cpus + n,
>                              qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
>       }
>
> This is just guess work on my side since I have no idea how the second
> parameter relates to the pin.
>
> Originally I used the hw/arm/realview.c as a reference, but his target
> doesn't use the ARM_CPU_FIQ at all.

(I suspect it's a bug that we don't wire up FIQ on realview,
but Linux doesn't care as it only uses IRQ anyway.)

The a9mpcore device's inbound IRQ lines are a passthrough of
the IRQ inputs to the GICv2 device. We don't document that
that's what a9mpcore does, unfortunately, but we do document
the GICv2 layout in include/hw/intc/arm_gic.h:

 *  + sysbus IRQs: (in order; number will vary depending on number of cores)
 *    - IRQ for CPU 0
 *    - IRQ for CPU 1
 *      ...
 *    - FIQ for CPU 0
 *    - FIQ for CPU 1
 *      ...
 *    - VIRQ for CPU 0 (exists even if virt extensions not present)
 *    - VIRQ for CPU 1 (exists even if virt extensions not present)
 *      ...
 *    - VFIQ for CPU 0 (exists even if virt extensions not present)
 *    - VFIQ for CPU 1 (exists even if virt extensions not present)
 *      ...
 *    - maintenance IRQ for CPU i/f 0 (only if virt extensions present)
 *    - maintenance IRQ for CPU i/f 1 (only if virt extensions present)

So yes, your change here is correct.

The original patch is in upstream git already, so would you
mind sending this fix as a proper patch email? Then I can
pick it up as a bugfix.

thanks
-- PMM
