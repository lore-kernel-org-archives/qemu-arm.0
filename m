Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp757903ejb;
        Wed, 15 Feb 2023 10:38:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/dKyfVfrEkZmq+Ns/RavG3bsVmoQ1ltm0OTLEysmA4t8ZwWnUtiCERfsBNaoR+u9uup5g1
X-Received: by 2002:a05:622a:588:b0:3b9:a777:3d9a with SMTP id c8-20020a05622a058800b003b9a7773d9amr4486566qtb.44.1676486291232;
        Wed, 15 Feb 2023 10:38:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676486291; cv=none;
        d=google.com; s=arc-20160816;
        b=Etru/0v77aheEsyG8GyTDQQBmO4ozuCtP3EtpvY4fH9SCvdPCeVlrUCXs3h2gri51g
         PFZzPQSCuXNulp9gvjUM/yBDUHsrp8CpsLsqFV4DyK1xlHoD6uoKOdUJSOoHrQ4QL1Gx
         oLmxDPhD47nCWC184Kn+wv5le9dryQnKUR9PTe3zWuPo54yixbACJUL+LsYyzV0WUQzt
         cYBNb1c4mfbPy/4GU7FjDddmLoTjkvEcjCbXBRQK7LC7YShhGEQ66BwPEfXTkMTDoZT1
         ioGyvWdX+ZkNAwlInvr+iZlqz+sVVUrfcZtpbxiiGGXOJJMR/R64g/UhriVoGTXFQZqt
         ha8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jj7JRsuQIiob4Rob0Xcirl6NXggLSNMQMDf1AR4A4G8=;
        b=nhcr5VcnqYo6CQJbZ52O7JP9oNwZymwfaLd6v+Ax89/TZEcvIh5oC0oKiPmUOQVMm0
         Vqwvtv66bEk8raf5RCL5NvlF6wZBedPBQt3weUz3VDkoWzVaGneiIdH1VLG9lEEZDYlG
         anpu0dbgce5/+VpmCpQLNjxSzZdnrua/JXr0j3ON+qhchVjrINSmmhIwHhAN+XUFQEBz
         4HGHSqQ91zNAn7RwMnTrqAi8kqSNvpgJfNNIIG4/oVBIfcwIZugdctIp8ml3jn8ldea8
         M7/moZh4GE0oHcw5h+E0x1GwoGiXnBktbZ5VTTPH2dhlXZpaT6/gCxsmR095Hzb1xT/z
         HYJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bNG9tXEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020a05622a11c100b003bb91e22b76si12756056qtk.413.2023.02.15.10.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 10:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bNG9tXEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSMfP-0003QZ-61; Wed, 15 Feb 2023 13:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMfN-0003Pm-Bl
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMfL-0004z7-7S
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676486279;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jj7JRsuQIiob4Rob0Xcirl6NXggLSNMQMDf1AR4A4G8=;
 b=bNG9tXEozq5rso81ozeCazzEyHxy4ybFyUc2osOEXEsH+BLe2pgZPCLTw1XOIRarRXd5rT
 tFu+z+X9wxxbW9dXDAjPb5shMbIK76CydJb0F8H2ZOob+E+efb5mzb6ldXoDPMwK9+D2U+
 Bb6zQWodefzqctYfhmm1VGw5tfjrkaY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-_pbKwP_rPs2uUXYapcr-_g-1; Wed, 15 Feb 2023 13:37:57 -0500
X-MC-Unique: _pbKwP_rPs2uUXYapcr-_g-1
Received: by mail-qk1-f198.google.com with SMTP id
 q13-20020a37f70d000000b007283b33bfb3so11837303qkj.4
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 10:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jj7JRsuQIiob4Rob0Xcirl6NXggLSNMQMDf1AR4A4G8=;
 b=ae04aUUgzVR6kWYcic1kl7mfok5VLUnKRMedBNmzNi8/azpiCXVlI1IcOjIFgTWzhP
 +60FJK0vVXBB+tJ25zFQpJj1C+jSRQfOTV3CBBjX+swMxlbzLjzacPU0pLIXN2YD5zAj
 ljeHR2AddqX4CObC5J1fToS7uNAKeWIJ5cvBeL+8Jtq+4HvzG6qy6Divu+J+ePaSc/On
 LI7xDdzfAGsx8xET+6GJR1jBUz5v87HUld/EzqmRVKrN9YUaoMpWlaqqsv+oqwidsgMp
 moBZJijqQCobSo/lW6sQSOXIh3lKOD4dggmPqq/LMFgJQu017IA06kRd7WGbROUYAvYY
 Pu6w==
X-Gm-Message-State: AO0yUKVPRp/nOLjqIC/+Z6BkJ8mFo+Icg5x480MXcyfLSAuttx2Ghwgz
 0IrrzIxwGGwTFwawmXYePH5NYazY/c95ttUjE2Asvka04GI3QlQ5JS43PTOOCHgr1kQ3Ko4DLsc
 IgyXEGm3s81ae
X-Received: by 2002:ac8:5881:0:b0:3b9:2c3:675a with SMTP id
 t1-20020ac85881000000b003b902c3675amr5566966qta.62.1676486276212; 
 Wed, 15 Feb 2023 10:37:56 -0800 (PST)
X-Received: by 2002:ac8:5881:0:b0:3b9:2c3:675a with SMTP id
 t1-20020ac85881000000b003b902c3675amr5566924qta.62.1676486275832; 
 Wed, 15 Feb 2023 10:37:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a372c06000000b00727538eb831sm14494256qkh.86.2023.02.15.10.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:37:55 -0800 (PST)
Message-ID: <7fa87a34-48ad-5b7d-a034-44b925f0d1c1@redhat.com>
Date: Wed, 15 Feb 2023 19:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 08/16] hw/arm/smmuv3: Support S2AFFD
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-9-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-9-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cMEssV/kWsvo

Hi Mostafa,

On 2/5/23 10:44, Mostafa Saleh wrote:
> Parse S2AFFD from STE and use it in stage-2 translation.
>
> This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
> "[181] S2AFFD".

from a patch structure pov, to me it would make more sense to add the
STE field decoding in
[RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2 and use it
in hw/arm/smmuv3: Add page table walk for stage-2
>
> HTTU is not supported, SW is expected to maintain the Access flag.
>
> This flag determines the behavior on access of a stage-2 page whose
> descriptor has AF == 0:
> - 0b0: An Access flag fault occurs (stall not supported).
> - 0b1: An Access flag fault never occurs.
>
> An Access fault takes priority over a Permission fault.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c     | 10 ++++++++++
>  hw/arm/smmu-internal.h   |  2 ++
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          |  2 ++
>  4 files changed, 15 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index df0d1dc024..541c427684 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -434,6 +434,16 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>                                       pte_addr, pte, iova, gpa,
>                                       block_size >> 20);
>          }
> +
> +        /*
> +         * If S2AFFD and PTE.AF are 0 => fault. (5.2. Stream Table Entry)
> +         * An Access fault takes priority over a Permission fault.
> +         */
> +        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
> +            info->type = SMMU_PTW_ERR_ACCESS;
Wondering how you are going to differentiate page faults at S1 versus
page faults at S2.
Event number #10 differentiates both and recorded fields are different.

Do you handle that somewhere?

Thanks

Eric

> +            goto error;
> +        }
> +
>          ap = PTE_AP(pte);
>          if (is_permission_fault_s2(ap, perm)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index b02c05319f..7d3f76ce14 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -66,6 +66,8 @@
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define PTE_AF(pte) \
> +    (extract64(pte, 10, 1))
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index ec64fb43a0..3ccb9d118e 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -524,6 +524,7 @@ typedef struct CD {
>  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
>  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
>  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
>  #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
>  #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
>  #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c49b341287..7884401475 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -436,6 +436,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>              goto bad_ste;
>          }
>  
> +        cfg->s2cfg.affd = STE_S2AFFD(ste);
> +
>          /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;

