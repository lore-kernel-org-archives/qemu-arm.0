Received: by 10.25.227.6 with SMTP id a6csp3005082lfh;
        Wed, 28 Jun 2017 05:36:22 -0700 (PDT)
X-Received: by 10.99.171.66 with SMTP id k2mr10437629pgp.248.1498653382551;
        Wed, 28 Jun 2017 05:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498653382; cv=none;
        d=google.com; s=arc-20160816;
        b=xHmr1l9JfTtPIaLMx3wV/r94bH9h8AJ7K5z1c/dvbMBeKF2JOFnfG/9v7LU/v9BWK4
         RPDLqGcMuj5C9VKHCDqVWfYcCv2fBswp2M9aAMkJ1bGcksnCTLGFWsk/GSDErEW6YQOH
         8xJj5k7zmOjmFzgjhxPf26VNP/tGJvIih+6W6J8wEJNBKHxgKlFsM/OQlrMi9kh/a9SQ
         DiBkSxop+roqYvI5w++jdFYIOZD++XNCEFraTi+cZFMeCLIP39NlKpfvIirSzmOmB+9z
         UsmIvux8TmrW9dr3CcH4vO+yroB3cEqe9siTjrpL7Av27oCbGN8YkkDF2AyoQJAZ6Izq
         CNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=OmdJNEnRYd2ujkk1RAaqG6wJdY+SUvBAKXgVf0pKb1Y=;
        b=hvA8u9Tks8XDLLzAGPac1/C/p+BYQDjXXV6ljsYLrTMKNkdoyLQfNX1SYcGUvslneV
         a2WJYgDdWPRptbfDAILxPfgq0t/1hOR6hiNDXiKNHppBqTlohh6Or+8pH5pCdd6YuAQy
         YLzi66BoebKCn9Hw/btZ1Lb/kymKW5nLkZEdVNAKx5iaORdGXAM64qNK3IMDthq63jWw
         fxHzKiMDb2kTWNT+PGUav3WCi4ptiYmfOa5i4/cG3onAlP1VXVA5VSQlKml+WSJn1eYP
         14uVXWn5uFY+DOrMJxGj2vunV5gXITtuhmT0UJv05k2eYQC2sycPQYo7YsuukZkXQmUU
         s5MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d2si1367510pge.232.2017.06.28.05.36.22;
        Wed, 28 Jun 2017 05:36:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751516AbdF1MgV (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Wed, 28 Jun 2017 08:36:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:52417 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751469AbdF1MgT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 28 Jun 2017 08:36:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 32635AAB6;
        Wed, 28 Jun 2017 12:36:18 +0000 (UTC)
Subject: Re: [PATCH v3] ARM: KVM: Enable in-kernel timers with user space gic
To:     Andrew Jones <drjones@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        kvm@vger.kernel.org, cdall@linaro.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
References: <1498577737-130264-1-git-send-email-agraf@suse.de>
 <20170628115110.nq7wdsrhxxjelzq6@kamzik.brq.redhat.com>
From:   Alexander Graf <agraf@suse.de>
Message-ID: <9e3a0693-d69b-4ae7-c449-457f7428fbff@suse.de>
Date:   Wed, 28 Jun 2017 14:36:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170628115110.nq7wdsrhxxjelzq6@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7zG3+y6UGy9w



On 28.06.17 13:51, Andrew Jones wrote:
> On Tue, Jun 27, 2017 at 05:35:37PM +0200, Alexander Graf wrote:
>> When running with KVM enabled, you can choose between emulating the
>> gic in kernel or user space. If the kernel supports in-kernel virtualization
>> of the interrupt controller, it will default to that. If not, if will
>> default to user space emulation.
>>
>> Unfortunately when running in user mode gic emulation, we miss out on
>> interrupt events which are only available from kernel space, such as the timer.
>> This patch leverages the new kernel/user space pending line synchronization for
>> timer events. It does not handle PMU events yet.
>>
>> Signed-off-by: Alexander Graf <agraf@suse.de>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>>
>>    - whitespace fixes
>>    - use !! to determine whether bit is set
>>    - call in-kernel device IRQs out by their name everywhere
>>
>> v2 -> v3:
>>
>>    - fix last occurence of calling out timer IRQs explicitly
>> ---
>>   accel/kvm/kvm-all.c    |  5 +++++
>>   accel/stubs/kvm-stub.c |  5 +++++
>>   hw/intc/arm_gic.c      |  7 +++++++
>>   include/sysemu/kvm.h   | 11 +++++++++++
>>   target/arm/cpu.h       |  3 +++
>>   target/arm/kvm.c       | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   6 files changed, 82 insertions(+)
>>
> 
> Tried testing this on a gicv3 machine, a ThunderX2. The guest kernel

Did you patch QEMU to automatically choose the gic version? The upstream 
default is to have gicv2 as the guest gic type. And gicv2 should work 
just fine.

I have seen issues with gicv3 emulation in user space, yes. I guess we 
don't have a channel to properly trap the MSRs into user space yet.


Alex
