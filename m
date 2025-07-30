Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D943C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:14:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhE88-0006Zh-Iw; Wed, 30 Jul 2025 17:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDxX-0001ys-F6
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:03:35 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDxV-0004px-T5
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:03:35 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so252239a12.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753909412; x=1754514212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLqkvMWORNfVerEKRdyrpJ4UAqvOqoRlGSAv+02Qx4o=;
 b=Vk0JoepHARv2FPmhO4F2kQEqeMzqIdzxU+0GgekBv5mkNwgzjXXLfBpCHX/C9WyfYZ
 Naz1ECLLJaXeWsyS09oaZFYK9E+dVvRaSTZ8IQuddnHh+lEtdL4H8mwfmmqeU05oRgwH
 im3nXjmM3ybJyhJME1zQroM7BtQYjYKAmF44d4KY9ir9T69un51EYNQc0MGDc/1FqPdH
 JCw7Oq4dHo9VXuW1+OP9+j1VRnLSiLk14JxW++Vq8eEZE/8Dh6RbrS0dDQWMw04LYX4d
 FgDshyRU/o9zK2QVaFL+J8pEl9USseoHW4nkOJU6iy+XPJ/pXu1qlm9x+FMw8xmx3Nst
 2xLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753909412; x=1754514212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mLqkvMWORNfVerEKRdyrpJ4UAqvOqoRlGSAv+02Qx4o=;
 b=WZIoYd9HmV6rMTKMm/MnLji3zAJkfrSoBYAlqSS5pzoj5ypFblGwkHgiH4Xfzr/u7S
 /HgW1z/Tied9q3AhqYUbYhcelESdaij0tbzvbFx7SdIl24A+vzX/aaHnhd144uuRIalt
 jP5WOCjDA2dItT2y0yi3Id1dKxPI22j1E09H4hYEezAvdC8ob4EhPSGgvPrz0rpf9xxd
 yjTqWWSBlT6Zw/4MalKsqrwN8dZIQzh/xmyfEFF+3Lijmenfx8rAfnWx6Bo5Mf/6wYXf
 E3eQiukdIZoT4UEhvmwXzNIqGVRNLA6e9CwxPykyiKhJXG0T9Sb8iFz4DBGdbme6+crw
 5fhw==
X-Gm-Message-State: AOJu0YxG3zBR4y3igiwYNC3ZfPdh5V7RhuT097u6REkSCvGKs2LFiLjo
 2aqYPp4QDou58aS74mqUxAhTOU2JZB6FRKgG3UONDwmJU7ClKUq2xfLR8A5rQ35Q9KU=
X-Gm-Gg: ASbGncvbA7zpkprupt/7TIwsQPLNOx3UGerfh3mQxDuLjnIpIrSf5cm4L86rVKyCtBZ
 A5MuX/SXDiNovb/9iNUjczmTcGzjKXlnL8/RcgYxwcnl13uKvGBTaN16YMPf69kbqzS3ZLMTchX
 /rDGtBG0nu6SIyRhyex4QEjDNqJZf+3OgRuFrZjiz18FYmzGBwdLKnG1XZbydemYQQ3KiH/dOei
 WIiGKcc/DRQqk7+gCRvd+lvz8/vjHiBtAYqMgF54dZOnKviaL2gW3MNMY6hScQ/LjT/DrqKm2Hd
 IPUXeDs3G0N1n8OoJgoxmwzfVENueeMstl9i8b7Ts6pD0pIsCS+N3VLZF9oDx31KTOpOnyrEQCe
 6d/6IyEsARES6/iy8kRzW7JWXKos2N+Zw4Tc=
X-Google-Smtp-Source: AGHT+IFaJ8RtOl/HPrOIRWcU6E18dFhsE8sOkM8Ov8Lq/YnZJb8Fe5iy8+W3YwdKoJLAruoEdXZu4w==
X-Received: by 2002:a17:902:ef0c:b0:234:9092:9dda with SMTP id
 d9443c01a7336-24096b23907mr87757425ad.24.1753909412108; 
 Wed, 30 Jul 2025 14:03:32 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef47f5sm422205ad.10.2025.07.30.14.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:03:31 -0700 (PDT)
Message-ID: <271f1334-48bf-4467-9449-2268657ddbae@linaro.org>
Date: Wed, 30 Jul 2025 14:03:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/82] include/exec/memopidx: Adjust for 32 mmu indexes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-28-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x532.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memopidx.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


