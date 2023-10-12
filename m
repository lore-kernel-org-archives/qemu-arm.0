Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp848943ejc;
        Thu, 12 Oct 2023 07:25:17 -0700 (PDT)
X-Received: by 2002:a17:906:fe4a:b0:9ae:5120:5147 with SMTP id wz10-20020a170906fe4a00b009ae51205147mr26063696ejb.38.1697120717154;
        Thu, 12 Oct 2023 07:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697120717; cv=none;
        d=google.com; s=arc-20160816;
        b=Yr5EbMN8qOe2aWsu3eO75sZaXCIavOufoQ5fQWxs2Plt25axLYAiLb71zZ/UdQ5xL0
         UF4bbN91aVrMhtXqKs0+R3Vnv8s+BYmqxHQp/v7aj+fWs8x2mjCmMmtPPf4DXgR5ICp9
         wvAsFtt5mf2Wo4vsceAEmTJ5nyDv/baCAk0BzTLeJcKpxlJcxoqNjkqvFsM1cKAUITC3
         1R3QYQCFVA2XymEuKm5v3PzP78xil2EDRStIClW1FtRuQQGQKotOXSWYHIUguwzfybPy
         NBe26ZxYk9SWzGoMjqpHzmUAOATIXNR3Do19U5MM6gOK3MhJVods+egXMTbUNwkgocbf
         Hapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ayHr7M2SqhRkK+c7+qJ9CpIBrca7uy44Og56CYJfF2I=;
        fh=t1Ji07xgYgopWOgYSzd1++xm9ncTuyyBDwhGClNmAZ0=;
        b=DaeaaboIqdTvzWpxrPTJ+MeQjLmZASAu4g35fJyYYFPshseWfrOPRvUhzS5xa02gUa
         W4X9RjC/ssduQYnf4Zp+a3f0MpKR6mvW+tM6nZhtF9/2TppxC16iyd4Q/6JgCCg97lQW
         Hv8rMpWdMPWxbKxbFpc2vODDic4XCpOR9rozYSwaitM/wvRhLXLuC7toZedmu2ClD+Us
         F7/kDPGnlcFwyV9O74tsWn0DHL9xY7dHeZUEDBE1NLGODahiU9y9HWxiU7KP7iwGDxr9
         SHLrFrsjkkcvpyfv1Jl8/Nwe/CpfB+mdtiLeefSR6EgTokEefl4sjlVI4uuWVefJ9EKS
         WwXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRycbeGu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hy12-20020a1709068a6c00b009b2cc298a30sor6009892ejc.16.2023.10.12.07.25.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 07:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRycbeGu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697120717; x=1697725517; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayHr7M2SqhRkK+c7+qJ9CpIBrca7uy44Og56CYJfF2I=;
        b=lRycbeGum+p3EyS7Mmy4PdNd8zJs+eiqIuv4qRgTn2r82AJxY+xSkteVRatoyi/o0r
         XE76rb1C5j6ntKhQm+eHViqIQDYXnmUVKa5sNiDNCuedBWFDDnX39hG4MqdcbzwIT+4O
         E7wUxI77hHzG0jRDL4MWdrYOPU6n0MzWuzbI394pPPdQkvpV3EinvUB4Sx6kVnAmsZO2
         5Dx8xgrbLho6Y1PabdrPqFeT3cKwkWa8HVpuPonj9+/B3vCWuMskY1GFDhErT9DO6rsJ
         SCGoKQVQMNUDQIuPxOqO9VTd4LEbKSnpOyyn+9sFN329omBJGe9KFHJvg3a6plVSRd5J
         UdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697120717; x=1697725517;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayHr7M2SqhRkK+c7+qJ9CpIBrca7uy44Og56CYJfF2I=;
        b=V8uaVgkj7rkb8JEx5HI5Fc5TkfdI3Me8oWA3wSj3mp+pJgJIBwdeu46lTVy4c9/lMP
         mAFQZnTf/o9CdjyH1e30QS3ixw5wgoxzpEfPYZZk5OILZDixeV7Efht5U6ifoAAgE+am
         GVTm8ghJ66nJWJg/lPSVqc2KM332E/nACtjiemg2frfIhj5kuw376Rx5GFj8GzqFJ/Js
         34nlbwozzOBsbXUKUSpD050O2htBCpIcScaL8678Z22M7GljsIZCFIlp4wcGqd6cPrRC
         9ICwt0ajBHvtXOmJTd8q3K8FJif0L1beNAMzFton290SxtYh4uoc5ezdsGAJ74cGD0uF
         KKrg==
X-Gm-Message-State: AOJu0Yx2tS17aAiGiqrXh/I4cJq30s4FUJW+bmlWx1f5G7mCljS81fJ2
	WtYCxz7NTZXOMSVLS0ky3+lk3De1
X-Google-Smtp-Source: AGHT+IHZydKIz2f99qcBZfP3bggM5qD3G0stgljuURvy6khlmjofQkKMaW134wTembTj//YLypYMeA==
X-Received: by 2002:a17:906:2250:b0:9ae:69c4:5b4f with SMTP id 16-20020a170906225000b009ae69c45b4fmr23565313ejr.19.1697120716797;
        Thu, 12 Oct 2023 07:25:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id a24-20020a170906685800b009828e26e519sm11081999ejs.122.2023.10.12.07.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:25:16 -0700 (PDT)
Message-ID: <1d47574e-cc05-a087-f674-0644430a4682@linaro.org>
Date: Thu, 12 Oct 2023 16:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] hw/char/pl011: Extract pl011_write_txdata() from
 pl011_write()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-7-philmd@linaro.org>
 <49918fad-56fc-150e-bb9c-bd00dc67df05@linaro.org>
 <39fb2593-2184-560b-3d67-51f9203f078a@linaro.org>
In-Reply-To: <39fb2593-2184-560b-3d67-51f9203f078a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t/Iof0NMEZr/

On 12/10/23 15:07, Philippe Mathieu-Daudé wrote:
> On 14/7/23 08:58, Richard Henderson wrote:
>> On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
>>> +static void pl011_write_txdata(PL011State *s, const uint8_t *buf, 
>>> int length)
>>> +{
>>> +    /* ??? Check if transmitter is enabled.  */
>>> +
>>> +    /* XXX this blocks entire thread. Rewrite to use
>>> +     * qemu_chr_fe_write and background I/O callbacks */
>>> +    qemu_chr_fe_write_all(&s->chr, buf, 1);
>>
>> Not using length?
> 
> This is a simple "code extract" patch. Length is used when
> we switch to FIFO in the last patch.

Hmm you are right it isn't used...

The UARTDR register is 16-bit wide. Only 8 bits are used for data.
No need for a 'length' param here.
