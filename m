Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F4C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:35:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAZB-0005rH-BC; Mon, 28 Sep 2026 08:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBAZ9-0005qf-KL
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBAZ7-00011u-QJ
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790598880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZAeYsL9d3qjmBo71QrP8m38Q962rFexlqL7pjbHsys=;
 b=NR61W59gU7TuNAhBvKUztMlalFrr5Cw4lbCyoCdx0Iq2Hc87edT3WgJ9AxLAaDMHM66j+M
 UQCYXOXqZ3O0NGCUnGfrrqxOKCZbPfttHeNOTAx6JW+EqIyOSefNYksIeFKsCRx487gnXw
 oVBSq8+sc0/TXsevVNaLnQ1y0M5VsWQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-OmC6i-a4NleFZILk-PiMLA-1; Mon, 28 Sep 2026 08:34:39 -0400
X-MC-Unique: OmC6i-a4NleFZILk-PiMLA-1
X-Mimecast-MFC-AGG-ID: OmC6i-a4NleFZILk-PiMLA_1790598878
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48879e03053so1672093f8f.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790598878; x=1791203678;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cZAeYsL9d3qjmBo71QrP8m38Q962rFexlqL7pjbHsys=;
 b=RXSoLbYBnKqb8PH2S5qb9ObkLy/Ja109mh4K69bgUQgLoA0TZx7/ytnaC+IXyhjI5L
 7qk5X2MNb7c42FGXE2sBp1wRZXgieEL1YgNVPY2S3rgjT3jj6PRGzP9xGf0c4dBpwiAQ
 65B3Frd2IDpq2eli0lTfz2qy4TdAo7IxqeGTZ963r+nYdVtiAPRkfkJPPMYLtWA6iVKC
 E+YLPbvj14E82pplaWOJFJ+AGrlFWhAbhDMiJoCOtPvpxZ5nyEsY11zuf94djhAiTn8x
 4ngDuUQ0TLIDvjxMxGR6ewn5J/KQyLcjWLwqYKqGIg+url5ODlbWtTFoP2gXDiIXxgja
 egmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwi+g6dajAUP9D7gK+Bqh1zVbDPKzX8IpGcup4jz9m8oecRxL6nvD0A7tkm/lTF/FZ1lLb9vivuQQ==@nongnu.org
X-Gm-Message-State: AFuF++l/hx80rlq4O2gP255hQUJOtaavsPYeXjzMPo0mp+OSzmC+z1Jz
 w/Nn0CdMl2d49Yv4TJDEv1JH5HLgj8agWOjeHtAm1NuoG25C7tEVoQ4/ufhqL58H+m0+91jkz3N
 TlbspFbuJ+XvgkWIEkfMFQyptfWLST9ni/LSFdZNVgJPOQcfT/rhtbw==
X-Gm-Gg: AYBFou0xskb4fnYkbm7U35yo96eRL501/kpwzMn+mGxXBi13HGCTH6y//b2Xoz64uJF
 K7Fl5qsqy6/Ho371m4QZMzKnVDolvCJ5dirwmn3S5kU6ARlEZK+VWnKw6oTVl6BhzxjMpd/7sQ1
 4dWS6RkuEMMpjWnN7m7YGFjDtw9XsbEX2M3aYrtnxv1T4bXnUKwFE8mAjRId03FqrKQa15qRwh+
 dhzFaOpDEQkxlOTHewmBhmlsVrDEHwlQsx2wVr5ykK1QshqDx1mmM+Gd3zz+4QijSEH6lRfWbO2
 pZLNDgUn+ilVoaoDZC3tixGjnwYKpKZ6WL8TwhzQRGJc4l8oG8szOmIoA+kJHyNLKOegxS5D7Ba
 1coYlUX9TbXJr9R/BX/a3JMfLtTjtO8oO4T1cuY3L84HtAY9r
X-Received: by 2002:a05:600d:864d:10b0:4a0:592:690b with SMTP id
 5b1f17b1804b1-4a005926c0emr28887355e9.8.1790598877661; 
 Mon, 28 Sep 2026 05:34:37 -0700 (PDT)
X-Received: by 2002:a05:600d:864d:10b0:4a0:592:690b with SMTP id
 5b1f17b1804b1-4a005926c0emr28886895e9.8.1790598877230; 
 Mon, 28 Sep 2026 05:34:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-489bd7b1df0sm6841186f8f.31.2026.09.28.05.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 05:34:36 -0700 (PDT)
Message-ID: <c70d8f51-958c-43cd-b07b-96f2a4fada6f@redhat.com>
Date: Mon, 28 Sep 2026 14:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/26] target/arm/kvm: Retrieve writable ID reg map
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
 <20260916144721.751810-11-eric.auger@redhat.com>
 <FC2C35F5-6C1D-4C8C-B4E2-9D2EB1924445@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <FC2C35F5-6C1D-4C8C-B4E2-9D2EB1924445@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8A9XIVbJ7d6X7oojuD-lCfYc66Tp1tC7gdW2aSISqbE_1790598878
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
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

Hi,

On 9/25/26 2:37 PM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Add an helper to retrieve the writable id reg bitmask.
> s/an/a
>> then retrieve the writable_map array and dispatch it in the writable_map
> s/writable_map/writable_mask
>> fields of arm64_id_regs[] elements.
> s/fields/field

fixed
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>>
>> v7 -> v8
>> - added kvm_enabled()
>>
>> v5 -> v6
>> - use arm64_id_regs[].writable_map
>> - squashed 2 commits (helper + user)
>> - removed stub
>> ---
>> target/arm/kvm.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 61 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index ed99be7fd8..c6eac41991 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -28,6 +28,7 @@
>> #include "kvm_arm.h"
>> #include "cpu.h"
>> #include "cpu-sysregs.h"
>> +#include "cpu-idregs.h"
>> #include "trace.h"
>> #include "internals.h"
>> #include "hw/pci/pci.h"
>> @@ -51,6 +52,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>> static bool cap_has_mp_state;
>> static bool cap_has_inject_serror_esr;
>> static bool cap_has_inject_ext_dabt;
>> +static bool writable_map_dispatched;
>>
>> /**
>>  * ARMHostCPUFeatures: information about the host CPU (identified
>> @@ -273,6 +275,21 @@ static uint32_t kvm_arm_sve_get_vls(int fd)
>>     return vls[0] & MAKE_64BIT_MASK(0, ARM_MAX_VQ);
>> }
>>
>> +static int kvm_feature_idx_to_idregs_idx(int kidx)
>> +{
>> +    int op1, crm, op2;
>> +    ARMSysRegs sysreg;
>> +
>> +    op1 = kidx / 64;
>> +    if (op1 == 2) {
>> +        op1 = 3;
>> +    }
>> +    crm = (kidx % 64) / 8;
>> +    op2 = kidx % 8;
>> +    sysreg = ENCODE_ID_REG(3, op1, 0, crm, op2);
>> +    return get_sysreg_idx(sysreg);
>> +}
>> +
>> static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>> {
>>     /* Identify the feature bits corresponding to the host CPU, and
>> @@ -480,9 +497,53 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>     ahcf->features = features;
>> }
>>
>> +static int kvm_arm_get_writable_id_regs(uint64_t *idregmap)
>> +{
>> +    int cap_writable_id_regs;
>> +    struct reg_mask_range range = {
>> +        .range = KVM_ARM_FEATURE_ID_RANGE,
>> +        .reserved = {0},
>> +        .addr = (uint64_t)idregmap,
>> +    };
>> +
>> +    cap_writable_id_regs =
>> +        kvm_check_extension(kvm_state, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
>> +
>> +    if (!cap_writable_id_regs ||
>> +        !(cap_writable_id_regs & (1 << KVM_ARM_FEATURE_ID_RANGE))) {
>> +        return -ENOSYS;
>> +    }
>> +
>> +    if (kvm_vm_ioctl(kvm_state, KVM_ARM_GET_REG_WRITABLE_MASKS, &range)) {
>> +        return -errno;
>> +    }
> I think just doing return kvm_vm_ioctl(kvm_state, KVM_ARM_GET_REG_WRITABLE_MASKS, &range) is enough.
sure
>> +    return 0;
>> +}
>> +
>> void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>> {
>>     CPUARMState *env = &cpu->env;
>> +    uint64_t *writable_map;
>> +
>> +    writable_map = g_new(uint64_t, KVM_ARM_FEATURE_ID_RANGE_SIZE);
>> +
>> +    if (kvm_enabled() && !writable_map_dispatched &&
>> +        !kvm_arm_get_writable_id_regs(writable_map)) {
>> +        for (int i = 0; i < KVM_ARM_FEATURE_ID_RANGE_SIZE; i++) {
>> +            uint64_t mask = writable_map[i];
>> +
>> +            if (mask) {
>> +                int idx = kvm_feature_idx_to_idregs_idx(i);
>> +
>> +                if (idx < 0 || idx > ARRAY_SIZE(arm64_id_regs)) {
> Bug: >=
> Also, this condition will never be true, as get_sysreg_idx() asserts out on an unknown ID register. Which probably
> should not happen.

removed
>
>> +                    continue;
>> +                }
>> +                arm64_id_regs[idx].writable_mask = mask;
>> +            }
>> +        }
>> +        writable_map_dispatched = true;
> What is the need of writable_map_dispatched, why can’t we use arm_host_cpu_features.dtb_compatible as below?
Using a dtb related condition to decide whether we shall do the writable
mask dispatch looks far-fetched to me, although it would effectively work.

I would rather keep it as it and wait for other comments if any.

Thanks

Eric
>
> Warm Regards,
> Khushit
>> +    }
>> +    g_free(writable_map);
>>
>>     if (!arm_host_cpu_features.dtb_compatible) {
>>         kvm_arm_get_host_cpu_features(&arm_host_cpu_features);
>> -- 
>> 2.53.0
>>


