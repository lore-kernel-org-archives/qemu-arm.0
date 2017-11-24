Received: by 10.223.159.82 with SMTP id f18csp2123997wrg;
        Fri, 24 Nov 2017 05:50:58 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaDE+ATOGza7lzp8MzNna9lFwBxMry4h70MTnoP6xH8KzlvSczqnA2X912r2D5t3W3joI1C
X-Received: by 10.37.73.194 with SMTP id w185mr17292627yba.461.1511531458666;
        Fri, 24 Nov 2017 05:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511531458; cv=none;
        d=google.com; s=arc-20160816;
        b=H+lJ/2zI+CsJcFwV2FqBvt1atvvSiWC79JaYofeVAncVV6p1F249Zik3JUzPl4mUYh
         XCj4oeIXi2vhv8e+/3CcPq6exuZAoqQLKc8YYWVJIkGbQX7Omu3FjDihSk0LkFtFbh3X
         nHqIAjRQPQZKMI8hUjbaKvjzNTQju3HciDuKoVkXIGa5Y/4lkGQFwdVoFRIM/AapUUe6
         cYwrhPd1ATmT9tadSVJr+1h5KRpa/pjfjF1hOmp8UeDyZ8F6BiJ8OqHmDU/VybG39Hs8
         zQcMYlnTtmGSglCkvU75Rf7Qa2uhYyhIptS8u1QG8Gxu1uTckRB7G1sJyyfjkPgJDdtz
         E6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=JJjyTyyEqQ3t9ZUfj3BjzwlU6m5ronUMaVBZj+8D+x0=;
        b=SqrOpryXFbwnxj0AOSX02McddvA6K68W6FQXDslt9+CNSSTRf+JL59bRXu9yoAtQJk
         mwEJA4jI/TKxeuWmwlQb/qSAEP4gnKeK7JS80dK3jBt5VI32QDW/dklSfhJ20ublSXJq
         pjQAUtaQpr7+htdRlwHWxXxEX6Kf3FCg86DgRsgw0VIhE1dOhXi+RwR2pW9PuBYrbu26
         SBKGugTNLOU1zHRoG/WDZZE06iobKY8gyUb/Rpk4oTtz3EZ3dlDrXkpvorgrM/EfV0WE
         TD4ymZ64rWM6Fx4GLIWgJX6tGj5pp9knvFguWveJ9OVbjmbZN/jmLVYiKRKCNX6AEqe9
         rDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si4335340ybc.356.2017.11.24.05.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIENe-00052z-33
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:50:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIENI-0004wJ-At
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIENF-00072W-2l
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:50:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIENE-000723-PK; Fri, 24 Nov 2017 08:50:32 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B432D1555A;
	Fri, 24 Nov 2017 13:50:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C1161987;
	Fri, 24 Nov 2017 13:50:26 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-ro5AkFt-eAhDX+AhDv5HDs6oezS9UYuT+jsMy5jYMWw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ab918176-612e-b639-7980-ebeb3db98a5a@redhat.com>
Date: Fri, 24 Nov 2017 14:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ro5AkFt-eAhDX+AhDv5HDs6oezS9UYuT+jsMy5jYMWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 24 Nov 2017 13:50:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 3/4] linux-headers: update to pre 4.15-rc0
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KQF0dQdGniOH

Hi Peter,

On 24/11/17 14:38, Peter Maydell wrote:
> On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
>> Update headers against post v4.14 and pre v4.15-rc0.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  include/standard-headers/asm-s390/virtio-ccw.h     |   1 +
>>  include/standard-headers/asm-x86/hyperv.h          | 394 +--------------------
>>  include/standard-headers/linux/input-event-codes.h |   2 +
>>  include/standard-headers/linux/input.h             |   1 +
>>  include/standard-headers/linux/pci_regs.h          |  45 ++-
>>  linux-headers/asm-arm/kvm.h                        |   8 +
>>  linux-headers/asm-arm/kvm_para.h                   |   1 +
>>  linux-headers/asm-arm/unistd.h                     |   2 +
>>  linux-headers/asm-arm64/kvm.h                      |   8 +
>>  linux-headers/asm-arm64/unistd.h                   |   1 +
>>  linux-headers/asm-powerpc/epapr_hcalls.h           |   1 +
>>  linux-headers/asm-powerpc/kvm.h                    |   1 +
>>  linux-headers/asm-powerpc/kvm_para.h               |   1 +
>>  linux-headers/asm-powerpc/unistd.h                 |   1 +
>>  linux-headers/asm-s390/kvm.h                       |   1 +
>>  linux-headers/asm-s390/kvm_para.h                  |   1 +
>>  linux-headers/asm-s390/unistd.h                    |   4 +-
>>  linux-headers/asm-x86/kvm.h                        |   1 +
>>  linux-headers/asm-x86/kvm_para.h                   |   2 +-
>>  linux-headers/asm-x86/unistd.h                     |   1 +
>>  linux-headers/linux/kvm.h                          |   2 +
>>  linux-headers/linux/kvm_para.h                     |   1 +
>>  linux-headers/linux/psci.h                         |   1 +
>>  linux-headers/linux/userfaultfd.h                  |   1 +
>>  linux-headers/linux/vfio.h                         |   1 +
>>  linux-headers/linux/vfio_ccw.h                     |   1 +
>>  linux-headers/linux/vhost.h                        |   1 +
> 
>> --- a/include/standard-headers/asm-x86/hyperv.h
>> +++ b/include/standard-headers/asm-x86/hyperv.h
>> @@ -1,393 +1 @@
>> -#ifndef _ASM_X86_HYPERV_H
>> -#define _ASM_X86_HYPERV_H
>> -
>> -#include "standard-headers/linux/types.h"
>> -
>> -/*
>> - * The below CPUID leaves are present if VersionAndFeatures.HypervisorPresent
>> - * is set by CPUID(HvCpuIdFunctionVersionAndFeatures).
>> - */
>> -#define HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS  0x40000000
>> -#define HYPERV_CPUID_INTERFACE                 0x40000001
>> -#define HYPERV_CPUID_VERSION                   0x40000002
>> -#define HYPERV_CPUID_FEATURES                  0x40000003
>> -#define HYPERV_CPUID_ENLIGHTMENT_INFO          0x40000004
>> -#define HYPERV_CPUID_IMPLEMENT_LIMITS          0x40000005
>> -
>> -#define HYPERV_HYPERVISOR_PRESENT_BIT          0x80000000
>> -#define HYPERV_CPUID_MIN                       0x40000005
>> -#define HYPERV_CPUID_MAX                       0x4000ffff
> 
> Did you test building on x86 host? It's hard to see how the
> code in QEMU that uses these HYPERV #defines will still compile.

Just test built with

./configure --target-list="aarch64-softmmu arm-softmmu arm-linux-user
x86_64-softmmu i386-softmmu" --enable-kvm --enable-trace-backends=log

and it looks OK.

Thanks

Eric
> 
> thanks
> -- PMM
> 
