Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CFCA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:45:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulikq-0007ee-Gn; Tue, 12 Aug 2025 02:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulikp-0007dw-2n
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:45:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulikk-00021W-NC
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:45:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so8669035e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754981096; x=1755585896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AeY2Q0OU1hTCXSe0LZh8iVIs0LXVbH3XuQ3PAl5oBwY=;
 b=DvVOPTaaA49rUxk2/W2hPorRnw9m6L6q98iABjhLXonn1ZroAqDV6lKyCqb0/xlbEM
 n3l9CBhGoRfckfVkmElgAp1+UpRSTV5lHdHtsfaHg67jkgesW9hY3+GpjeTPQuhN20PI
 5jaGXfQBk6p/hK610j0qJsjogjIYx7mfML6QyTElh6Kx0BygnPrOiBZrdy3/IE/PlU06
 nVLtgl7y1QrG9uSIZnx8dnZwwt4aSHrihwN7TSttBSgQur8UZmBWhcuyhc7SgOSh0TcA
 7n/bMVNVN+xu7xvwYfj5sjSVGAG5qk5pbKDrz2aM0Qer/iID4y/Lg40sxal7C0N+IkLb
 7pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754981096; x=1755585896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AeY2Q0OU1hTCXSe0LZh8iVIs0LXVbH3XuQ3PAl5oBwY=;
 b=q88pllJLmVRxGPMdeDI1q2m4IVpxTxk0L/3FFuHdAqcQlfF6eqaN+u02aUDms3O8Y7
 6hI/OYkEvxLpNntMweMaCJZ8uh5kC1t543fAZzmAVB0bKL4P8Z0vxnOYImbHAPPshKTr
 YYQ9PUG3WPLdEGLufODmJaKTE0ZLzy4ffKDoK6mMUwlIK81FFWkZjerchsOJHTatwwRT
 q0d9eliquazwKRtVHm29AerJBCcYkSFlqQ1sWiSgZrR2PDeXFmOAJkdui+1jTE6frLaH
 YrgF1eo0UaELOcgE0GnlfR36NS5U9kR792455Vi7x2Gy7739TopML10KfmK+efXF9S5u
 aEYA==
X-Gm-Message-State: AOJu0YzXXSFiVIf1XBDb8WeVVZNdmxV183fAvv4PDRpMplao3j7519WF
 vKGaRH29EH2SlOEa496/T6VqNyzhMraufixr8yQidpoQyPrPFuVj39oAv6QxXZLIxs+FZLLlcrD
 Bdfnq
X-Gm-Gg: ASbGncsjN8dXL2Tc9ylREBk3q6EsoUbETuHbWJFrzNpLRe1f/8/7DbVl787kONqAsWT
 9G1UtIj5+96Z2HpN18L4KH87TmTcMe/+hLhN8wButcfrlt96ChPXo8WQCyzFjoGxzc1LQphvuaV
 PCLRf9JVgzQmtBq+MSrAO+5VB3zNkk08o6rDpoqvUU663T/6hCiP63hLMa2MEUr7LLF6N0rKy0H
 e6QoXtU8AiOf1NIqnF8+uAIXFzwkF6Nq5YepLokeLb7jUrqihT3ZhApvItEKaXCfDTm7Wox65rn
 DirGpr5Q7IuMHYYi+oPnpR3sssVljfVgXLXaZOLudSb9Ns6OCvrpNPgVnvFx0AJNr3bDazvJAFg
 ajEZ3BImSP/NNbtnJkp6i53+Fz/QOJ9k6EA5mIkKT0y4fVqHJtEmKBeYDpi7AhCa31Q==
X-Google-Smtp-Source: AGHT+IHFuz9qfLo96/p4ITP+zQBuVZVXgRX8p2Z0sG/IycK4laBCMmU92mZekazW9diDyhProiMIJA==
X-Received: by 2002:a05:600c:1c01:b0:442:e9eb:1b48 with SMTP id
 5b1f17b1804b1-45a114e631bmr11167625e9.24.1754981095631; 
 Mon, 11 Aug 2025 23:44:55 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48de68sm43440171f8f.67.2025.08.11.23.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:44:52 -0700 (PDT)
Message-ID: <e649094e-a4d0-43f3-a027-3f37b162d1df@linaro.org>
Date: Tue, 12 Aug 2025 08:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 81/85] linux-user: Change exported get_elf_hwcap to
 abi_ulong
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-82-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-82-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 3/8/25 01:29, Richard Henderson wrote:
> AArch64 is about to add the first 64-bit hwcap bit, so we
> have to expand the return type.  Since the only user
> assigns this to a abi_ulong, match that type.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/loader.h  |  2 +-
>   linux-user/elfload.c | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


