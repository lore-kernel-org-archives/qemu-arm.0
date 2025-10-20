Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70256CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAzRs-0005bV-OZ; Mon, 20 Oct 2025 19:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzRq-0005b3-7h
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:37:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzRo-0001Cy-7w
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:37:53 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso3392510b3a.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761003470; x=1761608270; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WpOxjUN0/rqCz47thJc+cdXxRrygG2VYhPCd4EwMj0A=;
 b=NN3MlDl9e1SPvAGqxdzU+7gOTvIAIm7z3hd1erioTkDT/IKl6Rd+W9Utv9L+Z7zQGP
 dD8tnK6fJ7P6JFALmFMWRC78BDnepb0PwER9So1jshIiQEmnIw/3thFqgbtIiWgSUm8H
 wryp1mjq/yzFtLduqMrDy3qQps79fe80wgRcx6OTxMpH8+WkdDWXyU4eka2GQFSA80dG
 13SbRkoTFyPwPzLb2JKIji96gfhXJwXmhyAxtqV06xmygR8Kyjr1pGHH293AqgjiH+xx
 91cfCvmfKrr1UAHc0/hGfpyQCqBmCJn6FlzCrXarq/u0IFLClkokISANHapqVgChSzrO
 R6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003470; x=1761608270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WpOxjUN0/rqCz47thJc+cdXxRrygG2VYhPCd4EwMj0A=;
 b=afBZEawBSobeTweUovQAqRQhxrJ4+4QTS/kVneLaduxIy6eV3tPo/Wu4bFGsBbX5GG
 oAFLw89g0DekbaOz/iARJ+s4HFPjznV4xvRX9Xh9XLc2QAVTIzk/+2xQ9qiT9g8UVLKz
 zGiloo8aLN1p/6O33jmMLGHhb+FRIh340nFAfAuxecEFTI4diXpmVFRt0CjXMEqRd4nN
 vq+u7Z/em8g/m4GD47oRjMe8MMZ/Y95xqYPzW867rS/mPi6a3D2pDjpS9feD1xfIIePU
 5/MxsGCccJs24rHBXGPq2E6n9pgc6gaI36gjoxzI5RyPHhGUKAUJD66A3zv+8M4ftApD
 CzlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPCI08lVRyIOBYYLm9Fpixh/8/rWjZ/werSRVIfDSTcAqo5q99/jo+DxtmAKYSfNw0Bo2+0xlrGw==@nongnu.org
X-Gm-Message-State: AOJu0Yz79wvDPoWWLAAyfkQviPssZ4T/BSpqBqdVsLc4O4XKa44H4AOT
 QsCdsrddMO+5o0Qw2YMtdL+mENvtujeR8CVpwA3fO6yIaq54ryxqUVRNPHKFaWIneTw=
X-Gm-Gg: ASbGncsquhytJHHeni8Ns7YrfCV5wKnku/r9exWa7JDxcd/yfRbZW503TTATUv7grgC
 9KRgJHM74UHzxJ0z8mGqeFxix4QQR8Phpge8taFoBPwFVdsWHjLmpYcs5Oqf/tG/W/qgiS35RRR
 eBvBdgaP4pNwNbgd/B+OPiBV/EqFKFF1aiJtoyLuBWesiHiBF/za2djZw2SDAXHmdtJX3rmGzju
 tWGp40+95uJqpZ9cZF794IOy1b0gGfy/AQ13HjfXiUWdyVBJMdN9MdcZeN0RvNT/upSvkEUDGkp
 0ENRsTDuMhM5XpBSvqL0JO2T5OBwNiuAoK/oh0lcJB8Z982RSg1fTfcXaVyM6IgmdZhoN7NVA3X
 J4bTpF3DY8lgeS1gU5G0PZ5mDiScN1IldogrGUCNs6ZRqNPi/tB3vk8OEQq7qGDsxg0cpu2eAOT
 wfOB5ueg9hf2SKB6z3PtlMAqSV
X-Google-Smtp-Source: AGHT+IF8DCMNzlPJcu5OkMQ6wrfEJzq0MrSWDDecrqVwTdhTHqbAjePeR1ac/WlA0iIj6ZWlcTwm6Q==
X-Received: by 2002:a05:6a00:3ccd:b0:781:17fb:d3d0 with SMTP id
 d2e1a72fcca58-7a2208f01dcmr17091156b3a.8.1761003470205; 
 Mon, 20 Oct 2025 16:37:50 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2300f3c8asm9487591b3a.41.2025.10.20.16.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:37:49 -0700 (PDT)
Message-ID: <741de7e0-de12-45fc-8306-0110e2d0aee6@linaro.org>
Date: Mon, 20 Oct 2025 16:37:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/30] hw/arm/virt: Get default CPU type at runtime
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhang Chen <zhangckid@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020221508.67413-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

On 2025-10-20 15:15, Philippe Mathieu-Daudé wrote:
> Prefer MachineClass::get_default_cpu_type() over
> MachineClass::default_cpu_type to get CPU type,
> evaluating TCG availability at runtime calling
> tcg_enabled().
> 
> It's worth noting that this is a behavior change:
> 
> - Previously only
> 
>    ./configure --disable-tcg --enable-kvm
>    ./qemu-system-aarch64 -M virt -accel kvm
> 
>    would default to 'max' and
> 
>    ./configure --enable-tcg --enable-kvm
>    ./qemu-system-aarch64 -M virt -accel kvm
> 
>    would default to 'cortex-a15'.
> 
> - Afterward, -accel kvm will always default to 'max'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Zhang Chen <zhangckid@gmail.com>
> ---
>   hw/arm/virt.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


