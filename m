Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1119682njf;
        Sun, 27 Oct 2024 15:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWugtRKOPUG5znfx13h6AMsrRs0/bEKUqBm2exskJZoNVwEgdzW4Miv8td0UIfjIetLTqLfVh6Mo1htBA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFgZ3k1M0JYzTdKAC6gWJbHohCZQyzhBKIYKfWQfnWHKu+5NfKobngZ/fNogZwfQeGxYsa
X-Received: by 2002:a05:620a:28c5:b0:7b1:4a2a:9ae0 with SMTP id af79cd13be357-7b1865d3400mr2085607185a.9.1730067150225;
        Sun, 27 Oct 2024 15:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730067150; cv=none;
        d=google.com; s=arc-20240605;
        b=hacTw2VdGBZ2X8/5+Iug59iZpfAg/zJrS+50abVYCog9H1HHZRPpkElEuFliHSixt5
         hXFC2OvB4IciM1g09jNXPs3Wmw3uyL5sRB6ihsvyU9M1vT9PxEILiZ4DP5DdaW1XBgkV
         FGbo4zh1wrRZQz9xKbzuof9ujaAiSkGmjPfR3E4ALbfZ/+l7OO5VYLoGmg4ThzdI15vX
         YovxO/NLHwi67j7ht2FipnzUp99uVAeIEdDqw3ZUThVrZkF8qEjtxjMoVai/S2/4GOiy
         eKBLFZWTDG2unDqmgM2qEwmdZalyvmGDR30WKAeDs2uZmoSBP8mioPundw1QuT1Fxs5i
         eOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=evLQ3hiAThEMd1ZP3zKw5NRu0GvVMSh7SUI25dKpqDE=;
        fh=U+UTwiBut9GGinwR6KsiAuCYo3UrNeP2Pgz6BR5z6hM=;
        b=aYTBypRbGmR6R60fh2SjaRINp2QpOCKMjk1gU6LG+oA8Zf9cAZjhv61He0Oq1SqHGs
         OHxIPCtgsUTRVW42eOQWHyNeN8DioRfCz/jPbgijUXv97KQgnpu9YR1Df0UFDB1cxjH1
         zpraHOsuiEIrJUWpsd3AaTyt3TYaJu61yZEZPFDuH177LJnPOXx0RWFk98+95VfEjBnp
         VtCN7aDFZKDE3bc3G6Biikt+OdMWd1bCu2if9QKTJTqgDFtDCj4Tgdhp54lxCEpUWfRJ
         WVa35euE6VyQIQIee+vzS6m058IbMdgGvpH/ffdtp1jwvr2ELpSOPdiCFC6usxAcF9De
         7OYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=ELWgci0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a47897si70253316d6.372.2024.10.27.15.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Oct 2024 15:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=ELWgci0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5BUT-0004qN-N2; Sun, 27 Oct 2024 18:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t5BUR-0004pq-Hy; Sun, 27 Oct 2024 18:12:03 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t5BUP-0004mV-IF; Sun, 27 Oct 2024 18:12:03 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20c8c50fdd9so28835935ad.0; 
 Sun, 27 Oct 2024 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730067118; x=1730671918; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=evLQ3hiAThEMd1ZP3zKw5NRu0GvVMSh7SUI25dKpqDE=;
 b=ELWgci0orRhzToGuNjUTEfRuLVYlF3dNiKCrzpWoxbvHk/OEt1jXk5md2bHhq+ivqw
 +JOO3w65RVJ7KVgffO/tpeI12rsa0amvSD7lKF6m8WTD93GhhDxoMV8rM23Mp3aT6qjT
 J8QZr9D8ibBVaVZD0mcTHmqsUJdaDuLRfIYYYlfiqcCLFbIkPFb6sF3x9FxBlmotuFnN
 3eh5D0DVcUqcXOKF7vjzDJMRf39SfKwib9e82bAA5/gIsnnWy+69kcrnTMn7PLVH6PpR
 6bmWNbwsaQJWLthz9Zl8T1+TlMg5ClEWsYlzMCS/wBysk+6bV9m3o01aejuf2VrmadW5
 VxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730067118; x=1730671918;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evLQ3hiAThEMd1ZP3zKw5NRu0GvVMSh7SUI25dKpqDE=;
 b=bLGoZbFkXv1h3OJzLxd58WjVo59br2kWAJmvR8OZMux6eBq1CggiSnHOqVnngRY1A6
 aTsvy31+FZaXdKdqDRTuEWdeI831fF17DxwyQjH+Mcd0YCyjAXUo6Z2ibFkLwLrPrTYR
 gMlAlCd35WnU5JSBL8ljxpMa0FrYYXG71HikZcSqBH+6/PgNoPFBvQGzsw3w1tHQwa1s
 VwYF7UgHCOjqMArMqKZ/QPwZEXN2ca+DLBu6GFfzM6uzgkQR7E9UF4z0GJRBROYcRo8G
 cMaXRkUPz2iEyKwM8MMbb11j7u6J0U9jrkzmzG8JLcnrX2KK00MJBudWsN7Ov69hLhOD
 ffhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV30SqA8/k8NsLp/2TNQ3QNdrDVYgBHYAsYyxf1hNHav3ezw6okB0e9EXwv/piyN9VHINWup6aUp5ad@nongnu.org,
 AJvYcCXRk45C06yuufxOPOxX/JNDduMPZJXbGJFPgPhyndSr1Re7VnpzRb8zNQwSC9CgGkIrWySMkyUe2SEkAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxM7iolWEY5K5Eln6s5Ww1Ax85dysd/vYKHMm1Bu3xSZmln4hHj
 DS3uYxpHTE6dIxabPXbk8wD+9lUzGn7p8hB6PQjFAU/nT1IPU4Rn
X-Received: by 2002:a17:902:c40f:b0:20c:7e99:3df2 with SMTP id
 d9443c01a7336-210c5a67e9bmr97986285ad.23.1730067117808; 
 Sun, 27 Oct 2024 15:11:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02e755sm39223755ad.194.2024.10.27.15.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Oct 2024 15:11:56 -0700 (PDT)
Message-ID: <1c917e4a-de50-45b9-ac9c-eb04d51401a2@roeck-us.net>
Date: Sun, 27 Oct 2024 15:11:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, qemu-block <qemu-block@nongnu.org>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
 <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
 <a65a224e-4f54-436d-b555-734a8926d941@roeck-us.net>
 <aa7755a2-e6fa-4d23-bcac-a630e6da98db@linaro.org>
 <d9f18091-aee1-4b32-ba72-e1028fe433c9@roeck-us.net>
 <5262a33d-d0c5-452b-9869-f8f482b1c857@linaro.org>
 <07664ec3-6b46-4b27-9d8c-9e2ff34c9dbe@kaod.org>
 <600baa43c3dd3547338934717cfb57c5e12b0d23.camel@pengutronix.de>
 <84c32f2d-7d9a-4e5a-8b67-1f954dd493f6@roeck-us.net>
 <b67f302a11a679c3fdb02318eb9ef0be559d14ce.camel@pengutronix.de>
 <53cbb597-e7f2-4742-bf85-928c704ddbcf@linaro.org>
 <443f1b0c-8184-4bf4-9f68-c23d7de3bc36@roeck-us.net>
 <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
 <c27fbed6-596e-4ce7-a6ca-6d12d7205e99@roeck-us.net>
 <86fa6e68-5861-4d4d-941f-95b278074eb6@kaod.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <86fa6e68-5861-4d4d-941f-95b278074eb6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: oQ4JPKVC3Kib

On 10/27/24 14:13, Cédric Le Goater wrote:
> On 10/26/24 17:32, Guenter Roeck wrote:
>> On 10/26/24 03:02, Cédric Le Goater wrote:
>> [ ... ]
>>
>>>> I don't mind a single file. What bothers me is that the partitioning is made
>>>> mandatory for ast2600 even if not used.
>>>
>>> Our only use case, in 2019, was to boot QEMU ast2600 machines from an
>>> eMMC device using an OpenBMC FW image like the ones we find on IBM
>>> Power10 Rainier systems. I agree we only focused on this scenario.
>>> Most of the support should be there for other use cases, and it's now
>>> a question of finding the right tunables for the user.
>>>
>>> I did a quick experiment using 2 patches,
>>>
>>> one on hw/sd/sd.c to fix c8cb19876d3e ("hw/sd/sdcard: Support boot
>>> area in emmc image")
>>>
>>>      @@ -826,7 +826,9 @@ static void sd_reset(DeviceState *dev)
>>>               sect = 0;
>>>           }
>>>           size = sect << HWBLOCK_SHIFT;
>>>      -    size -= sd_bootpart_offset(sd);
>>>      +    if (sd_is_emmc(sd)) {
>>>      +        size -= sd->boot_part_size * 2;
>>>      +    }
>>>           sect = sd_addr_to_wpnum(size) + 1;
>>>
>>> and another on hw/arm/aspeed.c to remove the setting of the eMMC
>>> device properties when it is not bootable :
>>>      @@ -338,7 +338,7 @@ static void sdhci_attach_drive(SDHCIStat
>>>                   return;
>>>               }
>>>               card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
>>>      -        if (emmc) {
>>>      +        if (emmc && boot_emmc) {
>>>                   qdev_prop_set_uint64(card, "boot-partition-size", 1 * MiB);
>>>                   qdev_prop_set_uint8(card, "boot-config",
>>>                                       boot_emmc ? 0x1 << 3 : 0x0);
>>> (I am not saying this is correct)
>>>
>>
>> Works for me, though, and it is much better than mandating the existence
>> of boot partitions.
> 
> Yes. However, if the emmc device was user creatable, we could use :
> 
>    -blockdev node-name=emmc0,driver=file,filename=mmc-ast2600-evb-noboot.raw \
>    -device emmc,bus=sdhci-bus.2,drive=emmc0
> 
> and with boot partitions:
> 
>    -M boot-emmc=true \
>    -blockdev node-name=emmc0,driver=file,filename=mmc-ast2600-evb.raw \
>    -device emmc,bus=sdhci-bus.2,drive=emmc0,boot-partition-size=1048576,boot-config=8
> 
> The above would be my preferred approach if acceptable. The "sd-bus"
> bus identifier should be changed in other machines tough.
> 

No real preference here, though my understanding is that emmc devices
are by definition built-in, and that is what emmc_class_init() says as well.
Also, there does not seem to be an sdhci-bus, only sd-bus, and that does
not support any index values. That may be just my lack of knowledge, though.

Guenter

>> If you end up submitting those patches, please feel free to add
>>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> I should send these fixes for QEMU 9.2.
> 
> Thanks,
> 
> C.
> 

