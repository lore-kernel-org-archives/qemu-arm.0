Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2240093njb;
        Mon, 10 Feb 2025 13:56:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZ+oCVzogSR+DGp2KLHn+T7wmbnB7N24QT0zjEmFKvScQR9+Ou0kLjEnMwMObaKOIK1GsdD8ATeDJl4g==@linaro.org
X-Received: by 2002:a5d:47a6:0:b0:38d:d6cc:a6ed with SMTP id ffacd0b85a97d-38dd6ccae98mr7845458f8f.5.1739224607723;
        Mon, 10 Feb 2025 13:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739224607; cv=none;
        d=google.com; s=arc-20240605;
        b=ae2kjr4ItGWPu1UvRD/duTcjyKZZI28ODOCpX/0IOvcupMdmo6uNjw0hftcUHowWjx
         rBx+YVyY6wWgNZWW2uZ44Gb+hPVP5o9TE8JVmdCOU5JEtj8MrUsUceRlwrn4+wSpJZgf
         RnDuJGoMRYxk3fxt+DTAb9fIDgb4ddKecbwjHLVnSn/odUByTR2PP5mmOcuy54FT2mv0
         zo2c2hY9bFESR3hnpQTAXjMaobjJLgwdDBPtoAbBcsb7MjXv+L1b2xU5u5V7yWrcFN9L
         dhtWxikKI1zB9JG8Wb0fVXFMj+L0h45IK+fyGzLurKhUQQBAgL/co6ph0oj1/fG46Otg
         eLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EJQjl73eRofuwRcg21XrKJ694zjYy+X/+JQ/eJoLN+w=;
        fh=I0+RimFZfv/V2Xpo3DwnMWXTFDb1LfsY0czbNrVH+nw=;
        b=VY9dJ7RHvpr/nRNBuMlvoIiz8LpWMDDau8/9VD2y7CsMQXTaLjg3oKnk0gKTw2Xnkf
         llK1nyiLR3FPmNTmmoSonUT/R1l++DksqV+IVf5k7p38mC1bE68j160JPxx46a8DaFPS
         GMdGexmsyd6SV4hIvn7pxArB5y/9CQZfIsU8bBprJohqWG056vD8pCzrgUneVtOd5+0N
         YV7TOipM6RwLLsCiuGoj31Vxn+RyrH+yOnvAnGRShj3YsdwbGRbRTtpYY08kmDg8Rqsv
         WbZw7yFPGwau5JOc93p1jr7NbLE5QLV52R5uIm4wZCAFqZvVsIlOTn/aSIhQGwa8OkmU
         f5Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWgcu104;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4392eec5d4fsor20641245e9.2.2025.02.10.13.56.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 13:56:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWgcu104;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739224607; x=1739829407; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJQjl73eRofuwRcg21XrKJ694zjYy+X/+JQ/eJoLN+w=;
        b=OWgcu104GmzEAgJmUj2Ws1FxgbGWW90aeSMLo41xa7BZ+MN7PsQpYOu5zkbH5wORp/
         mdPxcwCq68pKoTBzH6QaZI7iFJaAPZJMEVIl/Ej50wggOZINMdgiLmL1COgw8drjyqUc
         XgOnTbNAWwpEYMt5Z2JsglX4X6fOYghpFILMVZ91Jtfn7rqnzgXciKQY6jVr2feFdwIu
         YAhCJc05UazQmU6zUwKF63wAQdhZ20rZ+qZdNX7FNVvPn/SE7SCZ6xLamSUadTJYe7aa
         wX7ZTUgoJOX7bR8kNkbl3gnvPiJrvKSmx+bvzNdZCdYd2V6Z+A4psn4DvgvH97i2A7bk
         tXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739224607; x=1739829407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJQjl73eRofuwRcg21XrKJ694zjYy+X/+JQ/eJoLN+w=;
        b=AD2mPUVbxcwwTk/BiznVN+J4DbfaeLWXSKVyTqARPaFMra0UwCU7psF6DK8xsYQiC6
         vzNRO8k7423VknnOIFAFeetl9LfFtXo9vwt9A2sKW4xd+NKKAAIm5BSPSTZ/hWKcvY1R
         AC+LK4+YWG7fUUPwfVwvcSsJya9/TM53rNivpvvhg95GGee6yFRUMxUrdJf+DO5TWw6Y
         S3OY4/BSG75R77UWqkC13iTl2ocHxHjdU7O6M8JGrNaYNQCxxuI6evJ3bKYx/mr6lBOn
         m+ln7AYN7m+p1ca30ay0GfjW/ugsMhJGrKCGIszRKOdxXIJ3xWRiYEw6btSkLa9XzBKV
         GAtA==
X-Forwarded-Encrypted: i=1; AJvYcCWkGjErdfpyLAuiSerP9AZhQ85LBth4PRQD9SBaCvpCPmtfSK7BQBDGVLvT+Y1fdYJoPnKEOMBiYexVpA==@linaro.org
X-Gm-Message-State: AOJu0YxeRSWTY/b6H56hyxENnObt5C5TM8cNDo3HzXF3R1Anhv6ZvHNg
	EwBCJP48TvQbPle3/X/hAKiAHyzuchDatM32Y8Y0PLlJQXkRGs+W2sp4c/Rv6I0DuA==
X-Gm-Gg: ASbGncvIDoT32c0WNPyVvydX7hwS+44XBeZpIFgh43F2Ha34SHpKJl0EAHLWwHPGOXX
	UcwM7QFtEGB7siQtbgC8gIrhvQC/1VD69dvSpOZrai4ead0JUd263z7buW5j0gOZvnugTuTCsUp
	CViWAuNdvHRwXwpjjS7eBjSI9sOJaEEdKEgq/Y3iM5sYRhReE1alVh7NYhYLXOurvTYjn/72KRt
	Y92m1wjivKvK4XEZIWMrxljCAVin572nA6RcgH3Y0/XuwhGxgwhKMhsCd7TMO2H3FUuAyq0KzKE
	0tvu/+1Crk9QdiTvOnO83H7DMDsu4WDRelofZOac6fAdcxYtfrN6tC9jCnGuPfy6
X-Google-Smtp-Source: AGHT+IHbpn1JM7uo1XeA+cEtDXCF3d3VewlIQDG/09fUcPiIIt3lxdXjTZYr6kAI4bi1mx6MS6urZQ==
X-Received: by 2002:a05:6000:1fa2:b0:38d:d43c:31b5 with SMTP id ffacd0b85a97d-38dd43c356amr8162049f8f.38.1739224607172;
        Mon, 10 Feb 2025 13:56:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394679a3a1sm34143905e9.5.2025.02.10.13.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 13:56:46 -0800 (PST)
Message-ID: <7c71885f-6e55-4d36-98ef-8b226c238662@linaro.org>
Date: Mon, 10 Feb 2025 22:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] cpus: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 16hDp0x17K4i

On 22/1/25 10:30, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (10):
>    hw/core/generic-loader: Do not open-code cpu_set_pc()
>    gdbstub: Clarify no more than @gdb_num_core_regs can be accessed
>    cpus: Cache CPUClass early in instance_init() handler
>    cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    accel: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    user: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    disas: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    gdbstub: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    hw/acpi: Prefer cached CpuClass over CPU_GET_CLASS() macro
>    target/arm: Prefer cached CpuClass over CPU_GET_CLASS() macro

Series queued, thanks.
