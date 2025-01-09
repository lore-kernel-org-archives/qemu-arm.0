Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1346617dlb;
        Thu, 9 Jan 2025 03:58:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVh/Rb1dtpox5ueX17QATHIL48BQIAonh7fyiQPhCMCkcfQw8ojcbjVFEFuDGz1hqGTgAt1pnljSLcJXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCaS1ITncrLZZvdWbJEUJ10i2ZswLMjg/7M6KMlscL6yTpaj0VTwI2C/Rgh7oLEBOa22gF
X-Received: by 2002:a05:620a:2b91:b0:7b6:66d0:5ac2 with SMTP id af79cd13be357-7bcd97d6498mr1039139985a.54.1736423887757;
        Thu, 09 Jan 2025 03:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736423887; cv=none;
        d=google.com; s=arc-20240605;
        b=iqH9z3xsXx+Lra1a50duZfGct3Hbco90zpF5BI+cL37+SlYL8uuEjYbAMS9w8HdIH8
         IyT0+5xWKz3piNEpf1Qqobm1YJzNVmqqXnvavD2Fw3TvpfFaCwQY5cZecKJ5qD7rQF1m
         Nn83xcAnutqebguhYZTbBBh2FPy3H0ibgMmODXctMZf/NNLeRsbf69PAQZuohej0O+38
         /9SViBMwqDXul6yOSmrDhidMwqxjNYM1kUa67V/GjQLMlyY2JwadVnRDBwTMDyXUY3p2
         /klL9C/JP3K0YwQPlDMM9ZPf/1eRgB8yGz8dylC2s/tXotHqsl2FwYzsDKTCKrDmA03R
         jGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZJlxzpSG0e4bXoynPmdtY5JzroW7mpGQlyBaz29mtAQ=;
        fh=nKNDrkI17d7uGuQoCd6Qv+7xU62EGxwz0rEh71Fgb8Q=;
        b=ORkt3BctJOSkPC1i288rKqC9Na6+mxaOaepzQJC+DyAAqYFCuIxnbgpyAjVc1i86/6
         +YcbfhhiqrQDYOamJZ0qoiSJD3XolBZIzTtI0uhXZe/WDlMBirVvZwalzdRx+qgK7IQh
         ivnX98pNDnKw155lx1Xg4MQrhHiebyfjTp0LnoJmjZM6pV5gKB+G0R6mqawlh7GxHNCQ
         O8nTfIbR4ZrTRaksNsXpcUr705NmQKEWKw1ZT94LqaTU4bF+RyYb4RyiNM5SylsLDDGE
         Q3bnfFtNUI4W5fOiLLNSgDGxs9XaUSHNekPUejT5NWT828HRjSPfk27qgpgNFeKbbPO3
         zPUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CM4GXiBa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd5d40si476007401cf.515.2025.01.09.03.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 03:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CM4GXiBa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVrAR-0001vr-L1; Thu, 09 Jan 2025 06:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrAQ-0001tc-Hn
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:57:38 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrAO-0002fV-S1
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:57:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso9254675e9.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 03:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736423855; x=1737028655; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJlxzpSG0e4bXoynPmdtY5JzroW7mpGQlyBaz29mtAQ=;
 b=CM4GXiBarq7scRAXj/m2Q/4oz/B8Hc5G5kABAH7r/BXB+fF2/YYZN/Mi5mQjkzsY40
 7+I3+bS1UPsBNEv15Rb+CCsRqrF1C2XXu7N8YvcbJQIHI0+1rL/M8eIi7g62q8ScCVcw
 x9pWanO8ZeGTkrG5gsNtW1hFBMKD37v+g+bgi4itfufcbpkrEvhoHTwF2q6d34QdnLLT
 bZHGeJKCIzLy7wWNLDIEpE2pTdNfF5dpwS2joDwJonc0oVKci1AF8BaSA2VDLBEjnQxQ
 +Y/OUwKgysZ/RfgorUwvdnJKXMetACcAFUUEApykxLthcA8MR8FrFGld3NJNMnJZby9D
 unZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736423855; x=1737028655;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJlxzpSG0e4bXoynPmdtY5JzroW7mpGQlyBaz29mtAQ=;
 b=k3Wy90hBlDsrLDmhgtWGR+UVu1JOfA44LC+6FIO/Ao2A3SPhC4nHdDQji+WC4WilJv
 9lGwIp440khWqyJXUAThFxSSihTvuaMvxe6jxz5/Dpu4IrQWPARRDveY5c8kIcFiBD4y
 APIYYm75UU+QBNDODgzPrY2YBTN30Dmi1QZjC0U/e44h+ecSESoEWEuAswUVKYqmAYhA
 AEAB8Z7fgW361pI9rIRsGELNYDT7NR1ZbcvsoUWkDRfEZUoD791IQgJgUY9GJDA3ZbRP
 9f7WGh2tQkOWD8q7X5r7dxCGQOC9shm3ofUrI0a/ESoAd0pz5R9vrMM9nhW8scUko84A
 y6KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7lmHgw4wi01pWaKaHnmwTVnX6KE5SqHcdXQt1VTzVtPA9bcXaoVW8ygtoY3ytmWYnbm24ENK/jg==@nongnu.org
X-Gm-Message-State: AOJu0YxMoTF5dKKdhCDOVrLryDhRVc+fo80YRYrw2Piue1VIX70qrqb/
 3UBfUKERVI+Uw4Z+idenbSOnKyNy7v52jlzNgN32XNlyKE33BV11SoLtA6ngkj4=
X-Gm-Gg: ASbGncurWVJGvCUlgW6f5HNW4rkxFSEOm1sfjNQfaiAkJ/TWV8v1IIHjTTWM5PmLiJI
 738f5qJB2fCIsZhDOEscefCAbQ6ZK4/D73Q17h7mscN0phY79xHc6KgseDZGwm35ZeldVBxJS9N
 RQzlbhzL6Ys58Thedp7hny9/tWOfqbQ/C7pzOcJqT1yQK5v1E+iml9qu7X27Ai0ER0HM0lWxiXC
 PpXGaVKkjNWJ7Nb/8F3LYPYXztVGTIDSaGHYqfNJB88GS10m4VoYkwk5uDWQBCRkuyEaxnA9+Rx
 NEbP4C9KIP0AsroZKjDG3OVM
X-Received: by 2002:a7b:c5ca:0:b0:436:e3e6:b725 with SMTP id
 5b1f17b1804b1-436e3e6b799mr48368215e9.6.1736423855317; 
 Thu, 09 Jan 2025 03:57:35 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2c27008sm53506825e9.0.2025.01.09.03.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:57:34 -0800 (PST)
Message-ID: <920a78ba-08fa-4a0e-a72e-4ca210181a13@linaro.org>
Date: Thu, 9 Jan 2025 12:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] hw/gpio/imx_gpio: Turn DPRINTF() into trace events
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-15-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-15-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zpp7x9Uq5wlN

On 8/1/25 10:25, Bernhard Beschow wrote:
> While at it add a trace event for input GPIO events.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/gpio/imx_gpio.c   | 16 +++++-----------
>   hw/gpio/trace-events |  5 +++++
>   2 files changed, 10 insertions(+), 11 deletions(-)


> @@ -210,8 +205,7 @@ static void imx_gpio_write(void *opaque, hwaddr offset, uint64_t value,
>   {
>       IMXGPIOState *s = IMX_GPIO(opaque);
>   
> -    DPRINTF("(%s, value = 0x%" PRIx32 ")\n", imx_gpio_reg_name(offset),
> -            (uint32_t)value);
> +    trace_imx_gpio_write(s->iomem.addr, imx_gpio_reg_name(offset), value);

Similar comment from patch 12 (iomem.addr -> qom_path?), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
