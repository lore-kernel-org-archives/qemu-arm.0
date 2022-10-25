Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4244195ejn;
        Tue, 25 Oct 2022 09:30:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kfp26iy+0lP7oUILRUwJ3wINIZvQ/G+U3RHBK4b3M0fdCXTuvCTnPYdIwDnYHb9FzVfiQ
X-Received: by 2002:a05:622a:1646:b0:3a4:e8b5:b8c8 with SMTP id y6-20020a05622a164600b003a4e8b5b8c8mr1404385qtj.339.1666715413700;
        Tue, 25 Oct 2022 09:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666715413; cv=none;
        d=google.com; s=arc-20160816;
        b=jB+Wa+Aml6svR25ttBBThjxcW47042c7/hcbz1IAr33eWh/PhMlMekQDMB/1KWv5pL
         DWnHIjIizVptP+sVp0SW0h5SNeBQAs/hZcuYDvHxjax9ciFVux2sVsh7qEqp4vJ1Prvr
         jBxNq/UeAuMb8yDw611gsaabMeh5Evq1+UancshR0DpCksfCCeKyJpLvw3Iu1PbMwBEr
         SHHJMnYGejXsXN2fQWmdzneCwwG0G8MHx6TtLtUL8O3ESAhZ7AX1AKitl2QIKrGawMd8
         Glx0YXkKJNN7g2Nsip8/bSwjDeO7ysxpYf+mfGe7Nuyim1SC6DBxFJbDUtk6fHUmPUD9
         H44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nWofdGNEfqlQ+Jii/wTlqRhRTMCB/hdTcwspVO0GAuE=;
        b=WNRZ/506VrWOi+ov91QtdGQCoUBqGF1MW/A3VyjVtqmPUlu4KbaFOrWSGlJudeWDBp
         0cfgwvTkQzmYgnB7yRIRUfIF6pbnQI5EhGTzCVmzoqcFYFb1AnnoquJI7z/qkq5EGQLn
         HCNgqZjn8Vjs+E+1PWHgWkfj8miNaTKvy8s8iXsWYVjBGq6X1SswIMEaiEquP6OOg/+Y
         efLIKRVr8x0AF3XzulKDTfltgv93xSD3M7wVN3ptDYXW/clkZHH9TbT40FJITwMyjfLC
         xE2/vRyX7vkyYcz5vH8aSsXSDhJF+3ePe4qm5wponiaPK3WLX8+VQ5Lnj2vyytlZOKlC
         c0mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WyA4HZ1D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb26-20020a05622a1f9a00b0039a2d64c513si2099015qtb.337.2022.10.25.09.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 09:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WyA4HZ1D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onMoF-0005ei-1m; Tue, 25 Oct 2022 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMoC-0005AJ-Og
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 12:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMnu-0007t7-AB
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 12:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715363;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWofdGNEfqlQ+Jii/wTlqRhRTMCB/hdTcwspVO0GAuE=;
 b=WyA4HZ1D4aTc2Y+NfLnyXjoPdXRYMyjS3c2CAoqi6RwTC+D6KeHO7oIBZKNYh9KBZXOaWA
 vU4TBopLkYrBkzRZnHrQxu7HFY9BQT+7b3ixtobBoHXq0apP3Q99LB9+muKnawD2uguqZ9
 FcYBY4pocktkfaQQ1Y99BBC0zGm5QT4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-BR2_-8E6MyCW_WBfmP4BXQ-1; Tue, 25 Oct 2022 12:29:22 -0400
X-MC-Unique: BR2_-8E6MyCW_WBfmP4BXQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so11824435qko.18
 for <qemu-arm@nongnu.org>; Tue, 25 Oct 2022 09:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWofdGNEfqlQ+Jii/wTlqRhRTMCB/hdTcwspVO0GAuE=;
 b=caWuleop9BZ8u3NmMtNcRUgow8BGhsW8oY9gDCS1UTwb2fJSFq6DhpfcayWe0zqxz/
 1gRj0r1B5e2s0TdTKbXsHzDbzizyZQGq1st098f09lZqcCM3xVGEH+jXN4rhOxhGWXW0
 l6PYJkYBQ3VfXW4K3JmUShy2fbBiC3pGU1tOZn+x2KtBSv3RZHlZ1V/IIQAKsoQdi99m
 zI3Ap4q1U7AjN4AbO4uKnBq6x0JGg01RMxwJEtiLbgTqjwqWTma8LYJtXC6qIK7yu8T9
 qcaqK++jf69kgmr0+SUcsx9ebpHk/Dih7Mv51E6sVIka0mNTogYu435L2nc4qKW/hnQp
 IpqQ==
X-Gm-Message-State: ACrzQf3TESQq4yUmxnDQl7Qdqm2TL+N77jZDflG+DJOmh8iIYY3W7aIP
 NDfkoqVwhY1XinSkESHvaR8EOmwKPJ3Wj3Is1ZFdKpeiGl1hU6SGoxCVSAWZkHiHf3GBRg0DhLX
 eMURm+f9jFQJj
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id
 gc6-20020a056214230600b00473f77a85a7mr32245670qvb.106.1666715362145; 
 Tue, 25 Oct 2022 09:29:22 -0700 (PDT)
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id
 gc6-20020a056214230600b00473f77a85a7mr32245643qvb.106.1666715361888; 
 Tue, 25 Oct 2022 09:29:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a05620a12e200b006eeb185c209sm2231830qkl.50.2022.10.25.09.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 09:29:21 -0700 (PDT)
Message-ID: <42375c62-c9d4-3276-2ce6-04ee0c9222f7@redhat.com>
Date: Tue, 25 Oct 2022 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 5/7] hw/arm/virt: Improve high memory region address
 assignment
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-6-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221024035416.34068-6-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KATTGb/rw8jQ

Hi Gavin,

On 10/24/22 05:54, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is likely to be disabled by
>     code by toggling vms->highmem_{redists, ecam, mmio}.
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
> The current implementation of virt_set_{memmap, high_memmap}() isn't
> optimized because the high memory region's PA space is always reserved,
> regardless of whatever the actual state in the corresponding
> vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
> 'vms->highest_gpa' are always increased for case (1), (2) and (3).
> It's unnecessary since the assigned PA space for the disabled high
> memory region won't be used afterwards.
>
> Improve the address assignment for those three high memory region by
> skipping the address assignment for one specific high memory region if
> it has been disabled in case (1), (2) and (3). The memory layout may
> be changed after the improvement is applied, which leads to potential
> migration breakage. So 'vms->highmem_compact' is added to control if
> the improvement should be applied. For now, 'vms->highmem_compact' is
> set to false, meaning that we don't have memory layout change until it
> becomes configurable through property 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
the code has quite changed since Connie's R-b
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c         | 15 ++++++++++-----
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ee98a8a3b6..4896f600b4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>          vms->memmap[i].size = region_size;
>  
>          /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> +         * Check each device to see if it fits in the PA space,
> +         * moving highest_gpa as we go. For compatibility, move
> +         * highest_gpa for disabled fitting devices as well, if
> +         * the compact layout has been disabled.
>           *
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = region_base + region_size - 1;
> +        *region_enabled &= fits;
> +        if (vms->highmem_compact && !*region_enabled) {
> +            continue;
>          }
>  
> -        *region_enabled &= fits;
>          base = region_base + region_size;
> +        if (fits) {
> +            vms->highest_gpa = region_base + region_size - 1;

vms->highest_gpa = base - 1;

> +        }
>      }
>  }
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
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

