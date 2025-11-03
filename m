Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEA3CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:14:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrZk-00062b-8B; Mon, 03 Nov 2025 05:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrZi-00062F-GB
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:14:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrZd-00030U-Fh
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:14:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso1226640f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164840; x=1762769640; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rlujYw+RiSOLNRW7TpT1O8LSg6bN2iOs+PleaszjFGk=;
 b=TVgD3RiPEuEEA8FPesOsg9NFwVY/ZGVG3JjmwmKXR52tJiEMmqjBnJh3+a/EYv4brZ
 6RYTJfcgyaOoNf2TqDU71T740l+HA9b/fMoQ+0jKig3zm7YgcrCB08rKaDV5zWlG23rf
 mm5dRR6uchM0iRUFkCZkPtZWg2dMoHmvVWOoiu3PFZ38iEAC74R/K+P5mAz7s+Me8tCv
 pQzbsjHajp4chUpIN+i5cfBqwwXKpEcFR4FuN7M5tEW32k3n9gIq0sfYIRYz6hJWNlKz
 P6zxeCWNHBuP+1Gz/u3emN5NXyeEEpovyR/7NbzspAuZEooTbc4SPgZXRJTRd3CDo+74
 k4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164840; x=1762769640;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rlujYw+RiSOLNRW7TpT1O8LSg6bN2iOs+PleaszjFGk=;
 b=sdrEpKdPPiD0mq9KecwB7MvphfmNFDo1xrtSGQVoDucGKlBA4h+KDn4H1aEMgGscjK
 DY75XIN3qs/7s4cBds2EsvVHYh7wvRAvKhEQYCcsYxtJB2GlcMGTDVtwZogNLUpIwheu
 pQOBBn1OOoLf+GSSuXtc9JBnwWnZaCwxiV7JCMyNB1sFOyI63iJecp4o+rmEYWwjMrs/
 HuB/L/U8rwQDHUm7GVCDeO2OjG4sf94HQ+eAEYMqXf7X4fELVxCU+GLj4ek30SnUMqDf
 fCGZ1YL1z/QOvGuwxzzGXayzC7H/UBF3Vi/bIthTs8ThCdcQLo4Jjw7e1aUDZfWeI9nf
 akRA==
X-Gm-Message-State: AOJu0YyHs/8aP2AkGcYRKIY9gn2aVeU5Mgz1JqJizeF6v7GCZ7hJO4wK
 KpnLS/LblKZlqB9ryew50uKUStHtQqYXVaiujVbsBWDqys8jOYLwrTVM6RuuHScKGTU=
X-Gm-Gg: ASbGncslre2oyreWWYbTmSGB9kNpdb6w9GXvMRe7+mJ6AwNECwnnUvdpldACuRnTEO5
 l2Bl1U+kdJ8YMm82HuAU1Le6Ty4V4FDYVTgbOpl51Twb048sFRbKrXodwV81xg8eFnv99byZ/7h
 QvMf5aHEqujgZLB/b36NegHK94GappBItLrCcwOwHj9SeXV04j80BaQEQYtiL4K31YzXHZOWYBh
 HVBCyja5VT6IxwS807tQrBfcAKvvoWbympVL6rpgyDkffAxI1N/nogx7onl/zKunr/vI+HHiXuh
 Q8z1bTLR4iPk0wn7bl8f/vZ3sB19lsUUjkIN/GAYzTezNty2EK5k4mRBLp4IosRPjAU1dnDvRrU
 4DW0BIYApskkeiCKWSjFA7JYDgdtGCBqbpbEm649IchpPWaeWUI8x5a/srb4CbqTd5hgHuUO6Ae
 nmmlUgBQfYvYF9erWIsRQybh0M8HfNeLXpqJQnE56dj1wHV9Mw6GgFTBNgw8hM9w==
X-Google-Smtp-Source: AGHT+IH/4EpD2Fs7Pe/mB/ocjhUc7f1ngUT1xUeriXenTikeZ+zOg1vVXhX4BZgWFCKrqbcAbehIEg==
X-Received: by 2002:a05:600c:3489:b0:477:cb6:805e with SMTP id
 5b1f17b1804b1-477307e0513mr91449915e9.18.1762164838363; 
 Mon, 03 Nov 2025 02:13:58 -0800 (PST)
Received: from [172.18.178.65] (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c48e805sm147655675e9.4.2025.11.03.02.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 02:13:57 -0800 (PST)
Message-ID: <4142ad61-f71f-4985-8261-8a0700909209@linaro.org>
Date: Mon, 3 Nov 2025 11:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/37] target/arm/hvf: Assert no 128-bit sysregs in
 hvf_arch_init_vcpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251014200718.422022-15-richard.henderson@linaro.org>
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

On 14/10/25 22:06, Richard Henderson wrote:
> HVF has not yet enabled 128-bit system registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


