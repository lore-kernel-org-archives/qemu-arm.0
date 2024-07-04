Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp373422njb;
        Wed, 3 Jul 2024 22:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUUG/HwR4JPGBuYptTLdKBm/gJMAfm+FsKe/ULuuOT9u2HOEbrHpfj9m5zFh9HIMza7saQrGepTzb8LfKpfw+My26Hh9st
X-Google-Smtp-Source: AGHT+IH1O4YkP0GRSC1eRs2+ViDgCq4TOQqsQaAzDapbcFNq4eyLKafdYeIjhH7oJYvKEetM2FRy
X-Received: by 2002:a05:6214:3d8f:b0:6b0:4201:3840 with SMTP id 6a1803df08f44-6b5ed08b2aemr8756226d6.40.1720069822567;
        Wed, 03 Jul 2024 22:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720069822; cv=none;
        d=google.com; s=arc-20160816;
        b=iqX6O2kG2xfYWPLgDPKGLLbQ17wBu4YLyJpIGr3enc2vpv+I68qDN7a8k5Njl7wkM8
         aaH8EW1F7VlQ4adGDj7rbeSVIeuiGH4yQfc2hB1uqXiz5crMNHWskCPyfV8sO7DSe2Fn
         KMxwUajZfgUoC52DGrJ4933RbjjyKoCaFZYEXXGzfN/sEfuQczIPRBUcH9aIdo1xm5Cx
         GwivLgWkX8RxqiMD+dv7YYTHHWW7dcIliYj7I/r8Cy9nvFxjA6+rTxZLkRrbRH2xTrk8
         m8XRUrzld+09tm5uaFvmaZF9dbIyzXG24vKiJKjjty3QpLXJKbhVzWY4a1BiKut75kAi
         lLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9t2YZSjwqsQTqyDSKrTdUKQHAyUMIgFEyhah+Hc5V0A=;
        fh=dULG+W9mPAD4ToyC5LE4Frz6+WRZJZC4AfB6HFgfldo=;
        b=yO+OBTqeFZq12JPmkqbVWpZMMICNb74SZAgiq7Ox4XUgte+YIPj2RZYaPPlh5QsuVa
         3hM1Fv6hELviw9DHtncvRKO91Sy15sCZ2Btv3pcK9nmnlK7bp5mKK5whc9ZLrLeeSO7F
         V5VHu6BuNQZlykdFlz8YKquSXKe3RUGlwuTu7yTM3YjBcSUpkUd2N+AeGb/rs/G2QoHC
         hdRkOUjyCgYyDku2Jdg0TGNApfsQXhHy0Kfarw6nhrX5lUdDytczgkU9msN0EYqN5zyY
         CD078VhtW4v/r9ZrqwsNpwf9OUcZy/i2SFoKASXqJbWTX0k3YRiiv7qCGruK8Smh1l4F
         u2UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e60a867si146755256d6.473.2024.07.03.22.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPEj7-00027Y-D2; Thu, 04 Jul 2024 01:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPEj5-000270-Kl; Thu, 04 Jul 2024 01:09:47 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPEj3-0007l0-G6; Thu, 04 Jul 2024 01:09:47 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WF4Sq1Mrcz4wny;
 Thu,  4 Jul 2024 15:09:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF4Sg5qGwz4w2D;
 Thu,  4 Jul 2024 15:09:20 +1000 (AEST)
Message-ID: <05905b9a-f405-4f63-ba97-a20927b2248b@kaod.org>
Date: Thu, 4 Jul 2024 07:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hw/net:ftgmac100: support 64 bits dma dram address
 for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
 <20240703081623.2740862-3-jamin_lin@aspeedtech.com>
 <cf451844-7b47-46be-baa8-af6544f00a81@kaod.org>
 <SI2PR06MB504128C0DB00382329694820FCDE2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB504128C0DB00382329694820FCDE2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=mgHy=OE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: s1T1tw6by6P6

Hello Jamin,

>> I think that, first, we should introduce a container region. In this container
>> region would be mapped a sub region for the current set of registers. This
>> container region would be the one that the SoC maps as it is done today.
>>
>> Then, in a second patch, we should introduce a extra sub region for the set of
>> new registers and map it at 0x100 in the container region.
>>
>> It is close to what you did but it lacks an overall container region.
>> This container region should be sized as specified in the datasheet.
>>
> Do you mean to change as following?
> 
> ftgmac100.h
> #define FTGMAC100_MEM_SIZE 0x200

I would use the total size of the MMIO aperture, 0x1000, because
this region is reserved for the MAC unit logic, which means it
could grow. That's minor.

> #define FTGMAC100_NR_REGS 0x100

Value is fine.

However, the NR_REGS suffix is confusing. It is not a number of
registers but a MMIO aperture width. I would use a _MEM_SIZE suffix
instead. Could be FTGMAC100_REG_MEM_SIZE.


> #define FTGMAC100_REGS_HIGH_OFFSET 0x100
> #define FTGMAC100_NR_REGS_HIGH 0x100

Same here.

> 
> struct FTGMAC100State {
>      MemoryRegion iomem_container;
>      MemoryRegion iomem;
>      MemoryRegion iomem_high;
> }
> 
> Ftgmac100.c
> static void ftgmac100_realize(DeviceState *dev, Error **errp)
> {
>      memory_region_init(&s->iomem_container, OBJECT(s),
>                       TYPE_FTGMAC100 ".container", FTGMAC100_MEM_SIZE);  --> container size 0x200
>      sysbus_init_mmio(sbd, &s->iomem_container);
> 
>      memory_region_init_io(&s->iomem, OBJECT(s), &ftgmac100_ops, s,
>                            TYPE_FTGMAC100 ".regs", FTGMAC100_NR_REGS); --> current register 0x0-0xff
>      memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
> 
>      if (s-> dma64) {
>          memory_region_init_io(&s->iomem_high, OBJECT(s), &ftgmac100_high_ops,
>                                s, TYPE_FTGMAC100 ".regs.high", FTGMAC100_NR_REGS_HIGH); --> high register 0x100-0x1ff
>          memory_region_add_subregion(&s->iomem_container, FTGMAC100_REGS_HIGH_OFFSET,
>                                      &s->iomem_high);
>      }
> }

Looks good.

Thanks,

C.

