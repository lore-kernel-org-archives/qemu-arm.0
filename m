Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4890698lff;
        Mon, 16 Dec 2019 10:06:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxFVUG0EIDo4bvJ+Oq91VkMRLDsI0w+rIeNqrlbBVjNPvTvRidlFHRgt1q9QOhqivhoI+eU
X-Received: by 2002:a9d:7592:: with SMTP id s18mr34393140otk.130.1576519616294;
        Mon, 16 Dec 2019 10:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576519616; cv=none;
        d=google.com; s=arc-20160816;
        b=xB4eew2BArZS0RzUFa6dgc3q0kB36LmJVrtwTl4p6P7smIMjLDTqu7c7b6Wnp2MECf
         rFW2NpJUq3NzhWGhFzNFsVX3H1dlhJkKTOxPsDf+XMNJFF2j41kX5LEustvpm5ekBCOR
         IaAHcRf5RK9X9nJ3VP3xavc0e9u7CX43AE83veswVQW5K4bf2tF5e644UmWntU90ZaSv
         oNJOJ+pJz4qF7d6YcUWCyD5Mahd/GWoo9kFJtii28hyQATFUDv+SfLqePIzZRnFpjB30
         BUt+JdsYRsquGqiZuuKXt5kCN1ksiap0y5VvoL27+IHIeMw7oG/eQB/JV6WhE1GoJEPb
         Arsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MirDbpR4oYKNUHsUc37Lmf2tFcn7WlaGv1P9OqWE3II=;
        b=u8CLsmfKGTY2E6USR6waxbnM3BdlJVGkJV4Rbx+ioYvz4OwUGJ8eb30MI092lu6lbe
         gB+Xruppj1LSJ7xm8r1BD54zXq6NcLDKVLtNTcVR4WoiS4c48eVAszc0SZT7wxNJao/e
         j1AbpLydGh6sfDMeo9R9hZlT6WJhh/w1Mof6JZ9n91OsQcfV0oa3d3OE9v0puVugGooz
         43OuuaGE20nGBAez1Zhy31TEcMJfICY0qgq765AqK7c2ePwab8flsdBeeKUg10KoQkg7
         YFgRNUOb2faBB5VEqVgi6zzNq6dULUxbi1SN3zd52a3mMIbvE8T1aKd8YgveuQzXjGXC
         f8dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0Xwby5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si10992697otr.64.2019.12.16.10.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 10:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0Xwby5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igulj-0008Cg-43
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 13:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igula-00089n-5K
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 13:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igulX-0001SO-4V
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 13:06:46 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35146)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igulW-0001Qq-UY
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 13:06:43 -0500
Received: by mail-oi1-x242.google.com with SMTP id k196so4048975oib.2
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MirDbpR4oYKNUHsUc37Lmf2tFcn7WlaGv1P9OqWE3II=;
 b=O0Xwby5+qMCAZNks4hGLGdbDjf7JhZdBAJMxRR+OkUlf+41I8x8Rmr/7n4BdRII2i/
 A4q+wIj6zNJbNWeoeeYQaE8B2GdGEcRKr1BfiLIWZfnJY2OEwF6o9cWnAEvZlK7L6zGr
 YL8CBPYvWUeSpRoxGKfRvnRxPjPgw7R6ZvKj1JuEeVgDQ6LuDMdPQYT9bSdAbqhBSBs5
 BqvsLft43G02Qgl1T8nG7NPWMxBGRwhhCIQMwkFEDVkmofx8yfI+dRyZe//YbOsINzVi
 JtKeXB69PBPKlCs1nn2/t4nbUri+pCxlYjTn2R6t+FRsvNrh55JpqxBbXqHN3rrKLaNR
 bwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MirDbpR4oYKNUHsUc37Lmf2tFcn7WlaGv1P9OqWE3II=;
 b=toKUP3g14D9l4DRj964GYGNVXgOIYafJEVPkIMPkTETO/PNXt6tIMWZz7M+s7IdfF3
 hq7Lsc9HMEcmHl4qes4zLuSSLczxd/ekbMkXz8aG3ljwFuS8cl31C0iZ1B2/sCG8NIJI
 S4c9Zh25mowMe3lhzr9hCOcj/ixCwCvRfioXYXOscO8S9A4mTsQddsxLVTpMkWWeUtvk
 f1CvHKRYv7z/wOXBGQAcyJJghB0ttM6X+jFdZhIH/vqvrO1kRzoaw+9bTlpKGVkXMS0M
 FvpE3EqAHnf4eElChKHal1uGu5RVRFdCU9O4JI4ZATjsChQq2k0392eAbB65o3l+chYG
 LIvA==
X-Gm-Message-State: APjAAAVudiL858YqJCM9GhxMe17agdI4oFO02ss8EENgrldV3gFSdIfP
 kZ5cL3Sqsa+UWQIfULRkHx/f59SsdZ1ZSHT9M+cIMg==
X-Received: by 2002:aca:f5cc:: with SMTP id t195mr153912oih.163.1576519601929; 
 Mon, 16 Dec 2019 10:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-4-drjones@redhat.com>
 <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
 <CAFEAcA9ZoOZt6Jh42hi6q91=kRM9T9z436J99NF+Ns5KVKUYow@mail.gmail.com>
 <20191216164355.i5rpfuqlfqv2z7m7@kamzik.brq.redhat.com>
In-Reply-To: <20191216164355.i5rpfuqlfqv2z7m7@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 18:06:30 +0000
Message-ID: <CAFEAcA8NzQ8QYE2NMnviPPnmBn1Dwm4W_KvhMbwCNwFzkurK-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] target/arm/kvm: Implement virtual time
 adjustment
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AS2AISxrx9YN

On Mon, 16 Dec 2019 at 16:44, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Dec 16, 2019 at 03:40:16PM +0000, Peter Maydell wrote:
> > On Mon, 16 Dec 2019 at 15:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > How does this interact with the usual register sync to/from
> > > KVM (ie kvm_arch_get_registers(), which I think will do a
> > > GET_ONE_REG read of the TIMER_CNT register the way it does
> > > any other sysreg, inside write_kvmstate_to_list(), plus
> > > kvm_arch_set_registers() which does the write back to the
> > > kernel in write_list_to_kvmstate()) ? Presumably we want this
> > > version to take precedence by the set_virtual_time call
> > > happening after the kvm_arch_set_registers, but is this
> > > guaranteed ?
> >
> > ...you might also want to look at the effects of simply
> > removing the KVM_REG_ARM_TIMER_CNT entry from the
> > 'non_runtime_cpregs[]' array -- in commit 4b7a6bf402bd064
> > we explicitly stopped reading/writing this register's value
> > to/from the kernel except for inbound migration, and it
> > feels like this patchset is now rolling back that approach,
> > so maybe we should also be (configurably) rolling back some
> > of its implementation rather than just leaving it in place.
>
> I feel like I already considered that, maybe even tried it, a few months
> ago when I first looked at this. I must have decided against it for some
> reason at the time, but I don't recall what. Now I can say the reason is
> because we only do this save/restore when we transition to/from paused
> state, though.

I found the thread which discussed the bug which originally
caused us to add commit 4b7a6bf402bd064:
https://lists.cs.columbia.edu/pipermail/kvmarm/2015-July/015665.html
 -- there are some codepaths which cause us to do a sync from/to
KVM for one VCPU while others are still running. If we do a
read-CNT-and-write-back then we effectively cause time to jump
backwards for the other still-running CPUs.

So we do still want to have TIMER_CNT listed as being KVM_PUT_FULL_STATE
regardless, or we re-introduce that bug.

Your approach in this patchset reads and writes on vm-paused,
so it won't have the pre-2015 problems.

It still feels odd that we're storing this bit of guest state
in two places now though -- in kvm_vtime, and also in its usual
place in the cpreg_array data structures (we write back the
value from kvm_vtime when the VM starts running, and we write
back the value from the cpreg_array for a PUT_FULL_STATE, which
the comments claim is only on startup or when we just loaded
migration state (and also undocumentedly but reasonably on
cpu-hotplug, which arm doesn't have yet).

I've just spent a little while digging through code, and
haven't been able to satisfy myself on the ordering of which
writeback wins: for a loadvm I think we first do a
cpu_synchronize_all_post_init() (writing back the counter
value from the migration data) and then after than we will
unpause the VM -- why doesn't this overwrite the correct
value with the wrong value from kvm_vtime ?

I just noticed also that the logic used in this patch
doesn't match what other architectures do in their vm_state_change
function -- eg cpu_ppc_clock_vm_state_change() has an
"if (running) { load } else { save }", and kvmclock_vm_state_change()
for i386 also has "if (running) { ... } else { ... }", though
it has an extra wrinkle where it captures "are we PAUSED?"
to use in the pre_save function; the comment above
kvmclock_pre_save() suggests maybe that would be useful for other
than x86, too. kvm_s390_tod_vm_state_change() has
logic that's a slightly more complicated variation on just
testing the 'running' flag, but it doesn't look at the
specific new state.

> > I note also that the commit message there had a remark
> > about inconsistencies between VCPUs -- is the right thing
> > to handle this per-VM rather than per-VCPU somehow?
>
> per-VM would make sense, because the counters should be synchronized
> among the VCPUs. KVM does that for us, though, so whichever VCPU last
> restores its counter is the one that will determine the final value.
>
> Maybe we should have a VM ioctl instead, but ATM we only have VCPU ioctls.

I meant more "only do the save/load once per VM in QEMU but
do it by working with just one VCPU". But I guess since migration
works on all the VCPUs we're ok to do pause-resume the same way
(and I've now tracked down what the 'inconsistentencies between VCPUs'
were: they're when we were syncing the CNT value for one vCPU when
others were still running.)

thanks
-- PMM
