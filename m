Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3144901ejb;
        Mon, 27 May 2024 05:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmFxnI+DcowSthp9ECXE5HR1QRnt+ahFIUombDpmCSDEMiRlZTftP2KRP24A8H04oQRfNBI/gbFj0RzKRQfmmXaVBrcLCT
X-Google-Smtp-Source: AGHT+IEWyARSPO+6/FHrZmKPB/ytnqhfNd+BdVjWDqmKEbtjsvwnEUAgrVF6MFT2/u1NCSiTDy4d
X-Received: by 2002:a05:622a:110f:b0:43a:bec1:1d1b with SMTP id d75a77b69052e-43fb0e7ee83mr142309771cf.26.1716813694085;
        Mon, 27 May 2024 05:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716813694; cv=none;
        d=google.com; s=arc-20160816;
        b=WBgP3xr8EmflO/oEygfcDQdzIbDqnw98dypyu829B90DYOEjKeu4PF4TeVO9rKiJMN
         Az4WVqPbptGAfCt7hYxz1He+GuRGeT4gQ28+ARL7Mcw6d6LwBbUiwSobg8o2zq2gLu6x
         bt9CIo5npND9dMXtgEwz7b/61oCtYKDgc/p7IgLBSYB+dl/y7yh37w4pX+Z2gR+8IO7G
         IZN1cMj0DllQ1Ob92uzUxJq2Tq5gUwvq+a4JyweavD1svB1loloNMEKBnX/GjeH2+qa4
         /omSyVSHsKq8NvoZ6QQCncBJLqZTwApqZlpLEvBoymmtWJhDe18MeWz/acw/2JgDpB/V
         ki2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BjtQJnIP1iJ6XLf3ypFXW2pbWBDirOARD8AgZpfN/fA=;
        fh=kc/dMl5dmUT070dKzCqEFvMi1n1EDL5sZbNmBQM1ejM=;
        b=ysxcrmwhWNYzyiL9mIhIVkzCoeztOdpRMpwa3lVsj+FTX5DDTHpnD8UYkH9/ZUUK+f
         FcJvBv2qUbSMu8da2aspAWEuesf8JGy+vbwy0OD0lT4Pd/PO+/dZEK5HgqzmPmvwuj4Y
         t3H4Fzo92Z+lYRzIQ2iK9KOnmSUgMtcRM25upRj6p63/w+jcMJ+ufU43SouZn3gC/bST
         ydWtM+pH0cswr98khKC+Uj7oMlU1t4HyGBP2fS0u7HMg3R0vjZ96lS7CtId5uocRyQr/
         UpHd44bEcvJ1nI9YFY1GTNE4sF/kfVc+iy875lEZsdDKFk/k5oum76JaPWqyqdPJ/XWr
         AUeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCKa61Az;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a6c89si78040711cf.247.2024.05.27.05.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 05:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCKa61Az;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBZfA-00085r-1d; Mon, 27 May 2024 08:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBZf8-000857-Ml
 for qemu-arm@nongnu.org; Mon, 27 May 2024 08:41:14 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBZf7-0006Bs-1o
 for qemu-arm@nongnu.org; Mon, 27 May 2024 08:41:14 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-578972defb3so2231581a12.2
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716813670; x=1717418470; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BjtQJnIP1iJ6XLf3ypFXW2pbWBDirOARD8AgZpfN/fA=;
 b=CCKa61AzSnIvhYqTqFmNywwXKxliQbb5+vc0xiC85gf34R6MDOPxZPEt6sC8Op3yvy
 hFwwaE4vdlU6/bGj9n9G1EfZe/PO7PJ4kLfZ7vGwHwQR+pfOyVVSBma9pt8QRooJzSBJ
 jpAqLYkxogdDgZ+2utRCylg+w7CVUdvojx4OWR3et5rCXnrvg+GhHSeJPeSSzpxsNdOd
 pcOL1cN6lSUFWKBo/gCwL/DEJC0pJx90HYXo0Xuo/k+FWOBSP5O2by0TsYovG7HtYKOg
 tOiD4ycOz7wG1ufUwmIYsLNaqveiq10Hgh0HAF+1SBvgTKAAg4zFDBI4uUi+sgKDDbY6
 JlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716813670; x=1717418470;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BjtQJnIP1iJ6XLf3ypFXW2pbWBDirOARD8AgZpfN/fA=;
 b=mE00mZLLtIa4bjdMSQxT7xwFb8GCQzbk5CaPn/zyKjpRlaBQrGgsq3B3DU1l4PY5au
 hNOuvw4G2dfe6eZyfhuTOV946Fk7r07ksAX47uqj7bjWaltLEBed/JymUdYGvAvdQCe3
 /ZozIA04Fpl28/GTFBg1YdOGMMa0cywxj63GK7ZJzB1k0NJnkqVhb4LIa5vleyhRIXtK
 RkIMs/GL68SjZ83NNOE+gFORoSufxRoc+rB5683C20cq+Ge/jH17biS71oK6gjkCAKri
 ZRxRbSlUL8QP0qYULWtzqvYZqBDLbujX7n9mfDYaV8n/A5tDfEfr9TdBF3iyHfN2x3Nf
 pumA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpaicQexbbSbyoRKXIoE3btfwELcYDpsMwwxoNfojOQwY7wpNijbUi+gE4CAZHcrM8zhXDcBz3G8S6K9+IGJwamKYJ
X-Gm-Message-State: AOJu0YwF0Gf+3kvZsaNDGsP7D6E6WeSs+FKCXqwnlrjhfP7EZNgQLoEO
 FdH3L0rOHI7nceqkhnOh0+bffpGH1fMZ9OdWlhbbCwOlB1+Bk836e7Di9BTmv4E=
X-Received: by 2002:a17:906:2512:b0:a59:a431:f955 with SMTP id
 a640c23a62f3a-a62651187b0mr640069366b.73.1716813670383; 
 Mon, 27 May 2024 05:41:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93b678sm486450966b.82.2024.05.27.05.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:41:09 -0700 (PDT)
Message-ID: <933822dc-de0e-4180-90f9-d951aed30aec@linaro.org>
Date: Mon, 27 May 2024 14:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] aspeed/sdmc: Add AST2700 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-6-jamin_lin@aspeedtech.com>
 <9476cfcc-5a7c-4b76-a684-1361463bd161@linaro.org>
 <b01604af-5fa7-469f-98e9-c23b3a668a2e@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b01604af-5fa7-469f-98e9-c23b3a668a2e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ko15OLtZT9Yb

On 27/5/24 13:18, Cédric Le Goater wrote:
> On 5/27/24 12:24, Philippe Mathieu-Daudé wrote:
>> Hi Jamin,
>>
>> On 27/5/24 10:02, Jamin Lin wrote:
>>> The SDRAM memory controller(DRAMC) controls the access to external
>>> DDR4 and DDR5 SDRAM and power up to DDR4 and DDR5 PHY.
>>>
>>> The DRAM memory controller of AST2700 is not backward compatible
>>> to previous chips such AST2600, AST2500 and AST2400.
>>>
>>> Max memory is now 8GiB on the AST2700. Introduce new
>>> aspeed_2700_sdmc and class with read/write operation and
>>> reset handlers.
>>>
>>> Define DRAMC necessary protected registers and
>>> unprotected registers for AST2700 and increase
>>> the register set to 0x1000.
>>>
>>> Add unlocked property to change controller protected status.
>>>
>>> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/misc/aspeed_sdmc.c         | 190 +++++++++++++++++++++++++++++++++-
>>>   include/hw/misc/aspeed_sdmc.h |   5 +-
>>>   2 files changed, 193 insertions(+), 2 deletions(-)
>>
>>
>>> diff --git a/include/hw/misc/aspeed_sdmc.h 
>>> b/include/hw/misc/aspeed_sdmc.h
>>> index ec2d59a14f..61c979583a 100644
>>> --- a/include/hw/misc/aspeed_sdmc.h
>>> +++ b/include/hw/misc/aspeed_sdmc.h
>>> @@ -17,6 +17,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, 
>>> AspeedSDMCClass, ASPEED_SDMC)
>>>   #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
>>>   #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
>>>   #define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
>>> +#define TYPE_ASPEED_2700_SDMC TYPE_ASPEED_SDMC "-ast2700"
>>>   /*
>>>    * SDMC has 174 documented registers. In addition the u-boot device 
>>> tree
>>> @@ -29,7 +30,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, 
>>> AspeedSDMCClass, ASPEED_SDMC)
>>>    * time, and the other is in the DDR-PHY IP which is used during 
>>> DDR-PHY
>>>    * training.
>>>    */
>>> -#define ASPEED_SDMC_NR_REGS (0x500 >> 2)
>>> +#define ASPEED_SDMC_NR_REGS (0x1000 >> 2)
>>
>> This change breaks the migration stream.
> 
> Do you mean migration compat ? We never cared much about that
> for the Aspeed machines.

So let's just remove the VMSTATE to reduce code burden?

Otherwise incrementing the vmstate.version is enough.

Regards,

Phil.
