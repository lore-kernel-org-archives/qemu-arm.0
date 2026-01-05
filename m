Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B8C79FBB
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 19:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcpzR-0004lS-Fw; Mon, 05 Jan 2026 14:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vcpyc-0003r9-RJ
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 14:10:59 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vcpyY-0006Il-FF
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 14:10:50 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2a137692691so2681515ad.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767640239; x=1768245039; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dhtgWQS1Vm9zPefCAfHUe6dNgmWecElkjTBpZfot+/o=;
 b=e1rD3kcaJP0d5ixHtc8gSVmvKmYcdEQHX09Kq/ju0Amdk39TxQCh8BSqpZFDiC7sHW
 CEX4SAJXPOcWvva/GzMBfs7GVi96XAsydlbkbkj1Yfca6IPwR1IK7RobUYBao1R+C1GT
 QG9s00uB+kD3dXVFTaxPxE7F1BKvdxVeKw1XgJaa+IT9XXFrrpWvJlUW70krgzsoNUKa
 JWHYH8UQqOAHC2nxbxjzu85tXEJ+ipPdt9kfSddgeZvuXMnPARvVviWg7nYlErpI4liH
 04UM35zWnpbiBOC50cIY+5oWtpSjfwHTM2U9Eh1K8a44cbfYok1ENaEAzsusaBpS8mKQ
 Gu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767640239; x=1768245039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dhtgWQS1Vm9zPefCAfHUe6dNgmWecElkjTBpZfot+/o=;
 b=v/3BID7DHQZWatsl8Fb6eHl4BsbSgZVLmhlaeZQlA+ZrQfD29A0fOXqC1V9yiD4y/8
 ypK/9VYKA1ZTF02S22lSFcddr717DKYsV+Z72PpSqmUZQ4/SXaqEIXyaVb0/qZYHuZnp
 tuLqpZLpbXBRYAlXXwt2rsiZG4v3UUDFnxxxS+usxiRcpSnMbIg4TC9aJpFyMj8CA+8X
 Hff7NtwuD7N1z0+Nd3MIJ7IkEvBDCjonSJsRJ4EA1+ZfCBHOJNLy+VHfkK28aHyLENCY
 Y+IxVsPdgHRYZCo67E+PR3+cQAhXm3pegh0aKC5Iu+RrK5lkm66qh/TuVuR7m5G1+gZk
 mf+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfF3ICLcsakZLTIHvdhTJpwf9KPYh6n7z9Gxw531Wi2gv9yy8N4ab4OMyOwN/rjdQGsKZn6vQ1hg==@nongnu.org
X-Gm-Message-State: AOJu0YxG8f1H+zkBS/aHSgNBKgmIp8M4C9AIWH+FJ5MflcPLhpJDppWO
 mf+x7GAeWucIDnmqLe55lEhVTkrqMM3L1rVis9DpOHJnB8HqP69J8g9Ab8CPEWRTw3dIM3pKLNL
 UJFf2/fI=
X-Gm-Gg: AY/fxX6Qt6dalvmbK9XyRjgsNIpniPtfz1cpqHNv3ipum36F14GVN+ADaoB4Ki3BR6r
 gzGV49dDVhAkh4+d/q8veKYKykeW6HC3ca3XCtF6w/bTO93UPLdEZhoTCXo50GawKzDpW22V7tB
 4hUQUil8nRjFLHX7Yxc2+A6viJcxQIyGQM6hBiESaCHuIaQ+BOPZwbq6Z1PZB6w/OovwOdHEk1t
 /YQITib+uPZgDtX00qG1maH3uzwBDyTW2kZd6PsA6oexKuvDPI7AeWhP7cCaAnrHJQBQm8gJYnd
 826gPVol6FdsvVh7R0PldFga6mkyhXGiPH+bmLtIY0rXAyIgYMf41ue1SU3lSXpinMh7cQFwG7N
 ksOIl0ldLG0Q4WiOSostggzj7JIuNKYgJr46FjLiOGB3/H4YongkaSaXUlEn1L2CGtZ0FO845ec
 Kx3/GBuIAlsQ0nMEXSK0zzjUEoC47UrHrPXrWkDymiWvCr3SW/z7AKgSDH
X-Google-Smtp-Source: AGHT+IEPh1fkRoIZmQn5DssLx+2E862WXaqImyWA7eBRQ/wbj2xNXM3AGempovMPn77eijqwr2hx7g==
X-Received: by 2002:a17:90b:3f83:b0:34a:b4a2:f0bf with SMTP id
 98e67ed59e1d1-34f5f291014mr286982a91.16.1767640238754; 
 Mon, 05 Jan 2026 11:10:38 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f6db356sm123517a91.0.2026.01.05.11.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 11:10:38 -0800 (PST)
Message-ID: <94813024-10f3-4411-8eb8-a221c000d4e5@linaro.org>
Date: Mon, 5 Jan 2026 11:10:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] target/arm: make granule_protection_check usable
 from SMMU
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
References: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

On 12/15/25 4:01 PM, Pierrick Bouvier wrote:
> This series prepare granule_protection_check to be usable from SMMU, for
> implementing RME feature.
> It's based on Tao's commit [1] extracting ARMSecuritySpace from cpu.h header for
> convenience.
> 
> [1] https://lore.kernel.org/qemu-devel/20251012150701.4127034-5-tangtao1634@phytium.com.cn/
> 
> To demonstrate the purpose, this is the (wip) change to use that from SMMU:
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 80f48df3dda..1acff3bbd66 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1055,12 +1056,36 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>       }
> 
>       cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
>       if (desc_s2_translation) {
>           cfg->asid = asid;
>           cfg->stage = stage;
>       }
> 
> +    if (cached_entry) {
> +        /* The fields in SMMU_ROOT_GPT_BASE_CFG are the same as for GPCCR_EL3,
> +         * except there is no copy of GPCCR_EL3.GPC. See SMMU_ROOT_CR0.GPCEN. */
> +        const bool gpc_enabled = FIELD_EX32(s->root.cr0, ROOT_CR0, GPCEN);
> +        if (gpc_enabled) {
> +            hwaddr paddress = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> +            ARMSecuritySpace pspace = sec_sid_to_security_space(cfg->sec_sid);
> +            ARMSecuritySpace ss = ARMSS_Root;
> +            ARMMMUFaultInfo fi;
> +
> +            ARMGranuleProtectionConfig config = {
> +                .gpccr = s->root.gpt_base_cfg,
> +                .gptbr = s->root.gpt_base >> 12,
> +                .parange = 6, /* 52 bits */
> +                .support_sel2 = false,
> +                .gpt_as = &s->smmu_state.as_secure_memory
> +            };
> +            if (!arm_granule_protection_check(config, paddress,
> +                                              pspace, ss, &fi)) {
> +                printf("ERROR: fi.type=%d fi.gpcf=%d\n", fi.type, fi.gpcf);
> +                g_assert_not_reached();
> +            }
> +        }
> +    }
> +
>       if (!cached_entry) {
>           /* All faults from PTW has S2 field. */
>           event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> 
> v2
> --
> 
> - remove extra boilerplate/include/line from arm-security.h
> - use local var gpccr instead of config.gpccr
> - extract GPC enable check out of arm_granule_protection_check
> - rename as_secure in gpt_as
> - use arm_addresspace to retrieve gpt address space
> 
> Pierrick Bouvier (1):
>    target/arm/ptw: make granule_protection_check usable without a cpu
> 
> Tao Tang (1):
>    target/arm: Move ARMSecuritySpace to a common header
> 
>   include/hw/arm/arm-security.h | 37 ++++++++++++++++++++++
>   target/arm/cpu.h              | 59 +++++++++++++++++++++--------------
>   target/arm/ptw.c              | 59 ++++++++++++++++++++++-------------
>   3 files changed, 110 insertions(+), 45 deletions(-)
>   create mode 100644 include/hw/arm/arm-security.h
> 

Gentle ping on this series. It has been reviewed and can be merged.

Regards,
Pierrick

