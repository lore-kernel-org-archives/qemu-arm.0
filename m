Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1901081ejt;
        Tue, 28 Nov 2023 06:02:53 -0800 (PST)
X-Received: by 2002:a05:6871:799d:b0:1f4:d347:df06 with SMTP id pb29-20020a056871799d00b001f4d347df06mr18018507oac.29.1701180172867;
        Tue, 28 Nov 2023 06:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180172; cv=none;
        d=google.com; s=arc-20160816;
        b=BpshQ79Db+TObLqLrjaDLC0zw+Mec9tbeFRbF6QPlbJkavYS81XRtbTWOKlwhCVJHf
         KdeZyECkrC8FdP7UqdGxY4v7ZkP/+IqKTOrlrNVamUe1ewg9dK0TiErF85yapVZXF/Kz
         OjJh2cx8c7zIWP1+V652MeL+9QTBeaDeWvOKnui7zOeJrnXBNoi+WDIKwuQKnnfAB0bz
         pqMmCpWAIxZUNBK3fRKHXEMKQt5GK6rfBgMVg0fLeaiBiSlqIT+5srQD8FTDoJQzMhKf
         /mAkbl/aTcY5gIKeX9e6u1aZOQx9eAECeyU7PPZxS+Yjr9EuWXjD17tsgtU9KlkXlOO4
         CDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dec8iRgzEDFu7HMeARR9V8WSMJQftG6WNb8g4wP73b4=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=NBXl7XQCISViJFR1mQ6CRc6famU34RCVp9bPJpNbqJyz8BiLRB6bTYM9Etf0ff/WWy
         rLjenuIuZmzrLdbcgyxTQyStXwG2vqxWZvrf7k6mk8dILqothCilp2KUM1FMVQlUNoBl
         OQz7cQcbc81PuDoA9WHMJgErHR+f4+n1efGMoMnSrlN1tFqXcZQE32CpqnhdRu81Ywsj
         u1Zf+LQNaHy0/O5IhKBcL1NBfa/dMj4ZVYb+plrO5LHdGiLtXWJptaG24vfBS0omRx6b
         6Y3fKRxJ7og4YF5tIyJ5WFlDOWJmX9BQuNa/ZdJpIp9eGu+bHZ4FQP3Vm3k0IoEpbnUb
         uEow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrYmpgrf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dv13-20020a0568716e8d00b001e14ed31e63sor4186788oac.2.2023.11.28.06.02.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrYmpgrf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180172; x=1701784972; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dec8iRgzEDFu7HMeARR9V8WSMJQftG6WNb8g4wP73b4=;
        b=SrYmpgrfZqsuO5rVmaCaC7sB6n1DZNNm2cNALc4cZv6OMTK+whDdATEALBqEEXyPxe
         XzgaGvIbjaC6++DQ2r8iTuPTpRIYORd+ktYEb01m6xGckpPdBz0ff9IMPL4Gq7SSpYJu
         6ahHb8onFiAOWg+JFG8oe0Mt+W46xEMRVemP4X/u9dK7B0MXy2tjh3ovNPxNEjgPVopo
         Inh2IocQlIj/2Dbt1XUCmQl2rMycuXvJkg2+Psa95lmgZr5W1wDP83CHRhL3kNV92JEr
         pt+xO4HdHs1I4Ohxx3xid+QUP1xMbSWAHbsaI92o7gDslu9zSp7yMeoSwks/lCjHLmGa
         yLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180172; x=1701784972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dec8iRgzEDFu7HMeARR9V8WSMJQftG6WNb8g4wP73b4=;
        b=Ak1eksSMuH4DPx7yYcg8LS6J5s7LDtjiKz12Ip3GRk5SdPREOkPpW7vhbxs3wU59gq
         UeTxgrvgsQeKnJq00XLqEo/B3k3eIhl7EvPwCugsho3kEYsemNN9Fgmw52f5rLkddGmS
         Zq+XBzDlEhhkzu0g4WqYBMKTCEelHZmHP+BOxmVsdhzVhyG674NXV0axASrU6dUMkxYa
         wZiTqUPj57GMd7B1v4ZE6AzSun7fq3VPB8VXLoEInDn4DOHQdkrNmRJLsJ/uyKmW/I7L
         2RSu6TQOGlqq53R6muEZY6xXHyBtJ4okyiPsbjfKnaitPI5JLY86uD6m+kMzKrf3HIO6
         EUKw==
X-Gm-Message-State: AOJu0YwTfCbwFl6/eAOUudqhVeUTT2XtcqfouMzjWVhXGDAGcDEIkK1J
	dF6tLCv3eMiv5n5fiGQj+tYjss9j
X-Google-Smtp-Source: AGHT+IGyHpa6zzVI1Dhk0/OKElxnYt3uPc/JtVQNSVfQWa4BvYN1oUz123krcf0Atey1HQVQgxfEyA==
X-Received: by 2002:a05:6870:a70b:b0:1fa:14a2:d3b2 with SMTP id g11-20020a056870a70b00b001fa14a2d3b2mr16120417oam.55.1701180172466;
        Tue, 28 Nov 2023 06:02:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id ny13-20020a056871750d00b001fa1350df8esm2068309oac.2.2023.11.28.06.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:02:52 -0800 (PST)
Message-ID: <74fee177-71d9-4303-9692-b4a496047a03@linaro.org>
Date: Tue, 28 Nov 2023 08:02:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/11] target/arm: Move GTIMER definitions to
 'cpu-defs.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g9Z6tt28ZWUW

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> To allow GTIMER_* definitions to be used by non-ARM specific
> hardware models, move them to a new target agnostic "cpu-defs.h"
> header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu-defs.h | 19 +++++++++++++++++++
>   target/arm/cpu.h      |  8 +-------
>   hw/arm/bcm2836.c      |  1 +
>   3 files changed, 21 insertions(+), 7 deletions(-)
>   create mode 100644 target/arm/cpu-defs.h
> 
> diff --git a/target/arm/cpu-defs.h b/target/arm/cpu-defs.h
> new file mode 100644
> index 0000000000..1ad76aff14
> --- /dev/null
> +++ b/target/arm/cpu-defs.h
> @@ -0,0 +1,19 @@
> +/*
> + * ARM "target agnostic" CPU definitions
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +#ifndef ARM_CPU_DEFS_H
> +#define ARM_CPU_DEFS_H
> +
> +#define GTIMER_PHYS     0
> +#define GTIMER_VIRT     1
> +#define GTIMER_HYP      2
> +#define GTIMER_SEC      3
> +#define GTIMER_HYPVIRT  4
> +#define NUM_GTIMERS     5
> +
> +#endif

Hmm.  cpu-defs.h is pretty generic.
Without looking forward in the patch series, perhaps better as gtimer.h?

Is hw/arm/bcm2836.c really "non-arm-specific"?  Or did you mean "non-ARMCPU-specific"?


r~
