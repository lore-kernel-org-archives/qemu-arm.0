Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4447139ejb;
        Wed, 22 Feb 2023 08:12:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/cZk6SsPMoYdPWVafjrtDifrd9kTeZLxgo4LvnpVkEILIXOTX0Jx2ZRL1ungzCHJKW0jot
X-Received: by 2002:a05:6214:1c49:b0:56e:9d06:730d with SMTP id if9-20020a0562141c4900b0056e9d06730dmr18857288qvb.49.1677082335596;
        Wed, 22 Feb 2023 08:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677082335; cv=none;
        d=google.com; s=arc-20160816;
        b=0Wp2NYKGy4hyayKgofJDznuepOjExd9r9yc84Et747NpqkILxB4eypdaF55ChYlO+T
         Eu6MokdRyCAHvoANin44DSjKNoeI9q2XijJBXJIIaBGsnzKVXyQ3SO3BmbG92zagR+Dp
         1ir/PyO7Ucidage6o2Bu+ivPCqXrAE3HSjD7DWCKLVvgqVCV+yrw8aYuzpS5R6zsf0Zm
         lxki9Gv6GAelBGsIWRV8a3o53gelBTsh8yktozMFLaz4V6JOWlAKWrPVjtltu9s7f5Yb
         CyfXUkzDbuZ7ttqbL+Pw+BHcmiSw4r1+KQ++xg67E9s+Fc/j8Ijb0oMmcMVsFsaE0T7p
         Q4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E/XA2y/70mfsuEWrV6iHpFct0yC4BbmOCAUV1cf92Ug=;
        b=s/EYZeaUqHUNACDQp1a2bsJ4uxAhRC8P4jmmzLlemc8UFxkAMx1Ty5B741fNV0HV8/
         7eNTRd6FzC8bwrZT3GZfr48zCGlf7AzpmVXYOxx2w5eVskw5LUK7UiGB3XZR1tYvxdLL
         GC3LxrlBdYnIE7TVByoOWHck0X58Tc27tRmdjVCs+cckfoPu3iKY0U8NbTWEtA+zZY1Z
         Q+vEHUQjPnfLUeyQWniPi0ZuFNmp+li5BUrbpwNS5kH9qU1erb8LHaLMyELkx2TleAG2
         5dtJG5DEL2dVw35ar3OYnRRaNxaThApYGgFjD/lqXbgGSIT7h+FPt49V/YA6LMv7ZPjK
         Ef0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGShkIRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05620a244200b006fbdef09390si4520968qkn.96.2023.02.22.08.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 08:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGShkIRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUria-0006Ae-Ck; Wed, 22 Feb 2023 11:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUriY-00069u-Ma
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 11:11:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUriV-0006er-U0
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 11:11:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso338042wmp.4
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 08:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/XA2y/70mfsuEWrV6iHpFct0yC4BbmOCAUV1cf92Ug=;
 b=YGShkIRKsqFjkcWm4+l03lhWXkJucdZxbj63eS0GB0kY5SY29eB4riEthtkct8Vf1K
 Ix7WpjtaO3af8ftH1pItJPOE5GmHeWF1nKr3eOiMDbCjc7diX4WW21lRw6cBiwNmNdpW
 66rWZ0RVdUVK3lIVUvOSratP0QYX2pmNf+wYzwZhr2hK2GJPlD/OBRUlRDPyEu+h473K
 utOR3QT/GQPWnxLiO/jMwGHdbHmqGJwVfI55vL18iywG+vlQ6cdZJKBN8FMBu74MEI8K
 iKVC0F+aw+kPLHVY4gzOPKrVWqfdiqxQVy8ZxxXF6REqe4B7pbtX7qFFRI7sxo0W3J1r
 iUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/XA2y/70mfsuEWrV6iHpFct0yC4BbmOCAUV1cf92Ug=;
 b=s83MVWGB154k7jlk/XCPSAGj4/j0OIN5iwS7Wwk5Dcvs7E08xrjklH8HbnVML3ZxOW
 rYAMoJ7iDY++kbkLaRToNJG414sjdb9XRsNlcrhK4UTohiAc5uXwRYMrUAaYfckSpH2k
 V0jcZY+D0jSeGmp4LAHGogeDQARgNui8ZWx/T12lin9fnfLPg47OzBq+UjvEs6+RXxts
 56N3OviYHiuFciQfQHpQE2wL9XXuZmcKzjrHl/M40fa6qhdYN6fFblJf8BKjyXPGvtxQ
 Il3zaRn3abaIqnbQL6M4XBF+4s5Ed3PRfn59xUZAY73BT9tZzi5xaxKqU5tp0HlqfGVI
 /VbA==
X-Gm-Message-State: AO0yUKUHFCBCyhkHPyP4rEn5Ds6NtbSvAKfQ7ZHDH856ttk4qMcmWWXV
 DWTJU6pyHmLjJFqCkYLsIt4uyg==
X-Received: by 2002:a05:600c:54ee:b0:3dc:4356:533c with SMTP id
 jb14-20020a05600c54ee00b003dc4356533cmr6092270wmb.5.1677082298194; 
 Wed, 22 Feb 2023 08:11:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003e2096da239sm7992324wmf.7.2023.02.22.08.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:11:37 -0800 (PST)
Message-ID: <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
Date: Wed, 22 Feb 2023 17:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222070529-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GWbqQTgPg7o5

On 22/2/23 13:05, Michael S. Tsirkin wrote:
> On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
>> Since commit 262a69f428 ("osdep.h: Prohibit disabling
>> assert() in supported builds") 'NDEBUG' can not be defined.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> this exactly says NDEBUG is not allowed. why are you removing this?

The project can not be built with NDEBUG. There is no point in
mentioning it in each individual function.

>> ---
>>   hw/scsi/mptsas.c   | 2 --
>>   hw/virtio/virtio.c | 2 --
>>   2 files changed, 4 deletions(-)
>>
>> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
>> index c485da792c..5b373d3ed6 100644
>> --- a/hw/scsi/mptsas.c
>> +++ b/hw/scsi/mptsas.c
>> @@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
>>       n = qemu_get_be32(f);
>>       /* TODO: add a way for SCSIBusInfo's load_request to fail,
>>        * and fail migration instead of asserting here.
>> -     * This is just one thing (there are probably more) that must be
>> -     * fixed before we can allow NDEBUG compilation.
>>        */
>>       assert(n >= 0);
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index f35178f5fc..c6b3e3fb08 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
>>   
>>       /* TODO: teach all callers that this can fail, and return failure instead
>>        * of asserting here.
>> -     * This is just one thing (there are probably more) that must be
>> -     * fixed before we can allow NDEBUG compilation.
>>        */
>>       assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
>>       assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
>> -- 
>> 2.38.1
> 

