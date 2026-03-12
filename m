Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BD3106ACD2
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 18:19:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0kch-0008BE-Ko; Thu, 12 Mar 2026 14:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0kca-0008Ac-Kk
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:18:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0kcT-00065l-83
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:18:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso913895f8f.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773339527; x=1773944327; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yYXudM48uZQlkTe2pswR3W6pvCIzv1XYfDWsmr17sy0=;
 b=EIzh31vTCxjQsy1ab7BP1/BVSjHKqcYJiHM9gH6Oe0Aij/bciUa4RVQhJi6iz/xgkl
 mxOXsdRDSZfpFNEqB5fhTFzScxHMoz/vYO5cqFiWQuAjKTTcW9u2vVAj9QLZu5qB8Fmt
 AhkJF4wku2FVyUPWJKzNraEga82ZjLzVlFZve8dySwnduFJQhZDAxAMOCOixdFErwO+B
 nPbAz0Q6feBWrlp857Kx2+rNxZkek6UlmIgTibQOaoDiWt6WBfVpC//7FYuHP5G7lj6N
 IfDOSWyk92ywfViPw/Rvg38kh3UqwOh2dXhNyDmT/4M3Qt68y0z4isix2cljbp0LWXqC
 LCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773339527; x=1773944327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yYXudM48uZQlkTe2pswR3W6pvCIzv1XYfDWsmr17sy0=;
 b=AqzUqBvoUCdHhdaczwc2C2jNLMUIieLu2WO7zYBQe4YJF8AQu26cg3XVzpsCLuNe7U
 seYcn5eDcOeaBzJEgBoFkivYj1tG6OHRi9P4tC7La7J4Jix8mFc/pF11YK/MECcCc1/F
 TtcAa9SXE7L7QNidNbXFsl15n/oaU+yiIWD2Mc1p30l5r1BFYm2nMY0ucZAjOzI75l8V
 qXuTs66ujifdJoVninY2hngtaZcjl3ueKmKjrX0+X9flQQYcXi1XwfeqFaBL4auG8Xwd
 unTa4veedTFhmlGJfWKzeXwBTwlTpzWIc2y+K+uZ4J8Br7JoyExk+TqXEtIKaD1EeRbl
 uZsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEQqk2MBBqieFAc7+MJUc5/m/BPdO7xQbQZDDOuq5Ix8QAjlZ8p1PAGKYYqCyJH+Vy5jILI622TA==@nongnu.org
X-Gm-Message-State: AOJu0Yx2BhQRg7N76eFuNwesgZMkNcG+9z6CGKr14ZJNXVOwHp9uTAaq
 mEgLeGQ+257qRJnGglouv2a0Wq6+hHN6Cqv3Itd0LqS5bGxf9eoqH0hxLSaX3kbzENQ=
X-Gm-Gg: ATEYQzxL5ie2GjTXV9iWWMQNnjK2rWUzgH3zC2ttgjm7Kajg7Dlx/w2U/RiCXyiCNAT
 FP1CBydEAr1A931JDVEIIzFnDlf8sJ6vcvj54D/taaJfg9Eq5ZKB9MYdjAaQC2Ua1Fh/DUJVquS
 5C83W5RVTxNdOrO8QcAc7guL46bem+AKn5AV7G5AD5LPnf3JtfoOh2pB3TEifYUMf2xkS8TcZl4
 77JPc5h/Ukl+iAFFGiAapf1nxvffXHRq9s9c4ohB1KZ9YENwzJ6kXvy/aHA0KQrMb9OWpAgte+S
 ZYLI32j9J6FP7152WZFcuWiCLzj4yEGwe0CtXRfBkIQtV+PjGV4KlNmtGR9TO57kZuoaBdnAcDF
 mi5dgVs8gdiKg96+xO4qeRurLzdyFdhlUFmvQ4DsdnvMiqy/LB/uDwaX+J5ir+vOE76oZ9whCR6
 41Pa94RfTHJfdxIkJ0ZFx9RCjQi7iG537F6Z5yaOjqcaEQ3rUW+MfLQ0l+H7SvRvErr1ARiZeXE
 HjK
X-Received: by 2002:a05:600c:8b70:b0:485:39d1:b500 with SMTP id
 5b1f17b1804b1-485566f9445mr5981535e9.16.1773339526933; 
 Thu, 12 Mar 2026 11:18:46 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f406sm240866345e9.13.2026.03.12.11.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 11:18:46 -0700 (PDT)
Message-ID: <f333a91d-df3c-4b8f-8476-1dc82d72ba39@linaro.org>
Date: Thu, 12 Mar 2026 19:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] whpx: arm: fix -cpu host
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org
References: <20260311151014.55915-1-mohamed@unpredictable.fr>
 <20260311151014.55915-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311151014.55915-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 11/3/26 16:10, Mohamed Mediouni wrote:
> "hw/arm/virt: Register valid CPU types dynamically" went under my radar, so fix this for WHPX.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

