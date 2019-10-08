Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4799170wrm;
        Tue, 8 Oct 2019 00:01:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywrX22IhVY3FwScWFsyDMzpXeedFvE27Yxus/P1fSgrOsU2h5kV4MU90CW6Nojo0ehbvbm
X-Received: by 2002:a50:ce06:: with SMTP id y6mr31763821edi.282.1570518095814;
        Tue, 08 Oct 2019 00:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570518095; cv=none;
        d=google.com; s=arc-20160816;
        b=uH6fmeUd0TU2OhkwsDsONG/dd8x6Mvgw7qKM4qALkjz/aveQ4tISKmE8bRlNiAVPr8
         iZndD8invP4HvjD+xE0eAAQOkdJQlBNW8esXv6o8BCTkwJjo6ql9guXSBNiwXWwXsQkZ
         LE/0vZ3Yei3fwt8gxqsviYSt0bLLbAYX4Um6F0XFJHCxh11m+qcHTv8F2LoUCIsP5UO4
         IC6uLbUDyH3Zgon+OrhOp0MifOlREoApUFmJfLJhQrmNhvLSCwl0o/qSi56JAQNhZ8LK
         ZImTT8PzT7EtegrT6+bGcM47WMGKGnm4jiofSrvQWGyIwS6m1S83Lku2+lAk6WHzxmMs
         m0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=npJKwS6uLbyMWQBM+jPPDR4+PBD6hclUOYrt65BDhwI=;
        b=mQ9EjA8sJxHxEqYZCO6sxvjqEfCjvykzvq2NbKIKLEVSCBf+KStqkLOSbg4vdWIVfW
         cu72ha4R4tD/0PCrPyxClf7/rFqHEDhSrnB5IojAyAE+neTAwjhSukdrnvJ9OSnN11fS
         iq/nZAhOCzLvzq9p6HOuoz154rlO2tmYzn/ZZytmnAYevhNx7AWbaCOqNN01+8H7Nmxj
         1nuOnYcGoHIh/gGJ5E1N9PFotNumJV/3zwNTQS74Xs+su+xTsOIyOGbwJhlF2+COs8HO
         zYGxkcILwLwi4K9eiFGXvKtTJNPPJt/htkFiZqUNCwf04t8DhWdHn88F0ouL/G7K7Eil
         11Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g17si8342071ejd.123.2019.10.08.00.01.35;
        Tue, 08 Oct 2019 00:01:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfJHHBe (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 8 Oct 2019 03:01:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3267 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730057AbfJHHBe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 8 Oct 2019 03:01:34 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 25EA08A9D591A1209D42;
        Tue,  8 Oct 2019 15:01:32 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:01:24 +0800
Subject: Re: [Qemu-arm] [PATCH v18 4/6] KVM: Move hwpoison page related
 functions into include/sysemu/kvm_int.h
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-5-zhengxiang9@huawei.com>
 <CAFEAcA_o6NkOGptWFOoVt4pUgHU+dNyWQ9h_VfNweR17CtHSnw@mail.gmail.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <a857520c-f115-a096-3aeb-3d3588575c4a@huawei.com>
Date:   Tue, 8 Oct 2019 15:01:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_o6NkOGptWFOoVt4pUgHU+dNyWQ9h_VfNweR17CtHSnw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: W/bNbdZEGRBR



On 2019/9/27 21:19, Peter Maydell wrote:
> On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> kvm_hwpoison_page_add() and kvm_unpoison_all() will both be used by X86
>> and ARM platforms, so moving them into "include/sysemu/kvm_int.h" to
>> avoid duplicate code.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  accel/kvm/kvm-all.c      | 33 +++++++++++++++++++++++++++++++++
>>  include/sysemu/kvm_int.h | 23 +++++++++++++++++++++++
>>  target/arm/kvm.c         |  3 +++
>>  target/i386/kvm.c        | 34 ----------------------------------
>>  4 files changed, 59 insertions(+), 34 deletions(-)
> 
>>  static uint32_t adjust_ioeventfd_endianness(uint32_t val, uint32_t size)
>>  {
>>  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
>> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
>> index 72b2d1b3ae..3ad49f9a28 100644
>> --- a/include/sysemu/kvm_int.h
>> +++ b/include/sysemu/kvm_int.h
>> @@ -41,4 +41,27 @@ typedef struct KVMMemoryListener {
>>  void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>>                                    AddressSpace *as, int as_id);
>>
>> +/**
>> + * kvm_hwpoison_page_add:
>> + *
>> + * Parameters:
>> + *  @ram_addr: the address in the RAM for the poisoned page
>> + *
>> + * Add a poisoned page to the list
>> + *
>> + * Return: None.
>> + */
>> +void kvm_hwpoison_page_add(ram_addr_t ram_addr);
>> +
>> +/**
>> + * kvm_unpoison_all:
>> + *
>> + * Parameters:
>> + *  @param: some data may be passed to this function
>> + *
>> + * Free and remove all the poisoned pages in the list
>> + *
>> + * Return: None.
>> + */
>> +void kvm_unpoison_all(void *param);
>>  #endif
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index b2eaa50b8d..3a110be7b8 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -20,6 +20,7 @@
>>  #include "sysemu/sysemu.h"
>>  #include "sysemu/kvm.h"
>>  #include "sysemu/kvm_int.h"
>> +#include "sysemu/reset.h"
>>  #include "kvm_arm.h"
>>  #include "cpu.h"
>>  #include "trace.h"
>> @@ -195,6 +196,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>
>>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>>
>> +    qemu_register_reset(kvm_unpoison_all, NULL);
>> +
> 
> Rather than registering the same reset handler in
> all the architectures, we could register it in the
> generic kvm_init() function. (For architectures that
> don't use the poison-list functionality the reset handler
> will harmlessly do nothing, because there will be nothing
> in the list.)
> 
> This would allow you to not have to make the
> kvm_unpoison_all() function global -- it can be static
> in accel/tcg/kvm-all.c.

OK, I will move the register code into the kvm_init() function.

> 
>>      return 0;
>>  }
> 
> thanks
> -- PMM
> 
> .
> 

-- 

Thanks,
Xiang
