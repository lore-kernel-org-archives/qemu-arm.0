Received: by 10.80.166.35 with SMTP id d32csp538115edc;
        Thu, 3 Nov 2016 02:07:03 -0700 (PDT)
X-Received: by 10.99.238.17 with SMTP id e17mr12521033pgi.154.1478164023548;
        Thu, 03 Nov 2016 02:07:03 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ta2si6974022pac.306.2016.11.03.02.07.02;
        Thu, 03 Nov 2016 02:07:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756328AbcKCJHB (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Thu, 3 Nov 2016 05:07:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:52635 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755796AbcKCJHA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 3 Nov 2016 05:07:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 148D5ABFC;
        Thu,  3 Nov 2016 09:06:55 +0000 (UTC)
Subject: Re: [RFC 2/2] ARM: KVM: Enable in-kernel timers with user space gic
To:     Christoffer Dall <christoffer.dall@linaro.org>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
 <1477775449-115472-2-git-send-email-agraf@suse.de>
 <CAFEAcA9ABvy52WDX++ACUQNo+UiRJkyC+X_mT+QhMxqE154Nqw@mail.gmail.com>
 <581A08F3.1050501@suse.de> <20161102161943.GA11122@cbox>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
From:   Alexander Graf <agraf@suse.de>
Message-ID: <581AFE2E.2040008@suse.de>
Date:   Thu, 3 Nov 2016 10:06:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20161102161943.GA11122@cbox>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: y56dQgYOcdr0

On 11/02/2016 05:19 PM, Christoffer Dall wrote:
> On Wed, Nov 02, 2016 at 04:40:35PM +0100, Alexander Graf wrote:
>> On 11/01/2016 12:35 PM, Peter Maydell wrote:
>>> On 29 October 2016 at 22:10, Alexander Graf <agraf@suse.de> wrote:
> [...]
>
>>>> +        cpu->timer_irq_level = run->s.regs.timer_irq_level;
>>>> +    }
>>>> +
>>>>       return MEMTXATTRS_UNSPECIFIED;
>>>>   }
>>> Does this code do the right thing across a vcpu reset or
>>> a full-system reset?
>> Good question. I'm not 100% sure - but I don't know for sure whether
>> it's guaranteed without user space irqchip even.
>>
>> In essence, the code above merely synchronizes kvm state to qemu
>> state and is fully unaffected from any reset sequence. This is good,
>> as the line status is transient. So from a QEMU pov, we really only
>> copy the state of the vcpu interrupt line into the QEMU interrupt
>> line. Pulling that line down would be responsibility of the
>> KVM_ARM_VCPU_INIT ioctl if it also clears the timer registers I
>> guess.
>>
>> However, I don't see any clearing of cntv_ctrl inside KVM or from
>> QEMU. How do we ensure that the irq active bit is off on reset?
>
> In kvm_timer_vcpu_reset we cset cntv_ctl = 0, and that function gets
> called from the PSCI handler or whenever userspace calls the set target
> ioctl thingy.

Ah, ok, that should pull the "run" line down automatically.

>
>> The other part that could get in the way of working system reset is
>> the interrupt controller emulation itself which resets all internal
>> irq line state. So on reset we'd always end up with the irq line
>> down from a gic pov, but with the vtimer line pending or not pending
>> depending on previous state. I doubt it's really going to hurt
>> though.
> I suppose it should resample the line, but if the GIC clears everything
> and the arch timer line goes down, you're in the right starting state
> again.  Right?

Yup, I don't see any reason it wouldn't work :). Even if the GIC didn't 
clear everything things should still just work as long as the timer 
reset function gets called, as it unconditionally synchronizes the state.


Alex

