Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB0FD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:05:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvN0d-0004RO-9L; Wed, 25 Feb 2026 17:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvN0c-0004Qz-D1
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:05:30 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvN0a-0008P4-NT
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:05:30 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so24384a91.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772057127; x=1772661927; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZOC1fZQySZvdx09TbHkXK5Co/GO1m47GRg7nvHM4dYQ=;
 b=IubMiK0uA/t5Dlb4K8Jn6ddVsmdK9om4SrSPzyc4PGz5cSAy4y5cYyXpuPOh83ytTt
 0uwadcbTpTB/hAmYGy4MjMqd6gWHM66aVexMF1Fb6YUp4ygbjQXMZVYU0D/9475FSdCg
 xVWvldKAi7Gga6cxek2FD3DDLDdfSP2ZUAsyGl/WFtZRl1xV4S6v0pVTnJIDDr/oHiyo
 qbn5X1Bs1dB1zugNsFljd8e9w4t65ZpEcj0QS7LfLvTp42yDVSLEFKvALQ3oi02cBSZA
 bIjjhlW2Sws9Yq4EZCZJlHGxVDiRGOwRxC8tCN8Xcabz1ow7chd8x9Gl8/irSLgljtys
 Ohdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772057127; x=1772661927;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZOC1fZQySZvdx09TbHkXK5Co/GO1m47GRg7nvHM4dYQ=;
 b=oEGDOJozdRoE/TPty6zo2vtLWXxIvN1Dpev5bdgs/xuRB34RCFZjNwTZX3QM+gXRMC
 Arct//iXLF8G7KspWeFiOtxUTpDW2GP8NPcz17kKVdX9Jj2QR6vS36W6xbKRcua7Y708
 L38dR+ZHxGgM1JfaPDrreGCv7z++aRKtgpg1B9wR1ExZj0fukOh4v/fzGIb0vgo4Eyu8
 5lAzFHvXGZ/lwnlZDcPKdCeLiMiLvQ+Al9nkIjJ2munnT9HgAUUbJuletXP+rdRHG+1F
 G2XxTvkZJKOQR1Kg5fupKVOrmNSTWo0HOaQqSgjfhvrMCrAdRjcdjruyI+ICiR2tKGvL
 uZ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXDKDH4o9lTReYjozLNByk5SIUjwQZpgM6F+1SDr6BHUAMVA7TfXLMmhxOsPqvNSByyyxp70Y+Fw==@nongnu.org
X-Gm-Message-State: AOJu0Yyavpaje6lagCVBCFs6w4gbec83KIEGhMvJF0a6UWD60yfM7r9Z
 1q0nZmkTDYRqmknZgGsbT63zNpS+YuweIVYGBaZWaZfNJE9NMcDEgFf282xoi3NZUNA=
X-Gm-Gg: ATEYQzypZlIvpnYNSy6C5RdI4E60i/yE2scSE4il8oXPb6aoT2kGt2Blpeqn0l/ncSc
 VCEBfdIVyRQBw0jOsq1W4yrIr1fNPfQv+vrjDhEajltPhd5M7j6XTYazC4TEPuCgBSSAHLiAKyR
 tmpjdVf0EM37zE+L8B59ASbiyPSeVzlazm6sMhXhtEsy8ObZt84JPXQ2+tdCWF5Ep47maCFAuCb
 bgi669aCzKwR+6wj/ZeaFVZc6yYKD7cayDYHIKFgeRm55H9T9YxuDCRBpVvtcFxOAhVlpHMm81G
 5Rfc26hosCKB7bV2rq7Q7kOT8+qhq9fUFc4EB3zi/RIEQDTgY+MK1dHGeWP18siTjc+R8J5VVab
 Qtqt/i1Xm1lky4UBYPHKZ9cEQuwIW0Rb0izwbRexTwxr2cfEWbtosJo0MOujkTeh5Sl3Vicjb16
 VsEYuIiPvZbEmZ23mcRKDtEycjZA+FSy6p1uB8A+s0B4a0mN5MHDC57XRQzRg/JSTAFO2D
X-Received: by 2002:a17:90b:2782:b0:34c:2db6:57a7 with SMTP id
 98e67ed59e1d1-3593da9f5f3mr103797a91.8.1772057127015; 
 Wed, 25 Feb 2026 14:05:27 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3593dda3a4dsm33973a91.10.2026.02.25.14.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:05:26 -0800 (PST)
Message-ID: <84f02ed2-c6ab-4c67-94af-637918dc8fa5@linaro.org>
Date: Wed, 25 Feb 2026 14:05:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 27/31] hw/pci: Add sec-sid property to PCIDevice
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101850.2996913-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101850.2996913-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/21/26 2:18 AM, Tao Tang wrote:
> Arm SMMUv3 uses a SEC_SID (StreamID Security state) to determine the
> security state of the programming interface that controls a transaction.
> The architecture explicitly states that the association between a device
> and its SEC_SID is a system-defined property, not something derived from
> the physical address space.
> 
> We need a way to represent this system-defined SEC_SID for PCI devices
> if we want to implement SMMU's Secure state. So that SMMUv3 can select
> the correct register bank and configuration when handling their streams.
> 
> This patch adds a new char *sec_sid field to PCIDevice, together with
> a "sec-sid" QOM property. The property is intended to carry the
> platform-defined SEC_SID for the device; for now only Non-secure and
> Secure security states are supported.
> 
> Future RME-DA/TDISP work will use the PCIe TDISP/DTI protocol to model
> Realm and Non-secure streams, instead of extending this static field.
>

In practice, it's not yet clear how will get this TDISP T-bit, since 
it's part of encrypted payload. So far, we are detecting config fetch 
and dynamically switching a given device to a new sec_sid accordingly.

Thus, we *might* end up reusing this field eventually.

All that said, for now, and in the context of this series, it's 
definitely a static property.

> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/pci/pci.c                | 7 +++++++
>   include/hw/pci/pci_device.h | 3 +++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 90d6d71efdc..aca0509f705 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -98,6 +98,13 @@ static const Property pci_props[] = {
>       DEFINE_PROP_STRING("sriov-pf", PCIDevice, sriov_pf),
>       DEFINE_PROP_BIT("x-pcie-ext-tag", PCIDevice, cap_present,
>                       QEMU_PCIE_EXT_TAG_BITNR, true),
> +
> +    /*
> +     * System-defined, statically configured SEC_SID for this PCI device, used
> +     * by Arm SMMU. Only support "non-secure" and "secure" security states.
> +     */
> +    DEFINE_PROP_STRING("sec-sid", PCIDevice, sec_sid),
> +
>       { .name = "busnr", .info = &prop_pci_busnr },
>   };
>   
> diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> index 88ccea50113..47ed4a13e40 100644
> --- a/include/hw/pci/pci_device.h
> +++ b/include/hw/pci/pci_device.h
> @@ -184,6 +184,9 @@ struct PCIDevice {
>       uint32_t max_bounce_buffer_size;
>   
>       char *sriov_pf;
> +
> +    /* Arm SMMU SEC_SID */
> +    char *sec_sid;
>   };
>   
>   static inline int pci_intx(PCIDevice *pci_dev)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


