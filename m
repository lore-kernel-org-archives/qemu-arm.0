Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94278CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:30:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1m2m-0004nd-T2; Thu, 25 Sep 2025 09:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m2k-0004kc-Lb
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:29:54 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m2U-0004Px-7o
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:29:54 -0400
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-46e1cc6299cso9257575e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758806974; x=1759411774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/qvUVT3yO9nd3SqPHDwu5amgWsvjic55XPaTGM5tiZw=;
 b=emgg/rOZbwYUvf5gqOOwgud7tmvE5JlKhId8fQpibM6bSQVTsahLjynSQDitCS9Dgs
 YQQAMjm3SOeYfu9os4AVGP20MozeIINxSu9LizlrtBK7MGI0D4/FVn2tJHTW2cb3F1S7
 YHZKhow3Jy9vyj6DiUWDWMsXromRgjaVYLLl0VpNR4YpP6bwX9jOJSf/1Mxdqre2op4B
 jGwjCgZM6zQ3jP3fhvSpTXb0mxRhwTVmDp1ARgErigx7+ZnJ4weYBhulG4/I1kzxRCBm
 rfZstSXwNlICo0w0nmsVFT61O9BA9nDvSKoZPcouhtAwhFpuZBCCSxJbU6Q2a1NPANBd
 zCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758806974; x=1759411774;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qvUVT3yO9nd3SqPHDwu5amgWsvjic55XPaTGM5tiZw=;
 b=vQlkascPMezKZJ7452HBABsS7i6xlH5mcvcRHQE+oPOYxd8hs/8mwkoobl/UgDt/6e
 9Zr6Lyvi88SstaiF2HxZ5c0CU/9BCQcyzjihcqJYvkiiLtF3IrfcWBOB1VtvfGj9y+pn
 xBk+fzUNq3XpRGxn7rz61+5gzGQj2pZ3FqT0m9uPjm3JRw1as+efvMZPT7tgkEghE0Hv
 L4OaKXt0YvGY0WWZevtZ1F/yDEwY/otBvveuBizU1c9SrzzsvIa0EOFqtFWyanskelCm
 nR8yQVG3nNcKMvsbOXkVBGiIKISHpKBQgTTPt+dYWJsimb+Lf0XlWVEV3IfL/1hCRs3Q
 WHzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvo0nhfZgFnl2zqjzxbOk7S7qVGXLUnnxrwAjeoazFT9hVLL0xp/15VrS6rRhcRdhCqTOzcQcjFw==@nongnu.org
X-Gm-Message-State: AOJu0YxEt6o0tWXn6ugino3qO/kYITftYlZWtrglrlMu+Mubm+yUjlZr
 5tTvOJv5te2XeSiYq2GkozXWh2mFuYIbNglRvKXnAGgjek1D5HGYz0raKDXMlshF3E6spJc1UO0
 vEsuOPidi3yP2
X-Gm-Gg: ASbGncvzfczJc9xFrfBgQm+QMUzCYMcqirh2pvwVOCKPOEUby1l0mAvN1muxASICIvX
 ifFgQTTQoh6r5z4GLKlb1HwUk2ayzwRcxMWcFsxg4NJr7/tFEOMPqKwj0fbINAUP2p16Vo8vbfM
 8sClWjIC2uQCSW5E7rj9Mm/pqyK5Fyq2558Xjd76wU0tmESYrXzKP08rbnMObHePnSHAhBQnaLP
 ZRlTn+0B00bshlG6y8rzgllPNWZcRH4zkRmQCN/XgbU6D/ykDm4qaCx/81jq9nSlYhDcEDYglJ1
 hyoaKhqdRieN09rbkWBiJ5P7gmmUudz1RqpOX772DMQ4ryVe2l54j885Ix0eV31Nd4L+W7r7NIX
 v0ti8WoqtsDugbFC5ubu4cjAIu8uuUjnBFybKbJmETnkJXqPyUC/XE7+yEHT5Q0QDJw==
X-Google-Smtp-Source: AGHT+IE+HIm3H/CRosOSHbJ63suIHHlZo1uzRspV7AABVJamp7JcJuMBnna0yNqqvvLiiBrd0LzaEw==
X-Received: by 2002:a05:6000:400b:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-40e44498167mr3829232f8f.14.1758806973669; 
 Thu, 25 Sep 2025 06:29:33 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996d7dsm81832975e9.4.2025.09.25.06.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:29:33 -0700 (PDT)
Message-ID: <2bab9ba5-263b-466f-8748-3d65a1d8d93c@linaro.org>
Date: Thu, 25 Sep 2025 15:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't set HCR.RW for AArch32 only CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250925115723.1293233-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925115723.1293233-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 25/9/25 13:57, Peter Maydell wrote:
> In commit 39ec3fc0301 we fixed a bug where we were not implementing
> HCR_EL2.RW as RAO/WI for CPUs where EL1 doesn't support AArch32.
> However, we got the condition wrong, so we now set this bit even on
> CPUs which have no AArch64 support at all.  This is wrong because the
> AArch32 HCR register defines this bit as RES0.
> 
> Correct the condition we use for forcing HCR_RW to be set.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3128
> Fixes: 39ec3fc0301 ("target/arm: HCR_EL2.RW should be RAO/WI if EL1 doesn't support AArch32")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


