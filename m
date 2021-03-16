Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4669198lfg;
        Tue, 16 Mar 2021 08:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqwDgu6fJ9LQyxkI+Qz4OEliCF43o1180uwrqBC99AMRti1u8K2fswYwRJ/KbS6VYR2e6Q
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr36737386edv.336.1615908046955;
        Tue, 16 Mar 2021 08:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615908046; cv=none;
        d=google.com; s=arc-20160816;
        b=nMlI4ms3hxv/67KY55WAU+DwNxazeJ2vvQwPh3SFHcCqg+Fju5k7O42wKPcA6CKuSo
         tn76L1E2zYnEuqfu0QSoyuxn7V6NBP1JJiCcAusrK/6ES7er2gUMyS+y0ViyyWsEK/f2
         8MHPExEF9roPBz+eYaqSfE4Q+hJVQjO03ZMugABcYB4jJtGyygOvHZT4rHgIufIc5JE4
         6KVXmE0c0rPy0Rcrrx3Gc0+Yjrpn9uBq6mUcWoYS4Boe4URw3VM1Ya8LCcl2YzyqHY02
         EkdjmQZmQSkMz3YkRL+jjGpWpB+d+KaZ0V4uYYz9Gu3CRp6ZsPpbGEzal0tF+/VDixst
         E56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=KIGLa/sf+HIhoA0MAms1aH/HuMOl0M/JGu4GuaeB1FA=;
        b=0ZCDDupuV2MGOuK2egoDEXbYOA3/zl4TubjBTXIHTcpewogmcKnw59NxyJEGByLSdJ
         0LkcY26vTwciTEbk803+rXKUzJ52Oxlh32RiZKKjYYrE1ogCtVPGI2X7IqOhgeYQeN9P
         UpMtA4dlsjcadnMuqsZDeTNgA66VxpSl5UN5PCkcNG+OAmw1NtNrYxvtY4NbnZ7PoFpG
         apuHtMBeuyif6o5GQoMB29A1EVj2W0WIsVYh8vOkqmu8PwlUlESB1bUhb0BUNiUKszC9
         6bfIoQxGt8GnFkrV7w38CTwVCiSZKVGKTkretD1T5sscQ2a4V5bG0gabKYxrWTOy6a3j
         fUbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9LlqOM5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id gr2si14163903ejb.65.2021.03.16.08.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9LlqOM5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615908045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIGLa/sf+HIhoA0MAms1aH/HuMOl0M/JGu4GuaeB1FA=;
	b=H9LlqOM50uXKk8NAntl0iSE8X3HXmlEbqyaevFkCLchgESlH5RpndFn804oKufw2kp9lcC
	cZ47O9gtpFvJsvcPefGJsrVQJZ1GpG315IdtQCmR12gxKK5zeEXc5p8ncPskkUqXR1B3kL
	oHm3KoGE17MLfUhvoSJ7o8eN14szEv4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-BJxaoy3oP52jzU9D78cCuQ-1; Tue, 16 Mar 2021 11:20:44 -0400
X-MC-Unique: BJxaoy3oP52jzU9D78cCuQ-1
Received: by mail-wr1-f72.google.com with SMTP id h21so16687399wrc.19
        for <alex.bennee@linaro.org>; Tue, 16 Mar 2021 08:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KIGLa/sf+HIhoA0MAms1aH/HuMOl0M/JGu4GuaeB1FA=;
        b=bwT2/T3zLQ5u4ASiqquR48cIRTNNiRCL/GCSJOGN1s3kG367olwL2iN5y2JgFpkRYp
         odUSytX1X4T3MWIra5qGOE4f22w/DyGTQRxo/EVOYp5KUlzIZ5ZqjDqDaqrKQ8z4Zsmc
         rH2ZIUHBpHmL0eaX3lHgWwTz9mWBMyd6R4u9zZ/TOTzlY6tHMTk1D3+wURZpK3ImixdR
         60OM59S4Z63pprZ81nrIM0wqfqDQ2j5Zl26uwoLBiOziOeWj9tRehVo7oLrI/KM7rs0j
         XKrVqHNN2Fb1j0I4N9QWFbVvk2wAQtrKTyjO/E+vHQR+BMW6zk01iFt0iA0Jqkmpe8Ua
         hX7A==
X-Gm-Message-State: AOAM533pF/Gl84O+t/3k5MgoPBxMrtVuHD/ugXsLvPp9CK3vP0Q556Rm
	91LcEFmBrInWRSug6hVf6EH6mDMf5XC+qvZRfaXMlbcZ8Eor7kDL+CTzoByaNQUAS28529XswrK
	aU8V8VdFlx53YCe/nOPUjnUFonxL+moySWYlnxjNCjVANsZOk6/t1Xlmxc0fdb/XvsQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr161881wmc.65.1615908042445;
        Tue, 16 Mar 2021 08:20:42 -0700 (PDT)
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr161861wmc.65.1615908042253;
        Tue, 16 Mar 2021 08:20:42 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id j30sm24955190wrj.62.2021.03.16.08.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:20:41 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
 <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
 <875z1rl18h.fsf@dusky.pond.sub.org>
 <57f03668-a73a-32f2-bce8-4d70a13ccf77@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7422fac-fa3d-f220-aea6-184b7d711b1f@redhat.com>
Date: Tue, 16 Mar 2021 16:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <57f03668-a73a-32f2-bce8-4d70a13ccf77@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3JH36cas46Bd

On 3/16/21 1:48 PM, Thomas Huth wrote:
> On 16/03/2021 13.41, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 3/16/21 11:26 AM, Philippe Mathieu-Daudé wrote:
>>>> On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
>>>>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>>>>> Eric Blake <eblake@redhat.com> writes:
>>>>>>
>>>>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>>>>>> [...]
>>>>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>>>>> new file mode 100644
>>>>>>>> index 00000000000..f16e49b8956
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/accel/accel-qmp.c
>>>>>>>> @@ -0,0 +1,47 @@
>>>>>>>> +/*
>>>>>>>> + * QEMU accelerators, QMP commands
>>>>>>>> + *
>>>>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>>>>> + *
>>>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include "qemu/osdep.h"
>>>>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>>>>> +
>>>>>>>> +static const Accelerator accel_list[] = {
>>>>>>>> +    ACCELERATOR_QTEST,
>>>>>>>> +#ifdef CONFIG_TCG
>>>>>>>> +    ACCELERATOR_TCG,
>>>>>>>> +#endif
>>>>>>>> +#ifdef CONFIG_KVM
>>>>>>>> +    ACCELERATOR_KVM,
>>>>>>>> +#endif
>>>>>>>
>>>>>>> ...would it be worth compiling the enum to only list enum values
>>>>>>> that
>>>>>>> were actually compiled in?  That would change it to:
>>>>>>>
>>>>>>> { 'enum': 'Accelerator',
>>>>>>>    'data': [ 'qtest',
>>>>>>>              { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>>>>> ...
>>>>>
>>>>> These accelerator definitions are supposed to be poisoned in generic
>>>>> code... But I like the simplicity of your suggestion, so I'll give it
>>>>> a try and see what happens with removing the poisoned definitions.
>>>>
>>>> This is actually quite interesting :) Accelerator definitions are
>>>> declared in config-target.h, but acceleration is host specific...
>>>
>>> Thomas, I guess I hit Claudio's reported bug again...
>>>
>>> 1/ generic libqemuutil.a is built without any CONFIG_accel definition.
>>>
>>> So this qapi-generated enum ... :
>>>
>>> typedef enum Accelerator {
>>>      ACCELERATOR_QTEST,
>>> #if defined(CONFIG_TCG)
>>>      ACCELERATOR_TCG,
>>> #endif /* defined(CONFIG_TCG) */
>>> #if defined(CONFIG_KVM)
>>>      ACCELERATOR_KVM,
>>> #endif /* defined(CONFIG_KVM) */
>>> #if defined(CONFIG_HAX)
>>>      ACCELERATOR_HAX,
>>> #endif /* defined(CONFIG_HAX) */
>>> #if defined(CONFIG_HVF)
>>>      ACCELERATOR_HVF,
>>> #endif /* defined(CONFIG_HVF) */
>>> #if defined(CONFIG_WHPX)
>>>      ACCELERATOR_WHPX,
>>> #endif /* defined(CONFIG_WHPX) */
>>> #if defined(CONFIG_XEN_BACKEND)
>>>      ACCELERATOR_XEN,
>>> #endif /* defined(CONFIG_XEN_BACKEND) */
>>>      ACCELERATOR__MAX,
>>> } Accelerator;
>>>
>>> ... is expanded to:
>>>
>>> typedef enum Accelerator {
>>>      ACCELERATOR_QTEST,
>>>      ACCELERATOR__MAX,
>>> } Accelerator;
>>
>> CONFIG_KVM, CONFIG_TCG, ...  are defined in ${target}-config-target.h,
>> and may only be used in target-specific code.
>>
>> If the enum ends up in libqemuutil.a, there are uses outside
>> target-specific code.
>>
>> exec/poison.h lacks CONFIG_KVM, CONFIG_TCG, ...  Should they be added?
> 
> CONFIG_KVM is already in poison.h, and CONFIG_TCG cannot be added there
> since it is also defined in config-host.h. But the other accelerator
> switches should be marked as poisoned, too.

Maybe we hit "exec/poison.h" limit. Maybe it is too wide / generic,
and need split, or multiple ones.

Should we redefine on which code area we want these definitions
poisoned?

AFAIK accel/ is not target specific but host specific.

My list of area / useful to poison:

- user-mode
  . non-tcg accel
  . hardware emulation

- generic hardware emulation
  . target specific
  . accel specific

For this one it is already too late:

- target acceleration
  . hardware emulation

Thoughts?
