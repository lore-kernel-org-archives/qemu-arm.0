Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB2CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 06:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMglq-00034O-AA; Tue, 12 May 2026 02:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMglo-0002xM-3b
 for qemu-arm@nongnu.org; Tue, 12 May 2026 02:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMgll-0006J8-FC
 for qemu-arm@nongnu.org; Tue, 12 May 2026 02:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778567943;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoVJ+c/uz80TrOdip6QXqOUN43LCIvcXnIK/rRMfnkc=;
 b=hXDhwkVDR3sw5Q3dD1pq7D9VT8iKPo9ADBWPnyeoQncSZpN4dWmWLM20bgLus2WKQU4tkP
 DVocmuECLrb3GK2+i11Vqx0h5CqJJc5ssZ+wTIxCnSUsgnbIXxMFWhMnW+MYYwIHm2CzW1
 T8vGlIs6aADZm82HXB2DnfdnqadV4P8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-8hrjxicEMFe4VYZISbOPMQ-1; Tue, 12 May 2026 02:39:02 -0400
X-MC-Unique: 8hrjxicEMFe4VYZISbOPMQ-1
X-Mimecast-MFC-AGG-ID: 8hrjxicEMFe4VYZISbOPMQ_1778567941
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44a52d5e572so3141018f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 23:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778567941; x=1779172741;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NoVJ+c/uz80TrOdip6QXqOUN43LCIvcXnIK/rRMfnkc=;
 b=U4dHKbYY5Nt31Qegzp1YoTMuaOQJtqF4cro+vgWi+4DFivfePFepz1UFFg4igfiSjX
 L3Xqrx4Hi5CabgKeXzndvVxnphqb2UMpFBph6Z11/0Gb1Vp+G9gTCcMjr2L/bCpfIvM8
 9MbaBmB4QYBbdSvgEO82nNDdsp6DxnC+Z1he1PEI3NwzZbO7Uuc5ft3dE9hQ48eWH1s6
 SSVw/oKr9Xx+7VRVMo3HHeveqIHoVRFpqelCuMHI+r3XPb9EqdpoYjuZSCcGhmw04GJa
 DOorbxnDrXCp5pSE6PROA1bIvL21nvDSwN0w6gHzvj2Lj6dLNp+yZ7AFiifMp8GtMXgq
 ts5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xmN8z1d8T/gICol4/orvUxxANDUNf7HlF1PynlPXDlbmSqqVzrX1sK3oCNTHPD5dnXPdIIIkfuA==@nongnu.org
X-Gm-Message-State: AOJu0YzJI+xkWNXXstWLgqO+kXJBSbEjoouhjb3vLu5VxJEqsGqrQQ0L
 +4g3MkDa9ixGh0DUznetr7LKP8W7jUkW5O9aZk5E7OXBlkxQmqHQAv44POVaX/PuvWz1XFSUiFk
 s3ob/AFDL6G9WUEhCj2m3XGhuNvsooaCVuPy+xX0zdhHgh20rIH7ujw==
X-Gm-Gg: Acq92OHOj/fDMQZ6VxqwkAr7ISPRU1M0X2sqRz+bR82kyndUz4Vi70kPIIGu75/RPUe
 URSjMoXAVuG8dNFiVyBwIcJhL5jEr+pab6pCgRxrk/XKyeLB7MgwmZTkGUwYVHIZVHbPUMQyq6j
 DYjgQWpFZndwxloV1XNQA9GiDoYVvpsEc+Sfvj62WV37KgYb5ZtG69mVdx+VqXFqudrr1Fnwqw9
 dpRfHT56G1N9TmgAoh9mKHnqLcwK45cZNUBBsR8tYBTM4l9xNxl3xUID6CrADj0eKV00+M13mXT
 n4CFvF1BdB11ipZueSflat16RaxDMQ0ET/OY5R6YVeyWD0TiObvufkDDpzKd5+Q9PqeIOS5+/kn
 qXDdHlYUgOATdMOokEW8yJLdpjeh2lyHf2xTpGovU8vhueB+xjZtEBgNJtotPlkfNz4qYjA==
X-Received: by 2002:a05:600c:c058:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-48e6db40058mr168505635e9.14.1778567941123; 
 Mon, 11 May 2026 23:39:01 -0700 (PDT)
X-Received: by 2002:a05:600c:c058:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-48e6db40058mr168505275e9.14.1778567940725; 
 Mon, 11 May 2026 23:39:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a5b65sm31614561f8f.8.2026.05.11.23.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 23:39:00 -0700 (PDT)
Message-ID: <c7bfd8f7-3e3f-49fe-a8f4-ac0212a1762b@redhat.com>
Date: Tue, 12 May 2026 08:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] target/arm/cpu-sysregs.h.inc: Update with
 automatic generation
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <20260503073541.790215-4-eric.auger@redhat.com>
 <CH3PR12MB7548C2AB4989FEF96C247D47AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548C2AB4989FEF96C247D47AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GRjgLHk80tKkjd96Rb72XDojxI77zmPyf9aAyig9uZA_1778567941
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 5/7/26 10:45 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 May 2026 08:33
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> cohuck@redhat.com; sebott@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v4 03/17] target/arm/cpu-sysregs.h.inc: Update with
>> automatic generation
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Generated definitions with scripts/update-aarch64-cpu-sysregs-header.py
>> based on "AARCHMRS containing the JSON files for Arm A-profile
>> architecture (2026-03)" Registers.json file.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Message-ID: <20251208163751.611186-4-eric.auger@redhat.com>
>> ---
>>  target/arm/cpu-sysregs.h.inc | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
>> index d61f0d0a19..2188cd7be0 100644
>> --- a/target/arm/cpu-sysregs.h.inc
>> +++ b/target/arm/cpu-sysregs.h.inc
>> @@ -1,15 +1,25 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/* This file is autogenerated by scripts/update-aarch64-cpu-sysregs-
>> header.py */
>> +/* DEF(<name>, <op0>, <op1>, <crn>, <crm>, <op2>) */
>> +
>> +DEF(AIDR_EL1, 3, 1, 0, 0, 7)
>> +DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
>>  DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
>>  DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>>  DEF(CTR_EL0, 3, 3, 0, 0, 1)
>>  DEF(DCZID_EL0, 3, 3, 0, 0, 7)
>> +DEF(GMID_EL1, 3, 1, 0, 0, 4)
>>  DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
>>  DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
>>  DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
>>  DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
>> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
>> +DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
>>  DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
>>  DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
>>  DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
>> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
>>  DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
>>  DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
>>  DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
>> @@ -39,6 +49,10 @@ DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
>>  DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>>  DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>>  DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>> +DEF(MIDR_EL1, 3, 0, 0, 0, 0)
>> +DEF(MPIDR_EL1, 3, 0, 0, 0, 5)
> Do we need MPIDR_EL1 as well? Is this considered as a feature ID
> register and is writable? I don't think so.
MPIDR_EL1 is part of the ID regs range defined in the kernel doc

op0 = 3, op1 = {0,1,3}, crn = 0, crm within [0, 7], op2 within [0, 7]

That's why the python script extracts it. Effectively it is not writable yet.

I can exclude it from the automatic generation but do we really need to? Any specific reason?

Thanks

Eric


> Thanks,
> Shameer
>
>>  DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
>>  DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
>>  DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>> +DEF(REVIDR_EL1, 3, 0, 0, 0, 6)
>> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
>> --
>> 2.53.0


