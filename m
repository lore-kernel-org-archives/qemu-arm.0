Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1002738ejc;
        Fri, 26 Jan 2024 09:02:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEA8na62V00pyJUKMCN1NVAR2DdnF7kur0ZL58GZ+h/SmedUeRdBExIHA7Cs/tbugwMkEK
X-Received: by 2002:a05:6214:27cc:b0:686:2704:97a0 with SMTP id ge12-20020a05621427cc00b00686270497a0mr138935qvb.60.1706288560953;
        Fri, 26 Jan 2024 09:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706288560; cv=none;
        d=google.com; s=arc-20160816;
        b=lbw9wYH0K2xweG8SboWD+l2piveRWdQg7detmgv1XwNsVtMVUhYLoBB7Y0dUvATNHw
         p+bTFrCDttffM+OqpiH9pAe/bWN6r4du5mXaGflMteY0ZoHaRdAX87uiDwTTzjJvaT5V
         17ek4cT/WzViUs3ZicBbK2ZstfwTqBQ40BjOIKgHrE48YoodTL0D3MQ4g3yKx651Mipd
         Ay2yaSKdAo59ZWukHHuJFjpvrIcTe5xNV0XjYf5PnPZ5+FHBahfdMFqoZa8BfDjIbu3c
         7Pv4UMXyfwP5L/ZQOrQs8eXCG8MmQbcMJpcq43p/TCpux80JW3ekPj/XHIu4nXbqe/LK
         qPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=msrEboZ+7bRlCCSPb41xhxmS+xPCzGvU3ZZ9wEj1mKE=;
        fh=r5MC9HtREP10F/v24Ax3E+PAMV4NNXmLv9xnpIM0Sq4=;
        b=MJVLBZtpt3cMaaomK82QaZfmG5ATaPy/YteYR/3chYjXPTokwCTEylXb2fseOkxYqP
         NErZ54f31OsL3+yMohCZf6jECd/Rf4pZ8z5ASg4j0veJE5gyFBqQzapLlAKzw/5P6JsE
         HeBGF88vWDjR1jc0ULdSErXY7xyen26VPzeAETfc2l5syc3o6VVNXAoBRXq8FmfKf4dd
         JSKa/5GCYONjH/Tds/Y7mIwkAyqkaPC3D1YgSxZCV7pNedSegiqYVvR8LJChaX5DRemo
         o68XO3hc6KEti8SAWgYAzvtmnHqyRjZrqFGPq+sbK+Gamo24pWahX7kQzyEwc5nq4QwK
         iIhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZe7oLxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu14-20020a056214260e00b0067f4a6eca31si1665228qvb.65.2024.01.26.09.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:02:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZe7oLxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTPbC-00027M-8u; Fri, 26 Jan 2024 12:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTPb5-0001x6-S4
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 12:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTPb4-0001eE-58
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 12:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706288548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=msrEboZ+7bRlCCSPb41xhxmS+xPCzGvU3ZZ9wEj1mKE=;
 b=KZe7oLxLUJfHroDsh4ib9eX/Tp9oeQ+Wbmwcgva8H4SohUwT7v8rrnd6XKYXm6jNvfNgUo
 NgKpszhlhM82gBM2ghXj7iWO+9Y6cXoDk2LlwV8oPZ2+V8IHS/QrxbHjhXR0vVKxh1AMom
 MOr8LsBmiZi6bUwEsS8wRqJlTyVOL2A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-I37ygnVhNGyhO7vYFAi43A-1; Fri, 26 Jan 2024 12:02:27 -0500
X-MC-Unique: I37ygnVhNGyhO7vYFAi43A-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-680b48a8189so12844106d6.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 09:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706288546; x=1706893346;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=msrEboZ+7bRlCCSPb41xhxmS+xPCzGvU3ZZ9wEj1mKE=;
 b=nQ7axJSx7i74AHiVIlkLPhnX2yCsWMTfv38RrvnaWTZuQT8HHXXpVlhm0E+Q3OchVn
 JIs50YAmUxz/eWcLkc0YYhlAZCd6J6W0txfB9cDp06OCUdEMWkzpvp4T6db7H758mEmG
 qwYKJtgQZ6ZzcofYfCcGzH1Cyx9AqIUDJm9aa66WxpD4kQwJR0wpTGXKV/Rp0M7e+lqx
 YeFqCIVOdVz1qTrh29yICuLZY/fSkBY+q4zH9+m9wEsroteC+ynbki0MAaPM/zq6voSX
 R2L44eyXdIxdCXdcoGBswsk4TMWjXtUcgOMwMHfprHhdJ2FKfgkvWz9rT3d32wtMFtbr
 9Y9w==
X-Gm-Message-State: AOJu0YztG4nePwrregBgwY+5OFhV0Gjr/XjTzXr/KplAlhOrpMHWkFSf
 OO4+zw6WCFHwbhyaB9lNMydpJO5Ax3yIvnJ9p2THAUBodUx8gtks9ofUubV51xw150aa1XWB5/k
 LQu29muG7D10lrZjpPvfiP4kCyopDrL1p7dv0dC36EaSmbKCqBw==
X-Received: by 2002:ad4:5f0b:0:b0:686:aba6:5f03 with SMTP id
 fo11-20020ad45f0b000000b00686aba65f03mr173059qvb.20.1706288546199; 
 Fri, 26 Jan 2024 09:02:26 -0800 (PST)
X-Received: by 2002:ad4:5f0b:0:b0:686:aba6:5f03 with SMTP id
 fo11-20020ad45f0b000000b00686aba65f03mr172971qvb.20.1706288544334; 
 Fri, 26 Jan 2024 09:02:24 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 oo29-20020a056214451d00b0068c373857edsm200931qvb.73.2024.01.26.09.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 09:02:23 -0800 (PST)
Message-ID: <d20632bb-54f7-4f9a-afc4-535bea6f5da2@redhat.com>
Date: Fri, 26 Jan 2024 18:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/arm: Move v7m-related code from cpu32.c into a
 separate file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
References: <20240126084001.879548-1-thuth@redhat.com>
 <20240126084001.879548-2-thuth@redhat.com>
 <17455043-25cf-4978-afdd-147e689a1abd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <17455043-25cf-4978-afdd-147e689a1abd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2rvyKzwCfTLr

On 26/01/2024 11.44, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 26/1/24 09:39, Thomas Huth wrote:
>> Move the code to a separate file so that we do not have to compile
>> it anymore if CONFIG_ARM_V7M is not set.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/arm/tcg/cpu-v7m.c   | 292 +++++++++++++++++++++++++++++++++++++
>>   target/arm/tcg/cpu32.c     | 261 ---------------------------------
>>   target/arm/tcg/meson.build |   4 +
>>   3 files changed, 296 insertions(+), 261 deletions(-)
>>   create mode 100644 target/arm/tcg/cpu-v7m.c
>>
>> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
>> new file mode 100644
>> index 0000000000..d61873ab6d
>> --- /dev/null
>> +++ b/target/arm/tcg/cpu-v7m.c
>> @@ -0,0 +1,292 @@
>> +/*
>> + * QEMU ARM V7 TCG-only CPUs.
> 
> s/V7/v7M/

ok

>> + *
>> + * Copyright (c) 2012 SUSE LINUX Products GmbH
>> + *
>> + * This code is licensed under the GNU GPL v2 or later.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "hw/core/tcg-cpu-ops.h"
>> +#include "internals.h"
>> +#include "hw/intc/armv7m_nvic.h"
>> +
>> +/* CPU models. These are not needed for the AArch64 linux-user build. */
>> +#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> 
> Could we do that in meson instead?

I don't think so... (see below)

>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 6fca38f2cc..8c7f6b43f3 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -52,6 +52,10 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>>     'sve_helper.c',
>>   ))
>> +arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files(
> 
> -> arm_system_ss

Don't we still need the code for the 32-bit qemu-arm binary? See:

$ ./qemu-arm -cpu help | grep cortex-m
   cortex-m0
   cortex-m3
   cortex-m33
   cortex-m4
   cortex-m55
   cortex-m7

So I don't think we should add this to arm_system_ss only, should we?

  Thomas


>> +  'cpu-v7m.c'
>> +))
> 

