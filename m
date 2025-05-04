Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1993110njj;
        Sun, 4 May 2025 09:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRLV9fQfP/KWdFO5I+8Rk5TQZWPL4/QSxWH8ctw3DBd3az1BgdQo1dx9tTsMbcqgL7ec6Mbh/vf5X++w==@linaro.org
X-Received: by 2002:aa7:9316:0:b0:73f:eeb:84bb with SMTP id d2e1a72fcca58-7406f18789emr6298365b3a.19.1746375792181;
        Sun, 04 May 2025 09:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375792; cv=none;
        d=google.com; s=arc-20240605;
        b=PRYLgek0i9GBJWV2h/99ZFQ1MqCmmcXPwXtGFOscq8EnyntGMR+OjqgkeeOKm6wRFU
         6IXy6dPtDG4CEJiTO/t1qjTIS1+ffq7rk8WHS8tBN9au/naR42336I1Xn98R505CgnsO
         VeTFoi3/z92ptQVX+F96pgNJ1FQODWknF8AaGLeVTxrvAOA3Li6uTV3tsM0bcv4qmEsP
         pepjGdFh+R2bi7xFeKsKEOGv0ftwtC8V7t4tDXt3nA0scdfghe/AO0lCUOKc3WE4fOSX
         fxNssHX76bvUTXOnXvzsRuODuvv9+I7s0vpGzyIu1sfw4ZZcc9A4CkueouSEviP+euPd
         1KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BLjUVLdVq38E0HUOI0rLguEylIZdL7Xxs7lg4wT4WD4=;
        fh=/NcwilnFozCzDVetA7mB7MCJfKj/0qMk4WY5nb1eHhE=;
        b=NvCkxX6dkYkxIPl/NzX+9pDZtgQayqOOq6oYBUrlBKDOX/R0H7/42vErRBLKrdSqwJ
         3FpNjmf4X/0Jxsnk3ZyIjmr4du3oph3BPxQLwQFjHCcocPz/ng633e8ivsoH9qGsly/I
         uzF5f2IqU2NQCLs0rI+9cMA3v7T3qH7AREBuKQJOP4hSA36hP9A6f/5VqrayMhO4+cSN
         2gusbqug2GNuWcnVdYXz802876dM+TZ6fe7a2f46XPJQougeQ3BqwMR9jTyQ7r7YxER3
         /ELxQ19YjSUOTTdYZ/FihI515CP6LyI7gVt7Io51uww6lzI51bT2TqPJZdCLJZam/qvB
         WNbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItbVA9hY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9dc959sor5562069b3a.7.2025.05.04.09.23.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItbVA9hY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375792; x=1746980592; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLjUVLdVq38E0HUOI0rLguEylIZdL7Xxs7lg4wT4WD4=;
        b=ItbVA9hYy+xSKM+A8RPLh7UKyd28N7hySVMdG3erprRDblcpNBZCy2TzNTQw83cU5z
         SmM0LWK2un4EsVDgC0zOxCJlqT5xD/uNrvs2FdCyAqHDi9fOSinfpXCrIPjf8unOwv7y
         d7JF9uWtK6cCLwoCYEFubKsE6EvWMQeSCWuTmispjkVANBdrNlivY833KpgKq0EVwg/1
         ZwspB7aWy4hGnhBdCIQ5azPSFf/ItvzZWP34kTgW6yGXe2/N3fBv7Lt/ARPE33gWZ4/H
         W1ToPPAlAClDQSo3JrWOcdPCnRMY+mIZEv+c+V2dY/f1DRiI9fBOhDt03e2jP931Itsi
         lHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375792; x=1746980592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLjUVLdVq38E0HUOI0rLguEylIZdL7Xxs7lg4wT4WD4=;
        b=Kq9DGohL2otF+u4VuKyYPuYnRGJ+RufYYBp8VfCWgRphk9XUm1PaZOhv3r292E2Kfr
         Z0qQ08ftUqA5pocv/MhSulvDva5WhQlsn+1e0O8hK+cPEVZbaDlUvPyUFJS7AfV1AVz7
         NHYweDQDZTi1VqNFsy/JhZ1ZfPD0Q2dYXKF1l1govlKm5ZJ57HWV1UKe8Sfef4pBRQnA
         SzsOyIsnHnrUS3fbTHf94n8Fhcnz/43VxMCpaHHk0PGG2+SP3R6YMwrQrXcYFOTzrAll
         SPQZX3Eakqf9ot1KtdO/u7OkTXqsRz1Cc7vzbOaoDxxn4+xkdOPF6N8D0PP3jU5ONQMW
         fksA==
X-Forwarded-Encrypted: i=1; AJvYcCUbg5Lm7aKAEd1FkAilpNc5fKuEsdaZ94F8B4fMCvKljkj19ZpTSZnZifgyQjyUtJI2TzuuYOjoNq9O/Q==@linaro.org
X-Gm-Message-State: AOJu0YyP7XzUp20Flxg934VnrJkkjXjvuYn59u8rPSI6ZQsm86IvUvGt
	XC4Wtx/u+pbCHuYza+OJlO6xy63y/qpDd0utYYcn32G99w7cizErx1qA+6omgva8Lw==
X-Gm-Gg: ASbGncuzI0oW6vG5joexLEhP1sRnSEk7IZ3T2A8D0sJ98LSp/LXy31giRx5KI0xLYPR
	iXDlMutW9nMEuN73r5ru7SJ7c48ky8oN4P2ShpdECaitMDGnYbecHNwdM+SNeT4W1hhhl4pPAKL
	Z180zucadt5pRdfy9mOfiGlTgrmvfiHY8d85n/883Yx6g2hR75/R1YOMYadBDLkWUHMMLvU8dGh
	hpo9TQD3tRgxQ7sU7Gfmy0WKTEr/5gOmmTH7wraxVAonM8IzVOg9mFmVvcBrs1CBVpzJpPaRaeP
	ZBKY2KxBf32xu2N19YAF8wYhUMuSzBI069p48Y8UQIYE+gco7+k8OSnnA/XqHGv7fpeUPmXVBBG
	u/Qx1pYA=
X-Google-Smtp-Source: AGHT+IGG8iLGeA4CdD0ixdSNcxIntlbOJm3it6GQMfYx68he3yFqHRk29MPYt91OlZ6NQtlxvF0qQw==
X-Received: by 2002:a05:6a20:d48b:b0:1f5:86f2:ba57 with SMTP id adf61e73a8af0-20e978cab74mr6244131637.30.1746375791746;
        Sun, 04 May 2025 09:23:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3e8b9sm3995961a12.47.2025.05.04.09.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:23:11 -0700 (PDT)
Message-ID: <fb79692d-4320-44fc-a555-4c491b172959@linaro.org>
Date: Sun, 4 May 2025 09:23:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 40/40] target/arm/machine: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-41-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-41-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: B09DZpgHVlUL

On 5/3/25 22:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index bb1c09676d5..b404fa54863 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
>   arm_common_system_ss = ss.source_set()
>   arm_system_ss.add(files(
>     'arm-qmp-cmds.c',
> -  'machine.c',
>   ))
>   arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
>   arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> @@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
>     'cortex-regs.c',
>     'debug_helper.c',
>     'helper.c',
> +  'machine.c',
>     'ptw.c',
>     'vfp_fpscr.c',
>   ))

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
