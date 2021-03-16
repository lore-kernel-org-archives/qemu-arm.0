Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4378643lfg;
        Tue, 16 Mar 2021 02:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm98g0iMkziaEI2snTcp0c6idcigJMy+sB9arViy24w4xoCZ2X7lFs3soq70Pj9VHpL0Z2
X-Received: by 2002:a92:d604:: with SMTP id w4mr3003578ilm.11.1615885433388;
        Tue, 16 Mar 2021 02:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615885433; cv=none;
        d=google.com; s=arc-20160816;
        b=eIN9rLrxzNItAMhHzMFbJCvutgVAaalttdWwb0f7HPXq/CCASgVsqy4/J1WBmML3Q4
         qBTh/Ijpt9gYu3EVBaIk+Qxt42gMjifnwQZvVwPQW5aHc+J5doQZvkFK8z33Wx/BVuZY
         utAYVtGZSoWLbhWr/sTjrXsoJFKIZcX3A7BIjszzVit9DTcB8gcXnQpXZ5y4X9j1dn/z
         8gQdjI1PdRNAVu3B0mMQRxdLZQPkAw7ckCnuWmBbrD0ePIpcN2uClSJz7dRnkFHQzvBv
         4AYG6bNJAW1Sv9PwFm+X1Y1pyDF6h76Mau+Royh/3oZTbkIQL3KqhIouZwk/9u/xNwUD
         FBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h4JytCPsg8Vm/OXgQAAjt+nN3FJcsc9v32THS8Hne38=;
        b=p93jK29AQIbUSV65ySms0b2F8qRfo4E6S/Xay306kB/2tOk0nrQ15w+SW24Rx92MoM
         syeKIs5fyzqPZm9FfJYPDHkjSBTqy1UeTITpFBqiW0x7ONol2vQ3nHZEQJl0iwxiy9FU
         YmzB4VMkpt/bGnPsgbcE0Q6JAMbqQsVcgwJGePlK+fPIgeTVb8FTRVTaDGBwNQFWlX1T
         5QF/2bTwAl1BosykyeVwaZr+R+2jD81fRaBoZeFgC1cjNXt2DcI7estahdAHI+YHWsTT
         nop/Lh4JXrTSHK17qOACkDm9EAgIkxWbGbhgAfHnzGvpG8N1bPPDnI7yBAzOfXOg43pg
         zBoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HPDjCcIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si13733285iod.60.2021.03.16.02.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 02:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HPDjCcIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM5cG-0002qc-MG
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 05:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5ba-0002QK-8Z
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 05:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5bX-00044a-BL
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 05:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615885385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4JytCPsg8Vm/OXgQAAjt+nN3FJcsc9v32THS8Hne38=;
 b=HPDjCcIXYheeueJoZiiGUH1xzjobuDh2rNtDd4jg9YM+iTadEYI33f6H4sPSwLWZSlDKsM
 cI0LgpqHeQv8vys/rfF2gIH5bD3ae8vZf9rcrOi/kH3opMSp8YnL/y55OPe3DU89eStvD9
 umyyJ+HmFvoD/OummkMkovybCrYniq0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-CCunpwHRP7qXceYU6z3AKg-1; Tue, 16 Mar 2021 05:03:02 -0400
X-MC-Unique: CCunpwHRP7qXceYU6z3AKg-1
Received: by mail-wr1-f70.google.com with SMTP id f3so16330798wrt.14
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4JytCPsg8Vm/OXgQAAjt+nN3FJcsc9v32THS8Hne38=;
 b=ruHyglERYCJEexMrVkNNdKBBkJ8PjOHYj7wknKqvoULHBnxsXnrghs1nsLKjdj4fhU
 qQGfhpGkAHlSynwOOjyTzT1JjjYiBKZ86+SLXCtywOEi+Fzvkvv0pAESWUSl8+QWGsFa
 ak8icWFblEyQmo3tWUixvX6QPWlYLOQU7YiMKhJbB4wB22SN2CRDABnbpJmUdiYoa6lw
 WgSEy1vJ1KZbU5tYCFylttPKLCT36zOau8aAR4gzSFYuW2BEkltwaJ2rCDbSCWnb1IUP
 MA1EG94R8o6l59xfM6mstzAt+55Vu5tseKRL+WCEDMbwOZVADh+NTimXJLnU+OmhKO/A
 4tzQ==
X-Gm-Message-State: AOAM532jwrVkg/Lih/mjClsEYvgXypZouHxt3rug6E0hn+jLLvpmhRHQ
 e8SNvjNLfDDsmNpNbGdwcW37WEZYJ1ZGNJlF4ca+il2fC/dOr5lGN4tMe6kQkjCMyiMDhbDXFfE
 hH5U2Jq0SuCat
X-Received: by 2002:adf:e603:: with SMTP id p3mr3745741wrm.360.1615885381709; 
 Tue, 16 Mar 2021 02:03:01 -0700 (PDT)
X-Received: by 2002:adf:e603:: with SMTP id p3mr3745696wrm.360.1615885381348; 
 Tue, 16 Mar 2021 02:03:01 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h10sm21420085wrp.22.2021.03.16.02.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 02:03:00 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Date: Tue, 16 Mar 2021 10:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87ft0va8wp.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iSa6bcHbfDuG

On 3/16/21 7:51 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
> [...]
>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>> new file mode 100644
>>> index 00000000000..f16e49b8956
>>> --- /dev/null
>>> +++ b/accel/accel-qmp.c
>>> @@ -0,0 +1,47 @@
>>> +/*
>>> + * QEMU accelerators, QMP commands
>>> + *
>>> + * Copyright (c) 2021 Red Hat Inc.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qapi/qapi-commands-machine.h"
>>> +
>>> +static const Accelerator accel_list[] = {
>>> +    ACCELERATOR_QTEST,
>>> +#ifdef CONFIG_TCG
>>> +    ACCELERATOR_TCG,
>>> +#endif
>>> +#ifdef CONFIG_KVM
>>> +    ACCELERATOR_KVM,
>>> +#endif
>>
>> ...would it be worth compiling the enum to only list enum values that
>> were actually compiled in?  That would change it to:
>>
>> { 'enum': 'Accelerator',
>>   'data': [ 'qtest',
>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>> ...

These accelerator definitions are supposed to be poisoned in generic
code... But I like the simplicity of your suggestion, so I'll give it
a try and see what happens with removing the poisoned definitions.

> Makes introspection more useful.  Management applications can get the
> information the list of compiled-in accelerators from query-qmp-schema.
> They don't have to be taught to use query-accels.
> 
> In fact, query-accels becomes useless except as a tool to force
> visibility of Accelerator in query-qmp-schema.  We wouldn't have to
> force if we had CLI introspection that shows the type of -accel's
> parameter @accel.  Adding a query command is a common work-around for
> our anemic CLI introspection capabilities.
> 
> The query command could be made more useful than introspection if it
> reflected run time state, i.e. it showed an accelerator only when the
> host system actually supports it.  Can't say how practical that would
> be.
> 
>>>
>>> +AcceleratorInfoList *qmp_query_accels(Error **errp)
>>> +{
>>> +    AcceleratorInfoList *list = NULL, **tail = &list;
>>> +
>>> +    for (unsigned i = 0; i < ARRAY_SIZE(accel_list); i++) {
>>> +        AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
>>> +
>>> +        info->name = accel_list[i];
>>> +
>>> +        QAPI_LIST_APPEND(tail, info);
>>> +    }
>>> +
>>> +    return list;
>>> +}
> 
> You could then use something like
> 
>         for (accel = 0; accel < ACCELERATOR__MAX; accel++) {
>             AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
> 
>             info->name = Accelerator_str(accel);
> 
>             QAPI_LIST_APPEND(tail, info);
>         }
> 

