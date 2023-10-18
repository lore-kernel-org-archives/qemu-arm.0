Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4629524ejc;
        Wed, 18 Oct 2023 06:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCl4qqqZCcALjEzqP6hoS/esePJ3SHdqbTun4+UNe2z6lJQMzFGC5h5IcPZsytpUJIQ8cT
X-Received: by 2002:ad4:48c7:0:b0:66d:66cd:a351 with SMTP id v7-20020ad448c7000000b0066d66cda351mr5894318qvx.18.1697634957429;
        Wed, 18 Oct 2023 06:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634957; cv=none;
        d=google.com; s=arc-20160816;
        b=Lr4VAhNgoX9UazQJHq9qSXrq8Gy5TM7DMxNESatTDXtQcaMFOEXf1ulIgwa7U4kVqR
         fLqdKgOZBLaMZpFv/sQ5Ix8RZ7auGqVW19vGtgSIE3h2Qkqc6qKWshv6fxAtyK0OyJrQ
         4zrdgq+uzeSgbKkKumSf5DflOjellfAM3M7t6bI4dXzBnxGatRQQYs00IHUUr7d7z5SW
         IrdO38PebblyywZEk/mfaU/7vG4FgX5WyT8TvuI0HGOqEVp0xDH3miS6xUv6A9YF87bg
         No8044JTBw8lIBT2iNt0JxrPgwsM/B/WY8vVDkwJuuHj/4CVe6Rt8GbPcWZ0iOQTwHB3
         0Xyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nOEYkWvI6OGzs8qDWNjMO1MB9K12s+KF/8VSWMwKlts=;
        fh=kcNJKrmYDcBWFsQjc/jfNTVf50XvfSHEyaGn6RGzQuw=;
        b=ZhjCAlOwNcX2YpKtRqpMajU+ez38RWfI1lfUjWPu2U9RluWc5QoH4UJCwenYznz4bu
         cpW17d7wa4jAZDZgIeA3oSNxiVtlZ0gM7HEAfWh0N7gCAUhT71TOiidnj61Ef4OTqhSe
         wgcWauxaByOfCEd5JYkie7UbrXm1P4PtSJCbFZWAS9tzBr0ERY6mzrYOdKM/YzYkrGVL
         cAWYSvdQNsV47Qs+TO0toqMdkF7OccURSdD2BLz2SGHRTM6wAuXIdihAHCOqh1dVpcDr
         QkYwkPYK933ER5X3J7MFK7MPBUT7fAlpleY+pd/4+CaUtw/rNz1NHWTp3CQpfG4bvQ8x
         Vy+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmpBmob8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ad45b87000000b0066d0bd0cf46si2610647qvp.592.2023.10.18.06.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmpBmob8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6NK-0000PA-E5; Wed, 18 Oct 2023 09:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Mj-0008JU-5z
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:13:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Mh-0000rS-HP
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:13:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53ebf429b4fso5871802a12.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634814; x=1698239614; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOEYkWvI6OGzs8qDWNjMO1MB9K12s+KF/8VSWMwKlts=;
 b=kmpBmob8WcmT/wuFCJ8ghD2tpvGsTsLUQkbBfXlzPuM9mNIWkg0il4pz73SZJq6laS
 J5vUYr8ESpta4YewPYxCyqt0yr6kbSEEXXZGuZmClPFV3eKsQrEnNPvpyV8e7Tn9C3nQ
 g7HWD/Ez0qkE9vQP/iqe5R7aluz4+ndm2tYqSZjekZC/6kpBI/A9LSvoHOG64z22Zu3D
 i/9zrF69S4AOWvZxyjMJ2TpFCC2loWLEbOuibjE+Y+yoYZ+N6o4rOBSkQDFQiFjkMhxM
 69ptNxqlXp7ONlLyimBM8sXAFHfbbvYWPpBQ2cf4rSG8e54Qq+F9+8ZRrXbb2A+8dVgo
 2oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634814; x=1698239614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOEYkWvI6OGzs8qDWNjMO1MB9K12s+KF/8VSWMwKlts=;
 b=KmAeJ7pvgRebf5HusjqVOLgXwjZyYiAYnLwiS2S2NLytRNEAWn08qDjYdR0437eLgo
 IKnmEYW6YkbzRkwFl6gwE90TfxWh8iFJwspwIMK/+jNc5lShkKxrdjg/arTiFMJLERlX
 4QDwoB60MO9RJex7LMiI4ALh4PBeTrOIGJTNnSxGSRzpeAjaJ8sYmR8ZU5TsPwTu/6bd
 xDn7Y5k1RzDDMKz6bQ7UWPUSlTd64KZBJatItvhlfIWXOMhHEF9M37gWcM/Uhk6zVSRQ
 YkPCekCjE0h6F94cX+L/WHDm2kPlj06AW+Y/YSU7fqd99bVBfs3lMKTuRPznecbKhwUn
 iF8w==
X-Gm-Message-State: AOJu0YzpujNz0kZsg+Tej5fs/mLt1fW9ePqMJ926o1VT3iLsZukScQ9K
 SAH8SeMUAMC3CZXg93nnusq2Jw==
X-Received: by 2002:a05:6402:3493:b0:53d:a7ea:225c with SMTP id
 v19-20020a056402349300b0053da7ea225cmr4333544edc.30.1697634813788; 
 Wed, 18 Oct 2023 06:13:33 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b0053e5957aa47sm2802678edb.33.2023.10.18.06.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:13:33 -0700 (PDT)
Message-ID: <1b159c7a-f52c-3705-8757-c2b80a04965b@linaro.org>
Date: Wed, 18 Oct 2023 15:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] hw/arm/pxa2xx: SysBus/QDev fixes
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231018131220.84380-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9pNjbAp41u7A

On 18/10/23 15:12, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Extracted from a bigger series which enforce QDev state machine
> (qdev instance must be realized before external API is used on
> it).
> 
> While here, pxa2xx i2c/intc devices received some qdev fondness.

Forgot to mention, there is still an issue in pxa2xx_i2c_init()
where an odd 'dummy' i2c bus is created *after* the device is
realized.

> Philippe Mathieu-Daudé (8):
>    hw/sd/pxa2xx: Realize sysbus device before accessing it
>    hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
>    hw/pcmcia/pxa2xx: Realize sysbus device before accessing it
>    hw/pcmcia/pxa2xx: Do not open-code sysbus_create_simple()
>    hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
>    hw/intc/pxa2xx: Convert to Resettable interface
>    hw/intc/pxa2xx: Pass CPU reference using QOM link property
>    hw/intc/pxa2xx: Factor pxa2xx_pic_realize() out of pxa2xx_pic_init()

