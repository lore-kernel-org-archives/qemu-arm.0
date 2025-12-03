Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E18D15DB7
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 17:15:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQqRb-0002Ha-Si; Wed, 03 Dec 2025 12:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQqRT-0002CA-Ba
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 12:15:04 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQqRQ-0001Wb-H1
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 12:15:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so115055e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Dec 2025 09:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764782099; x=1765386899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xYjtRJcO/yadDKzGxT7iIjwvDnBt2aZscqf7XVPkH+E=;
 b=cvUCx8kSogDLv6EkfnViWRgAE1XFhhD+7wr1flbfQ79kXkFKscXDh+REQfs6wpQjYX
 6ZKCbwZb0xPbpLn1fkpYbBDdqbZl3pl3CJNOM6ODRlh7WrfVaAMVpC6wPxiOcnwy6pfi
 iiLIweBufcZOM24uOou5x34Eg4iJA4IYcUT9Lxx1rKQtPMgMUTbBDKaDelLLXIvWwqbT
 4EiZQztxOOeESXVcKxKvNHTeqt7xIo30YurMGC83oa+J0fLd207hnD3SjgMrptXlmmbd
 hKWeKAWhsgRCQwFaTYVW9iavoMcLWfEXzikSJSjeWMpEhJvPXkxgn8NQdnR/nb76j8T8
 Su6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764782099; x=1765386899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xYjtRJcO/yadDKzGxT7iIjwvDnBt2aZscqf7XVPkH+E=;
 b=CqGbb3S5LKk3zzsDmthpYOHvbEqt+NicGNg17WoHKYx26ZruvfkGgCetGilatQzHhE
 v8JeXOO1CU5D5mDrfCEAxsjCH7USYEnKoXxVs+ICWwzpFNrutIqNjuRX8dCdAru1hcZz
 VeGwBon3qTKi6mbioqA/JIPqE1Ga/JM6ZI0HvIDYYFaOKwyTNN1hp2SDnpTJb83rVCVb
 CmYoeIBzTzzNsJrwQQ1x2mEQJhrDsE0383ynjnUTcr/LyPCzoVWl2QTGrB6AnCF+VKOS
 tiaaKmlGY4icTmNJ8rvZcf+1d7QBNnBTq0wIqYXhnwqI+Sh2zo1aNwn86afR/mDX7hUN
 oNpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv3/UJCqJpnrXkWxVUWab2PSgfK0QiCzArIm2yPhLOf64omkHxmC3gOfRiYu17d2hnnh2Vef8arw==@nongnu.org
X-Gm-Message-State: AOJu0YwfI3dIJbrvuZaIovMBI17qzt0TxO3K59RQ23F9PBYw19j3APLE
 TaCOtBIxROuoYJqIm+i9cZXPWGreCIw/VzRx2usL2MyjmdO29N/I4ezu2DwEiq7DPrM=
X-Gm-Gg: ASbGncvPYu/+E0r1O2HghgHpLhpllj53Id3rJzgcYAl4RXZ9uC6+jOcHs1TCpjYearz
 1QJcy7Rxddl1RNSP6tCi+3Zb2eZPWmz15HIsN1yl/uvmSwgx5VwyjnsFwUn7SpCOfiw2ASYF0jb
 o75ka8FHMmPI4t/ZTU8m6i+hIcK3cU5tffqfDtI6EWylplDbKwBqYT5xffw18L0VHwq8qHkcPm/
 f4x7WR9dqEPpj4wCDNnuXygARoQsv5A7k07SHhzd7+mfFrBs5+KN1O8SG6YX+4Nym0lz9IG48fV
 WNTJq6oZSK0HyUf6QavqfEwvrWnttv7X2n/9wygQ7xyMX/unOw0FASH0bpKZTWubRWTVB1G+fOY
 /3iAJRHbZPE0jOUvr0B7ZTUcdk8Xwhv4gZML7cgzUi4QJUllO+IIPl6xSsZJVaPBa7inPLWJ9jl
 L7zbJUtkniPs3Cz5EwzYVoYiY3Av5YuxVpo3PzpHV3GRE43VhZbrrkGw==
X-Google-Smtp-Source: AGHT+IH2uld1GK2UW8XysRayYNpv1eKff5zuPCQ7YVvMA9aNyP7FlxXLLpzLDmVavezq9yCYEbEGaA==
X-Received: by 2002:a05:600c:4f90:b0:479:1348:c65b with SMTP id
 5b1f17b1804b1-4792af34f30mr27163395e9.26.1764782098874; 
 Wed, 03 Dec 2025 09:14:58 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5168acsm37255423f8f.0.2025.12.03.09.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 09:14:58 -0800 (PST)
Message-ID: <05f92a77-7587-4441-a252-01e4705a6892@linaro.org>
Date: Wed, 3 Dec 2025 18:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 v6 08/13] hw/sparc64/sun4u: Use
 fw_cfg_init_io_nodma()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20251203060942.57851-1-philmd@linaro.org>
 <20251203060942.57851-9-philmd@linaro.org> <aTBccn2LIv7puGzR@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aTBccn2LIv7puGzR@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/12/25 16:51, Zhao Liu wrote:
> Hi Philippe,
> 
>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>> index 82c3e7c855b..6dc9f64b74d 100644
>> --- a/hw/sparc64/sun4u.c
>> +++ b/hw/sparc64/sun4u.c
>> @@ -683,14 +683,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>>                              graphic_width, graphic_height, graphic_depth,
>>                              (uint8_t *)&macaddr);
>>   
>> -    dev = qdev_new(TYPE_FW_CFG_IO);
>> -    qdev_prop_set_bit(dev, "dma_enabled", false);
>> -    object_property_add_child(OBJECT(ebus), TYPE_FW_CFG, OBJECT(dev));
> 
> There's another difference: fw_cfg_init_io_nodma() uses `machine` as the
> parent and here sun4uv uses `ebus`.

Ah yeah I wanted to comment it but forgot :facepalm:

> 
> I think maybe one reason to use `ebus` is because...
> 
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> -    memory_region_add_subregion(pci_address_space_io(ebus), BIOS_CFG_IOPORT,
>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> ... because the parent region is managed by ebus.
> 
> Perhaps we should add another argument: Object *parent?

I thought about it but don't think so, all instances but this one use
the machine container.

I'll improve the description.

> 
>> -                                &FW_CFG_IO(dev)->comb_iomem);
>> -
> 
> Thanks,
> Zhao
> 


