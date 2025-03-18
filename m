Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3172295njb;
        Tue, 18 Mar 2025 12:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwAbHmn7PpU7cIKkC13wdU4BAJtqFhmQEBFUFLI+aUriE22NxF4dbGk7o24/2WmI+VDiCPIRkh19y48Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF1QgdrJx0Fzx4PxoI7XsuI2UtOlWklhUtrAYzcpJJK4KFvl6kqjQVJJ+sxkIhGfFxansZe
X-Received: by 2002:a05:622a:22a5:b0:476:fcfa:62a2 with SMTP id d75a77b69052e-477081c970dmr3731801cf.0.1742327700383;
        Tue, 18 Mar 2025 12:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742327700; cv=none;
        d=google.com; s=arc-20240605;
        b=QjI0HfaPB71I6VIieTzbZWsXMwil2KqaGMCpvaEft2acMideoaw9R8hzKwb5/fqBIc
         l5zfaL0yOeHK51KTCVm4A9pFsokvlowwZSEYpP1TpBV/UIpjeWwTWCi8+odPxLi2jLXF
         FgqyTK1xuhuvB7ek4kOBo/a3N6kvVhUL+2GRMfJYa+x0iXSq6PEGnPRD3uqWNsb/GFn3
         PlGSDKW2o7oYyumNwYy49QNCQtzQ+Ur32IxViJEucHlNip6IC1oAXsVn/bVLe2p4xRMk
         GxD3HrwjXwnahylPTXRm7sQnx8XqbvvY+nL2e1tOa/ViAfjiTh8oD4QatIMIjlhqS++T
         /Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=P5E2Zmxz/6aGrB8WoLLQBruVOcoIwFL3ANTJ5maRSag=;
        fh=dMZuxb3AdPjXq7Qk4nWR6cv3RmeTX6cuNwJupUekyyw=;
        b=NafbfFOt1nzZIxJsjdpF8A5IiCmAoUrtdhzI0HrL8kYexggUtjJIkmNIb5U6m7rXT6
         PCby2lcbQRLuxGc77GYINBn6SG05v1SZOtllv/wI852vzUYtzGEnBFxo31SyxB2BAa+j
         K6b4aLH1A4SGFcYlVoStw6Je7uYi8OEPdP/EsFJb19qdiQm8p+FYBTraee40NwMt9/3+
         ktW154T7M+8xrb8Za95XS9nYvwSKPEpSm0t3hl0YROJC4IOxBqRcEnzuvYWWZ/f/UzIb
         IkdzXbeJwjbCaZ3/jJtl0t8Pr2S/55Qj3Ebnw28hxwv5mPApKJvSttc/Ftm6xfok+UoA
         7nnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=SQoMqJFS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb856521si125909821cf.510.2025.03.18.12.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 12:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=SQoMqJFS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tud1J-0002a8-Ty; Tue, 18 Mar 2025 15:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tud1I-0002Zn-DI; Tue, 18 Mar 2025 15:54:36 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tud1G-00050i-Ai; Tue, 18 Mar 2025 15:54:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22359001f1aso3129265ad.3; 
 Tue, 18 Mar 2025 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742327672; x=1742932472; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=P5E2Zmxz/6aGrB8WoLLQBruVOcoIwFL3ANTJ5maRSag=;
 b=SQoMqJFSntxZhotcYfhTHINrN7QBTpJdY1SVj9KVHMo5sXhiN8lq+gHX038iCDJbaD
 l5vInJ44a5qaDkyGzZiKH16VgJ0HDHDAWn5uDnH7XPxC2yajqmVgWYAiRcXk9F/V6oWR
 WemAgMB1U3Hdt3VI1pkyuDqLT3wS8/WS1UHMftfUYvTUw3NtGP04WgPKC0E05z8XTKJq
 wqsV3/vAeW6BgUNb6Ht1+790OeSuLWLC5fzGcDf6b/HW+y39n7kXJPaXRiMCl4e+ohHz
 ofrNOsuBgie/Eyq03qqEydN8IsgYUicIWZbKZodnQ9RuoNjEV5ldMumQy5U9zujzgrW/
 /ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742327672; x=1742932472;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5E2Zmxz/6aGrB8WoLLQBruVOcoIwFL3ANTJ5maRSag=;
 b=Bx7PRbgIS1336TMM0CzJb2P6MKItIDaRcJoAayM5qv8gU2GbaXtwOvL5n2WDTdbLXd
 3DP4rZqIN8Ceege6AXGw3vB7KdtOu0ymW+viU1gxbCQ4yl9g5FS3XOND5M4aQRPhQkrG
 WZ5l9Ggg3L/UsdmshZrFHpBTjLw4szQmOMZN6+NISefIn8DQinshhxKeZJOZbcJ8PL2t
 tRhouPNRSknpJCGyzER+zT7pOFJVarH9mJ0uDhIspliEV1TejTxg0mAFifMlNK0r3oSZ
 gseKz/Daw0guyVc3xU37wZRGIAmohiEuwHqZPqeQteLA+Km5phUNBtmOXlUVrMzCXahQ
 itFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6jtsXCIeP3M6xzJxJibqnHdWS2iKMA0wTCUnfBEfys/jd91ENQkta/L6JUY8cQua09JVoNMxASVDDFw==@nongnu.org,
 AJvYcCXsNC9f2hxv6OJb1q5JORevyw34jZ1SckqHpR+2XVrzxnUddOgT7w/wS0mnrwTjlVva3xYepr5maQ==@nongnu.org
X-Gm-Message-State: AOJu0YzGs0Da0nd9eNjbVLBVQag6M2fL+eAioQiMbgG9RsbxBlKbfTWd
 Amt8osr30YDkpbyCne2abtKOMBQLR38murOY+Uog5uPKi/s3xgBi
X-Gm-Gg: ASbGncsjKCCcwcjpTqbNqyTe0SOoHmgYlFkN4uH3RDO3dqnyorY0GNGViVsE9q0oPX1
 XaV2KyXxQgAsIE7IBh/aRTVaHadFkU+B6woII8dGRBhlzSZov2iNS0QUtZANREMDi2fdW7sS/NB
 p8OhH6/fjdZBC/Uah0M9JFDeX1Oad19hogEo7nImv50JklvzJ+iTAXqQYw6laSqfzSdOd07PEsm
 VVaL1Cbf/b5tWjvKBH6nM9UqimNNUakL1eM9ZXoWk/YXv1/CLTtaPoGqW1BKPZKIZGlOy4rtB7G
 +Q2/8yFEo+9mm2O4kffSTPQKov4QrXzGXQLmgUr09o8iEx0i9w55kRKjPcoFos4fOQJC+7xILAy
 gWhysoVNodu+ooSvFaw==
X-Received: by 2002:a05:6a21:c94:b0:1f5:7c6f:6c96 with SMTP id
 adf61e73a8af0-1fa4487382emr7751172637.22.1742327672057; 
 Tue, 18 Mar 2025 12:54:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737115295dasm10004812b3a.30.2025.03.18.12.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 12:54:31 -0700 (PDT)
Message-ID: <5d350a95-886e-420c-8b0d-a3be57b9490d@roeck-us.net>
Date: Tue, 18 Mar 2025 12:54:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Add missing psci_conduit to NPCM8XX SoC boot info
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20250315142050.3642741-1-linux@roeck-us.net>
 <CAFEAcA-zPwJrq3oQk3MRp9ZCyTzDOg2-Je00v20pVzrKe8he6w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAFEAcA-zPwJrq3oQk3MRp9ZCyTzDOg2-Je00v20pVzrKe8he6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dib+7aoEZ3UK

On 3/18/25 09:59, Peter Maydell wrote:
> On Sat, 15 Mar 2025 at 14:20, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Without psci_conduit, the Linux kernel crashes almost immediately.
>>
>>      psci: probing for conduit method from DT.
>>      Internal error: Oops - Undefined instruction: 0000000002000000 [#1] PREEMPT SMP
>>
>> Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
>> Cc: Hao Wu <wuhaotsh@google.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/arm/npcm8xx.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
>> index f182accc47..e5a1929ed7 100644
>> --- a/hw/arm/npcm8xx.c
>> +++ b/hw/arm/npcm8xx.c
>> @@ -346,6 +346,7 @@ static struct arm_boot_info npcm8xx_binfo = {
>>       .secure_boot            = false,
>>       .board_id               = -1,
>>       .board_setup_addr       = NPCM8XX_BOARD_SETUP_ADDR,
>> +    .psci_conduit           = QEMU_PSCI_CONDUIT_SMC,
>>   };
> 
> Why do we need this for npcm8xx when we don't need it
> for npcm7xx? Or is it also broken on 7xx?
> 

I don't see a reference to psci in npcm7xx devicetree files
in the upstream Linux kernel.

$ git grep psci arch/arm64/boot/dts/nuvoton/ arch/arm/boot/dts/nuvoton/
arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:                        enable-method = "psci";
arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:                        enable-method = "psci";
arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:        psci {
arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:                compatible = "arm,psci-0.2";
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:                       enable-method = "psci";
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:                       enable-method = "psci";
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:                       enable-method = "psci";
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:                       enable-method = "psci";
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:       psci {
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi:               compatible      = "arm,psci-1.0";

Guenter

