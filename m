Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B896F10F285E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 17:25:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6Avh-0003SJ-23; Fri, 27 Mar 2026 13:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Avg-0003Pv-1h
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 13:25:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Ave-0004lR-CO
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 13:25:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so27339335e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774632300; x=1775237100; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=imiI7qGVC+vXtEl1GqcJWsk52R3ZDBsRzA9YEvthUsI=;
 b=feuAvgNwyoZw3jFBxAn64fPhAZcWyCl6QekT07zdiDUoIkgVlbUE5XpVkvbKTOHi3Y
 0/tUmwX2obrm+A61nB9PAkvMiwPEieUf9uZM3VR8jCXhZ1taGP0IivfshWFgxwHsTHIQ
 7UfyNmHvZR5rgiTOFQYhG4B6LKEB6di1dENm54wdhab5jCCj9rhFonzj7jCi44CnQSxL
 2Td9IWWnzkPWCb6sAV46R+IyNeOQAgZyU6FnzYc5A96TBd3mkl8qx5VsItngpf9vmTYp
 O+g+OcJxHzysBWTTJRool3NpEAbyuCKW493DwaUaocldzv0LoEdRkcCivADQEwabCkrs
 vDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774632300; x=1775237100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imiI7qGVC+vXtEl1GqcJWsk52R3ZDBsRzA9YEvthUsI=;
 b=HKXbsoX2YZLXpIew+jwSR9UHUQs9qQBoHA33+nIAgMPvkn2iH7WAKEw+4twj2uEKVI
 qk/UaDJ96LwA6tBAWmfaoakazgA/ML5OxvC8943CTpsvOZUpLoQM6YZx8hqFwUgkQxp1
 BSEgE981I64hDHXEwm5kBMur0px8GDWeNwWxkOdVScLmtvRA63tbU95diP27fgaJJv1I
 zUiCC1CgJyUObK6CO4Kr6T98YWk6HsNz1eNlsjI8tvBIAaU+tWziLDjV6xyjxMzl3YIg
 yyfd0GY5qA7VC/Cq/7onjLHoHDZfTSC3ez8yutBPDbzjMnhinBP+VB/xFho3X9JW5FJA
 KMNg==
X-Gm-Message-State: AOJu0YxCKAW5/S9VTwcIKKbsYzj/6Qo8Pz4yEUQZ3vAcBqzFM/HHltp7
 LQUIDGF6aTtadhc7ysQPQg2/xuT1hm5inDmgjOmyHfYCgqLKNBh0goBreX5hD3nTVwE=
X-Gm-Gg: ATEYQzxxUTRrJnnv0bgaH2/iwCxzyOdMiZww9rh3J+Cz3bArFnXhvgBSn9/raRM+qe8
 bJEY02K+LCETwV7i1erhj5NGa1bUShqatDdSNlOJZKDINPxcLdDDItWVHXnczQAJr+dBWyJcHz6
 RxlfQWE/THK5GZS2bNbFYGfxZng9igjxFkz4GfYkfDGy02h3Vs3+6WWjY7nz+Rt6rXfCIMthwrV
 glYuIKoD5eAaTJ9XQElH7v7S7nUMYezBDiPaL4qyRofKJlww0RG/HUxoRYAQd8RR1vgg6WORlRe
 3L2HQrT8coCGEKD9NANZBDFOAIk5mpcm1AVismxNpmQiXO236aSUXt0BilXc5avu9ozMWVpIRwu
 JIAqKat+JH4cNdWqIVVPkFCbMBqPTCmo8S2L9ZVE3Qx5tzK9FXzne2lL+HaZc4nx2vjGbIfdRhT
 jRzkWsK/BoNXFwbf4ryeE3nceDlnlSv4QeNuSASkcevnkfUVWeprN2ZmhAYaLnCg==
X-Received: by 2002:a05:600c:6095:b0:477:b734:8c53 with SMTP id
 5b1f17b1804b1-48727e9a09dmr57471515e9.12.1774632300381; 
 Fri, 27 Mar 2026 10:25:00 -0700 (PDT)
Received: from [10.202.147.66] (109.243.130.77.rev.sfr.net. [77.130.243.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm17415263f8f.18.2026.03.27.10.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 10:24:59 -0700 (PDT)
Message-ID: <f2247f85-42f3-413b-9146-e7afe7e530c9@linaro.org>
Date: Fri, 27 Mar 2026 18:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] target/arm/tcg/translate.h: remove tcg-op-gvec.h
 include
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-4-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327165042.604105-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Include tcg-op-gvec-common.h instead.
> No target/arm code rely on target specifics for gvec ops.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

