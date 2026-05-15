Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099BBCD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 16:00:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNuxM-0005xw-Iy; Fri, 15 May 2026 12:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNuwz-0005q6-Jo
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNuwv-00024E-O9
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778860780;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FC3oLSmnu8UdvlNQM2aun6fDBDKWRYloibSa7BMlBRo=;
 b=Dv2CCop6zf6jmigcqkyh3VUPrf38WmcAZWvEU2O4lQyb5yb7DJmXAUm0vu14NN7m0aXiLY
 Oyz01jQMy38CU8bwaTmkR5KyYGxI3SRKx9nhzzhC1IaDfpQ6hXA6Oj1PbVk7eqOVvF8SGM
 h3GFYUBad0yWRQOAxyC4y5aSxTwxTxo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-RKVODXFnOtqG-Azh2qHxAQ-1; Fri, 15 May 2026 11:59:36 -0400
X-MC-Unique: RKVODXFnOtqG-Azh2qHxAQ-1
X-Mimecast-MFC-AGG-ID: RKVODXFnOtqG-Azh2qHxAQ_1778860776
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48d1bc85bb3so4725135e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778860776; x=1779465576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FC3oLSmnu8UdvlNQM2aun6fDBDKWRYloibSa7BMlBRo=;
 b=ORqNU0B+fQTxkMWBdVUJvdr7jAXz9W9B8Q2Nmv8kxRjGDurCnZMbCs+sn6v4oXtu9C
 2voJyZYzO/eVShgjeHpaKNJ41GyM2JJo0NF18fiK3/iVT2B69cQKigpLVZwq17bBCmwg
 vON2sE7lJ9M6FjAZwD+5SMkFGc4VpJSNVnkSmIJkTQ1cBA3vZe5TShPTBZG+FtGEk0bj
 NyNrdK5Z/pe3iYxBEaFzJMrsNy27P/bM63UF+GvCOUZl2Vsc+bb5er6CRsV5V8Rx82R6
 bWOD/thfXoX3VvuvotMxJz+AJz3viA5lCXHs3t9NECbsGj5Xw/vi7Oh3ooWPo1BV3N6T
 DezA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+Hihls1VhfHWs2Km7+XTHw3go055n02Vyf74kHerLUuvSLQKnabpD9PiL/Fj7I/0iYxUlOFIr4A==@nongnu.org
X-Gm-Message-State: AOJu0YyH2jpW3espfC9Th4Kff0A9JRwReEe13MsBd/6cWeAuw3n/3Loh
 B9s1ts5od7W6O/CTFzsPzjYqtLFVovWAluFqbcXSiuJCDvGD9WAaSwq9bjE/buijfTE7FnNJ6Ph
 jf2LhWPnr+C0DMuqOspviavyMGsxFT8DvZluOcTYyerdzoVNPOFoWoQ==
X-Gm-Gg: Acq92OG6JA/sFSm2pA36EiUc/OIgrncIQwbq/4CsSJwYjYgYKlJGxbiQeUIbDJWFi0K
 V0hsPBEc1sm+U+1mgjFp8Wsid+Rss4Vqd7G/T5VQDE63JfgYvjxzE6+f9Z8BaCunbrt/du0UiFa
 qz4Q90FN03wBPS2glKG672ycQeds2C9+3nz7tH34OXrnI8sp4bWPL0e12NTFiHRtRAyT/rTCG0v
 z9pbE+rNTBVCF84iRgSbD/csRWO6MWbTpmqDAdo5pnz/WQdwigu0QSh6XeI+cWichD+pGzadfdw
 2t+QDaCMiK7CbqwxHznN8ec9uFTckCQ5yio/Hz0LfIquLrX9Ir/TH5IGMIPoPY/lLQpCaL1iA2b
 GCjD0mTCVX8/TjkTJ79MI8eWveMLZNprROg+Tx4F2Oa6YEhONUASq+4R2ai5+lytlGA3BBQ==
X-Received: by 2002:a05:600c:609b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-48fe4cadfeemr70353455e9.2.1778860775655; 
 Fri, 15 May 2026 08:59:35 -0700 (PDT)
X-Received: by 2002:a05:600c:609b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-48fe4cadfeemr70353085e9.2.1778860775243; 
 Fri, 15 May 2026 08:59:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b60csm24134215e9.6.2026.05.15.08.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 08:59:34 -0700 (PDT)
Message-ID: <a73c5f14-ed64-4322-8315-482e5b621add@redhat.com>
Date: Fri, 15 May 2026 17:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 06/13] target/arm: named_cpu_model: data-structures
 required for the ARM property layer.
To: Shaju Abraham <shaju.abraham@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 skolothumtho@nvidia.com, philmd@linaro.org
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 prerna.saxena@nutanix.com, jon@nutanix.com, jond@nutanix.com,
 Khushit Shah <khushit.shah@nutanix.com>
References: <20260513163356.3033159-1-shaju.abraham@nutanix.com>
 <20260513163356.3033159-7-shaju.abraham@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260513163356.3033159-7-shaju.abraham@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LwIMCTkvFGwfjlT-DYHuSRctAsm8V95n_cOfJg3MGS4_1778860776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 5/13/26 6:33 PM, Shaju Abraham wrote:
> Introduce data-structures required for the ARM property layer. There are
> four classes of properties:
>     STRING: Multi-bit fields with arch-defined named values, such as
>             ("off", "aes", "pmull", ...).
when you say "arch defined named values", if we take for instance SHA2
field of ID_AA64ISAR0

+IDREG_FIELD_START(ID_AA64ISAR0, SHA2,    12,  4, LOWER,  0)
+IDREG_FIELD_ARCH_VAL(0b0000, "off")
+IDREG_FIELD_ARCH_VAL(0b0001, "sha256")
+IDREG_FIELD_ARCH_VAL(0b0010, "sha512")
+IDREG_FIELD_END(ID_AA64ISAR0, SHA2)


I don't see such string value in the ARM ARM:

0b0000 No SHA2 instructions implemented.
0b0001 Implements instructions: SHA256H, SHA256H2, SHA256SU0, and SHA256SU1.
0b0010 Implements instructions: • SHA256H, SHA256H2, SHA256SU0, and
SHA256SU1. • SHA512H, SHA512H2, SHA512SU0, and SHA512SU1.

Where did you get those arch defined strings? The only source I can see
is linux sysreg and I am not sure this can be used as a reference.

Looking at  target/arm/cpu-idregs.h.inc

+IDREG_FIELD_START(ID_AA64ISAR0, TLB,     56,  4, LOWER,  0)
+IDREG_FIELD_ARCH_VAL(0b0000, "off")
+IDREG_FIELD_ARCH_VAL(0b0001, "os")
+IDREG_FIELD_ARCH_VAL(0b0010, "range")
+IDREG_FIELD_END(ID_AA64ISAR0, TLB)

it looks not straightforward to link with ARM ARM 

TLB, bits [59:56] Indicates support for Outer Shareable and TLB range
maintenance instructions. The value of this field is an IMPLEMENTATION
DEFINED choice of: 0b0000 Outer Shareable and TLB range maintenance
instructions are not implemented. 0b0001 Outer Shareable TLB maintenance
instructions are implemented. 0b0010 Outer Shareable and TLB range
maintenance instructions are implemented. All other values are reserved.
FEAT_TLBIOS implements the functionality identified by the values 0b0001
and 0b0010. FEAT_TLBIRANGE implements the functionality identified by
the value 0b0010. From Armv8.4, the only permitted value is 0b0010.
Access to this field is RO


Thanks

Eric
>     BOOLEAN: 1-bit fields.
>     NUMERIC: Numeric values like cache geometry, debug counter widths, etc.
>     FRACTIONAL: Paired (base, frac) fields exposed as a single "M.F" string
>           (e.g., CSV2/CSV2_FRAC, MPAM/MPAM_FRAC, RAS/RAS_FRAC, NV/NV_FRAC).
>
> Co-authored-by: Khushit Shah <khushit.shah@nutanix.com>
> Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
> ---
>  target/arm/arm-cpu-props.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 target/arm/arm-cpu-props.h
>
> diff --git a/target/arm/arm-cpu-props.h b/target/arm/arm-cpu-props.h
> new file mode 100644
> index 0000000000..1dc3786ea9
> --- /dev/null
> +++ b/target/arm/arm-cpu-props.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * ARM CPU feature properties.
> + *
> + * User-facing QOM properties that map to fields of the AArch64 ID
> + * registers described in cpu-idregs.inc.h.
> + *
> + */
> +
> +#ifndef ARM_CPU_PROPS_H
> +#define ARM_CPU_PROPS_H
> +
> +#include "cpu-idregs.h"
> +
> +typedef enum ArmCpuPropType {
> +    ARM_PROP_STRING,
> +    ARM_PROP_BOOLEAN,
> +    ARM_PROP_NUMERIC,
> +    ARM_PROP_FRACTIONAL,
> +} ArmCpuPropType;
> +
> +typedef struct ArmFracVal {
> +    const char *name;
> +    uint64_t base_val;
> +    uint64_t frac_val;
> +} ArmFracVal;
> +
> +typedef struct ArmCpuPropDesc {
> +    const char *name;
> +    ArmCpuPropType type;
> +    ArmFieldIdx base_field;
> +    ArmFieldIdx frac_field;
> +    const ArmFracVal *vals;
> +} ArmCpuPropDesc;
> +
> +#endif


