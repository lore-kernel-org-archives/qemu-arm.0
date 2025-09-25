Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D19CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:13:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1juZ-0006UI-Qq; Thu, 25 Sep 2025 07:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1juW-0006Tm-Le
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:13:17 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1juQ-0004xx-HV
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:13:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f42b54d1b9so993750f8f.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758798784; x=1759403584; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NhZuQwQAFTSR+0Vufm5kEzl2Dpt/3sHKp8GiT/Bgf3k=;
 b=QgO/Bu6LZ02G5aTuD5gasJYGbhKjEHpDxPOQxaptikRSZwOfgIIyMYJNnoL18aPzGJ
 6q57RD55fRvMaoSzdVQv2OH4JtYH3ErS8Vx4M5ihQjiBwQUIgalW1CWjnbUDs41X94NH
 NHRK9Wyj8zkYGIKzisiGWXQPV3PsCxLceszqgXNydbc/SlB+z/ZlU0TFLdDVtnc1VMc/
 RF4BwmSSaQKvNUusCF2wYOPB/w7huWqXDgunqsQx4gNKp3mK1+17sVJtIqNkxNjQpP4L
 QSozK1Jk/6djz70U+74jLZutHvzgndwO2B75tSNmy1vTv8xUdo6lRYc/LBgnxiKJUvOL
 1t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758798784; x=1759403584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NhZuQwQAFTSR+0Vufm5kEzl2Dpt/3sHKp8GiT/Bgf3k=;
 b=rKvNZTd32cw4isDv/FLIIbZP/HzxIPjYhc5TkL4wgNMzqwnZ3JzGuOk6Y6CKDr99iG
 CG3TMxM3tnTuonWHUgHO0uiHGH84/xiFHiiZS29FcTfT/GvURnHp7BobNjXccioUIfen
 3jYdwlHjdEmcoj5KjbVTH9Op4EG9+9iQsKIp/ul1j5rlEeCc57lFNObf/dUFzXEquJNv
 +X8CSy8zgcpS4JUSf/SXXc357LXVY5Sk/B4ujMouFPfgj5DwaaXgsl1WUMBLKtoKLCf4
 4ub9KQeNVXNMJMr/w3a/5WrxWqEq0KmyEfTCuvwEj4uSwTuiQIe1M7vW5hmIUw15xxa8
 q+vg==
X-Gm-Message-State: AOJu0YxjzF9iWYxiicdBdPbCyt4VKHVLMGLNdZTXmYReIVdji2l1czqh
 pftW/0gbQOx/nH6Ikru+0K2nU8/QIo4nx7sMBDjHzS6n41a4CE2/F0aRQVXYwEQg6R8=
X-Gm-Gg: ASbGncsFK5f/gBkR5+dd9qwZ0Ki7T+aRNtUumRuicwkdhvXTnFHwR0uFD14li9vMAHv
 Loj1S2drqVaavu5qkLRAi3mMaFtlvMexOgr1zxcGLLPREJ2ToiJfCOG30dGJYDefNOMmtJ//ZAt
 hRgRcrOGvgNwrXu95TNjp4owJNMR6tacFpg6Gd0pzF873zsIEE4YmnwaFLqI8bsPswP0J/kFQiy
 zaleVRKfSeLgrHMDLc32Igl8pgwaei98qnMM1kgTK42kskaGEF+7a63nEL18u08GEXcKogg+Sja
 uwHYhMK5WfuURvz3fULhqNwQzVAuZQKH4bILQbrj8jyztqaXkMt/Q+4wx28ozW7cEdrzOYr0E5f
 7bWcyZm9E0pfLoW9DGHieC1EYWoxuFZB+dx7NhBm2bIyfGd83RV065+HGWUrDN1y2Sw==
X-Google-Smtp-Source: AGHT+IFIbd13axiSM2dClMjoc3wmlNbwFk/8orrCid4bLtVdOroIspl0IjsneDQRyHg/D9qQ9HTnBw==
X-Received: by 2002:a05:6000:2285:b0:3ec:a019:3936 with SMTP id
 ffacd0b85a97d-40e4accc5b4mr3096587f8f.55.1758798784545; 
 Thu, 25 Sep 2025 04:13:04 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm2632565f8f.8.2025.09.25.04.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:13:04 -0700 (PDT)
Message-ID: <75c4b581-26e6-4e55-a589-883fab71ab6b@linaro.org>
Date: Thu, 25 Sep 2025 13:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/36] target/arm: Hoist the allocation of ARMCPRegInfo
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Pass in a newly allocated structure, rather than having to
> dance around allocation of the name and the structure.
> 
> Since we no longer have two copies of the structure handy
> within add_cpreg_to_hashtable, delay the writeback of concrete
> values over wildcards until we're done querying the wildcards.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 97 ++++++++++++++++++++++-----------------------
>   1 file changed, 48 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


