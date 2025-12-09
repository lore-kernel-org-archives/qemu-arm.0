Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D721ED1CDC6
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 13:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSxx2-0006Ur-3F; Tue, 09 Dec 2025 08:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSxx0-0006UN-Cz
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 08:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSxwy-0007pz-8h
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 08:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765287619;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jp8dQ4ZxweQUSaRVnb7FA1Q6RudEKmH/1SM3P4DYELc=;
 b=I57gAZ0USmzu5tyxE8qKXX+QQXHP4uO1krbiTjASdTHL7uJ9pokxAt8bwLU7CVATJt3iJW
 QvI7HylTrxBzYOqizWZSz1giKE8wqUf0CXAqSIej804yVIrxgKdSdxs++JfBGUHnfq7ef5
 ddqxnHLZsCo6ezIfCWdlSbktj7rWkao=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-DCTO2O36NTqRv1J_zvUzmQ-1; Tue, 09 Dec 2025 08:40:16 -0500
X-MC-Unique: DCTO2O36NTqRv1J_zvUzmQ-1
X-Mimecast-MFC-AGG-ID: DCTO2O36NTqRv1J_zvUzmQ_1765287615
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297fbfb4e53so98822125ad.1
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 05:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765287615; x=1765892415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jp8dQ4ZxweQUSaRVnb7FA1Q6RudEKmH/1SM3P4DYELc=;
 b=pQQ2td7H70fhFFQrU66IvIRzALvTJ6fdFniTgW1jvTt3PBsMZUTUhHao7KA1kOXsbe
 6zGZVzQhawSsVRZAifYXEG64gCRRpsQn6L0QyUg/b43oSHckW59w5fEIoVVabL0MHCxD
 Zm0dmSG3WSwj6FBMX8wc3ySE2XG4RWtJWPYKZ4A2hxBDJNynOF+Bw5FJ4ocXdeIuacRq
 4YiXtMlrF/7O12VgrQQeu6RsW33tfBJ0+b0q2pMd51zjRJ8TUgYzzMQ4zCZGZ6GUK+6O
 uOyMo2Vw9P4Nf1iKshdZ1bGmG2bj1eiqpSZ8Lf398Yu0/RGEmrys1MZuHxwNyr3+kS4n
 0X7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpARzCooA1fyBLLcER8ukAVnPi2w6kxkYV4N2hDHM1unw3xJyHxxeMmcyu2pH9Hz48fuYOlfG/oA==@nongnu.org
X-Gm-Message-State: AOJu0YynWjqOOtOwOh3D/6QJe+i+FO1edGMBS0ljGe18O1MUCjG4vSXO
 PugF1BB4OJEXNWhp6CVsKuJ41AZYQKH7sI2o71/+FZS5V51lx4jq2wpMdJf5KCp6ydwX3/Ohcgr
 gTb6oeB6co2csM5ZexIoGolajNlBKfOnXbJlVsb7dLbKM7CqPmd0JKg==
X-Gm-Gg: AY/fxX6WGZRZ3wX2mgUUhEP9LixxcJPLBtr/IuPRHYHWsn2SBNFrLqdGsOTb9RQwm2z
 kjqMy1+xoQnEH7lAWJqbcbC1KYLw6zNFqVebE6+lVKXmnbQzhucB4p6cOH853ziMTo8J3UBG5eB
 Lzg/yN3VI0uDVpPrQP+MatqndCMCADXUA+YT0nRtb9gbRRKzlsGsjklCo61Lg8PCwKkkyl3F4E7
 4JNo/jMNyr47XjeRsG2jFREF1wImVjE+op8wU4fJcxisd/hpqpF875XFwtrIS1kKD6ole93KECb
 azPrOBUb6DY8q54XyqTwZmgcN/sXVpe0rflEy6sw+qHTIBVNBno97fOmj2z1yqCiwvClNTxlxzf
 PnICvMDWwAwh86N8/23tYzF2GJ3Y+bbI+QmLvqz6xO93O+Ihsap1iXgnZAQ==
X-Received: by 2002:a17:902:ef46:b0:298:45b1:89a1 with SMTP id
 d9443c01a7336-29df579ea75mr96259885ad.12.1765287615369; 
 Tue, 09 Dec 2025 05:40:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgovf6JbaRgcrdyOawZLPYYG15lLHvkEnkaflGB5cVzB6qDj8nH8K0/5G3ygyVTA/DSBK1pA==
X-Received: by 2002:a17:902:ef46:b0:298:45b1:89a1 with SMTP id
 d9443c01a7336-29df579ea75mr96259575ad.12.1765287614876; 
 Tue, 09 Dec 2025 05:40:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeae6ae0sm156163035ad.93.2025.12.09.05.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 05:40:14 -0800 (PST)
Message-ID: <3a23f4b5-ff63-4b63-8dd3-f0bdd250c2ac@redhat.com>
Date: Tue, 9 Dec 2025 14:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] scripts: introduce
 scripts/update-aarch64-sysreg-code.py
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com,
 sebott@redhat.com
Cc: maz@kernel.org
References: <20251208163751.611186-1-eric.auger@redhat.com>
 <20251208163751.611186-2-eric.auger@redhat.com>
 <796814e9-62c2-44d2-bd8c-39e36f17f635@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <796814e9-62c2-44d2-bd8c-39e36f17f635@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: __9oeqfzG_9OUWVgbade_P3WcbsCkj2K6Or-Bcyz0gI_1765287615
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Philippe,

On 12/9/25 1:30 PM, Philippe Mathieu-Daudé wrote:
> On 8/12/25 17:37, Eric Auger wrote:
>> Introduce a script that takes as input the Registers.json file
>> delivered in the AARCHMRS Features Model downloadable from the
>> Arm Developer A-Profile Architecture Exploration Tools page:
>> https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
>>
>> and outputs the list of ID regs in target/arm/cpu-sysregs.h.inc
>> under the form of DEF(<name>, <op0>, <op1>, <crn>, <crm>, <op2>).
>
> Great idea!
>
>>
>> We only care about IDregs with opcodes satisfying:
>> op0 = 3, op1 within [0, 3], crn = 0, crm within [0, 7], op2 within
>> [0, 7]
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> This was tested with
>> https://developer.arm.com/-/cdn-downloads/permalink/Exploration-Tools-OS-Machine-Readable-Data/AARCHMRS_BSD/AARCHMRS_OPENSOURCE_A_profile_FAT-2025-09_ASL0.tar.gz
>>
>> Discussion about undesired generated regs can be found in
>> https://lore.kernel.org/all/CAFEAcA9OXi4v+hdBMamQv85HYp2EqxOA5=nfsdZ5E3nf8RP_pw@mail.gmail.com/
>>
>> ---
>>   scripts/update-aarch64-sysreg-code.py | 133 ++++++++++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>   create mode 100755 scripts/update-aarch64-sysreg-code.py
>>
>> diff --git a/scripts/update-aarch64-sysreg-code.py
>> b/scripts/update-aarch64-sysreg-code.py
>> new file mode 100755
>> index 0000000000..c7b31035d1
>> --- /dev/null
>> +++ b/scripts/update-aarch64-sysreg-code.py
>> @@ -0,0 +1,133 @@
>> +#!/usr/bin/env python3
>> +
>> +# This script takes as input the Registers.json file delivered in
>> +# the AARCHMRS Features Model downloadable from the Arm Developer
>> +# A-Profile Architecture Exploration Tools page:
>> +#
>> https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
>> +# and outputs the list of ID regs in target/arm/cpu-sysregs.h.inc
>> +# under the form of DEF(<name>, <op0>, <op1>, <crn>, <crm>, <op2>)
>> +#
>> +# Copyright (C) 2025 Red Hat, Inc.
>> +#
>> +# Authors: Eric Auger <eric.auger@redhat.com>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +
>> +import json
>> +import os
>> +import sys
>> +
>
> [*]
>
>> +# returns the int value of a given @opcode for a reg @encoding
>> +def get_opcode(encoding, opcode):
>> +    fvalue = encoding.get(opcode)
>> +    if fvalue:
>> +        value = fvalue.get('value')
>> +        if isinstance(value, str):
>> +            value = value.strip("'")
>> +            value = int(value,2)
>> +            return value
>> +    return -1
>> +
>> +def extract_idregs_from_registers_json(filename):
>> +    """
>> +    Load a Registers.json file and extract all ID registers, decode
>> their
>> +    opcode and dump the information in target/arm/cpu-sysregs.h.inc
>> +
>> +    Args:
>> +        filename (str): The path to the Registers.json
>> +    returns:
>> +        idregs: list of ID regs and their encoding
>> +    """
>> +    if not os.path.exists(filename):
>> +        print(f"Error: {filename} could not be found!")
>> +        return {}
>> +
>> +    try:
>> +        with open(filename, 'r') as f:
>> +            register_data = json.load(f)
>> +
>> +    except json.JSONDecodeError:
>> +        print(f"Could not decode json from '{filename}'!")
>> +        return {}
>> +    except Exception as e:
>> +        print(f"Unexpected error while reading {filename}: {e}")
>> +        return {}
>> +
>> +    registers = [r for r in register_data if isinstance(r, dict) and \
>> +                r.get('_type') == 'Register']
>> +
>> +    idregs = {}
>> +
>> +    # Some regs have op code values like 000x, 001x. Anyway we don't
>> need
>> +    # them. Besides some regs are undesired in the generated file
>> such as
>> +    # CCSIDR_EL1 and CCSIDR2_EL1 which are arrays of regs. Also exclude
>> +    # VMPIDR_EL2 and VPIDR_EL2 which are outside of the IDreg scope we
>> +    # are interested in and are tricky to decode as their system
>> accessor
>> +    # refer to MPIDR_EL1/MIDR_EL1 respectively
>> +
>> +    skiplist = ['ALLINT', 'PM', 'S1_', 'S3_', 'SVCR', \
>> +                'CCSIDR_EL1', 'CCSIDR2_EL1', 'VMPIDR_EL2', 'VPIDR_EL2']
>
> Since we might have to update this array, I'd move it (and the big
> comment preceding) in [*].
>
>> +
>> +    for register in registers:
>> +        reg_name = register.get('name')
>> +
>> +        is_skipped = any(term in (reg_name or "").upper() for term
>> in skiplist)
>> +
>> +        if reg_name and not is_skipped:
>> +            accessors = register.get('accessors', [])
>> +
>> +            for accessor in accessors:
>> +                type = accessor.get('_type')
>> +                if type in ['Accessors.SystemAccessor']:
>> +                    encoding_list = accessor.get('encoding')
>> +
>> +                    if isinstance(encoding_list, list) and
>> encoding_list and \
>> +                       isinstance(encoding_list[0], dict):
>> +                        encoding_wrapper = encoding_list[0]
>> +                        encoding_source =
>> encoding_wrapper.get('encodings', \
>> +                                                              
>> encoding_wrapper)
>> +
>> +                        if isinstance(encoding_source, dict):
>> +                                op0 = get_opcode(encoding_source,
>> 'op0')
>> +                                op1 = get_opcode(encoding_source,
>> 'op1')
>> +                                op2 = get_opcode(encoding_source,
>> 'op2')
>> +                                crn = get_opcode(encoding_source,
>> 'CRn')
>> +                                crm = get_opcode(encoding_source,
>> 'CRm')
>> +                                encoding_str=f"{op0} {op1} {crn}
>> {crm} {op2}"
>> +
>> +                # ID regs are assumed within this scope
>> +                if op0 == 3 and (op1 == 0 or op1 == 1 or op1 == 3)
>> and \
>> +                   crn == 0 and (crm >= 0 and crm <= 7) and (op2 >=
>> 0 and op2 <= 7):
>> +                    idregs[reg_name] = encoding_str
>> +
>> +    return idregs
>> +
>> +if __name__ == "__main__":
>> +    # Single arg expectedr: the path to the Registers.json file
>
> Typo "expectedr".
>
>> +    if len(sys.argv) < 2:
>> +        print("Usage: scripts/update-aarch64-sysreg-code.py
>> <path_to_registers_json>")
>> +        sys.exit(1)
>> +    else:
>> +        json_file_path = sys.argv[1]
>> +
>> +    extracted_registers =
>> extract_idregs_from_registers_json(json_file_path)
>> +
>> +    if extracted_registers:
>> +        output_list = extracted_registers.items()
>> +
>> +        # Sort by register name
>> +        sorted_output = sorted(output_list, key=lambda item: item[0])
>> +
>> +        # format lines as DEF(<name>, <op0>, <op1>, <crn>, <crm>,
>> <op2>)
>> +        final_output = ""
>> +        for reg_name, encoding in sorted_output:
>> +            reformatted_encoding = encoding.replace(" ", ", ")
>> +            final_output += f"DEF({reg_name},
>> {reformatted_encoding})\n"
>> +
>> +        with open("target/arm/cpu-sysregs.h.inc", 'w') as f:
>> +            f.write("/* SPDX-License-Identifier: BSD-3-Clause */\n\n")
>> +            f.write("/* This file is autogenerated by ")
>> +            f.write("scripts/update-aarch64-sysreg-code.py */\n\n")
>> +            f.write(final_output)
>> +        print(f"updated target/arm/cpu-sysregs.h.inc")
>
> Fixed string (no formating) so no need for f- prefix.
>
> Patch LGTM but it should have some unit test. 

thank you for the review.

Not sure what you mean by unit test? One solution could be to diff the
result with former bash/awk I used to generation previously [1] but i
guess it would be awkward to upstream the awk script we did not want in
the first place. Otherwise we could check some random opcodes but it
wouldn't mean the others are correct. To me the best way to validate the
python script is to do [1] once but do not upstream that. Reviewing the
new generated files against the previous content [3/3] is the best way
to test the result. I mean using auto generation does not prevent from
reviewing the generated stuff, especially because the generation is
triggered manually as scripts/update_linux_headers.sh and should not
happen very frequenty.

Thoughts?

Eric  


