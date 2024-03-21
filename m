Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp630842ejv;
        Thu, 21 Mar 2024 09:41:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZgB+SO7F4fEmXPP5ajPfI8lZ2Cbh3vM9Bl5UI5ltndQGYc9SRw6Uf4DZY0F11G2a63JN5vTnKTjvHTzNxQ8tdwl/4sg86
X-Google-Smtp-Source: AGHT+IGku3sZb8hqw+3SYpT5169T0/D+8oAdD4Ef7FCS9iTGP55n0hyof7BAxbRwFdriBhTBceet
X-Received: by 2002:a05:620a:47c1:b0:78a:3590:d56c with SMTP id du1-20020a05620a47c100b0078a3590d56cmr1238316qkb.41.1711039291277;
        Thu, 21 Mar 2024 09:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711039291; cv=none;
        d=google.com; s=arc-20160816;
        b=iA6CHM98yQZt6MsHXsYsMT4JXZ5/nX9qXDY2qqQ/mR6/W7Xr28+4/oJuwRyr8IL7/U
         ywTdKVy6HoNsYK4tKrE+UyPrPuaOdFEOeHIywnVN3zzvvL8VGHakuqKWN8t5XuPCkoCn
         Xn9iaIojnJg5qwItUzWfFWd+V1PLq3aKDFGcTQ8aTpVfZLz38se0acDzaezFV5+hAUY2
         T21MYYZ0TtDWi78+Fk1yuUOvTenna2Ld7Qr66XAUnKcrftUVW5m9OfTwz/2o0zT5sXSF
         i4whzQX4pk1oIPANcAlXPpJqRPtksrmYZTZnrkwP84/DmkEk8lRdd/Dl5c/qtkHObZE2
         Kelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1c5pfsClmOJ8Doe6EgVON5gxkIKYiCXcYmDvoJErD3c=;
        fh=Y5VZIjYRtBxqMgQ4wHQEQoHMAyy7RsyGcG3tgbRON7Q=;
        b=v0Nz7iQ+JG7FPiEGw6zhiWjcS0FQ37JI092HwRx3fuCyIyeTwG9TRJoZQb9rcH08L6
         vk69Td0fx+1bSF6IgyReWkbHK+F7th3ZeqU0tIl1cHb8mFMMTV8zF2EwoJlwNmWWNjUe
         ImMnMxRrGdtsQknAutIRYVGoh6hXXuZVTGKHIhALsuHUxSRArIygc8raFxhTb1BvGJMb
         P01QG1/VWKNKGTSp+S8YvL+keV122HK1nfiWMdnX3MWApuQ5H2Tte/OzqoR/fraTcq4C
         sNsB68vkDAYyM6HZdU9uhAtAO7ZitxaGBjvLsu348KQNUxvX/ygSKjnR0CYnkpa3crWU
         v2jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDDT88It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n27-20020a05620a223b00b00789fa5f4a52si64898qkh.785.2024.03.21.09.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 09:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDDT88It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnLTg-0007Zi-I2; Thu, 21 Mar 2024 12:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnLTb-0007WE-Kv
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:41:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnLTY-0006vj-Kj
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:41:11 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bcede226eso937204a12.1
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711039266; x=1711644066; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1c5pfsClmOJ8Doe6EgVON5gxkIKYiCXcYmDvoJErD3c=;
 b=PDDT88ItTMLrcOMMaRXnIBRHd4WCw1qDx2GLf+rDIg/19jxIJ8i1Umo8aKHeUyhmaT
 kOE4md8CRiQvQkcO3A2z1h875PrZjsUhgEGrKcdrV5tym8H0EXla4vjo3or1n4swn4DK
 D4vkGq4FLr/0xkrGhSTW+uzPJeA3dpFSU4hobP3wymmz8JJ47YkgZHDdqgZvL88oaJ6H
 sSeBQkEUUlXyVGLCBntdFuCcE3GA9zOlHiTixKd4G85VAOfP4mZLFH26C8RjaiBb5Jy2
 nWQ4Mgdt+VGR47/ZJaN6D3VcJF5kvXgxcxTAWm+hW31XRrSTUIk6Jqn+IlvL704yafPg
 JynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711039266; x=1711644066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1c5pfsClmOJ8Doe6EgVON5gxkIKYiCXcYmDvoJErD3c=;
 b=oHTufOms3m1WvpcrSR+fzKefcAWWfNUtdwsjfRvYg/ak5gUYNa2TfG+aR0lduvFdS1
 5yc6VCMyafq6SS6bVLbYDprEceJ+eoQYVl6NTHPBahuhN+YJ0C5BXqGTxcQkevtx4jUL
 y6SuoQufOgxkP94hi7zIYzHkEanpHcoZ+aYFqbeFUJsl8XG/vg25d5WReoScVOdRDpf/
 sxBgwPqLI9mnSv6ph59j9UVTW6iJDBU4Kw5vKoG4xle9B84tHtL8+QuPLtqVSk3/uacu
 G5aOmVMS+6xkHdIdXG594zRvM1bIrJiDRvbtU8LnH82QalIz3FUP0+RUieb1Hxdyaw80
 dVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl09n233X9jsTOfTKMzWeP5dT3ieND4cz+3gTyu9iGj8tkFRDtS6AOehaoW71IvQhSPWoeS5HP3WLZpdTUpC+mgZJU
X-Gm-Message-State: AOJu0YwvtWUatvxXzlfVNTI0nkhcOjRdHNSW8hjmOflD1VgXjZbrQaPh
 O9BxGMyUDf6zYFCprtJa9cCo9OohwGx2AuRWw4yKsSb8ogTeeUJMay8s71LX2/2HMi1aWns0rHp
 K2+ppS385Rfr+C6SOTy/IBvNAqm5XQzjxQj2c6g==
X-Received: by 2002:a05:6402:4496:b0:568:ac09:4a5c with SMTP id
 er22-20020a056402449600b00568ac094a5cmr3971754edb.11.1711039266395; Thu, 21
 Mar 2024 09:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 16:40:54 +0000
Message-ID: <CAFEAcA_J662fz9HxTFhRkM9otdEbWCZW6fXoCi_5kfqn3hkDeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
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
X-TUID: sGEQW+Nza8qF

On Thu, 21 Mar 2024 at 13:10, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for armv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.
>
> There are two modes for using this FEAT_NMI. When PSTATE.ALLINT or
> PSTATE.SP & SCTLR_ELx.SCTLR_SPINTMASK is set, any entry to ELx causes all
> interrupts including those with superpriority to be masked on entry to ELn
> until the mask is explicitly removed by software or hardware. PSTATE.ALLINT
> can be managed by software using the new register control ALLINT.ALLINT.
> Independent controls are provided for this feature at each EL, usage at EL1
> should not disrupt EL2 or EL3.
>
> I have tested it with the following linux patches which try to support
> FEAT_NMI in linux kernel:
>
>         https://lore.kernel.org/linux-arm-kernel/Y4sH5qX5bK9xfEBp@lpieralisi/T/#mb4ba4a2c045bf72c10c2202c1dd1b82d3240dc88
>
> In the test, SGI, PPI and SPI interrupts can all be set to have super priority
> to be converted to a hardware NMI interrupt. The SGI is tested with kernel
> IPI as NMI framework, softlockup, hardlockup and kgdb test cases, and the PPI
> interrupt is tested with "perf top" command with hardware NMI enabled, and
> the SPI interrupt is tested with a custom test module, in which NMI interrupts
> can be received and sent normally.

It looks like your changes to the GIC have missed the handling
of NMIs in the active priority registers and the running
priority registers (both ICC and ICV versions). The way this
works is that the ICH_AP1R0 and ICC_AP1R0 registers get an
extra bit for NMI status in bit 63 (luckily we had the foresight
to make these struct fields be uint64_t). When we activate
an NMI IRQ, instead of setting the ICC_APR bit according to
its priority, we set the NMI bit instead. Similarly, on
deactivate we clear the NMI bit, not the priority-related bit.
The ICC_RPR register also has new bits in bit 63 and 62 for
whether there's an active NMI. On read of the RPR we figure
out the values for these bits based on the NMI bits in
ICC_AP1R_EL1S.NMI and ICC_AP1R_EL1NS.NMI (you might find the
pseudocode functions for ICC_RPR_EL1 in chapter 13 helpful to
look at here). The icc_highest_active_prio() likely also needs
changes to handle NMI. Similarly for all the ICV versions of
these registers and functions.

thanks
-- PMM
