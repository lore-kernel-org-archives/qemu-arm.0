Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp298150wri;
        Wed, 6 Nov 2019 17:44:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzon50i9bahf8dLMgKqs2FEJiAjg/UUfr7yBx93to5FUJK7Tm8pIUGZqhvm7xm7kc5vtZBf
X-Received: by 2002:aed:3be9:: with SMTP id s38mr1196325qte.175.1573091099550;
        Wed, 06 Nov 2019 17:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573091099; cv=none;
        d=google.com; s=arc-20160816;
        b=c1OEiPa7V3xHb8gAaaSANHdjwlEeJAtyA1Iu51S2XJdXkgKlMr+4YOP+vJPqL/8W8f
         Xr7qh45LCDSwDb5hB1E3wAq99GhBtVnnR9zgw+bTXTOj6MN/ux1w8L2LWCDdKshmvHk9
         NkrWWb3J32Ji/eL5yqQJ/hx2JDGc8iDn2h4KCLPwxQUXmaDvwqTDtO1vEMkjYVjo/ixx
         gRpjw7FHUIgDWvM4+yAqSHgfDcrVhPMSWRrPP8I6dJ3bexTPmaW7sDvDqzzKutVWoDWD
         aLRinwaak0bofY1sWZKRg+jDvhjRW/iY5vdqbt1DVFkEp2lc0x15u3wOfWWGhdK1qfkr
         3pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=jwsQC2czlsKur61pZRgo3JzDPSV/+MdL10jqy+JJStM=;
        b=A7t4YBeBrUOmI7D3QLbHnDFyWDmnrv9irXaHXLAA9TufhMWqV5h5lu0TCjC5b6I3KA
         bbO5uEQpAXgiNOfM0cDjJ9NtRg3cphaAugaT0x5dc3ssouE8Hftd9T2Qmb9b3hvPYlML
         5aoA9Wn7EEKX4pNtE6qRG+sJqeLHlqVmEfWee6v7lRmkYJoh5HNZyTK9MRTW2jmYKUZe
         8BJwVMi7jrpNer7WIVYMqHsl68rhM4BvQUmIiqhhEjQN6D59nbM2m3fLP762xQwzNFAh
         W8TQwqd+G3UgvXT9uoUZimvPEHMkOYTh2lI+04ZjZQwPXvxxd1Y4oGbWevgoERl1Qnxj
         updg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si391977qtd.176.2019.11.06.17.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 17:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSWr5-0007F0-1U
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 20:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iSWqx-0007Em-Kk
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 20:44:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iSWqw-0004Ac-I8
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 20:44:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2263 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iSWqw-0004AB-71; Wed, 06 Nov 2019 20:44:50 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3E779B65EF589C9340E0;
 Thu,  7 Nov 2019 09:44:44 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 7 Nov 2019
 09:44:37 +0800
Subject: Re: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
To: Cornelia Huck <cohuck@redhat.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-12-guoheyi@huawei.com>
 <20191106185524.0fe51c50.cohuck@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <4dbcbd18-0e6c-f985-c36d-96df65331d11@huawei.com>
Date: Thu, 7 Nov 2019 09:44:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191106185524.0fe51c50.cohuck@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JjxB/6BFgv+p



On 2019/11/7 1:55, Cornelia Huck wrote:
> On Tue, 5 Nov 2019 17:10:53 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> To keep backward compatibility, we add new KVM capability
>> "KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
>> hypercall to userspace.
>>
>> The capability should be enabled explicitly, for we don't want user
>> space application to deal with unexpected hypercall exits. After
>> enabling this cap, all HVC calls unhandled by kvm will be forwarded to
>> user space.
>>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> ---
>>   linux-headers/linux/kvm.h |  1 +
>>   target/arm/sdei.c         | 16 ++++++++++++++++
>>   target/arm/sdei.h         |  2 ++
>>   3 files changed, 19 insertions(+)
>>
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index 3d9b18f7f8..36c9b3859f 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
>>   #define KVM_CAP_PMU_EVENT_FILTER 173
>>   #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
>>   #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
>> +#define KVM_CAP_FORWARD_HYPERCALL 176
>>   
>>   #ifdef KVM_CAP_IRQ_ROUTING
> Is this cap upstream already? I would have thought your header sync
> would have brought it in, then. (Saying this, that header sync looks
> awfully small.)
>
> If it is not upstream yet, please split off this hunk into a separate
> patch -- it's a bit annoying, but makes life easier for merging.
No, it is not upstream yet. The whole framework and interfaces between 
KVM and qemu are still under discussion. I'll keep in mind of this when 
moving forward to next steps...

Thanks,
HG
>
>
> .
>


