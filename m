Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp976066lfc;
        Mon, 2 Dec 2019 19:35:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3WPK/YFo8mmrj6xoP5ES0fH55OROY/CcxkXLg8uj/6fO+eCirEsELJ7VByUMp+RfWrdXn
X-Received: by 2002:a9d:6a7:: with SMTP id 36mr1735869otx.136.1575344126896;
        Mon, 02 Dec 2019 19:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575344126; cv=none;
        d=google.com; s=arc-20160816;
        b=W/Cz21Lqp4kyHwd2K6T720Dz23ZgpQZVS9IPze5UN+YCsJrGPc6g1i9r1UY79ra4D9
         1+moO0fyJATl3aNpa2Od2ECnyL/uWsqQ+M3xUS7j4NAGBJCbrpvyHBjLoy53ikytw/pQ
         o8OgCuyUp9qsqnEtHGdURHDjigsXdTUTsf1oytxrx+17OLlq9o9jSCUlYoAqN5pKr/rE
         zOqxS7dbLS9LV3EzTyb8X+kp7Yj+rFks+SfWPBlDjd1MYT87A/whzunUrLvKuyHeYBHK
         QOD9AWPdNHcCfEo32GAqCkVfepSbsZ4Qdm7cK0HFMK1o+kw6JTxeJ0E25+hpF6kf5cxa
         bMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=BwnIsEv/+7gQoqky1bIiOUZrDDgoWm/lZyt9+lSb6Y4=;
        b=jwYSQND3QVyvYYHbygQTo2KCNIbK2xmst2ZpmrQFjODtyiQgx90KAi8ELPiTA89bqK
         /hh5Xki8PHJ1dwic7lbu/3P4LBUzyjCCwiHGsOQSe2Hv2U16y+YavO+e9TVa84wU5R95
         tx20BQ+8q5IneajxKctKgYhSxhx8VKSI3aKN9cqH2D/UPmT4Q0JiyRH46fLI+CK4yTaz
         aPSBG2mur2649avF0DWz4XF10eHeVcSXPrLBOsPV0SVzTB+goP27NCf3sNPRxGh4PT6P
         5dnk2B7mnfvojv8ma/hLmEGlP7lhuPKwuWulhrh9k4EiUKtdFKAnIqToqx+GshHpmfUK
         6QQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d62si417125oib.144.2019.12.02.19.35.26;
        Mon, 02 Dec 2019 19:35:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfLCDfZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 2 Dec 2019 22:35:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:6739 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726319AbfLCDfZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 2 Dec 2019 22:35:25 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1D09FC0E0806ED26CA59;
        Tue,  3 Dec 2019 11:35:24 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Dec 2019
 11:35:14 +0800
Subject: Re: [RESEND PATCH v21 5/6] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To:     Beata Michalska <beata.michalska@linaro.org>,
        Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>,
        "Peter Maydell" <peter.maydell@linaro.org>,
        Laszlo Ersek <lersek@redhat.com>, <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-6-zhengxiang9@huawei.com>
 <CADSWDztF=eaUDNnq8bhnPyTKW1YjAWm4UBaH-NBPkzjnzx0bxg@mail.gmail.com>
 <22a3935a-a672-f8f1-e5be-6c0725f738c4@huawei.com>
 <20191127140223.58d1a35b@redhat.com>
 <CADSWDztu=aP=ckxLsKdP7URmYFLn=JtOcm=zMAGJXo-G_9TOHQ@mail.gmail.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <4282defe-80e6-fdd9-ece0-3349c94f2611@huawei.com>
Date:   Tue, 3 Dec 2019 11:35:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CADSWDztu=aP=ckxLsKdP7URmYFLn=JtOcm=zMAGJXo-G_9TOHQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: e9ak3u2ROVo9


On 2019/11/27 22:17, Beata Michalska wrote:
> On Wed, 27 Nov 2019 at 13:03, Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> On Wed, 27 Nov 2019 20:47:15 +0800
>> Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>>> Hi Beata,
>>>
>>> Thanks for you review!
>>>
>>> On 2019/11/22 23:47, Beata Michalska wrote:
>>>> Hi,
>>>>
>>>> On Mon, 11 Nov 2019 at 01:48, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>>>>
>>>>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>>>>
>>>>> Add a SIGBUS signal handler. In this handler, it checks the SIGBUS type,
>>>>> translates the host VA delivered by host to guest PA, then fills this PA
>>>>> to guest APEI GHES memory, then notifies guest according to the SIGBUS
>>>>> type.
>>>>>
>>>>> When guest accesses the poisoned memory, it will generate a Synchronous
>>>>> External Abort(SEA). Then host kernel gets an APEI notification and calls
>>>>> memory_failure() to unmapped the affected page in stage 2, finally
>>>>> returns to guest.
>>>>>
>>>>> Guest continues to access the PG_hwpoison page, it will trap to KVM as
>>>>> stage2 fault, then a SIGBUS_MCEERR_AR synchronous signal is delivered to
>>>>> Qemu, Qemu records this error address into guest APEI GHES memory and
>>>>> notifes guest using Synchronous-External-Abort(SEA).
>>>>>
>>>>> In order to inject a vSEA, we introduce the kvm_inject_arm_sea() function
>>>>> in which we can setup the type of exception and the syndrome information.
>>>>> When switching to guest, the target vcpu will jump to the synchronous
>>>>> external abort vector table entry.
>>>>>
>>>>> The ESR_ELx.DFSC is set to synchronous external abort(0x10), and the
>>>>> ESR_ELx.FnV is set to not valid(0x1), which will tell guest that FAR is
>>>>> not valid and hold an UNKNOWN value. These values will be set to KVM
>>>>> register structures through KVM_SET_ONE_REG IOCTL.
>>>>>
>>>>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>>>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>> [...]
>>>>> diff --git a/include/hw/acpi/acpi_ghes.h b/include/hw/acpi/acpi_ghes.h
>>>>> index cb62ec9c7b..8e3c5b879e 100644
>>>>> --- a/include/hw/acpi/acpi_ghes.h
>>>>> +++ b/include/hw/acpi/acpi_ghes.h
>>>>> @@ -24,6 +24,9 @@
>>>>>
>>>>>  #include "hw/acpi/bios-linker-loader.h"
>>>>>
>>>>> +#define ACPI_GHES_CPER_OK                   1
>>>>> +#define ACPI_GHES_CPER_FAIL                 0
>>>>> +
>>>>
>>>> Is there really a need to introduce those ?
>>>>
>>>
>>> Don't you think it's more clear than using "1" or "0"? :)
>>
>> or maybe just reuse default libc return convention: 0 - ok, -1 - fail
>> and drop custom macros
>>
> 
> Totally agree.
> 

OK, let's reuse default libc return convention.

-- 

Thanks,
Xiang
