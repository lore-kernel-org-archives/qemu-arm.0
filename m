Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0E2CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 07:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXwTP-0000fi-Nz; Fri, 12 Jun 2026 03:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXwTJ-0000er-Mj
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 03:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXwTH-0005FT-WD
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 03:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781249910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36OuNx9nK8T/nKzXs0flx3BkMIs014GXg11EFPwESHM=;
 b=OIYk3vOzh/ZM9avUEs+ZjZcU0V+eQ5OQVphRWn8mvZupjn6YqdnT9usHUT/trZkuPtnTQC
 /0ZQKWZfVXLHW7fBzg0DoP4KL6hewB1IzEIvSGYXyknkxoofC9NfQvMiUUdcKCguKh1LK9
 FVRce312cRzARbPxlKuxgAbR8luoNCo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-KPg8uMQdP6qbaBd2k6Opfg-1; Fri, 12 Jun 2026 03:38:29 -0400
X-MC-Unique: KPg8uMQdP6qbaBd2k6Opfg-1
X-Mimecast-MFC-AGG-ID: KPg8uMQdP6qbaBd2k6Opfg_1781249908
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-46067b07571so374406f8f.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 00:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781249908; x=1781854708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36OuNx9nK8T/nKzXs0flx3BkMIs014GXg11EFPwESHM=;
 b=M8KVw/LzZv3gbbcPs4NHDS8ZzeKiPO6EP2+Fr2laUr4yFHZRefs1Yo1Psdn5FE9RfD
 V4edClhQGBTRNCidHDOiRVG/msNqiskXVopTY4U6kRenvvafwTt0QR0eJ6lgMmBR01Cm
 sQIwr6NdZUhHhCm1gN60dpMh5SYiXHqJMgP0r3I5nHUhKfWry/FkZUQwD+unxznOxDfN
 UA/HImnIVviuZX07HU74eEr9n0Ae+7iamlC9MnO6IEAkB+9GDXG39TNOFUx6D6VmsOxV
 7BFhZOkK29Sk2eYE8TbiFjlqHBV/D2gVQtnwg22NFQtPkDZTZVvpQyCnNXV7QBvoNgbE
 /urw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HY1scD2/U7KvJY7x7Du5ckTfGvXhkhFBy1WeSkWgwkvFwG7mYe0GoXk/vq7iC6EQUOu3e3mbAYA==@nongnu.org
X-Gm-Message-State: AOJu0Ywm9PV2uohzWIgPRR6zMuvKX14xRWCz68hJq67wkdwEPKekCUCW
 TA+oVUe/uib+CG2lDYSQp1Q8O9AIs51Us3TVPFj3Sw27FBVvqkNajsJ6CiSA8dD8pmOVD1GxTk8
 LfDxnS041cDzvbTwytD9wOr6b2lIeqnl6y2as/5Xq321jy/+dT4Cu9w==
X-Gm-Gg: Acq92OG4zG00bynv9hRVUWFALVhB2qVuOvRpg0M2V8IiCcHiYfX5tYTcjhN1kXAlP9A
 CReUkFujQwkumvsM1xf0z4J1fKPwKAKDSqfHS1GMZ5RwJm5AcEUSV9SD5hhLOIZjGxTAReX0bA+
 ujJqRDKRF1Ss1xHT3GHyV7AQ5Z18vRUIlGxaqXi2cHmnFOdRxU0aKQdDRmZqxTpbVfzP1swvZnp
 LReIXIkYVTo1W5RKQSydVbkNgz5v/05El0kzMtDfjfIPn96u2YE9dmKYyA8HDPgPS1wHB0i7O6F
 sMphK3Z+SPEwrNoSugRuiFu314beBBYc/6iMYhUZiJi7YQ7Aps4NX9JME3Qgy16KcFhsj1VaMXM
 3EuilF3nLNRgQDxHMOYti8Hn/UWaV3qGUv7lCvpa7ILT6Q3tzY1Qwh7kQLqdhqhGDgxasZw==
X-Received: by 2002:a05:6000:2586:b0:460:684d:d565 with SMTP id
 ffacd0b85a97d-4606f255ab8mr1753984f8f.15.1781249907931; 
 Fri, 12 Jun 2026 00:38:27 -0700 (PDT)
X-Received: by 2002:a05:6000:2586:b0:460:684d:d565 with SMTP id
 ffacd0b85a97d-4606f255ab8mr1753954f8f.15.1781249907598; 
 Fri, 12 Jun 2026 00:38:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm3028887f8f.15.2026.06.12.00.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 00:38:26 -0700 (PDT)
Message-ID: <51ba045f-6ecf-4703-92c6-f362724c408e@redhat.com>
Date: Fri, 12 Jun 2026 09:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/18] arm/cpu: Add infra to handle generated ID
 register definitions
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shaju.abraham@nutanix.com" <shaju.abraham@nutanix.com>,
 "khushit.shah@nutanix.com" <khushit.shah@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-5-eric.auger@redhat.com>
 <CH3PR12MB7548D1CA4348E04A14725645AB152@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548D1CA4348E04A14725645AB152@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MRUbViwmQMaG3F4TCv2TwaBEqxZmFc-PBuSNlz1SAK0_1781249908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Shameer,

On 6/1/26 4:28 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 19 May 2026 14:27
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; shaju.abraham@nutanix.com;
>> khushit.shah@nutanix.com; yangjinqian1@huawei.com;
>> cohuck@redhat.com; richard.henderson@linaro.org; sebott@redhat.com;
>> Shameer Kolothum Thodi <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v5 04/18] arm/cpu: Add infra to handle generated ID register
>> definitions
>>
>> External email: Use caution opening links or attachments
>>
>>
>> The known ID regs are populated in a new initialization function
>> named initialize_cpu_sysreg_properties(). That code will be
>> automatically generated from AARCHMRS Registers.json. For the
>> time being let's just describe a single id reg, CTR_EL0. In this
>> description we only care about non RES/RAZ fields, ie. named fields.
>>
>> The registers are populated in an array indexed by ARMIDRegisterIdx
>> and their fields are added in a sorted list.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>>
>> v4 -> v5
>> - ifdef TARGET_ARM_CPU_IDREGS_H
>> - s/g_list_append/g_list_prepend
>> - void arm64_sysreg_add_field()

Effectively the whole commit desc is outdated now that I have migrated
to Khushit description of idregs and their fields. No need for list nor 

arm64_sysreg_add_field anymore.

Arrays are populated in [PATCH v5 08/18] target/arm/cpu_idregs: generate tables for Arm64 ID registers and fields
This is much nicer.

Thanks

Eric

> Looks like this patch is missing the above and file:
> target/arm/cpu-sysreg-properties.c
>
> Please check.
>
> Thanks,
> Shameer
>
>> ---
>>  target/arm/cpu-idregs.h | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 target/arm/cpu-idregs.h
>>
>> diff --git a/target/arm/cpu-idregs.h b/target/arm/cpu-idregs.h
>> new file mode 100644
>> index 0000000000..664e2d6ddd
>> --- /dev/null
>> +++ b/target/arm/cpu-idregs.h
>> @@ -0,0 +1,33 @@
>> +/*
>> + * handle ID registers and their fields
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#ifndef TARGET_ARM_CPU_IDREGS_H
>> +#define TARGET_ARM_CPU_IDREGS_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "cpu.h"
>> +#include "cpu-sysregs.h"
>> +
>> +typedef struct ARM64SysRegField {
>> +    const char *name; /* name of the field, for instance CTR_EL0_IDC */
>> +    ARMIDRegisterIdx index; /* parent register, e.g. CTR_EL0_IDX */
>> +    int shift; /* lsb of the field in the register */
>> +    int length; /* highest bit number */
>> +} ARM64SysRegField;
>> +
>> +typedef struct ARM64SysReg {
>> +    const char *name;   /* name of the sysreg, for instance CTR_EL0 */
>> +    ARMIDRegisterIdx index; /* register index, e.g. CTR_EL0_IDX */
>> +    struct ARM64SysRegField *fields;
>> +    uint32_t fields_count;
>> +} ARM64SysReg;
>> +
>> +/*
>> + * List of exposed ID regs (automatically populated from AARCHMRS
>> Registers.json)
>> + */
>> +extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
>> +
>> +#endif
>> --
>> 2.53.0


