Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2285C98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 14:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9O0g-0000Hr-7j; Wed, 23 Sep 2026 10:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9O0e-0000H3-Cm
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9O0c-0007lx-P6
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 10:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790173900;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxDyo6wS9tLNRj9z6xsNaM4tf77SpHmeasoP+i9z6qY=;
 b=Ui59tHZqa2z3EtwP28XTFKxprfdtpskVCi4hkD/ygnLkLKOI04+3i+e+g9Nt7ijlWL0P8N
 YgLFUGmVGWbE7YFl6yHmmc93eLvwteHz+pIY4iCzCzTLwb3odT0g/SZT5dXSVqasSo5+9E
 aZvcFu0uJ5nUZrQh4MdtCtbqEYtvtCE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-UhCt2zfwNI6braYIiDnX1w-1; Wed, 23 Sep 2026 10:31:39 -0400
X-MC-Unique: UhCt2zfwNI6braYIiDnX1w-1
X-Mimecast-MFC-AGG-ID: UhCt2zfwNI6braYIiDnX1w_1790173898
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48704c0043aso48219f8f.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 07:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790173898; x=1790778698;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oxDyo6wS9tLNRj9z6xsNaM4tf77SpHmeasoP+i9z6qY=;
 b=cDUPsnjaTX5ldcQGyKzyr2DNYuPkprillmCajFSjviiHqebESsDjWsUVMCCMqS8FmQ
 kPxYg8PD+AO2rQJkNUxbIsj3V6GH4g2QL4k09A8t8t9ZoXglfjsGZZgwbjlj6IRLAy14
 7naL/DdjysBlPc9sMLvM4bfegb5Phkrgw4Zzh+qZGmrknuB1NzQMd/XVaQFzsgKnGjLp
 i14MKS8Z0gwDEzGfU33/56fpEWdWc378vJERQsuw3ljAjyQDR812dU5vgb7jFVrQsjxF
 He+Tm7H7wokMrMs3rncpmG/A8taEn+8xADGED8WRf3xUfkv8/i+JRCVfh8A2dcCWPQ8Y
 p/LA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0D7HeGFTZIEQkOEpaoM4Vf3V+OcQMrPYmuVsA6yeDfJjQIyUxfypv5pa0XXqPZ1bbr5cj5Mn9jA==@nongnu.org
X-Gm-Message-State: AFuF++l+akWZ1s2DFtZyevCNjWtJupfVR6Sn3ts0QeUcmFwWjFcQMXHk
 SxKtuBot3wvDAmZ7saZV60mNuFCRdWgiqJ7IZe5leQw1/7Bov5jJbpPOD2jeEKQEyLjKX9et26D
 NrUVJkzqY035KlDByKzl+lr3SnjVKeLGUXSVv3D4Das9in0jOZ0/Kvg==
X-Gm-Gg: AYBFou1EceM0Qo9mUZmzWbSDcIEP+cKJhrmp6IT+LJA4N9xjvbMxhBldgvtCHegLFXS
 JalGbd1YDhGdMfcz0y9E24mkCEm0BxeR/JY8AHqMYwlJJiYZvnGl6JMUKOKfXfOsnALU90rX4f+
 epuMAT+wt7nu0R66KuPiEwKCDzMYMCtXD4ZCNO3hf5mfY9oTPKH5jQ90Qhmf9x1Sd2FymcYcpi4
 3Z1QISeXU/+/jHG4C8aWcnwXqlp8AEE6+uyyVqBnwC1MYaCO9b0Npa1jHur0temCndwHV+Yx1XR
 PJPjBIdgpSVIsIhI2vrZFnYLlUC7azmSeBf6CuhBubUmgIc1TYjkM/NhGWsIUzckr5v5I0Ma5Uh
 vdI4FIpi/RXjlJB0geWMJtfjP2YjtxD6dDC1+ZXVnr+4GNXMNw1S1WVlRrcY=
X-Received: by 2002:a5d:5f88:0:b0:485:8a46:b3cc with SMTP id
 ffacd0b85a97d-488670c51fcmr4871164f8f.52.1790173898194; 
 Wed, 23 Sep 2026 07:31:38 -0700 (PDT)
X-Received: by 2002:a5d:5f88:0:b0:485:8a46:b3cc with SMTP id
 ffacd0b85a97d-488670c51fcmr4871097f8f.52.1790173897738; 
 Wed, 23 Sep 2026 07:31:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682673bdsm7322098f8f.2.2026.09.23.07.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:31:37 -0700 (PDT)
Message-ID: <1ccea6d2-418c-481a-85ff-072d3dd837b3@redhat.com>
Date: Wed, 23 Sep 2026 16:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/26] target/arm/cpu-sysregs.h.inc: Update with
 automatic generation
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
 <20260916144721.751810-4-eric.auger@redhat.com>
 <ECC98331-BFD5-4630-ADBC-FEDA0B32F889@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ECC98331-BFD5-4630-ADBC-FEDA0B32F889@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nYL6YuhHZp-TTyAKp_O-S6F4gYqjAxglAldmzSCvlUU_1790173898
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



On 9/23/26 11:13 AM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Generated definitions with scripts/update-aarch64-cpu-sysregs-header.py
>> based on "AARCHMRS containing the JSON files for Arm A-profile
>> architecture (2026-03)" Registers.json file.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>> target/arm/cpu-sysregs.h.inc | 11 +++++++++++
>> 1 file changed, 11 insertions(+)
>>
>> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
>> index ec5a12b0f4..8b77c490d4 100644
>> --- a/target/arm/cpu-sysregs.h.inc
>> +++ b/target/arm/cpu-sysregs.h.inc
>> @@ -1,11 +1,18 @@
>> /* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/* This file is autogenerated by scripts/update-aarch64-cpu-sysregs-header.py */
>> +/* DEF(<name>, <op0>, <op1>, <crn>, <crm>, <op2>) */
>> +
>> +DEF(AIDR_EL1, 3, 1, 0, 0, 7)
>> DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>> DEF(CTR_EL0, 3, 3, 0, 0, 1)
>> DEF(DCZID_EL0, 3, 3, 0, 0, 7)
>> +DEF(GMID_EL1, 3, 1, 0, 0, 4)
>> DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
>> DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
>> DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
>> DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
>> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
>> DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
>> DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
>> DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
>> @@ -40,6 +47,10 @@ DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
>> DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>> DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>> DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>> +DEF(MIDR_EL1, 3, 0, 0, 0, 0)
>> +DEF(MPIDR_EL1, 3, 0, 0, 0, 5)
>> DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
>> DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
>> DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>> +DEF(REVIDR_EL1, 3, 0, 0, 0, 6)
>> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
> After this, we should probably refactor cpu->midr/revidr/mp_affinity into the idregs[]?

Hum yes. We can now rely on MIDR, REVIDR and MPIDR storage in
isar.idregs[]. I will handle that in v10

Thanks

Eric
>
> Warm Regards,
> Khushit
>> -- 
>> 2.53.0
>>


