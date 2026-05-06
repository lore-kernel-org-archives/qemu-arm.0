Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0154CD342C
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 13:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKccC-0005aS-Ix; Wed, 06 May 2026 09:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcc8-0005Xj-ND
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:48:37 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcc7-0004XC-2L
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:48:36 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7991db3dc98so67962627b3.0
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778075313; x=1778680113; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aAG+KvUEewg8B86niHrQB7Jf/yP/IUSg2UD6qboiwVM=;
 b=fWhuk1ABFZVbbcuLbt+EI8HB9ZfVa5cW3O5CVFaLccHObv4HW+zrosn+s3OIMMYsuM
 PQKhmGaU6T4hYa7di2CPn/UEeIfMLByuYIHITBKxmhLEj1kYxIBEDZXZJi0eezMvV5VB
 6RViJi3hYDvUG6jnYJVB+FHd3S7RxeeoMmFR+Iza8Di/z0aTgGNE5DzmOTUk8W/6f00f
 i16y4rY7EtPmQI0p7F7xefQ82Lo8JmaBURt1nP6vr5vJO7HfX2yeZ/qBBPIdgmqYIVQH
 EXPlwiSxKyaqyLWOH736S2x1wymsWoNr6j3jvSvXXHD/ZM9ZdtS6WneKSUeAl4HSMPhg
 I0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778075313; x=1778680113;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aAG+KvUEewg8B86niHrQB7Jf/yP/IUSg2UD6qboiwVM=;
 b=luHKOEVtTBq94i9FJOvTqQoSQB7Ym8wkO3nSb+SDZk27SvZLI2quoyJFpNuHs9WdmH
 SDyKBQk5yPKrRxSjx2+E2UqMhceBC3G1/B9szAomyWp5DQYnER0FAIT1KnEkn0CBhIAk
 cHHWBL8dzQDX6a2TSq97Vw4+WZpISakicwqVUqZhH6xflBmdgqDrE0dQBo1A0TOH5Uyk
 bPoFbRwN/Tf1wJs2Cfa8p9RWAapyCUYajickCLa7357OsBYBPjq9DTTCYJbZjtubMRmY
 44v5AnU1LxsbSJBBPD7b62i8S8pWcfzygAJ3jFfwIsdjPq3Zb543H6vurErIRS+xPu0J
 e1Ig==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UamEeWMn+GkkEmi9DnTsg2gUiVCfkCZOfcVCz1g2Ok+SAZHzuPlbPTgXitvApsc1t07hoA9DXcA==@nongnu.org
X-Gm-Message-State: AOJu0YyPwRe/JUK1Sui6I3GJV9Rba1hDP8vH8BbOBkH5G5XlckTR2ktV
 Eh6l2Kmj4OW1exB+Gpg260ubD6/qFca7fSCW9MDZAjKibf2moSxUZAb6F9qZq3A+gmw=
X-Gm-Gg: AeBDievirqpnwdImcFBU1xeMH4HWodt6aI5gGRX5YflORwethBpwQvjDFHUI/579KeB
 C/EQ32otGngvFnMCzRHvQNcY2aJ9/k4miDRmJCbxw6ORZMu3HOVr6TTO4p1N7DS7y/oewuyqm41
 hth8+dqDwqasQP3e0a3jobFTJnSnglKhZaocikdunvhQ41BlPNxeY4i6guvWR58LFTNZUcUqP2c
 yxsqn/dojC3iDJfUQzivNAK5hx3RS0QwW/HrBosOE0SbhRKo0sDwNnpSlgzDI8ZYqKLxUFd725s
 SBn/J1qP1jzv4zHtdD2qRXz8IFxiGGx8jsXkHEtJ93a1P17aTh2YxMj2oJkGTU2Fv9uHZZZxs8C
 13jZukRh7s8AAjfZubL0X67y7Ry1lWqoIY/zolsO7Q359dZ5ilyeDjVOzvwHcRK/CMC5YMLJzCY
 woIhv5A25NrpIsRmPzbWPhM1FWRvoBKhNpJ2UMMWqqFNUVPl81FjCaJI5tqqbTuaM5Qu2s99rlc
 wLKWaKRAQOgraYDZlsG
X-Received: by 2002:a05:690c:81:b0:7ba:f3a2:553c with SMTP id
 00721157ae682-7bdf5dc7b67mr39581007b3.11.1778075313437; 
 Wed, 06 May 2026 06:48:33 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd66896b35sm77571417b3.47.2026.05.06.06.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:48:33 -0700 (PDT)
Message-ID: <ecd55b46-2536-407d-b3e9-da74a5f02c7d@linaro.org>
Date: Wed, 6 May 2026 08:48:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/15] target/arm: add canonical MTE check logic
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-8-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-8-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112e.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> With MTX active, address tag bits are checked for canonicity if the
> corresponding memory regions are not allocation tagged. See
> AArch64_CheckTag.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/tcg/mte_helper.c | 30 ++++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

