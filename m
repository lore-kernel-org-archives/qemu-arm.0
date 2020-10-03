Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2331169lfq;
        Sat, 3 Oct 2020 02:43:07 -0700 (PDT)
X-Received: by 2002:aca:b354:: with SMTP id c81mr3365097oif.41.1601718187090;
        Sat, 03 Oct 2020 02:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601718187; cv=none;
        d=google.com; s=arc-20160816;
        b=SxWDjztZSqA4780bCAEdEFJ+fQhvh2EqJUrpDGIXhGwj8cpiWWII2SRuQLhteDMhS7
         NYZ2ulHMQPC5q33Afy5DN/JMGq3dJYLO9cZiMS0/I4Qbly5+evpefePiwhA2vT2nzfjc
         uoEfSoRaLhd7lMzkHfj7ly7yQ3zmpbdATDlznCQv6Ld7Id19AAvIPGSF4cZcTJKK0BBh
         uaFEu7VjdyU2nlX1AM/YwF+15hBfzdTi03YzM3MVbfZc6+GnPEDksBxH9G+tYrnXXw8F
         tyEzobdv3MRptpT03i6CqiOyxZNdf7GAqNiokUCKVASE2slkeGhryw7F4sBfInVgALhz
         nKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=3qxl6W6Hb5YLbw/EY9qvXKmVt4aFa32zNvMsgWDEaIs=;
        b=izUCJgj3K/eamK+CfBPsAI15HvhqW9GrtgOuB8ASdrQ2FEN5RXP1SvldnKUeH6dpxA
         nqNMM9fvDztQhBhcSwa+AjltzEYxYwsdMsd2RXhvNOi+dQnvpuy9S6qZlraQ5aB/qrrQ
         kRFB5VO0ARtiAaHHC6oyN5fTOEdOWXkuAR0fhF1rzyaxEk/2PaBALfMMeQTzMEfAALNi
         nygSx0u6bBGZVBs9X9njJbJ6pDvsfV/TXSu9FeXtLCzoupIqZFxplrM1TLd+m7G4gFBI
         EPU8RgCuNSCIxZkH3ozuiTwuS2R0YEdRkd7qbRX23BlaUUjM4cAPL0l75xetK4l/rk8k
         wOsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuhKbrNe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w14sor784856otl.155.2020.10.03.02.43.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuhKbrNe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3qxl6W6Hb5YLbw/EY9qvXKmVt4aFa32zNvMsgWDEaIs=;
        b=SuhKbrNebolkmv1zwZgG2kxF9agEk7c2jEVgSYCLSypk30ZV/r2YEXK7QIrm+r4gtp
         eRBa2cd/gMWSxN1vX8fqaHjZ321eW12DraZF3z6BsG+a21g41NVo41hx5N8HvVF4AL9u
         5btqslJfJtnb9p1R8SKwfTjxvN/Cr1NJSP2JCd7jMyvrZs2AMjJo5Uz5mr5up188/C15
         d5XslaZvfBmwWOpsvW+5lv/FavNKA+kPbFn5BONrnCYQymXsCAU3oWZkATag0TaRO0l7
         zBT5FPnO60q0d+HljcfWs0ZvF+s5kSxDxpfZMX6JzgwFoxdr87MBqtq3n+lgjP5joAzr
         7vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3qxl6W6Hb5YLbw/EY9qvXKmVt4aFa32zNvMsgWDEaIs=;
        b=fkmTcf7eh5q5IM8+kUn0zlW86XLs6WebsEPv17romx5pGhQtXv3MmfA0AR07FFFQI4
         3DM0/eULoM4qz7porPGxsZUEHDE5dYWXD69wBbwuXYPcZ/6rMR+n2/nRxfpDeL8Sw86K
         pVc5W6cD9RGxTOgEWTSDcgYrb3eJ/Ff7zg5CpD47BXb7z/5cyIAuvHnIEMF0QgKXOlPg
         UZ7A/4lZPK+76MkF8RKnbG2OS703ReqkJRooiMdN96vNcXEkbR5KIbW4nEdSnNgYk7xT
         eE1v5klqmvrO4xYbzCN4tuqAS5EVbSPNL9TmEeujv8MHPNE9HSuPE8vaOkyf2dYUywfq
         NZsA==
X-Gm-Message-State: AOAM533jhQFAOiJFNirk4pjIDur9RPy/RF/2c9WDHH5hfMNJA+9OXM16
	ZUE2tEsDABRgWnOKjvJ7ARZxX+I4
X-Google-Smtp-Source: ABdhPJwU72xkcylEdZMYoJ1HBTqlZvVLkH052G+WpZXaCQazKqWtTdpYlIkYrQ7bPjCXeqGbvd/ehg==
X-Received: by 2002:a05:6830:105:: with SMTP id i5mr4739874otp.68.1601718186724;
        Sat, 03 Oct 2020 02:43:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k3sm1181783oof.6.2020.10.03.02.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:43:06 -0700 (PDT)
Subject: Re: [PATCH v4 03/12] target/arm: Select SEMIHOSTING if TCG is
 available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d418adc-60f6-492e-0852-2e52a3c1c5b0@linaro.org>
Date: Sat, 3 Oct 2020 04:43:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ayheTnIkLPJI

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> Add a kconfig entry which not explicitly selected by another
> entry, but which selects SEMIHOSTING if TCG is available.
> 
> This avoids:
> 
>   /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/target_arm_arm-semi.c.o: in function `do_arm_semihosting':
>   target/arm/arm-semi.c:784: undefined reference to `qemu_semihosting_console_outc'
>   target/arm/arm-semi.c:787: undefined reference to `qemu_semihosting_console_outs'
>   /usr/bin/ld: target/arm/arm-semi.c:815: undefined reference to `qemu_semihosting_console_inc'
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 target/arm/Kconfig

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
