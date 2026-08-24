Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA66C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 08:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyQLC-0005FF-7j; Mon, 24 Aug 2026 04:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wyQLA-0005Em-Ku
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 04:47:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wyQL6-0007ff-8z
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 04:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787561249;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqn/77undguQa3RzB3CPdGwqmBJInAYmrL3lBi7Fvlw=;
 b=f+FFdKv2FFDqxyW3Uhwoskg3MW5F64g2UXVoPGmE7OglFrASDK8sD0yYhSUjUl+edNaqRs
 veUX5YVIaKGrYk2NnhM8cVg9q2mqD4RIam87YoUnMyEeq+5B59m8Wskv0J6/Ydz8qj5Gxv
 u/ux13SFDrAMyySDeUsuO/gbrOd88BE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-MpvZHEx-NH-cZ3aN5H5MRQ-1; Mon, 24 Aug 2026 04:47:27 -0400
X-MC-Unique: MpvZHEx-NH-cZ3aN5H5MRQ-1
X-Mimecast-MFC-AGG-ID: MpvZHEx-NH-cZ3aN5H5MRQ_1787561247
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-47f4601af62so1191025f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 01:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787561246; x=1788166046;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zqn/77undguQa3RzB3CPdGwqmBJInAYmrL3lBi7Fvlw=;
 b=pZganGfRaeEedURLbH+wCENa8o4cEKBS3Tl61ocMBGLVaJ17wChkqvt4wzp4s4cYos
 JNatjdRpCbj5+AlVrcyNQv2APis9fgzLA0f9xcw+1zYQJ6eV1d9k7wxw8rlR5E2NxF23
 6hIXAjHdzuHI201EwbAdTIsZu/9hENEd85kWKMoJ9C8wbPR3/1flPj+8eXS1PpdxSOz0
 7pQQqx9nISLYTdc18COSyFwQPMK9ijCue86H9VStHga0M8l/6j2oBxBnUHb5KCUAk49E
 8Obic9D87LKwhzz1v6cbugraKr/3VIxzUsHXB4rQYKS1aqpeTxVRChUEN9bhA4qNKxDf
 kGkQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6swEtZAay8UwiXycuDxoaUv8DBZ3mxCNs1fkQrwFfL7tMizNVi6/YONa984yJQZG+py/g3V7PMw==@nongnu.org
X-Gm-Message-State: AFuF++kECQm5l6I2UwT+ABrx/EEvg3nTkiNCjc54lcQZPeCVOBg5vaEf
 zQ+ua0ipFLg0GkIVL2rJfMEJrVIBVqxttFP37nsGU8Exk13Rtvr3XUZXJm2wlraDnXQpu/uRTX1
 /ER7tNlA5LyJjK1VJstOcYeHTFj7EE1KlNnFqroyMaVaitiS7+G3fpA==
X-Gm-Gg: AR+sD12N7EcdDT6G3AyaWIVgLJAapDIff3lPsVqk10pbGd7RZkH2Dcfbzp0DCE/XJU5
 HdXDL3rXJHDW/yFbOkY7J5CwSNvaw948M3awq4VeHCDsxfOyWRbeb7nzGm50xVUuEPd2mGEf6I2
 hTOVRXWtba5gEYWBe0/jo3LV8RKcJbT2pfJOHvdDdniXbuY0+VdyZd0EY5EMbt0iWGYWwrIXDEs
 ELOxZtQzZcsYp9tI/AShsIasQcd/5W5w+28ok9DKSpWpoa2J9wtTmkUdamMczyWMPRlqPne84MG
 NNc5MMwdO3vzdaklvyOAXtE1UYokvYafF9zh+DRf2X7GkQfzBWEWqtbwdVxTS64TuwEj3gwHYOq
 A5qLgec291Jc5i4x/EVSlilHb810FlCJHqXhYqptYNozTe272
X-Received: by 2002:a05:600c:3b25:b0:499:900c:9c69 with SMTP id
 5b1f17b1804b1-499b8454bc0mr267960645e9.9.1787561246480; 
 Mon, 24 Aug 2026 01:47:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3b25:b0:499:900c:9c69 with SMTP id
 5b1f17b1804b1-499b8454bc0mr267959945e9.9.1787561246039; 
 Mon, 24 Aug 2026 01:47:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499cfea058csm24404095e9.2.2026.08.24.01.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 01:47:25 -0700 (PDT)
Message-ID: <7b3cfd9f-825e-46b9-82ad-09611b05135e@redhat.com>
Date: Mon, 24 Aug 2026 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 00/18] kvm/arm: Introduce a customizable aarch64
 KVM host model
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
References: <20260726153221.24773-1-eric.auger@redhat.com>
 <3057A3BC-2BE9-4D2B-9D04-E3B31A6D0599@nutanix.com>
 <2C1E0EFD-7BD3-4177-90F8-14894B34F726@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2C1E0EFD-7BD3-4177-90F8-14894B34F726@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ype1P0DVysEY-6Xf_M29-koTjduusc1kixL12i3tOOc_1787561247
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi Khushit,

On 8/24/26 10:19 AM, Khushit Shah wrote:
>
>> On 20 Aug 2026, at 11:57 AM, Khushit Shah <khushit.shah@nutanix.com> wrote:
>>
>>
>>
>>> On 26 Jul 2026, at 8:59 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>> !-------------------------------------------------------------------|
>>> CAUTION: External Email
>>>
>>> |-------------------------------------------------------------------!
>>>
>>> This series enhances the current host KVM model with capability to
>>> set writable ID reg fields. 
>>>
>>> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
>>> of a subset of ID regs. The list of writable fields continues to grow.
>>> The feature ID range is defined as the AArch64 System register space
>>> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>>>
>>> The end goal is to get more flexibility when migrating guests
>>> between different host hardware.
>>>
>>> QEMU retrieves the writable ID fields from KVM UAPI [1] and
>>> match them against a generated description of ID regs and their
>>> named fields that stem from AARCHMRS Registers.json file.
>>> Current description is based on latest 2026-03 edition.
>>> The content of the generated files was compared against kernel
>>> linux/arch/arm64/tools/sysreg file. It is not straightforward
>>> to have unit tests for python scripts as there are many cases for
>>> field extraction. 
>>>
>>> For each writable named field a uint64 property is created
>>> following the "SYSREG_<REG>_<FIELD>" naming convention. REG and
>>> FIELD names are those described in ARM ARM Reference manual.
>>>
>>> The list of SYSREG_ID properties can be retrieved through the qmp
>>> monitor using query-cpu-model-expansion [2].
>>>
>>> For the record, Jinqian was able to migrate between Hisilicon KunPeng
>>> HIP09 and HIP12 chips with this series using this kind of command:
>>>
>>> -cpu host,pauth=off,pmu=off,sve=off,\
>>> SYSREG_ID_AA64PFR1_EL1_NMI=0x0,\
>>> SYSREG_ID_AA64ISAR1_EL1_LS64=0x0,\
>>> SYSREG_ID_AA64ISAR1_EL1_XS=0x0,\
>>> SYSREG_ID_AA64ISAR1_EL1_LRCPC=0x2,\
>>> SYSREG_ID_AA64ISAR2_EL1_RPRFM=0x0,\
>>> SYSREG_ID_AA64ISAR2_EL1_CLRBHB=0x0,\
>>> SYSREG_ID_AA64ISAR2_EL1_PAC_frac=0x0,\
>>> SYSREG_ID_AA64ISAR2_EL1_BC=0x0,\
>>> SYSREG_ID_AA64ISAR2_EL1_RPRES=0x0,\
>>> SYSREG_ID_AA64ISAR2_EL1_WFxT=0x0,\
>>> SYSREG_ID_AA64MMFR0_EL1_FGT=0x0,\
>>> SYSREG_ID_AA64MMFR0_EL1_BigEnd=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_ECBHB=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_CMOW=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_TIDCP1=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_nTLBPA=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_AFP=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_HCX=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_ETS=0x0,\
>>> SYSREG_ID_AA64MMFR1_EL1_PAN=0x2,\
>>> SYSREG_ID_AA64MMFR1_EL1_HAFDBS=0x2,\
>>> SYSREG_ID_AA64MMFR2_EL1_CnP=0x0,\
>>> SYSREG_ID_AA64MMFR3_EL1_TCRX=0x0,\
>>> SYSREG_ID_AA64DFR0_EL1_PMUVer=0x6,\
>>> SYSREG_ID_AA64DFR0_EL1_DebugVer=0x9,\
>>> SYSREG_ID_AA64DFR0_EL1_DoubleLock=0xf,\
>>> SYSREG_ID_AA64ZFR0_EL1_F64MM=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_F32MM=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_SM4=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_SHA3=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_BitPerm=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_AES=0x0,\
>>> SYSREG_ID_AA64ZFR0_EL1_SVEver=0x0,\
>>> SYSREG_CTR_EL0_L1Ip=0x2 \
>>>
>>> Connie & Eric
>>>
>>> This series can be found at:
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_eauger_qemu_tree_arm-2Dcpu-2Dmodel-2Dv7&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=PGWMyignA0NiDmTlyP7vOTHozBws_VN86yrVmSMkBp0&m=xh5u7-r6auXiWQScafdj-0wW70mXB4FhClh58GryHmExkx8uZN-h9j4B2c90Lowd&s=Ro4v_mjoNaLsznyxm781lzXBcRtXTudjibmgIhoJsNM&e= 
>>>
>>> History:
>>> --------
>>> v6 -> v7:
>>> - query-cpu-model-expansion now applies the sysreg props
>>> onto a scratch vcpu (POC) allowing a finer validation of settings
>>> (not perfect though as init may be revisited depending on
>>> settings)
>>> - Properly handle ValueRange (Khushit)
>>> - Remove cpu parameter in get_host_cpu_idregs call chain
>>> (Khushit)
>>>
>>> v5 -> v6:
>>> v6 is mostly for Khushit to see how he may work on top
>>> of this series. It fulfills some of his requirements:
>>> - Upon Khushit request I added description for enum values
>>> and reserved fields
>>> - set_sysreg_prop checks the input value against enum values
>>> if any
>>> - writable_bitmap is now dispatched into the sysreg descripton
>>> and not stored in vcpu state anymore (besides it is VM wide)
>>> - implemented write for qmp inspection. However this is not
>>> yet checked against KVM. That's the next step I think, ie.
>>> instantiate a scratch vcpu to test if the field value can be
>>> applied?
>>> - if some inconsistencies between writable mask and idreg
>>> field, reserved fields only produce traces
>>> - this version does not yet fix some reported issues about host
>>> supporting nested virt. I will further sync with Khushit.
>>> so this is definitively not candidate to be applied, hence the
>>> RFC tag.
>>>
>>> Cornelia Huck (3):
>>> target/arm/kvm: Retrieve writable ID reg map
>>> arm/cpu-features: document ID reg properties
>>> arm-qmp-cmds: introspection for ID register props
>>>
>>> Eric Auger (14):
>>> scripts: introduce scripts/update-aarch64-cpu-sysregs-header.py
>>> target/arm/cpu-sysregs.h.inc: Sort by name alphabetical order
>>> target/arm/cpu-sysregs.h.inc: Update with automatic generation
>>> arm/cpu: Add infra to handle generated ID register definitions
>>> scripts: Introduce scripts/aarch64_sysreg_helpers module
>>> scripts: Introduce scripts/update-aarch64-cpu-sysreg-properties.py
>>> target/arm/cpu-idregs.h.inc: generate with script
>>> target/arm/cpu-idregs.h.inc: Generate enum values
>>> arm/kvm: Initialize all writable ID registers from host
>>> target/arm/kvm: Introduce kvm_arm_expose_idreg_properties
>>> target/arm/cpu: Expose writable ID reg field properties on the kvm
>>>   host vcpu model
>>> target/arm/cpu-idregs.h.inc: Generate reserved fields
>>> target/arm/kvm: Ignore and trace unexpected writable reserved fields
>>> target/arm/kvm: add utility to write idregs in scratch vcpu
>>>
>>> Shaju Abraham (1):
>>> target/arm/cpu_idregs: generate tables for Arm64 ID registers and
>>>   fields
>>>
>>> docs/system/arm/cpu-features.rst              |  106 +-
>>> target/arm/cpu-idregs.h                       |   41 +
>>> target/arm/kvm_arm.h                          |   13 +
>>> target/arm/cpu-idregs.h.inc                   | 2164 +++++++++++++++++
>>> target/arm/cpu-sysregs.h.inc                  |   57 +-
>>> target/arm/arm-qmp-cmds.c                     |   98 +
>>> target/arm/cpu-idregs.c                       |   96 +
>>> target/arm/cpu64.c                            |    5 +
>>> target/arm/kvm-stub.c                         |    6 +
>>> target/arm/kvm.c                              |  360 ++-
>>> scripts/aarch64_sysreg_helpers.py             |  109 +
>>> .../update-aarch64-cpu-sysreg-properties.py   |  290 +++
>>> scripts/update-aarch64-cpu-sysregs-header.py  |   51 +
>>> target/arm/meson.build                        |    1 +
>>> target/arm/trace-events                       |    8 +
>>> 15 files changed, 3373 insertions(+), 32 deletions(-)
>>> create mode 100644 target/arm/cpu-idregs.h
>>> create mode 100644 target/arm/cpu-idregs.h.inc
>>> create mode 100644 target/arm/cpu-idregs.c
>>> create mode 100644 scripts/aarch64_sysreg_helpers.py
>>> create mode 100644 scripts/update-aarch64-cpu-sysreg-properties.py
>>> create mode 100755 scripts/update-aarch64-cpu-sysregs-header.py
>>>
>>> -- 
>>> 2.53.0
>>>
>> Hi,
>>
>> On my box the build is failing with:
>> [97/2192] Linking target qemu-system-arm
>> FAILED: qemu-system-arm
>> cc @qemu-system-arm.rsp
>> /usr/bin/ld: libsystem_arm.a.p/target_arm_arm-qmp-cmds.c.o: in function `qmp_query_cpu_model_expansion':
>> /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:144:(.text+0x4d4): undefined reference to `kvm_check_extension'
>> /usr/bin/ld: /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:145:(.text+0x4e4): undefined reference to `kvm_check_extension'
>> /usr/bin/ld: /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:151:(.text+0x514): undefined reference to `kvm_check_extension'
>> /usr/bin/ld: /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:168:(.text+0x554): undefined reference to `kvm_arm_create_scratch_host_vcpu'
>> /usr/bin/ld: /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:152:(.text+0x7d4): undefined reference to `kvm_check_extension'
>> /usr/bin/ld: /home/ahv/qemu/build/../target/arm/arm-qmp-cmds.c:247:(.text+0x8f4): undefined reference to `kvm_arm_destroy_scratch_host_vcpu'
>> collect2: error: ld returned 1 exit status
>
> If I add appropriate stubs, Following test fails:
>   30/1079 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test         ERROR            1.58s   killed by signal 6 SIGABRT
>  126/1079 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test                       ERROR           46.65s   killed by signal 6 SIGABRT
>  426/1079 qemu:qtest+qtest-aarch64 / qtest-aarch64/arm-cpu-features               ERROR            0.51s   killed by signal 6 SIGABRT
>  467/1079 qemu:qtest+qtest-arm / qtest-arm/arm-cpu-features                       ERROR            0.46s   killed by signal 6 SIGABRT
>  966/1079 qemu:block / io-qcow2-161                                               ERROR            1.95s   exit status 1
>
Thanks. I am currently working on it. Planning to respin this week

Eric


