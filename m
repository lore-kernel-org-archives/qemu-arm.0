Received: by 10.25.227.6 with SMTP id a6csp2955675lfh;
        Wed, 28 Jun 2017 04:51:17 -0700 (PDT)
X-Received: by 10.99.185.28 with SMTP id z28mr10292706pge.123.1498650677062;
        Wed, 28 Jun 2017 04:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498650677; cv=none;
        d=google.com; s=arc-20160816;
        b=txqb9MM3XhuUQmz2JuOEhrmpsuSBnnlMm69J8u6HuT1oWqEUQIoNAXypGFdGPzTLJV
         laV/io/Z5MmMXNGedrx6r/jfppusUYhe7CUSaf6qWsIeB9pQSdkxNXYt8cQYIwjkZrQ+
         q4ne17kFSgEyyeHgLJCXLJG7B2xkJb5h0sMwnBueEOP+/y42uupb7+U1HNard7oJ2A8O
         FTEgP5esmDhKKspMCoRxhQaTJiIeDTQeSS8TDAPpjYDvN4Zzy/u+px1YMo/uh3i8rA6l
         k6RLlhFNWQRaBV9lS39wKuzDz8K65URbEacnJBfQ38XmZ5xivrlKANQ4JnUYkWEBY6LZ
         +T3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ccaYucwfmHyp/lScL07OaG1bAAmYHsc6QsZq+dNmFd8=;
        b=oi6eNpVeJgp6pwoC8Ex4taa24FRb/EQk5PL8fD9dQ9TogcPxq/CGjGLOFCHnOrzueh
         7VoxilbISG784lBAHBUlYVkgnOmzGuWo76ymP8vzwWmKo30h6mM8Su5mkotQX8MGvc9o
         bq6FBFsZ++zxODxPKxdFCW1kR/Yxytk6f0pnzM3rAFHUoGayZ9bgMuN5HMuPQjItZdrH
         5XEVbwX26MJgqpLr6oCxTL/vB19qcoizBIfZ2HrNthS+NoPIfWD6AMIsRKcGUMGmwTTG
         /pzafRw5k091TAA2nQZ/+zKasbS8B6csugjCqn4POeONgkkLPgKUMWF4A/XIEnThiZ4P
         UD+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d197si1397185pga.104.2017.06.28.04.51.16;
        Wed, 28 Jun 2017 04:51:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751526AbdF1LvP (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Wed, 28 Jun 2017 07:51:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2420 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751513AbdF1LvO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 28 Jun 2017 07:51:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DD0BE7A163;
        Wed, 28 Jun 2017 11:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DD0BE7A163
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DD0BE7A163
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6936D89E55;
        Wed, 28 Jun 2017 11:51:12 +0000 (UTC)
Date:   Wed, 28 Jun 2017 13:51:10 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        kvm@vger.kernel.org, cdall@linaro.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] ARM: KVM: Enable in-kernel timers with user space gic
Message-ID: <20170628115110.nq7wdsrhxxjelzq6@kamzik.brq.redhat.com>
References: <1498577737-130264-1-git-send-email-agraf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498577737-130264-1-git-send-email-agraf@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 28 Jun 2017 11:51:14 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +6q4CT7h7Ffq

On Tue, Jun 27, 2017 at 05:35:37PM +0200, Alexander Graf wrote:
> When running with KVM enabled, you can choose between emulating the
> gic in kernel or user space. If the kernel supports in-kernel virtualization
> of the interrupt controller, it will default to that. If not, if will
> default to user space emulation.
> 
> Unfortunately when running in user mode gic emulation, we miss out on
> interrupt events which are only available from kernel space, such as the timer.
> This patch leverages the new kernel/user space pending line synchronization for
> timer events. It does not handle PMU events yet.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
> ---
> 
> v1 -> v2:
> 
>   - whitespace fixes
>   - use !! to determine whether bit is set
>   - call in-kernel device IRQs out by their name everywhere
> 
> v2 -> v3:
> 
>   - fix last occurence of calling out timer IRQs explicitly
> ---
>  accel/kvm/kvm-all.c    |  5 +++++
>  accel/stubs/kvm-stub.c |  5 +++++
>  hw/intc/arm_gic.c      |  7 +++++++
>  include/sysemu/kvm.h   | 11 +++++++++++
>  target/arm/cpu.h       |  3 +++
>  target/arm/kvm.c       | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 82 insertions(+)
>

Tried testing this on a gicv3 machine, a ThunderX2. The guest kernel
complains with

 GICv3: GIC: unable to set SRE (disabled at EL2), panic ahead

but no panic occurs. Instead it hangs in cpu_do_idle(), waiting forever
for an interrupt.

AAVMF also complains about SRE support, actually it asserts it.

 ASSERT [ArmGicDxe] /builddir/build/BUILD/ovmf-c325e41585e3/ArmVirtPkg/Library/ArmVirtGicArchLib/ArmVirtGicArchLib.c(113): IccSre & (1 << 0)


I still haven't seen any problems with gicv2 though.

Thanks,
drew
