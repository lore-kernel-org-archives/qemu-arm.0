Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226AFC87FCE
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 09:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugKKi-0007T2-5F; Mon, 28 Jul 2025 05:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKKf-0007Ow-TR
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 05:39:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKKe-0004qG-15
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 05:39:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7746135acso1866654f8f.2
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753695581; x=1754300381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YOd4RDJ0CoJqioFxZZeW44OV/lyJoP9UfgmcjzOt9M0=;
 b=Dk/qSuoR6x7hhBjRj4k0EAivAgR4d65Ojz704EvzIC1Q0cky9TEutrJi0AAp1uoCWy
 VSWZzySwQ4Btd2Vm7spRiyEXHK7zHGPII4ZrGsW+4PooNi+FelMhBss7rnxBx1pkiL4h
 CUTOADJ+75C0E4oJ6CUXzey0lout+9a+FBHY2zN3/yvigK/cwxADfkmf3+XsJ6p5vmVu
 5xI5cXbZAiapI4AghI8tOxuR4XdfTjwC9ifxnfRidJHx8LyM/6SB4YQfbpa6+D9iFdim
 8SsggEFsy0f01s7OKu06FkOVnMf0MTPBy2WmnLp/mHTL7KID7J/I4HHLCIn7sYuhW7lv
 QGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753695581; x=1754300381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YOd4RDJ0CoJqioFxZZeW44OV/lyJoP9UfgmcjzOt9M0=;
 b=qrYA6mgCN3Bl8EyYzP2K9ASFgcox55W6fYr+Jzf8T6p7j/cP4HLKtfyqYJx2MbrnA3
 EU4RWRbpDXTdmY+UXgMsu2oZ8qloLLMSFGNFb7bfq9+jr6BEgX2Au4fKkeGoh4ctB9Tv
 3Li04syFOTf6oUiYWo/6AOcHs++tgMa+xZr5urGZG0LhroxmK4IaaYulym5NyPXljVXy
 r2HNUllThfEMzbEpO8/Nafcko6IBbktq/CamidcsWG9QQubb6F+G+UPjiRuUonQfT7rK
 Bz1qCyNQDdBYUwdcIB2FgloTHJMKxqD6o2/u4U9xtZAZS5BxUFeuZPD9sPcgZmNeZj7B
 /c0g==
X-Gm-Message-State: AOJu0YxyVr/F6m8TaIH8LMWDfaMbWMfmVi7TpXgLCcfNKaaSVm+O0/CZ
 8/j1563L+VRlXCPwWxCPEPGprN71MGsLqiP4DZVxsGvbqsovjpwXdbN08x3+73shyDk=
X-Gm-Gg: ASbGncu7KmPAHEo3VEWy4ZLu/FB0FOJqQ627lwO1jD69QqMxo7AiJSkkoGFEdnls7yG
 aoqlzPFDWY6Lpc4L5dIbTHxoqq+I30zvho/+wnc33I7mgelLy8oXLywvc6ZjEK6zefBcc4zgDPP
 Id05n41hERVeT8hrbsOjTINyMbmjV4r9WPNTSKhQbfUJSjvrUqWNvJuB1vibyLdBmirQZjUMvib
 TYH1WYSRcCQvWBvaz0SNoxSUvl63/yK0WnQcIWxMfwtr8NPH9mmOTJEtZh7aGIO2zMiMHMtPmIy
 D7ZdJrSSH2j/wsmcD/Bg79O5lH1kMWehJ61p900i/1NsT62ltSj2rg160gV5yB1k16T9hFHAoEH
 dwWgy0iaaSUqQjVIoCgegLJROHqWzG25sWDMqpQoi6Y2SEnhw49WrFLtCjSK+cxrC/g==
X-Google-Smtp-Source: AGHT+IGKhjPUsU8jnQgjjdTsQIS9q5jF3dy+Dy6KmswZAj45qr6AFATRbfEfMH3b+6q+FvSsqIO4Uw==
X-Received: by 2002:a5d:64e4:0:b0:3a6:d967:380c with SMTP id
 ffacd0b85a97d-3b77663e90bmr8073246f8f.36.1753695580893; 
 Mon, 28 Jul 2025 02:39:40 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705c4dbdsm153307095e9.25.2025.07.28.02.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 02:39:40 -0700 (PDT)
Message-ID: <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
Date: Mon, 28 Jul 2025 11:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 25/7/25 22:19, Pierrick Bouvier wrote:
> Move those files to hw/arm, as they depend on arm target code.
> 
> Pierrick Bouvier (3):
>    hw/arm/arm_gicv3_cpuif_common: move to hw/arm and compile only once
>    hw/arm/arm_gicv3_cpuif: move to hw/arm and compile only once
>    hw/arm/armv7m_nvic: move to hw/arm and compile only once
> 
>   hw/{intc => arm}/arm_gicv3_cpuif.c        |  2 +-
>   hw/{intc => arm}/arm_gicv3_cpuif_common.c |  2 +-
>   hw/{intc => arm}/armv7m_nvic.c            |  0

Alternatively add arm_common_ss in hw/intc/meson.build?

   arm_common_ss = ss.source_set()
   arm_common_ss.add(when: 'CONFIG_ARM_GIC',
                     if_true: files('arm_gicv3_cpuif_common.c'))
   arm_common_ss.add(when: 'CONFIG_ARM_GICV3',
                     if_true: files('arm_gicv3_cpuif.c'))
   arm_common_ss.add(when: 'CONFIG_ARM_V7M',
                     if_true: files('armv7m_nvic.c'))
   hw_common_arch += {'arm': arm_common_ss}

>   hw/arm/meson.build                        |  3 +
>   hw/arm/trace-events                       | 79 +++++++++++++++++++++++
>   hw/intc/meson.build                       |  3 -
>   hw/intc/trace-events                      | 79 -----------------------
>   7 files changed, 84 insertions(+), 84 deletions(-)
>   rename hw/{intc => arm}/arm_gicv3_cpuif.c (99%)
>   rename hw/{intc => arm}/arm_gicv3_cpuif_common.c (92%)
>   rename hw/{intc => arm}/armv7m_nvic.c (100%)
> 


