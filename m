Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B5ED65C5A
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVt0G-0007oa-26; Wed, 17 Dec 2025 09:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVt0E-0007mY-Hz
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:59:46 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVt0D-0004MV-4Z
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:59:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so43291735e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765983583; x=1766588383; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AqKdSwcE05MCSufPJevBhc2ZgSmGh9pj74NarAyxQ8k=;
 b=SIIdDXPqFxGE+pnAveJXiANyeFW499NHfuGg6B0ou1P4gxDaW0K8b9+NgsArUPUBQM
 PG+XnfQJsRh5Mo+/HQ9ffmDZAjLCF0P8XfLyD5qMqBnHkBeLfG6mdMZKcAc+CvdtLXKd
 74UK+hdy6syz4FwLhUpVAbOruKCQHHEMeGPwwpRYrwrKobFiwt1Xes/Fo94ai7gJVBC4
 xNHz1EHfdbDUsasEAKiM3MIxb/nsQU+vepXlsqTNavcTi/wz5TmMpXwfOUrfLH3iyxjy
 YbH7l/+yEi0Z7Y52fQc3wWXiLuy5OTpCf9GrL9ie9v6EHgmAe04YTJEPS9nTTfExXwm4
 SxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765983583; x=1766588383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AqKdSwcE05MCSufPJevBhc2ZgSmGh9pj74NarAyxQ8k=;
 b=EkyRrVmhoFrMVihoynGjjh1oNidMvWVu4SP8BXt+g01CqS5DpW0JPP/eW5y4ulzbnD
 NlLAOgA/63q5b+viILFKeUmVz72kZNORh5ew4YCPDuSG0zDOce57Aqr/6WeZcOZTGgIH
 XWcm8bWeCj1YQskkjM6rCL1BAMRjjdaCvNV8QUq1558s+Tyz010/btjlwB7eg6odIPfj
 EKpJI053v004aCmPSWPzkfVbpAHrPUC4YgAs5J9p6NViMKSmJ0HYOKa86WR1GDyAKCYu
 QKuGvi7k9q3Agmd0D3mM85MD3da3ecXYyKaYLrbvQsEMmquoAvWe/YsfiOu1sa5jF0Cc
 NsUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA7bsZxsUxLxR1zUQCNKS+nYe76fL/jUPev6pSls1BZlR8SjgpjoSIbIctdX1Xl0za1jZUs9gyMw==@nongnu.org
X-Gm-Message-State: AOJu0YxvCtvhxsE+PUMomuGD+OAvoKgAfW3BmmOrORAgXpNT+cI0HT/P
 i8EDBVDsRIf/4DhVs4ZaJQgLq6CVkYA7VJb35V8sxzb1UXLf3ZAI7vR23wnsQzy0LvI=
X-Gm-Gg: AY/fxX4glsZinqChYzpT8zvhRT3LdSS0rLgwV4RXlWWUaOtlahU6zac5wQBVFmFmg5+
 Jg6x8sPxHdfSinJ2Jii+XS2GeLISrPvKAgsE5+Pi348pIP+6HYXlqMIx6++bIxq58a9Da7FjamE
 xaq6h47yOC4bvtUAanCLlczBEHScuGJvhB7t6kl99IUOprw9GLawbBRLhM58RvOjPEnr2Ct0Wlv
 l0vu5O/no2kPwi6d5EUrA8ApZks/0QuIOejgTrYFK8LqZ2ubfQaTICxx8xjNwAP1VOGFaQ7DTb1
 ABR0cNBjNp6GQIp9uZB5VuqBI0XkECBzgFJN735eldnd4ki65RVTxl08R5nTsZ6hBtu8HVd1TGD
 dpdP/MGT6xP3RvQ0T59pI3vlICK0wI1cbNyFCHHYwv9ziY4y6vLKDAPGAl6MqfzVy9GVe5G78NS
 lRpXSOoP6Rdgk0B591JbGQaxaCw4ptVAnKg1o9uyaX/xU3U+CJO+3SMg==
X-Google-Smtp-Source: AGHT+IE/x7QTV9F6uNBJtYJJnbqQhRBUscLeeibZBuP7hwNVu51jLzxSfWPIiIHQC14hZuhuM5WfBA==
X-Received: by 2002:a05:600c:3e06:b0:471:786:94d3 with SMTP id
 5b1f17b1804b1-47a8f907f13mr149672895e9.22.1765983583207; 
 Wed, 17 Dec 2025 06:59:43 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1cb6a8sm40679515e9.2.2025.12.17.06.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 06:59:42 -0800 (PST)
Message-ID: <3c5328f2-f8e7-4154-bab5-e80f46306aae@linaro.org>
Date: Wed, 17 Dec 2025 15:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/cmsdk-apb-uart.c: log guest_errors for r/w to
 disabled uart
Content-Language: en-US
To: julia <midnight@trainwit.ch>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20251217-cmsdk-uart-disabled-warning2-v1-1-847de48840bc@trainwit.ch>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251217-cmsdk-uart-disabled-warning2-v1-1-847de48840bc@trainwit.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Hi Julia,

On 17/12/25 08:10, julia wrote:
> I don't want to admit how many hours I spent trying to figure out why
> nothing was being printed (as the enable-ing code hadn't yet run,
> even thought it existed).

You are not alone, few of us have been there too :/

This is why I added this commit for the PL011:
https://gitlab.com/qemu-project/qemu/-/commit/abf2b6a0
but it had to be reverted, see:
https://gitlab.com/qemu-project/qemu/-/commit/5b14454d

> 
> Signed-off-by: julia <midnight@trainwit.ch>
> ---
>   hw/char/cmsdk-apb-uart.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Anyway for your patch:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Regards,

Phil.

