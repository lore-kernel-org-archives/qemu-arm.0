Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9E3D19510
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 18:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkRT7-0003mf-AE; Mon, 26 Jan 2026 13:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vkRT2-0003i6-Hx
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:37:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vkRSy-0002Sr-Qr
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:37:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so3396961f8f.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 10:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769452654; x=1770057454; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ipjvv4ealaSFnwt7TF94L1J5CHp40keYTo5K3NkfoNA=;
 b=WjZr88w7RyedHHyJd+oXD3nx6zqMCq3cYXSHjnn/5dg2YBfIKxkl9pW/3y5HI3oEYB
 bd/jcnt6TJE3M8qRxU8Z1k/7l/CzFBe8WK1N/r2RCPxdApkUX5k3YehkfhoQDQc/6RD+
 f+MYK+OqtbBYUSz/aKwSsOi/rE3rBkWbKqWgURi79anZ1oOcUiu3wUAaijxYWFLJ5En9
 q6/Q5o3u7Eh5TTZLvIU6vhY3xm40YyEs8V8NrQGZS8vfs+KptrGHXtx3Otj66vp4PjoC
 vbngfhyz8G7+JLCP9RWLaMsi8raFgE4rc46oMTvQLewZxyEFcYtwLNYQ4QiniTADNn75
 zhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769452654; x=1770057454;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipjvv4ealaSFnwt7TF94L1J5CHp40keYTo5K3NkfoNA=;
 b=tuC4EdUj37G5bKT9oHrI35QRHN/l5ixvsLwKJDbeuWxXVQOivrXl66tHhOuLxDyy4O
 VH9SoFCDRV59N2rRrbdI21f8FlR8pK0JU6gxVmMI8ym+83mCQz7a98c/dx2QOv6XoffM
 wFX406rGLr9yIre1lr+E4hNT18QwG1zKCH34PvFOxovJnsH6NNtw2YURfOzoDu9vAuYq
 ubtM4VbF29Q+TIwqtwxhGPdiW+fZNec6tLGQ5xYnixZrVAsSR0cmlvwaPrXKFzlWf10H
 m4i8Se7Rt50UVQO2SBE0awkrAJdkSZ12CoQR0FIiqTJqfHejRJF4cS5G7ZoHM2hELCf0
 2oqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkfmgqBnNXMLHbsENf/mQg/3BLVvffRan1M1sKw8XhjKnaCFUrX4OQKsMH7JlWxUVh2d3sW9+EkA==@nongnu.org
X-Gm-Message-State: AOJu0Yym0UT+Zw6aOw7RGHDB8JfqCZvOI0oBVxwDz5J74ZUN/CtX9knn
 RMH6eJc/OnYy2p3XFe4hDMFV6toL7qm4veTfmY2rUGUdcNMo1Kkgyx6fbXPw01V5RtA=
X-Gm-Gg: AZuq6aKA4jkgJftTGiSswgdhlp91UQWxjtCJgFVGv6uSNI+2IUDcqR9wFlp6sorukZ7
 VC+jd5qdv80zBjlN7qId9jfA3xlNDe+HJlUdNJAdejfUlnKwrZNDVD2cjDaTs7TY7VES7Rwz4uG
 Ei8AFkrCAlQAldcKH3c+gBXOBBcv6RSuEZpqTG0F+2C3cyvGSp8tLOzsuRKPOgHI2OFFlyUcpj0
 uwh1z2/E4vjAPYC4shVamKB3sjAEvKm3bagx8rbyIKaVL7efdYrgKRfwBxXR5XFXMmCKB7T4SVr
 5FlgnLTQuAIfmGWhje4+/I/+ZvxBYJ5cfaXs4p70faWjM2zs+ufpjaNdz/ITVZiO4RLZ6A4Yra+
 dPAydcIxtPaiSKZlA3k/EcwDIqia5Bg8r9WuzRqQZ0ZkwnyU3hS+hIGKMEFRFbUR/4SeLI50V8j
 3R/Gxa24EDzelLQa9Zzw5kKOLfYBuGmkCzG6PLiWYO7NJWfqlphc32sQ==
X-Received: by 2002:a05:6000:184a:b0:430:ff0c:3615 with SMTP id
 ffacd0b85a97d-435ca13d0e3mr10597940f8f.53.1769452654386; 
 Mon, 26 Jan 2026 10:37:34 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f745dbsm33173927f8f.34.2026.01.26.10.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 10:37:33 -0800 (PST)
Message-ID: <6d6ddb69-692a-46aa-bbd1-825249df2e05@linaro.org>
Date: Mon, 26 Jan 2026 19:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/adc: Fix out-of-bounds write in Aspeed ADC model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Elhrj Saad <saadelhrj@gmail.com>
References: <20260126141820.719492-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126141820.719492-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 26/1/26 15:18, Cédric Le Goater wrote:
> The 'regs' array has ASPEED_ADC_NR_REGS (52) elements, while the
> memory region covers offsets 0x00-0xFC. The aspeed_adc_engine_write()
> function has an out-of-bounds write vulnerability when accessing
> unimplemented registers.
> 
> Fix this by using 'return' instead of 'break' in the default case,
> which prevents execution from reaching the s->regs[reg] assignment for
> unimplemented registers.
> 
> Reported-by: Elhrj Saad <saadelhrj@gmail.com>
> Fixes: 5857974d5d11 ("hw/adc: Add basic Aspeed ADC model")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/adc/aspeed_adc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

