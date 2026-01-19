Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BBBCCF2EF
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vho48-0006qk-DX; Mon, 19 Jan 2026 07:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vho3u-0006mw-Hn
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:08:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vho3o-0001aS-Li
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:08:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso28160335e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768824522; x=1769429322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ctXZfo+01L2t+GxjVT5SxcOwyvERdUyQNA06MEQ+oZ4=;
 b=qkntceuSQDSkjbHxo1vOntG0vPrR7FoNJiFab584kRKkFTAyE1YS+aLrS76Rw6m4Ns
 P3ISzp5jDA4ApL/f8ZGwGthsiDm7lE/SlQH9iVa5G+IPF+D7i5ir14dra52+0F+ONdyr
 Lis/dvdxCT4CoYd7O8A8GQKzVAoeYgdkYdhTFpBx5pFLXUeqJe8T+M/aIec09fxThA4y
 BZzLh+7WLtGVP8f2Qi64UIZJhRvZ29sx3SCAXRDmkpkfMJu9KVTUlVm8FV0nRoDZKCMM
 Jv8x4dNv+Cpv68XRz+eWAccEhPDaOy0j3zRcbBH1s7tT1zvTDTDO+y/gXXNsAC9ffXUC
 zfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768824522; x=1769429322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ctXZfo+01L2t+GxjVT5SxcOwyvERdUyQNA06MEQ+oZ4=;
 b=uKX5y1VfIPogUmvOl+Bzd1S6BbDLyul+WFI8q60b61Oj0bDpzChafxb+1nmxl8giRW
 pXidssy078Lx8RU7CGMMLpXRas6KVQLwpJJcL5g5AH8rvTzKylp/Mzpn5dAOnoKX+5ml
 3nPLbuzhYUDM4zUeQlRedtLDzD0+Q6hDROqdbhBA3/ppHlz6CO6W7A4BIAaixhyIwU84
 eDCJK9vA9mm7yvLSGP+HNlFAwIDwVMbNn3yFkskruDQI4y/MfMDs1MnrLnqSi0HU2jcz
 +8Pwq/IZuEH3/fSq4Y5PZAD5Iuhmz3JBBJ9OkCHCdIBEem5ZIf3x1OhpsgEa3ajF6Rht
 qAtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2OVeSwhGuauJ1qvKavX9N20UtYOcONQU7p9sWmTGAn8E9c1c0TIaJzn0G2MlFYSN7qOyCSIQOew==@nongnu.org
X-Gm-Message-State: AOJu0YxtAtKT83ckfvwzkCJoW3waORV/Nqg9rLfT7tG1uH56ctDjWnRc
 GNwKFcgR1N5/wsfqbUPT8J5ZJSrIV27moEYLHMADpAVr0Ewox6LHMPzvAfcCDHbVRvA=
X-Gm-Gg: AY/fxX5p/lFXEFid27pdfMT951t5UhqT9l7UlTBWhHuZ/LjfK1H9McS6ROm6fGobfRt
 961ZgQPmmpjaud1F6B7J0T2KEzruInZIpAQn3rXjM6XqLJhwfn6mi+wJWaPFnz/tZ2v5y5bRD3i
 QxVd3jSO4oK3PZT6LcfQ7eGCCIil0H/5PS2+KAxF/ss05ld42w4ryqpQXXfjvlrd1iIqwel39tS
 0OSxK0Ln53mTu7ezgUfHAYZ/TlZAfdHByBi26g31CALlBy4CSMaWD8umjnvjCBQx1Ls9CBAvjKt
 QhNtgMYLU+LdmuuhRnQ7NPbtqR5jip2LXhHnRe6CQVDz6itNDNsstPCrnMeD3toNSK6z/DnJmyA
 Q9DiUK4o+iMyycYMjypieul41yz0O8ToHsB6kkq/Iw9fWJqIAP8jZhbzwL5CfuJKCZWOy6vGbaQ
 5KEKJS3ih5hcoRn92cUezAsJgBkAkAqlLeQrhFd66D7K5NFdSwj/yVKA==
X-Received: by 2002:a05:600c:674f:b0:477:9b35:3e49 with SMTP id
 5b1f17b1804b1-4801eaba084mr111910445e9.3.1768824522184; 
 Mon, 19 Jan 2026 04:08:42 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9ce5aasm86009755e9.2.2026.01.19.04.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:08:41 -0800 (PST)
Message-ID: <249256a4-96a7-4a77-878a-badfd0c9010c@linaro.org>
Date: Mon, 19 Jan 2026 13:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/intc: avoid byte swap fiddling in gicv3 its path
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20260119120030.2593993-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260119120030.2593993-1-alex.bennee@linaro.org>
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

On 19/1/26 13:00, Alex Bennée wrote:
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This allows us to keep the MSI data in plain host
> order rather then potentially truncating with multiple byte swaps of
> different sizes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_common.c | 4 ++--
>   hw/intc/arm_gicv3_its_kvm.c    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)


>   static const MemoryRegionOps gicv3_its_trans_ops = {
>       .read_with_attrs = gicv3_its_trans_read,
>       .write_with_attrs = gicv3_its_trans_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   };

