Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DDEC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:56:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDqa-0007CF-Hz; Wed, 30 Jul 2025 16:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDi0-0005uz-4Q
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:47:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDhx-00011C-QG
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:47:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-749248d06faso226214b3a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908447; x=1754513247; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+qbVMC101eKAUl01o/3X7l1jA6vVmTrenKiZtyWgrFs=;
 b=nMYV6VgEXiiV4ep5kd2ryvUVOMdVUvanYLk72H1opnN349BrOhdsgMkjfh+dVbT2cE
 oQF5LmgFOGucs98ztDox4OQ3dLQbUsW9wKCWaB4dEmCCVRJkxrqo7uYCnXmdCojzfGMU
 iN9E38bAlf2mBU1dXgkW3BFFgdjjMdUmRNHZLKty6FD5vVGCUr4IrpbIXRllIXJTF6mM
 XtOfuhG6QczLaUOiV75m2LYHi5m8aMXXZK11Y5T11qgQUM+nURqS9ewqggC791hSS4nM
 GLDjVsz8geoFmqP/kAEF+s6L4WhwrGAYrscZPWNMZfsMNNXVvzgg52/zvSn52T4IRIvm
 eEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908447; x=1754513247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qbVMC101eKAUl01o/3X7l1jA6vVmTrenKiZtyWgrFs=;
 b=X0iNfgo0iPm9JgYUxu8zm0n6fROLAadyTgNps10tmDrU9aJuXilnr2dAA7xewctkac
 zmpqFe5Yz8iBst5WfMTa9F0zN/LXbQKoXUo3zeflTF13gxkeiWiyCHxeqX+rnvI9cG3Z
 b5wBUAjBd3t0sUhZlV7vU+GT9Tm2Na5q9EltihJj5px7KYliWEYR2hWdyZkH6JSKn7UQ
 hsmRzsBW98R1X2Cy+wRlTY4PBjuNnDC4yAzIkRxzQe5Czej03seZNftj2Z9UEfhu/ZXO
 ruTCKZxJ1pCYBfFU2NPxw3n1KMsux9K88+WkQuvwoiXpsU+XO5YLOBCBfp7qIWODA07M
 JpBA==
X-Gm-Message-State: AOJu0YyiIFX5mG8uSaZ/Mpv7wir9kjiWCMsj+NaJJKtBkeVMpfWQAXfn
 vElViR5s9K3DEdjpnEUz+qCMIv/SWJq0eYYqGUXxmYT8U/uyalyiOGvlKxIv2zKDhZ8=
X-Gm-Gg: ASbGncswosRx7zkgeLkDvYlAWjX/MM5lBdd0j3biI1qsRAWPdGXhd0teJKmI/BLJFPt
 R0N444QvmqIaTwC5O5cHJh7qWRFcyQuSwouQ1GVrhq+yyiggMig7QFBhZXpZLS8x5cAaB7FGFUX
 Zh7rVOC1hnS70vIEioE5ddP5jKYxSDphuQsw4fr7qlM0UUm/UdhxwNEYipHUxguapNxhopdl6Lg
 /KqEghDwg9YSz80EG2xWYeECO3VV0/ds4KwOCrYzqUTDCRE3UFTAxi/FgT8ufeseLVnnuxU5vZ/
 liQj1n+W2xIw8sIn+m5+JxQVBMbU1P4ziZnc0/HxfvYQq5O+FYDETRkq7veQ/q/tAobPaECee1b
 FvbhX7Mh9Qv9OJiGWlgCFJlm8HOsfmg9iQAw=
X-Google-Smtp-Source: AGHT+IEqepSlcPq4dCcjCzPj0ChOxrK+3Ojg7ewQJoGyqRGqeUsfiZ4pfx0zDlvVggNA6blaY41l2g==
X-Received: by 2002:a05:6a20:3d1a:b0:22b:f4e5:d0ee with SMTP id
 adf61e73a8af0-23dc0d90c35mr7244529637.14.1753908447387; 
 Wed, 30 Jul 2025 13:47:27 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f58bec0sm10028547a12.17.2025.07.30.13.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:47:26 -0700 (PDT)
Message-ID: <e26344cc-30fd-461b-bad5-dcacb2db5f35@linaro.org>
Date: Wed, 30 Jul 2025 13:47:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/82] target/arm: Expand CPUARMState.exception.syndrome
 to 64 bits
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-20-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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
> This will be used for storing the ISS2 portion of the
> ESR_ELx registers in aarch64 state.  Re-order the fsr
> member to eliminate two structure holes.
> 
> Drop the comment about "if we implement EL2" since we
> have already done so.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h    | 7 ++-----
>   target/arm/helper.c | 2 +-
>   2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


