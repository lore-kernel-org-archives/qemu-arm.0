Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1609686njb;
        Thu, 9 Jan 2025 07:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDqY+c7b38g19Flkx1X2iCRT9aSdSzrFnzGk2ktrRKOP87FxuA8ZyB4xswZ80WWr/5l7p4Sd//bYHEQg==@linaro.org
X-Received: by 2002:adf:a41e:0:b0:385:ec9b:e442 with SMTP id ffacd0b85a97d-38a8733a391mr5555459f8f.40.1736436307403;
        Thu, 09 Jan 2025 07:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736436307; cv=none;
        d=google.com; s=arc-20240605;
        b=fb6l1pMJ75i/cODMLqHF+r+SGoAuC47x0X2ClMj3HttedtdWawvLZljHqRQ1Bzs9Nf
         WWeRzilXt381ipPd6aCNVPQ6rlppwup4OWMdlFjkNrfOuXcwIFmFx2ymJolQ78awj/XT
         MCxKObKeLOJfEEzvvBLRTRW0XbCyJuXdlMPn3vCfeorAk5sY3znNTk89jISEM7X3qoQ+
         pw33Un9i/IYC899SylLfjrdjOyPkFJ/PugB3BlFAjcw6XumOyU6TScDoHKy0y4KzUpcR
         22ig35PwFOCTYFFODvN4VqUtyw3roXiq0FWnBlt4y86EKN+scZAaQ1ncFDrjGZ1sySBW
         3TcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OCUJyk1ZYRLWDbnvJbJn3JTBMdTvNbnrCFvl77VNn2Q=;
        fh=Eu3J2B4cdAdpi6YUHTp61tRH3/RZ+ObpTzjbF5fuYMs=;
        b=Pviduqyi7kAtfuenf88BP9hyU3CTxUXQL3I04LFXBwLP7TH2REClBN1AilRDXHyUbN
         htwAUtjT84fjae2rmnONBVl2AH4jOf2rIkRCbkaGJtwwGLtVKus456et5brcVhUt7YPW
         7T0GUds9phlp17K2awAcEI85AG2b6LCv25YBAvcBNjwwMMWZkQgizFGIsWhn5CqLgH7W
         iQdiga5lmZMMFnb4yFqL1Lo371IPhdV9u0t6ELdxMyO5UvrKQ2plGLbN98B0GiTMO++F
         QT6t/QnUWr7ZMqJdN9R9SvL3D1ZLxYJ1qculVQkOC/8HXfLbVHC7bKuhxP/5o4Z/4J3e
         Rn+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4NcCYfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a8e4b4aa9sor596845f8f.8.2025.01.09.07.25.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Jan 2025 07:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4NcCYfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736436307; x=1737041107; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCUJyk1ZYRLWDbnvJbJn3JTBMdTvNbnrCFvl77VNn2Q=;
        b=B4NcCYfppOHSCn4Th2dBoViobbNZzr70I9066qJKlBmDXNOQSLajF0NyOh8xbtPihQ
         4HxYlVwsDp0/VG1pSy8OqpbMwkAsbZx1tFceI1yGH4Kw1GUyIaZTeYAtXNVLETTynPx7
         Ux0cgmZP4qNzP+eAU0v495h+O8E0BlLPwgwIewWxkZxz4KKiPWoUTxtxZ6F6y+kfibUa
         M0LDxPxi4p6Ql0B0+kbLzZjaL/PtBA0eVVIajcidG5+3mk2+XWLnWN406UCObEjmOKri
         RJeIX0CBidaFB7aRQh3BThayVwhMxxuwPnNEkYhNlDlJEFty+pGLSvHW4GqEx97z42CS
         p7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436307; x=1737041107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCUJyk1ZYRLWDbnvJbJn3JTBMdTvNbnrCFvl77VNn2Q=;
        b=N1ty+CSSTaTlUZ8Ohxg5fF7qLrO+G84hy/D5mfK7a7xzKovT6YUJWmfhf+hiG6x/sm
         FPPuw95e6ZRhFzYvmS4+/xG0oBBLU4wybUCAe8RY9UsTMhYtA1iijcVAX5X3bpSygyws
         LoYkfW/Ja7jMwhuqMKjI1o7AxqZI2GB5c8pZgZYO117wlreslu2Qwm70NvIBJvOtsuRW
         AwIlD2BoQ1dEV4btgcZhDjT12GsvcmJl25Lw2AjNQKmQqwLO6GOR34h7iGTNJcUJMibZ
         Qt2oFwsT0D46d9MBT4/T6SElIxuYnyiAx2FgmGX7ssOs2z98a8rlz2ayyZXL28qivcUt
         tulg==
X-Forwarded-Encrypted: i=1; AJvYcCXhSj2mAsfITDlt/mEUCD6+SxHF4DL2FAoAZ/GQRSlqrAAITwMHYq15pVzy8bnlKVy6cUdB900BMRDT9w==@linaro.org
X-Gm-Message-State: AOJu0Yw7DN2p16xgEh3mBuxerCHo9DNnyFk/VkynfcT56mLIAqjxDKjQ
	wAzr3xLjsS1IwSzuOGDubuywITUFZ2qnnuXI86l76XKmeq3dbebowIIjagwp0aamUA==
X-Gm-Gg: ASbGncvQlBisx/OwvNy3vsPSMXeUPIxUXdqPdBxUHx91PadEJtQv0TsSja6kjHglnyB
	2RJ4G/R8fYvkEhl2Mam6JJ0j35OnwkbTfugxfG84XthNR9OAIrkjyP+ehgGw4/SgpNVQU6uGvJk
	jYEnOLiyX+kY5OIG1UpjYskZYr0qkBj1BIj+bKhLPJr7ZSU+2oQEZCbNq+MiL4OQIAUYM8VevJD
	nMkC9wG5KP1KDjIK+MPoXHn/n8UiVjJ8dvSjubUxwy/EMoM0jIxbeTse2YIK18ycxhstohJLTv9
	DMplvUDGwsBxc7GnkDXFi73aZ4A=
X-Google-Smtp-Source: AGHT+IEnC2idJ71eGb3dVYRv9KYp2F6DmDa7EZwJ84/+czicVxBYfNUVs/iUO3vqRjonGKunGtEegQ==
X-Received: by 2002:a05:6000:719:b0:385:e879:45cc with SMTP id ffacd0b85a97d-38a873045d9mr6035262f8f.19.1736436306826;
        Thu, 09 Jan 2025 07:25:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38325esm2086132f8f.27.2025.01.09.07.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 07:25:06 -0800 (PST)
Message-ID: <80c3d02f-30a2-4b60-ba58-c2db17d15a0c@linaro.org>
Date: Thu, 9 Jan 2025 16:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tests/qtest/stm32l4x5_usart: Avoid accessing NVIC via
 MMIO
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, Samuel Tardieu
 <sam@rfc1149.net>, qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250107192637.67683-1-philmd@linaro.org>
 <87wmf42fam.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87wmf42fam.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 01vrO7fbiG3f

On 9/1/25 16:11, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> The STM32L4x5 SoC family use a ARM Cortex-M core. Such
>> core is architecturally tied with a NVIC (interrupt controller),
>> having the NVIC MMIO mapped in the core address space.
>>
>> When using the QTest accelerator, we don't emulate vCPU, only
>> a dummy is created. For now, QTest is only supposed to access
>> MMIO devices mapped on the main 'SysBus'. Thus it shouldn't
>> be able to access a NVIC MMIO region, because such region is
>> specific to a vCPU address space, which isn't available under
>> QTest.
>>
>> In order to avoid NVIC MMIO accesses, rather than checking
>> UART IRQs on the NVIC, intercept the UART IRQ and check for
>> raised/lowered events.
>>
>> The sysbus USART1 IRQ output is wired to EXTI #26 input.
>> Use qtest_irq_intercept_out_named() to intercept it, count
>> the events with qtest_get_irq_lowered_counter() and
>> qtest_get_irq_raised_counter().
>>
>> Remove the then unused check/clear_nvic_pending() methods.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> Based-on: <20241216141818.111255-7-gustavo.romero@linaro.org>
>> "tests/qtest: Add API functions to capture IRQ toggling"
>>
>> This patch is to fix the problem reported by Fabiano when
>> removing the &first_cpu global in qtest, see analysis in:
>> https://lore.kernel.org/qemu-devel/05820c9b-a683-4eb4-a836-e97aa708d5e5@linaro.org/
>>
>> Note, while writing that patch I noticed a problem with the
>> b-l475e-iot01a machine. In bl475e_init() somes output GPIOs
>> are wired twice. The EXTI outputs are passed to the SoC with
>> qdev_pass_gpios(), and few are re-wired to the various output
>> IRQ splitters. I'll open a GitLab issue so it can be cleared
>> later.
>> ---
>>   tests/qtest/stm32l4x5_usart-test.c | 33 +++++++-----------------------
> 
> What about these other ones?
> stm32l4x5_exti-test.c
> stm32l4x5_rcc-test.c

Same changes, but I'd like to get feedback on this approach first,
because we lose the NVIC coverage. If we want to keep testing it,
then we need to rework the qtest mmio API to somehow specify which
address space is to be used; or a new API to resolve a device
particular MR and access it, without using the current global
sysbus address space.
