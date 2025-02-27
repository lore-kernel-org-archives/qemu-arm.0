Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp543197njb;
        Thu, 27 Feb 2025 14:18:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnAHeh4PAvJW0DhiTbE7EaYnr/Bepf4RR6MEhkum7oe2op5hSbgH0hBdGHLXmG1H8fw3p3RECy5mzQPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFW65mU7FGA6BNprqGlKwBbtHYMPMmolFV+atic6fWwIQM5NqpspuV1lG4lb31wLyoD3TVa
X-Received: by 2002:a05:620a:1aa8:b0:7b1:1fdd:d54f with SMTP id af79cd13be357-7c2a76476c5mr709446985a.29.1740694703740;
        Thu, 27 Feb 2025 14:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740694703; cv=none;
        d=google.com; s=arc-20240605;
        b=fIy6TBupUzYtz+LMV060zWGCPJMxPdxLOQPazXPtAORJLnEP92C8VZMRIKnuEe/kPW
         m9xyN8m0kNRYiY9xVfPhvvSxcn4TozvaUh1BG+U9vWZzyPk71y9U0e1jyuBbcsU3Vwnh
         VVqJ/NvCPvYPI+SxlGXZLwtcN4dBWxG2hKrkl1SvSkZyvr4XJ+J91S1BWm1XddeN0gHB
         a4mrwl22/l5VGxoKqtU/47YoyTkXLDjtVU3AL8GLL8nUYaVMqqpPBmNTdtkOhGkzIEEp
         tfSteEFYkKUN6fZE6vR283C0CuemvequzEs8ihtjLOoQ1KUV5VQ92mz2yYG6n8NQ7AhQ
         qgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4sKjcLdkKb9+zhMa6NSpWpTUO9KQKXAqbxieNXe6b8g=;
        fh=ThuiJPgWrnl0jH4YZDKp/KW6Ej4N4WbNn2i6w0qX6fs=;
        b=XWFweKwd3bPvAGHJ/I0CbSd4MxpFDwilzZHLEQ3ewhBy27h6gkVDHsWsTLjBkxF+MM
         1RUAAUMx+UpN61q2uIOVHRJ2rnKlJKqW9/E792jDtPLuDhAiWzzqJG3wDuYRLbOj3UBE
         s+/PP1sjY/YGgSj5HJTdncihy3WaxjQfXWnRjRf58i+HUrDxqESEGvgJmWsq3J25HVPv
         XH/sOdWgHkNRvOlncAisNbV+z5JA8680Q71+QkJp4EMvB8z/qzRSt4+fl3SUgTaYrE2t
         PhqdIekiZzjSvJtWBp58EBx0XxKla8OW5Po6QDBeSIY6yDympw7GX58DTg5Bd8xdiD5T
         Iy0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w247L6dL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749dfe10si200980485a.434.2025.02.27.14.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 14:18:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w247L6dL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnmCj-0001Tz-KL; Thu, 27 Feb 2025 17:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmCb-0001Pm-4Z
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:18:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmCY-0001u7-Ja
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:17:55 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390e702d481so595664f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740694673; x=1741299473; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4sKjcLdkKb9+zhMa6NSpWpTUO9KQKXAqbxieNXe6b8g=;
 b=w247L6dLOepqACZ8llNm0pPAzn1WJHy3fk1er7ju43To02pphh15hkQ9YeYi2UcXsC
 LAJs8tgcot+8db/Rh5y0CkHWxI5P4GsSPzBWwfT5e4tFjLLQtSXeqbCirLvoqw5/Lf4K
 clQ5eYQKjlh3h5rml8gXv6ozaq//7rRLCuArBoI18VQ/2F+Oz5sS0h+ecZcVDrhpxiVp
 sp3UHT8u8Sjh6IOm9U85uEF1n8lDsZw1Ao47BP4RxxV4SRCOrXB94BiADwrDEaYvlKVW
 Q6GVdebO6memMtCAYAWNTieOU4B6b0LCC+5u5pOjdpTxjfxWP1PPBHCDu5w+DrLScJD9
 dHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740694673; x=1741299473;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4sKjcLdkKb9+zhMa6NSpWpTUO9KQKXAqbxieNXe6b8g=;
 b=VyFv+v71GeVMoZ4cP5wVl1YeClEwsq7LZJg3lKv80lEQOBufRnfvYk/hlcPdFrb4nJ
 qitTf4ZrfzxA2Kc3hUkhmSe3cODpee4uNvawBRSeZdyuM5JebTRj50vigSBu61gc+KlC
 Mkt/hQFFtntFzZFl+GBsHLMkyXnI7yBT0T8u+pY0Lddm+fxJKZpbginP9QQMHku04uwF
 QSFzYwwLneFKMTQdAdasKz+dFXj241OykXz7Lky4+/FZhIOqobiwR0rHE3UqSGtYTYBb
 hvS/fzuUhYIkVYqCaN/xTatfYBafZdb8W/zKYfRcM3mbS/c4ggXCs7v2e95JcLVv/+LB
 EAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5zseksy4nY0YX19HBeAZ4fUtj47amKOan+UOM5FjU3ipZBOEZuAkxOusGvQOYjJ5ks+mBJ4oFtg==@nongnu.org
X-Gm-Message-State: AOJu0YwnIkOsmoEvXUmUfJQ+6M9XZl0oUYZhXNsxHHQGIaExjWiEmTls
 cegDZg8COeJ6HGZDLF3/Hog7j6fxWI5DZ8UdNCdf6KZzwFTqhpPZHhcD9IeCFyS4ugSCjkB9MDo
 W51tdxQ==
X-Gm-Gg: ASbGnctEmjkvRkgjSlEhSXZhu243nzo8ksb2bSTGlY2B6alrU0sVNInSIuC/uV7X9n8
 wX49/3C9k3InOCq/vxCwi52QbnJ/DWSmSTefB066IPHmPcmsnxTM2AhsKncLf5+cX8GoT2Rn5qR
 3hRhmu6hfsf8O857VGip/6hBJ3WqTitPsl6Nacur7eJOkzCsJUrG1TwXJuMEAf1ImmidKeHmKuC
 OK/I6DfdkXT/xsazu08mqeN+SEsSAnaVXMObCwBc0LzpLk18k2IPTaLygn0dpmjIA/WBKAa/Gk2
 8AR+MHaWSLJ624/feUEdLIYzjakObPLGVXdNIa1UHJ3Z629GK3ceQEdeALoHoq3K+IyL/w==
X-Received: by 2002:a5d:5985:0:b0:390:eb32:3fc1 with SMTP id
 ffacd0b85a97d-390ec7d1e4bmr764063f8f.27.1740694672717; 
 Thu, 27 Feb 2025 14:17:52 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484489esm3357524f8f.68.2025.02.27.14.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 14:17:52 -0800 (PST)
Message-ID: <b248a5be-d593-48b3-b94d-f1b99c72632b@linaro.org>
Date: Thu, 27 Feb 2025 23:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/arm/omap1: Convert information printfs to
 tracepoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
 <20250227170117.1726895-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227170117.1726895-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BVrCQsBYF43x

On 27/2/25 18:01, Peter Maydell wrote:
> The omap1 code uses raw printf() statements to print information
> about some events; convert these to tracepoints.
> 
> In particular, this will stop the functional test for the sx1
> from printing the not-very-helpful note
>   "omap_clkm_write: clocking scheme set to synchronous scalable"
> to the test's default.log.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c      | 27 ++++++++++++++-------------
>   hw/arm/trace-events |  7 +++++++
>   2 files changed, 21 insertions(+), 13 deletions(-)


> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 7790db780e0..70b137a6cfd 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -1,5 +1,12 @@
>   # See docs/devel/tracing.rst for syntax documentation.
>   
> +# omap1.c
> +omap1_clocking_scheme(const char *scheme) "omap1 CLKM: clocking scheme set to %s"
> +omap1_backlight(int output) "omap1 PWL: backlight now at %d/256"

omap1_pwl_...

> +omap1_buzz(int freq) "omap1 PWT: %dHz buzz on"
> +omap1_silence(void) "omap1 PWT: buzzer silenced"

omap1_pwt_...

> +omap1_led(const char *onoff) "omap1 LPG: LED is %s"

omap1_lpg_led

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

