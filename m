Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1875734ejf;
        Sun, 25 Feb 2024 22:19:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdbuQB8P/vU97iVg5mTL8AOURN+IYKopG4DUY/HElzuoTAwl8FA5nDvPX938zP0bMxlPDpSg7USOivxDirDnVZ2LiUZ2JV
X-Google-Smtp-Source: AGHT+IH0ZE7PltOrazHgc7opgOQejZQDFMt+CKz4NBzr73sXRyLgOZjkwM+c3P7kfIzCDoxI0vY0
X-Received: by 2002:a0c:e10e:0:b0:68f:6013:7af7 with SMTP id w14-20020a0ce10e000000b0068f60137af7mr6712793qvk.57.1708928347679;
        Sun, 25 Feb 2024 22:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708928347; cv=none;
        d=google.com; s=arc-20160816;
        b=thbgPOpyx0XN2cZYy6wTRTlrWJJbCNPeFgjp7heu8j2uNcgOzy8Pysb0bg+vN5sL1O
         +5vUdgmw0nDLqe/MXA4cJG8rva6PJ7RH5t8qDB6RPvd/0KbfWgeDEccVsKCH/J13fccM
         lD9v0r47naNvgW+FXWPrYBo7nO3kxa0RwdUyxzYQUqtV7smxvlRW3HHZWBpBC4G35JFO
         ru3EgM2cWJoVp5qNIic5Bn9HiMzICh/gAI2yFtbLSiOuTqIE+DcjXTEGkRDO+79bUuS2
         jqNUOK70WUnDKskw5NTyY3ma+ROor5J47RaILuPJDEZeZU3qvLr5B7Jz0HWAWd9+zVWS
         y9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=IbKA7TBz8ivrhVLtFyWhmWeQxDnz7YcubMUvdj7SgAk=;
        fh=LCnfmqptvP00xTS9iQeRWHRtdeo0td2+ezSPCy3gc3A=;
        b=KPmJpPkg56wMgAETI/+hCiVuPTDEgiO6JDtsMXYqwkotjF6SVjbr+WPAmdP07eFHe3
         IIaUR2/xhm09/o2xQC1qOa1msgkA3/cWY9M8/OuT0XWXKqs2HkLo9CbHPWBxUlxCHxVD
         QW3xx+dGwscmkqp4VmaBuVMWr8RIojmk4h30d1xZaa84bAsdSR7SKwuFZZjCCMjTMH2N
         OsB+PV3KZA84cKOEO8Y6PI5+/bwwI6iPPK4tFKqudx7FNVcGOp3g9y5kjkMjIXjom9ll
         cDpXTnXz/LDbOlL7YW2abgCQQ27dLo0DFdkWnJ+iyR9P/dQ8FX6JYDDoBFDE9GrlDyWp
         VIHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KinYuQqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js7-20020a0562142aa700b0068fe8496480si4451468qvb.233.2024.02.25.22.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 22:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KinYuQqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reUKK-00065H-US; Mon, 26 Feb 2024 01:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1reUKJ-000652-16
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 01:18:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1reUKH-00076C-CQ
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 01:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708928335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IbKA7TBz8ivrhVLtFyWhmWeQxDnz7YcubMUvdj7SgAk=;
 b=KinYuQqrx4pvOIj45eZYqNTjS8dgaxoEWqrNTBp6HmvBayvCO3S4VMO+9eNd57L9De4Ja+
 ZpJJQFvokOPJsQ7j7DP70hRk40t8cbXH4GU83FZSxHpUmJLk5kd8L/+yvAEqs3JYU3+7h7
 FsLorg7E8t/dZhx858sj/pcEcrmG/jQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-75wm8rYFOD24rmmzNmgHAg-1; Mon, 26 Feb 2024 01:18:50 -0500
X-MC-Unique: 75wm8rYFOD24rmmzNmgHAg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-512ed819112so1880044e87.1
 for <qemu-arm@nongnu.org>; Sun, 25 Feb 2024 22:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708928328; x=1709533128;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbKA7TBz8ivrhVLtFyWhmWeQxDnz7YcubMUvdj7SgAk=;
 b=EBllgm6HKzkyb19DuVFmjHRTbv8fxN2VJjvA70GsTOhKfS3GW3tUU7bF9wCps2l3bo
 1O/6PlVPeNa2PWEfKXAcyQOxBors8XheCXOtUUypfAwyXGZNroud3ysydocRzDo4NLv6
 e3I8WquN0U+v8i9oCd7VHCqjpBrHYJQ4eFr0qB4rsFbsWdbqgA+8+m10UQ/blvQyj8xi
 PHbtJznJnO3yeiGVPrGqScVJC7EjCA4Fezp4z9Tx40UosN+LblW4LMoOAUNey7w2J0aX
 wQGI5wwwk6oOjhJVK8W4eP9CYEclp96yPiXEFvqbREMyi8avutmadGcuZ2mXS9GHqTOi
 2mYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiO3yFaKQLY+zmLiLKApafGVt9UkSswmWGPpDHeyzZuRIlJkBrZ7W5tETmEFdZnfYbm9yVCVQMU0eEM56SAb9M4YL6
X-Gm-Message-State: AOJu0YyeEr863VU71cYpRYNe+xNC5okqahDiD0iVDt5o5ZoOdoEG6Ihe
 jO4zsbL5MEV9ghRE2Bm7N1KjsbT55+WC2yRQSynQsynKHBYbpP09GQQlbUWWFWlT+Rzsc2pSRwq
 bKmDkQzn+QRJOw7Ly9sfFiOKuKVAzN0SL9PTFuhNC0y0uhBOuZA==
X-Received: by 2002:ac2:5ed0:0:b0:512:e04f:ae4b with SMTP id
 d16-20020ac25ed0000000b00512e04fae4bmr3555701lfq.10.1708928328655; 
 Sun, 25 Feb 2024 22:18:48 -0800 (PST)
X-Received: by 2002:ac2:5ed0:0:b0:512:e04f:ae4b with SMTP id
 d16-20020ac25ed0000000b00512e04fae4bmr3555686lfq.10.1708928328320; 
 Sun, 25 Feb 2024 22:18:48 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de.
 [109.43.176.215]) by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b0033dd2c3131fsm3361949wrs.65.2024.02.25.22.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 22:18:47 -0800 (PST)
Message-ID: <6272423a-1e07-4813-bb6c-c67b91e7f245@redhat.com>
Date: Mon, 26 Feb 2024 07:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/arm/sbsa-ref: Do not open-code
 ahci_ide_create_devs()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-2-philmd@linaro.org>
 <0fa25487-f25a-433d-b916-4b12ea5649ed@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <0fa25487-f25a-433d-b916-4b12ea5649ed@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.097,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MPNJ+OHvLL8o

On 25/02/2024 18.21, Philippe Mathieu-Daudé wrote:
> On 25/2/24 18:16, Philippe Mathieu-Daudé wrote:
>> Use ahci_ide_create_devs() instead of open-coding it.
>> Not accessing AHCIDevice internals anymore allows to
>> remove "hw/ide/ahci_internal.h" (which isn't really a
>> public header).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/sbsa-ref.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 5d3a574664..995c7be23e 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -37,7 +37,6 @@
>>   #include "hw/block/flash.h"
>>   #include "hw/boards.h"
>>   #include "hw/ide/internal.h"
>> -#include "hw/ide/ahci_internal.h"
>>   #include "hw/ide/ahci-sysbus.h"
>>   #include "hw/intc/arm_gicv3_common.h"
>>   #include "hw/intc/arm_gicv3_its_common.h"
>> @@ -572,7 +571,6 @@ static void create_ahci(const SBSAMachineState *sms)
>>       DriveInfo *hd[NUM_SATA_PORTS];
>>       SysbusAHCIState *sysahci;
>>       AHCIState *ahci;
>> -    int i;
>>       dev = qdev_new("sysbus-ahci");
>>       qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
>> @@ -583,12 +581,7 @@ static void create_ahci(const SBSAMachineState *sms)
>>       sysahci = SYSBUS_AHCI(dev);
>>       ahci = &sysahci->ahci;
> 
> Bah, we can even remove that 'ahci' variable.
> 
>>       ide_drive_get(hd, ARRAY_SIZE(hd));
>> -    for (i = 0; i < ahci->ports; i++) {
>> -        if (hd[i] == NULL) {
>> -            continue;
>> -        }
>> -        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
>> -    }
>> +    ahci_ide_create_devs(ahci, hd);
>>   }
> 
> -- >8 --
> @@ -571,8 +570,6 @@ static void create_ahci(const SBSAMachineState *sms)
>       DeviceState *dev;
>       DriveInfo *hd[NUM_SATA_PORTS];
>       SysbusAHCIState *sysahci;
> -    AHCIState *ahci;
> -    int i;
> 
>       dev = qdev_new("sysbus-ahci");
>       qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
> @@ -581,14 +578,8 @@ static void create_ahci(const SBSAMachineState *sms)
>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, 
> irq));
> 
>       sysahci = SYSBUS_AHCI(dev);
> -    ahci = &sysahci->ahci;
>       ide_drive_get(hd, ARRAY_SIZE(hd));
> -    for (i = 0; i < ahci->ports; i++) {
> -        if (hd[i] == NULL) {
> -            continue;
> -        }
> -        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
> -    }
> +    ahci_ide_create_devs(&sysahci->ahci, hd);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


