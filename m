Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp254531ejb;
        Wed, 5 Apr 2023 03:03:36 -0700 (PDT)
X-Received: by 2002:adf:fec4:0:b0:2e5:1195:a3d4 with SMTP id q4-20020adffec4000000b002e51195a3d4mr3711394wrs.33.1680689016382;
        Wed, 05 Apr 2023 03:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680689016; cv=none;
        d=google.com; s=arc-20160816;
        b=FgUOt+eNfIeMy+p/YPxt8sfUD+DsFzKqG2j4Q5yfubvVowtxXsH+VYqEgEIkgRrYdm
         wacXNZRgySA1jI5Bp3NG7K3XubilCrI8co4/5LCBrw0dwJyaPQ+dLkav9DhEWbE8KYDy
         xFrnG1tloRAX39MZwG/cdXavWwncdECtvg5/2jjnsREaGR/5oYY200dVYoZfDLHHhIiS
         bNvw9qcw911HgmtbIOeO7AwghA3TecQf4cjA4HrlTxTooq7F/LxZaitXCLNLEWIRtTg6
         K8lmi/iB1kjGy+XIe2DcKAjiIYNYxR42RVIKjGMLeytqyZdygfPUVfVjEjLzmlWdhQXA
         AevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qPGiYsKsF9XBHpZHSaehfUjdHj55ArKkkl5Mh728FTk=;
        b=znwx7fFQzJO+9IQ1V6SL5vdKqMFeKVqor0eQn4Vvku1C+A8gQXg2sIJ4KmQcY2tbmf
         uDnNj29sHh82MMauNWDBcws/YDlWPKHIpwgCx/NySTXAJwr8YNsFExMq8aqacY+faK6N
         UYIZdW7Gey6iyAC4iNZ1U3cXQdIGjw0hKiDjhF/jjgRd2YoKlx0pg8buONBuFKfUypyl
         A5xGzlTLFFUdqkXaqOD1jgRFJy/06ydRrLQxMJxeMDBvMWXe0kUst02kEwXbRJ+E2ZZB
         yn4QOudUWYqmgU5Wc2jdnxHyFgfr3oIGUK1xUBUDbR9e7kokYPVfvs6NL9uLpc018QBo
         hesw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlk5EhXv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m16-20020a5d6a10000000b002e46846be2esor5154802wru.73.2023.04.05.03.03.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 03:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlk5EhXv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPGiYsKsF9XBHpZHSaehfUjdHj55ArKkkl5Mh728FTk=;
        b=qlk5EhXvVzCvvWSUiu3qmdkaf677tpVSe5Qcaq52Cu+aCIEZ5h8H6wmwb0rnz/yOzN
         r9Bdg2B4N/a/TpruwLlEvdWPdGNbqRuM1IVFsX+pD6W+314On/BtbLyui9NjneTzmhKn
         h4RcE/4rt1i7/9SGPst01Mwfy/m2y1yHEjwzemJfDVW2wnsOj+MAsf0mckTzQ+Fbwlpr
         9YyHbtIAZ6+othz0fZxTdBkqUneKS5D+qK6HuY3fw6TTUOjXU4xlf2t+SHitetq3g3Av
         0JEA0fMUcts0WCyy7pHRp2UBevGU1cAe7yzRh0nR75pu3ih4xNE3UfnWstbFZfF5XKEg
         ZXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPGiYsKsF9XBHpZHSaehfUjdHj55ArKkkl5Mh728FTk=;
        b=C3Sj/TtkmvPvzHNijaPJME567NjP3YtLPTNAM70tOoCu6Kiuk+/ZhBjDrYnKnrC3kZ
         o7KWsJQHUiqDGv5VBsrrCYXU9VxB385PRMy76qg8LU2GvmDpVyZt1VjtBhdnOZ67FMXK
         MUtpNIY3ZtvUAsTnarTYNqITJGsMi18SwD78qsU93te940KYpkOHcCblxX+kttT2/JKe
         IUZeGjUO87ZnpgGeLKw5gFnjr849eET50dz6HlI84dSpKAmcHhDrBrHJxzCFGlGv4kih
         3TCyUHC3TK9/xDaOAZONTVJaGmftFBhyb09dmi1eLxIvwzZ7yynJM4ZG5WN0aEzpx2Fk
         rJzQ==
X-Gm-Message-State: AAQBX9ee4rbNb7DZGd+OmFP19556Te8Q6HEkQ/sHuZI2xRzar4yl9X02
	x8500qxmLPASPDwTQ+KIa7f+WuhDc9msFq7rZ/y53Q==
X-Google-Smtp-Source: AKy350aQUBvC2M9NhCRTbZ9/Q3Osr+DnJ9BpAh2NuONzKX985+X7H163FOr+LZ6xo9Jq69rFyP4gQg==
X-Received: by 2002:a5d:4a04:0:b0:2ce:a93d:41a7 with SMTP id m4-20020a5d4a04000000b002cea93d41a7mr3736642wrq.40.1680689016046;
        Wed, 05 Apr 2023 03:03:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d4903000000b002cea8e3bd54sm14650863wrq.53.2023.04.05.03.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 03:03:35 -0700 (PDT)
Message-ID: <51212bc5-cbb7-4d24-f97f-8ad00dda42f2@linaro.org>
Date: Wed, 5 Apr 2023 12:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] target/arm: Check if debug is already initialized
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230405070244.23464-1-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405070244.23464-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: wPIfPd9LGBWs

On 5/4/23 09:02, Akihiko Odaki wrote:
> When virtualizing SMP system, kvm_arm_init_debug() will be called
> multiple times. Check if the debug feature is already initialized when the
> function is called; otherwise it will overwrite pointers to memory
> allocated with the previous call and leak it.
> 
> Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/kvm64.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1197253d12..d2fce5e582 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -32,7 +32,11 @@
>   #include "hw/acpi/ghes.h"
>   #include "hw/arm/virt.h"
>   
> -static bool have_guest_debug;
> +static enum {
> +    GUEST_DEBUG_UNINITED,
> +    GUEST_DEBUG_INITED,
> +    GUEST_DEBUG_UNAVAILABLE,
> +} guest_debug;
>   
>   /*
>    * Although the ARM implementation of hardware assisted debugging
> @@ -84,8 +88,14 @@ GArray *hw_breakpoints, *hw_watchpoints;
>    */
>   static void kvm_arm_init_debug(CPUState *cs)
>   {
> -    have_guest_debug = kvm_check_extension(cs->kvm_state,
> -                                           KVM_CAP_SET_GUEST_DEBUG);

- Maybe we can merge kvm{,64}.c (see commit 82bf7ae84c
   "target/arm: Remove KVM support for 32-bit Arm hosts")

- Could kvm_arm_init_debug() belong to kvm_arch_init()?
   Then this patch / enum is not required.

- Why we keep a reference to the global kvm_state in CPUState is not
   clear to me.
