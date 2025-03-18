Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3244263njb;
        Tue, 18 Mar 2025 15:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWChbb3JjCzYu/gRle2BGn3x8534a3J5UzpAfNJxeTPeBSgozbdwXbaqSCe5YRXLL+NqTB0+L/9XAGEsQ==@linaro.org
X-Received: by 2002:a05:6a20:2d09:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-1fbeb8967ebmr516892637.12.1742336387953;
        Tue, 18 Mar 2025 15:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742336387; cv=none;
        d=google.com; s=arc-20240605;
        b=Ma/+Q8pou3nAEuZZSZi5EMqlLxaP3Pl6nl2jbx2INJppUsHAKPKkOVpVFqoun47+sd
         7rKv/A3Bh4fpNILgxem54cn3gmiwKiTo69xk+fu5wzzOtte3II/5wnMnEihZY7ukPZug
         w3S4OrziVUsTzT24R/dWrnd2jOS5QncLCXVHaFEzRB1h2pY22KzUCjQcLYVzA9r8/fm5
         dGaNxsFWgrP4N1dVZEwAsQCh3ZGcnGOPu7UK8azHNBprv2ytwODUYDDA11ZrX7pArvV7
         RsYAlSgfGoJtihfW1KSN0cL+Zo1BErUgCCrot3lqBzs73lTiOJHEAJk+65w+Oumgn5tV
         lJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VTGGUtCqvaeyCv5ha1EwY7WPOyRwsuePzUbQ67x00IU=;
        fh=DM4UoJrwszj0iKBbuyCuknN69LkWb7NS8ZN+8Lno3FQ=;
        b=fCGBlxbmUFnuW2OvsxFuyLkAV+ev3qHJV1rIpOEfrIsiWVwJ01waQTiBq9QY+e0pZO
         fvMS5PEd8ikCSezE2BXIGdlG3LfypAN+zm87BKFIcQmBzkb99sJU4w/XqBjfWGnicYrt
         oaAsG3UrHYYF82XgcMwHAU0aNYmoCEt0fhbsTWGIzaOZe08zkiCKN7bnY+h/B4QlwzoB
         C2uG/BCsnh9TH/oSQAetgAk1+NM59arILmHV/C098p2D3HtoNeJ+syIcm9Rofcqj91r1
         gJ3T7yZOOitRWxgE46WgA7gheCI/W9zwxZ/1KmARWQFGz0uXb7ONlv6tB4DWI0moARaP
         IAYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcpUGzLs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7376d526fc8sor210692b3a.5.2025.03.18.15.19.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcpUGzLs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742336387; x=1742941187; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTGGUtCqvaeyCv5ha1EwY7WPOyRwsuePzUbQ67x00IU=;
        b=mcpUGzLsia/bNBGJypjGWl7qK89wmEz3KqkbQY/JVKoYnX41gsWlHAUr7x4QXMA8lh
         yQpe3VPRrX7Nd7zj1Zfu3GxDfDFEJTP8lUX61gt10Cm4QCm7iq1Po/Re4mgqhfBsuB9v
         eQdPf2pzTDnxM5CJk4COT006TxoLx4CpGMQn/QVJIYg46yqbQarfL7dhq5d8Q+B/HSXW
         KcIvaCYWeeIZqwpP0X8aIOj3m+fVE9Y87U7jX+ePAr70cRqVdyZ+Va49zhkxx+vEgqbU
         rh3FrQ/KFZE2LKV8AaOdEuW59DtLX6sgg08+ACDsarSc+J74O62c7Di9TUcUVHt9Smgj
         0ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336387; x=1742941187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTGGUtCqvaeyCv5ha1EwY7WPOyRwsuePzUbQ67x00IU=;
        b=ZgtVrz7+3vKzgF6n2PqbatiYAw1Jziy0iG5hyvth7RDS4gX/DYKjTo0OZvBUQHRSBr
         JT7Dgm8ZqR+5qW7/nioT19XJetMxpEkgQMPYfYGN0apqBUB54axOwImXHhLwuDVEyHom
         NaXoJSAGn/bUaVLa197G1Ex47tsheOBY4liZnyegwSuplVrahopQzP03SmZXqBcyGhIn
         iEtJGMfpLCjv3REKU5rrL5D22Y0bWDbNy+fwc8C7Yla4phW2ewNjSL3+csEaaCv1QaMB
         1q/WBmcUprh/cl3y7xqrYbwwsxMVbNCpkK4AiyuyNZnzHiS0R5S5Hu5Ux+tO0aVRWq3C
         QtBw==
X-Forwarded-Encrypted: i=1; AJvYcCUc4OVIfq0Q7TsdQ31tva+Zop4QIgzhkWSCPh7eYdto5rfhPX/Bq0ZyWzAbIcIVUfI+p08m3rM1vKQkXw==@linaro.org
X-Gm-Message-State: AOJu0YwO/Wd2Y3gTSOFbRVkrAxt27Ggapef8vh93uR5dM5APFE3bXgeU
	lx4F095ycCNtT3Al3bu3XBE81WzDdy5/uRmh0VAqyHR5yI78L/rG5arwUS2GUtJfdQ==
X-Gm-Gg: ASbGncs0KqlgtK7ny0ugWrlqNwuk7g33zmNSQlucPo15kNbZZtLpkoGTOPnqXA1cF7E
	ORU/mSI9E9JhWul1sj94zbr1p2KIk9wsi2ytcqmHwiIlIWm/+u0ksWfbOMkkwI2Zg6Fnlf+v0+O
	YmEB5T/Y1UWrHZpXTEvKNQL1lypthmkVi4/8XGEoKjycAQrqstQfWNmlP474ezCwVqClWdTBvLD
	7O8K9VfCNj+BWiPHi4+UWh3v2W+RBi4IDUARClGUurhjWM9U2Iqj52e2Aqi7H0wNV1dE9phD3pM
	MjgUzx++lL+X/fBXtcLNHlo19zzuuOdN5QCmiDw8wZ0AB5qdLRlSMc9ayoBLVg8s4ZK9Tlkq4eh
	udSRsvmJK
X-Google-Smtp-Source: AGHT+IG3WL2UZjLRcBSxDIrHyiZ799+Zj+pvjdJn5gm7VGBFlAyVOVO0vmRFXWt9lA78bwybkCPvEw==
X-Received: by 2002:a05:6a21:168b:b0:1f5:9cb2:28a2 with SMTP id adf61e73a8af0-1fbebc846e5mr518960637.19.1742336387525;
        Tue, 18 Mar 2025 15:19:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ca494sm8061555a12.5.2025.03.18.15.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:19:47 -0700 (PDT)
Message-ID: <f1ce73a6-717b-4230-95cd-45505fecf039@linaro.org>
Date: Tue, 18 Mar 2025 15:19:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm/cpu: move KVM_HAVE_MCE_INJECTION to
 kvm-all.c file directly
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SblRgcA/e1rx

On 3/17/25 21:51, Pierrick Bouvier wrote:
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f89568bfa39..28de3990699 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -13,6 +13,10 @@
>    *
>    */
>   
> +#ifdef TARGET_AARCH64
> +#define KVM_HAVE_MCE_INJECTION 1
> +#endif
> +
>   #include "qemu/osdep.h"
>   #include <sys/ioctl.h>
>   #include <poll.h>

I think this define should go after all #includes, emphasizing that it only affects this file.

I think the #ifdef should use __aarch64__.  KVM is explicitly only for the host, so 
TARGET_AARCH64 really means the host is also AArch64.

I think you should go ahead and adjust x86_64 either with the same patch or immediately 
afterward.  There are only two users after all.


r~
