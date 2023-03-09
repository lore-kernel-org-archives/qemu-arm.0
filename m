Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1167491ejc;
        Thu, 9 Mar 2023 13:08:32 -0800 (PST)
X-Received: by 2002:a17:90b:180d:b0:22b:b375:ec3f with SMTP id lw13-20020a17090b180d00b0022bb375ec3fmr24436693pjb.21.1678396112326;
        Thu, 09 Mar 2023 13:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678396112; cv=none;
        d=google.com; s=arc-20160816;
        b=StoFLThIGAVENAnR2bG5WwtYuWm+kVtu3vKcsfvUh3HyMQNylHG9SkHwDQ08+83ekY
         /NHLbE87W3aegpJrGS/0Ewy5L90Ci163gEbHPAJj0olX4TQ7c9k6pbp/NLLEK62SsXRF
         UUV4PJbE+8gUNlePvGsudIG0gzNbhcc2wQGVJS/edbhyqcwk8lS4zl8zhRxctRxYfbm4
         Cg1lgpx1YzARouK1jfKI6o4kMyTJnyQf4w0HNdMQsUia6NgQo98mnQfe2TJZ/UtTEnrJ
         WdIl2zYcI3LqO72XkiThZk769l4Bl7BMyXAGz57GwRUY2IBxsfUvmgkUbsXN1iz3S3lM
         zblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tQgIRPCOvB+FFaD16a2KBOxq1e9Afym3b0gP0+ZSGXw=;
        b=pE2JncSYNZ+MSf0Nvi8AjyzBf+sOqpSLgcBzSBLCpx2CaIqaMSkvZA0Wml1dvwguN2
         8RSaqGDGi0Difdv+iYVanvmsjRMr2V96eOtwnBQ1D47TIh5x3ioXRVesBzq+jMWUARuV
         j/uTcmFm38DXje4AOX3mNsnLVHuPvBI84MDUxRihAnH/vWoIkF9OQ0AcQZqe55osb3TO
         vcl1PL5OX5P+aJXqivCXqLVCbXh6LjX0hel4Kam+oxuNUwXGHR1TXSazcZH8H2AT5CRf
         g4IUHP2nLpyoSQPGuAtiu8risj09ywbOGJjL493oNvitMa8KoDfYypXqXNAHGRv+ibj8
         wXNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DaDW8qaC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o64-20020a17090a0a4600b00230870cc957sor344005pjo.39.2023.03.09.13.08.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Mar 2023 13:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DaDW8qaC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678396112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQgIRPCOvB+FFaD16a2KBOxq1e9Afym3b0gP0+ZSGXw=;
        b=DaDW8qaCdRR/B8oR3xDOF6825s1YPo9AWgzt7YK0fWEk45T+CxesdX9EVsqUmog9Tn
         hi/GJTqTnMZkjsX0taXYIOTcvi1zZrY8hmZX9QhMjkhRQLQeWghPqMZrCW/sy2mfUokk
         1d6oP710ALIgMXuqTkQZdnqrvAr4AatFpUvre68NdU6ONeX7BoBn65ri4TD5imqBzH+7
         A0o8JZIWjqi0lXs/UKs1CxBYdDI2EP/JywCezRu2r9xkl3v4SBkzaf8vNuY5OvmS5EvV
         JN6HS0FXshC7jeIqtwjwFF8S8RQJpu6R6+cyPm+8Cg8AAVckkuLFOu49e1J+WTo8U2ub
         6QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678396112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQgIRPCOvB+FFaD16a2KBOxq1e9Afym3b0gP0+ZSGXw=;
        b=bra/D00nZBe+q7GiWKtEuGFUF7u+lRXEPmj9ae5rlXEBd/dnwdDKIg8NW9iCtNfz/X
         5g8lhGTeH2nj2IWj9xc+CD1zlA1QjNNr7Aw0IWPX/RmUU4iDzLIGEBBa3agUWnDy26Nj
         6jsxwF0uGIBckidJ0cZEbhcx+DK9lOtsSwNLP7hjlnyTksEmwAcz4eBVhGUjRSzZUsOG
         rF2IIkSE5IxZlKsteK3CkeL/EusvZbQcEVlfRhrdiikPNEdYZGiq5BO2rpbmhjKhZcw4
         deESxkQpTH/cuXMSwsnFo1M1sZBC5YjOYPMZaOvj1b/yrfwWA6A8cejt+H8BBjU4tpgC
         epFA==
X-Gm-Message-State: AO0yUKXYwsaX/giqdtouCGmXlqoB+dSs44b7PvoJ5oPJlsMg3QdOJzPP
	HCFDY38JzUWYGrudFiWM/GRhUXK/
X-Google-Smtp-Source: AK7set8p9nj7Bqlw/gkdiEB6HptenghYiKjKpKITfN8xpPnqWjVNqcTjvwYixgAe84nH5AF5J3NqaA==
X-Received: by 2002:a17:90b:38d0:b0:237:24eb:99d8 with SMTP id nn16-20020a17090b38d000b0023724eb99d8mr24701999pjb.19.1678396111782;
        Thu, 09 Mar 2023 13:08:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf? ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902bf4200b001991d6c6c64sm82696pls.185.2023.03.09.13.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 13:08:31 -0800 (PST)
Message-ID: <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
Date: Thu, 9 Mar 2023 13:08:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 03/11] target/arm: Move aa32_max_features out of
 cpu_tcg.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PsWKz6auapV7

On 3/9/23 12:14, Fabiano Rosas wrote:
> In preparation to moving the cpu_tcg.c code into a 32-bit, tcg-only
> file, move the aa32_max_features function which is shared between
> 32/64/tcg/non-tcg into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 69 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 69 --------------------------------------------
>   2 files changed, 69 insertions(+), 69 deletions(-)

I'm not keen on this, as it's completely tcg.

Perhaps it would be better to let -cpu max devolve to aarch64_a57_initfn when tcg is not 
available (i.e. qtest_enabled())?  Move all of the tcg stuff out of aarch64_max_initfn 
into tcg/cpu64.c.

Thoughts?


r~
