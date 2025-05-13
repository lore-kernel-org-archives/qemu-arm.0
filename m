Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp589566njb;
        Tue, 13 May 2025 08:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz3ey6gWBseI3JEmBAfyIkEs1Wv2cu92FU9NK2BgpwdHcPWeJZBqaUsWGt/R1PjrqkUs5V97J+zgy3FQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG9wUD1OP8Zsm5cE6ydnZGP9Ubqbg+vyAElx8z5Wptayry3vtCMY6ufz15CsTX7Os0+3J+W
X-Received: by 2002:a05:6830:2902:b0:730:5d6:5990 with SMTP id 46e09a7af769-73226b04154mr12535005a34.24.1747149125675;
        Tue, 13 May 2025 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747149125; cv=none;
        d=google.com; s=arc-20240605;
        b=kot7pBvNwLJzNIxiT48Vs7gzdt6bFqK8MtYeuVvFFSP7+RRBAbOXHjE9j31tiEU8sB
         pwX3KF0ZGH21kedtUQXwOk3muQAONtZz+Kul4FUngucINgGWMx5QZQhPgO9w+9a+Le3h
         98MG3BFitCqsjSffqkDgM3zl2STd1kHB8fNci9ARD7l3GTJYBKdkGnXLYa38cKXzSmiA
         fmablmLENcBieSSvEL6nEfL0UbG85s7VezskynakLBjUMlBKm5huCnZc8UgiEH22mMLp
         ftNPKR3ak65Ht//8xo5Cdq8BOAxFv5kwAQH/TEpYYIMIoxI+fbcGzW/HT0ZWxy4GXOXB
         UMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8/KQTBCUFT6lIczxYv9kya2WRKORWdtfT/IOQQeFA4I=;
        fh=16OBzPJVG1BQ2X3F/eQFhWQyGvJuDlG1OYiaNSTWbB8=;
        b=Hy9u7qySiqhuIraJvlLuO6jB9fJBxmPg1hMFtKVXfrxkhxCv4vIprL2yKPz+ifGwVc
         wBXi3zgsUwdLeTrVPUIzbJibfh4IJJ3a70lN+m/YtL+YoooaKAtPtw33yAlM7jiYnfDb
         vHmgDJky7ho7YogEDJm4enh6ooh3DJ3/1bLIzb4OdyZX/CgTQlUGdsBb7+HXHW1qSEEJ
         PyFEMbHlVDGHEO7zKMUaGNXx8d/z+S121jo6DiocnCfi4g1JauRWUvjnYTCi1u5IGpX3
         Zh3XCQmQym4PL9FBjDQpPgaiAlD7PBO7O1fmEYRFMgsrWDx75q5FQlbMkee7dqFja9RF
         FGcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1X25Qs1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb1fefacdsi4342059137.208.2025.05.13.08.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1X25Qs1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747149125;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/KQTBCUFT6lIczxYv9kya2WRKORWdtfT/IOQQeFA4I=;
	b=Q1X25Qs14OpVXU57vKlfTn11CEX3jsKh7vgV8rQ6WQzpVGGxcm7azcjReG/prCOrs5yXio
	15qfNspBjtohGbCDA3cylfxaRS0ma9Y9tLhkkL6xWKqC2PyZaRpkpPXjg61v80sNtBbCtU
	E8UeZ+YsLagYWStj28mE2No+la5sqYI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-R-f-NGGfN4SUgAtJz4cWhQ-1; Tue, 13 May 2025 11:12:04 -0400
X-MC-Unique: R-f-NGGfN4SUgAtJz4cWhQ-1
X-Mimecast-MFC-AGG-ID: R-f-NGGfN4SUgAtJz4cWhQ_1747149123
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43efa869b19so39378345e9.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 08:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149123; x=1747753923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/KQTBCUFT6lIczxYv9kya2WRKORWdtfT/IOQQeFA4I=;
        b=Pi84w73U40GRlPUBtY8nFWEQVNC4cNMaqnKhCRXv3b/oB1A57gKThwwMCvRmbKCwRk
         XMYy9ZI6Vm5+G2LN1wv7zPsM3WFqHEAOlcER1LNZF7DfbHMC5V9/264B8H0Gd7/YAnOe
         xANW8fM6LxK/XpU/UWbozPV3r361oCxwr65dpYR3Sq6N1i9JwQZJE1PuV7zGrmVlZyOq
         SFsX22AWdJEd0DOSpWNwZy08L6QFZbZdEgYcykcjds8wHRH2M96Js6C/e896xjdP9kaz
         Cax7u19ndd26cBiqYtM77dWx2LMFgLLRjPO20pu9URgB0BCPQyz7Ofozri2BJNHQRAyT
         3dXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCQTbz1CXZKLduHI9tq+Xk7ZggLUjdOvTBT2P1g3TwOURl/dADMSW2GK2lduucNpNgCjc/1MhezT5I4A==@linaro.org
X-Gm-Message-State: AOJu0YyeIVi1qa33pil632ZB/cqAlEhQHJjKY7sbgaoqB19s0n7+lKDs
	2us4LD5O8kKC6ri0/YMtgWDsKi10n9Nawvjws9DvHu0ICSygXGNLnS0FgwooLGxkLxy0lHwEUR4
	Xp7u4Zk7YbxwD0kke8bM3+DGRw8aneftx1uRSBWPxIlAhiRQV9c4X1A==
X-Gm-Gg: ASbGnctFgsqfR46/7SifLDogo4f0Vbb6ywJbvbC03QkDdgNlV0NbISXeQ04Rptztt4U
	yjIbrF5E+ekIesvE4oiTdQTkrF568r92+HgIhY178iVPhnzDTDtHPmmrx9JzIgY0qR6oTH7zdCM
	RIyjWj0Ee8N3n/cVrd18VXSnGmSSMXWIQBdrRuzhcjxez2OJCK2mswdtYrKpTDuEyyK9VDsOJef
	OIt2E/pOIH7BX/UuQGIIYWHIaB3AMgfdUfpC6x31uxx8lt9Mkx2L02JacNyHLUUWOI2KqM/zTm3
	Ex2HDcvdOznr3RerH23thk77wE5qZpVBq5TCweJVN4z+n9gcf3JWz9I5aLA=
X-Received: by 2002:a05:600c:4454:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-442d6d44bd0mr180390855e9.13.1747149122884;
        Tue, 13 May 2025 08:12:02 -0700 (PDT)
X-Received: by 2002:a05:600c:4454:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-442d6d44bd0mr180390485e9.13.1747149122480;
        Tue, 13 May 2025 08:12:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm16745142f8f.92.2025.05.13.08.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:12:01 -0700 (PDT)
Message-ID: <3ad1d053-8a11-4a28-9a94-778389addfeb@redhat.com>
Date: Tue, 13 May 2025 17:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 01/10] arm/cpu: Add infra to handle generated ID
 register definitions
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-2-cohuck@redhat.com>
 <6c06a198-1608-4919-8b6e-68e3c28c2526@redhat.com> <87bjrwppwj.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87bjrwppwj.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 09x1TSaZWruqOD7Bh5H1iqK9EYZger_95RIzzC8ahnE_1747149123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: +hVareGd4TKq



On 5/13/25 4:05 PM, Cornelia Huck wrote:
> On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Connie,
>>
>> On 4/14/25 6:38 PM, Cornelia Huck wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> The known ID regs are described in a new initialization function
>>> dubbed initialize_cpu_sysreg_properties(). That code will be
>>> automatically generated from linux arch/arm64/tools/sysreg. For the
>>> time being let's just describe a single id reg, CTR_EL0. In this
>>> description we only care about non RES/RAZ fields, ie. named fields.
>>>
>>> The registers are populated in an array indexed by ARMIDRegisterIdx
>>> and their fields are added in a sorted list.
>>>
>>> [CH: adapted to reworked register storage]
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>  target/arm/cpu-custom.h            | 60 ++++++++++++++++++++++++++++++
>>>  target/arm/cpu-sysreg-properties.c | 41 ++++++++++++++++++++
>>>  target/arm/cpu64.c                 |  2 +
>>>  target/arm/meson.build             |  1 +
>>>  4 files changed, 104 insertions(+)
>>>  create mode 100644 target/arm/cpu-custom.h
>> do we still want reference to the "custom" terminology, following
>> initial comments?
> Hm, maybe 'cpu-idregs.h'?
OK for me

Eric
>
>>>  create mode 100644 target/arm/cpu-sysreg-properties.c
>>>
>>> diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
>>> new file mode 100644
>>> index 000000000000..615347376e56
>>> --- /dev/null
>>> +++ b/target/arm/cpu-custom.h
>>> @@ -0,0 +1,60 @@
>>> +/*
>>> + * handle ID registers and their fields
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +#ifndef ARM_CPU_CUSTOM_H
>>> +#define ARM_CPU_CUSTOM_H
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/error-report.h"
>>> +#include "cpu.h"
>>> +#include "cpu-sysregs.h"
>>> +
>>> +typedef struct ARM64SysRegField {
>>> +    const char *name; /* name of the field, for instance CTR_EL0_IDC */
>>> +    int index;
>> worth to add a comment saying this is the ARMIDRegisterIdx of the parent
>> sysreg.
> ok
>
>>> +    int lower;
>>> +    int upper;
>>> +} ARM64SysRegField;
>>> +
>>> +typedef struct ARM64SysReg {
>>> +    const char *name;   /* name of the sysreg, for instance CTR_EL0 */
>>> +    ARMSysRegs sysreg;
>>> +    int index;
>> now that we have different kinds of indexing, may be worth adding a
>> comment to explain which one is being used.
>> I guess here it is ARMIDRegisterIdx. So you could even change the data type.
> Yeah, comments are good, I'll add some.
>
>>> +    GList *fields; /* list of named fields, excluding RES* */
>>> +} ARM64SysReg;
>>> +
>>> +void initialize_cpu_sysreg_properties(void);
>>> +
>>> +/*
>>> + * List of exposed ID regs (automatically populated from linux
>>> + * arch/arm64/tools/sysreg)
>>> + */
>>> +extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
>>> +
>>> +/* Allocate a new field and insert it at the head of the @reg list */
>>> +static inline GList *arm64_sysreg_add_field(ARM64SysReg *reg, const char *name,
>>> +                                     uint8_t min, uint8_t max) {
>>> +
>>> +     ARM64SysRegField *field = g_new0(ARM64SysRegField, 1);
>>> +
>>> +     field->name = name;
>>> +     field->lower = min;
>>> +     field->upper = max;
>>> +     field->index = reg->index;
>>> +
>>> +     reg->fields = g_list_append(reg->fields, field);
>>> +     return reg->fields;
>>> +}
>>> +
>>> +static inline ARM64SysReg *arm64_sysreg_get(ARMIDRegisterIdx index)
>>> +{
>>> +        ARM64SysReg *reg = &arm64_id_regs[index];
>>> +
>>> +        reg->index = index;
>>> +        reg->sysreg = id_register_sysreg[index];
>>> +        return reg;
>>> +}
>>> +
>>> +#endif
>>> diff --git a/target/arm/cpu-sysreg-properties.c b/target/arm/cpu-sysreg-properties.c
>>> new file mode 100644
>>> index 000000000000..8b7ef5badfb9
>>> --- /dev/null
>>> +++ b/target/arm/cpu-sysreg-properties.c
>>> @@ -0,0 +1,41 @@
>>> +/*
>>> + * QEMU ARM CPU SYSREG PROPERTIES
>>> + * to be generated from linux sysreg
>>> + *
>>> + * Copyright (c) Red Hat, Inc. 2024
>> maybe increment the year now ;-)
> Wait, it is 2025 already? :)
>
