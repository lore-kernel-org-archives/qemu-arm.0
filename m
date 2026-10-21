Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE8606A331
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HiUkqcwk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJWaT-0003ov-Uv; Wed, 21 Oct 2026 09:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xJWaL-0003nw-8J
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 09:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xJWaI-0006iJ-0a
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 09:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792590144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoQqnlAh3Ls7KPLyTc5XKOWCZoXoU1An/kpD3CljJvw=;
 b=HiUkqcwkvfSqYyLMmvrYh+oQGo7p/D80i9/0Uv7/XKWTdys/W9cw1d1y1mKdVVPUn0a9FR
 lK0hxJCFdFfxbA4bT10M/ONRtkw2jJZbqG8NAICocr0oZBVMbUiDt9cc1O++tgCo9hZdoQ
 2AuI4tGGh0QpDHBbqYO7o/CxjTVAAhw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-TU09RrR3O16qmcrYt7WI7g-1; Wed, 21 Oct 2026 09:42:23 -0400
X-MC-Unique: TU09RrR3O16qmcrYt7WI7g-1
X-Mimecast-MFC-AGG-ID: TU09RrR3O16qmcrYt7WI7g_1792590142
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8a0592d4539so891749b3a.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 06:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792590142; x=1793194942;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YoQqnlAh3Ls7KPLyTc5XKOWCZoXoU1An/kpD3CljJvw=;
 b=YM/uoHDmQ7QdHdml2Thn9aJQdgRZs56i/8p2zqXwIMJG0pyv4PXzmJDbGrWQKo0XeC
 3kYGyhTyWSWGk08ZO8b3qdmCMitIDIbQSFaqrICuhFymUAOk/bfuvCaSbhcV3IRwZQHa
 HwqwdfVHE+pi2VknsmAbO9C0kbQE5TYZA48PTgy88Qj8o63tIQjTauCa8DgPfmRVXW4s
 nLf77OlOX5M1zUyZ7G4Sl0UitV+9Ei+g9vbnQWr+rlebH//1lOn/D7lzIUZWJH5cY+9Y
 hdNB1QWFZ3AwEa99kmAJ3ltFrHgT9huIRQ15dlrz71iIuxJtdOHGqU/qEcC29+IAFT2f
 QtnA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3jWiJ02CWOu99U0Szq+gNLwjDtnzKg+8zJ9aIm/BvhmkLhxbC5bVMQMu9vLHkCQTuzHKn6WA1ng==@nongnu.org
X-Gm-Message-State: AFq9FYIke1ChDqv1sUHXumJ0QW8yby/pHdGjpIR6VxlInQ+lEO9f+W1I
 l97tmGa69CX01pouNPLh1gr0g14AxNf7zwhve6wt2iE/U1QV6nWoRDm5zzu1pPEnJQxR8r2qbUT
 iEE4HFqW2ICgyW/ulBtEM/LLuwSasH6uKi8FGE1fXjqWOCljD85y1IA==
X-Gm-Gg: AYBFou0sfF/TyRt9qwGb2JD7bbLiLsN+wMIQpA+/TRA3OBVgns7nJH6plTuWG7h19Fv
 JF2eahKYpN7y8dlMe+s+IOKYHKGxL4NbfdShDN+kepm7E/quOJR0rCVjF1SdyvJZuGZ6Pj9wFK/
 gsPTP0ydP22ctaasS5AKu09CpmMb8CR7OtSOC73/PHSRQ6C5Ihdai7x5nBz4KhmLLcykeCfB643
 qeMnXDgmnlnKOtMyt0Jj6fM8nSLyceajv8SXPVuO5VFT+ki4+uK5qCqPyTFnmFkt2b5gt0eLFh8
 s5YmGFS4lBTVof466fY1m0aHJnD1jrcgXaLlm+ssIxoZwozqKh009o/HPabxSLxEZUaHXpe0JIK
 WAWAr4dc8Mwu57KKJ4w0jLRatUVZpR7Ifdp6bWijS7g==
X-Received: by 2002:a05:6a00:a0c:b0:89e:779b:d0f with SMTP id
 d2e1a72fcca58-8a089dfdbb8mr1587943b3a.37.1792590141868; 
 Wed, 21 Oct 2026 06:42:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0c:b0:89e:779b:d0f with SMTP id
 d2e1a72fcca58-8a089dfdbb8mr1587908b3a.37.1792590141359; 
 Wed, 21 Oct 2026 06:42:21 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8a0895cce93sm934064b3a.30.2026.10.21.06.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 06:42:20 -0700 (PDT)
Message-ID: <784dfea3-24cb-4e70-ab46-b96b4b9a1831@redhat.com>
Date: Wed, 21 Oct 2026 23:42:14 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 03/24] target/arm: Add confidential guest support
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Kohei Enju <enju.kohei@fujitsu.com>, michael.roth@amd.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-4-mathieu.poirier@linaro.org>
 <dhrvydsmaw22xqx5d5i5s7fdyjxupz27yxp6trv2tesysp4npj@quvzrxjvfipz>
 <arI197vJkW75p50c@lpieralisi> <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain>
 <ataBkrIvULJXj4v6@p14s>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ataBkrIvULJXj4v6@p14s>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jH2B_ASfT6PBEffs7huX2nDpkBUzGFzUf8sH96-6VpU_1792590142
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 6:46 AM, Mathieu Poirier wrote:
> On Thu, Sep 24, 2026 at 12:12:35PM +0900, Kohei Enju wrote:
>> On 09/22 10:01, Lorenzo Pieralisi wrote:
>>> On Tue, Sep 15, 2026 at 04:27:21PM -0500, Michael Roth wrote:
>>>> On Thu, Sep 03, 2026 at 01:35:50PM -0600, Mathieu Poirier wrote:
>>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>>
>>>>> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
>>>>> support the Arm Realm Management Extension (RME). It is instantiated by
>>>>> passing on the command-line:
>>>>>
>>>>>    -M virt,confidential-guest-support=<id>
>>>>>    -object rme-guest,id=<id>
>>>>>
>>>>> This is only the skeleton. Support will be added in following patches.
>>>>>
>>>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> ---
>>>>>   docs/system/confidential-guest-support.rst |  1 +
>>>>>   qapi/qom.json                              | 13 +++++++
>>>>>   target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
>>>>>   target/arm/meson.build                     |  5 ++-
>>>>>   4 files changed, 60 insertions(+), 1 deletion(-)
>>>>>   create mode 100644 target/arm/kvm-rme.c
>>>>>
>>>>> diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
>>>>> index 562a7c3c2852..abb56923ad13 100644
>>>>> --- a/docs/system/confidential-guest-support.rst
>>>>> +++ b/docs/system/confidential-guest-support.rst
>>>>> @@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
>>>>>   * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
>>>>>   * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
>>>>>   * AWS Nitro Enclaves (see :doc:`nitro`)
>>>>> +* Arm Realm Management Extension (RME)
>>>>>   
>>>>>   Other mechanisms may be supported in future.
>>>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>>>> index 776b13027fd8..52997c29a32d 100644
>>>>> --- a/qapi/qom.json
>>>>> +++ b/qapi/qom.json
>>>>> @@ -1288,6 +1288,17 @@
>>>>>     'data': { '*pretty': 'bool',
>>>>>               '*close-action': 'MonitorQMPCloseAction' } }
>>>>>   
>>>>> +##
>>>>> +# @RmeGuestProperties:
>>>>> +#
>>>>> +# Properties for rme-guest objects.
>>>>> +#
>>>>> +# Since: 11.1
>>>>> +##
>>>>> +{ 'struct': 'RmeGuestProperties',
>>>>> +  'base': 'ConfidentialGuestSupportProperties',
>>>>
>>>> Just FYI, based on input from Markus I'm planning to drop this
>>>> ConfidentialGuestSupportProperties base type from my series
>>>> since it's probably only SNP/TDX that need to be able to switch
>>>> it on/off, whereas this series appears to use/require it from
>>>> the start.
>>>>
>>>> I'm not exactly sure what it will look like for v3 yet, but if you
>>>> were based on v2 you'd instead probably just do the following in the
>>>> instance_init function for your rme-guest instance:
>>>>
>>>>    cgs->allow_convert_in_place = true;
>>>>    cgs->convert_in_place = true;
>>>>
>>>> rather than exposing it as a cmdline option.
>>>
>>> Yep, it won't be an option for CCA Realms anyway since that will be
>>> the baseline.
>>
>> IIUC, in-place conversion requires RAM backed by a shared/mappable
>> guest_memfd. If in-place conversion is always enabled for CCA Realms,
>> could QEMU also select the equivalent of
>>
>>    -object memory-backend-guest-memfd,id=ram0,size=...,share=on
>>
>> automatically for the default RAM, so that specifying the RAM size with
>> `-m` is sufficient?
> 
> Are you suggesting that on Arm, we completely get rid of
> 
>      -object memory-backend-guest-memfd,id=ram0,size=$(RAMSIZE),share=on
> 
> or simply to get rid of "size=$(RAMSIZE)" in the above because it is redundant
> with "-m $(RAMSIZE)"?
> 
> Gavin and Michael, what is your take on that suggestion?
> 

I don't think that's what Kohei meant. He actually suggested the memory backend
shall be pinned to memory-backend-guest-memfd and its in-place conversion shall
be enabled when the memory backend isn't explicitly specified by users through
"-object memory-backend-xxxx". For this inexplicit case, where the memory backend
is determined by '-mem-path', the memory backend is either TYPE_MEMORY_BACKEND_FILE
or TYPE_MEMORY_BACKEND_RAM. Please refer to create_default_memdev().

I think Kohei's suggestion makes sense. Besides, I think '-mem-path' should be
disallowed for CCA Realms as TYPE_MEMORY_BACKEND_FILE isn't what we want.

Thanks,
Gavin

> Thanks,
> Mathieu
> 
>>
>> Thanks,
>> Kohei
>>
>>>
>>> Thanks,
>>> Lorenzo
>>>
>>>> Thanks,
>>>>
>>>> Mike
>>>>
>>>>> +  'data': {} }
>>>>> +
>>>>>   ##
>>>>>   # @ObjectType:
>>>>>   #
>>>>> @@ -1346,6 +1357,7 @@
>>>>>       { 'name': 'pr-manager-helper',
>>>>>         'if': 'CONFIG_LINUX' },
>>>>>       'qtest',
>>>>> +    'rme-guest',
>>>>>       'rng-builtin',
>>>>>       'rng-egd',
>>>>>       { 'name': 'rng-random',
>>>>> @@ -1427,6 +1439,7 @@
>>>>>         'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
>>>>>                                         'if': 'CONFIG_LINUX' },
>>>>>         'qtest':                      'QtestProperties',
>>>>> +      'rme-guest':                  'RmeGuestProperties',
>>>>>         'rng-builtin':                'RngProperties',
>>>>>         'rng-egd':                    'RngEgdProperties',
>>>>>         'rng-random':                 { 'type': 'RngRandomProperties',
>>>>> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
>>>>> new file mode 100644
>>>>> index 000000000000..42e1d1e7b859
>>>>> --- /dev/null
>>>>> +++ b/target/arm/kvm-rme.c
>>>>> @@ -0,0 +1,42 @@
>>>>> +/*
>>>>> + * QEMU Arm RME support
>>>>> + *
>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + *
>>>>> + * Copyright Linaro 2026
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +
>>>>> +#include "hw/core/boards.h"
>>>>> +#include "hw/core/cpu.h"
>>>>> +#include "kvm_arm.h"
>>>>> +#include "migration/blocker.h"
>>>>> +#include "qapi/error.h"
>>>>> +#include "qom/object_interfaces.h"
>>>>> +#include "system/confidential-guest-support.h"
>>>>> +#include "system/kvm.h"
>>>>> +#include "system/runstate.h"
>>>>> +
>>>>> +#define TYPE_RME_GUEST "rme-guest"
>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
>>>>> +
>>>>> +struct RmeGuest {
>>>>> +    ConfidentialGuestSupport parent_obj;
>>>>> +};
>>>>> +
>>>>> +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
>>>>> +                                          CONFIDENTIAL_GUEST_SUPPORT,
>>>>> +                                          { TYPE_USER_CREATABLE }, { })
>>>>> +
>>>>> +static void rme_guest_class_init(ObjectClass *oc, const void *data)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static void rme_guest_init(Object *obj)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static void rme_guest_finalize(Object *obj)
>>>>> +{
>>>>> +}
>>>>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>>>>> index 0369f96b4cc6..9d322a7aad28 100644
>>>>> --- a/target/arm/meson.build
>>>>> +++ b/target/arm/meson.build
>>>>> @@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
>>>>>   arm_common_system_ss.add(files(
>>>>>     'arm-qmp-cmds.c',
>>>>>   ))
>>>>> -arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
>>>>> +arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>>> +  'hyp_gdbstub.c',
>>>>> +  'kvm.c',
>>>>> +  'kvm-rme.c'))
>>>>>   arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
>>>>>   
>>>>>   arm_user_ss.add(files('cpu.c'))
>>>>> -- 
>>>>> 2.43.0
>>>>>
>>>>>
> 


