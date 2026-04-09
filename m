Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D0E98FAC
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 04:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAhHw-000857-HZ; Thu, 09 Apr 2026 00:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhHv-00084j-3X
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:46:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhHt-0003Fr-L1
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:46:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so3424535e9.0
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 21:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775710000; x=1776314800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tN4iP+/W7f9tl7+doV9oPQItuL5wrUcZi3o14We7Hfk=;
 b=F6O4Nf3T30KPeyf84cCNdElGuq6yW4JJZ/gHA7WQvr41W16om7eoMilc6SidwKKXh6
 YdyOgtfo1rDFV05WbRcjFtReyJ/brZy8KaPqMbwlETJU9Ll1UA6awtcTehuIXXlgpfoe
 3VG+XJlcIn61PQPd1YQzoyoGrjNBD5T95Sfe/FmnlOoJ5lQuFeSPAoBCFepf5RFM84o3
 uzyW+sMMzvJceuwYXgEZd4vcpA7yso2kWb7FNQz5b/MhQifnVGePHtDQ4Gl0upLdYzxw
 V4yeQIEnZ2zAnG5QBOFqDJa8S7WpKsy4uXZJxXH92IcF9EWRA/iEEMdZBoLCgJpO+gWU
 XWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775710000; x=1776314800;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tN4iP+/W7f9tl7+doV9oPQItuL5wrUcZi3o14We7Hfk=;
 b=sUly6L6/M4DSDGkV8keXNFjSgXJKRgV2bix79Pwb08SMkygDly+whJTVZtOdO/MlHq
 me/2PyJNMVeNX6u3bFYps3ThOpD3IP7rZr//4o9nvVEbc9pW9ky/luKfj+ZUwQHTkk/A
 gNWX4XOmpoa77W8i+0rQ/kjNirXF8m/612KNmzPBSFJT7fpoDfO78BWuHPUGi/7RZyrK
 vNV5Ber5hqySZMj+ExL3SgpuavpTahEIAEPX0WNj06lYqUTRDTwDdsAVZc4eougrjOOZ
 VW2nfdG5INarTNUl/jv2ONvYcdX+JGLfOktKMiAvTzj7YdEAl/3SfpwxdJA+wDSigg1m
 iDSg==
X-Gm-Message-State: AOJu0YzuPR8Ei36mMi6RaIMC09r43RjvmpQGNOyDo0ShfQaS6VJl+2UU
 6b79yjMC68FojIVNHKLYnGLt3k1szic8FDt25x60CBzXwNZgsItvpBmlXbeVRLXWX4U=
X-Gm-Gg: AeBDievIN0wm681dzyoLNy4PFK9lkq8Eq95BCsHx92DC42uLOOnwKi0suqJvJ4NlR+m
 2xt6AZyErEEpqev6BedeDxrLnLYJO+bIWxdoo7vPhLvFlDqC9Bxoujy/UuxckoBgKCSICh0kWXi
 0XGHOnYLuBoIUvIlZR0ZfRuyJXtf9OwOUhdE57XcdrbjNmLpnanjlQRmPYODSD01nDQLAqw7n+B
 sbgZkyvASOMtDeAs7VgueQEn6oGUyPTrwclHXAYq+qjiaOGuGnmxaxsrmVJX3IvVt9CcHtLCY2p
 dCyvqVlEKGLHGk5K9i0qi02gW+lAu7lkB13lwa7aM0G5Ap37D+F6NiT9sKD1kPLKbaQlKMJPBTp
 5ji3AsRgmCPO366xPIcxPz4moLZrLfJmS7cbxObq5VihTgNNozXyA9rKYgYGWTOJbhNDpQsUJ3G
 d+lFLOeB1Rywm8u6TR1FyU9G9ZZh18dPVHpW77QR2LGnREbAFoCupZ6+2TfS1sbKUDXg==
X-Received: by 2002:a05:600c:c083:b0:487:1108:48b8 with SMTP id
 5b1f17b1804b1-488ccf4062fmr18027595e9.2.1775709999638; 
 Wed, 08 Apr 2026 21:46:39 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cfa75ae2sm39769365e9.14.2026.04.08.21.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 21:46:38 -0700 (PDT)
Message-ID: <2e703787-96cf-4b0f-827a-81c677a9455c@linaro.org>
Date: Thu, 9 Apr 2026 06:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] target/arm: Only define aarch64_untagged_addr for
 aarch64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, peter.maydell@linaro.org
References: <20260409035015.132370-1-richard.henderson@linaro.org>
 <20260409035015.132370-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260409035015.132370-3-richard.henderson@linaro.org>
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

On 9/4/26 05:50, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

