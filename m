Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3006066ejb;
        Wed, 25 Oct 2023 13:20:59 -0700 (PDT)
X-Received: by 2002:a17:902:e3c1:b0:1c9:d0a0:ee73 with SMTP id r1-20020a170902e3c100b001c9d0a0ee73mr14089163ple.5.1698265259168;
        Wed, 25 Oct 2023 13:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698265259; cv=none;
        d=google.com; s=arc-20160816;
        b=HXJJEg7a6+mC9eD6kZgN7YM9H4HGGL82Hk54irrR+PCS/qoPaZpU3oRlhhQ3P1VyvJ
         A/0JrpW4js7VPkqy06EVqF3McXVncGEvBEhEErsWaB40DD0586pAft0kZhvqLA+Jtryw
         Pq32SklzzisOVTfkxEMCSFiMZtQ/nnQx6WvtqI5bC4E+sRDBz/Vm7ZH9ONqUDctI74Wg
         6ug+Zq2cZ4NcqCb6xRwDqRhVZbFgdMbjBP1NO01DjZgJHiYtLd+LXpaTUEK9Nou/ckvc
         nWZtZswe9O2s/udBz999A3vL5nhHk4LIbLYrVQ4l2WI2aLu7GfBrS3jLZLhVvtf0w0Ge
         s+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0fZqjurnMDCcUXDR86JAfumOWdbL7SoJxoXEMh2PUJ0=;
        fh=SjcdEbKeJK65kALdhN3laqKuoa9CSkrMLQ33Shq4vjM=;
        b=Qm4iS3Mh+GIKUd63VgEBUK0wic8+XElLnXW7jvUMhcsRLHSiO5U5dZJHZc0rGGSqlp
         VtwbX88GXp4C/W/5fXI3aWVKjJDLBioNp+FYzjMuovhKI0coMCc1MDfodtBR1AaU263l
         0okKFOJkdX5UgWB6MKZ71u8FOdkq/muljOsZaGoolb9g5q6FiPlNr88RnOCYxF3kitdR
         Bxqz+TN7HmlABxLPAkejXVINkMzq3xSppyAdBckI77xf5Mbg2d9G2o5JMBYuijKLu9Ql
         AchZh2zFXTsxKHAYA/GiQdg8itaz1+ft9n/Dzrl2Qru6WqV4p5eGPNNkhKLihi4ktlb/
         lq+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3dDNuvf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a11-20020a170902ee8b00b001c4394610e5sor6521559pld.10.2023.10.25.13.20.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Oct 2023 13:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3dDNuvf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698265258; x=1698870058; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fZqjurnMDCcUXDR86JAfumOWdbL7SoJxoXEMh2PUJ0=;
        b=w3dDNuvfteHZKthdvdDR8ovUt3m4YqPcSHuEAj6kwQfLSDZJK7VFP6YeK9/L2/vt9D
         pklrpR5qsvUIQVaS4WnQ6bj0yEHXN3L76WGi+K/5vc7mKprPwSsNWwl8UxPlndfZhsy1
         cI3dpIThNB32g+FDfIZ55JOktPYDBviBL2l7yLZkzw9R7ztO20QOrintfSWew3/EKlGq
         MGhPFlDM3w7jTI9YgE6r/AqQt9ISlc16pZ3shBAhipqAQt0znl5D2PKJ14LxVWb4WtZm
         Q+DO22C2veFZOdZb10tXcj40wMf5hIf/JLqy716dEOv9d6U/w9DU4wXrUmT31WQyS7W1
         pgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265258; x=1698870058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fZqjurnMDCcUXDR86JAfumOWdbL7SoJxoXEMh2PUJ0=;
        b=Es0lqwOmJrZnK6DX8Nx2QFmVqZ5ZcUVXEZrpwPzl6Gtd2AmOUlGEOprIuf4SJs8aks
         Rk58YHoTI1ER8TMp/X6XmLqdBcv9t6MFuHw0D1j1+iTujuj3pQVn71TGtrn2EbBad2ze
         Y16L3dc0zUirivgwMeAOGnBUzdAQErh/QfaUsFjy0jtMIIyl3MKZu3CgSOpfyCc1tnX9
         Vlr/FttwQ/lguCyzvWFWMpaSH8c+q3Qg3kfbDimQLFwoy1j8dsD2tYGRSVrJV1uQF04K
         vE27CMABgxLCZO5FsYIgKCceTKal6TpNYCLpCi3USftVL+2PNpmSa967r+xhKlKbZkCZ
         jC/g==
X-Gm-Message-State: AOJu0Yyrd1e9PwtqBYPK4EZg8kZcmhJnh6R3WjGJ8AxNi/SdhRT6f+os
	lK2AzjICQHTqUMghgTqqXgpKls4m
X-Google-Smtp-Source: AGHT+IFeNUQJ86398LtmQ/LPY8k6H9V95K/zrMAV06eSkqYG3Gb3DVhQorXknxzlJnK/Q9ZCdBqG6A==
X-Received: by 2002:a17:90a:ac02:b0:27d:b3d:5c33 with SMTP id o2-20020a17090aac0200b0027d0b3d5c33mr16397764pjq.28.1698265258537;
        Wed, 25 Oct 2023 13:20:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id 24-20020a17090a19d800b0026b46ad94c9sm320918pjj.24.2023.10.25.13.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 13:20:58 -0700 (PDT)
Message-ID: <cc1b1909-03f6-4104-8e2b-afcf526e6bc0@linaro.org>
Date: Wed, 25 Oct 2023 13:20:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Avoid using 'first_cpu' when first ARM CPU is
 reachable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20231025065909.57344-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231025065909.57344-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X7dNlHZEs/9F

On 10/24/23 23:59, Philippe Mathieu-Daudé wrote:
> Prefer using a well known local first CPU rather than a global one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/bananapi_m2u.c   | 2 +-
>   hw/arm/exynos4_boards.c | 7 ++++---
>   hw/arm/orangepi.c       | 2 +-
>   hw/arm/realview.c       | 2 +-
>   hw/arm/xilinx_zynq.c    | 2 +-
>   5 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
