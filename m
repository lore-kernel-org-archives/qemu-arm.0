Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E778C5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 19:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwm4E-0001G3-KU; Wed, 19 Aug 2026 15:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm4D-0001Es-I8
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:35:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm4B-0006wI-Rz
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:35:17 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-cbeea240819so721418a12.1
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787168114; x=1787772914; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=R1rBa5G6y5eAfAAfM30m2ITPPk3iRUJCuc0GXAYN2lk=;
 b=Vq1OGOlAu9LUCyGYTuXI8Xlfk0cjQflGRCl8WiugWNsDoki4JlejluhfUpsY1+8fmi
 7xhqP2v3DqXCg4UZRo47Iq0Aj6+8bUYvSdpzK9MayUggP/Ua2NtYdD1sbYgupBMV1zMm
 EmPad11qKgZV83BUHziwjisHPcyRFawwFXXSqOf+Z8IqQ49DkAZ/wap83IU6Rbu+0vtG
 oEl5ozhFgBSszOgoug6zsC7GgqM/sa7QFetJY7dEmBGkmFgXQBH/pyeRZKrZFSBV0WWJ
 BGplEc4vhNMn9L6bwQTlBeyXfsHhrMUR8taZ0rFpI5GLLciQ59tIpx6/bPrOVXMgRMOg
 yKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787168114; x=1787772914;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R1rBa5G6y5eAfAAfM30m2ITPPk3iRUJCuc0GXAYN2lk=;
 b=Za1f8+MihtpHBpSg3gn/bEjG+l08jnwfQaWJ1Uyjf3T03PwS2CMvUGi0uuP6Mdth2r
 T/Ep4s9n2nvYNHA8/Sl34a7Lpjc3+Hw+9aMNHscAqhA+flYNVNEvjN1xuBOQpgWZIZ/O
 WVjQk2FScv7WjxCABNwgqrN90CwCwzISBxCUHEM0GZoiBWJkWV9MQBety7I/6n42QcbT
 0Prus9HjnBl/LUMc1Fw7ZGFqtvA9kupDB+zI8isAWOXIMx36aZN2jsSg6MW1en6M8pVM
 e3OxkQZDFaeE97pfSkZudM+wVHQ9lBiF0gu3IcyXA5w+N5fc6bDgjidQ1Et0YtCHpwpj
 ZiNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPqBQYYV5uaButftfvE68qpjHehZfyUhvl6Shy2vFpVdpdGeZkZkGJo0pa8znJ6i+IKfT5MJGvKg==@nongnu.org
X-Gm-Message-State: AOJu0YwNtK+K1T7X/na89d+KZSasrARuDKS2FNd9z+J48pVM4LGFL2tl
 I4PFEI2O0i4KlDWC4Yol4/G+C1dVGHI1t5yWd1NzvUTWPIy/VhBf3npayXjhA7Qk19k=
X-Gm-Gg: AR+sD13VZAIdmONIG/OBs7tXZ7rY9tGkkiIIXaJcIZCmIOnu/G+hB6omxmDpyQWX6yy
 qGK5z/yboZd5w9McoXFOP5qKZBvrnJYHiAcl09nmevvfH/TPl2mK0F1cx3enSufVtXw3p4Ry7gN
 AWBcXiGrDYNcYHXNYqOxq6jFydf/k/QhomWFQmBxfHt801F1XwUTzNDALetJzyDFT51mF1C4ebq
 sM3KVlYC4OPXt0DRN2nxse4FoEzSYUittD+MgCMJRdDvzpd2NS01tydNEcPOGjyO4NIekaWh/W2
 iST7Z8mc8MHeyc2RcGpAmt+K9E5NLC9wOIKggKOTO8uPjJ3jfQQQEI9VG+GI+cBFbgXOrXLKOuW
 nLiTK/Q1z2c5TY3h9P67qkHfno4rGZk8JaJoaHJDpi/4XqpeIKHlkSfHGXACvqDri+XRFkuRzVh
 lOzJrRe+Y61cdjL6uixRSVOtG0P3VlaccKNEX30kPTphV8jjJkCy5GIytIgW3TvYcZ0Es75eZQc
 dj3INEW
X-Received: by 2002:a05:6a21:748e:b0:3c3:f371:1ea9 with SMTP id
 adf61e73a8af0-3cd011f30b6mr14773923637.10.1787168114010; 
 Wed, 19 Aug 2026 12:35:14 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc15523411asm973861a12.7.2026.08.19.12.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 12:35:13 -0700 (PDT)
Message-ID: <314140ea-222e-4b96-aa72-7393c41bd130@linaro.org>
Date: Wed, 19 Aug 2026 12:35:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/arm: Remove the 'musicpal' machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260819185430.3467629-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 8/19/26 11:54, Peter Maydell wrote:
> The 'musicpal' machine emulates the Freecom MusicPal, which was an
> "internet radio" released in the mid-2000s.  The stock system used a
> 2.6.16 Linux kernel, but as far as I'm aware, support for the
> hardware was never upstreamed to the mainline kernel.
> 
> There are a number of reasons for deprecating this board:
>   * The hardware is now solidly obsolete
>   * It was never supported in mainline Linux
>   * The SoC is a Marvell one with no public datasheet
>   * The only QEMU changes to it have been the usual tree wide
>     updates and refactoring work
>   * The only bug report we've ever had about it has been one of
>     the usual "bug found by static analysis" kind
> 
> But in fact we can just drop it immediately, because in commit
> 59754f85ed35 ("target/arm: Do memory type alignment check when
> translation disabled") in 2024 we broke the boot of the standard
> firmware image for this board.  (The image's u-boot does a LDRH to an
> unaligned address, which is UNPREDICTABLE; we used to let it through,
> but that commit makes it take a Data Abort, so the image crashes
> before it boots the kernel.) Since nobody complained, we can deduce
> that nobody's actually using this machine.
> 
> Remove the machine proper, and note this in the docs.  Devices used
> only by this board will be removed in subsequent commits.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   10 -
>   configs/devices/arm-softmmu/default.mak |    1 -
>   docs/about/removed-features.rst         |   10 +
>   docs/system/arm/musicpal.rst            |   19 -
>   docs/system/target-arm.rst              |    1 -
>   hw/arm/Kconfig                          |   12 -
>   hw/arm/meson.build                      |    1 -
>   hw/arm/musicpal.c                       | 1388 -----------------------
>   8 files changed, 10 insertions(+), 1432 deletions(-)
>   delete mode 100644 docs/system/arm/musicpal.rst
>   delete mode 100644 hw/arm/musicpal.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

