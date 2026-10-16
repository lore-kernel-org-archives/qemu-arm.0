Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A701CCA46D
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHcDd-0000V0-6G; Fri, 16 Oct 2026 03:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHcDY-0000UY-Bk
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 03:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHcDU-0001Vu-6L
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 03:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792135138;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3f9/6LgmaKsPXYha8cSw0gPoaJfxngHRSEJk4YtEG3A=;
 b=K+6QSHUoS5z+rtuewR4Ei/X8MLubfRzLNDiKJHplcxP7VmlYcYC3NVHz3pXmpx+D0v71Hu
 JXL7kUTDJlY5QJH+BN5B+OJ+4N8R6eCqwrM5BowuHrfw7RMpxUsjH5e68G6TUl5kGJlaOz
 fAkRTIukzDjsmd6VMQOmQnTnWcOqYRU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-6mnnewuUNseUNHJgYzH4iQ-1; Fri, 16 Oct 2026 07:18:57 +0000
X-MC-Unique: 6mnnewuUNseUNHJgYzH4iQ-1
X-Mimecast-MFC-AGG-ID: 6mnnewuUNseUNHJgYzH4iQ_1792135136
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4994d67d0e3so19727215e9.2
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 00:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792135136; x=1792739936;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3f9/6LgmaKsPXYha8cSw0gPoaJfxngHRSEJk4YtEG3A=;
 b=Yt3V2SJniV0d+iDh8j7zJGLPjaQsf5NE29LMMelmq3ue57aItw2fmIinBHTV0Vgmcb
 FW40PoILbaY9da4d/71wWiVcMmSuSV7IbYbwluayzfLaqhIvog4DH1JaglzIuYMtvL9w
 Cw4bJU5hbk9YtmPuER3MIFSCgL+gv5X74Sd+7Qq/QwX5MSqhw2OsYWsX30EpJ0iENnxC
 cwADjqLKycZut5th3tI6aQFnA3rTV9mf505GHwmEdxS2N1XFCgCZD9nFBUuU7RdvoNIV
 bsx33HF8DX6HFYZdADhOa1ZSGuqsQgswFPtuoFVX5LqmqHDs8noyqKidg3hYuklfMgKH
 SzOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz/l2ivLR/k3oE0wj2YKZ9e4R7kIFDLYPLfozOLITpKrwOL5IwL4ru4hRwXrRFiH6PK5SHa8V92/w==@nongnu.org
X-Gm-Message-State: AFq9FYLvMqh93C+dpi4ckc1YuaopccQ+Jgo8eSYoF4f/dcXTQG7LSZX0
 Wcq6Wd0sJ0sAOzP3gBzVva5xxJrQMp/SvLJlKK30AG+qoE/rV45XHQmDOv6yH/bYBQ+jX6qH+kO
 NbVAoU4jfMaSIhJMUNlDhAlaG6rPZlKrYL0SkxtbVdGa11WfDsvo5VQ==
X-Gm-Gg: AYBFou2pLhD+C48TEAuj0TGFa475lw/web8R9qn5CkOIcrUCJzr1+9yWkq0EEEACpP4
 uSR+pWDLT/XQykOyar6LXjO96Y4PB6Jiw4JJF8ZiDHCOhuXLfN4prV3WXmRAMW8CF/i6ppQemDv
 Z5ZX4t6OII9euYsPlugSI/KXbQiKmBNK226/8nLY+FQreMnXI7+kJ4OGYqiRuX8iLHv9ScKB3BC
 g/KEmQJ+UOBiAlSsCR4REBIMj+KTb9DGvGv9pKxCOy8m0UvBGuZVappgLsBLJNT6saaZN2CVya/
 sjOh4qAAmrPeg+GxPa3FBG7/IGKGlUjrSwW72UlawxZVP7i4vTdY2KqzaL0ogjqisXkDh3k5olX
 em0WI3AD0LPjU0Sw9IGktXdAr2dGmmg/bidc6pbVyq0Z/n8ag
X-Received: by 2002:a05:600c:e54a:10b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a1c6f89db5mr26497415e9.22.1792135135716; 
 Fri, 16 Oct 2026 00:18:55 -0700 (PDT)
X-Received: by 2002:a05:600c:e54a:10b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a1c6f89db5mr26496835e9.22.1792135135186; 
 Fri, 16 Oct 2026 00:18:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfdeb18f8sm2607552f8f.20.2026.10.16.00.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 00:18:54 -0700 (PDT)
Message-ID: <88da51b4-bead-4446-8f33-d77ff605b59a@redhat.com>
Date: Fri, 16 Oct 2026 09:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 23/25] qmp: add query-cpu-props-info command
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 "ping@khushitshah.com" <ping@khushitshah.com>,
 Sandesh Patel <sandesh.patel@nutanix.com>
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-24-khushit.shah@nutanix.com>
 <543a8f0a-bd66-4c13-8117-07f069a754d8@redhat.com>
 <95CBB54C-21CB-4594-8EA4-9C596ADB65EE@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <95CBB54C-21CB-4594-8EA4-9C596ADB65EE@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vbxd8kNijLTPw9wRRK9VrnqrTOLVMEhLAB8sex3B_BI_1792135136
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/16/26 8:57 AM, Khushit Shah wrote:
>
>> On 15 Oct 2026, at 7:50 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>>
>>
>> On 9/21/26 2:32 PM, Khushit Shah wrote:
>>> Introduce the 'query-cpu-props-info' QMP command. For each CPU model
>>> property, it reports the type (boolean or number) and the set of values
>>> supported under the active accelerator and host.
>>>
>>> This helps the management stack to discover which values are supported
>>> for a given CPU property. This is especially important for non-boolean
>>> properties, where knowing that the host has value 'x' does not
>>> inherently reveal the full range of valid values supported on the host.
>>> For example, an Arm host with CTR_EL0.L1Ip=3 (PIPT) also allows 2
>>> (VIPT) but a host with CTR_EL0.L1Ip=2 does not allow CTR_EL0.L1Ip=3
>>> for a guest.
>>>
>>> For numerical properties, the supported values are expressed as a list
>>> of inclusive {min, max} ranges. For boolean properties, they are
>>> represented as a list of true/false values.
>>>
>>> The command and its return types (CpuPropertyType, CpuPropertyInfo and
>>> friends) are defined in qapi/machine.json rather than an Arm-specific
>>> schema, since the concept applies to other targets (e.g. x86, RISC-V)
>>> too. Targets that do not implement it return an error.
>>> (The following commit implements the command for Arm KVM.)
>>>
>>> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
>>> ---
>>> qapi/machine.json          | 82 ++++++++++++++++++++++++++++++++++++++
>>> stubs/meson.build          |  1 +
>>> stubs/qmp-cpu-props-info.c | 12 ++++++
>>> tests/qtest/qmp-cmd-test.c |  1 +
>>> 4 files changed, 96 insertions(+)
>>> create mode 100644 stubs/qmp-cpu-props-info.c
>>>
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index 2d63c1bac3..6e65bdad86 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -2291,3 +2291,85 @@
>>> # Since: 1.2
>>> ##
>>> { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
>>> +
>>> +##
>>> +# @CpuPropertyType:
>>> +#
>>> +# The type of a CPU model property.
>>> +#
>>> +# @boolean: the property is of type boolean.
>>> +#
>>> +# @number: the property is of type unsigned integer.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'enum': 'CpuPropertyType',
>>> +  'data': [ 'boolean', 'number' ] }
>> why do we still need the boolean type? Can't we simplify and stick to
>> uint64_t for all SYSREG props?
> Hi Eric,
>
> Bools to support existing properties (sve, pauth, etc…) are booleans.
>>> +
>>> +##
>>> +# @CpuPropertyValueRange:
>>> +#
>>> +# An inclusive range of numeric values supported for the property.
>>> +#
>>> +# @min: the lowest supported value.
>>> +#
>>> +# @max: the highest supported value.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'struct': 'CpuPropertyValueRange',
>>> +  'data': { 'min': 'uint64', 'max': 'uint64' } }
>>> +
>>> +##
>>> +# @CpuPropertyInfoBoolean:
>>> +#
>>> +# @supported-values: list of boolean values supported for the
>>> +#     property.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'struct': 'CpuPropertyInfoBoolean',
>>> +  'data': { 'supported-values': ['bool'] } }
>> why can't you model that with a range too?
> I’m sorry I didn’t get you.

I meant I don't really understand why we need to bother about boolean
props and why we don't just model everything with list of uint64 ranges.
I was puzzled by "list of boolean values supported for the property" Eric
>
> Thanks,
> Khushit
>>> +
>>> +##
>>> +# @CpuPropertyInfoNumber:
>>> +#
>>> +# @supported-values: list of numeric value ranges supported
>>> +#     for the property.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'struct': 'CpuPropertyInfoNumber',
>>> +  'data': { 'supported-values': ['CpuPropertyValueRange'] } }
>>> +
>>> +##
>>> +# @CpuPropertyInfo:
>>> +#
>>> +# Information about a single CPU model property, including the values
>>> +# the host/accelerator supports for it.
>>> +#
>>> +# @name: the name of the property.
>>> +#
>>> +# @type: the type of the property, which selects the layout of
>>> +#     @supported-values.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'union': 'CpuPropertyInfo',
>>> +  'base': { 'name': 'str',
>>> +            'type': 'CpuPropertyType' },
>>> +  'discriminator': 'type',
>>> +  'data': { 'boolean': 'CpuPropertyInfoBoolean',
>>> +            'number': 'CpuPropertyInfoNumber' } }
>>> +
>>> +##
>>> +# @query-cpu-props-info:
>>> +#
>>> +# Return information about the CPU model properties.  For each
>>> +# property it reports the values supported under the active
>>> +# accelerator and host.
>>> +#
>>> +# Since: 11.2
>>> +##
>>> +{ 'command': 'query-cpu-props-info',
>>> +  'returns': ['CpuPropertyInfo'] }
>>> diff --git a/stubs/meson.build b/stubs/meson.build
>>> index 3b2f2680b1..3bb4028bab 100644
>>> --- a/stubs/meson.build
>>> +++ b/stubs/meson.build
>>> @@ -83,6 +83,7 @@ if have_system
>>>   stub_ss.add(files('qmp-i386-sgx.c'))
>>>   stub_ss.add(files('qmp-i386-xen.c'))
>>>   stub_ss.add(files('qmp-cpu.c'))
>>> +  stub_ss.add(files('qmp-cpu-props-info.c'))
>>>   stub_ss.add(files('qmp-cpu-s390x.c'))
>>>   stub_ss.add(files('qmp-cpu-s390x-kvm.c'))
>>>   stub_ss.add(files('hmp-cmd-info_mem.c'))
>>> diff --git a/stubs/qmp-cpu-props-info.c b/stubs/qmp-cpu-props-info.c
>>> new file mode 100644
>>> index 0000000000..36b0530b98
>>> --- /dev/null
>>> +++ b/stubs/qmp-cpu-props-info.c
>>> @@ -0,0 +1,12 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qapi/error.h"
>>> +#include "qapi/qapi-commands-machine.h"
>>> +
>>> +CpuPropertyInfoList *
>>> +qmp_query_cpu_props_info(Error **errp)
>>> +{
>>> +    error_setg(errp, "query-cpu-props-info not supported on this target");
>>> +    return NULL;
>>> +}
>>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>>> index 279a8f5614..2c25dbd8cb 100644
>>> --- a/tests/qtest/qmp-cmd-test.c
>>> +++ b/tests/qtest/qmp-cmd-test.c
>>> @@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
>>>         "add-fd",
>>>         /* Success depends on target arch: */
>>>         "query-cpu-definitions",  /* arm, i386, ppc, s390x */
>>> +        "query-cpu-props-info", /* arm + kvm */
>>>         "query-gic-capabilities", /* arm */
>>>         "query-s390x-cpu-polarization", /* s390x */
>>>         /* Success depends on target-specific build configuration: */
>> Thanks
>>
>> Eric
>


