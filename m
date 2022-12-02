Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1085678ejx;
        Thu, 1 Dec 2022 23:30:44 -0800 (PST)
X-Received: by 2002:a5d:46d1:0:b0:242:4698:f0a7 with SMTP id g17-20020a5d46d1000000b002424698f0a7mr821789wrs.77.1669966244213;
        Thu, 01 Dec 2022 23:30:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669966244; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9R0sTJbg9cZ7Iyb4u8dBFCRzIdzfb+2MDBWUhzaPyLDRN6iliOfIpXiQZwWEmlQPa
         Y809uwHV05Ib54q4mA/+umQRcC5RWRrLmB9QDQFH8FEl6DbR7mCOUzASAZ4ysK3WGgJA
         5XcPjd928o06oUn9BNZ0W4AH0XiJn/l9xpwYCo4sEFxe6InbxnyPO59HDXQAyUFRwkZZ
         RuOTXtvjLSJCbxn+a68Am+SeE6E4Cxp/BuYka35kfnU6fM9ZR/oVYkBqT5Dj3Yy5M2BR
         M8IpQG9+yzaogDpiRY2fGUkEKUU4gedPnnsRvKolYInJUsqL7wBmDNlaJTINCMdkcSPf
         RC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
        b=SLov2s4PQ+0GR/ojZ9Cr3l7erYTgHV7NjnRpLLHmVDOXAw9roYoumVGdAlihjuhcDk
         3HOAhK4xZsHtJEPhoBihTCPw0j1gTVvnVMSOhvr+0J4iQqM78Zb2ffTSIrDdIdlAWyYp
         It7mXkAsBiHpYvEQN4hhflC7HScBPQAI4AIXrNRA7BhCKsVNUt24yTWXI0dMuLH/sKpz
         GcQX+N+YK9zvPaE2UL7yzbvjO92ZRNPYrcyWgQdm8/+x7KZGv3UcI2PtRZyg6ywcyAJz
         cjUyubJZFM3UYdjbYz4jMiEgjpgaeHAjISdZmreEymn2FMdGIgDWKZAZygT5/uNmZqv8
         7UQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVm1NIYh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d17-20020adf9b91000000b00241f7467856sor3643102wrc.32.2022.12.01.23.30.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Dec 2022 23:30:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVm1NIYh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
        b=TVm1NIYh1Q7iAyTsM7qc7hev15vNkoSE8EUSnwGoHabUGC7UBmF1fkdCO/1U1u9xvo
         KlSdHsLwxaur76EYgZ0zvMRl4P1QQiaY/9VWmVIvozawQHZ6uPeV1DuOyrTs+I80n8LX
         XVNCBStJBxUoIjtj9rxXkW4qSgR1dP7w4xaZtMQGwQqUfRhhF/tswrPe8GJrhrQQ3Qiy
         rPKxcZONGThvC4K9MK7QdaLY39ddR18fAIWzSwK2l+VLUowb05BdG4jphZtRNbWTasSf
         gUm21rixoV27yY4W2G24evxcn5WR5MUUS2rjHYj5mBOZhhfOI32cFVp7kohXXzjZhZQv
         jsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
        b=twBs/MrBoqlPEEGLLOCADCJENbhBo3iP9ZQ2I9WxbJm6c9VeBKHnNSAyJTFJdu/RpP
         MckTustgug2n8KL97IF/pD/P/Nw60XqLxIHr4I/ZrbXpPvQD9VxhrLybiSxddCs5kQKX
         lPQiV3RH/9UZa+KEAfmWgCgdO/F2T43Jct4qqS7g//dZXFpdidNXA5oZ0jkcsYbUxQ79
         ieBm1OEE3deqHlWjexRA386z+efrWFjvByxyP3pmBXUpDrH503lTELv70UgcRXtY3xq9
         YvOVIPt0rLgjwa75kSf03PB1oy0l5gAyCrY2PTYymO4u2atDk/vfGoaR7ohxflS3FrKs
         pyew==
X-Gm-Message-State: ANoB5pm3QmUnTQuuffp+V8vEmtsiMy6ZuZQ9XN8BmklCaxOtNnSczvAd
	pLL498h2a7SWXa9Iqsh88hr4aSHj
X-Google-Smtp-Source: AA0mqf4hLyZpN4MxmrOcTbwU9h/hfXuZXL0BMzihoq1RZI2AynblVXMjBtNnrDSTRdGVTGfqWnAZbA==
X-Received: by 2002:adf:f8cf:0:b0:242:3fac:df9f with SMTP id f15-20020adff8cf000000b002423facdf9fmr2641768wrq.117.1669966243940;
        Thu, 01 Dec 2022 23:30:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ay2-20020a05600c1e0200b003cfd0bd8c0asm7871437wmb.30.2022.12.01.23.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 23:30:43 -0800 (PST)
Message-ID: <429495ae-9d8e-9921-9e8a-f913cb5b2779@linaro.org>
Date: Fri, 2 Dec 2022 08:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6iYUFDcgKPlh

On 2/12/22 04:00, Vikram Garhwal wrote:
> Add a new machine xenpv which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
> TPM emulator and connects to swtpm running on host machine via chardev socket
> and support TPM functionalities for a guest domain.
> 
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
> 
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
> provides access to TPM functionality over socket, chardev and CUSE interface.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>      mkdir /tmp/vtpm2
>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> /* Comment about machine name. Will be removed in next version*/
> Please reply with the machine name you agree. Below are two possible names:
> 1. xenpv
> 2. xenpvh
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/arm/meson.build            |   2 +
>   hw/arm/xen_arm.c              | 175 ++++++++++++++++++++++++++++++++++
>   include/hw/arm/xen_arch_hvm.h |   9 ++
>   include/hw/xen/arch_hvm.h     |   2 +
>   4 files changed, 188 insertions(+)
>   create mode 100644 hw/arm/xen_arm.c
>   create mode 100644 include/hw/arm/xen_arch_hvm.h


> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>   #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>   #endif

Do we really want to maintain a 32-bit PV machine?
