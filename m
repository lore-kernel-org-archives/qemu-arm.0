Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3549371lfo;
        Wed, 16 Mar 2022 04:23:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkEARsh8EqypNvi/KgV4i8J4mvXAlQacT+yqfCxM5kx0HtdAWk1P9+7zn8SqMXhjdhzzML
X-Received: by 2002:a17:907:1c98:b0:6db:b42:7f81 with SMTP id nb24-20020a1709071c9800b006db0b427f81mr26268624ejc.258.1647429788755;
        Wed, 16 Mar 2022 04:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647429788; cv=none;
        d=google.com; s=arc-20160816;
        b=yyVkjz2Uw5EPRuhZ99EMn82Yug+jZvhhIuhgzZjOm73s/Rl3ylIzJDVJRVRgf3Kl9E
         t9PHMqPLplQBJOOH/cpMDoOuUXZJMDAyuNRpK9BgafXtTSGHhCku/8Qt/AS7Z6lFiByQ
         /L5V2N48tw+vfXSkMhn79FaEIBZVfhLQKxD1pqTHST7Je/AakdY2RgQrWR/PGvtt9akY
         /Sdykwg9OfTzW1jXIPnnTCEN22cVzQ3eMjCs7Wn0UENaXHKQPceZZ4YuKSzGepjfDyFv
         z1KG7J049eT1/4NzwcaETQbGa2+GFxMh0/EuIKT7IoIdnaUY0ruS8BOS6zkcYnCOxy2n
         7tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xt/N28QarI8r1Ey9RthCWgxM9Kl6RJSxLZpSUL7Ruh8=;
        b=LjPn4g85Td315lCt3cq0NKGyjK840tpVSWl5x9ReprE2GtSN8t4NxzG+9suVwcP8V7
         y9IM5/1mMBmQbI2MQRItSrticBoWKf/tltcCFvxhYisGPnH/caGdBCfg+xRpGX1fUp22
         jTs8nwCqrSagAA4CW+9dHLW4JiQCzdphgBuT+AJuq1ci/cR+uJT5zbMnBU1gOR3Y6UXV
         qavX1tiNyZumztziVQspYgWhQbpeEC+IJL3KEOeCacc8zNmp2How/1Rm6a6K06cV5R2O
         puqjBshYmbjaNZ2CTlia/c9u4JqwMlTCLCSgLp3eL2VyXpM9g7U7Kh+DmKs8mR/YwwJy
         5SEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JOhI8A2I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w8-20020a170906b18800b006dbf2566d68si968609ejy.182.2022.03.16.04.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Mar 2022 04:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JOhI8A2I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647429787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xt/N28QarI8r1Ey9RthCWgxM9Kl6RJSxLZpSUL7Ruh8=;
	b=JOhI8A2Im9Y62ldLw86tafQup7IwAnsZpZP+IRGs/qigOPhGM8CDmRraxkXS1nogMc3rIM
	mvDAm4t1LqWkNg3kguuIyRbyROkVIHWUNOvGnuvsfXf8pVTrFlYlp/ZGP1cpUw6A82hY0W
	40VJS1rcQgaUfsOXpXfgBMLuImZ0NGE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-ATRQfOdiMxmqQSiCZVJ19w-1; Wed, 16 Mar 2022 07:23:04 -0400
X-MC-Unique: ATRQfOdiMxmqQSiCZVJ19w-1
Received: by mail-wm1-f70.google.com with SMTP id c62-20020a1c3541000000b003815245c642so2634350wma.6
        for <alex.bennee@linaro.org>; Wed, 16 Mar 2022 04:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xt/N28QarI8r1Ey9RthCWgxM9Kl6RJSxLZpSUL7Ruh8=;
        b=7H+sAmfHuFw07SaugxA0oPnNC2dbs73/e1MjLgWWw97COa+FK8Pr05rG/+mgq74G4K
         caMwyQ4Nib/nVs2RAojRB/pT4aYAou/1XRHOMcuhzgiGx71d5UGkMIyFnx9mHnJp56e9
         JjVxIjFSRbxtXUhmjjwYFHw+MOiIj/yMlNsioBHTupKpLioQHc45Wyi8rGm6X61rdiIV
         SPwpvnLrm6+l0OSGALcHxEzB+WtLNagssP6++7IEJst7y8J1ARjtpwvUySLKVP8U041f
         udte5fOAsjYMaW0wNnZg4o+QmFk/n58O5yEc7/QzMEK3SKRvax4jGSj6mivV/eiYC3p7
         O3ew==
X-Gm-Message-State: AOAM530C6RFYQZNmSGvS2kMRSIuG2ltKtp3HACPDbxvKaRlLOuZTTh82
	KMGMIJJyAUk2BOsGu/L4MAbj7FYV+z6trX3ou3iAbFyeOlkuuS4T5E3UrOAVnEyJIpPsBDpnl4c
	c+GqzVBpy787KZuNY
X-Received: by 2002:a5d:6c6f:0:b0:203:7796:2d4 with SMTP id r15-20020a5d6c6f000000b00203779602d4mr24587217wrz.393.1647429783524;
        Wed, 16 Mar 2022 04:23:03 -0700 (PDT)
X-Received: by 2002:a5d:6c6f:0:b0:203:7796:2d4 with SMTP id r15-20020a5d6c6f000000b00203779602d4mr24587194wrz.393.1647429783234;
        Wed, 16 Mar 2022 04:23:03 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.42.76] (tmo-065-170.customers.d1-online.com. [80.187.65.170])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d4348000000b00203dbfa4ff2sm1440376wrr.34.2022.03.16.04.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 04:23:02 -0700 (PDT)
Message-ID: <ba668d50-e960-0dd3-6069-1fe89ac549be@redhat.com>
Date: Wed, 16 Mar 2022 12:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: Halil Pasic <pasic@linux.ibm.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
 <20220316121535.16631f9c.pasic@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316121535.16631f9c.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MQBTBXm+zXSV

On 16/03/2022 12.15, Halil Pasic wrote:
> On Wed, 16 Mar 2022 11:28:59 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Replace a config-time define with a compile time condition
>>> define (compatible with clang and gcc) that must be declared prior to
>>> its usage. This avoids having a global configure time define, but also
>>> prevents from bad usage, if the config header wasn't included before.
>>>
>>> This can help to make some code independent from qemu too.
>>>
>>> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>> [...]
>>> @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>>>     * a compile-time constant if you pass in a constant.  So this can be
>>>     * used to initialize static variables.
>>>     */
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>    # define const_le32(_x)                          \
>>>        ((((_x) & 0x000000ffU) << 24) |              \
>>>         (((_x) & 0x0000ff00U) <<  8) |              \
>>> @@ -211,7 +211,7 @@ typedef union {
>>>    
>>>    typedef union {
>>>        float64 d;
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>        struct {
>>>            uint32_t upper;
>>>            uint32_t lower;
>>> @@ -235,7 +235,7 @@ typedef union {
>>>    
>>>    typedef union {
>>>        float128 q;
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>        struct {
>>>            uint32_t upmost;
>>>            uint32_t upper;
>>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>>> index 0a5e67fb970e..7fdd88adb368 100644
>>> --- a/include/qemu/compiler.h
>>> +++ b/include/qemu/compiler.h
>>> @@ -7,6 +7,8 @@
>>>    #ifndef COMPILER_H
>>>    #define COMPILER_H
>>>    
>>> +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
>>
>> Why don't you do it this way instead:
>>
>> #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>> #define HOST_WORDS_BIGENDIAN 1
>> #endif
>>
>> ... that way you could avoid the churn in all the other files?
>>
> 
> I guess "prevents from bad usage, if the config header wasn't included
> before" from the commit message is the answer to that question. I agree
> that it is more robust. If we keep the #if defined we really can't
> differentiate between "not defined because not big-endian" and "not
> defined because the appropriate header was not included."
> 

Ok, fair point, now I got it.

Acked-by: Thomas Huth <thuth@redhat.com>
