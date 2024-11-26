Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp278219njb;
        Tue, 26 Nov 2024 10:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCbdf7TCDsbfzA66QdeSVyODiub10ZAAiFpVhUj7pNTMv+iVRp6zD+Hq5eeS2c2uwAYiGFGx66C1kmqw==@linaro.org
X-Received: by 2002:a17:90b:3c48:b0:2ea:8aac:6ac8 with SMTP id 98e67ed59e1d1-2ee08eb5df7mr371019a91.13.1732645868830;
        Tue, 26 Nov 2024 10:31:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732645868; cv=none;
        d=google.com; s=arc-20240605;
        b=d0JVNSh+x88ncHskKDB7VvVYxqj/FGAxvchl4llbLO4N1ub10e9SIbkKzOGP4NNSqR
         kwQ/yGeLiEW6nqpPATKaUiDj8rE/Bz9rqWbyQO601HNC5ISDqA3t0wv/Ysxra6Oc02Ny
         xcQo8yQIA/3wV3m3wqMUEIVOG01XyOnFriG+Lp/bXC58ZOIYbYJcu4A8dzPBA5YV5k8T
         hUD6buPbt3t12xwL4o8lNQipmsrNPycgLZVQSepnWk36jj31irj+/RklvVwXRJyHhIYH
         0/B3uADomp734EOybnrJN3VMUw6EHi5JUQWxFswWDwjah8EpzMeAXfIMm9ovt1pqCKnm
         qDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+6ZaJ7dt7R/g+nKGnFSXP7pvbKBHN9lmThzElkpxBi0=;
        fh=xxVj0KrHLOiusZMvhgbRXbY4ugwt77CigXuB3BgkZqg=;
        b=Ddz34QRCHCd9+kQeM/K+FnluODZus3VpaSP3Yc2dHbsyKVlISwsiNd/HBZMezdTBkQ
         qe/u7x8tiWWCXEF3gNIn4nRjYBuhw2u3XI36Zcqp965mUgkoljH1it1x3GmAr44QNeO3
         9URrHyHo+jXEJY4oQXhx5E7jnFDT3+b+TgKcNnqEAnbLb06k6namrHzS8ZrYRlH5ZkCH
         hZJ0S8ueLDXAH1QeRXQXyK1bLDXmMvwMLCi4cT30IaBEbHCQPLfvlBk2RgiyPx5twEhJ
         mxO0znD+umDRKRx9FECcruBrVs3LEDfrGSftxNVtG7M+Ka0FX+GIUzPOThnrldDkW72b
         szSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQZZNJWY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dc5e647sor65642985ad.1.2024.11.26.10.31.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 10:31:08 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQZZNJWY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732645868; x=1733250668; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6ZaJ7dt7R/g+nKGnFSXP7pvbKBHN9lmThzElkpxBi0=;
        b=ZQZZNJWY5VgmD1qpa7bo9X9knWCwducOUAjOSnkECA505vyBCflnmo1ybAr54ahdIq
         p36Mapm1i/mDMNv5zDBp2MNPrtbO4rtmDUQMy9wODdkaPibMXxVVvUy1jv5r2X2/vhCD
         z41O5drg55HUgyVolqXUXaKa8dVITwLWlx5eKXfrnuhO7yhuYN5PQlLqgnIUx/PFcYm0
         0J7/6ItreVDh0WhDIaIWsfh14G9X1eqzpplLjJcRHKMvHGTdQzrZnkXDc+p4o7APcWJa
         jjzp4a3wooZnY+yMb1t9z6RSrbNmbrnq7gutUkd9AgnS29tki4AeDECOoqbTlv61MoEo
         YCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645868; x=1733250668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6ZaJ7dt7R/g+nKGnFSXP7pvbKBHN9lmThzElkpxBi0=;
        b=vz96HVoCWMFEllMuFzSES8pf+fC8orznJPGMG9y14nFW30fiVnFRMFIRCvhEP3ijQJ
         tiorEpAzTpBpGR8uku8BOV+Un+WyWQFGLqHO9iq6Mq5F03OlS0N4AxrYOD0Hop212Ogx
         4DUxX8gavuoIKrCapLQLtHgU13sd8+ufV5gDTm8UPiSbPLRkwUzCU9Jlw/iWRM2gwRGP
         f+Cp6kRozO2F8tnWOXcepCUD7SvG2TwRMZf1d9362S0JLvoGPOtZZBhkizbob9nAUPN1
         IePmrZJYxcfnVxcT67DnLCd418UPmLDtY+NMgMjGbxPlnJdMlyMjuXlMRSPsS/zSwcv4
         70pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbQcUYFlYBobubV2JvEIRKdm1tyLBykueH/IAll8p31DWCvoPdOg/1IqTTfIKKuWmJ8hvRsJ8vL3rYqg==@linaro.org
X-Gm-Message-State: AOJu0Yyp6vtpckVMozpb6onYnU5dMyZ1JX/iD6w1zY+JPjHG85zen9/j
	YJjOOQiWFyjcMa1pxM2rOpZIbKUTjvDpPfVozrTBSnNlPa2adD2dpJbx5PoImMqg+g==
X-Gm-Gg: ASbGncsMppc7cUh5Mn9lMgS+ksooxlkGgj4a2X47+wB/gtV6SqKkGCEwYqOAcCBi136
	3H1huzZTkxIPyR2h1t6QS8kgNCTroFSI1CJWJWVqRPnACOz74IOeB1MjWoD9MJuv83KdklB8EKZ
	CDjUOYvLTjpTIQMR5ro2SsGyMvdUStNlUQI+XEuAs6xjxSqfcX7oMJ8MdB7yyWfCbaQJEd69q4A
	cj02h+FiORHRNcGnDxRQDCQS7oKURjMwncVg+ChVf2a5SgisRCWM/oWlpjoCtbM9cmcpA0knum0
	Q9pdQ20YUTG9G69Aty+NXA==
X-Google-Smtp-Source: AGHT+IH3i2elc/feDQWrCukhSHeIyxmuSz1JMpLqGYQdrfU2ufUUoCbJLJW3PbiWYuHr/hUM9g5RcA==
X-Received: by 2002:a17:90a:d647:b0:2ea:a737:60ab with SMTP id 98e67ed59e1d1-2ee08eb5c26mr516738a91.12.1732645866793;
        Tue, 26 Nov 2024 10:31:06 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead02ea3ddsm12753102a91.3.2024.11.26.10.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 10:31:06 -0800 (PST)
Message-ID: <c29584a0-527e-455d-bd3f-001b4e2ce765@linaro.org>
Date: Tue, 26 Nov 2024 10:31:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Minor fixes for Arm documentation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <CAFEAcA907AJ_x73wG83HYk1xyMksx7ij2TpLpOaVKgrOffA6og@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA907AJ_x73wG83HYk1xyMksx7ij2TpLpOaVKgrOffA6og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DyHIZdlvHivU

On 11/26/24 08:24, Peter Maydell wrote:
> On Fri, 22 Nov 2024 at 22:52, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Reviewed following things:
>> - system/arm/cpu-features (options)
>> - system/arm/virt (options)
>> - boards documented and listed with -machine help (arm and aarch64)
>> - grep object_class_property_set_description hw/arm: ensure all options are
>>    documented
>> - reviewed boards description
>> - reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/
>>
>> The Arm section of the documentation is in very good shape, and this series only
>> has minors fixes.
>>
>> Pierrick Bouvier (12):
>>    docs/system/arm/emulation: mention armv9
>>    docs/system/arm/emulation: fix typo in feature name
>>    docs/system/arm/emulation: add FEAT_SSBS2
>>    target/arm/tcg/: fix typo in FEAT name
>>    docs/system/arm/: add FEAT_MTE_ASYNC
>>    docs/system/arm/: add FEAT_DoubleLock
>>    docs/system/arm/fby35: update link to product page
>>    docs/system/arm/orangepi: update links
>>    docs/system/arm/fby35: document execute-in-place property
>>    docs/system/arm/xlnx-versal-virt: document ospi-flash property
>>    docs/system/arm/virt: document missing properties
>>    docs/system/arm/aspeed: add missing model supermicrox11spi-bmc
> 
> I have taken the reviewed ones of these (1-7 and 12)
> so I can put them in for rc2.
> 
> thanks
> -- PMM

Thanks Peter.
