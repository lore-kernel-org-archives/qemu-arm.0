Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3CF10F285E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 17:26:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6Awm-00041t-Ep; Fri, 27 Mar 2026 13:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Awh-0003sU-6W
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 13:26:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Awf-00053v-Jj
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 13:26:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43b9f43a1feso668332f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 10:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774632364; x=1775237164; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0TtG+BgG5tZjsfByAZmaZW5KeUJ97ibJiE2T0OB+Mk0=;
 b=NPnvN9uBkYY7Z5KzF9bQzYeMmI/t5cPYubf4T6ZSxMJVSddTA/aWIQj1nGiFqNiRHW
 cWgKoWdbGuCkeaga8dV62VQWZxMc2OHRzsiXH3u00LhS6mDkYnxIb4hC52wbi11DUtch
 bJuo727OTVlCYefz1tltNsUpSoIUWPS9I1vvb9wSN8rpy1lntQwaNQx0+iVa4zFs5SQs
 XzqSDivOPEspBE4i7eFqqTz+lgG3AAa6HPnW5xFLHLOCaeb/DV2wvzliWLJ5XUBdm3Wk
 7UISjtL+ds2dS2SMjcXyUZVsZukIBUWkRhOug1jiI2pguLkqxErreRWBaMFrqItjH37b
 5ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774632364; x=1775237164;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TtG+BgG5tZjsfByAZmaZW5KeUJ97ibJiE2T0OB+Mk0=;
 b=T1BLudC03Hf81FUzTMFdAt5yll8e5nOobYFF/ZM3GrpWie33Y0k1dB1P2c6E7pfZoc
 MQRjN8WtiBfEVcQFWpVElQmeWuyr+eSWi6Sh8m4NKAMNsRs8hf4gnznxK1WdiNqwy+ET
 PMP+OGmiugXQO1Nf1D5cyVkf1nIUUcT2od8kjT+txq71SI9q07Q7Rs+MoFQWd+xXA2VT
 vy/YK5jhgiQOCdeMM06KJuflYjal0w1hcrWn8k2URgBBgLlamZo1487zAkk1cZBowFZe
 DFzdY4AMEChSo+27IWKwuIt1b3mW7Zx8qOIUhKOB7e6dnomuZpgtDC19Qo/asmHWD6XG
 taVA==
X-Gm-Message-State: AOJu0YyQmAB5TjUzuXK/PpafcoeE8GI2Fxvj86HcAOjY/lrlqL31oJQs
 8ehIb7Wd8mNHbep0mwX7AkR+/Pm/TuFoVxZViBnlvXDgsYQeAt9/A+YWezdNWvyf43E=
X-Gm-Gg: ATEYQzxt+yvYSwrjLQmkxe3FSa9qjAYeZ+6qq9KzOZYgu0jco4Ds+WnIhaUEsP2y7NR
 7nW3/32BwlIJqIMeGSghyvzI0/a6UU3c6xqRm+LMeP+2c4+x8p99ZcDdOWC9UxvJ4znl1O6iwNy
 SFeuNqC4pLw6fiZDIkQluhIqjjCAt8y5JI21I0yAs1iaOnYYR/VIvXTY7HXIXDWPv06Dy6JjyRk
 jv71X58WHfy1qp/E0wbj7QlpnZNmZGdX/N/mxR4FIgy5mohWW9cnccmMOUl8Cg9GAAAA3yFUGQS
 VlrTAAKZ7rXjrJM4e0Drr40lNj5Q6DFRjniiX8pNmY9rySc412wGZvbyWD/+HpGbum5swOG3KQe
 5V/N5bLiuD8kWOxjF+HZnoK8uiBmzoB2o/QLTO6zMfSPwdpEgN9T8jFUJGvvZ3/+BIPo9s6VvFD
 VpiB4JvkNBh6BFDMOZdbWytsldhH5FW27D+6EnA0npXeul9Qfsjy3k4lXcik91eA==
X-Received: by 2002:a05:6000:2006:b0:43b:86ce:27a1 with SMTP id
 ffacd0b85a97d-43b9e9ea409mr6134749f8f.17.1774632364040; 
 Fri, 27 Mar 2026 10:26:04 -0700 (PDT)
Received: from [10.202.147.66] (109.243.130.77.rev.sfr.net. [77.130.243.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9179b212sm17351988f8f.0.2026.03.27.10.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 10:26:03 -0700 (PDT)
Message-ID: <36d7e3d6-3907-484b-8a58-f05a9ef6cae4@linaro.org>
Date: Fri, 27 Mar 2026 18:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-5-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327165042.604105-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 27/3/26 17:50, Pierrick Bouvier wrote:
> We need to stub a64_translate_init and gen_a64_update_pc.
> At this point, we don't need to do anything for aarch64_translator_ops
> since it's just an external symbol.
> 
> We can now include target/arm/tcg/translate.h from common code, since
> all target specific bits have been removed, or can be specialized with
> specific defines.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h | 10 ----------
>   target/arm/tcg/stubs32.c   | 17 +++++++++++++++++
>   target/arm/tcg/meson.build |  1 +
>   3 files changed, 18 insertions(+), 10 deletions(-)
>   create mode 100644 target/arm/tcg/stubs32.c


> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 5f591560551..3e96c77df73 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -21,6 +21,7 @@ gen_a32 = [
>   
>   arm_ss.add(gen_a32)
>   arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
> +arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))

Add via stub_ss[]?

