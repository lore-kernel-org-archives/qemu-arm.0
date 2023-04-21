Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1322353ejm;
        Fri, 21 Apr 2023 10:56:20 -0700 (PDT)
X-Received: by 2002:a7b:cbd9:0:b0:3f1:94fe:65e2 with SMTP id n25-20020a7bcbd9000000b003f194fe65e2mr1852845wmi.33.1682099780481;
        Fri, 21 Apr 2023 10:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682099780; cv=none;
        d=google.com; s=arc-20160816;
        b=BudgV5iQ6ubWcaefUN8/S3bmi695Ftk3UZYKO5VqFZKerCsuZ4N5as5eRIkPX86rQo
         5Vv6INFZIG0NAtj4A6T7KUcSRoWm7Hu8DlrnigQ/yM8Z6GQ37Mz5LTJ9JOz140iU7qNN
         oAdNAJXIl2+GN3KyF/hz8fmWuBVd/e9fal5SeWBE/kzeNOHHkW6NUdUe9R4e+RQUbzZx
         qCkpoi9nB/bWCvZvrGaplCFx+twqY2lluZIRlU2QKHf30/zZzwnKD6Wi+BKTXMGKHoR4
         Lm6E8T3SGwMIZ7FxhljcE/7/Q8c3pHCMbq2b5CAN7kTz26bsWrcyWKUTTDtQPnh2AZGX
         adqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7tW9fz4SHdNW5EMnlP29hh5sbkPuziVWHGpeYQEpi24=;
        b=g+BzEO23PXbZuT5UTV9mBvPBbFE46zAaIbIiyeM4mVNe8Nm7VzZijlSSVvooBlUCkL
         1eY+SxSDCw8UQ3IjcaN+PY3MAc6G/n3gkSh7L1vPqOhR+TbcM7eyP03GxxnEKK1njM8q
         nilgbuZnIaeA/OBvd0eQD18YiGXGCPaXdv9NDLh17C0+J7LeC+o4u6uYUhhPgkI/bHsr
         8NrCT8vOqIH/X+vCFMbYT5a2d1YUVXWpaurITX1h9r0RGRU0GgtZAEyYC9Fjs3zqtVRi
         msB14nAr+LBs8Quu0Ao1kDOGi2InE7CcWVufH3UNHsGB6uEzNtlLrGKBFvlzFL5FStpj
         2aMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXNBuv6f;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n3-20020a5d4203000000b002ff586c7591sor2200482wrq.34.2023.04.21.10.56.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 10:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXNBuv6f;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682099780; x=1684691780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tW9fz4SHdNW5EMnlP29hh5sbkPuziVWHGpeYQEpi24=;
        b=dXNBuv6fHtXmkuUmN4BiXxOnKN/xAwllmC/FTd/ogRkFL+8vsMtvXNJwzBfM5ppZ+4
         g50exut08WD2FE4FhrlZor/kSG4u2fl73R7sCQ7IJS0n7oDvM5cU4kEfbX3wNqVDiPwj
         gsIF53X3U2IWpnr3b17OsKBQCVZX2Caw8q4PeU7xqz04uUA8QufnD4flthH0VTcT8Qi3
         mJCbuBx/14nxN3TFYNDE246gb3PylIMXYUP6Vyijnx/ibu/9azr9iIc32yAbpd55ryTS
         PGzEBiLw4Yxf/3fcq0W31p3094qxW+zBU1Bwe2clsGJrmw5Egb+hAn6Tdp7zrDMaXTGi
         DpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099780; x=1684691780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tW9fz4SHdNW5EMnlP29hh5sbkPuziVWHGpeYQEpi24=;
        b=hXNRXa7jbxoZJbPmzfISCQ8n8T5IbcQp7qE77Tbqp5imVlMNl5czoyXDtqSTiPOcuZ
         //VJJPqaIUVB657kLe/nK52ZTaWTgf0i3Cn6iSFpGk+LIXXVAbVUEv4MJ7F2K1akE6EY
         a9HH8+rEKPT+W39zgs6adbkDb3rzJpywaXC24tQ6hQ7jyMRR6kmG2yTIyJ5gCgK4EoAm
         fWLkQ9FuUMVfjp2bi03wXnWV9mSfW2ORO9zxrP9P4e/NZZ6Wa2lxGO7qKdJG2JjhTa7U
         OckL4RBk7JhnIFLp8wJFAw/wvunAk9OgskUjQ3PcmTyh+CUTEuv3bDhHQJqOZawb3W2U
         SXdg==
X-Gm-Message-State: AAQBX9foWo93et4lyL3NgF69TGGKpFQUaS0L5OM/i3DRvowF+RIR/vQo
	qC14AmrlA/I/1FG6Qfjj+6vjm93V
X-Google-Smtp-Source: AKy350bw99qzQIzssf/Gg2cY0oB5uotyekjsRIMa9mFNcmHDicUZLID0xyQi9yGhO2xrcBnhVl6lAw==
X-Received: by 2002:a05:6000:152:b0:2fb:283a:1751 with SMTP id r18-20020a056000015200b002fb283a1751mr4255788wrx.15.1682099780113;
        Fri, 21 Apr 2023 10:56:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id g18-20020adff3d2000000b002fb2782219esm4930017wrp.3.2023.04.21.10.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:56:19 -0700 (PDT)
Message-ID: <36cc0233-f6b3-7805-1840-cd31ce5cf7a0@linaro.org>
Date: Fri, 21 Apr 2023 19:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a
 function
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-4-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H6jpsf6iF/VM

On 12/4/23 14:18, Fabiano Rosas wrote:
> Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
> -cpu max configuration. We'll need that to be able to restrict this
> code to a TCG-only config in the next patches.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
