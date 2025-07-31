Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E200EC87FD3
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbNF-00028O-Sc; Thu, 31 Jul 2025 18:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbEg-0003Bg-Ns
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:54:51 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbEf-0003VL-6m
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:54:50 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-76aea119891so2358891b3a.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998888; x=1754603688; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmboZ4eHGQ/kIW0KKyRvGgoame92JAhsUpHf5zohKg4=;
 b=QQSvLR98skwTvUNTzKPKvqK8NpbZyy1qxQfLtSG2kUbGttIFoLH4rGjQOXPs6twHnY
 HDpQ5PS3Mfh3j6kF43Kn3qRD90tFZxw0OEoz4z0ePX4wmAe6nxQqGio/i4Fu5mZRYE+J
 N+umBsFDAwWL7zR9EholHxJLWrn1lY1BFBDUcm4QxDgNK4WaAsGH1jimg9AleANssAD7
 tV/89AZVIKhSo67LhPgS/0YGD2shc/mr9W/xUPaY7f88qCfWaePx9QgvwLbMCMsJW6Ed
 0iucBfWX9RKoqQstyP2MZHEyMwGzUHFTGtMHxDkb+2iGs3ZEyw/6VBYUduIJHYAOZvZD
 jfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998888; x=1754603688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmboZ4eHGQ/kIW0KKyRvGgoame92JAhsUpHf5zohKg4=;
 b=J+oL1LIW5KnOPjEKKG8LN3PIJQWo9IHFNDgo25IqUmSN8B4Lol2aZs0sEWcv4fdek/
 PZqxFhgcMT+YWqwPw+lWo7QsWbfgEW+zr1eT94GnNoIUZiLbiJvBIqmZdRbeaB7U+54z
 3+io446t3EyQmLR6K4sxt3/7kULCT2eJjYXFr1dXb8X+XA8QbJFamXIJVlN8sUofnVP2
 qkk7YlMuRdyNeEQCuwLLXYlmhhWvQVF58o2sm8V93Xj0gNyzxazKDvPmOTlBMsohJ2zv
 hAlzjXpPBNfBUS2CcmtCQiMtvqEXY0D8f9fs/lzIXOamNn8YOZJNlOxbQ0lxmaoQGGIM
 H+vg==
X-Gm-Message-State: AOJu0YyfWGg4cwchao3AY5xIIN4YLQRFnKHhtFq2xCcvcJAi34R3t/4g
 XxExjgNr6mzl4zo5/TC3bIPpE7h4y3vpWOwfVUueL1y/0xj+X3dcuYfX6cNCLa+cO3U=
X-Gm-Gg: ASbGncsUGRVAZG5+PsOoNJYvPR5va1AjFw5M5fZOvcU7A0T23SjBjkpYcRTc9FCEWZX
 DeTlXwHf9wtG5QGNr5ygd39F8fi2eUwdJ0SMdLlwd8Fv+N6Im/0NeHAnm+Il6XGhtLaSlrasXY8
 Y1bYkoSfAMVHpZRPHz/yIwKk7Czoobu3hybzY24E9xeIGuLwRYDCx5uBq/DJhZvghMQiFQa3j5q
 n1PjLN/UIjZbX9WJv+TzvqrSdYMJ1NqRtlSpfjQxSMQOzHTW1t8P5RY9/paTgyc9nG+9WkY8ShY
 MeqnJPv07q7NZ3uyst5LDI73psHSm/+poSVPU/9ejx3ARH0LE8pXdMZ8V6E5gXwce276iM4wTrs
 +ZWxPPg5Z0XXEBFIMPEotSV/6zqT/e0SMcHv5J/X20EXSrA==
X-Google-Smtp-Source: AGHT+IE61+JkEms7mvwrCtkF9V7eu8qG5cEP0uNEk6gtbqSx2Zto5kK4NzL+71vULGl7yx9z4qn25w==
X-Received: by 2002:a05:6a20:1593:b0:23d:34f2:3a22 with SMTP id
 adf61e73a8af0-23dd7b33fd7mr5187585637.7.1753998887735; 
 Thu, 31 Jul 2025 14:54:47 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422baea948sm2312845a12.43.2025.07.31.14.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:54:47 -0700 (PDT)
Message-ID: <10af0b4e-5e35-4356-8813-9e11c0d0d3a6@linaro.org>
Date: Thu, 31 Jul 2025 14:54:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 73/82] linux-user/aarch64: Release gcs stack on thread exit
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-74-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-74-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


