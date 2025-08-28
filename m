Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F9CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOcp-0005Jw-A1; Sat, 30 Aug 2025 12:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkNU-0006Fc-NR
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:41:52 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkNR-00037w-Kp
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:41:52 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso17868915e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756417307; x=1757022107; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f2LEVdYEHwnqBH/a6hUr+DHF4tWatjySkwL68arjJ3E=;
 b=IuXMwFVWeV8hYKURSWKLocyLhtn3pQcHhsa20nAWD8xKEcfPmRS2HwUx0wQHCJwaCM
 aUnXTNhhK/KdNOC9NXu/I2UP5W3j4bschcnVIyL4R8AtDsgnU34FHdzsqGQrhgfBeHMU
 HdVDl3er3CjQxDzhTsLhQOdoSeKi1p0/FVGyBqZlDMzksdJqIsXxOHVEdMSSCDBDkhYm
 zAuVFX0xiZkusHPAVi+Bt6pEPAZRZly5782R2HWi6F2OQGyqe1H0vd7tZWn3tabPAwFx
 38wiknm47Y+gy/FVe6Y3jV+hvArCFn0p8ws8lXWqj6OJ0OPlsgnD+4ADlwcCZ1wMe6Y+
 i2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756417307; x=1757022107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2LEVdYEHwnqBH/a6hUr+DHF4tWatjySkwL68arjJ3E=;
 b=oB8ABOsrC/x6Ew8xfJVj7FRShzf1ydrxK2caUeX47zm5ltjIw3ow4KgP3dhFY0dfi6
 WUaBcm47AU8Dfqsx3CqctgWG+yHCtnWqq3d0mxO+wIjP8Ei7OTuRGhhCicg//AvbU5Yd
 7uo/ZkTFL6749AjVnAFuZzECAzdEuDbEGQKbO9RLPJxPSrH4ork1sei+wICloZry52e+
 yCgoEMJZkK7H1vAC+MysCb6qPXhoDnkaw0eHkO1zdsuSCUna83Ouhzo56HqP0R8FS5NV
 O0Oc2eLKUS9HrB7jIGECJB7Tlqrys3nPGgtT/UuvS6Pyr8NCEpzTX7C8UBW/7BXNOvZE
 UYew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNPSfLBy9eQRoC6LFgUA+hzj34A0qAhChMh6NwOoiaiWJT72GUO1EtKlnm0UWzsquQCCrJQJds7g==@nongnu.org
X-Gm-Message-State: AOJu0Yxdanso3yhRetI+vhEQbuotgeVW8JiN4t2Iu4XJSXLoKfXDGtV5
 vmGvmt/u+/pg5kZQ0hqniT9uoIjfvlJCci5UXS9UTT2n6rtNzTo8STJpKIZ4wLLW9bI=
X-Gm-Gg: ASbGncu37VS3Q6GqFhsnaktXij3xrDWnG0ZKktDlyXLNt37SqhnBb6auojgokMyDP6s
 YtQB7GOCYOOvd983DF7TJl+pSWHev0nwxqIGkhvhK9vKONgCQr63ip8kRzuGpBpljmaeneJovmy
 TntUvw9KkvdlVZx4kNv+1GTchKfIZutwAw+1Rgwxfweew10Pau8YA2QpfY/PDn2vnE6ZwUX32c8
 vsP4RyO7XQOv5Vqr3SxVAEJYWxdgMs3HrhHZ6NX4m2fSao6Jhib632+nF/hSXltLALObzrWaXZj
 VGHsYj+C33kgf3obC1d8hdjOeYBQVpdLMPBqtCUykl2qK486SZgNchvzGF3ZMu3b44cAEMP9zb1
 Wqcf9n81nuHEVVO/L00NR5MboQEYH21pllf/XSIjruTznImEcam5ecp9Ch4HiOolFypvL67N/E/
 mk
X-Google-Smtp-Source: AGHT+IHSFmdmBQw9ezUYZQz/HZgCxab6wY/SVtXOB98mYOSt/BJh2/fILZ4HQuGPVh/A6OJGERdSfw==
X-Received: by 2002:a05:600c:a49:b0:459:d9d5:7f2b with SMTP id
 5b1f17b1804b1-45b6870dac5mr91678515e9.16.1756417307033; 
 Thu, 28 Aug 2025 14:41:47 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9d37sm745623f8f.49.2025.08.28.14.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:41:46 -0700 (PDT)
Message-ID: <7b4d4f6a-7aad-41be-99f5-a81c7290dfc5@linaro.org>
Date: Thu, 28 Aug 2025 23:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system: drop the -old-param option
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828162700.3308812-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828162700.3308812-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 28/8/25 18:27, Peter Maydell wrote:
> We deprecated the command line option -old-param for the 10.0
> release, which allows us to drop it in 10.2.  This option was used to
> boot Arm targets with a very old boot protocol using the
> 'param_struct' ABI.  We only ever needed this on a handful of board
> types which have all now been removed from QEMU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst       | 13 ------
>   docs/about/removed-features.rst | 12 +++++
>   include/system/system.h         |  1 -
>   hw/arm/boot.c                   | 81 +--------------------------------
>   system/globals.c                |  1 -
>   system/vl.c                     |  4 --
>   qemu-options.hx                 |  7 ---
>   7 files changed, 13 insertions(+), 106 deletions(-)


> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index d7c2113fc3e..b1b3d1b1b3f 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -560,6 +560,18 @@ the options along with the machine models they were intended for.
>   
>   Use ``-run-with user=..`` instead.
>   
> +``-old-param`` option for booting Arm kernels via param_struct (since 10.0)

s/since 10.0/removed in 10.2/

> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``-old-param`` command line option was specific to Arm targets:
> +it was used when directly booting a guest kernel to pass it the
> +command line and other information via the old ``param_struct`` ABI,
> +rather than the newer ATAGS or DTB mechanisms. This option was only
> +ever needed to support ancient kernels on some old board types
> +like the ``akita`` or ``terrier``; it has been deprecated in the
> +kernel since 2001. None of the board types QEMU supports need
> +``param_struct`` support, so this option has been removed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


