Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEE9C83F22
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 16:40:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc5B7-0004ri-3F; Wed, 16 Jul 2025 12:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uc5B5-0004o3-DX
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 12:40:19 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uc5B3-0008Mk-Ab
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 12:40:19 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-60d666804ebso579489eaf.1
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752684014; x=1753288814; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hWud1wwOv0+fRiIm88rHy1JLosMUoUEjaSs+Zgs4Zb0=;
 b=WSbG0AafE0mDkNuOixledCVDE7SGsxNTXPOOF0PB8z4THqU7qCvOOPYrvalJrWecDx
 iztFyvje6alLT90cfTK7VVnIYTo5M8gIFAP5bkxwc9AcCr4CvvA+BH7yeeRf7vuT078i
 mhLX9Zan+hCZxtO8KDkkGGdB/YgtfyML2fXIUHYgAKkr0HFZfhTlFylE4honZphZfGnQ
 /IfvtTEWmF1reTO/xQbtkE7Z44nqygfS+ilZ8VMg0lYs79OgOfaF4TdrQRARxwSTrq3+
 lWQItUAsSd215OcDFJHaw6XoY9XBiPpc2IU+kGjqkaXWKcrv9xYlq0B6tweolu+BwyIJ
 weVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752684014; x=1753288814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hWud1wwOv0+fRiIm88rHy1JLosMUoUEjaSs+Zgs4Zb0=;
 b=D23fp67bDwx3sCdBn7eXMCTQ6Zc6H5jhiSqV713fQS2Qs5Pnm2lCCCZzPq6ZjUXyvl
 +aZUzSiW6k9nGqmHP5rmUo5nvYdgbi+R3z9ERu5bkxYTgrKxOw+3iW4wfaxGNRCm6jeg
 bbHp4O1MyEg8eqS4o59JGJEMWyiMcnCOajYE825UepR2/CER+g6AEVYYDw6eLcHqh09S
 TjCWTQC4BxHRYpHsmt/Nr9MXCTUZlY+ZZAoPkCAzavgfdWLs13Z1PUCUyfwU+lQLj6co
 xJTNZdIdNMyn2aNc6pd6k7q+0z2QvcxvZTSqSnUy39WJJ/t9ApqXdhxKwHFxV0xJb1TK
 c97Q==
X-Gm-Message-State: AOJu0YzPgzNaJ2qkWj5vwfRBFuXYGfnfD6GlOwMuNPIFDlC/wtFqtGlw
 Xk/920eTK5sGCcQ7nBDNuV0YFm9Tig/FY2cPbHwB69Mgy+Lkk6oy7ElG53VMjemYBz4=
X-Gm-Gg: ASbGncu5Si+FL3drbUujMEqc8n21tN4XqjKEeyDNXo5ZnTsY8pOCj9wE+yKGc5V4a3t
 YkdX3DiIHl+KzYx8evTUbol538yBzkHknx8iyuHuNFWzB4Hh66rGGnt7W0Ovfomf6A9Xz5c5wp3
 /2UXFoV73EbHfpvQCeg25Z9hCyfJ0hZuyDLlJitfi9TL+e38W/o1ZpD7+2xv417kC99uFf0RVpk
 PlO8L2XmrRow1/Fp1K4Ta8LZR9ORdua7+e/EJl/NCvnZ9wfpFM4cHd0cDSJ2j7pJ+tHpt9XlZGu
 hhfFdXZclg7tzQUjJvi6IVXlnLRQ80X0PT4fWolgdnpdVu2uTn2EsB0LrGAI6457+FyP7XShYPv
 sCXUCZ489B+4MRuhjrbkfTc2/ZhKSx8OfkzcGrx0PQhyx+grkv6kWUOMcGRe/UWoa6OWGkFARRn
 YK
X-Google-Smtp-Source: AGHT+IF5QUK+5n68tnc0gJq45fW4CCjVfDZ6IiCOOjA7ElipNrpe9TbdUsltvHstkGmfVGcJO544JA==
X-Received: by 2002:a4a:ee19:0:b0:611:758f:1fa4 with SMTP id
 006d021491bc7-615ac9288e2mr159432eaf.0.1752684014425; 
 Wed, 16 Jul 2025 09:40:14 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-615a4e9f0b1sm345917eaf.25.2025.07.16.09.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:40:14 -0700 (PDT)
Message-ID: <52c5ed4a-0225-4360-b1c8-e3866041c4b3@linaro.org>
Date: Wed, 16 Jul 2025 10:40:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] aarch64: update test images with new trusted firmware
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, jean-philippe@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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

On 7/15/25 15:23, Pierrick Bouvier wrote:
> The FEAT_MEC series [1] introduces FEAT_TCR2 and FEAT_SCTLR2.
> TF-A needs to be aware of that change to allow accesses to those registers, and
> thus must be patched [2] to enable this for QEMU platforms.
> 
> Concerned test images need to be updated to allow them to boot.
> 
> [1] https://lore.kernel.org/qemu-devel/20250714155836.1514748-1-richard.henderson@linaro.org/
> [2] https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a/-/commit/c8836cec14213bf92dae79d353bc345254a0a31e
> 
> Note: [2] will be upstreamed in TF-A once associated series on QEMU side is
> merged.
> 
> Pierrick Bouvier (2):
>    tests/functional/test_aarch64_device_passthrough: update image
>    tests/functional/test_aarch64_rme: update image
> 
>   tests/functional/test_aarch64_device_passthrough.py | 9 +++++----
>   tests/functional/test_aarch64_rme_sbsaref.py        | 9 +++++----
>   tests/functional/test_aarch64_rme_virt.py           | 9 +++++----
>   3 files changed, 15 insertions(+), 12 deletions(-)
> 

Thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>

and queued with FEAT_MEC.  I'll re-post at some point closer to opening of the 10.2 tree.


r~

