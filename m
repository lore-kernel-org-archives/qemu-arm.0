Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1031521lfg;
        Fri, 12 Mar 2021 00:46:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza9L8+CT0WuNghSs9ViIdZcJY+WWOaSTjgrE1ivEeHgNSKBJqKvbTUWhTuKfaSq/CvWQBJ
X-Received: by 2002:a25:d650:: with SMTP id n77mr18048876ybg.69.1615538819235;
        Fri, 12 Mar 2021 00:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615538819; cv=none;
        d=google.com; s=arc-20160816;
        b=hu9vBxvrL3LhlB9NFVqWYuvU9YXTbHy7ryav6goOK1Pj+f6P18RBMM3Zf8v/sx16ky
         tlaPaeSTEveCjXkhYe+1/Q7JiRdBGe8VuV2kfB8PJRPb/nmkSXxaNEMUZ5xZsrkIlcpV
         vNRuM5QSL2X8mFknHBwxcJ1GmoUxE8/XoVFcn6Grl9NQb7h+Ls9GwAsWu8pOBUGOkMhh
         3z4Ua3ocvi37cLMuHIR9CNSft2Ajzd3dlv9kbE+9nXZP53XY5Yoob00mSe0QmfXxeTo5
         12bVsTCG2E0Q3m2hRbry2LGNfNgwRr4LKb0ttCVVosPaCqer2nV/QU0aJsRd7G+V3LaF
         sukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wsqngZTY25BbWncOavqfD9nABSwqRt4E6vvqLuMxqgY=;
        b=YwyJ6c5eEmc8ce2d9yqr52E3ZX72aqCv9NySt4wZ/k3KUBouuelgQLlxD8Dlu0Cyaz
         DEITmdFAf7KvlrsHH3PH0xJL9isnkqBHAfdWJCXUWR4LpzhAjsHSycM5b+RAJpYSKImT
         dsDloGo/S1dhzySW4v2jewGtaJ5joyna5l36XkV/gUUGstauaKCj1YVngk/b92WRv5SG
         a+ivuPCyHptC8aopo/8cQT2OqkwyoNl5yp7+WBTRgEx9xWb5djCwQxrnjOZFc8pzBdJN
         Jyrf0+rY7dAoodPUcCAu9Pvao4dPx6xItF5s5YNoHISQSBrVErjzb7zwGeqsHnzn8rVo
         SdbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si5332948yba.278.2021.03.12.00.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 00:46:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKdRi-0008S4-Jk
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 03:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKdRW-0008Rq-QO; Fri, 12 Mar 2021 03:46:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:60600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKdRU-0008JJ-VA; Fri, 12 Mar 2021 03:46:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1BFD4AF3D;
 Fri, 12 Mar 2021 08:46:43 +0000 (UTC)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b0eabd3c-b044-0420-d7e7-175c8f2b8206@suse.de>
Date: Fri, 12 Mar 2021 09:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cuwvNuHZsMUM

On 3/12/21 8:42 AM, Marc-André Lureau wrote:
> On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daudé <philmd@redhat.com>
> wrote:
> 
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerators names.
>>
>> - Accelerator is an QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "type": "qtest"
>>             },
>>             {
>>                 "type": "kvm"
>>             }
>>
> 
> s/type/name (in this version)
> 
>         ]
>>     }
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>>  accel/accel-qmp.c | 47 ++++++++++++++++++++++++++++++++++++++++
>>  accel/meson.build |  2 +-
>>  3 files changed, 103 insertions(+), 1 deletion(-)
>>  create mode 100644 accel/accel-qmp.c
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 330189efe3d..ffbf28e5d50 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1471,3 +1471,58 @@
>>  ##
>>  { 'event': 'MEM_UNPLUG_ERROR',
>>    'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [ { 'name': 'qtest' },
>> +            { 'name': 'tcg' },
>> +            { 'name': 'kvm' },
>> +            { 'name': 'hax' },
>> +            { 'name': 'hvf' },
>> +            { 'name': 'whpx' },
>> +            { 'name': 'xen' } ] }
>> +
>>
> 
> Why not use a simple enum?
> 
> +##
>> +# @AcceleratorInfo:
>> +#
>> +# Accelerator information.
>> +#
>> +# @name: The accelerator name.
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'union': 'AcceleratorInfo',
>> +  'base': {'name': 'Accelerator'},
>> +  'discriminator': 'name',
>> +  'data': { } }
>>
> +
>>
> 
> Making room for future details, why not.
> 
> +##
>> +# @query-accels:
>> +#
>> +# Get a list of AcceleratorInfo for all built-in accelerators.
>> +#
>> +# Returns: a list of @AcceleratorInfo describing each accelerator.
>> +#
>> +# Since: 6.0
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "query-accels" }
>> +# <- { "return": [
>> +#        {
>> +#            "type": "qtest"
>> +#        },
>> +#        {
>> +#            "type": "kvm"
>> +#        }
>> +#    ] }
>> +#
>> +##
>> +{ 'command': 'query-accels',
>> +  'returns': ['AcceleratorInfo'] }
>>
> 
> That's nice, but how do you know which accels are actually enabled?


Maybe for clarity this could be 'query-accels-available' (which is probably the goal of this series).
Possibly a separate one would be 'query-accel-enabled'?

Can we see these commands being used for libvirt too, to improve feature detection? Are these useful beyond the confines of just testing?
I would think so right?

Ciao,

Claudio


> 
> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>> new file mode 100644
>> index 00000000000..f16e49b8956
>> --- /dev/null
>> +++ b/accel/accel-qmp.c
>> @@ -0,0 +1,47 @@
>> +/*
>> + * QEMU accelerators, QMP commands
>> + *
>> + * Copyright (c) 2021 Red Hat Inc.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/qapi-commands-machine.h"
>> +
>> +static const Accelerator accel_list[] = {
>> +    ACCELERATOR_QTEST,
>> +#ifdef CONFIG_TCG
>> +    ACCELERATOR_TCG,
>> +#endif
>> +#ifdef CONFIG_KVM
>> +    ACCELERATOR_KVM,
>> +#endif
>> +#ifdef CONFIG_HAX
>> +    ACCELERATOR_HAX,
>> +#endif
>> +#ifdef CONFIG_HVF
>> +    ACCELERATOR_HVF,
>> +#endif
>> +#ifdef CONFIG_WHPX
>> +    ACCELERATOR_WHPX,
>> +#endif
>> +#ifdef CONFIG_XEN_BACKEND
>> +    ACCELERATOR_XEN,
>> +#endif
>> +};
>> +
>> +AcceleratorInfoList *qmp_query_accels(Error **errp)
>> +{
>> +    AcceleratorInfoList *list = NULL, **tail = &list;
>> +
>> +    for (unsigned i = 0; i < ARRAY_SIZE(accel_list); i++) {
>> +        AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
>> +
>> +        info->name = accel_list[i];
>> +
>> +        QAPI_LIST_APPEND(tail, info);
>> +    }
>> +
>> +    return list;
>> +}
>> diff --git a/accel/meson.build b/accel/meson.build
>> index b44ba30c864..7a48f6d568d 100644
>> --- a/accel/meson.build
>> +++ b/accel/meson.build
>> @@ -1,4 +1,4 @@
>> -specific_ss.add(files('accel-common.c'))
>> +specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
>>  softmmu_ss.add(files('accel-softmmu.c'))
>>  user_ss.add(files('accel-user.c'))
>>
>> --
>> 2.26.2
>>
>>
>>
> 

