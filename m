Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp309455eju;
        Thu, 4 Apr 2024 07:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlEoAZ+otkeHuGnDm3LOVkEtNP8pbXkK53B0yXdzhc9jNbcX070ge028cBFlscCtBITiMXxWU+dNY8DcflbsgFXnqYkWTk
X-Google-Smtp-Source: AGHT+IFQPLPZjQ+u9jiX9Yt9Yw7bxlQHCdaJE1q/LHLMsIC4nuRskHh0IIPQUnDeFWe9HKavT1Ug
X-Received: by 2002:a05:620a:16d0:b0:789:da81:8f2f with SMTP id a16-20020a05620a16d000b00789da818f2fmr2572717qkn.26.1712242072502;
        Thu, 04 Apr 2024 07:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712242072; cv=none;
        d=google.com; s=arc-20160816;
        b=LKH1MFWTsfAG1/KQPDCxLZjFKi3NfeALk4c/8ic49Zzj35zwciCrdDgHRxugpKc2N7
         NP+5iTUyNMNJYvgFcMSciabqoHAdsmYSy+3/TnQXi0XB1Y8NFfQbdshoCfSEwsgyjHUx
         eyEtg+B1msFPuC8B70V8+LHMbUawzHamtWFVtBWQHNcg17J/Jx76qLJPm3/4ZFH/F93O
         5bDs35f06ISfXofX+nVOfvr7r5LmEjuoeICvfWr4EHear3SyrEUs+6B+cex+AiNTFrH7
         MFjqSOTU2sZzvyv6DXMfpbbCNwSuJVigCdKMhL9lNaRST3LpA52oGZXQobbj89sa9+y8
         FRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rGYwOgcAUPynPg2lojlXUG7dNbcVuKkdrfVA3emSyFg=;
        fh=DOIAjdYSjDpUrDBILMYXbiPxdGmMKBYZydLfYdISBXg=;
        b=DS+IV7mBdMlLVCd/Xd/gmLvLvXh5PLPVKh83BvDePLh36zFz4X/AeWNCBvijA4BLE8
         OEvUv6TEDt4ssW+hJiuoqxlLaJC1gQ0XwLh9kb9vhYwFihJ2XcMk8GWiak7vKguLfI05
         8LmoCZy9hHJuQJsh+X33ASLOq16EeVrDetmSVGMSrUf3C/Qae0Tio9FMrTX2UaM33G/t
         7sN2owKSVZbKUOAqvBpdX30Udc48wNxverOGkDRDZIlNdDOFIFQ3pL7nWE6ib9RdfOUx
         avlUr/C7jbCZA4MyL2wbnLinSylbc707O3aYp72NXPvuuEnY/CrktqPAX3MoxIIxwMV1
         hgnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JD4/KUpZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz52-20020a05620a36f400b0078a078f100csi16280608qkb.333.2024.04.04.07.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JD4/KUpZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsONR-0005Vx-UZ; Thu, 04 Apr 2024 10:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsONQ-0005VU-Dq
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:47:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsONO-0002HS-FT
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:47:40 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c197d042fso1156747a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712242057; x=1712846857; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rGYwOgcAUPynPg2lojlXUG7dNbcVuKkdrfVA3emSyFg=;
 b=JD4/KUpZCmmRHLzuUBTupmFdMJVT743N0YIeCp4qhjcjla2ZeHM39TItGh9Jbvgh7C
 7u3VEwyzLocgeAxLmty3az+nu7yQRu+peJFZbmWNALaKASSSOKio5v79TgMTaKAHmb8t
 mD5szZP3PRU9dKfY+SOF63KlvFDB3aKubkF6bECTOub0doEH3CnOwvLVXyU5CfTTxfr5
 uQOYWC0/RmMQvyLgNhxtHBio7CnHT/nWERbO5ZZX/ptN0zRQ4xtJ88iUu6EWM1MlL/PB
 /jEIzMRmdQXKUQHx1qzgyUVpl1CBIBPgNgPNrmAZHUD4y5YlbWN9Ww6L3E7LFAGSKzy/
 Mn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712242057; x=1712846857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGYwOgcAUPynPg2lojlXUG7dNbcVuKkdrfVA3emSyFg=;
 b=M8PcYUsLDEA02pEHd+p2MUiXubjsLL6AzEbzLInLR34gUKNP+KucfT7T1g+/1fV+Md
 PinXokEIH8JIcsQ4OD4dulXYd+6szUmDbbrguDc6qoEsuPn+PzdP5h9VNxVHrQOhmxMs
 3nW8/+PO5goE69wQfzgdqMBWBsEIyB+/9JCf9VCesloLaFwqs2DA4vinkup+oAP1A3Ij
 iFQY5voRBoLIVQo20f0xItJK/DMZ/TJy8UTPze8/WleEUX4TYeyU77Y5959Zf5bQlvlj
 LKIFO2VpO84LtkPUjbueIIMAlvd/d7/c8kNShClN54lb9bcywkAVR8/Asa+lOQlMi8rs
 bAJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZHt7b8RzGYLsNTyFk+PPz9DUA9kcNHeXS26i4CUkY+Ax8dwSKupXpeR1Zdx8eiN++F0lX2C9XFxiSgS8TmXxm+l1r
X-Gm-Message-State: AOJu0YzbDyC5Ufsl0sFs8/Pc2VZ9BDqbt8vqHvnRJLs9pgW9QlG2bwbN
 FRQiVo3T/Q6XMj6Rt1zoh4r1TPvlUxT7RkGL8N6x3gfABlc4VgQm2W9KSNyO9gqIy2cm4MGt+Lk
 ZqQyW8cR5byRlJp9GCwQmnJhrzlHxFsN5bIyv3Psx8fcvdF6z
X-Received: by 2002:a50:a6d0:0:b0:56b:94e3:856c with SMTP id
 f16-20020a50a6d0000000b0056b94e3856cmr1670037edc.36.1712242056771; Thu, 04
 Apr 2024 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-11-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-11-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:47:26 +0100
Message-ID: <CAFEAcA8ESSRQtemj7xefeb8Fp0__EEiJh2FamGy7w7_iTpyf4A@mail.gmail.com>
Subject: Re: [PATCH v12 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from
 GIC to CPU
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: PVnbK+pl5Fvb

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Wire the new NMI and VINMI interrupt line from the GIC to each CPU.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v9:
> - Rename ARM_CPU_VNMI to ARM_CPU_VINMI.
> - Update the commit message.
> v4:
> - Add Reviewed-by.
> v3:
> - Also add VNMI wire.
> ---
>  hw/arm/virt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a9a913aead..ef2e6c2c4d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -821,7 +821,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>
>      /* Wire the outputs from each CPU's generic timer and the GICv3
>       * maintenance interrupt signal to the appropriate GIC PPI inputs,
> -     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to the
> +     * CPU's inputs.
>       */
>      for (i = 0; i < smp_cpus; i++) {
>          DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
> @@ -865,6 +866,10 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
>          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
> +        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
>      }

This patch needs to go after patch 11. Otherwise at this point
in the patchseries we are trying to wire up GPIOs on the GIC
which don't exist, and QEMU will assert:

$ ./build/x86/qemu-system-aarch64 -M virt,gic-version=3
Unexpected error in object_property_find_err() at ../../qom/object.c:1366:
qemu-system-aarch64: Property 'arm-gicv3.sysbus-irq[4]' not found
Aborted (core dumped)

We also need to only connect these up if vms->gic_version
is not VIRT_GIC_VERSION_2. This is because these GPIOs don't
exist on the GICv2, and otherwise we again assert if you
try to wire them up but you're using GICv2:

$ ./build/x86/qemu-system-aarch64 -M virt,gic-version=2
Unexpected error in object_property_find_err() at ../../qom/object.c:1366:
qemu-system-aarch64: Property 'arm_gic.sysbus-irq[4]' not found
Aborted (core dumped)

thanks
-- PMM
