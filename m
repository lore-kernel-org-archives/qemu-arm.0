Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CEACA5FD4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 12:59:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCcrG-0008QL-4g; Fri, 02 Oct 2026 08:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCcrD-0008Pu-Q6
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 08:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCcrB-0006wz-Ly
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 08:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790945960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFoEE0U1Hp5KQT1ZPGx/a8maOhy1unI7O+5gpZ1vOHI=;
 b=R/+yQT75R+zBLllCTOszHlDlnd9l5SjNaAJKa4ozw14825aqBgVm+HkqQqJoDS1780Ogj1
 RNvhccmbbrexiXUUzF5RbLIxTWxSQIxJRFsDyI24R9uEEtEClrqdUYvXFenfEJMJIQ5sCc
 Vzj15bqw9vp963f6am6DrKkVjpV+aGQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-_C1_7dSDNWS1hMn0A-cNkw-1; Fri, 02 Oct 2026 08:59:18 -0400
X-MC-Unique: _C1_7dSDNWS1hMn0A-cNkw-1
X-Mimecast-MFC-AGG-ID: _C1_7dSDNWS1hMn0A-cNkw_1790945957
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48b0a199b20so1616721f8f.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 05:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790945957; x=1791550757;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:reply-to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VFoEE0U1Hp5KQT1ZPGx/a8maOhy1unI7O+5gpZ1vOHI=;
 b=GVRO8YnlrnccLzj0oIAcVzSMMEYj41UCxjsAVClt4oQfhYLb912SzDTz2BfUVGhR57
 jqYHZDDTWWSspWs288DZMc3+bRtzw9Gd2bE5DBZcOHiyhzfUydSH4uAq5ep+Diog8K4z
 U1MafZk9fwcivJGFSNaWDZbWGbwxdYNFU+cWbPU1fCSVWt3iCXm2u1UZVsUiqmHOzcem
 +qBa7qYC0QWdqB+7UA/5+z5p6j3Epw4K/mlujjX45cRARBulVTEkJ83VgX+Uyp1vlndG
 dE+dYFweOVTXTOVKNqivaQk6tU9fWoASjUnEuXnj1wxoD0UHK5MBwjbp9OwjBN05PMWr
 iM7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBybhriWgygIMEXhcCTx8WPlft+jzALfza84i8XlC2gAfYdJHGarkq75034sZ4dxYRbNTSzuQ85prA==@nongnu.org
X-Gm-Message-State: AFq9FYKIH2G4ByvcQRA5Ll8m+CAHrsVClE0DDe51EnoX2jkVTRQKLHwT
 c+xETj1wzef70NykAOQ8/ditoT1TYN3au6xU4Mr6l2Rf/1T7j8Mg85IUFcOCzDfjM/IvBzBq0Il
 NkytXLLetwcP+v2SC9X772V+dLCEqV/ASsWsiPLxPSk+PdrcK30UWjw==
X-Gm-Gg: AYBFou0PrmmwGacMObRDD6CZbTmpEw+tRqh3T94O2u8Cq9SpNFiq1RWlA+rKOfeo8SD
 B88tWp9TLXZrjStyCrx20LuWJQz4oMRuSpDjZZ8654NPiQzhfdageV5axaYJkf9uczOjFTAPeCr
 yeN5+vWZLs322CA54AuB35R2tsR8tElQGd1WMTqMuzwAjq85ro0ZeYM3Qj8G6gnuUrA3UwNhnbh
 PlibldWWQz2FKC/2HWNmU68Sw1jaIb5dIJx2jl2J/ksD23KxUwr/SmhvYQTvMe51p6yHf1XGEoP
 zD65V7iMvrryjn2n9wH/bYVyjRPXX5WCVVoEHQmt7cOCRFURAwUCE7chtg9Q39Kt9g4aafUtk5D
 MDcJJWYxJblOkcwOStYIhSfRiGny0Ko/ORFjfX1Um6Yclzkdh
X-Received: by 2002:a05:6000:2c04:b0:487:27f9:841 with SMTP id
 ffacd0b85a97d-48b12727a3bmr4930954f8f.54.1790945957439; 
 Fri, 02 Oct 2026 05:59:17 -0700 (PDT)
X-Received: by 2002:a05:6000:2c04:b0:487:27f9:841 with SMTP id
 ffacd0b85a97d-48b12727a3bmr4930906f8f.54.1790945957040; 
 Fri, 02 Oct 2026 05:59:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f98ffsm5713867f8f.38.2026.10.02.05.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 05:59:16 -0700 (PDT)
Message-ID: <14d8af0e-eb1f-43ba-87ce-5f52ac280543@redhat.com>
Date: Fri, 2 Oct 2026 14:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 06/26] scripts: Introduce
 scripts/update-aarch64-cpu-sysreg-properties.py
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260916144721.751810-1-eric.auger@redhat.com>
 <20260916144721.751810-7-eric.auger@redhat.com>
 <DFC38BF2-5E6F-4683-B030-C07656EC19BB@nutanix.com>
In-Reply-To: <DFC38BF2-5E6F-4683-B030-C07656EC19BB@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tOqEsr4_9myMO38CCP_CvNAddUUtgqLfwkqiIFMHvWo_1790945957
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.336,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Khushit,

On 9/25/26 11:29 AM, Khushit Shah wrote:
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Introduce a script that takes as input the Registers.json file
>> delivered in the AARCHMRS Features Model downloadable from the
>> Arm Developer A-Profile Architecture Exploration Tools page:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__developer.arm.com_Architectures_A-2DProfile-2520Architecture-23Downloads&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=PGWMyignA0NiDmTlyP7vOTHozBws_VN86yrVmSMkBp0&m=2NOLVUk59YPHssYi5AgGX0z_LkZPQXfTkiD33Ti_D8RYfowBwp7XuMOfw-dMDkDE&s=Qs3ro5t6_dDfdQDLUGX7pJ43SvM2axfOShUzqbv90EQ&e= 
>> and automates the generation of system register properties definitions.
>>
>> generates target/arm/cpu-idregs.h.inc containing definitions for
>> feature ID registers.
>>
>> We only care about IDregs with opcodes satisfying:
>> op0 = 3, op1 = {0,1,3}, crn = 0, crm within [0, 7], op2 within [0, 7]
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v5 -> v6
>> - add ident
>> ---
>> .../update-aarch64-cpu-sysreg-properties.py   | 166 ++++++++++++++++++
>> 1 file changed, 166 insertions(+)
>> create mode 100644 scripts/update-aarch64-cpu-sysreg-properties.py
>>
>> diff --git a/scripts/update-aarch64-cpu-sysreg-properties.py b/scripts/update-aarch64-cpu-sysreg-properties.py
>> new file mode 100644
>> index 0000000000..6f5edb88d2
>> --- /dev/null
>> +++ b/scripts/update-aarch64-cpu-sysreg-properties.py
>> @@ -0,0 +1,166 @@
>> +#!/usr/bin/env python3
>> +
>> +# This script takes as input the Registers.json file delivered in
>> +# the AARCHMRS Features Model downloadable from the Arm Developer
>> +# A-Profile Architecture Exploration Tools page:
>> +# https://urldefense.proofpoint.com/v2/url?u=https-3A__developer.arm.com_Architectures_A-2DProfile-2520Architecture-23Downloads&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=PGWMyignA0NiDmTlyP7vOTHozBws_VN86yrVmSMkBp0&m=2NOLVUk59YPHssYi5AgGX0z_LkZPQXfTkiD33Ti_D8RYfowBwp7XuMOfw-dMDkDE&s=Qs3ro5t6_dDfdQDLUGX7pJ43SvM2axfOShUzqbv90EQ&e= 
>> +# and outputs target/arm/cpu-idregs.h.inc content.
>> +# ID regs are defined using this pattern:
>> +#
>> +# IDREG_START(REG)
>> +#    IDREG_FIELD(REG, FIELD, SHIFT, LENGTH)
> Nit: Add Enum Macro
This is done later in "target/arm/cpu-idregs.h.inc: Generate enum values"
>> +# ...
>> +# IDREG_END(REG)
>> +#
>> +# Copyright (C) 2026 Red Hat, Inc.
>> +#
>> +# Authors: Eric Auger <eric.auger@redhat.com>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +
>> +import json
>> +import os
>> +import sys
>> +from aarch64_sysreg_helpers import extract_idregs_from_registers_json
>> +
>> +def collect_fields(item, bit_offset=0):
>> +    """
>> +    Recursively finds all field-like objects, handling Fields.Array,
>> +    Fields.ArrayField, and ConditionalField structures.
>> +    Applies bit_offset from containers to child fields.
>> +    """
>> +    fields = []
>> +    if not isinstance(item, dict):
>> +        return fields
>> +
>> +    _type = item.get('_type', '')
>> +
>> +    # Array types (for example CLIDR_EL1 Ctype<n>, Ttype<n>)
>> +    if _type == 'Fields.Array':
>> +        name_template = item.get('name') or item.get('label', '')
>> +        index_info = item.get('indexes', [{}])[0]
>> +        start_idx = index_info.get('start', 0)
>> +        count = index_info.get('width', 0)
>> +
>> +        full_range = item.get('rangeset', [{}])[0]
>> +        bit_start = full_range.get('start', 0) + bit_offset
>> +        elem_width = full_range.get('width', 0) // count if count else 0
>> +
>> +        for i in range(count):
>> +            idx = start_idx + i
>> +            # Correctly handle indexed names like Ctype1, Ctype2
>> +            field_name = name_template.replace('<n>', str(idx))
>> +            fields.append({
>> +                'name': field_name,
>> +                'rangeset': [{
>> +                    'start': bit_start + (i * elem_width),
>> +                    'width': elem_width
>> +                }],
>> +                '_type': 'Fields.Field'
>> +            })
>> +        return fields
>> +
>> +    # ConditionalFields
> Can you please explain what are conditional fields and should we always include them?
If we don't you will miss plenty of named fields which depend on a
specific FEAT implementation.
Few examples: 
<     IDREG_FIELD_START(ID_AA64MMFR4_EL1, E2H0, 24, 4)
<     IDREG_FIELD_START(ID_AA64SMFR0_EL1, SMEver, 56, 4)
<     IDREG_FIELD_START(ID_AA64ZFR0_EL1, SVEver, 0, 4)
../..

All of those are defined in linux sysreg too
>
>> +    elif _type == 'Fields.ConditionalField':
>> +        inner_offset = bit_offset
>> +        if item.get('rangeset'):
>> +            # Parent container defines the absolute start bit
>> +            inner_offset = item['rangeset'][0].get('start', bit_offset)
>> +
>> +        for entry in item.get('fields', []):
>> +            inner = entry.get('field')
>> +            if inner:
>> +                fields.extend(collect_fields(inner, inner_offset))
>> +        return fields
>> +
>> +    # Normal Field Types
>> +    leaf_types = ['Fields.Field', 'Fields.ConstantField',
>> +                  'Fields.EnumeratedField', 'Fields.Bitfield']
>> +    if _type in leaf_types:
>> +        field_copy = item.copy()
>> +        if field_copy.get('rangeset'):
>> +            new_ranges = []
>> +            for r in field_copy['rangeset']:
>> +                nr = r.copy()
>> +                # Apply the cumulative offset to the field's start bit
>> +                nr['start'] = r.get('start', 0) + bit_offset
>> +                new_ranges.append(nr)
>> +            field_copy['rangeset'] = new_ranges
>> +        fields.append(field_copy)
>> +        return fields
>> +
>> +    # Traverse the hierarchy for other cases
>> +    for key in ['fields', 'values', 'fieldsets']:
>> +        for nested in item.get(key, []):
>> +            fields.extend(collect_fields(nested, bit_offset))
>> +
>> +    return fields
>> +
>> +
>> +def generate_sysreg_properties_from_registers_json(id_reg_names, raw_json_path):
>> +    with open(raw_json_path, 'r') as f:
>> +        register_data = json.load(f)
>> +
>> +    regs = {r.get('name'): r for r in register_data if r.get('_type') == 'Register'}
>> +
>> +    final_output = ""
>> +
>> +    for reg_name in id_reg_names:
>> +        register = regs.get(reg_name)
>> +        if not register:
> we should error out here.
agreed
>> +            continue
>> +
>> +        final_output += f"IDREG_START({reg_name})\n"
>> +
>> +        unique_fields = {}
>> +        for fieldset in register.get('fieldsets', []):
>> +            candidates = collect_fields(fieldset)
>> +            for val in candidates:
>> +                name = (val.get('name') or val.get('label', '')).strip()
>> +                if not name or "RESERVED" in name.upper():
>> +                    continue
>> +                for r in val.get('rangeset', []):
>> +                    lsb = int(r.get('start'))
>> +                    width = r.get('width')
>> +                    msb = lsb + int(width) - 1
>> +
>> +                    # Only keep the fields with the highest MSB
>> +                    # needed fir CCSIDR_EL1
> does not apply now, we ignore CCSIDR_EL1
yeah but I feel it still makes sense to record the highest msb in case
different fieldsets exist for the same name (32b versus 64b for instance)
>> +                    if name not in unique_fields or msb > unique_fields[name]['msb']:
>> +                        unique_fields[name] = {'lsb': lsb, 'msb': msb, 'width': width}
>> +
>> +        # Sort decreasing lsbs
>> +        sorted_fields = sorted(unique_fields.items(),
>> +                               key=lambda x: x[1]['lsb'], reverse=True)
>> +
>> +        for name, bits in sorted_fields:
>> +            line = (f"    IDREG_FIELD({reg_name}, "
>> +                    f"{name}, {bits['lsb']}, {bits['width']})\n")
>> +            final_output += line
>> +        final_output += f"IDREG_END({reg_name})\n"
>> +        final_output += "\n"
>> +
>> +    os.makedirs("target/arm", exist_ok=True)
>> +    with open("target/arm/cpu-idregs.h.inc", 'w') as f:
>> +        f.write("/* AUTOMATICALLY GENERATED, DO NOT MODIFY */\n\n")
>> +        f.write("/* SPDX-License-Identifier: GPL-2.0-or-later */\n\n")
>> +        f.write("/* IDREG_START(REG) */\n")
>> +        f.write("/*     IDREG_FIELD(REG, FIELD, SHIFT, LENGTH) */\n”)
> Same enum macro …
see above

Thanks!

Eric
>
> Warm Regards,
> Khushit
>> +        f.write("/* ... */\n")
>> +        f.write("/* IDREG_END(REG) */\n\n")
>> +        f.write(final_output)
>> +
>> +if __name__ == "__main__":
>> +    if len(sys.argv) < 2:
>> +        print("Usage: python scripts/update-aarch64-cpu-sysreg-properties.py "
>> +              "<path_to_registers_json>")
>> +    else:
>> +        json_path = sys.argv[1]
>> +
>> +        id_regs_dict = extract_idregs_from_registers_json(json_path)
>> +        sorted_names = sorted(id_regs_dict.keys())
>> +
>> +        if sorted_names:
>> +            generate_sysreg_properties_from_registers_json(sorted_names, json_path)
>> +            print("Generated target/arm/cpu-idregs.h.inc")
>> -- 
>> 2.53.0
>>


