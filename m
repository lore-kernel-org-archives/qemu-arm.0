Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1353994njb;
        Wed, 19 Feb 2025 05:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPlDUfWy64wxgyV8vyi/ctgqz01ZutH4+dF6S87aYulLB3UVPe8C/OtsXYCzylbMQDNRCNHuYsjYotZQ==@linaro.org
X-Received: by 2002:a05:6000:18a9:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-38f33f1233fmr18401846f8f.3.1739972566736;
        Wed, 19 Feb 2025 05:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739972566; cv=none;
        d=google.com; s=arc-20240605;
        b=SHmQusgkL+m5wVEhiMqkpk0sqTWSKHYaEATY07zcm6T1iKOWrZlvUMMMeC5ueZvlvU
         Fb+fwowZc3XNb4ACNwsWV9C9hnnf31EimphGkpEOA7Sq1emhyOFBw2cDstF8kIIuV/bZ
         1mlZCMBvAX+nM34AA0RXMMUbE6etUWPWM3gJM4U2OxmzOqlirbCUNkHinFdwr99tnrdG
         snv3GrbAQ3pQa8GiDFEIatkPScpl6OT+/7slu3dg3TWbgGlPs0YUwdJ7b0xrNJt0hAIh
         IjvHRfWYejlZHXmahjEkJmyrlVhNBu7Jt6935WbefKHqBOVj6QnFYzVAFy80p3fCugqq
         RN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Yn5JxOvVuxWCvPs91MBi63impH7jVLwkgwEDOqQZBco=;
        fh=pOqCWnz8hADR1jStjnFIPYo96NxvWtr+prwhPfff9Cw=;
        b=FeTxDJQZQMWgc5urG5o1sCtJvECK2LVIYa97nd1jcyj1NBvjvVHl/HxLFxnnNjRBlc
         w+oV1rAJPSqj7hwMopv2I91N5EZA/KvpvEjNmA+LNsRvs3jnPCZ/or9GuXq8Shghbdg2
         2j99LJP7GcfdVYey5VtsPelwDDIB2YMTUf3mL6whWYNYpnk0hud9F7fBfuIMAxAnvEZC
         fKKP9sZaY4wbErMdkoCnUIQXFgnn7567jBfsQkBa1GaZ8Ld1+XbsTATde1TAHC6MV5AS
         5SHh5J2gAaGA7hsLybqEf9G5GOPurfj84iuu4XSQaX8MWIuyvMq4awHxGddaDQa4OyCg
         b2OA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb6A83Hz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439916b765dsor23131255e9.1.2025.02.19.05.42.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 05:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb6A83Hz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739972566; x=1740577366; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yn5JxOvVuxWCvPs91MBi63impH7jVLwkgwEDOqQZBco=;
        b=Jb6A83Hzej1Iv+gkpTmyIikzp0GIRX76McKjs6IKmT0gcq1vrMdmUBPRGNJjIWQD0+
         ciFqDsmrsbAaHFQEZrui+kCyQYsCrJbJ785+2QL9LWWS6B1DVXHEyTZ1ya63eNjS0XDX
         WNFdJC5JLdAg+TiLcm/4kvlm1QnDXtBBoFIOpbM0nr/vCqwTKPANS4JV9GXs5wwejzjI
         GpkqaglnoqYc61v5/ryNoQk7382Eeu9bUmKTc4pRs+YFFjJ9Sio2U6CLAmtE6eedM0iW
         uBm9CvB62li+Dg1nYRX7TzGchbP15GvlGIEtgGstOmUnhJNrmDEefvQuS/JR6nhIL/CP
         rV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972566; x=1740577366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn5JxOvVuxWCvPs91MBi63impH7jVLwkgwEDOqQZBco=;
        b=Myw3pjxXNyWAqZj3ZgRJTo112JYcjkbm/6+45ihrK+Nv8UwVHlAHbjTP87edc+xORI
         WFWlO+ESwB5rJM3pFWc1L7MT/nCW6A989H5TrFw8GQV4LUE0Aqr1Tq63Kn3ImxIvF92M
         M8PuOprv/m0hcqD8fJ1mQuhLtedTkvl3MwVBKuFm85BiSJyTiPUWlM9U2P4R4srBLmfu
         K6q6nZEauJ4hX55YsVffV41dW7SxydcsPo7wDXby9H3ht8ldKHtXa7Yc124K4NQMcKhx
         +EXBqonlRn0xrx2CwLa19nJKqj78WDrLJ7NGFBwGlNHxCiUxkMH5dxjqky6yTzDe8muO
         kt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvZJfr/UVa6xQAAc3YPcedId30ZAZxIIgUu3JJ0s7ytFfGemhuIeDcu+c3sMDQYJDi8lIo2vknkcfsuQ==@linaro.org
X-Gm-Message-State: AOJu0YwTrjWhRS4poH+Rxd/L6Bxi1qCV7pXiSrjzDiiKrfEJIXYLwVUW
	GVgyJe1tjCDVTW030+39uUKfIBRopgKxGwPPAp0qpXr9T8VnmXblLqbz5ANXrZ3IXg==
X-Gm-Gg: ASbGncuXzLK9KUU9HA8StabP+cRCmBhzrHT7PVztQL5iQt45ibcCBAxk70UsMU/bjlf
	CMbdCXMYhxXY7XzGZSw1WeYHkCuPabH9PEnBLazey/fi7brGQBFbDimM6G3wDypqLaiGyFIOncA
	SjPOwuk2ACietPxX7Mg+ky+FM08BdBdieXZYv6FLUKgO+bHFq/VPegzpMCqwTFdBt/ZkBsdGasI
	GRPxS45Iy+fFLVs0r0v4qAuF+RxD9PfCydGDwMiJrHam44ObUF1K4iYff98ql11OP8+2CJd9DDJ
	d/CbjCPYSE/qRWTNXxJAt2U04UEReOvL8WzcpfVFf2YC1thPLkEAQMK5NbY=
X-Google-Smtp-Source: AGHT+IH7GF4WcIIO21sC8SYTBYxp+DeRDGjHt0znsHo41EKs2B8cze0cqBu+optlI0hNkxMVH11Fqg==
X-Received: by 2002:a05:600c:474d:b0:439:9eba:93bb with SMTP id 5b1f17b1804b1-4399eba95f4mr19117345e9.18.1739972566177;
        Wed, 19 Feb 2025 05:42:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7d2sm215547745e9.25.2025.02.19.05.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:42:45 -0800 (PST)
Message-ID: <27970761-5032-4bff-8c15-6125ff341499@linaro.org>
Date: Wed, 19 Feb 2025 14:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/intc: Have ARM_GIC select ARM_GICV3 when KVM is
 not available
To: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20241227202435.48055-1-philmd@linaro.org>
 <20241227202435.48055-3-philmd@linaro.org>
 <CAAibmn0zhrZjZ+SL7n7eg041a5APx-o4sCAp0YGDiwUk8gpgDA@mail.gmail.com>
 <CAAibmn1g6+btdRX99ZUvbaBm7hP_AnAGNfDHz4Wgi3fPn=waOw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAibmn1g6+btdRX99ZUvbaBm7hP_AnAGNfDHz4Wgi3fPn=waOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Pk51QsQxoB1G

On 7/1/25 17:05, Phil Dennis-Jordan wrote:
> 
> 
> On Sat, 28 Dec 2024 at 11:48, Phil Dennis-Jordan <phil@philjordan.eu 
> <mailto:phil@philjordan.eu>> wrote:
> 
> 
> 
>     On Fri, 27 Dec 2024 at 21:24, Philippe Mathieu-Daudé
>     <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>         When the KVM accelerator is selected, the Kconfig ARM_GIC key
>         selects the KVM GIC implementation (ARM_GIC_KVM).
>         For other accelerators (TCG, HVF, ...), select the generic
>         implementation.
> 
>         Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
>         <mailto:philmd@linaro.org>>
>         ---
>           hw/intc/Kconfig | 2 +-
>           1 file changed, 1 insertion(+), 1 deletion(-)
> 
>         diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>         index 7547528f2c2..762139d8df3 100644
>         --- a/hw/intc/Kconfig
>         +++ b/hw/intc/Kconfig
>         @@ -23,7 +23,7 @@ config APIC
> 
>           config ARM_GIC
>               bool
>         -    select ARM_GICV3 if TCG
>         +    select ARM_GICV3 if !KVM
> 
> 
>     Wouldn't this disable the ARM_GICV3 by default when building with --
>     enable-tcg --enable-kvm? And then there would be no GIC available
>     when running the built QEMU in TCG mode. (Bear with me, I'm a
>     relative Meson newbie.)
> 
> 
> 
> OK, I've managed to answer my own question now by setting up a RPi5 with 
> aarch64 RPOS and building QEMU on that with --enable-kvm --enable-tcg. 
> With patch 1/2 applied on current upstream master, I get:
> 
> $ build/qemu-system-aarch64 -accel tcg -M virt,gic-version=3 -smp 4 -m 4G
> /[runs successfully]/
> 
> with 2/2 applied as well:
> 
> $ build/qemu-system-aarch64 -accel tcg -M virt,gic-version=3 -smp 4 -m 4G
> qemu-system-aarch64: tcg does not support GICv3 emulation
> $
> 
> In other words, with the proposed change, ARM_GICV3 is indeed deselected 
> if KVM is selected even if TCG is also selected.
> 
> 
> Possibly very basic question: is there any support for kernel- 
> irqchip=off on aarch64/KVM?
> If yes, don't we need ARM_GICV3 in that case anyway, so we should drop 
> any accel dependency on it in the first place?

Cc'ing Alex & Gustavo who are more familiar with GIC devices.

> If we definitely don't need the software GIC in KVM-only builds, I guess 
> we're down to listing each accel that needs it individually. Is that:
> 
> select ARM_GICV3 if TCG || HVF || NVMM || WHPX || XEN_EMU || XEN
> 
> or can we drop any of those? Have I missed anything? What about QTest?
> 
