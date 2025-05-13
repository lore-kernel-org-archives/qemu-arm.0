Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp535002njb;
        Tue, 13 May 2025 06:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd5XXHFDUjdVQXZFoS6Y3H6G3geBVIv2VgZrHnbgfnisPk8Dj8tfw5wtCUGGVj1BnUMYx2vLy1r39GYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGE1CJ/kQc7rqyodZcsnM/bXl9qHcCp8cRtcWyFGMDe/TMuErJTFmxUZNFF46k9ZB1yTs7L
X-Received: by 2002:a05:6214:21cb:b0:6f5:113a:6903 with SMTP id 6a1803df08f44-6f6e47faca7mr250973486d6.25.1747144383410;
        Tue, 13 May 2025 06:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747144383; cv=none;
        d=google.com; s=arc-20240605;
        b=iBozHQGNUFY1gjvUcNd5lMPddZGTuuj5nBKwbzgWu5wfzWpr1WscvfU03OwNDS6xWR
         ryfB6Ve0rxv5jmjsqUhI/X2nNsDUiuu6rmbD1hqkVgtj3SXW8N8ZsKngzAXXJMGmiCdE
         42v9oZ9mn642Xeg/qeFb+SebtZ2kvGLKo0XipiO//PtEWDUhFjgciK3n5+6LnJw290Qc
         3xC2nDa8gmmh48LQCOphdcdZyoJ2J+fJCd+dlm+CFF3X1FjuEtvy49HFQ/QBnJ4FmeaC
         ns1RBem7CjKQL3WxJWwetfMgAi1S4I1wE5T1SARXcR/CEd7lq/A1HN/xbo00sjRvBn77
         ByQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Qd5j9HGmDqx5UKJ8JxQsW9/d5OfJ5IPgcMenkg8z06g=;
        fh=QZ50v+BdtpzgOMjS/+1dOPkXC3P6PVupnDjuhk/K03c=;
        b=UauCOiRd03acnjCFK8vTgTlBLrc/mEnzmwCSNlkQhVWkR7gHyW+f5CLfQGKJtubZxQ
         1A8IJDL36XhqQscaSdqhLjdPbBJ/lX7/VFuYKqfR1Mcfr4nNBSeVeCZCLMn0xHFc2quM
         cXpdNqplhvMq0/dW3e5IMcLsfai/4BJjK6EoBuFxOyRKVgfRQADczuHdkSwxQpD4MRi9
         8Ga5YGJ2ZQYJQlBuIvT/A/yEWtcOOFTVlxi5lLtB7dfjmbQRaA0EOqS8sLJmORY5GklL
         3DEhG9kJbUjmKoF5X3MrTqoifojFlYdJz7gtaQQ4s8wbTj/ERa242tgoB3xORH1l1lKg
         Y54Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONHau7JF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7ab9si113073346d6.133.2025.05.13.06.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONHau7JF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144383;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd5j9HGmDqx5UKJ8JxQsW9/d5OfJ5IPgcMenkg8z06g=;
	b=ONHau7JFEtBELVNpdEg9zLvE/nd1MLZkCLaw4Vj51gCnh+eSOa7hgmWq8qUf+EN9cQsnib
	4R/+/Ga4hLItlZohkudZhzi7nX1Q6c+7t82gRAITiVef1EobYJeiGvEKUzzqnnhu/nMugZ
	0GGOwMSOHZ6rzmJXXnwh3WhxFk1HqBQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-itUbHLJSNRKx0_PZrAK_qQ-1; Tue, 13 May 2025 09:53:00 -0400
X-MC-Unique: itUbHLJSNRKx0_PZrAK_qQ-1
X-Mimecast-MFC-AGG-ID: itUbHLJSNRKx0_PZrAK_qQ_1747144379
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0ba24d233so1878178f8f.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 06:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144379; x=1747749179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd5j9HGmDqx5UKJ8JxQsW9/d5OfJ5IPgcMenkg8z06g=;
        b=tgT9sPR98IZSXbzoeYaGv3GuH6TmbXjfb29PnI2VpEiiQlvp8ViEeY0qBvrYB8FRMr
         7IZBts/A71zzzHCmCrgzCAHOYlHcQonspwF95cL4FpiUdz33wydmSDRdSBEB+wINDXf/
         72UQnFRkIu2axwFlBw8h6lchAbYSOwBoATqWep3vXFkSRg0AoXFqLs2WoicelVSNz/hD
         YpA4POZ8zOEAtwOxLH87/XyAmZ4r+B99mhrKDgialSgChMHbr18jIsNH9TK4OtgCfrWv
         VzlCJHXKBDV0B4QWgNS6yiYzgnvvl67FMVJVPIRoLGNTTYZHkrwwmcpaIjnCXrqHsUWL
         Ig4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp2M+k7o7eS3pdPwbz5ETu3sJ2CM32jYABVtTYkOjCml7ZAkeneJ/zkhE5JDYf6c5H9/UKER2rPNTo9Q==@linaro.org
X-Gm-Message-State: AOJu0YwyoHXayqQxT1WFBnTDSCZ0Mc3/1hgOJOVaB5L2GmIkvjrCj4qt
	8GhVHziz0L6bb5n0ffYNXWGzjL0XJ96QPWEJjCoS0L08o5ajO0qhcil0AC/dzuT78NGpPSgFOTF
	7hf0mDvPoLgL9a4O0orJFxTPIREs8JQttHjbV/CxVoKpUgbmvIBZj1w==
X-Gm-Gg: ASbGncueCg5eUOCSrTAKlpVJhFIRosOmtAXcm8BLFmRFBlrO2tFtSsE2LBrB5Wm+Q0o
	MtsjmnS/EiJYz8CoEnpNWOe5cM8ZBfVCE1hI33IOQHll1+9tuMw+6eF4dMLLsihzOy8rNDB6gFZ
	rLT5aA7DZYLQ+U0vDzuwIfieY7I0KJMoM98PUv0J1aEdhuFlllFhsfITsFXCGnoMfeuawtJ0JTF
	ot2gSpvthgtfyaAr5RPlFSh5JjIE91TuF+hdrdIR4oxwl3B9rtXFBljPpddHmwtVm7qZy6trvHj
	SfEcbz+est68itKTpNM9td4GOW+irMNCYoTz63J0CaNRBSJfBV/Wr5HABtk=
X-Received: by 2002:a5d:584c:0:b0:3a0:a8b1:cf17 with SMTP id ffacd0b85a97d-3a1f643711emr13945590f8f.15.1747144378737;
        Tue, 13 May 2025 06:52:58 -0700 (PDT)
X-Received: by 2002:a5d:584c:0:b0:3a0:a8b1:cf17 with SMTP id ffacd0b85a97d-3a1f643711emr13945557f8f.15.1747144378233;
        Tue, 13 May 2025 06:52:58 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd5esm16148585f8f.6.2025.05.13.06.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:52:57 -0700 (PDT)
Message-ID: <6c06a198-1608-4919-8b6e-68e3c28c2526@redhat.com>
Date: Tue, 13 May 2025 15:52:56 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-2-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FHUlmDY_8UNAjeX7f53iBeNR1tHwswIShQGpxQFW6Ec_1747144379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: xOKoPFbd530B

Hi Connie,

On 4/14/25 6:38 PM, Cornelia Huck wrote:
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
>
> [CH: adapted to reworked register storage]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-custom.h            | 60 ++++++++++++++++++++++++++++++
>  target/arm/cpu-sysreg-properties.c | 41 ++++++++++++++++++++
>  target/arm/cpu64.c                 |  2 +
>  target/arm/meson.build             |  1 +
>  4 files changed, 104 insertions(+)
>  create mode 100644 target/arm/cpu-custom.h
do we still want reference to the "custom" terminology, following
initial comments?
>  create mode 100644 target/arm/cpu-sysreg-properties.c
>
> diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
> new file mode 100644
> index 000000000000..615347376e56
> --- /dev/null
> +++ b/target/arm/cpu-custom.h
> @@ -0,0 +1,60 @@
> +/*
> + * handle ID registers and their fields
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
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
worth to add a comment saying this is the ARMIDRegisterIdx of the parent
sysreg.
> +    int lower;
> +    int upper;
> +} ARM64SysRegField;
> +
> +typedef struct ARM64SysReg {
> +    const char *name;   /* name of the sysreg, for instance CTR_EL0 */
> +    ARMSysRegs sysreg;
> +    int index;
now that we have different kinds of indexing, may be worth adding a
comment to explain which one is being used.
I guess here it is ARMIDRegisterIdx. So you could even change the data type.
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
maybe increment the year now ;-)
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
> index 9769401a8585..839442745ea4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -35,6 +35,7 @@
>  #include "internals.h"
>  #include "cpu-features.h"
>  #include "cpregs.h"
> +#include "cpu-custom.h"
>  
>  /* convert between <register>_IDX and SYS_<register> */
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
> @@ -891,6 +892,7 @@ static void aarch64_cpu_register_types(void)
>  {
>      size_t i;
>  
> +    initialize_cpu_sysreg_properties();
>      type_register_static(&aarch64_cpu_type_info);
>  
>      for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 3065081d241d..1c97c1ef7580 100644
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
