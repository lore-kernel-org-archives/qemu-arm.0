Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4827913lff;
        Mon, 16 Dec 2019 09:15:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqweDQ1k45dDYv77RZXTQ0cqoH3jBNSZaja9jhi8CXZzqFJXxbYGw1mQ8ZYmHyzgE1laFX00
X-Received: by 2002:a37:9bc2:: with SMTP id d185mr307027qke.422.1576516547836;
        Mon, 16 Dec 2019 09:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576516547; cv=none;
        d=google.com; s=arc-20160816;
        b=x3WV8HxGT2Y+iTPbZcyOOMG6DiZ8QMxlO6OOOYg4JrGjGRoCbXXZQvxE+cBI+I9wMJ
         rt5gR+QIv8xjvPlOgZEQMYZ13Z6VmCkndjF2WJ7nMsMDn9fQafuEydogAz93TQ5fsdFO
         zuOqbQzve8ggdhTDzu9fQeHwnBHSAG7u5jtCzQ/0ODD4pcS/IjcE1BC7jjQ6vag3l3hs
         6q1KQRWqwC9QxwMSu6PixYLHW+QDsdlpAtEDkkrXl1uIiiQVdieq8WMM2vOaAVp5R8h4
         JnyTnF+UH8RNodLBhOBLPawqJVczQ/pur60uzja+0p+FHB4u6RVyVa6UObEI2u1rOTy6
         wC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=b6rU/7SFMPtpuUaSJZL4ZvKzOzPSprKptVNDJXTPh9c=;
        b=Ngyqu2AudhO+zT1InW6xOpe8FZ80cNq27iWNqu2YbKJ2GNhpEk8nP2/HEH803k2BBE
         Q7qXnCQwVjKwnf1zA2wV3Z6+nSByuJRTywcn5yaGkm7Xbm+W1NjBHbIxBkSOphIPdVS+
         U3zhbyWV4D78PJsNl6I/i8ZRaP1m3PtLSYcFprbDi2oI10QB8DcTnhyv1t8SekwKhaJE
         /diaik9S1YBClqfVIuLYtm7TR/RzXF8Hy8muxplz1ZJdxp/wApvcVgon5tPt2IGTPHfq
         9M8YwpIdf6uiY5M+QMf7FKoP62jV9Fd16K+fcjHf16Sm5v8yiIbwAPkgGEPUdA7JoNcv
         l1Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pt3XpgE3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si9633529qti.48.2019.12.16.09.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 09:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pt3XpgE3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igtyE-0004bv-M0
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 12:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1igtM6-0005Qj-Jt
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:36:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1igtM3-0001rB-BB
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:36:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31430
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1igtM3-0001oa-20
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576514177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6rU/7SFMPtpuUaSJZL4ZvKzOzPSprKptVNDJXTPh9c=;
 b=Pt3XpgE3nmgcBt1ke/CUnvLfLRHetfpAA9rJ8YeJtUkBVjLJiyoeSuBy8NoxDo+EP74dux
 Cee+xcnnUCOU0UUdBaLjE5gaNc0WeiQW6NyOl7jpLMngxxOkwp7gIwAyhhzqwSLh2SE6Ic
 dI2gkhPAwR/cxrc8uPUoznYYd/GrBkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-OiXZFFJTMHGYhotQ9JwFmw-1; Mon, 16 Dec 2019 11:36:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2177A1809A46;
 Mon, 16 Dec 2019 16:36:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-122.ams2.redhat.com
 [10.36.116.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF21D605C9;
 Mon, 16 Dec 2019 16:36:07 +0000 (UTC)
Date: Mon, 16 Dec 2019 17:36:04 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 3/5] target/arm/kvm: Implement virtual time
 adjustment
Message-ID: <20191216163604.wje5q2mvtytxjqoy@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-4-drjones@redhat.com>
 <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: OiXZFFJTMHGYhotQ9JwFmw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mIU1lmhWS9WV

On Mon, Dec 16, 2019 at 03:14:00PM +0000, Peter Maydell wrote:
> On Thu, 12 Dec 2019 at 17:33, Andrew Jones <drjones@redhat.com> wrote:
> >
> > When a VM is stopped (guest is paused) guest virtual time
> > should stop counting. Otherwise, when the VM is resumed it
> > will experience time jumps and its kernel may report soft
> > lockups. Not counting virtual time while the VM is stopped
> > has the side effect of making the guest's time appear to lag
> > when compared with real time, and even with time derived from
> > the physical counter. For this reason, this change, which is
> > enabled by default, comes with a KVM CPU feature allowing it
> > to be disabled, restoring legacy behavior.
> >
> > This patch only provides the implementation of the virtual
> > time adjustment. A subsequent patch will provide the CPU
> > property allowing the change to be enabled and disabled.
> >
> > Reported-by: Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.h     |  9 +++++++++
> >  target/arm/kvm.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++
> >  target/arm/kvm32.c   |  3 +++
> >  target/arm/kvm64.c   |  3 +++
> >  target/arm/kvm_arm.h | 23 +++++++++++++++++++++
> >  5 files changed, 86 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 83a809d4bac4..a79ea74125b3 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -821,6 +821,15 @@ struct ARMCPU {
> >      /* KVM init features for this CPU */
> >      uint32_t kvm_init_features[7];
> >
> > +    /* KVM CPU features */
> > +    bool kvm_adjvtime;
> > +
> > +    /* VCPU virtual counter value used with kvm_adjvtime */
> > +    uint64_t kvm_vtime;
>=20
> How does this new state interact with migration ?

I don't think we should need to worry about this state, because migration
will do its own save/restore of the virtual counter, and as that restore
comes later, it'll take precedence. We still need this state for the usual
save/restore when not migrating, though, because KVM_REG_ARM_TIMER_CNT is
a non-runtime cpreg with its level set to KVM_PUT_FULL_STATE.

>=20
> > +
> > +    /* True if the run state is, or transitioning from, RUN_STATE_PAUS=
ED */
> > +    bool runstate_paused;
> > +
> >      /* Uniprocessor system with MP extensions */
> >      bool mp_is_up;
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 5b82cefef608..a55fe7d7aefd 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -348,6 +348,24 @@ void kvm_arm_register_device(MemoryRegion *mr, uin=
t64_t devid, uint64_t group,
> >      memory_region_ref(kd->mr);
> >  }
> >
> > +void kvm_arm_vm_state_change(void *opaque, int running, RunState state=
)
> > +{
> > +    CPUState *cs =3D opaque;
> > +    ARMCPU *cpu =3D ARM_CPU(cs);
> > +
> > +    if (running) {
> > +        if (cpu->kvm_adjvtime && cpu->runstate_paused) {
> > +            kvm_arm_set_virtual_time(cs, cpu->kvm_vtime);
> > +        }
> > +        cpu->runstate_paused =3D false;
> > +    } else if (state =3D=3D RUN_STATE_PAUSED) {
> > +        cpu->runstate_paused =3D true;
> > +        if (cpu->kvm_adjvtime) {
> > +            kvm_arm_get_virtual_time(cs, &cpu->kvm_vtime);
> > +        }
> > +    }
> > +}
>=20
> How does this interact with the usual register sync to/from
> KVM (ie kvm_arch_get_registers(), which I think will do a
> GET_ONE_REG read of the TIMER_CNT register the way it does
> any other sysreg, inside write_kvmstate_to_list(), plus
> kvm_arch_set_registers() which does the write back to the
> kernel in write_list_to_kvmstate()) ?

It will, but only when level =3D=3D KVM_PUT_FULL_STATE.


> Presumably we want this
> version to take precedence by the set_virtual_time call
> happening after the kvm_arch_set_registers, but is this
> guaranteed ?

Actually it doesn't really matter which takes precedence (I don't think),
which is why we can rely on the usual save/restore for migration. We only
need the new state this patch adds because we don't have any recent state
otherwise, and because then we can be selective and only do the
save/restore when transitioning to/from paused state.

Thanks,
drew

