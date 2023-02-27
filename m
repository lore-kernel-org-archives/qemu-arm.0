Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4431604ejc;
        Mon, 27 Feb 2023 01:09:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8BlOcjYVVVQ/Xp9K1995OP015KxnYeIb+0qj2/zcXO5zg8+bSlfjHxFGU5TlV3+oO+oyeD
X-Received: by 2002:a05:622a:c7:b0:3bf:d359:1a1c with SMTP id p7-20020a05622a00c700b003bfd3591a1cmr6083802qtw.13.1677488976630;
        Mon, 27 Feb 2023 01:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677488976; cv=none;
        d=google.com; s=arc-20160816;
        b=g4KUg9vS04MP9ocgqcbN66ZPVZiJ6WgoOpIgymVqnsUvFT27UATGjGSH1b0LEqGiEE
         yimKuBYMNq52nwtQjzsNgPYZ4F40YP8cf7zHdNKKVXtxPrCweCargrNEUazTNzyspIIN
         EpFbvWH/i4zuwnJ0KPNIbsI/qV1ltbzwOiWDeIcDO2ETpkWHhPBcAG1EuztlVakAS4OF
         jdhxVcsF6pb+lYqS6th1hrazA7mAy5hZdA0iGszldUu72L8I8+2lTdtfFafdUtQVj4C5
         DQgJi8v1T0VaLHUVrJ/i1wNOGQPQ+xidTMW5tla5rdeE/0/AgCzkWoJ3w3Fin6BAgDHo
         UruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gGThxHJEEJL4cAFrfXjf9MNVVgDOoFDI7d8nDusJTJo=;
        b=uRmKkvbHCZHJt7TXxwKMtysyfTpQXe1hnEOrAvq7pfhXtfRSVAkQRIhE1y8fnnqJ1Y
         G5fHYXlP13BS/7EIr6iTcMact7eUyaZs45NwJWuQ0kmlII1I7/oWZx2OEWQKduONBZYL
         MzJHB45YazLbPcJzkEfBeSSTHXO+KYBZ3dTCXQSpxiqovFdH7poZF/HcGxLz+igiF7yA
         LqjLmRxM1N9BEkscnPrx0x/YfLc0K1hp1S261FGBH2Dwmgzf3MMpF5sGSywhw6W0is6R
         9Tzn9ldSzo1jOmlBQH+7pmbBUF8Ahqn5I/Gq/3WlW5xqQ/dS8qepbKM9/lVDSjx/XaHP
         bkcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tyfpcvs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de38-20020a05620a372600b0073b8e1b61f8si6185514qkb.372.2023.02.27.01.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tyfpcvs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWZVe-00047K-CF; Mon, 27 Feb 2023 04:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZVU-00040t-IP
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 04:09:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZVR-0002at-FM
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 04:09:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so6563023wmb.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 01:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gGThxHJEEJL4cAFrfXjf9MNVVgDOoFDI7d8nDusJTJo=;
 b=Tyfpcvs2lEIGrhm6/hImEbtPqlWd0KqRxBpNLzg3lUb4EZDDjm8n4qpOZXhKGpO5Dq
 G2OR+G6jiK3x9QaOPsE85RuorSWRrHA6urV0XUjTUaEFTfRAlzGTTsGHpLd2hsbTwWWa
 XnnkAwPeIlqu/qHW6Z7YIUcDyoT7+i7agfIC1WbOL4wQRPVXNJSB56SPPIM9uuG+BZvM
 LLKOle7tkORvM5p8uxZUiYpJl0M+BJW7f1OYrbxDdYOSp2ujECyMRriKNvCUVBG5sMSs
 4DLKE05TpoGSBOmpab1EMAQOSfOXhIiHaAbAfXpUCSvTqzOsIu4x2BxKAfs/+olRjfdS
 QY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gGThxHJEEJL4cAFrfXjf9MNVVgDOoFDI7d8nDusJTJo=;
 b=YGDt+b24Cgsi5K7QdvUg2yjNDdUOwHw4nOt99KQOa5ynnZ/pQygp9wJtu7rEKMQs9X
 UpbPErwu6jgp5vg42cZWYk+M1OPRejEbOHZ49FQWzh6Fw7Lh75JvpjsGZoOVzbOKj2+y
 WfoWqg+XH90/2lN3sII25EZ8zw80xWfIrwgXheSgySeWoMpwWhA2qLwvs6dTMT+8m5+A
 OMIX8ND+qZyrPWDBUwr2CvIKsX2LjNTgUlieZbi//2atoaqiHt65guNwDoU17V+g8wZy
 eWtRDYeQetHjU3/9YxJ+E1UCtxHJ3n/qm6qGL01TyDVmTb9/sDuCWB0G/CX9PzFKTjpK
 EnBA==
X-Gm-Message-State: AO0yUKXBF0HkAt6Z8wzJpOdqAjODGj0ey5HYOECPvz1d0zqowTG6zUw1
 qP9jbubuIGIjcu03bwmNKd/fgQ==
X-Received: by 2002:a05:600c:32a7:b0:3db:15b1:fb28 with SMTP id
 t39-20020a05600c32a700b003db15b1fb28mr19294636wmp.19.1677488952104; 
 Mon, 27 Feb 2023 01:09:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm6494761wrp.48.2023.02.27.01.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:09:11 -0800 (PST)
Message-ID: <9a21a6eb-6b52-c735-12e7-2b02b5d53f9a@linaro.org>
Date: Mon, 27 Feb 2023 10:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 50/70] target/s390x: Split out gen_ri2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iCaWaeRmgM9C

On 27/2/23 06:42, Richard Henderson wrote:
> Use tcg_constant_i64.  Adjust in2_mri2_* to allocate a new
> temporary for the output, using gen_ri2 for the address.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

