Received: by 10.223.172.38 with SMTP id v35csp416071wrc;
        Wed, 6 Sep 2017 02:36:32 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4GC5hkXkD7Lim87drMWHvyE1ljPPtEJ/BunO2Z2Dm0Yyb9O4gIyIXu/lNtQt/EU4m4O8Qz
X-Received: by 10.98.197.134 with SMTP id j128mr6543927pfg.113.1504690591964;
        Wed, 06 Sep 2017 02:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504690591; cv=none;
        d=google.com; s=arc-20160816;
        b=Am185aZsnOc6DeUliM5bKULjvmY/v4SDNaywsMH9XghYq/mjd3HInFaW+avueT+k9f
         ujoTCnirc672zVh3SDH574xY4xwmKW8oo/PEPRhbQR33rS7llvqBSp60FBdVS9Zpw22z
         5Hyb53ksIi+F0A16PoTx6qcZ2d/Odjns+u0W7XoJUd914n22k2ORUYvw1UgkYsL+D9M5
         cZM5PJjZIhseWAmtR9RNaCy6Mw8aHf+wSERQ2OQc5zTzK4u8hrv9UgEvKOs2H5eZcotz
         e/RbPuG+4xLNoaFb+zGc+0RTGPtKm/MuhHqk/QSNWfOBZT0PavDyrtX5e8HnP8VpsAxE
         hdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=kkdNFBbgzUm1jdOC0Ro31agOl5z5Vrk4FMMJMj+qX4M=;
        b=LVBEjrkks/P9eG0Fw0HJjx4bRq0piz/SbXAcL0xTXqihagyncO6YKf3GxMC0zd801+
         dPXxAVPIi5gOFRw8pFoq2NMPFhSnyb+QbFXO2xbncG925wtR0Dc01XDjJC1b6TRIYsRx
         raYxjo6QShcBmN8NsYO/HwDy3MMLA9RywPTJLj9KKH8WRbprfsfFGll3UwQUcGMyzau2
         mrnKiY9FuDfATiu7EvogEdGPxk7+7OvozVyU5x4TVyUzpIFCwKDCj3WU/2qEllSP+MHF
         0lucr6qMBeeAaHkIq3vV2O8/mnT6TDU4j8nbebYjFAZC1xKSAhleARrMG/Ux9lkx9/Ea
         mwVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 34si107859plz.118.2017.09.06.02.36.31;
        Wed, 06 Sep 2017 02:36:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752615AbdIFJga (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Wed, 6 Sep 2017 05:36:30 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5560 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752226AbdIFJg0 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 6 Sep 2017 05:36:26 -0400
Received: from 172.30.72.58 (EHLO DGGEMS406-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DGR92454;
        Wed, 06 Sep 2017 17:35:52 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.301.0; Wed, 6 Sep 2017
 17:35:42 +0800
Subject: Re: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION
 feature
To:     Peter Maydell <peter.maydell@linaro.org>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
 <1503066227-18251-5-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA9oecuzXXrdo3zZHxF3AgrDUh_NHxz-znto4GU+OoxVFw@mail.gmail.com>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "Will Deacon" <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Ingo Molnar" <mingo@kernel.org>, <bp@suse.de>,
        <shiju.jose@huawei.com>, <zjzhang@codeaurora.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>, Huangshaoyu <huangshaoyu@huawei.com>,
        wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <5e3c8d25-6260-d00e-dda3-d160a9973701@huawei.com>
Date:   Wed, 6 Sep 2017 17:35:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oecuzXXrdo3zZHxF3AgrDUh_NHxz-znto4GU+OoxVFw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020205.59AFC179.00A7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 64c0e4f12e00dd36c338474358858009
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: pw82El5siMmp

Hi Peter,
  Thanks very much for your review, I will check your comments in detail and reply.


On 2017/9/6 1:26, Peter Maydell wrote:
> On 18 August 2017 at 15:23, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> check if kvm supports guest RAS EXTENSION. if so, set
>> corresponding feature bit for vcpu.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  linux-headers/linux/kvm.h | 1 +
>>  target/arm/cpu.h          | 3 +++
>>  target/arm/kvm64.c        | 8 ++++++++
>>  3 files changed, 12 insertions(+)
>>
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index 7971a4f..2aa176e 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -929,6 +929,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_PPC_SMT_POSSIBLE 147
>>  #define KVM_CAP_HYPERV_SYNIC2 148
>>  #define KVM_CAP_HYPERV_VP_INDEX 149
>> +#define KVM_CAP_ARM_RAS_EXTENSION 150
>>
>>  #ifdef KVM_CAP_IRQ_ROUTING
>>
> 
> Hi. Changes to linux-headers need to be done as a patch of their
> own created using scripts/update-linux-headers.sh run against a
> mainline kernel tree (and with a commit message that quotes the
> kernel commit hash used). This ensures that we have a consistent
> set of headers that don't diverge from the kernel copy.
> 
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index b39d64a..6b0961b 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -611,6 +611,8 @@ struct ARMCPU {
>>
>>      /* CPU has memory protection unit */
>>      bool has_mpu;
>> +    /* CPU has ras extension unit */
>> +    bool has_ras_extension;
>>      /* PMSAv7 MPU number of supported regions */
>>      uint32_t pmsav7_dregion;
>>
>> @@ -1229,6 +1231,7 @@ enum arm_features {
>>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
>>      ARM_FEATURE_PMU, /* has PMU support */
>>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>> +    ARM_FEATURE_RAS_EXTENSION, /*has RAS extension support */
> 
> Missing space after '/*' ?
> 
>>  };
>>
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index a16abc8..0781367 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -518,6 +518,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>          unset_feature(&env->features, ARM_FEATURE_PMU);
>>      }
>>
>> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_RAS_EXTENSION)) {
>> +        cpu->has_ras_extension = true;
>> +        set_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
>> +    } else {
>> +        cpu->has_ras_extension = false;
>> +        unset_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
>> +    }
>> +
> 
> Shouldn't we need to also tell the kernel that we actually want
> it to expose RAS to the guest? Compare the PMU code in this
> function, where we set a kvm_init_features bit to do this.
> (This suggests that your ABI for the kernel part of this feature
> may not be correct?)
> 
> You should also not be calling set_feature() here -- if the
> CPU features bit doesn't say "this CPU should have the RAS
> extensions" we shouldn't create a CPU with them. Instead
> you should set it in kvm_arm_get_host_cpu_features() (again,
> compare the PMU code).
> 
> thanks
> -- PMM
> 
> .
> 
