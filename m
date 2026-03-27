Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07A110AB832
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 00:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5ume-0002VI-Q9; Thu, 26 Mar 2026 20:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5umd-0002Uz-E0
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 20:10:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5umb-0007Td-Uf
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 20:10:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c73a5473bbdso672813a12.2
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 17:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774570236; x=1775175036; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lmKWOKyL4qUDAkZ+KUmhT+D2iG2E4/iCW9Xv6sanwNw=;
 b=QBTRY8/R77WdFrwlt4bqTQBSegLoVk6J8jYPssGHfzbUDgeGL67wCjpN1Us5SiEqAS
 /qpZc04oOk1IFn1SOYd/imE0nW7umGjVo5hx3ol0Lac1yt3QZdFmH38KvTO7SemzxFU3
 2tyYRNx3WiQW2URo3f2wxlXMb6hIPee2Wkr72i0rzeyCuyMufCKG9J+5Jl7Av44PdXbA
 mi5SWGREw2nlEl9cG4laRboPF0nCUBjubtfJqMeM4+/OX96ZhwVXO15pW2m2maoh134r
 iPWUcgN+fubLmeG2yjPmbCEM2uvM1Vzk012QD6jo5LmYJv0FZDrZUr02xKzUq0FDVTVU
 4xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774570236; x=1775175036;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmKWOKyL4qUDAkZ+KUmhT+D2iG2E4/iCW9Xv6sanwNw=;
 b=Rn0s985X79EBKbNtYh+h/4K3DvroxmiuTQKaHarRastv74+Q6kejFxDaMMwgHGiRvU
 jKsa7qcaODS9tCFML1fygM7HX5Lk3Bv56YmCyexi5B/8zVNCOh4ZjjzderI1McsDfkFC
 0xTJr/XthFe9irGPWpEMLTCCLUHJgD6zrEj6/EIualUuA0RErdKN4gVUDouRWWa/qx6T
 ko/71Lgisq5gnnJLPHijlNlbp4pSWGAMfWynH5pwwfEJ5q/cgJLoaoiGkWvkRHrpDHXP
 bfokw6EPz0I9aMLbJQ6+Ckv1SOCOF/3pK3wh3iDvkpRoXzNJzLsUZ5dwXg2FeFZO3KTd
 P63Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaTfFENXqxsJZGu1feOFF0J4pwFw+UTlaX1tW11MRe/7G1tAgOzZZVK6Ch/y3PaIh/bql5eSq+yg==@nongnu.org
X-Gm-Message-State: AOJu0YzsnSshWD3Y+oqltD3xW2Mc3cza6KufpqZtevf03wuZ5jozIGHo
 214yptIZmHu5JeGM/1z/BPBssUChz3f01Y7ueNrUnma/0IemedPoJFnn8UxrPm9a2k4=
X-Gm-Gg: ATEYQzzefDX6XO6Q+AZq6amiZL9gj1v4pa4eTsOf2P3eff3RaYHIOUunE3OxW/SElSK
 1tzxAOZcTlEXvk6W9e6CtMp71fI8yztbyXV1pxzdtUS+jHUbwTITTLTP9Hx2/5TRW/NeBmPkxCo
 Sb68CSY6lMwzLXD17Updi6VRkrI7PU2ErPb3zE4gC7TA3DwkZIl2NQOPEnkuMMGuj0L4Fabo9oR
 ckhddXCqpDcQeNxErWaYrcVuB3XGv7Nd+zWLVTnXSLjUfpT3EanNbHGWDG/nf6vgh+oJRle7/qp
 LPPcRldRpNBxzeUX/DSp+In60yJduqEI0ZzmcFS/IgERrbMqH8kYs/vhHXjvQx1bbgo55SoWPuz
 tOzCeIdMdIRPBltwsLbPGE69dF3giiyvrngduc66n6EjS3LAr4TVNmj5J9QMtecKr0YKORiA8qz
 i9nWh0eIwrMRfOXDMCpWcva9H5rnEZiyyiVtj87cuLAQ==
X-Received: by 2002:a17:902:f549:b0:2b0:7d3d:756a with SMTP id
 d9443c01a7336-2b0cdcd1de2mr5720805ad.35.1774570236120; 
 Thu, 26 Mar 2026 17:10:36 -0700 (PDT)
Received: from [172.16.11.156] ([103.100.225.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc76ba80sm42093385ad.2.2026.03.26.17.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 17:10:35 -0700 (PDT)
Message-ID: <e3ab0758-3c9b-4fad-a03f-d319e3753eee@linaro.org>
Date: Fri, 27 Mar 2026 10:10:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] hw/arm/virt: Add machine option 'mec'
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
 <20260319022335.22523-6-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319022335.22523-6-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 3/19/26 12:23, Gustavo Romero wrote:
> Add new machine option 'mec' that enables and sets the memory used by
> FEAT_MEC.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   hw/arm/virt.c         | 76 +++++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/virt.h |  1 +
>   2 files changed, 77 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cab2e21e8a..7d127a4205 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1762,6 +1762,27 @@ static void create_tag_ram(MemoryRegion *tag_sysmem,
>       memory_region_add_subregion(tag_sysmem, base / 32, tagram);
>   }
>   
> +static void create_mec_ram(MemoryRegion *tag_sysmem,
> +                           hwaddr base, hwaddr size,
> +                           const char *name)
> +{
> +    memory_region_init_ram(tag_sysmem, NULL, name, size / 32, &error_fatal);
> +}

The "32" divisor in create_tag_ram is "2 * TAG_GRANULE", but due to placement that 
constant isn't actually visible in virt.c.  That could certainly be fixed.

Here, you want "size / TARGET_PAGE_SIZE * sizeof(mec data)", so that you store 1 "mec 
data" per page.  (IIRC the mecid is 8 bits?)

> @@ -2495,6 +2518,28 @@ static void machvirt_init(MachineState *machine)
>               }
>           }
>   
> +        if (vms->mec) {
> +            if (tcg_enabled()) {
> +                if (tuple_memory == NULL) {
> +                    /* XXX(gromero): Add object_property_find(cpuobj, "tuple-memory", ...) here. */
> +
> +                    tuple_memory = g_new(MemoryRegion, 1);
> +                    memory_region_init(tuple_memory, OBJECT(machine), "mec", UINT64_MAX / 32);

What is UINT64_MAX / 32?
Tuple memory should be tied to ram, so this should be the size of ram.

> +					  "Memory Encryption Extention");

Extension.


r~

