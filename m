Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4534051lfg;
        Tue, 16 Mar 2021 05:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0JDCpmfY/6EEHjqF7wuWWW4OTOkqWv/sEoknOOTXnP6Tvttro1IAcTPXvgD2IBdIiy6vA
X-Received: by 2002:a05:6e02:1049:: with SMTP id p9mr3580419ilj.125.1615898913361;
        Tue, 16 Mar 2021 05:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615898913; cv=none;
        d=google.com; s=arc-20160816;
        b=jty6iHvAe17bQjq91dtRH7W+m8xW+AGLnOHYkUMc61dZumLPv55L/ZPqICvqPev6hn
         w0TY5mO0KRXSRF6csXSEG5f31BesJNb/GXDF4/aLiCePffnYzhegfCelYVT/NfwhcZIw
         mnptsyTk4WWBIe1VufUdr4T0jgqk8tRFAjBG8i+cFSk5V7m6Qq6QAc1EaWg5qV0ZntGg
         gFZw2J0n+AjKdtvzS+4kbmU1FoR08du4CXy15EV4jxdBJy+vYKvzBhafzV1LtZbTgrlR
         UsaOrXveldD/o+kMpMKd6o5r8BkLds3UfX4HYlP/FupVUUe9i1JlXUIAKirC2vfxA/5x
         7reQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aEJIdtx3NygSAgiyhOoYN6SvXkEAQAJZhUpweFnx6Oc=;
        b=NP0xOXsXkfByf4AVPI0j1VnJXlnvMtU6tPWS8P98esHKPTNRURtZnuAAQHza2fhHSr
         nQJbljh8GU42pv9Ksx2xlZxINvBoY/6oaQIHjSMGGWrc/YfQTtIm9rOESOJqClIP6R2B
         T2S2zjziCk3L/lJFI98Ixll79+ubUnI1goanfLLLaWNFLqBEj5gBp534OFaT0lCja4Tn
         UPhAunsF9SGjx4pJabxznnJx65CsOz5EkfhKPgr3Mf8eWL94hEyO6ANA5OmRLQ7M+dOv
         vCyDq4bkppegif2qeqatZdymBeITMUFlrzTHN73QK4ySEcEiUIXka9pQfkXi3kbC5Nyj
         y5dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iwzy28XE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si13060900jan.4.2021.03.16.05.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 05:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iwzy28XE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM97f-0002FD-IQ
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 08:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM97X-0002Ea-Do
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 08:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM97V-0003SV-NS
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 08:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615898900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEJIdtx3NygSAgiyhOoYN6SvXkEAQAJZhUpweFnx6Oc=;
 b=iwzy28XENoeONDcJe4uMpRKprI5zh+twf8ln7G6LDiXJdVaR1mrKf3H1lraSuKnBnV3ryI
 FVCHrxbv2H0OkBLONSD8KorlD9zVufpF2Kf35jrZPfexkdpjA1TU6n/wqm6Frf4da9PJ/M
 WeH9yoOM9zYrEIP3ClgwUd1MuEkVOb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-bJPOeo6eMLi0Ou7u9JDUzg-1; Tue, 16 Mar 2021 08:48:19 -0400
X-MC-Unique: bJPOeo6eMLi0Ou7u9JDUzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30E1801817;
 Tue, 16 Mar 2021 12:48:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34FE719CAD;
 Tue, 16 Mar 2021 12:48:11 +0000 (UTC)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
 <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
 <875z1rl18h.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <57f03668-a73a-32f2-bce8-4d70a13ccf77@redhat.com>
Date: Tue, 16 Mar 2021 13:48:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <875z1rl18h.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/q1pUQ/xRkE

On 16/03/2021 13.41, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 3/16/21 11:26 AM, Philippe Mathieu-Daudé wrote:
>>> On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
>>>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>>>> Eric Blake <eblake@redhat.com> writes:
>>>>>
>>>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>>>>> [...]
>>>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>>>> new file mode 100644
>>>>>>> index 00000000000..f16e49b8956
>>>>>>> --- /dev/null
>>>>>>> +++ b/accel/accel-qmp.c
>>>>>>> @@ -0,0 +1,47 @@
>>>>>>> +/*
>>>>>>> + * QEMU accelerators, QMP commands
>>>>>>> + *
>>>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>>>> + *
>>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include "qemu/osdep.h"
>>>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>>>> +
>>>>>>> +static const Accelerator accel_list[] = {
>>>>>>> +    ACCELERATOR_QTEST,
>>>>>>> +#ifdef CONFIG_TCG
>>>>>>> +    ACCELERATOR_TCG,
>>>>>>> +#endif
>>>>>>> +#ifdef CONFIG_KVM
>>>>>>> +    ACCELERATOR_KVM,
>>>>>>> +#endif
>>>>>>
>>>>>> ...would it be worth compiling the enum to only list enum values that
>>>>>> were actually compiled in?  That would change it to:
>>>>>>
>>>>>> { 'enum': 'Accelerator',
>>>>>>    'data': [ 'qtest',
>>>>>>              { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>>>> ...
>>>>
>>>> These accelerator definitions are supposed to be poisoned in generic
>>>> code... But I like the simplicity of your suggestion, so I'll give it
>>>> a try and see what happens with removing the poisoned definitions.
>>>
>>> This is actually quite interesting :) Accelerator definitions are
>>> declared in config-target.h, but acceleration is host specific...
>>
>> Thomas, I guess I hit Claudio's reported bug again...
>>
>> 1/ generic libqemuutil.a is built without any CONFIG_accel definition.
>>
>> So this qapi-generated enum ... :
>>
>> typedef enum Accelerator {
>>      ACCELERATOR_QTEST,
>> #if defined(CONFIG_TCG)
>>      ACCELERATOR_TCG,
>> #endif /* defined(CONFIG_TCG) */
>> #if defined(CONFIG_KVM)
>>      ACCELERATOR_KVM,
>> #endif /* defined(CONFIG_KVM) */
>> #if defined(CONFIG_HAX)
>>      ACCELERATOR_HAX,
>> #endif /* defined(CONFIG_HAX) */
>> #if defined(CONFIG_HVF)
>>      ACCELERATOR_HVF,
>> #endif /* defined(CONFIG_HVF) */
>> #if defined(CONFIG_WHPX)
>>      ACCELERATOR_WHPX,
>> #endif /* defined(CONFIG_WHPX) */
>> #if defined(CONFIG_XEN_BACKEND)
>>      ACCELERATOR_XEN,
>> #endif /* defined(CONFIG_XEN_BACKEND) */
>>      ACCELERATOR__MAX,
>> } Accelerator;
>>
>> ... is expanded to:
>>
>> typedef enum Accelerator {
>>      ACCELERATOR_QTEST,
>>      ACCELERATOR__MAX,
>> } Accelerator;
> 
> CONFIG_KVM, CONFIG_TCG, ...  are defined in ${target}-config-target.h,
> and may only be used in target-specific code.
> 
> If the enum ends up in libqemuutil.a, there are uses outside
> target-specific code.
> 
> exec/poison.h lacks CONFIG_KVM, CONFIG_TCG, ...  Should they be added?

CONFIG_KVM is already in poison.h, and CONFIG_TCG cannot be added there 
since it is also defined in config-host.h. But the other accelerator 
switches should be marked as poisoned, too. I've got a patch for this in the 
works already - I'll send it out in a minute...

  Thomas

