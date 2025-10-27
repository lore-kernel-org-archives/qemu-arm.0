Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA2CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 19:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDSkC-0004tk-FH; Mon, 27 Oct 2025 15:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDSju-0004qY-7s
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:18:50 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDSjn-0005F8-Cc
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:18:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so38432225e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761592710; x=1762197510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9HKp2yg/DZV39UfA2Dur6nn6mJkBI4zDfwSONB9qI6c=;
 b=vfFhI0nv8nCNMkQkTihlZd2vg+rW15ZjQj3l25Jbe8r9uzXjvTfjYnKaS61kwI6o58
 ItcA2GPKRfLVZaIZm6IHN4o5n8mT8RbCuca76VjpjnT3NwpLgNI0ArkvuaQz3eDa52Rf
 lLswkRkqYgpY92f3v0tFLdG7YXYwLiPeniC5jfaReSXj70cXFDl5PNWBQJEJ/huRmgmJ
 ZeDxQNpPsu7WMTaNKKS9Pk+ShgYQmlLyd4YDN/05TU3mPUv3R9TAUbLZdgirsv/RXuXC
 e+W6w9LnasOeqfF3pdE9wufsxYoVLwg72cUw94qr0Mfl47ttJnA/LNrWL2qD4pSv5TL1
 gT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761592710; x=1762197510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9HKp2yg/DZV39UfA2Dur6nn6mJkBI4zDfwSONB9qI6c=;
 b=h2IkKtIXf2N1wo4gVIelSinsJrVwWra0HjNDhOfdsBf6c4jbORFg2Cd2M+njNibEEj
 ctP1jOgXJtNIUMo18xkA+o9554YOAIX14RMBZhUZpTJlbIGBt4Tt48vTa3M6LtgozVnH
 BhJy+tpOzts+bs2TtKSnYD0QO5MaYY5wcDwTor11KIWekJGmCddCY6cst7IfmLz2Y/4G
 l/7cuCRJ421ZUxYAAVlshQKbZMLM9XJU0yzWviLScjymEXRv59tbi+Y4XdTZHyH2ycOV
 CGjDd1XO5g3hLtksbz+eRFypg8cOLO6OfJinaljcytxonTKDYkGyHR8vusxblsVlhEJ5
 kW4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAmVVLHjFiJ15VITaKON1shO6wurIVUJrUn9+J30LB4X1SfS5vWYl5Qs3Kxdo1jvvcKul6raNq6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw1f50Tt+LJWK7htRbw3j1WOOHMBLnw07ehTetARAbrsSrgRP00
 6oqFajuF6Ax/C1OfNNEXKPEhsBrOL9XCOLXMCNKLaArPw/vQ0Df9xmKeifpIe4QF/yM=
X-Gm-Gg: ASbGncvwHZ9RVtfzQTXpFm49Y8e2dMLk18FsghNImMk1BRaGOHJ/gcm3oOJpYcj6nH6
 IEry1QngqXeGCFxqgrwftLykYS3h+4o3+WhZjYnIfbd+7HfIKtkWIYNKYVbRdTrM28qHERq9xQ1
 TnE2UU1laFbITkMDddgrqCWSOOu5+e8kAYgNJu1GJ5z9itl3a4uYST2i3f9etq/4DCSHP6kThZN
 yKtL4XkbCyjSC/klS7fnABLY2iseaN7ZU+vm4oHdhX7AeeHw9n7zyZl+95dGoGSAkl4bCZHgKiU
 ME5+86pYI7ZAUmJlsl9f1GWo0f54h0VO/9vngCc7+Ty0NamGk7Sexzxv60AvqFLl3e+tJmG9TO7
 wy4QlG6x+7wPIDY4aklRpalKIof8ku724DH8cg90ZTpai9iTOO3Jl4av4nasAbVaFAr0AHnBaUU
 kKgdq2vk6zsj4iyg483kd0+bOl9TdLd5CluhjWL2Og7pKNK/X0j2drtg==
X-Google-Smtp-Source: AGHT+IEEoJ2H7nrcaNH4jtBvC/x4UMaDq23WYjl/UcaQZMIQltT+04vpL3rTPs5fzshCvG4gOO8bWA==
X-Received: by 2002:a05:600c:34c4:b0:46e:4246:c90d with SMTP id
 5b1f17b1804b1-47717dfa47bmr6980475e9.11.1761592710496; 
 Mon, 27 Oct 2025 12:18:30 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d9e80sm15814669f8f.28.2025.10.27.12.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:18:29 -0700 (PDT)
Message-ID: <89384089-94f5-4dea-8746-29e479290210@linaro.org>
Date: Mon, 27 Oct 2025 20:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/aspeed: Remove ast2700fc self-aliasing
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, qemu-arm@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
References: <20251021110427.93991-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251021110427.93991-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 21/10/25 13:04, Philippe Mathieu-Daudé wrote:
> Remove pointless alias to the very same machine:
> 
>    $ qemu-system-aarch64 -M help | fgrep ast2700fc
>    ast2700fc            ast2700 full core support (alias of ast2700fc)
>    ast2700fc            ast2700 full core support
> 
> Fixes: a74faf35efc ("hw/arm: Introduce ASPEED AST2700 A1 full core machine")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed_ast27x0-fc.c | 1 -
>   1 file changed, 1 deletion(-)

Merged as commit d7bd42a740d0e8887540d7b450d0bdb2d6ba31ea, thanks!

