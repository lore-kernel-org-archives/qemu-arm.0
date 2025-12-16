Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22560D5B87B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 00:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVIXK-0001KT-JM; Mon, 15 Dec 2025 19:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIXJ-0001Jm-IY
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:03:29 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIXG-0002jB-Q1
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:03:29 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso4268113b3a.3
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 16:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765843405; x=1766448205; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gu/2tsiDhVNqEBbh5pknrRfIp7Eg6MhODtDnzF+EJcM=;
 b=t4xRLSA/iaIu080FDesTiWQlZW/nHJj5ntiGjqODj69vCX9RuoyPQ99DFuh6qasJzU
 yuOZ/xGRMHtNkrS81OqmBZ+BB0/9dWiNu0Mri4p26LSLoxreI/SK6Bta5zmhMbYzQItP
 irb0zUDqB+4zYvj1ycCRniseMOu/hJWFRAZ2cElnxvEdvkCn6SRar8WjbdGhSL88uOV3
 7G8NBt7C+EPK0SNMozxJHEjybYrNfbEoO4wfShJMoPxv3rLcu/p4J4YVB1Ja4zvLpSTg
 oyjPrlKzu+8rZGefHtufbmw91Q/63b1+jGo6p3oEfNW28Xly6jioAzOkke87zkaJXnz5
 43Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765843405; x=1766448205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gu/2tsiDhVNqEBbh5pknrRfIp7Eg6MhODtDnzF+EJcM=;
 b=Guo4rk4+UNpzPUkyVLLYGmzXKvjgO+NaNPqVCosmxHcblfp9CvlZnH32T1RiOLMzDH
 sJ/NcFmipihUvL+Kmm2ae7ZmTNb4pp6o4L1E77hq/FcH8fStS/nSkuSFKD2FzTVUg6IA
 sziAGOiqmOelvlGffqwi9rBIffJ7jVWRIt0WM0MNjMnNhjCxlBEnfupFv/059sdU5+yC
 A2WE1apymYLhKsS5VpU/qGcbdoRznQOb0D8DZsGWKrlni78An+JvhZ2h9fLs308Zdf+z
 +Dmq0arAUZqYvgVA1m1Zq/D6mFf4h0dRgyx2DnczTbfqXpnbXaPskCQoH1lpu6NGFUJU
 RpAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd8tvenuKhKGPfBL25yWNl1e+YU5uIide4EMv86dDBKvhqHCYHl0j8Day7Kxa6VOiSx0LWADGG4g==@nongnu.org
X-Gm-Message-State: AOJu0YzcgX3+YdXfA52CufxLyYd6smMKbb39sFcYdUESGWUcIZGQAxIy
 nk0KNanQwo2BUZxsPz7f8Q0vO3NhlQRW4uKhfThpwmKwDeUFVrX15SpcMe/lxvlqtvU6N+yvqcT
 Aka3mDpU=
X-Gm-Gg: AY/fxX76jFQB237ZERq0qzBo4N3Mdw5I1B5k3q0e+QVEHhthmixWx1vyNGHip7cqceA
 +am+u3lfeABohtltEMp+Gye6uNCCjHUkgscVhS5FCy1jsW8x7l/5sk00APL0RymCFfQdgn51FDC
 687JsYuvzPHFcL8jTsChtnG3F0MdNfoOEwvboyilijJeLLk/I2v0myqfHZQ2ZQl9bBJb6JrO0dy
 OyUR7ACGxFpK7XXmcpYLAUj18TueqAh25lj7mqK+NP863iLqEqGJYBtYx+9zdYtzsSR+5hXO8eU
 ZWwLA9xOGROGT8NfH/eJlgZGPLds6TigonIqhxpT+u9E10X/UlZ4bvkZScw0twLk/lHwp4vNi8x
 feHmos7AWLjYRa5N5t4J5Ozw9NUzKGGmoF9VAq625aawGl4Ej8+3EH2i9ilvkbmVoDUUzwD4LPN
 6WCDgRA/EABkwBMdABJHWu6Zq/ydgSSb0fTRIFnXtE4QZDo2Hn6Ric0d/nmErJ4HdNMw==
X-Google-Smtp-Source: AGHT+IFZoALUa3P6wIQ/xD0g/ppmbVpYFu53iYVxRLGJ9O5xamVDmXwI5xPeZpPmfHOOIip42mNYpA==
X-Received: by 2002:a05:6a00:4004:b0:7e8:450c:61bd with SMTP id
 d2e1a72fcca58-7f671475099mr11119756b3a.45.1765843404718; 
 Mon, 15 Dec 2025 16:03:24 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c4aa751bsm13847054b3a.41.2025.12.15.16.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 16:03:24 -0800 (PST)
Message-ID: <5f51cffa-5c7c-4524-ab68-96d93746e4fd@linaro.org>
Date: Mon, 15 Dec 2025 16:03:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: make granule_protection_check usable from
 SMMU
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 12/11/25 3:44 PM, Pierrick Bouvier wrote:
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
> +        hwaddr paddress = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> +        ARMSecuritySpace pspace = sec_sid_to_security_space(cfg->sec_sid);
> +        ARMSecuritySpace ss = ARMSS_Root;
> +        ARMMMUFaultInfo fi;
> +
> +        ARMGranuleProtectionConfig gpc = {
> +            .gpccr = s->root.gpt_base_cfg,
> +            .gptbr = s->root.gpt_base >> 12,
> +            .parange = 6, /* 52 bits */
> +            .support_sel2 = false,
> +            .as_secure = &s->smmu_state.as_secure_memory
> +        };
> +        /* The fields in SMMU_ROOT_GPT_BASE_CFG are the same as for GPCCR_EL3,
> +         * except there is no copy of GPCCR_EL3.GPC. See SMMU_ROOT_CR0.GPCEN. */
> +        const bool gpc_enabled = FIELD_EX32(s->root.cr0, ROOT_CR0, GPCEN);
> +        gpc.gpccr = FIELD_DP64(gpc.gpccr, GPCCR, GPC, gpc_enabled);
> +        bool gpc_check = arm_granule_protection_check(gpc, paddress,
> +                                                      pspace, ss, &fi);
> +        if (!gpc_check) {
> +            printf("ERROR: fi.type=%d fi.gpcf=%d\n", fi.type, fi.gpcf);
> +            g_assert_not_reached();
> +        }
> +    }
> +
>       if (!cached_entry) {
>           /* All faults from PTW has S2 field. */
>           event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> 
> Pierrick Bouvier (1):
>    target/arm/ptw: make granule_protection_check usable without a cpu
> 
> Tao Tang (1):
>    target/arm: Move ARMSecuritySpace to a common header
> 
>   include/hw/arm/arm-security.h | 54 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h              | 39 ++++++++++---------------
>   target/arm/ptw.c              | 41 +++++++++++++++-----------
>   3 files changed, 93 insertions(+), 41 deletions(-)
>   create mode 100644 include/hw/arm/arm-security.h
> 

Sent v2:
https://lore.kernel.org/qemu-devel/20251216000122.763264-1-pierrick.bouvier@linaro.org/T/#t

