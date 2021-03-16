Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4440966lfg;
        Tue, 16 Mar 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTOjkVrykv6WAD3as/GAQvkizYQHuavudgRPoJUu6q9zQwBKc8jqy1I2FCRs1qzGQbUUJl
X-Received: by 2002:a25:7d07:: with SMTP id y7mr5629250ybc.425.1615891332762;
        Tue, 16 Mar 2021 03:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615891332; cv=none;
        d=google.com; s=arc-20160816;
        b=V2o09uf/ugiIycekQqsNtfM3WQA5clZvGQ4w+06Sg9kXp+ALF6ScVdURuExhBEbKBH
         ZXLtVy0JUXK9Yte5iffosWl+7Rwg+cMBUZ2ZkFpuu6d40cVv/C2IX703UhRUnM9n5Nml
         y1K4BxdeGtAnhoXzSDEzdMojSg8NMZPky+hmJj5LKfbtxoR4mwE7dgb/NvL+Xu2zts1Q
         wwTeKsFJahQ7mm/tH1XwpOabOBDMHnbQH1BbNmd3OwAAK2LRVNz2BvNrHx7nRb4JdcUX
         CB7z+3nd7pbcMKqviYy70ukcO+04VwtyjSzzjgrr4LGYorY81ptcVeKqtgw7o5WF4ECq
         TWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=KPMNYQpNtKuYpbiiT213sa9IVlMFbgx2fzWYwoxDiX8=;
        b=I78WiV/mK7/3bdziPwWhGOQlAYbFwGdXDDFsOVEer2LVfzObsS+npqU/R58FKVOIio
         NKg1M8xWSTUC/EU7zzfGZZ82sBjyBo+05UiiOQ8HHTNX5P0ReiPOWyABWa4gC4YWMhxa
         XXFyh67W8gwq8u4OLQPI1niE/pvPaZf1doMFX95+1eEjgzlYnxxYUKbtfqMCkYwOqsOh
         xZE3xob7lpbjirckAMV0ykqbrlWcjsdBOoyjFNOLDu5WJi9mP8xWqxJabWY+EqpB3C22
         hH/2N1xSt1VZ78xpQ23tqaR6madNypIkRru1QFdGLvFNFCtGuub1rJIoFbStI01JM7M6
         3R2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UhfMMxvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si1177045ybf.205.2021.03.16.03.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 03:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UhfMMxvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM79Q-0006D5-4e
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 06:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM76t-0003vJ-Lb
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM76s-0003Dx-0a
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPMNYQpNtKuYpbiiT213sa9IVlMFbgx2fzWYwoxDiX8=;
 b=UhfMMxvmUgTbFkI9lOnPmUPjeDeJhbIzE+TfrYi72Ku9WmY9dWp0hfS4ffftvlnhTxfS25
 yheX5SFq8cmQUuqZ4o5P8gGA+BaSxRCCH1t4nYByY/rrr+o7zThh7+1XsqM+WPA23xlrvS
 wSB2KvYVU8U14P9AkI+ssYWnX5BoGNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-z2jktdFYOZSGyb5OPYLrgA-1; Tue, 16 Mar 2021 06:39:29 -0400
X-MC-Unique: z2jktdFYOZSGyb5OPYLrgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0E2A18D6A2C;
 Tue, 16 Mar 2021 10:39:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 597A44C;
 Tue, 16 Mar 2021 10:39:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CACDB1132C12; Tue, 16 Mar 2021 11:39:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Date: Tue, 16 Mar 2021 11:39:22 +0100
In-Reply-To: <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 16 Mar 2021 11:26:37
 +0100")
Message-ID: <878s6n4c2t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uu4RDAQKPk+A

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/16/21 10:02 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>> Eric Blake <eblake@redhat.com> writes:
>>>
>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
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
>>>>> +static const Accelerator accel_list[] =3D {
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
>>=20
>> These accelerator definitions are supposed to be poisoned in generic
>> code... But I like the simplicity of your suggestion, so I'll give it
>> a try and see what happens with removing the poisoned definitions.
>
> This is actually quite interesting :) Accelerator definitions are
> declared in config-target.h, but acceleration is host specific...
>
> We certainly don't want to make qapi target-specific.

We certainly don't want to make all the generated QAPI headers
target-specific.

We have made *selected* QAPI sub-modules target-specific, namely the
ones ending with "-target", currently qapi/machine-target.json and
qapi/misc-target.json.  Only these may use poisoned symbols in 'if'
conditions.  Example:

    { 'command': 'query-sev', 'returns': 'SevInfo',
      'if': 'defined(TARGET_I386)' }

