Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp619142ejn;
        Wed, 19 Oct 2022 13:08:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5q3EV6dil8tQQvdjbloTfzzRvgqpy1pIlYEYnSac/Vm5dwNFVvlOuyVUHSSk7zLqg2Ym20
X-Received: by 2002:ac8:5e48:0:b0:39c:f24e:166b with SMTP id i8-20020ac85e48000000b0039cf24e166bmr7984222qtx.132.1666210101907;
        Wed, 19 Oct 2022 13:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666210101; cv=none;
        d=google.com; s=arc-20160816;
        b=zNQX52zaknVm2xqG9NG+C0E6V4nZ22YmdBJvlZksus5nP6BdpabkcQ2bGQSJ2YZCxd
         a77AKVUnB11y/enoNVbnzWZx7SN6OWqYvKLrBje/+MW1VTqIfT0mc3pA52+YZhcf4JY/
         uIGL78nOSV9XkPp1kpie2gqOlj369NSn0Wr6f3NrJr76RHMfT0iZf3LjVm09Qt3DExY0
         iicr2fCZ/CR57bfSKcxHVRZxTKuypfwgQN5Ma6bOV8LiF1OFDDKPTejzJAWChTo69ltD
         fSfsDHcK1oG7qQqmOAksKr5eeCX12O5hvmJOCGBKayIIv8JhfK2nsdIgVltJ5TDnSxrw
         PwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9zuhJbAgevZhYQIgB4M0gLNgTtbVMni6J+ZHX+ty1PI=;
        b=vU06lvCjDJ3Rc1zicppo+FmjQNdPX6hcx0tqEiIdR4x7SgXO6rq669HnOpv7WmveHm
         odCuMpaQ2d+JoSVNteeZhRo6SYvT9NMKu9Klsn/JgEU5uzCHkuV6/wHa/vtF+CXjUlZT
         FPKYB9x8uF4UQaFXB+HSp9CtCITin74hyJVkZAjBAm+CnAzC07/G1ABgr4DNoHWx896x
         QvXACzykK+CpzWfctu8Z+E8tkVam2qQC1C0M0wg+4xcn9k27iFToOXPZXsRju/PTT3X+
         Nv9SubTw6/7pQEw32oV8L8fNMxLU8pR9aYVakpvhsJE0+TFrhRYEWi/PRDffW+ZbCWQU
         mrLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d5M0fWiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj13-20020a05622a258d00b0035bb52e2a0dsi9862300qtb.11.2022.10.19.13.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 13:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d5M0fWiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olFMT-0008Bw-DM
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 16:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFLy-00089r-04
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 16:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFLu-0008SB-OM
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 16:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666210064;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zuhJbAgevZhYQIgB4M0gLNgTtbVMni6J+ZHX+ty1PI=;
 b=d5M0fWiycnmpJEJFomkQRjPvEa+ctThC4WLqa5fGXsHwUKtvH35lwqgtvRObXZHKqbDQ1Z
 1IbuU5w6xxJeAoGVmY1+AViGJY5mjFPdzmK0n9UVlbzjzpFuz9+6l/5jrh5ZOcrcYlUPBo
 wXXlko0Gd9RCifv1lHWGFZVZbEk2MV0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-Z-HjyStFN4uaY3OdYeTUHg-1; Wed, 19 Oct 2022 16:07:08 -0400
X-MC-Unique: Z-HjyStFN4uaY3OdYeTUHg-1
Received: by mail-qt1-f197.google.com with SMTP id
 fy10-20020a05622a5a0a00b0039cd5097697so12775546qtb.7
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zuhJbAgevZhYQIgB4M0gLNgTtbVMni6J+ZHX+ty1PI=;
 b=1BNfcUL6s1YEfiN8yMphniRz+SZC5jeNPToppITZ/q/0BwxMUsRWgfM7rUKq9twjCA
 kMV7hQdGSanpWEx1rHb+llbvWurIxBDt4XrqmK5mcBcSV1ofReK67FtTSymeLBpICsnl
 C1y5TKN90B0lbHRJX0vsWIGZE7LXYtESSzpl4i2mGakU/y5fnvQIZ68D9tAq6vlZq1Gv
 UocQOM8FU1c4BJlmCrI/SyiH36X79IULnDFmO0xygEpNWu8822xHoBDnY4N8BkFhGWXT
 NqIbfUypuj8BQvDjhZ/LXZIww1qAoMwKGWYfwyNoshRp4rSRPj0mCWpKQ1QnUD5h6ykF
 VR5Q==
X-Gm-Message-State: ACrzQf1t8DMht5rZJKoGcBRKXcVDUACcYl7QOW/72ehBnKSaphV0avzp
 O728JH2kVoVYEAaRNvu8wBRP0L3k+MWmreMp9Gq40k12E98OVrRwWXmTx27nZtBY2/zSaRnKHI9
 bOBdAO56hJ1j6
X-Received: by 2002:a05:6214:3017:b0:4b1:bfdc:d4c1 with SMTP id
 ke23-20020a056214301700b004b1bfdcd4c1mr8297323qvb.42.1666210027485; 
 Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
X-Received: by 2002:a05:6214:3017:b0:4b1:bfdc:d4c1 with SMTP id
 ke23-20020a056214301700b004b1bfdcd4c1mr8297299qvb.42.1666210027190; 
 Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05620a298800b006be8713f742sm5851738qkp.38.2022.10.19.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:07:06 -0700 (PDT)
Message-ID: <73b398c9-52d7-88fa-7e84-f9ed082799b0@redhat.com>
Date: Wed, 19 Oct 2022 22:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 5/6] hw/arm/virt: Improve high memory region address
 assignment
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-6-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221011231832.149839-6-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AdawX7I1bd4t

Hi Gavin

On 10/12/22 01:18, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
I would replace the above sentence by

One specific high memory region is likely to be disabled by the code by toggling vms->highmem_{redists, ecam, mmio}:

>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3).
I would suggest:
isn't optimized because the high memory region PA range is always

reserved whatever the actual state of the corresponding vms->highmem_
* flag.

>  In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
s/This improves/Improve
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
> 'vms->high_compact' is false for now, meaning that we don't have
s/hight_compat/highmem_compact

You also may justify the introduction of this new field.
> any behavior changes until it becomes configurable through property
> 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++--------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ee98a8a3b6..c05cfb5314 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1717,22 +1717,29 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        vms->memmap[i].base = region_base;
> -        vms->memmap[i].size = region_size;
> -
>          /*
>           * Check each device to see if they fit in the PA space,
while we are at it, you can change s/they fit/it fits
> -         * moving highest_gpa as we go.
> +         * moving highest_gpa as we go. For compatibility, move
> +         * highest_gpa for disabled fitting devices as well, if
> +         * the compact layout has been disabled.
>           *
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> +        if (*region_enabled && fits) {
> +            vms->memmap[i].base = region_base;
> +            vms->memmap[i].size = region_size;
>              vms->highest_gpa = region_base + region_size - 1;
> +            base = region_base + region_size;
> +        } else {
> +            *region_enabled = false;
> +            if (!vms->highmem_compact) {
> +                base = region_base + region_size;
> +                if (fits) {
> +                    vms->highest_gpa = region_base + region_size - 1;
> +                }
> +            }
>          }
> -
> -        *region_enabled &= fits;
> -        base = region_base + region_size;
>      }
>  }
This looks quite complicated to me. It is not obvious for instance we
have the same code as before when highmem_compact is not set. Typically

vms->memmap[i].base/size are not always set as they were to be and impact on the rest of the code must be double checked.

Could this be rewritten in that way (pseudocode totally untested).


static void fit_highmem_slot(vms, *base, i, pa_bits)
{
    region_enabled = virt_get_high_memmap_enabled(vms, i);
    region_base = ROUND_UP(*base, extended_memmap[i].size);
    region_size = extended_memmap[i].size;
    fits = (region_base + region_size) <= BIT_ULL(pa_bits);
    *region_enabled &= fits;
    vms->memmap[i].base = region_base;
    vms->memmap[i].size = region_size;

    /* compact layout only allocates space for the region if this latter
is enabled & fits*/
    if (vms->highmem_compact && !region_enabled) {
        return;
    }

    /* account for the region and update the base address/highest_gpa if
needed*/ 
    *base = region_base + region_size;
    if (fits) { 
        vms->highest_gpa = *base - 1;
    }
}

static void virt_set_high_memmap(VirtMachineState *vms,
                                 hwaddr base, int pa_bits)
{
    hwaddr region_base, region_size;
    bool *region_enabled, fits;
    int i;

    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
        /* we do not break in case the region does not fit since
fit_highmem_slot also updates the enabled status of the region */
        fit_highmem_slot(vms, &base, i, pa_bits);
    }
}

>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6ec479ca2b..709f623741 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -144,6 +144,7 @@ struct VirtMachineState {
>      PFlashCFI01 *flash[2];
>      bool secure;
>      bool highmem;
> +    bool highmem_compact;
>      bool highmem_ecam;
>      bool highmem_mmio;
>      bool highmem_redists;
Thanks

Eric

