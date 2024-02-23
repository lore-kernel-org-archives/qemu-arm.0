Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp421354ejf;
        Fri, 23 Feb 2024 00:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJ4rhTEY3Qti9mD5ha67kMuTXu1eSegsKJoMRLb4Xi84CtwwJelFdad4B1kl/n1qNUF+npe9eq2307YMIlafZHQ1gESW1d
X-Google-Smtp-Source: AGHT+IGFWw8zKbD8/j+lZg9Y1VCqFz5nKsuYTeYHFW5Lfvhj4dCTAq2KEv/+H7Ewp2MElHQn3P0b
X-Received: by 2002:a05:620a:cee:b0:787:84ba:5902 with SMTP id c14-20020a05620a0cee00b0078784ba5902mr1413193qkj.9.1708675760085;
        Fri, 23 Feb 2024 00:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708675760; cv=none;
        d=google.com; s=arc-20160816;
        b=v5ogmGJFhGGlhfu3cCG8an7TVFKpbzXUdog+ftCLFWrctFTNeUtjRnQzjnMyvUfF6F
         phVzTTu5AnggcQMMlzKhoMuHSGvudxT2rA9mq2ZJKEO1fEI9splBeFNkMY8McHA0y6RN
         usn9DECOPPENzbg3LV/SIMpnc11hDfsza7EyLC3wFJgziaSVOnpUUqQFGWZn1eH1hXDb
         HtOalQPR4nde0XPcpPiy+Wx0VOO5mPvhD0OzoYyHxvnhciBIwoEaSWFl1Mq8m/cHC4eB
         WDxzA8DW3iE0yt5Y9SAz8YET58c28PgNDkifBUObtKJQfMS9G+lOnioK8Qblc5zKIGml
         uSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=86N5yqaGFsgg9umc+p3KlvDRPAeebw/JoriOkg2e2Q8=;
        fh=q9o6LRDcNgQIqnLj5CY5m6hZMC4RxS6+td98ocJSUJ0=;
        b=XqbM0a9w7kJTrZ7YI0ekoePdkowu746lwLalL9DkJJtpMjryrplVVXB2nzSNx2v8Hn
         quipFwbuuNzXFmkv7CSpph3hPo9j6u2iHAG0kw5BIcyXtmgcNXt0zM2ZQrcVXnS0E6up
         AQDtQmZuHuy3yqmu/PXW4tzMKUAV5msCAhWpugfiw7nTaNHhF6JdEnqhuCRDIF+DJpt3
         c1FyFCyoKkKYmbUDdhrYQujOoJeqH3TQbr4P8bmNI0sGNI1iSyapyxa4KvoTphmxLwks
         h4gqzXEMYPxrgBpixzjpDzLaddjqf0vJlaIrdIOqMidzmqHX3Sb7zZeiRl0fEi8rEpV4
         HiWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jkpx20oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05620a144300b0078769caed44si10450011qkl.414.2024.02.23.00.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jkpx20oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQc2-0001rX-9a; Fri, 23 Feb 2024 03:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdQc0-0001rD-KY
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:08:52 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdQby-00016D-Mv
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:08:52 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3e706f50beso66073966b.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708675728; x=1709280528; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86N5yqaGFsgg9umc+p3KlvDRPAeebw/JoriOkg2e2Q8=;
 b=jkpx20oY0BnbGnMgla1ZcDOWIwv32P4NF1hC6NxTC6JTXBP9RjhhrFAWyFifoGUKer
 2QBqX66Ts3Zi6UCkG4pBJ7sBv6Nti/voqsKWlGiKt6XdM/qs7LjYVXAkhwaor/hbk9yS
 VgSylVAql93Npt0uKr/jsGtCd5P+cF7t8sQApBgcVfftaz5z+9tBf9gz0maxUamQrStB
 VxiCklnEiTG67JV4nwtxBcgkC6sISeFdzLDqRMWfijDfmf4fLYOrISm0QT2FEZx+B5mN
 S9wTwgoAP/2rnoexhoB3qnq5fJATtZ0CtUFnJbgCa0gzsS5F0IL1gGre5E2XcUyayzyR
 4/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708675728; x=1709280528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86N5yqaGFsgg9umc+p3KlvDRPAeebw/JoriOkg2e2Q8=;
 b=M4uK/nq6EyrqmjmBw7CEwqvebYu8I1AmmEQJ279j1GEqgSHZmHMvExneUjUxsQzep0
 OdfAyFQ59jC6Or5B9Nh9Rei2KVdSxZ5i1LKupe6EkCoFepXxixAZcQ4aLlO4oHtrRaAJ
 fu8MFYEx1ze7L946ML1w9cX6XTY+Fa48yc4foFDQoBPt/FdLJqby3MGlV7dSuyQWt1Js
 8q+tgrR25b7qlRGBg+Q1QjWrhwnhknd1P5i5fSC99v1eNE05WYakWj/XdWXfB+XHaeKa
 xjJ5R6gyiBukPp/S51b/bDJYksrqfFeYS4ruoCYZdTqgsetSAdYSVI2EnUnW22STfikb
 8rGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUACxT7AhhDPy9UKhSpWcI423Re8B4mqlJUClsYegyQWVlwuQBKWADQx8MQ3iKnMrtIExQESwNVtvoZixZUD9eWn1ia
X-Gm-Message-State: AOJu0YxrShr+V6KFBAM1imvlQ2feAIM8iOzhGn3ePSV+pUTAHiWTdpDe
 NfuFIYB6Q/8lHWA28DOMiev/btCnpdfJc+jDM0XgEySe8/4clAKmd1DN3dSuFLQ=
X-Received: by 2002:a17:906:5f99:b0:a3e:42cf:f6ae with SMTP id
 a25-20020a1709065f9900b00a3e42cff6aemr703304eju.19.1708675727807; 
 Fri, 23 Feb 2024 00:08:47 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170906770c00b00a3df13a4fe0sm6789445ejm.15.2024.02.23.00.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 00:08:47 -0800 (PST)
Message-ID: <bdab51cf-fca8-4fe7-9e47-31bd10259dfa@linaro.org>
Date: Fri, 23 Feb 2024 09:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] virtio-iommu: Change the default granule to the
 host page size
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240223074459.63422-1-eric.auger@redhat.com>
 <20240223074459.63422-4-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240223074459.63422-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UOdraw4JdR96

Hi Eric,

On 23/2/24 08:27, Eric Auger wrote:
> We used to set the default granule to 4KB but with VFIO assignment
> it makes more sense to use the actual host page size.
> 
> Indeed when hotplugging a VFIO device protected by a virtio-iommu
> on a 64kB/64kB host/guest config, we current get a qemu crash:
> 
> "vfio: DMA mapping failed, unable to continue"
> 
> This is due to the hot-attached VFIO device calling
> memory_region_iommu_set_page_size_mask() with 64kB granule
> whereas the virtio-iommu granule was already frozen to 4KB on
> machine init done.
> 
> Set the granule property to "host" and introduce a new compat.
> 
> Note that the new default will prevent 4kB guest on 64kB host
> because the granule will be set to 64kB which would be larger
> than the guest page size. In that situation, the virtio-iommu
> driver fails on viommu_domain_finalise() with
> "granule 0x10000 larger than system page size 0x1000".
> 
> In that case the workaround is to request 4K granule.
> 
> The current limitation of global granule in the virtio-iommu
> should be removed and turned into per domain granule. But
> until we get this upgraded, this new default is probably
> better because I don't think anyone is currently interested in
> running a 4KB page size guest with virtio-iommu on a 64KB host.
> However supporting 64kB guest on 64kB host with virtio-iommu and
> VFIO looks a more important feature.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/core/machine.c        | 1 +
>   hw/virtio/virtio-iommu.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 70ac96954c..38851df4b8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -35,6 +35,7 @@
>   
>   GlobalProperty hw_compat_8_2[] = {
>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
> +    { TYPE_VIRTIO_IOMMU_PCI, "granule", "4K" },

IIUC the current value is qemu_target_page_mask(), not 4KiB.
Could this be an issue for arm / mips / mips / sparc64 guests?

>   };
>   const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>   
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 0461b87ef2..e9e44a8ad8 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1558,7 +1558,7 @@ static Property virtio_iommu_properties[] = {
>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>       DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
>       DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
> -                             GRANULE_MODE_4K),
> +                             GRANULE_MODE_HOST),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

