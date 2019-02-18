Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2552055wrx;
        Mon, 18 Feb 2019 10:04:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbQIfEfPww16hP8mlEh39/pET93+02fydJcLDKc+NHwBwnwMA9GzcPA9hYHPn0LywdZtxrL
X-Received: by 2002:a25:6741:: with SMTP id b62mr19656471ybc.151.1550513047356;
        Mon, 18 Feb 2019 10:04:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550513047; cv=none;
        d=google.com; s=arc-20160816;
        b=talXnlqkf6Pw7KqLbxmsZ0qyf/0pj5eLmmLtEbTit51WCXHRdrISgZnBPxbxnqC88O
         wX1d1yVBSho6zGcQO5Y7I9VZNe+We81KXQF2h+XKyUBe6gRwj6Vkv4/s2yxLSQgzhDSe
         s2w/dVLcXDttpxHEpgQA7n83teUBZRI18qnkTmRvhp90ihfAJXXAI6gniBcki5OJhADJ
         n7MsgmjPFoe60hQ6VHQijcfqZvHF1YnIeLAdmENLwROL9CIGN+q5CrNgmbQ8KTbwLRJD
         0yV1yXdY9hArG6FYRKvB4qG1kpLO1fexXHRz4xWfEQ59HeHKO9ZW2LL6QYDM2mc+DZRq
         cimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=fssePF0vN48Ld8lKBsn/hgPzMzkZMT7j6/t0FDtBRNg=;
        b=dZHJjRJcdOonEbo3ZurZ7L5z0WBvPfWaoDj5QVieOZsV8eYIh9yfYrxXBeJnvqfo9x
         G6qbSOi79mBs++NCU4GTNvs/DAHeqW4m1uXwfatypRHrOSOMbrFJHjmLMXtYlsubPeUK
         sNoEFqO9X49tStaoxYyBDEKtu/Ck3w7y/7trocvBdsLWvATJctc5XSIV/f2YARpyCqS7
         cwRDWmGsqvFXWKwwELTxnDtX+8ce/fyXMvY309VGHkNm/Ii5mhNeID26iXemUK0fJQVz
         sKcOcseK0gHGvzty0GXJIkqQkdqyMVLGvqfYqD7ByU9UAp0unfW1lztv6iDWp38Wq+Vl
         GjJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64si6009892ywf.295.2019.02.18.10.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 10:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvnGw-0003MR-Q5
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 13:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvnGj-0003LA-C7
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 13:03:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvnGZ-0002sZ-Ry
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 13:03:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gvnGT-0002la-Vg; Mon, 18 Feb 2019 13:03:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 681D2C05D41E;
	Mon, 18 Feb 2019 18:03:32 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C27675D9C6;
	Mon, 18 Feb 2019 18:03:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-8-eric.auger@redhat.com>
	<CAFEAcA9OWQuuqO31-uzTuu-9XSdVkH7UvXdFA1GdvD9emoS0=Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6799d205-cb29-9974-eaf2-1b5020b3a41a@redhat.com>
Date: Mon, 18 Feb 2019 19:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9OWQuuqO31-uzTuu-9XSdVkH7UvXdFA1GdvD9emoS0=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 18 Feb 2019 18:03:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 07/18] kvm: add
 kvm_arm_get_max_vm_phys_shift
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oKCDHnR2Sb1S

Hi Peter,
On 2/14/19 6:15 PM, Peter Maydell wrote:
> On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
>> log of the maximum IPA size supported by KVM. This capability
>> needs to be known to create the VM with a specific IPA max size
>> (kvm_type passed along KVM_CREATE_VM ioctl.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v4 -> v5:
>> - return 40 if the host does not support the capability
>>
>> v3 -> v4:
>> - s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
>> - check KVM_CAP_ARM_VM_IPA_SIZE extension
>>
>> v1 -> v2:
>> - put this in ARM specific code
>> ---
>>  target/arm/kvm.c     | 10 ++++++++++
>>  target/arm/kvm_arm.h | 13 +++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index e00ccf9c98..fc1dd3ec6a 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -18,6 +18,7 @@
>>  #include "qemu/error-report.h"
>>  #include "sysemu/sysemu.h"
>>  #include "sysemu/kvm.h"
>> +#include "sysemu/kvm_int.h"
>>  #include "kvm_arm.h"
>>  #include "cpu.h"
>>  #include "trace.h"
>> @@ -162,6 +163,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>>      env->features = arm_host_cpu_features.features;
>>  }
>>
>> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
>> +{
>> +    KVMState *s = KVM_STATE(ms->accelerator);
>> +    int ret;
>> +
>> +    ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
> 
> Why not name the function the same as the extension name?
> 
>> +    return ret > 0 ? ret : 40;
>> +}
>> +
>>  int kvm_arch_init(MachineState *ms, KVMState *s)
>>  {
>>      /* For ARM interrupt delivery is always asynchronous,
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 6393455b1d..0728bbfa6b 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -207,6 +207,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>>   */
>>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>>
>> +/**
>> + * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
>> + * supported by KVM
> 
> This is the number of bits in the IPA address space,
> right (ie 40 for a 40-bit IPA, and so on) ? If so, then
> I think "Return number of bits in the IPA address space"
> might be clearer.

It actually returns the MAX number of bits in the IPA address space
supported by the host kernel. What about naming this function
"kvm_arm_get_max_vm_ipa_size".

Thanks

Eric
> 
>> + *
>> + * @ms: Machine state handle
>> + */
>> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms);
> 
> thanks
> -- PMM
> 
