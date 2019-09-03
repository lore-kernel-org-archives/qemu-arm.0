Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp324051wrp;
        Tue, 3 Sep 2019 04:34:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQdhdupF1TcTSFGJdCVDwOZd2RJkIpytQnAhlQ9dKdq8AiCjtuovaeESKWpgyLggIwUYXC
X-Received: by 2002:a63:2903:: with SMTP id p3mr15118684pgp.306.1567510441720;
        Tue, 03 Sep 2019 04:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567510441; cv=none;
        d=google.com; s=arc-20160816;
        b=RENyA58u8hsU6dU+WkmrG5Q09bSPYkFkSUDVDrjlwBjbMdKw86Fj2oQpigxL6AneP9
         dyhT4PFX2Pz6EQvDJPNCzGz/Kx2BFH6psbMgKAzPB0YWu1MVE59y5ys3puU7zyc3eVE1
         tx1Zrus/vxKJyQWLltRnAySFRmsnbLh1YDdBnLfiHzhuiIMzrFshFYMzJGW/C0HqfTvz
         ubiS8Ytg32KiXcIj9aW3phpW5SN7CtNe6TpFgvdfEjueyURkXL7kKxzGAtVmfKEqlAJl
         vuNxSSm+MbYePkA4wHPqF5BiIJRYxrthihZ5BtzVw7A7AXWjHNnvl/E0PVVP69fZNHwC
         uVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtxHXKLfW5QJwBGA+RR9lcAadfuUNqWWH2+7dJcY6l8=;
        b=noFn3pQVrhmCq4oWv6u1ZNsyKkf54E3/y8r4RAcV/HtmlvgOw/8IovxLNgHwG7yTI4
         dFloHVLPX0A4S4UgJvXLReAU1eGpHqydM1bAOXwkbNcCnDG4IbdoPOb7UNi1R7iRg3Xs
         tF5VsqvV8isxOA3mjM+xHUjQz7jkQ56v2BWBdOKIkv2HClHUokPoCHF3+jl5cAMyUFbv
         4jK0UsW4v5pwphmuNBGXeUXAlYQp5EEMQMTaAI35F3q9ugZmkjtob8mnaqdviPX215oU
         jjAFWR3zMu8XW+W9HC8beNGe+ncMF241X+HawiaEtHUo1Pj+p4y8xWAF7A0vj1WrECHJ
         qDFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDvVk5e0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d6si6234407plo.280.2019.09.03.04.34.01;
        Tue, 03 Sep 2019 04:34:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDvVk5e0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfICLeA (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 3 Sep 2019 07:34:00 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43543 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfICLeA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 3 Sep 2019 07:34:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id 90so12469596otg.10
        for <kvm@vger.kernel.org>; Tue, 03 Sep 2019 04:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XtxHXKLfW5QJwBGA+RR9lcAadfuUNqWWH2+7dJcY6l8=;
        b=wDvVk5e0nozBCiHVpIJ1ag0McMj21a4LnQhk0VwHhzsl21zYG3/FYXtHN/gUQR/qwI
         DQ4nXwRjv+5mKj4QwJcpR0ZAN3IhvqFizCBzmL1ZNU0hnKclsxK56/VuG73N2ZAtpxSA
         0Qj1vwhiPppNFvUDzZ7vZbEa7IYHFa0HjqZktvpweEF6+6yOecujjcAGJ30EBIat4pIQ
         y64j6SBsRT3rCskUD0jU9xXYh6EcT1sftyeldRF4iEeAibREHceCb3sJKew1Hc0qEPWh
         I+FPgFDTiENXz/Xu+DWTL5cinxcSaGb7hgdzGTRAJwjPSGaskJrTfLTWUWrBW4DO8yZs
         xS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XtxHXKLfW5QJwBGA+RR9lcAadfuUNqWWH2+7dJcY6l8=;
        b=YVIaP/CEdRNktdRstOhw+QMr/LxvTF+VKqn+N+ntqIXLKbKmHMyaDXGdTiI9xrx1Sk
         CXlL4XIcrKdzyrszhg8gE+V8C6aEiKWmF/shBX6ZNQMXfVcUGnuVrVDk/7VH64eUsECq
         cmHq0rW6Vnxd5DSQ+VzH9pB0or6Q/T9HN0rgAW+XU6eWoJ8ZQdWNIPOFnWms6lOVa4lX
         PeNPGVsAKz+ezToBWGG32XgYALfJOUyRCqYhyMjWBRf8MRlrxwF6VQVA3FIT6kJS9rX3
         i2kkB8M9OJOVbIRBf7qu8JC3spyoWZQXPucZJ4dRQxftGKwwXMMQMCCLBHjttCVghdcp
         5VRw==
X-Gm-Message-State: APjAAAUac3Gm4YaP4aOSPxbjVefuPSmvQGBFJqi1T5xGKz5OmTeOdIIf
        1ElzyWo0bQaXSjcequA4TfGUoE/dc/nq2Fcdb/ktzwtIeDk=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr28380255oti.91.1567510439153;
 Tue, 03 Sep 2019 04:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190818140710.23920-1-maz@kernel.org>
In-Reply-To: <20190818140710.23920-1-maz@kernel.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 3 Sep 2019 12:33:48 +0100
Message-ID: <CAFEAcA-25Cm9ZgSkgXDomEs7jt4sn4z3GeXLt4hvU4P1D0vJCA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for KVM_IRQ_LINE
To:     Marc Zyngier <maz@kernel.org>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, kvm-devel <kvm@vger.kernel.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qJGpg3Y5OXon

On Sun, 18 Aug 2019 at 15:07, Marc Zyngier <maz@kernel.org> wrote:
>
> While parts of the VGIC support a large number of vcpus (we
> bravely allow up to 512), other parts are more limited.
>
> One of these limits is visible in the KVM_IRQ_LINE ioctl, which
> only allows 256 vcpus to be signalled when using the CPU or PPI
> types. Unfortunately, we've cornered ourselves badly by allocating
> all the bits in the irq field.
>
> Since the irq_type subfield (8 bit wide) is currently only taking
> the values 0, 1 and 2 (and we have been careful not to allow anything
> else), let's reduce this field to only 4 bits, and allocate the
> remaining 4 bits to a vcpu2_index, which acts as a multiplier:
>
>   vcpu_id = 256 * vcpu2_index + vcpu_index
>
> With that, and a new capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)
> allowing this to be discovered, it becomes possible to inject
> PPIs to up to 4096 vcpus. But please just don't.
>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

> diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.txt
> index 2d067767b617..85518bfb2a99 100644
> --- a/Documentation/virt/kvm/api.txt
> +++ b/Documentation/virt/kvm/api.txt
> @@ -753,8 +753,8 @@ in-kernel irqchip (GIC), and for in-kernel irqchip can tell the GIC to
>  use PPIs designated for specific cpus.  The irq field is interpreted
>  like this:
>
> -  bits:  | 31 ... 24 | 23  ... 16 | 15    ...    0 |
> -  field: | irq_type  | vcpu_index |     irq_id     |
> +  bits:  |  31 ... 28  | 27 ... 24 | 23  ... 16 | 15 ... 0 |
> +  field: | vcpu2_index | irq_type  | vcpu_index |  irq_id  |
>
>  The irq_type field has the following values:
>  - irq_type[0]: out-of-kernel GIC: irq_id 0 is IRQ, irq_id 1 is FIQ
> @@ -766,6 +766,10 @@ The irq_type field has the following values:
>
>  In both cases, level is used to assert/deassert the line.
>
> +When KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 is supported, the target vcpu is
> +identified as (256 * vcpu2_index + vcpu_index). Otherwise, vcpu2_index
> +must be zero.
> +
>  struct kvm_irq_level {
>         union {
>                 __u32 irq;     /* GSI */

> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index 35a069815baf..c1385911de69 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -182,6 +182,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         int r;
>         switch (ext) {
>         case KVM_CAP_IRQCHIP:
> +       case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
>                 r = vgic_present;
>                 break;

Shouldn't we be advertising the capability always, not just if
the VGIC is present? The KVM_IRQ_LINE ioctl can be used for
directly signalling IRQs to vCPUs even if we're using an
out-of-kernel irqchip model.

The general principle of the API change/extension looks OK to me.

thanks
-- PMM
