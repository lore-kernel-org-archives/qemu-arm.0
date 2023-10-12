Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp547309ejc;
        Wed, 11 Oct 2023 21:33:25 -0700 (PDT)
X-Received: by 2002:a05:6512:1189:b0:4f8:75cf:fdd7 with SMTP id g9-20020a056512118900b004f875cffdd7mr23415987lfr.22.1697085205412;
        Wed, 11 Oct 2023 21:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697085205; cv=none;
        d=google.com; s=arc-20160816;
        b=Qah49Le3UuQo6TrBdSXcAXjZCoJKou5l4XU53BZScslzs4yn11HiJ5d9oVUsDmmbY3
         7VEVFvZ2QGzYzIYJWin6jB+N06n8ekAnWy3WpzRamUkQurDQMpfGswJNOnIvZYWYpAq5
         BM1YXEqcFPNfpchKH4Gffvum9pBeiW2uvkJhKByocDEklHBjHb0pibDSbY0Fl+VtUKag
         pKIsbSD/Av+zt2W8CUcMi2tFVH5ZT950vQgX2dLyckd4ynDzuDHe0/vYu+Yyf3ZakkhK
         OR3YuzNHTiz0vot7kElPdZjEig+TNxU5Tq1/AxQpGAF/CfC78XlSISaxTIizJEDW9l7i
         tlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ykmK7ohMq+bsd07Y3RHClvJewDe3d3C6tAcWqJt2J8A=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=z0310e7XLxufcS8MlldIHsC3oFDHrcR3oxVRnp9wbCYijCThtcmSCAIkD/WrNf4DDL
         wpqJDLPxkQVrstocT06mqSz7ydgbS9P7XqqmH6PJt/Ol1n4iYprI5VI74IutNo/C9OGL
         39fEjjtp73piNd8zkzlFXu281pPz77yDOW90nmvGVWrFIV3XFGi6g6jfMSygd/0zLWTn
         kS83lA5BmMiScOais5iB/U/4y2aj7k7YfuQvChg/S4rnS2iKbg6sDCFEZEHSK2TMpBlL
         f5SX/QcmgE/9S+RcHS+dxqm2xtPgsEgOOSYX1/7dkeWWsbNmIdDv3M7DwsiRy4UXbsVu
         LuIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W33SGkfa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3-20020a50cd83000000b0053128aac724sor5169758edi.7.2023.10.11.21.33.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W33SGkfa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697085205; x=1697690005; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykmK7ohMq+bsd07Y3RHClvJewDe3d3C6tAcWqJt2J8A=;
        b=W33SGkfaaW9pVL7iVBey3WAn+edyly6NlfU0t7rawmcT4xcFQ5LxAEJSJ61skp7z9g
         uftT/yhcV55U2impRIZu4PJDo5DN0faxBVRY5tyrcJJ7QRzNM/Ppv/tRX36OlNagAuGX
         IoTXBV0bi1wnqi978igx8yqOYGlWTZ7pURZTGgDmzGzJ7P/WI3Vps/vhK3a9brKBxZrO
         Q7j2us245Af95s5ONUU8k8DGOoOSy2Dy4Q5g1OGedlxrtwHUE3EvLSCns40rz+szc+4g
         fFBO50AVnpOJEN/ltzw5hj6Sk0hfGUMyxoJCL+ocBSOy1b/WAdGKYmxYhxg09JOBFZ5t
         ZZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697085205; x=1697690005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykmK7ohMq+bsd07Y3RHClvJewDe3d3C6tAcWqJt2J8A=;
        b=UlzU/iFUAwpQZBcAXJX8rRHesieK68FlOBEqmTGSyZ0JQpqmdzlLsWxqStPTWdwMn3
         4Vmdxh9DWk1ege+zzKAWnwL2t6C/BCXiKjrPGO5aijBu0kpo8h8Xu7aM792GJuZucv2J
         AEpWCpLf96yXGMyixYD7CWvKRcaUsjtQV4wcvQlD+OC7MATAB088QBnRe3Bf8jMyfd61
         oX5nztnIohGgtPazTlknPXCaJeys+8YbToNuS8qs0T7HB7wJ45JOCVplpgassOSqzbDH
         4LQ9wlbCmVg9LmZgNoN5pw8zLnWd+gwLgteXgi2lDeWivE22ht+56rs0AQzxrd7ASyqa
         3+2w==
X-Gm-Message-State: AOJu0YyMfOFulkADDrgtUDjys5NurEq/qDeZb8BZpQT+97TIf+ulT8QS
	dX80YMbsx4DSEyBhk+5CaHg3H7G5
X-Google-Smtp-Source: AGHT+IFKmQp0XKFTqDmIDwyLA84oj/3DnplzTquPg0r2ubTsYh8FGeUu27UQ9VLRgZYJeYm/QV99tg==
X-Received: by 2002:a05:6402:1641:b0:533:87c9:4a81 with SMTP id s1-20020a056402164100b0053387c94a81mr20229604edx.29.1697085205042;
        Wed, 11 Oct 2023 21:33:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402089400b005330e1e7da0sm9520565edy.92.2023.10.11.21.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:33:23 -0700 (PDT)
Message-ID: <d4814468-3b1c-ea34-563e-9418bf1d6220@linaro.org>
Date: Thu, 12 Oct 2023 06:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 03/12] gunyah: Basic support
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-4-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-4-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VoWSZ4E5bj40

Hi Srivatsa,

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Add a new accelerator, gunyah, with basic functionality of creating a
> VM. Subsequent patches will add support for other functions required to
> run a VM.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   MAINTAINERS                     |   7 +++
>   accel/Kconfig                   |   3 +
>   accel/gunyah/gunyah-accel-ops.c | 102 ++++++++++++++++++++++++++++++++
>   accel/gunyah/gunyah-all.c       |  70 ++++++++++++++++++++++
>   accel/gunyah/meson.build        |   7 +++
>   accel/meson.build               |   1 +
>   accel/stubs/gunyah-stub.c       |  13 ++++
>   accel/stubs/meson.build         |   1 +
>   docs/about/build-platforms.rst  |   2 +-
>   hw/arm/virt.c                   |   3 +
>   include/sysemu/gunyah.h         |  43 ++++++++++++++
>   include/sysemu/gunyah_int.h     |  27 +++++++++
>   meson.build                     |   9 +++
>   meson_options.txt               |   2 +
>   scripts/meson-buildoptions.sh   |   3 +
>   target/arm/cpu64.c              |   5 +-
>   16 files changed, 295 insertions(+), 3 deletions(-)
>   create mode 100644 accel/gunyah/gunyah-accel-ops.c
>   create mode 100644 accel/gunyah/gunyah-all.c
>   create mode 100644 accel/gunyah/meson.build
>   create mode 100644 accel/stubs/gunyah-stub.c
>   create mode 100644 include/sysemu/gunyah.h
>   create mode 100644 include/sysemu/gunyah_int.h

Can we move gunyah_int.h to accel/gunyah/?
