Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp993874eju;
        Fri, 5 Apr 2024 06:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAV6LFc6j7SJk4p/LCcY+Ig/kvc1usupGHHNqeF4JPaM4mPd3pcljuuhK3TGMTQWWQDjAKr/UOGTARC5X2pU5cIdwbNQdR
X-Google-Smtp-Source: AGHT+IEc7VFKwhhiVzsSOkAhKr8DtEDM4z7cOW+aTncp3S//a4GChjWprXTlcp8ZZvsli9xUsy8N
X-Received: by 2002:a05:620a:24cb:b0:78d:475a:df2f with SMTP id m11-20020a05620a24cb00b0078d475adf2fmr1727235qkn.4.1712324965526;
        Fri, 05 Apr 2024 06:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712324965; cv=none;
        d=google.com; s=arc-20160816;
        b=zKoPtUlym4HpjvmRg+B7Uw3/gzHrRsp6XsxBMhiAK3QA5h/hpj3eloLbyY3QDi8pOL
         Yw9WXCUhCAiXN176v+19du9jLdy2JSk5127KvnyAxRhSwcjbTk4NGW0ubU5VzbGgeNI2
         9wO3Y3FAo2itx+PRz3eU41VqaDYqrOk0LiMjxwURv88HFEoyDGOXky0nYjz6LrnhOWvR
         J23fZuBOx/YHkUL+LvYUTO4RGu3i/GpqU0I4Kg0S1QfoSHHSLr3tDZD4qmOUVr9H9KF5
         rD7aiDwSmtGYl4if8MwhCQ1b0/C7WDj0RaR4NIHvWXFjzN+CsysTDTFOTEFEliM3mcfO
         fhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wdCWLNv+gNFxjtNktRqs7Z1CW9aK0oxvcU92JTLyTJg=;
        fh=xgqvpcnzEVTCzZWSMDbGiFxiHtAMylYcPbS+NbplNIg=;
        b=rJyLmGtQBlnUpBn1Gti2FTS8JxLtBLuqnnxhL2xwEMG6YEZMoTO5Ndj+WDnUjkIkSY
         Fe8K0+flw/KFiSPLETsH40bfp/IbMGQcxdOmAvoT8Vs5jLnqbcG73P/yLn/HiVQ4rTJn
         KGmVRx/MWaSTswZmXuUYjJS4XsqSAZy8T5w7Q0/Xo1+a1+IbV7RI9tGzSihCB78Xnfh1
         zqE9Xpn6WEo8k5qe0QaAHdgUxfnuipoXHEKSa4Vv47PQUEFZE8Iilw7M7dmBZtk0KEwD
         3ita3bJ3asKiQfO5F1iqLxRBp9D9UYFcGWf5L4tiLau2C6R/vXuPK9e3d4znUucL87S3
         +Ing==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBifFoiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22-20020a37e316000000b0078845f8a288si1781974qki.666.2024.04.05.06.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 06:49:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBifFoiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsjw3-0000XK-E7; Fri, 05 Apr 2024 09:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsjvx-0000VU-VK
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 09:48:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsjvw-0001ue-FH
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 09:48:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso3175252a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712324923; x=1712929723; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wdCWLNv+gNFxjtNktRqs7Z1CW9aK0oxvcU92JTLyTJg=;
 b=FBifFoiPs/CJ0dU8jmH1vmaaLGR/sKIHpeG8DiS1S74nTJ+Cv14y6EKjeMI4nJkjLm
 9Oq+F3OEVEca5pn6VwizgS8ScVfiz2RbOyNBi4quDw6PQ7uO4VRYdpEecavlzE4L+BK2
 I8Rk2ifzhmMgingGOePqA7oxCs6s9bVNQdNa5VLkZKjrSLmwi9iJtkFt5SwngXB3kK7v
 Sk6ZJKB6mPUiXuAI6h0vDj47OQQ7ezIUCUMgdUjoOyBN26D2x9fmps65yeyYLR6341zm
 bfMfWJX9DAWgmlAeVgmXdk0Wbe+NcscAqdYPvom91jmi1/lWYD3QadAMwaUNMXEe9M82
 HElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712324923; x=1712929723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdCWLNv+gNFxjtNktRqs7Z1CW9aK0oxvcU92JTLyTJg=;
 b=onm36n1mPi7sRlegmSJJMRtROsOospUHSFhFph2HoyE/wlpXzSuShxWxWuvMXdbPCy
 qz2fX7OwaOmJa831uYnbBixxIVDAXwwAlTvYxM2iK9IAUXTCzYTDtn7o84fSeIa9Kf/t
 9uOs/1nZRio3zyWIRPjDprNzSuFNWiw6Vz5JK1jfM4v5Zt32P3DIXaeAtFpeHCK01iG7
 RCH6/POTvMFW2L1e6dcjX3X+pvt7AThanlbI+UU2KSrxR/zI1ll7iqN3wB8JX4g5oMpe
 92HWW8jv1yQJwgq7ZnnEDHIer3jUtdBLS3GyF5poHbmdDElvx69uoqTfqFviwwr49rbp
 jyRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0TeRMGWUkoty5JfNkJalyZlS7wpXKW82tWixBs9mqOE47QXz3cJFD428sUTH3bydPcmSmYJys7In1Oy8W3kS2oXM6
X-Gm-Message-State: AOJu0YwALBERPeuBWNhdxb9qgY/njnHYAOGHs1jIFQPavN10OztmxQag
 MHOyFifQft2OChal6/yhH4176m/y5JqoVNead3yDgdrxmMqmkCU6zJodxIdBNap9//zDn9dVpV/
 +A6hPCYDMOulM/k1x8TG/IKQM7PVuVoqUL5/ASg==
X-Received: by 2002:a50:8ac2:0:b0:56e:64a:2a47 with SMTP id
 k2-20020a508ac2000000b0056e064a2a47mr992030edk.42.1712324922780; Fri, 05 Apr
 2024 06:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-24-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-24-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 14:48:31 +0100
Message-ID: <CAFEAcA87CCLyk6=XzQANoqywfnSXSMcEkezAdH8bH-pO6AXKaw@mail.gmail.com>
Subject: Re: [PATCH v12 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Xs5eG8RlgHef

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> A PE that implements FEAT_NMI and FEAT_GICv3 also implements
> FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
> FEAT_GICv3_NMI

This is true but not really relevant here -- FEAT_GICv3_NMI
is not "NMI support in the GIC", it's "does the CPU interface
support NMIs". (And so I'm wondering if the code in arm_gicv3_cpuif.c
should be checking cpu_isar_feature(aa64_nmi, cpu) rather than
cs->gic->nmi_support; but I need to think through the consequences
of that first.)

The justification for "enable NMIs in the GIC device if the
CPU has FEAT_NMI" is that (a) it's only OK to have a GIC with
NMI support if the CPU also has NMI support and (b) if we
can turn on NMI support in the GIC we should, so that we can
provide the feature to the guest.

> So included support FEAT_GICv3_NMI feature as part of virt platform
> GIC initialization if FEAT_NMI and FEAT_GICv3 supported.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4:
> - Add Reviewed-by.
> v3:
> - Adjust to be the last after add FEAT_NMI to max.
> - Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
> ---
>  hw/arm/virt.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ef2e6c2c4d..63d9f5b553 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -729,6 +729,19 @@ static void create_v2m(VirtMachineState *vms)
>      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>  }
>
> +/*
> + * A PE that implements FEAT_NMI and FEAT_GICv3 also implements
> + * FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
> + * FEAT_GICv3_NMI.
> + */
> +static bool gicv3_nmi_present(VirtMachineState *vms)
> +{
> +    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
> +
> +    return cpu_isar_feature(aa64_nmi, cpu) &&
> +           (vms->gic_version != VIRT_GIC_VERSION_2);

I think we should add tcg_enabled() to this condition:
neither KVM nor hvf support FEAT_NMI yet. Defaulting QEMU to
not trying to enable NMI in the GIC device is the safe
option. As and when those accelerators get NMI support, we
can add the handling to QEMU and update this code in the virt board.

thanks
-- PMM
