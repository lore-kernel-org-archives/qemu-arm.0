Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEFACAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:00:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jhh-0001xg-ME; Thu, 25 Sep 2025 07:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jhf-0001wm-BU
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:59:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jhV-0001pI-Fy
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:59:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so7960125e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758797984; x=1759402784; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zU0NEarb5pJ0rADAGdh7HoWzRim7kmV72Wf6hv8N1U=;
 b=JMXgin4nZMll07yAZiHFOne5RnapIVoNgTi02hzD3JlcbRtRJF3WLa8S2lPgB7zJE/
 0Wyc3d93UZOpTnAP87GD+tlK/N4aciU/UEmli+5rQLlY9sJuqCD65sy7dLFtmWgIYNbo
 4hUb9oN0bMLaGlwGTd1LAIy56LboL9ZjuQ25kAF8EVB09u5JnC4DAPzRvSpYfrAEhFxm
 TzYWHb5vMcS0fv3oUaqrpNgWEzvJ/UQsrI4BWcovKxtmrwJglDhKPlpRKs1YExpe7hIs
 uxmM4n579AXPhlznATM0hNvoqRAVe1LBhug9DwnVxCUz8A6MlrWYVdAEnNGoXZ7bFpHt
 DoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758797984; x=1759402784;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zU0NEarb5pJ0rADAGdh7HoWzRim7kmV72Wf6hv8N1U=;
 b=ur9TvfTxNQW6MRLQ/c0AfCHePIw0WltVhDicgzWtz1v2CdFw9Isw1PrRRLOap4YmZ8
 Qtfc9ggwiROJILMePqV+Sj+F3mYeIeCoqNUwUCLRcSdH+Mm6hLK9mrtuP8D2VDIxiVQf
 iTXRrVwSEkmE97YjAj4lfCHy6SSAGs0AKxZZdW5jwRTJwFFydzUu5D4aFwKA9zHmRINC
 iDWgxuJLozXvIsrY/I0cOQWCA+illSv0AKgitIuykDCI0+hVULR9hQvkJoX6ecYM8Z3s
 QDnkKc8/mS3WCTCZQ7hxrssg6Pajum3o9kSdtMjTkgUrL/RSs+425zUfYFoGLGv5MLPD
 JQog==
X-Gm-Message-State: AOJu0Yyxvs4bDMmE0dNPyOd13frAaKsa4e9gPr47Rx8gfRUvWKUujHes
 SjEl/ytadj4r5+1OT25PERExebkMw1jwsC8Jq2vLOa1wcOwyd6Ud1/NqtYg2D29Zdk0=
X-Gm-Gg: ASbGncuDKvK8sLhZ1sIkwyBeCg2dPNSi8Xrq6lRBmlyVjgSwTKrDqKaVK9+lOeqzy3N
 C2/llYJUiPiohFevFyvOQs5xANfnh+h/Q+AgQ77gXY0/zit0HO93nd1leCBcLhYQM4OKC9vmWsD
 Tc0oyDZLCY+D3k19wxyjuw4Pbt6yFo7h6AMDzuwmR8BCQ7FdOjSTKpnuvD4tICkMJlQvNkckjhW
 AX2EWndAWIsSKfy7ZttQRzo9eJSnZcOvLu+PEU6TIkNHSRbBFmNG1jCccQ6bofm8mjchKhSX+rW
 giKK7lvtDKRQNdu5vLV5WUcMrJDgQVoELYNKAhewmqH5hfMFjkwM/01P8n9P7FaqRuVaN9qiQvv
 +c9TgqErjh2qJJbP8Ic+/EtjddtGxwYZ0/CLHdkSxwEnqkiZFTbkLDE7hKbI13UtZ4A==
X-Google-Smtp-Source: AGHT+IGOQjdrS/HfOfl0fqFAE3zZvdkHzj53foWzbuWeTVL5pIQX3JTCoV/QeOemoR0jlUNNqkDS8A==
X-Received: by 2002:a05:600c:6306:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-46e329b9bf6mr29119625e9.13.1758797983873; 
 Thu, 25 Sep 2025 03:59:43 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb21esm2587954f8f.7.2025.09.25.03.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:59:43 -0700 (PDT)
Message-ID: <708b94d5-c09a-4700-9a40-7937c3b6dff0@linaro.org>
Date: Thu, 25 Sep 2025 12:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/36] target/arm: Improve asserts in
 define_one_arm_cp_reg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 16/9/25 16:22, Richard Henderson wrote:
> Reject ARM_CP_64BIT with ARM_CP_STATE_BOTH, because encoding
> constrains prevent it from working.  Remove some extra parens;
> distribute ! across && to simplify.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


