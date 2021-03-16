Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4449340lfg;
        Tue, 16 Mar 2021 03:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz50tOrnJvIuhUU+wrUys+Lk9lD1fmPUuP2OK1XsT78/swU8Bp9i5LR+Dur4Zffz7/jfAsZ
X-Received: by 2002:a05:6902:6b0:: with SMTP id j16mr6087651ybt.151.1615892165734;
        Tue, 16 Mar 2021 03:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615892165; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlp17kPCmgnkUjiZ+EK8PEW0V/l6roxNtrYLbTR8Ae09JUFhRt+tn4nMccHYllPPpP
         GIsMGhmToVhropRMCBxVwkfJ/gwVwrLjw5VE+Xy8vD5S76wn0cTZPwwtYxsyzcW4Y9u0
         CDVa/wkPzpus14dh4cpAHChJgTB2Y0v0gMBn3t1sGlAuvF7/LRMEHG43pnSkkNRcXUMm
         HOFRusykYDy8FLBc9k5Cs1euQLoKjcdLc39j3synPSFp0laTrw8mLQmYKG54uGtkFGj8
         /12g6YIcahD/i7WwNJjWw6yDwa8g4HRzu/c1014NyzTz8n6GLlWZ/+U7xNjt+8su+hnc
         OwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=ut3i0HY07uCTm0cwRjtGnL/F6vjL1ktmZLgRyY+bhY0=;
        b=NU/PwFrfOcn0qFuhcY4HY2UbofChJNlLWp++ZQbeha9W99XaKu2dRzSn37+dH7Jwjz
         SRy5W5MGS+VKq8upa85zUjt8ZiUmdVQjHbiW5/0q6HcHA5kktXSshYDDOkki0tgl5NjO
         nB9aNqyTLmn3dP73TBEzcmYJyVyJUBwsjl6EfYmpjTYmMsIp12s0zAYk3GAyc2hAna9Q
         6tbkrv5nEb5wTIKV3hMgHdYV44uIGpIODDcdVZy6gX6BmaS4m1idCSKMlmv9k/baI1Ie
         J3T8djmyl/zzAVcY90GEdYxqM88HasoUuyMz/vy3g46pgm6nN4wQ/7Bfd1jdHKYpCOk5
         HFxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fuqJwqeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n193si19134619yba.369.2021.03.16.03.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 03:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fuqJwqeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM7Mq-0007mO-V0
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 06:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM7Mh-0007kU-O8
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM7Mg-0004Wo-5D
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615892153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ut3i0HY07uCTm0cwRjtGnL/F6vjL1ktmZLgRyY+bhY0=;
 b=fuqJwqeHRxDerNEpN5nJd/X7MzB0ykvy+hP0uoAi4m29AUDZrbd/ux4LphZfMKwLgL+PED
 MMx/9tEMpLyIolt1rzqTLaDrjLp9ypAiDV7TPZNkxbkMMeP7g5EyPVthNyOyKodiigWBmz
 d/2Q1vHKQWT9vHv8jtyHBujN9JWL0qc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-juGkKVJsOWabwTcVgwq-IA-1; Tue, 16 Mar 2021 06:55:48 -0400
X-MC-Unique: juGkKVJsOWabwTcVgwq-IA-1
Received: by mail-wr1-f69.google.com with SMTP id o11so459396wrc.4
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 03:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ut3i0HY07uCTm0cwRjtGnL/F6vjL1ktmZLgRyY+bhY0=;
 b=MQEw9g1+Nz21gsXZi5JTh3fKvWBazQPgfKL+esYexJd+yTfMjAOJt03aermed5MvvT
 a9cKcCQ1eF6QGLLMyA+B+gDyWOajQvjSF7Lk0ZEHKoTXdjLx4R3Ab2dELM3istsb1Fbn
 YwrNdWvV6e+qB2DVFOovedGdJZcU8XAqmnH/O83ph+SJ8WywBNYscUmD1ItuYUBJYwal
 JWvd8mda76uQFm2BVO5WdIp6VayMdydNgcb75AZRxsjzq+Iqpfta9FX2U4e47LCMzZjg
 vvZP1XrhLIP830/dgapFUtY5RkJvGZ9ykIjKz3Ex2SNqdCCtrXQpNLTwqYG84XI9gjm+
 30ow==
X-Gm-Message-State: AOAM530L9ShKEQ0XqFtWjvZvDxupqRC/NVMl3vpfev2PaDB2iR9ePxC/
 R2eTbbyN8Iy2CDEA/cGVx7njAgzTZK22KRCJLzVbccJvP2kUpDrBMnV+APdE6p89MGRpVLfQj0g
 bsjqfaHLaDp2U
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4096113wrp.383.1615892147706; 
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4096092wrp.383.1615892147518; 
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p6sm21409446wru.2.2021.03.16.03.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Message-ID: <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
Date: Tue, 16 Mar 2021 11:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hy1tLeGxwhZ

On 3/16/21 11:26 AM, Philippe Mathieu-Daudé wrote:
> On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>> Eric Blake <eblake@redhat.com> writes:
>>>
>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>>> [...]
>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>> new file mode 100644
>>>>> index 00000000000..f16e49b8956
>>>>> --- /dev/null
>>>>> +++ b/accel/accel-qmp.c
>>>>> @@ -0,0 +1,47 @@
>>>>> +/*
>>>>> + * QEMU accelerators, QMP commands
>>>>> + *
>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>> + *
>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>> +
>>>>> +static const Accelerator accel_list[] = {
>>>>> +    ACCELERATOR_QTEST,
>>>>> +#ifdef CONFIG_TCG
>>>>> +    ACCELERATOR_TCG,
>>>>> +#endif
>>>>> +#ifdef CONFIG_KVM
>>>>> +    ACCELERATOR_KVM,
>>>>> +#endif
>>>>
>>>> ...would it be worth compiling the enum to only list enum values that
>>>> were actually compiled in?  That would change it to:
>>>>
>>>> { 'enum': 'Accelerator',
>>>>   'data': [ 'qtest',
>>>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>> ...
>>
>> These accelerator definitions are supposed to be poisoned in generic
>> code... But I like the simplicity of your suggestion, so I'll give it
>> a try and see what happens with removing the poisoned definitions.
> 
> This is actually quite interesting :) Accelerator definitions are
> declared in config-target.h, but acceleration is host specific...

Thomas, I guess I hit Claudio's reported bug again...

1/ generic libqemuutil.a is built without any CONFIG_accel definition.

So this qapi-generated enum ... :

typedef enum Accelerator {
    ACCELERATOR_QTEST,
#if defined(CONFIG_TCG)
    ACCELERATOR_TCG,
#endif /* defined(CONFIG_TCG) */
#if defined(CONFIG_KVM)
    ACCELERATOR_KVM,
#endif /* defined(CONFIG_KVM) */
#if defined(CONFIG_HAX)
    ACCELERATOR_HAX,
#endif /* defined(CONFIG_HAX) */
#if defined(CONFIG_HVF)
    ACCELERATOR_HVF,
#endif /* defined(CONFIG_HVF) */
#if defined(CONFIG_WHPX)
    ACCELERATOR_WHPX,
#endif /* defined(CONFIG_WHPX) */
#if defined(CONFIG_XEN_BACKEND)
    ACCELERATOR_XEN,
#endif /* defined(CONFIG_XEN_BACKEND) */
    ACCELERATOR__MAX,
} Accelerator;

... is expanded to:

typedef enum Accelerator {
    ACCELERATOR_QTEST,
    ACCELERATOR__MAX,
} Accelerator;

2/ softmmu code and qtest do get the definition, the enum
   is different:

typedef enum Accelerator {
    ACCELERATOR_QTEST,
    ACCELERATOR_KVM,
    ACCELERATOR__MAX,
} Accelerator;

qmp_query_accels() fills AcceleratorInfoList with 2 entries

3/ trying to understand what's happening, query-qmp-schema
   returns:

        {
            "name": "206",
            "tag": "name",
            "variants": [
                {
                    "case": "qtest",
                    "type": "0"
                },
                {
                    "case": "kvm",
                    "type": "0"
                }
            ],
            "members": [
                {
                    "name": "name",
                    "type": "403"
                }
            ],
            "meta-type": "object"
        },
        {
            "name": "403",
            "meta-type": "enum",
            "values": [
                "qtest",
                "kvm"
            ]
        },

So accelerators are listed, but with the same enum index?

4/ Running 'query-accels' aborts in qapi_enum_lookup():

The first entry 'qtest' is visited correctly.
When the second entry 'kvm' is visited, this assertion fires:

    assert(val >= 0 && val < lookup->size);

because lookup->size = 1 (remember from 1/ Accelerator_lookup
has been compiled without definitions, in libqemuutil.a).

I'll keep the current patch, as it works, and address the rest
of this series comments.

Thanks,

Phil.

