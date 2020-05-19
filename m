Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4428398lfb;
        Tue, 19 May 2020 14:44:13 -0700 (PDT)
X-Received: by 2002:a63:e804:: with SMTP id s4mr1165557pgh.260.1589924653510;
        Tue, 19 May 2020 14:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589924653; cv=none;
        d=google.com; s=arc-20160816;
        b=oE+CmRl8Gf5QDWAdVZ9WPrP0JEzqOmHI3wNpauFNYs286uQgQTuM5Q5QTRZBYG5b20
         iFBMbaTsOEXjFZ5IDsFeBUR4syfQh806J40D+jKl0Ysz00konKnJnWXi5m+osa4kp1w+
         IQbQ23uiinXIySleBGRDYEN/is0H+dSBQURgHdzXaZihErYVQAcGyT4dE15SjkzZK5X4
         /h35TfqVePggf694DXUhkp+fTIj4Gh/ZFQZeJU81HqKCQsbVmUX0B/Mr/MtI+hG0zJM6
         +oHd7iLoMfDV4DomCGKebIY0sgev4rHtsWJd6c3DcSR99XbdAc6C0O3F7VPZxVHHC9vU
         eUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9QcMFgsFvzqpgsVcZKpwWLbbm/tGcQLwiZS5izOUzYE=;
        b=qmaEbRHq7PNaGmXXQ/GGGqNawNn/9X7UDURKlKmoU5qEmXFSu7jcmyTYYAXnaVwTxh
         EB7yQvUQEmI6G3vZ9MQiV7cU9t49lVK18rHFaoYkoJxStzwuYOZRBhqo9sIhxHYmzZE0
         Or6q5OM8L6FOEFzwG7aP/X1qGPOmDmLiuXg49/rRuPCrLw0k9hp8BRmPb7pgCad+B+kr
         DyN5oUCo6wN7dN6Ory+JdNlmDjGVsUhrFDJq1F7WQrFDMNFZL1BHJb+w645ZIM5XUuCJ
         iCpPc2+cVk9jRfYvmu0laXYq9S+UIWj+mavSfppbjZPZ2GQrLnE0S70bJwQbswdfACBR
         bsPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vd9MBlZt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s11sor821631pfd.55.2020.05.19.14.44.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 May 2020 14:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vd9MBlZt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9QcMFgsFvzqpgsVcZKpwWLbbm/tGcQLwiZS5izOUzYE=;
        b=vd9MBlZtV+8wTXdpyza/bAuEjRjZYzHCAB8h81RBR/znISaOjbHq4Bh7dQBkBcl8H8
         LtWYqnj3+U2OBkvWxECfrIzcpergK7GFxDlqNDRghvJesCwi/Jl3Ji8CP7VgYvuQaeyY
         AaKbkCGSQRbjktlZU/KExpExN4J3wrBZIBZ68WhhJ+oZHiNomMmjewRZPDSjZJJO+kCH
         zmFaDwyb4yn3ZYGQMit8nC/pO2ncvP97ZtGFdNoof8p5jrmKyGmBVtGHZVYqF3ekm9EJ
         Youi9H6HnO5RK9icMjuXJ8pQJTUkxNaBCYkJLphFSEKHc4P7XNPrZHtDGwvMth5gUKvT
         UKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9QcMFgsFvzqpgsVcZKpwWLbbm/tGcQLwiZS5izOUzYE=;
        b=c7LbifN5koMN4JaB0JeGM9hvves3hsRitIjre08Nr35m5r1mjOTiBwqXwS7bo/BtZy
         VBl8XxkAiZN5N4lCJwZfHLk55VYokomBgoixMRxgqVdBExVqrejbb27+cp6huNTKxNKV
         QWg24NyYrJGNwhUHuDSnczuhX9IX0qDYyqNUwn0aOaw6ndUZ6qzk9o05MjgOrVhkuZwe
         wT2EVRTzXRO8louh1ZdAMjvrlKwatBTxgDV2peNlaCa7poJuSMWz02kcUqaqQLPbptc4
         3prkMexi3UPeowOmTKLvhQBeVCvEyCUdRr2aDuH4F7mGEvU4BZRUISfJpsA9oG4G40DO
         9CpA==
X-Gm-Message-State: AOAM533Q05VOLGrYBYp+Hv2N4fJxX2qF8AGHEuatoV7xtzQGnbOv9XYp
	ipABqCYPfh4D+FByJeIdZmp1dbay
X-Google-Smtp-Source: ABdhPJxMz3+ZBlNd7xQLhdXPca2Mk3IOo3Ssmjn+oEFlna4w+C+N6H/Qi078VtaJAl/Mn2IE8U9k2w==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr1080448pgk.321.1589924652927;
        Tue, 19 May 2020 14:44:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id l192sm355847pfd.169.2020.05.19.14.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 14:44:12 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
Date: Tue, 19 May 2020 14:44:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: q7p00L3XlNan

On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,5 @@
>  
> +# default is 'n'
>  config SEMIHOSTING
> -       bool
> +    bool
> +    depends on TCG
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..3224cac4ad
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

Do you really have to duplicate the TCG condition?


r~
