Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp495305ejo;
        Mon, 11 Dec 2023 13:27:15 -0800 (PST)
X-Received: by 2002:a7b:ce92:0:b0:40c:260d:2d0d with SMTP id q18-20020a7bce92000000b0040c260d2d0dmr2986262wmj.116.1702330034883;
        Mon, 11 Dec 2023 13:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702330034; cv=none;
        d=google.com; s=arc-20160816;
        b=wRomDIaH8QzfWZ8WTGfXOQZ8bjEOZV3eq6e/xn3QKRPnbtgCahwkceJEt9cjBG4mFV
         h6rUShUERckIpV7eeNwEeotYgaNaztzk1blzQGvX85iKXn+Ak50zBYwesBJutH7CuhzP
         4qzs9KH1O9TBS7VRt9snWmgTigeUlaNN3iCPSf85FHD07to9Vc8UIBdh/TozUtZ5OTdb
         S4wSNN7ISOZoMIDDyVdCsS1vE0Cgnkc8Qb/5oLYTJC2KNwToPRq3bcwSMjc/rKaHKzye
         5dCZ29L79ITv1N7AMhAI7Azs9ZoxHYxX82146EriuNBR5ymQwVviGTBecvTW6D+j81pO
         M9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x0MABy7f6s6nfkg9tx/E5imRi0RrJ+X+xKuN/pb7boE=;
        fh=LWDGRlqPPDDZCT69OrC0gxxuBH1TBrzmBVK7/oI88xY=;
        b=LeccxWKAPqVTzhauxLsVKBG2CcKAxz56w+FR87bTlDnvgOHCQoQXMMSWnhyqa5v6KB
         TA8EVzqnC2zg+NOdyliOiQr55/OnfJpwOqL86YTJ7n8kIKmxAmDfhrorLWT50VCsot/z
         arHA0kp/P938PPlTUu5pf3f9cASNNFXSTmHL+5yMu99DsMnSoDb3HyBg8Enq9ZRnLW9A
         /GWj7vqq5xHH6wU4A5vIYvZZzJpfj7hoJ+xvh+eOSWbibKVVNhVIfIJ7GWvIP3nfKwCD
         4qC9sW6QMBjp2sGuGnLpVEIdnJjjDWk+9xzOsqAQExX8euRxhwpVEcoKdZzX5xBnfmWn
         JEsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhfdlCYx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a5d6208000000b00333504001b2sor10426wru.1.2023.12.11.13.27.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhfdlCYx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702330034; x=1702934834; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0MABy7f6s6nfkg9tx/E5imRi0RrJ+X+xKuN/pb7boE=;
        b=nhfdlCYxmU2BG5tvx+MlIgDPaYMllxJkRbiWjeZ1P+8ZOQDGmEtooWVqBWxXO9ZlBJ
         N8ynz0TwfJk4gSCpv4/5NE+050GxW5DsC4zWgRBK4+ApXiAi9t6y9hAGYDSEToZn6nzT
         PZVldGacqlaFlorqSbpCRSsuv8n8sMVt0hkNuzwoiAdfFtUR3kyCifK8UQPpQGtwunMU
         zouncpZ4mHMmxwW5z1Z6cYEpHLxXQPyegNUWln3QjDw1IflYGs2KlgdWSvDfqOvfFyiB
         vEZOmCdnnEdE4WUrFIuTfkHhabwslr/bii0rOxOV9RXOlUxE+4SBaBfF1usWosPuKiFm
         edIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330034; x=1702934834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0MABy7f6s6nfkg9tx/E5imRi0RrJ+X+xKuN/pb7boE=;
        b=wPIqR/Qil9uGfV3ysWRRzuy8cAQod8Gq+jK/W4mQmQRvWbRZICo8efKfN1q8wQqEOK
         sfFwTbE7yzxqSM2tgMNCqfM1scYhX941SPwAYBvY4Q7fAHVXZ9q3P9iYmNaiSR1ON1AT
         NVwk5+tIMPRt/fZ3MaLXL5nrS0Lq+3jwRhP3lOBpgBLbyoBMzNwBwl/MbdjURJtMHssh
         vV34v/DIqCM34DLJnMLGCxtw1JKfSylIAOa7XFgfSF/ZVMWj7HgbEw7KB+Y+piSf+arC
         JnFD33CAkUV9NqkvTOmpoai7A52o92L3+f35+hjyeEypMdUz0U/mVVCLATajk1c6ygfl
         a+4A==
X-Gm-Message-State: AOJu0Yxq32P1JTjJ+ZzjMny53N0AZXG+PaPNoRVkUHTW28DDX+JJwivB
	UC8d8jis5IopJEdxraYHYQJhvS4D
X-Google-Smtp-Source: AGHT+IF2RUm4rR1J5p0UherjELD2fueA9qp0RQ2IsLv7CBC0irs91kbyCCWuAYYmAEyFqTewaqk4gA==
X-Received: by 2002:a5d:568e:0:b0:333:1a05:31d6 with SMTP id f14-20020a5d568e000000b003331a0531d6mr2749627wrv.44.1702330034421;
        Mon, 11 Dec 2023 13:27:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id d15-20020a056000114f00b0033359ae2d52sm9380197wrx.17.2023.12.11.13.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 13:27:14 -0800 (PST)
Message-ID: <7d8579fa-7796-438d-9bbb-439e06df7550@linaro.org>
Date: Mon, 11 Dec 2023 22:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] target: Define TCG_GUEST_DEFAULT_MO in
 'cpu-param.h'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231211212003.21686-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hrrjmov5JRrx

On 11/12/23 22:19, Philippe Mathieu-Daudé wrote:
> accel/tcg/ files requires the following definitions:
> 
>    - TARGET_LONG_BITS
>    - TARGET_PAGE_BITS
>    - TARGET_PHYS_ADDR_SPACE_BITS
>    - TCG_GUEST_DEFAULT_MO
> 
> The first 3 are defined in "cpu-param.h". The last one
> in "cpu.h", with a bunch of definitions irrelevant for
> TCG. By moving the TCG_GUEST_DEFAULT_MO definition to
> "cpu-param.h", we can simplify various accel/tcg includes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/alpha/cpu-param.h      |  3 +++
>   target/alpha/cpu.h            |  3 ---
>   target/arm/cpu-param.h        |  8 +++++---
>   target/arm/cpu.h              |  3 ---
>   target/avr/cpu-param.h        |  2 ++
>   target/avr/cpu.h              |  2 --
>   target/hppa/cpu-param.h       |  6 ++++++
>   target/hppa/cpu.h             |  6 ------
>   target/i386/cpu-param.h       |  3 +++
>   target/i386/cpu.h             |  3 ---
>   target/loongarch/cpu-param.h  |  2 ++
>   target/loongarch/cpu.h        |  2 --
>   target/microblaze/cpu-param.h |  3 +++
>   target/microblaze/cpu.h       |  3 ---
>   target/mips/cpu-param.h       |  2 ++
>   target/mips/cpu.h             |  2 --
>   target/openrisc/cpu-param.h   |  2 ++
>   target/openrisc/cpu.h         |  2 --
>   target/ppc/cpu-param.h        |  2 ++
>   target/ppc/cpu.h              |  2 --
>   target/riscv/cpu-param.h      |  2 ++
>   target/riscv/cpu.h            |  2 --
>   target/s390x/cpu-param.h      |  6 ++++++
>   target/s390x/cpu.h            |  3 ---
>   target/sparc/cpu-param.h      | 23 +++++++++++++++++++++++
>   target/sparc/cpu.h            | 23 -----------------------
>   target/xtensa/cpu-param.h     |  3 +++
>   target/xtensa/cpu.h           |  3 ---
>   28 files changed, 64 insertions(+), 62 deletions(-)


> diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
> index bb3d7ef6f7..4548103a18 100644
> --- a/target/hppa/cpu-param.h
> +++ b/target/hppa/cpu-param.h
> @@ -21,4 +21,10 @@
>   
>   #define TARGET_PAGE_BITS 12
>   
> +/* PA-RISC 1.x processors have a strong memory model.  */
> +/* ??? While we do not yet implement PA-RISC 2.0, those processors have
> +   a weak memory model, but with TLB bits that force ordering on a per-page
> +   basis.  It's probably easier to fall back to a strong memory model.  */

Forgot to squash:

-- >8 --
@@ -24,5 +24,7 @@
  /* PA-RISC 1.x processors have a strong memory model.  */
-/* ??? While we do not yet implement PA-RISC 2.0, those processors have
-   a weak memory model, but with TLB bits that force ordering on a per-page
-   basis.  It's probably easier to fall back to a strong memory model.  */
+/*
+ * ??? While we do not yet implement PA-RISC 2.0, those processors have
+ * a weak memory model, but with TLB bits that force ordering on a per-page
+ * basis.  It's probably easier to fall back to a strong memory model.
+ */
---

> +#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
> +
>   #endif
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 8be45c69c9..6b10ab20ba 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -25,12 +25,6 @@
>   #include "qemu/cpu-float.h"
>   #include "qemu/interval-tree.h"
>   
> -/* PA-RISC 1.x processors have a strong memory model.  */
> -/* ??? While we do not yet implement PA-RISC 2.0, those processors have
> -   a weak memory model, but with TLB bits that force ordering on a per-page
> -   basis.  It's probably easier to fall back to a strong memory model.  */
> -#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
> -
>   #define MMU_ABS_W_IDX     6
>   #define MMU_ABS_IDX       7
>   #define MMU_KERNEL_IDX    8
