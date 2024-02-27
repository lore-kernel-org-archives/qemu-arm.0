Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2545791ejf;
        Tue, 27 Feb 2024 00:48:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVK/rKp8tCdityHREdWeSwmrVGE2wHLUIO1gSynJ9R0Yexhz5kbL9N5BCGpG7fsJFju3a25xFjdN3frBZjjxr5CfUfbT1Sy
X-Google-Smtp-Source: AGHT+IH+2/MOVV3+r0XsKxrfF8C0ajsa1VPhzOL5+jm6iqKRTqBaCs8f26Xe1bpXWS3FKIECr1hG
X-Received: by 2002:a05:620a:1595:b0:785:c9d1:547d with SMTP id d21-20020a05620a159500b00785c9d1547dmr1380978qkk.78.1709023711031;
        Tue, 27 Feb 2024 00:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023711; cv=none;
        d=google.com; s=arc-20160816;
        b=NawxgLh8eU9oxPvS+CbDLma7s+FT5f0uXlDT11+o6puzo42Hmigl19AFEAzvxnPMph
         AOg6YzDb+BgXZWsg6k0pXiL1TgC79zlKAMM1s3PCiYb7aSP35fdpc33lyEiSNcUKTPJg
         uv9CJuRrXtYHsGBg60mqQ1NbtjBSYOpcIL7Q1uieUQOa6fVuJ9sed81QXioZv1pTR8Ag
         sh/x98WGHjVRZCrwakh6ufKJljm88FpF6FXNU8ZjDkBewjossY/eaeW5DJMN7xKQ123M
         Dbn8xZsHBvkjEyExPJ0OLKNWabb/Aezk5K60nCd/THFbdi2MoPHuHlMTA48xaOePSJfS
         JUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Zi9hv8WXmOlU9cQPuWAqhoQd705Xi0sNArKoJ6BuDYw=;
        fh=m/3FC3IR9/7pHAdUZKEZG2NcwwNFE+SfbEKtOJmfFTY=;
        b=BseCrze8E826r/AUYb07nPQQy78FXY8mDAtFdM3Q8nd6nNGcqF/vNcqOSw9r8W/bMV
         7WSQK+I33KbuarRcPzFxvQ6nMo37VGSCQIoq5mezWWcvmElsKtY+fHX+LIDeoPTd76BS
         8oxl1KxYraETOb9E3WjwmBdw1+HRD6/XMGhFZFlyI6uLWWC4d9E96gkQs9hWWzFsVqVO
         3MPFRiBrVsEr03Ns2B1iu8dj0pSFe2+6WVJ9nzfIxKaO9/Cs8+CMFkNRXL7NlKMQRP1+
         5qZs7G6/CNZ1cDPMSc0fSzQyeH0SHVqZnWvpgHwvSN34DIBmwvIIT2RZ0yGDDUD8rIht
         pr+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEsUEdu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020a05620a20d000b00787281f8a9esi6975367qka.653.2024.02.27.00.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:48:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEsUEdu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret6A-00049b-GB; Tue, 27 Feb 2024 03:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret5Z-0003ho-PJ
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:45:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret5L-00019g-5t
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:45:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so2998477f8f.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023509; x=1709628309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zi9hv8WXmOlU9cQPuWAqhoQd705Xi0sNArKoJ6BuDYw=;
 b=eEsUEdu1zJYzUdKTpoADieUgoQMdOY5tvTUbyEedq3EQSEAl+CHhdRCYhJVR7gBIIS
 s/mSg2cKaUUYiOW4ZppY4kRGd6R+MeO4isXS60VR2AUN8P7J7NPZi4KmoJ25brcfOThc
 Zi9kCnhuuRWJOcb/HrxNlfNiefQ2Qqr4qS766jqAiXWHHXBe4Cwghw9hdISEPexYgv/K
 M1ep4rZfYY6NxdYZsTG0OfrNe9p1kPvsXO0xuGwKz/uVnsWW0r4RstVzS6K+MvLQ6kZF
 r5nqAj8fk6db1PThZevo2eTB3jwqcsH1tAwFBuefH9lutuIb5iEsdV0R3wc02azGlski
 eGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023509; x=1709628309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zi9hv8WXmOlU9cQPuWAqhoQd705Xi0sNArKoJ6BuDYw=;
 b=HaTTvXHMupM1QKdhSIL1nIZuJ+HBYIaNR1GB8kIR4t07EDo1N91NT9e9J0nn3GlLid
 /ecMEWn2MtjMa8yaPH1WNyMOeHM+un1VYzaG4eGz9eemnsvRmgP071UV/2VM7D2/50hv
 G03MwnfS3or+u8JzigyBlgmP+inmLLcVSG5FTiV1cRIrDOCuzCfn+cQT+5wkNhoXY2BW
 saFNWf1keyGf1mU8e+nROlTeUhI00AmFk7jv3bNvQVCgryNLc3PBFBItec3qGZzUTroK
 gsaYYJaPNRrKeV0vJ9NKpSSe9VfNFDNvInxZ/UKtyBqauCLUwbBvEx7wnCSyZjSxQOkE
 G2xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWixPnl8jfr7RW+QUJ3VGnVljaT7NoRSJTlYF4cCVyCKf1zJXmLDC5Ihpe77nWbNN8A5u53+6VLkdSszToZNqVMLpaf
X-Gm-Message-State: AOJu0YweRTqElSw08MsRM6Q5JgkQE3oq6yISqBI+oFJB0JRQyZEoK6cl
 SWLWUmPKHDf1tgtwx/nT2izMFZ2xg92Y+HzgHOsXN+klMdYS+27zk9f9lb2FyK8=
X-Received: by 2002:a5d:4610:0:b0:33d:855b:78f9 with SMTP id
 t16-20020a5d4610000000b0033d855b78f9mr6250432wrq.41.1709023509451; 
 Tue, 27 Feb 2024 00:45:09 -0800 (PST)
Received: from [192.168.69.100] (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d5702000000b0033ce5b3390esm10646267wrv.38.2024.02.27.00.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:45:09 -0800 (PST)
Message-ID: <0312eaa8-ed9b-4c4a-a846-42b4ed307d52@linaro.org>
Date: Tue, 27 Feb 2024 09:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/41] Split out common part of BCM283X classes
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-2-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226000259.2752893-2-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F5PYFkLsTznz

On 26/2/24 01:02, Sergey Kambalin wrote:
> Pre setup for BCM2838 introduction
> 
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/bcm2836.c         | 103 ++++++++++++++++++++++-----------------
>   hw/arm/raspi.c           |   2 +-
>   include/hw/arm/bcm2836.h |  26 +++++++++-
>   3 files changed, 84 insertions(+), 47 deletions(-)


> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 6f90cabfa3..5a6717ca91 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -17,8 +17,10 @@
>   #include "target/arm/cpu.h"
>   #include "qom/object.h"
>   
> +#define TYPE_BCM283X_BASE "bcm283x-base"

Note for eventual future cleanup, we usually name this "common".

> +OBJECT_DECLARE_TYPE(BCM283XBaseState, BCM283XBaseClass, BCM283X_BASE)
>   #define TYPE_BCM283X "bcm283x"
> -OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
> +OBJECT_DECLARE_SIMPLE_TYPE(BCM283XState, BCM283X)
>   
>   #define BCM283X_NCPUS 4
>   
> @@ -30,7 +32,7 @@ OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
>   #define TYPE_BCM2836 "bcm2836"
>   #define TYPE_BCM2837 "bcm2837"
>   
> -struct BCM283XState {
> +struct BCM283XBaseState {
>       /*< private >*/
>       DeviceState parent_obj;
>       /*< public >*/
> @@ -41,7 +43,27 @@ struct BCM283XState {
>           ARMCPU core;
>       } cpu[BCM283X_NCPUS];
>       BCM2836ControlState control;
> +};
> +
> +struct BCM283XBaseClass {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/

Also we don't use these private/public comment anymore.

> +    const char *name;
> +    const char *cpu_type;
> +    unsigned core_count;
> +    hwaddr peri_base; /* Peripheral base address seen by the CPU */
> +    hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
> +    int clusterid;
> +};
> +
> +struct BCM283XState {
> +    /*< private >*/
> +    BCM283XBaseState parent_obj;
> +    /*< public >*/

Ditto.

>       BCM2835PeripheralState peripherals;
>   };
>   
> +bool bcm283x_common_realize(DeviceState *dev, Error **errp);

Amusingly you name the realize handler 'common'.

>   #endif /* BCM2836_H */

