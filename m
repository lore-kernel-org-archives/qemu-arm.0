Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3203622njd;
        Tue, 1 Apr 2025 20:31:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHUYq8A8PSnF5BbRuNFUvFMr0WeqPimUcdgXLb3tylfTHp6THI6hGgL7ol/HXRExXAKKzh01Odl61kZg==@linaro.org
X-Received: by 2002:a5d:47c4:0:b0:391:4231:40a with SMTP id ffacd0b85a97d-39c2364ffdemr4210407f8f.33.1743564691064;
        Tue, 01 Apr 2025 20:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743564691; cv=none;
        d=google.com; s=arc-20240605;
        b=UA7YW0auCLyxNV1rkm/iOPY9NjtUtuOd9Q8G9hewRLylWMrqN57eOflZBi1xZANjW+
         +af5ZrLd4n+molIOokXiXVq66dhw3Q577FcbppZ50oACdkMYlaX+0wQc7S01LJ9pU+y5
         FPSYmTR7/Odn1/8iA6hOT8hrtHIX0yzGK7RC2PAmNgneaYGFCoLVRbk/0yxRwXvg8/NW
         2jMQcuHdF0vRKLYS+0J5pKuS9ZwZhBnbpjwKQFguA/oX2kAxDkUEICW2Mwv/bQLH07OQ
         qj0xequUXe8f907ys415Hv8aXfNA2fsDI4TE9WHjHiTgm2CNVjElvAYnxXoViy4QgWux
         Ng0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CujPIjkhOlnkWqCu+Rfx8WsNvtOQeLj1Mtett7H+ZGg=;
        fh=g09zpuuBXMLmcj512qND8LlK7dHgCeiFtraV3r+pP6U=;
        b=DisCcMIzN4rjN6gM/OuACvzIPcJS3o2HdPw5pGcjS1JO3Inq4D616vRP+IATw9tiVz
         QKQaThJ+l5cRcTsqIgLJTtbFMvwCIy2uY5n6L6QWf2h/qxMUdr3zlKzbOFM/xSFnRho7
         P2Td7hcOE70+/nVNZwbB6WC8HMX/Pwh+OiQaUW41WmEqxTTFtObPFUqUFiswiLL/iSj1
         gAgmj8RJqz4CsQvB9yXOL0Zm2YVcnl8D7dqNeSiJ9HqQLXofELlxZkthz+kvY+SGYNGO
         bfzktmH588fBunyOEtKwt/QqSvM9HAOBZAF+Ty8aBj1X6Hco6Urs6WnN/8Hba3xcV0hZ
         Z0QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmoFy7iD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d9742e0fasor39448005e9.4.2025.04.01.20.31.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Apr 2025 20:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmoFy7iD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743564690; x=1744169490; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CujPIjkhOlnkWqCu+Rfx8WsNvtOQeLj1Mtett7H+ZGg=;
        b=QmoFy7iDAxec2wXPHmDdJRF/OBTIvV0jzu1QhQ+L41hwdk6MOwSkpH4+9aluAaay0L
         qYCzlpCXX+6Jr0iTDZmuSpGoACKW2pIy98VLyEkkNU8qVdP1e9UUkWdccv/bGhJJSe/6
         75CylozoVXIbAibms8kue/+JrzeuQCRAjMaGGdD4LQ+q3rOdOB58Cfhg31NgIa2XzqTO
         tDR3GrLKan0qMc8iujitCOKw+dGBAuhmdJco3nloKYMo+2GikvRf0L0VvKF5GbGavSc3
         gaXr4tosgpZ8aX5b5lRbSFtErx5RX1j8uqOOicM4ui1iRum3AEc9Y7zKzXYrSgxQZULR
         pJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564690; x=1744169490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CujPIjkhOlnkWqCu+Rfx8WsNvtOQeLj1Mtett7H+ZGg=;
        b=ZkmbWIjNdaEA8AgLgOb9NSTylb+C2LFzLSiO1HGDCwwmjDq2cmXwRMAIN+R7POKHWu
         LfCYDNi8PPifHbWflyYzPaewBpIlvWHbz84MmbFMb10H/x0IkD0aNnA+rZ5xcoMmvkzH
         vS+uqCHjyoVFDfCXCqeHuOOV0u51UyPaTvHS6ObnAuP2qwegFdWBOnvXC9sHWfulj4MO
         wmCXNN34VOlZPh++dKjKkgSkqI8g3XnjEx3DRIR/YhJW9UWmlQtNsznMvSgcIu1G/NvG
         2bu7DGSNR0/xdRLp3r5NdstaFbZ36M0s0Vi3fG2fyy+Xurt5TUpWTv8EjnI7BJxBxUlu
         ChrA==
X-Forwarded-Encrypted: i=1; AJvYcCWRe9t588j3n11BosuJx/f5Zu6TnR38YuR3M6ZygxfTQ5RBqJyqIq/2gCe6UPHDL/MdT1uUm3q4krf3BA==@linaro.org
X-Gm-Message-State: AOJu0Yzw0JZrozC+1sjStssLR8uO+paj+f247kPsXW/PQAAGpg4BHUD8
	wugLNYYoVn1VbNtTzcLZv4zpfoQ89gvvsMU+k7MpBp7uhV21P4QwHzlbtjEMEmmZyQ==
X-Gm-Gg: ASbGnctOX7YPMRRadOc0HeqVnmNIRMMYQ+H9paHjK8ivREprYra1bMlR07d/FSVTLbT
	bfOvKHAyF+yqATG6DUmycJlq8muOuDm6DG3Wv3+Rdo3+p2oMQ2Q6iJzoYKfOzEcODb70Oaa4n83
	OHkKgYf7MdieeC3LnL145LVuTmV2Fd8L+NFzvLuA1DoqsDVkj6WrT1hZawmGrzQebX8/joIUNB8
	S/yow1uc5FjHa95b+3HkTqJc2awLVVrQKK0V6tqUFXty+JYLTGR1hlw82hM5MrITJuwvACQR5H1
	AOHeL4INM5hYOr4++AfIXhfGdgL1hBTiQ1Z3nY5t9SpHCUFZtE/41ELTM4A2Vt7tI4U28UVX6ST
	x29OvRO39bSaY
X-Google-Smtp-Source: AGHT+IGgC8MDVGkRqw2vbt917abdXWZ3MG1OlSLGeOEkxOX+DZ8OMBXDOpAWTPmY0jfwqNvKSOTMnQ==
X-Received: by 2002:a05:600c:1554:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43ea7c965ebmr56831035e9.17.1743564690488;
        Tue, 01 Apr 2025 20:31:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613a283sm7175535e9.37.2025.04.01.20.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 20:31:29 -0700 (PDT)
Message-ID: <e11f5f2e-0838-4f28-88c1-a7241504d28a@linaro.org>
Date: Wed, 2 Apr 2025 05:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] include/exec/cpu-all: move compile time check
 for CPUArchState to cpu-target.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
 <20250325045915.994760-4-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250325045915.994760-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Cjrl+GpJHmoj

On 25/3/25 05:58, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 4 ----
>   cpu-target.c           | 4 ++++
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 74017a5ce7c..b1067259e6b 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -34,8 +34,4 @@
>   
>   #include "cpu.h"

This include ^^^^^^ ...

>   
> -/* Validate correct placement of CPUArchState. */
> -QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
> -QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
> -
>   #endif /* CPU_ALL_H */
> diff --git a/cpu-target.c b/cpu-target.c
> index 519b0f89005..587f24b34e5 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -29,6 +29,10 @@
>   #include "accel/accel-cpu-target.h"
>   #include "trace/trace-root.h"

... is also needed here, otherwise we get:

../../cpu-target.c:30:19: error: offsetof of incomplete type 'ArchCPU' 
(aka 'struct ArchCPU')
    30 | QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
       |                   ^

>   
 > +/* Validate correct placement of CPUArchState. */> 
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
> +QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
> +
>   char *cpu_model_from_type(const char *typename)
>   {
>       const char *suffix = "-" CPU_RESOLVING_TYPE;

With "cpu.h" include:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
