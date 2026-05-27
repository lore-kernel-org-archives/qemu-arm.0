Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587E5CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 15:14:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSFxf-0006Ly-W6; Wed, 27 May 2026 11:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSFxc-0006JH-SY
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSFxZ-0006X7-7v
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779894856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHNZso132dglP2payHGFSmMwbdloulfUIzdNpbPvJbc=;
 b=MiN/eaBqVkI18+oHWCqt6/LzVLWEsqHvAsji+wfymYI4Knu2/G6G/zKdUHZ0XiM5GLpxCg
 g19R/kf562vNNT6XVtrCyAKF5f/0n8mCbeIM92O60Pol5lM1uVzIp4w3vntUSmlDU75Jzb
 CSYpGhkbeXd1ZM3xzOMmk/k1KE6oseg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-1eBoYg7vPimYC4sTvvjvqg-1; Wed, 27 May 2026 11:14:14 -0400
X-MC-Unique: 1eBoYg7vPimYC4sTvvjvqg-1
X-Mimecast-MFC-AGG-ID: 1eBoYg7vPimYC4sTvvjvqg_1779894853
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49081106196so9058815e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 08:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779894853; x=1780499653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHNZso132dglP2payHGFSmMwbdloulfUIzdNpbPvJbc=;
 b=gErDlpalgFiqDQ6SS76OABTFgcvdcyBXl8wcTiu23h4E/qg6vfmU0TXKp1Wrf3D0ag
 8fkTNExKjx3KoiF29tCZR0/6hQQJfOiyl8x/8cRPVemwrD+WaOSbfcExRYmsHyPq5I3C
 Nnf42fR5mPcBFqaa2L4nTFfx+bqB9UFlD4ZpFuf5JzIFUFeWRZHal3xt2c161bPyPf+i
 kQiJgl2t+BAGHZnG0AIPQYe8Lvl95bzOuP5nmgFrlkWRv7OHv7ghTjdUFKZxRPzLCAt7
 BGKl4IOqNDECVw4yafYxcuZY3ktZVfKnvLjYkA+hLjhITBWi9KFU1wuANs4yul5lDQe3
 6t5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9r5eUiiZo/YX9irpsJ7gBDYnVO5kLuJE03kUM8bREBMvIVKLU4qYnD0DgfFkq83VVytdTK48FJhQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy8FYz1e8E/ej1J6HI0f4VjuJyWOj5toR2ItBXbvTJv9eKcogdq
 gpPi6XWsK1OnvjF8Jn6A2Lot+rjEqesm8SwUYs0Dm3xeivZXDileXJGwJ4X/oh/bea3dYo58LFZ
 e17iQkkjBA70AkYOStFQMhrbMt9c/nCLF5N5mWjph5MLEjML6ByNVVA==
X-Gm-Gg: Acq92OEVmU7Dtd+ueSyp/9Q4upBO+27nEz9n6fgRKycqVrO9/9HvYo+/NBgYCyhW5ot
 1pLefG+0Ke4MW09DX+RsD/jvxMrwgGwzKuMaC+bW95tMMCHB80eC7B7B2Jo8YM4TV+0Pq08dxkr
 DMjmmmWpcZQY1NLVAJMCZpWTpZXqljq2RXEQ8bo63Ah7fC9ZlPCXyTYkuzWgueeDywqI6rnsJah
 3HqNjdk9lXLSMPES91UhjmWIZG4RWjD0qC7+Urej/T0VLRkKk6zSHy+wyWPY1OmwEyEDhtoykaW
 24KIAAEjw4Qdw0iuRWt2S101chIS7ah/XymZGA0pGi/QxUVqIqnM+XP8Lks7mPiACYZON+WKmt6
 HIMlNEfyti8Op8S0gRwE3imUEUIjlPl4Y4v//0Hpl45sIcC0Uvqk6QvKc5iEjBqMjDeGAN0x4YS
 w+wLRa
X-Received: by 2002:a05:600c:3b02:b0:489:201c:dc46 with SMTP id
 5b1f17b1804b1-490424b2cf1mr398245255e9.12.1779894853258; 
 Wed, 27 May 2026 08:14:13 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:489:201c:dc46 with SMTP id
 5b1f17b1804b1-490424b2cf1mr398244605e9.12.1779894852820; 
 Wed, 27 May 2026 08:14:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a198sm393501675e9.10.2026.05.27.08.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 08:14:12 -0700 (PDT)
Message-ID: <35a3fb6f-cb9a-4d47-af6c-1b9c23a6a66b@redhat.com>
Date: Wed, 27 May 2026 17:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/18] target/arm/cpu_idregs: generate tables for Arm64
 ID registers and fields
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
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-9-eric.auger@redhat.com>
 <E6706A9A-B0E0-4A1B-B7E9-8A0BF73A1170@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <E6706A9A-B0E0-4A1B-B7E9-8A0BF73A1170@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fpd6QEYxHh4Sy1tpSdASr0HZkUkgJfzzFkNydGoOUFM_1779894853
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



On 5/27/26 4:52 PM, Khushit Shah wrote:
>
>> On 19 May 2026, at 6:57 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> From: Shaju Abraham <shaju.abraham@nutanix.com>
>>
>> Include cpu-idregs.h.inc multiple times with different definitions for the
>> X-macros. This will generate tables for all Arm64 ID registers and their
>> fields. Additionally, initialize the tables with all architecturally defined
>> values. These tables will be consumed by the property layer in future
>> patches.
>>
>> Co-authored-by: Khushit Shah <khushit.shah@nutanix.com>
>> Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/cpu-idregs.c | 50 +++++++++++++++++++++++++++++++++++++++++
>> target/arm/meson.build  |  1 +
>> 2 files changed, 51 insertions(+)
>> create mode 100644 target/arm/cpu-idregs.c
>>
>> diff --git a/target/arm/cpu-idregs.c b/target/arm/cpu-idregs.c
>> new file mode 100644
>> index 0000000000..f79b22680c
>> --- /dev/null
>> +++ b/target/arm/cpu-idregs.c
>> @@ -0,0 +1,50 @@
>> +/*
>> + *   ARM ID register field table.
>> + *
>> + *   Builds the per-id-register field descriptor arrays and the global
>> + *   arm_idregs[] table.
>> + *
>> + *  SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "qapi/error.h"
>> +#include "cpu.h"
>> +#include "cpu-idregs.h"
>> +
>> +#define IDREG_START(reg) \
>> +    static ARM64SysRegField reg##_fields[] = {
>> +
>> +#define IDREG_END(reg) \
>> +    };
>> +
>> +#define IDREG_FIELD(reg, field, _shift, _length) \
>> +    { \
>> +        .name = #field, \
>> +        .index = reg##_IDX, \
>> +        .shift = (_shift), \
>> +        .length = (_length), \
>> +    },
>> +#include "cpu-idregs.h.inc"
>> +#undef IDREG_START
>> +#undef IDREG_END
>> +#undef IDREG_FIELD
>> +
>> +/* generate an array of top level ID registers */
>> +#define IDREG_END(reg)
>> +#define IDREG_FIELD(reg, field, shift, length)
>> +
>> +#define IDREG_START(reg) \
>> +    [reg##_IDX] = { \
>> +        .name = #reg, \
>> +        .index = reg##_IDX, \
>> +        .fields = reg##_fields, \
>> +        .fields_count = ARRAY_SIZE(reg##_fields), \
>> +    },
>> +
>> +ARM64SysReg arm64_id_regs[NUM_ID_IDX] = {
>> +#include "cpu-idregs.h.inc"
>> +};
>> +#undef IDREG_START
>> +#undef IDREG_END
>> +#undef IDREG_FIELD
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 4723f9f170..64d1ec63ab 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -19,6 +19,7 @@ arm_common_ss.add(files(
>>
>> arm_common_system_ss.add(files(
>>   'arm-qmp-cmds.c',
>> +  'cpu-idregs.c',
>> ))
>> arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
>> arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
>> -- 
>> 2.53.0
>>
> We can also store writable_masks here. writable_mask exposed by KVM is
> static. It does not change in any configuration hence can be fetched once 
> during scratch vCPU creation

I agree. Nevertheless when using the KVM API we need an array to store
the bitmasks anyway. That's why I initially saved it in the CPU state.
We can copy the bitmask to each id reg struct though

Eric
>
> Warm Regards,
> Khushit


