Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E7BCD041F
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 22:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vctM8-0001jt-Vq; Mon, 05 Jan 2026 17:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vctLT-0001V1-LI
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 17:46:40 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vctLS-0007I4-0D
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 17:46:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-34c71f462d2so514396a91.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 14:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767653196; x=1768257996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AtOSIdHEYOKZd3I9JDVuViA2kqFTpsYJ+nWK7u/weiA=;
 b=hZvN/Cmhxy9Tc5maasU5ljWJucmmfxh3/nyaYa98sUvrwdAGbu1EqT2+vFVTsUXOmQ
 ckPpnWKEG0bFIzHzjLRQgOrpzcA7yZm9jKnipQUxH3AbtZ+IKY5ALkb7bNzBimeFR36e
 e1zxbLs/Pr1rcxbMfB0UgBUi68Cnhd2wHTTax6ASv7AWbKnEUh3j/qHKXvlZlfPkKuY4
 kKnwGioyhtY8maRPX0H1XzU2qkrAlbA6hw8+n/KF1QwQ8wph2txI5g5lDJkae+br+nS3
 7xV2nsMnem/oAR2yoVVewagJLLPFsNAqsSNC0gkXyRrlaQ5LvUnAzT/aLvS6+zOP8CEr
 jarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767653196; x=1768257996;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AtOSIdHEYOKZd3I9JDVuViA2kqFTpsYJ+nWK7u/weiA=;
 b=Wxk+IkGkrxbDMxrQGqIsuK8uVlnqzr+2knkLYdQ9+cwi1+4uo5EovsSba8/+3e0Usi
 atsFL7Xzx7zlv6hZgX5JJihZDVKGD1FBlfHQI3p7+iIy7qNu/LbdKB7TtJ7XgwEaAjbC
 sPtj2/mZoL7GzEbyAio5kbUhRw6WkkWwoazszzN6MaqoSIY5yKew9IuglMyP1mwvjDF3
 rbNI/iaDgwZt+XKfeHUBQjOD1s9JfZ8jRsDV+c467ZpUTazjNrwa3EyRAdXVLECyq+Y+
 BOiGMS/nQLNyQGS7cpr8SEg8Icb9l3jrC0NFS22dFKdqDE1s5XonRpc0d2+PncheL5Y/
 ViCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/SACzH0+7yZhVoYoZArHOC0dxDkia9qbTyP1X+zux4G799KfcucB/JIuo/3Rw0kMAA+jt1HCBjw==@nongnu.org
X-Gm-Message-State: AOJu0YwiWCold5XUhVYGAANTl7plDaQlNovFTwQP4Df4oGhcnasH38w8
 MZgAskpX7qo0y7cIEbXscG6nIZdpojnn0t3MCFjUCvQY1zUbRjHsee1UMMhLqN7aiDs=
X-Gm-Gg: AY/fxX6TRiivNaDk+oqqesgD4oZ7ceUv83SU33wEnzaIoCe1EBjMg3fIOIH9rj3e3De
 O/mQVAu+Xb7F1OUXzVQG34XFAXPDxIOs+GmEPEHjBWCse0te09a1FRAgE17buzjWBNXbpM6TaGm
 sfiHNY5Ck0dPEovUkS5UK76uweLx328jW/pyecU7iSfIdsYb39WZFkZVV7yJYvKApPuEom1XUTh
 zMC1hDuHR6HIqxgRxDzjusaJtKu4x9ban1VijJZU2c5yi8pBJ6FP9UgvHNhV6yPdVu0Hdamvj/G
 2Z7DmXbNEFP8USl8fsjKkUyEgMVao26SqfY3PBhy4PvKDpS4c74JQHD2ln4SMmqnnmA4CgmNRkZ
 wBjQAJM7z4XEViHbKvc/APXv4Sn2IZKM9X2Qltv47JKhRt/agTqUleVy7oMiRpTQqzEmDLnGufZ
 E83PXumAT+Zf0xGLijwJNBztnHw/7KvQ==
X-Google-Smtp-Source: AGHT+IHIhC6CnVad4mTKVHCAiL2GcNZ4SFhH3O8CeRGIKLFa/KwqH8H1+9DMA2huWnK/2s8VgglFTg==
X-Received: by 2002:a17:90b:1c0f:b0:340:2a59:45c6 with SMTP id
 98e67ed59e1d1-34f5f25a1d0mr711483a91.4.1767653196188; 
 Mon, 05 Jan 2026 14:46:36 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f7b19ebsm374160a91.3.2026.01.05.14.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 14:46:35 -0800 (PST)
Message-ID: <8c5f7183-4bb6-4086-901e-87815bcb595a@linaro.org>
Date: Tue, 6 Jan 2026 09:46:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/12] linux-user: add MTE_STORE_ONLY to prctl
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
 <20260105-feat-mte4-v3-4-86a0d99ef2e4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105-feat-mte4-v3-4-86a0d99ef2e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 1/6/26 05:14, Gabriel Brookman wrote:
> Linux-user processes can now control whether MTE_STORE_ONLY is enabled
> using the prctl syscall.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   linux-user/aarch64/mte_user_helper.h |  3 +++
>   linux-user/aarch64/target_prctl.h    | 11 +++++++++++
>   tests/tcg/aarch64/mte.h              |  3 +++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
> index 0c53abda22..afd2d6dbda 100644
> --- a/linux-user/aarch64/mte_user_helper.h
> +++ b/linux-user/aarch64/mte_user_helper.h
> @@ -20,6 +20,9 @@
>   # define PR_MTE_TAG_SHIFT       3
>   # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
>   #endif
> +#ifndef PR_MTE_STORE_ONLY
> +# define PR_MTE_STORE_ONLY      (1UL << 19)
> +#endif
>   
>   /**
>    * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
> index 621be5727f..5207580c1a 100644
> --- a/linux-user/aarch64/target_prctl.h
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -168,6 +168,9 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
>       if (cpu_isar_feature(aa64_mte, cpu)) {
>           valid_mask |= PR_MTE_TCF_MASK;
>           valid_mask |= PR_MTE_TAG_MASK;
> +        if (cpu_isar_feature(aa64_mte4, cpu)) {
> +            valid_mask |= PR_MTE_STORE_ONLY;
> +        }
>       }
>   
>       if (arg2 & ~valid_mask) {
> @@ -185,6 +188,14 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
>            */
>           env->cp15.gcr_el1 =
>               deposit64(env->cp15.gcr_el1, 0, 16, ~arg2 >> PR_MTE_TAG_SHIFT);
> +
> +        /*
> +         * If MTE_STORE_ONLY is enabled, set the corresponding sctlr_el1 bit
> +         */
> +        if (cpu_isar_feature(aa64_mte4, cpu)) {
> +            env->cp15.sctlr_el[1] =
> +                deposit64(env->cp15.sctlr_el[1], 58, 1, extract64(arg2, 19, 1));
> +        }

Let's not hard-code bit numbers.  There's also no need to re-check cpu_isar_feature.

So more like

	if (arg2 & PR_MTE_STORE_ONLY) {
	    env->cp15.sctlr_el[1] |= SCTLR_TCSO0;
	} else {
	    env->cp15.sctlr_el[1] &= ~SCTLR_TCSO0;
	}

In addition, should be done in arm_set_mte_tcf0, which needs to be expanded to match 
linux's set_tagged_addr_ctrl.  This code is common to the prctl and to gdbstub.  The 
function should be renamed at the same time, since it's no longer just tcf0.


r~

