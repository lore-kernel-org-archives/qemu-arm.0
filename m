Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp791348njb;
        Tue, 18 Feb 2025 08:07:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUERptM16wNDNvt7Og6nyJgYUPlDBndooIXZEouQRzUSFX/WAtUnEh2vXFJhBiFeeyMcY50pm3d9vk1iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG6yY1E5Xae5S7+3ntF8cs2GoGZMJL7qZtt3T3V/rERvlOhQi/3i/sQTcpqXVVhy4u9tMfb
X-Received: by 2002:a05:6870:a552:b0:29e:37af:c2d7 with SMTP id 586e51a60fabf-2bc99aa832emr8583422fac.16.1739894825804;
        Tue, 18 Feb 2025 08:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739894825; cv=none;
        d=google.com; s=arc-20240605;
        b=gxWyM65LNqjT0+nn+NqXnqu4UNxPhMMJhPwbE0BbkmXUrX9DnVzAJgIKn5q4le3OAc
         J3EV2g0WELRvlcBaps13gZhxw/W1LkQWHVHBIpa2HtpH1l217DfPdJ2zgvTBLv6qVbcu
         oI6QRQx0F79x9b1mEb7/Kwr2xDge3t7EMS0Pwp+ak2qGP/XDFnEI2kiXdDRBZd51whnK
         BZWzDg+hYhax0Ya+fOyrUKfxE82GdSJrc7nW8MJIN4ZCfOG8JzJWTgJ29f58RYGq+l7J
         J6C1Ucn6TxztYDPkEnr8m4WfzVp0LcU0e64SC+2KsrWmkveJshs2REq3atklsRxtPjY2
         lWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=s3g9jows/4/+ShPFJxsYWAQAkLb0y/5Wvk4/3mwEv5w=;
        fh=BrmWCAcFpxmB6LutwRMpVTNV96ENqeF9g+nNHBW5YNY=;
        b=bUd0nRsRNoydD5CwvQhSYkARJjAizCh7OBtkAZJjetcLlJPCZfkwEcMwmzTD1lan8L
         Dv76ZRqsdFq2jABNzmNhsag8+f3AR32imP1Z4Qpy3H7x+Lu04LhNbK+ikweyYD6aC0nl
         0NegspX0w1tBahmLKWN5LBXVOwTphun1zLw+6nOR4CkvcJjrsR0+opH1GCk9aq2f1Hk5
         mk5pfwhb7ZSOdle3BtRyN9iXd9+m4OSceEpLwqapduupWdoEIvAGagyJUujd/Ws2J415
         6vo158c8wszjF0ICKiiTVBEOURQePHEpe0QuIwkJaypmSer1bwCIA4AgiuEF1ByKmB4/
         Cj6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWGpSukJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 586e51a60fabf-2b9548d9c69si10242572fac.103.2025.02.18.08.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWGpSukJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739894824;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3g9jows/4/+ShPFJxsYWAQAkLb0y/5Wvk4/3mwEv5w=;
	b=LWGpSukJ/IDiMnGJ7BReCwl+2dxGFgXcPkS3GmTnPmfxeeRa7SLxXXzIaRb7k3FAuzYK0k
	Ta+RjWStse+7gMff1Z9sFd57ffGagbebuetTj93SdN9DBg9416jrLN/lD7xVCYc2uqKrUI
	hoKClYfBdMWr3MM/+xZrUEXPOG9gSIQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-DFZY1wz_OtaH7YnyT3jfdQ-1; Tue, 18 Feb 2025 11:07:03 -0500
X-MC-Unique: DFZY1wz_OtaH7YnyT3jfdQ-1
X-Mimecast-MFC-AGG-ID: DFZY1wz_OtaH7YnyT3jfdQ_1739894822
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4393e8738b3so47511605e9.0
        for <alex.bennee@linaro.org>; Tue, 18 Feb 2025 08:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894822; x=1740499622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3g9jows/4/+ShPFJxsYWAQAkLb0y/5Wvk4/3mwEv5w=;
        b=E5u0EBLgEPkUYnWTFDKJ3XNyglH23rMvEhMYPsF03U+PB7T7TN7fWt15jYgXYIvM+F
         NLL+uyZQz5jFL1IFOfO1mAHdd1CeH/273KkTWuGybVN8f0dUEmChyPiXBFlzfD98iOsm
         J9rD8LwIqEQFYqPV1b6oWJ51OmInPXszFQhsHDyz/LP9BDcnOymVJZrBrjwhRzMa1OIG
         TlebpPsNzEUHz/+lF5V6+qpYWyVRTd+cWqPmMda+Rsi+UkLycU+Wt68lXWMHOEQBOpPO
         5CKG1epIZ3uUUMVPoykyg2EFe6RkQpASbjQxRwNV2f0m+wJ+VK6zWOoxdR4dE48bMZNH
         Cxxg==
X-Forwarded-Encrypted: i=1; AJvYcCWiNUdlo0a6KggwkZoftFBI4zVZB7M0OesYG68nT2QfMice0MrqZI3JFxdmZdrSIO3qknIOGUZwD6IG4g==@linaro.org
X-Gm-Message-State: AOJu0Yw8iskXT2m0hYte0fxqXpATJo6Fs4BGk0PclolMNoqdYNo9HDBa
	9CyEVKtOox2FsHhvX1P8TgnWjTr6nptsiM/mVjN6lbtH+KKI2GV4gwBNo88vlLu2WjJ3QE6loPI
	xwfK33uI2qR9h1bcZzANJzgSDBoiYD/C0AInFK6H1z+pME6kFnPm8Ag==
X-Gm-Gg: ASbGncua2DlO38ik/Pv5xWYxj0To0FihSPaGnoS1/PYd9dE9e0Uu7FlTNNgBJcPh5q9
	N3nhSOkLFhYXk422AUR29eYxxcUmPG1RNAZI4T8j98XaD4QpDi0jjtmex2SrelCFYWD9tTT3FCU
	7C06fOrWKHzxsWthemF8NC7u53NaU7yYWWqBw6J5sMrY8EUmfk7LcagZydxK2AF3g9kILB8SRtC
	yebQUwbuUBCT58Kxgktst0Zf9LW8Pk1xlQfSRC1TFcstAZtc/kwmw52dHhlrrEV+g5UH7zt40Py
	TCHQcSa8ks3GP9wKi6ujy3AFqtUYfXANlwwMlDLgfnvkZCNVek4K
X-Received: by 2002:a05:600c:4e8c:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43999d72091mr2202905e9.2.1739894822031;
        Tue, 18 Feb 2025 08:07:02 -0800 (PST)
X-Received: by 2002:a05:600c:4e8c:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43999d72091mr2202075e9.2.1739894821469;
        Tue, 18 Feb 2025 08:07:01 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398872fa85sm53409035e9.28.2025.02.18.08.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 08:07:00 -0800 (PST)
Message-ID: <05a1c41e-3436-4117-a22f-61b4e1e2de20@redhat.com>
Date: Tue, 18 Feb 2025 17:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 13/15] arm/cpu: Add infra to handle generated ID register
 definitions
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-14-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250207110248.1580465-14-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J33-cu9zoXq7pzIQAXPUsLDuaSOa0ecMjHzb4TUBclI_1739894822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: MBLjzkWZV8pC

Hi Connie,


On 2/7/25 12:02 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> The known ID regs are described in a new initialization function
> dubbed initialize_cpu_sysreg_properties(). That code will be
> automatically generated from linux arch/arm64/tools/sysreg. For the
> time being let's just describe a single id reg, CTR_EL0. In this
> description we only care about non RES/RAZ fields, ie. named fields.
>
> The registers are populated in an array indexed by ARMIDRegisterIdx
> and their fields are added in a sorted list.

I don't think we need all the infra related to properties in this
prerequisite series. I would postpone it until the main CPU model series.

You can just keep scripts/gen-cpu-sysregs-header.awk to generate the
sysreg definitions
>
> [CH: adapted to reworked register storage]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-custom.h            | 55 ++++++++++++++++++++++++++++++
>  target/arm/cpu-sysreg-properties.c | 41 ++++++++++++++++++++++
>  target/arm/cpu64.c                 |  2 ++
>  target/arm/meson.build             |  1 +
>  4 files changed, 99 insertions(+)
>  create mode 100644 target/arm/cpu-custom.h
>  create mode 100644 target/arm/cpu-sysreg-properties.c
>
> diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
by the custom we may get rid of the 'custom' terminology
> new file mode 100644
> index 000000000000..17533765dacd
> --- /dev/null
> +++ b/target/arm/cpu-custom.h
> @@ -0,0 +1,55 @@
> +#ifndef ARM_CPU_CUSTOM_H
> +#define ARM_CPU_CUSTOM_H
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "cpu.h"
> +#include "cpu-sysregs.h"
> +
> +typedef struct ARM64SysRegField {
> +    const char *name; /* name of the field, for instance CTR_EL0_IDC */
> +    int index;
> +    int lower;
> +    int upper;
> +} ARM64SysRegField;
> +
> +typedef struct ARM64SysReg {
> +    const char *name;   /* name of the sysreg, for instance CTR_EL0 */
> +    ARMSysRegs sysreg;
> +    int index;
> +    GList *fields; /* list of named fields, excluding RES* */
> +} ARM64SysReg;
> +
> +void initialize_cpu_sysreg_properties(void);
> +
> +/*
> + * List of exposed ID regs (automatically populated from linux
> + * arch/arm64/tools/sysreg)
> + */
> +extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
> +
> +/* Allocate a new field and insert it at the head of the @reg list */
> +static inline GList *arm64_sysreg_add_field(ARM64SysReg *reg, const char *name,
> +                                     uint8_t min, uint8_t max) {
> +
> +     ARM64SysRegField *field = g_new0(ARM64SysRegField, 1);
> +
> +     field->name = name;
> +     field->lower = min;
> +     field->upper = max;
> +     field->index = reg->index;
> +
> +     reg->fields = g_list_append(reg->fields, field);
> +     return reg->fields;
> +}
> +
> +static inline ARM64SysReg *arm64_sysreg_get(ARMIDRegisterIdx index)
> +{
> +        ARM64SysReg *reg = &arm64_id_regs[index];
> +
> +        reg->index = index;
> +        reg->sysreg = id_register_sysreg[index];
> +        return reg;
> +}
> +
> +#endif
> diff --git a/target/arm/cpu-sysreg-properties.c b/target/arm/cpu-sysreg-properties.c
> new file mode 100644
> index 000000000000..8b7ef5badfb9
> --- /dev/null
> +++ b/target/arm/cpu-sysreg-properties.c
> @@ -0,0 +1,41 @@
> +/*
> + * QEMU ARM CPU SYSREG PROPERTIES
> + * to be generated from linux sysreg
> + *
> + * Copyright (c) Red Hat, Inc. 2024
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#include "cpu-custom.h"
> +
> +ARM64SysReg arm64_id_regs[NUM_ID_IDX];
> +
> +void initialize_cpu_sysreg_properties(void)
> +{
> +    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NUM_ID_IDX);
> +    /* CTR_EL0 */
> +    ARM64SysReg *CTR_EL0 = arm64_sysreg_get(CTR_EL0_IDX);
> +    CTR_EL0->name = "CTR_EL0";
> +    arm64_sysreg_add_field(CTR_EL0, "TminLine", 32, 37);
> +    arm64_sysreg_add_field(CTR_EL0, "DIC", 29, 29);
> +    arm64_sysreg_add_field(CTR_EL0, "IDC", 28, 28);
> +    arm64_sysreg_add_field(CTR_EL0, "CWG", 24, 27);
> +    arm64_sysreg_add_field(CTR_EL0, "ERG", 20, 23);
> +    arm64_sysreg_add_field(CTR_EL0, "DminLine", 16, 19);
> +    arm64_sysreg_add_field(CTR_EL0, "L1Ip", 14, 15);
> +    arm64_sysreg_add_field(CTR_EL0, "IminLine", 0, 3);
> +}
> +
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index beba1733c99f..8371aabce5f4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -35,6 +35,7 @@
>  #include "internals.h"
>  #include "cpu-features.h"
>  #include "cpregs.h"
> +#include "cpu-custom.h"
>  
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {
> @@ -894,6 +895,7 @@ static void aarch64_cpu_register_types(void)
>  {
>      size_t i;
>  
> +    initialize_cpu_sysreg_properties();
>      type_register_static(&aarch64_cpu_type_info);
>  
>      for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 2e10464dbb6b..9c7a04ee1b26 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -14,6 +14,7 @@ arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>    'cpu64.c',
>    'gdbstub64.c',
> +  'cpu-sysreg-properties.c',
>  ))
>  
>  arm_system_ss = ss.source_set()
Thanks

Eric
