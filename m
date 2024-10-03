Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp91689njb;
        Thu, 3 Oct 2024 15:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/KT6KZJhMFHDMrVv1/5y+EfzTaGIuJ5HWB6ugbh4szkM73jH2ZDZA+AvipHqWa2vtsiJyfrzXszaLHw==@linaro.org
X-Received: by 2002:a17:903:184:b0:20b:bf17:e497 with SMTP id d9443c01a7336-20bff16f0bbmr7392195ad.46.1727993077684;
        Thu, 03 Oct 2024 15:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727993077; cv=none;
        d=google.com; s=arc-20240605;
        b=YYWyqF8s2ABXf/oRf1OcsY2Kc53lAQSQw5zUvTrKRH0Mj+lEGMw8TOkOSlgnPO138n
         Q9esCgNxiJ0fOjIPKN+HbzuHm5oBovnT3gaZwguAl8gNZXygd545NTSKCqd7SB20IB4l
         UOJRK8edx8QjzRQn0Te+sB4Fm6M9LNol69VT5QtkUyhwL2uM3eso5nEBVhOwEVPMxdOG
         cozOxGA8iJt8YPmp3m7JHhGcGQawJYNXoSWu/UF54YS6i/7tSzQScd0AzWxAHuOKHPSM
         wRrUWifvZznFFdVvphX4JmOudHcBel0wrPsiXcYXBqyCmSSL6feaYuNDh4Lpnb6be8mT
         T6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/AWLh8DpbVrqbWuKOyEAhIitSVZCLGR7kgeNMBJDwZo=;
        fh=0USkCJnNjA4MTKZbRcb9v3ryActZFyUl+4r0BcYWw34=;
        b=TmUEjr7taCtqF++vmmS4NKsbiqFWl9fPXPZovNsaTAhp+uGp4yojV7Vpi9MsZ1UOou
         2QQ0LSiiCyciOHK0F0XI9/K7lrqYDSFV7wY9yYHfJsoBw9ddtJnMTe7lFe4A/chGbUmo
         2tYXtp7oANFQqyHEQCHcwEd3ySbY2ZjSntj893Web/XirYC/KpNJH2eaRoW5Oag/39Vq
         0v/R2fgVWMn0YmV4HUqy/hm01aWMjaOWoj0l5s7irbGBulJVsnpWzBlUJiomV7U+VyEM
         ZHwgp/yHVH3X60iJNenDQi9ogvz2tyQJtpeyVjQxhrp/u/V1Qa7qlxmayEYdOhEOHwVQ
         Ks1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kziKoOVJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20bea19aa7esor13023045ad.20.2024.10.03.15.04.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 15:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kziKoOVJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727993077; x=1728597877; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AWLh8DpbVrqbWuKOyEAhIitSVZCLGR7kgeNMBJDwZo=;
        b=kziKoOVJK37xx2I3zwMHTgZ4AjlKAuyAd3NxZnuXmGUz7ZFwncU665YaWoUs/0iWDG
         siKhLpkI/gYTI74xU1nSg4Sn/mhrzE2VCMrlGnvqIdjWPJCcbuefAJRzk4U6Ckeel0uy
         Av/ejdamgdDSEXzd3F/wGExHdCfV8vS2M7jPeuINR1HDW7KTYmbEeqYUlsfxonb81EVE
         IU5XfyHvdM/Ew5q8tJJX/SuKnXmXnvIuKgOhCXmrecj41/XDMXkEPghgJfVRzcyJfszq
         cS3XmRg5/REqeRCmT3LHMdfzVoN4SVMHSdFw/xgm4sxN9dnbKPAZM2XSCr8gAAaILYqp
         7bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727993077; x=1728597877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AWLh8DpbVrqbWuKOyEAhIitSVZCLGR7kgeNMBJDwZo=;
        b=tLdw4Glu7A9CfqCsxXzz3CC5IamtT9x2T/+NGEpIc9wgWBWc1NZhkWJh6pCLTDQH6A
         /NWswTCkl3dr0l5Queke23AsK9f5oiZJ6ywxt4KroPxR8deEolaa+6RfbzaV84r7Z9wl
         eQyv8CQV05b9X/N0CGdr1MkwzpfurbsPKyQegdC7oWXazjyiRJJSD+kbIqYJF/juiyOp
         RZbwo19gCXp0Y9ZlfxaxfPutijtQGgn6WgGtNHMC6TfAqyVYoqC1weReomuNxkoe9nbt
         KdzeQVgyXtc1m0zEOSCjrndbh7HnLIRdR1bKAPtxglbdrW7KRMdDnZVOpao7hgwBtbnD
         Tc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUDNEbulW5kE7BRHQgY4FK1qwfJZnWq3d5oPBhsBJPxZqmZr9vfxq2UcrSRGvX1PYvuyAwwqOnDM4AUcQ==@linaro.org
X-Gm-Message-State: AOJu0Yz8grcEl4yyO4oPIhwxNS9G6LvQv2+ogWMwb5n8ZgQPevYk5of4
	Dd7iYeIBty5EZUIEC7pGLGzviPkpy2NS7knTqL8EEYNVfu0R/SchrmuDLDMX5wx6aQ==
X-Google-Smtp-Source: AGHT+IFpIC5jHFpGAlG+G54myKK0r4QOJp4/Lv2CcM5fMnf5vb0BSWEY7gS57DPf75F/wdd6ecE7ew==
X-Received: by 2002:a17:903:8c8:b0:20b:5808:3e29 with SMTP id d9443c01a7336-20bff1dc073mr9644565ad.58.1727993077224;
        Thu, 03 Oct 2024 15:04:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead4f18sm13506575ad.38.2024.10.03.15.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 15:04:36 -0700 (PDT)
Message-ID: <eac7b54f-26a3-4881-b889-5fb79f8104fd@linaro.org>
Date: Thu, 3 Oct 2024 15:04:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] hw/pci/pci_device: Introduce ld/st_endian_pci_dma()
 API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240930073450.33195-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bABK8ck95bYm

On 9/30/24 00:34, Philippe Mathieu-Daudé wrote:
> Introduce the ld/st_endian_pci_dma() API, which takes an extra
> boolean argument to dispatch to ld/st_{be,le}_pci_dma() methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> TODO: Update docstring regexp
> ---
>   include/hw/pci/pci_device.h | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> index ff619241a4..dc9b17dded 100644
> --- a/include/hw/pci/pci_device.h
> +++ b/include/hw/pci/pci_device.h
> @@ -300,7 +300,29 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>   
>   #define PCI_DMA_DEFINE_LDST_END(_l, _s, _bits) \
>       PCI_DMA_DEFINE_LDST(_l##_le, _s##_le, _bits) \
> -    PCI_DMA_DEFINE_LDST(_l##_be, _s##_be, _bits)
> +    PCI_DMA_DEFINE_LDST(_l##_be, _s##_be, _bits) \
> +    static inline MemTxResult ld##_l##_endian_pci_dma(bool is_big_endian, \
> +                                                      PCIDevice *dev, \
> +                                                      dma_addr_t addr, \
> +                                                      uint##_bits##_t *val, \
> +                                                      MemTxAttrs attrs) \
> +    { \
> +        AddressSpace *pci_as = pci_get_address_space(dev); \
> +        return is_big_endian \
> +               ? ld##_l##_be_dma(pci_as, addr, val, attrs) \
> +               : ld##_l##_le_dma(pci_as, addr, val, attrs); \
> +    } \

Like the address_space_* functions, I think the endianness is being handled at the wrong 
level here.  Improve sysemu/dma.h first.


r~
