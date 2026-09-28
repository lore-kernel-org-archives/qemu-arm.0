Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206AFCA5FA1
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 17:35:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBFFL-00064a-41; Mon, 28 Sep 2026 13:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBFFI-00063x-Q1
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 13:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBFFG-0000IK-UF
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 13:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790616869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QcRmKAZPk4+69MBsW2Ao6CpwFSl1GoQnOOgz4WoGyo=;
 b=cy1ocs6DxgB0NxA/S6PyphkDIw6Pe0AUn/kWiS3VkTVeDPWJRDEQq4tVbHHRL0nYV9DrmY
 JPKTrJzp+gs0PswyONfWtZ8dZbMs19ofNW08Sb+ZU7P8z70Wd0GxhxV1nPPl37lWVIBw6A
 p2Ntz8Tt3/0MYfRGiR/dWTw2f1YigtE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-pTgmCGW5M-6MFvc0wqZmZg-1; Mon, 28 Sep 2026 13:34:28 -0400
X-MC-Unique: pTgmCGW5M-6MFvc0wqZmZg-1
X-Mimecast-MFC-AGG-ID: pTgmCGW5M-6MFvc0wqZmZg_1790616867
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49e6422198fso21763895e9.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790616867; x=1791221667;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6QcRmKAZPk4+69MBsW2Ao6CpwFSl1GoQnOOgz4WoGyo=;
 b=oIDwpxcJMuEhyq6JyytF9FVrZY8jDf2OzOfAggCTIpsaXDV/hHJa8DEpgMyOJoE9z/
 MyfaQB2CNoyguY2/lBFlXELlO3zNOpqA51cKx0bsOrZBJ3H5IjS4oKNwFRxpdYfR+o7l
 VbS7/K5vEYvyyx9/DdPxlbNB4cvYntdkN/dM/OkmvSAg+xoZk917iHQJED0/xPiIeTin
 WUZg75gnxWhBXd4ajNYgGsQH2BqmBBzrRLYyjRrS4odmPF0kRWJ50rFIiLz356JRggAL
 Q8OK+r1Kx57vU708D4iR9H2h1LsFZRhkJtR4ks9VwZkY4hM4FdlFCEJGfc/3SqrRQy/m
 67Xw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNU/MCjlTvnZyxl/FSWTMRQQSMy9VC+yqdWW+OPq+Ivff7TBA74Be9p+HjytXw1HEYB5TjnF5q0A==@nongnu.org
X-Gm-Message-State: AFuF++n6LmwdhZ7faOUD9WyPYvAFjHPqLDtdW6k5rVaEBK8ANBAUzUZW
 vd5EfeflnHIFuzjMhha3m1y0haQvzmyoboodz0bHixAMmQx75e+VaBPTsdECgwou/cREz/38gwh
 Q5MuWurOGfWxPJd9LqWxEdI87dqHq1bgzUyPkrCSUs2CTef1p3l1EGw==
X-Gm-Gg: AYBFou0SO0rD/16AB7TP0YFx0jIdciF7eYjp9tx+FlvNj1Jc9cu4KA655Iy3CCep0mU
 /Y/Tb8V5MDVSdrn1NMo7Ccm5GWNBZxRXPi9u5nzYlJjxygeurIRvl/dFXBhNrnsM6NCbB+dIQRW
 4TQNa/2Ad/rZrb5++24dVDNYeasHkvFpMByTf+X8+KW96DmaB6XcTFz8VIffAXql1mapIqje84V
 Hqd+gRuI2MeTa0kQV3nMpHLlZc3WrIjDIgQmtFnw9YFfiEYuyDtXXPlohiDAa3a6qj24hq1D+kE
 ES56wH6OybvS7Km6vxRtWg9LVz3uXH58KP3IsXQEUlSxLU5p/+22i9KM5D64QEq0GMr57tVhOZP
 lbB7lwZ+zcYfZPqFcj7JvqjO4GGJYu/ysRu52nQXnFw01hSz/
X-Received: by 2002:a05:600c:3b1b:b0:49f:e4d4:dd70 with SMTP id
 5b1f17b1804b1-49fe6705bd7mr249667395e9.31.1790616866737; 
 Mon, 28 Sep 2026 10:34:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1b:b0:49f:e4d4:dd70 with SMTP id
 5b1f17b1804b1-49fe6705bd7mr249666885e9.31.1790616866176; 
 Mon, 28 Sep 2026 10:34:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfa57d7sm7988175e9.10.2026.09.28.10.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 10:34:25 -0700 (PDT)
Message-ID: <3bcc8ccf-6daf-47a1-8620-a69915adf8ae@redhat.com>
Date: Mon, 28 Sep 2026 19:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/26] arm/kvm: Initialize isar.idregs[] with all
 writable host ID regs
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
 <20260916144721.751810-13-eric.auger@redhat.com>
 <8C1A034C-C3E7-4EC3-89CF-6E3AD99AE90C@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8C1A034C-C3E7-4EC3-89CF-6E3AD99AE90C@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 45JWibC_OTxImpk-UArsvsCoHlr5N4MONILIU2i9Sng_1790616867
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 9/25/26 3:27 PM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> kvm_arm_get_host_cpu_features() already retrieves the values of some
>> host id registers to analyze the available vcpu features.
>>
>> Eventually we want to be able to allow the user to change the value
>> of writable ID reg fields. So we need to store the initial value of all
>> writable ID regs into isar.idregs[].
>>
>> Introduce a new get_host_cpu_idregs() helper that populates isar.idregs[]
>> and call it from kvm_arm_get_host_cpu_features.
>>
>> This patch has no impact on cpreg values. isar.idregs[] is only
>> used as a temporary storage for register values to be updated in place
>> later.  Also it does not handle the writeback of isar.idregs[] into cpreg
>> value list after user update. This will be handled separately.
>>
>> Note the host values are retrieved from the scratch vcpu initialized with
>> all the available capabilities exposed by KVM, independently on the
>> final choice made by the suer.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Hi Eric,
>
> As we discussed, in v10, there will be an option to also read all the ID registers, not only writable.
yes we can do that. reviewers may advocate the leave as is though as the
only call site in
this series will use writable mode.
>> ---
>> v8 -> v9:
>> - improve the commit msg. Only initialize in this patch and move the
>>  write back to cpreg value list in a different patch.
>> - Do not hack CLIDR here. The correct way to fix that temporarily is to
>>  do that in the machine instead.
>>
>> v7 -> v8
>> - fix indent and added Khushit's R-b
>>
>> v6 -> v7
>> - remove vcpu from prototypes (Khushit)
>>
>> v5 -> v6
>> - do not check writable_map anymore
>> ---
>> target/arm/kvm.c        | 43 ++++++++++++++++++++++++++++++++++++++++-
>> target/arm/trace-events |  2 ++
>> 2 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index c6eac41991..958b25e550 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -43,6 +43,7 @@
>> #include "hw/acpi/ghes.h"
>> #include "target/arm/gtimer.h"
>> #include "migration/blocker.h"
>> +#include "cpu-idregs.h"
>>
>> const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>     KVM_CAP_INFO(DEVICE_CTRL),
>> @@ -290,7 +291,44 @@ static int kvm_feature_idx_to_idregs_idx(int kidx)
>>     return get_sysreg_idx(sysreg);
>> }
>>
>> -static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>> +/*
>> + * get_host_cpu_idregs: Read all the writable ID reg host values
>> + *
>> + * Need to be called once the writable mask has been populated
>> + * Note we may want to read all the known id regs but some of them are not
>> + * writable and return an error, hence the choice of reading only those which
>> + * are writable. Those are also readable!
>> + */
>> +static int get_host_cpu_idregs(int fd, ARMHostCPUFeatures *ahcf)
>> +{
>> +    int err = 0;
>> +    int i;
>> +
>> +    for (i = 0; i < NUM_ID_IDX; i++) {
>> +        ARM64SysReg *sysregdesc = &arm64_id_regs[i];
>> +        ARMSysRegs sysreg = id_register_sysreg[i];
>> +        uint64_t *reg;
>> +        int ret;
>> +
>> +        if (!sysregdesc->writable_mask) {
>> +            continue;
>> +        }
>> +
>> +        reg = &ahcf->isar.idregs[i];
>> +        ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
>> +        trace_get_host_cpu_idregs(sysregdesc->name, *reg);
>> +        if (ret) {
>> +            error_report("%s error reading value of host %s register (%m)",
>> +                         __func__, sysregdesc->name);
>> +
>> +            err = ret;
>> +        }
>> +    }
>> +    return err;
>> +}
>> +
>> +static void
>> +kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>> {
>>     /* Identify the feature bits corresponding to the host CPU, and
>>      * fill out the ARMHostCPUClass fields accordingly. To do this
>> @@ -376,6 +414,9 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>         SET_IDREG(&ahcf->isar, ID_AA64PFR0, 0x00000011); /* EL1&0, AArch64 only */
>>         err = 0;
>>     } else {
>> +        /* Make sure all writable ID reg values are initialized */
>> +        err |= get_host_cpu_idregs(fd, ahcf);
>> +
> Perhaps if we read “all” the ID registers, we should be able to get rid of all the manual reads below.
Yes if all are read, we can remove this. But for now this is depends on
the host capabilities, better to
leave as is I think.
>
>>         err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
>>         err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR2_EL1_IDX);
>>         err |= get_host_cpu_reg(fd, ahcf, ID_AA64SMFR0_EL1_IDX);
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index 8502fb3265..c25d2a1191 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -13,6 +13,8 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>>
>> # kvm.c
>> kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>> +get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
>> +kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%”PRIx64
> ^^ leaked into this commit.
yup. Thanks!

Eric
>
> Warm Regards,
> Khushit
>
>> # cpu.c
>> arm_cpu_reset(uint64_t mp_aff) "cpu %" PRIu64
>> -- 
>> 2.53.0
>>


