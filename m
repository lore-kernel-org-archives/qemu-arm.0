Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1479419ejg;
        Sat, 20 Jan 2024 03:20:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfUneNQUmJIo4/7NF8SGXBTm6Bfu7c2jkEe52SWZu2EEFhH/oU+rDevJI/SoCtP+WOnb0L
X-Received: by 2002:a05:620a:1d88:b0:783:48dd:3203 with SMTP id pj8-20020a05620a1d8800b0078348dd3203mr1249597qkn.60.1705749609880;
        Sat, 20 Jan 2024 03:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705749609; cv=none;
        d=google.com; s=arc-20160816;
        b=HV0UkA03CQe7Ed63ETT29OEbm5uOvQ+xu9DnmM8Q/2yERVaSdzPXhpVqt2D7AeuLpY
         4znJBl/maMyd68hITSR4G0qDza4UhXPiS7XAbRfUMESSb/OB3GVJfRH9HOQpsDcLKtAQ
         p4gEx9mJzbzUflN8bdWDUWnAn2NzL7jmuyWVFDY5JNZRrzip5VVaqjpShBmIwtlKOJ4H
         nRv1IA2F0v8Zcy2s87cUJdkRI7eNG3wZnozsCrySiZIAwPIRprrwGoVvV3zt13L4yRWL
         HYhdGGPIV3g2lwjdDASAIpNumlxfTATN+DRoY/5QCU5yeja1SV7fBS/MFP/LlobLDCjY
         EZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8XxT+zWpinE2KG9kFzoXNAjkwKzRav0ogGN/bs3kOtA=;
        fh=BurF6EyRgF01Cs1lTtcuVmdoaQnthrE/2sqE8MX/CGI=;
        b=mm6OwQW04iKEzWJ3xLf3BueQuI8MMGA3cTjuAAXnv6h8SteVzus15AsDyvtbjjZAT6
         d5QecAu06ucfaTEiSoQS1JMMMyTV21Rzpipu6XCIavsyterN1hwmg6z3d0HoeHObs5Ue
         O594b87iPEV2KiT+uYo9zi0CcmjnK5ByAezor6MeD+RNNGtNt0PvgmetN1xaeNx6GOZq
         xnb6CYLuqryEMXp4n2EvQkff1lwDb1WhfUQZmcjzmpIvJHVJl+fZt8KNxE96xE2UBLdh
         2dmHx620t1z4d9X7pBZyC69e7mzME9g835Za1BZZY8w7Zi8yIfSP0oSDFn0TNp6lwfGn
         ACDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0acavYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a05620a005000b00781ec4623fbsi1238974qkt.401.2024.01.20.03.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jan 2024 03:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0acavYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rR9O9-0001Ia-7x; Sat, 20 Jan 2024 06:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rR9O7-0001Hp-5P
 for qemu-arm@nongnu.org; Sat, 20 Jan 2024 06:19:47 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rR9O5-0002UM-M5
 for qemu-arm@nongnu.org; Sat, 20 Jan 2024 06:19:46 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e80046264so19831255e9.0
 for <qemu-arm@nongnu.org>; Sat, 20 Jan 2024 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705749583; x=1706354383; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8XxT+zWpinE2KG9kFzoXNAjkwKzRav0ogGN/bs3kOtA=;
 b=L0acavYvbc48RprLlhncwl0jmH+79zoiwxJyCD31tyyv4P31zKsOS/+kdsDwau/+fu
 J7t5soP/EnTp4TY0PYlDzaU+aHRdJJ/CQhXqFFAxcyFiUzlPHjb7cZHDJNdwphfgNLbG
 4jE+ViS2TaIYYTMtnworIazxL++hJL6bggSTZ9h6eC6bw4o9ZEQhQiT07/LhmnOMEe1o
 FtVRdAfOw5EDRU6+IW5DIf/UbTzqEWlRpJ3a0/MrIzGol8TQQGhPXICGY/fHCZUtuD7D
 xxLAa8MFj69kKKT9MFXpLmipT9z99CIrDeEV07izNvZ1O4F/H8ZmZA346XYE10JtKEMU
 yVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705749583; x=1706354383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8XxT+zWpinE2KG9kFzoXNAjkwKzRav0ogGN/bs3kOtA=;
 b=R6k/6559Bz6fD05k1C5MUzgB3kmLX8/4v5Dbf90xqWMTvOe1gRgTxG8fxoDvs29Q9B
 0Iq/vG9BQpuH9hwDUzeoHBug02WqnuvQLQe1VJrwvh1SqQu80ouP6QjERVn/ovdytztQ
 0ret2YAv0VmziB3yi7uRo01a9eMieOts48iGyipRaLGnPT7i+1OdKY4+0AFIwL+63Pkz
 aciAYHlemvEG0QLMc5GTw3TFfsHFbaPRnb5FgVCIgGqdeEZiVMzqb+F5XHBJ6pmAttEW
 gGBaaLBF/ec+n54PEWI9Y+YTbFtoMKsHVsbzphBF71alwn9zMlAI0/v+tlEVwL0mZ+Nw
 Rdcw==
X-Gm-Message-State: AOJu0Yw+t+L4RYdc0xmZhSvsemlwNd3gF/nxJ96QvRv+N3MA74Ah2C6b
 gRF547mUfk+7uoimoIn4GIAHMEYbdajmqG0Y8JgEBnmGdKzWeI8+TIYXgI5HkOY=
X-Received: by 2002:a05:600c:a43:b0:40e:62aa:fa7b with SMTP id
 c3-20020a05600c0a4300b0040e62aafa7bmr718082wmq.111.1705749582784; 
 Sat, 20 Jan 2024 03:19:42 -0800 (PST)
Received: from [192.168.1.67] (91-163-26-170.subs.proxad.net. [91.163.26.170])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b0040e4ca7fcb4sm32238107wms.37.2024.01.20.03.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jan 2024 03:19:42 -0800 (PST)
Message-ID: <2ce78985-6262-4d9e-9079-24947e62ed85@linaro.org>
Date: Sat, 20 Jan 2024 12:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsl-imx6ul: Add various missing unimplemented devices
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
References: <20240120005356.2599547-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240120005356.2599547-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UAni1E94rl6a

On 20/1/24 01:53, Guenter Roeck wrote:
> Add MMDC, OCOTP, SQPI, CAAM, and USBMISC as unimplemented devices.
> 
> This allows operating systems such as Linux to run emulations such as
> mcimx6ul-evk.
> 
> Before commit 0cd4926b85 ("Refactor i.MX6UL processor code"), the affected
> memory ranges were covered by the unimplemented DAP device. The commit
> reduced the DAP address range from 0x100000 to 4kB, and the emulation
> thus no longer covered the various unimplemented devices in the affected
> address range.
> 
> Fixes: 0cd4926b85 ("Refactor i.MX6UL processor code")
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> This patch is necessary to boot mcimx6ul-evk with Linux v6.7.
> 
> My apologies for the noise if a similar patch has already been submitted
> and I missed it.
> 
>   hw/arm/fsl-imx6ul.c         | 30 ++++++++++++++++++++++++++++++
>   include/hw/arm/fsl-imx6ul.h |  2 ++
>   2 files changed, 32 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

