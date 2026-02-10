Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD1EA3F0D
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 06:13:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpgzx-0002tW-RH; Tue, 10 Feb 2026 01:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vpgzw-0002t7-HI
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 01:13:20 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vpgzu-0004L7-K9
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 01:13:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso3871575e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Feb 2026 22:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770703996; x=1771308796; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vHXJqY+bTMA7NO4H8MagDdzCFLfd9bAwBJC4v1JfjVE=;
 b=Sv+v3nmW5dJ0IkZbpjd+QcSlBK2RSpFr4E8wZniCWD8RmDA+Rx1stT3JqxPK6MQQYd
 BNPlZWQYu++51RvIgoY2dIi6z/m4UZsnMAXk+3zSZWFlypaBd3daBP+cp6IyRCltNDiY
 1k3GldqcrZ7w+laO6VYPOF1/+pcAXbwziPmEVq0KMMDNLb0zwtcnSkQU9hUMcDlQ6aqg
 CGkmvXYUKG6MI95cB64DMEyqvq511xMo0Cpjh9RJgEA5YF24MUkWmTsY+JOAbwzqXMsD
 fVYmLY25z9e7U84FmBFcPiiGaxLkenDPeVy8HJo64DVZ2ZI3GH3Jeg7bHwgqIQw6KIQo
 oRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770703996; x=1771308796;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHXJqY+bTMA7NO4H8MagDdzCFLfd9bAwBJC4v1JfjVE=;
 b=t42Jev4Bk41G+vVIgTcfJdVTcoyb33PzjcRRyGXInWFFJX8CSBe26KwIPg8tcjBzYK
 jsHLlCCqaPe9k8VcLtgflWllQoY4Q2VqEp2ll9mjhyqsX7fPOtjp0hTEjU/8PQAekx6M
 7HPiayu6pcUPgs1j1qbuyaYj/QsIBTgqzNpHqsAfRAk8ttUqpXJWHGY0VELXCGvTiS70
 VK2jyFLOD9GsAvQdAg8VkdKT7GrdskDUfwMGGcaUboh3X3Ok/EqaJD5HsRs+8HlWjUNn
 g5JIEmEed1gBGZxf03zcTX7agkSqR0oIo9q1xYBFHfve6sZUur/AI3zTMpZElU+IgeQI
 Bf6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHHvHP1qibvro04Xd9T1bVdtNKVy5Q5Np3unjBswi+bOD0a3rKl7YJQZ8xerfPh11hB9qSfHcXiA==@nongnu.org
X-Gm-Message-State: AOJu0Yzbeo5ulpPO2DvXBQlGT8jNEX+bho8UmLK4WThGS8dKjmfyETCr
 Ai6yutSsp/dkbDz94FIf49DZ2bIubDVK+XDIiYgEo+W7q94kysIB4UQqgaFL02yoi3w=
X-Gm-Gg: AZuq6aIv2cT+VMJ6lq/Q4JHVpS9xZREcHH2IdcCDUL/LOkMkbFSlcdffxkwVAfRsyke
 Ff2Td+IyMTKYcfgI/fVqXOTet/MAvJa9ubDcQU3kNUJshI7xbi7RVHhJPBCKcIqARePRqAuHmsv
 W142tNTjKa6q1fll7EjoNUJZe/R5LZeR3a1/OfPRPDOyD09ikF7h2aHEjIBCA/6330/Hqh4tn8z
 WwMVtXGwlZAypHt7yG8xChwKaFxpYPlJm8bRa1o3W2QTBBQheg2cLtUb/nEHWPOYqeQbTfkzO3x
 JOiIvnznxHI6u2toZRgxxfmmsSXX/w0XwINNJCEhwsJhdDcpHJkqZPJGnHk9NQffmk+BkxaZhrw
 3wgTy/p0XDJmr14uOJhmeguZqzoJWA63mlAdv6sFdBKKSU8A1CqmMgzQdZHmq4jXKKx+eUnvR/N
 x4mptiizv5Tre7RK+FTyVuK/SyiyBoGXvXSOiDUbp/Z279NSVnhDpw/wjQ/64uMBvOxlNGWOowp
 Tys
X-Received: by 2002:a05:600c:c167:b0:483:348a:d3f3 with SMTP id
 5b1f17b1804b1-483348ad74emr119554145e9.18.1770703995930; 
 Mon, 09 Feb 2026 22:13:15 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm40606385e9.0.2026.02.09.22.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 22:13:15 -0800 (PST)
Message-ID: <4a30491c-cd44-43fa-ae01-5c67f4b8bcb6@linaro.org>
Date: Tue, 10 Feb 2026 07:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] target/arm/tcg/translate.h: replace target_ulong
 with vaddr
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-12-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 6/2/26 05:21, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

