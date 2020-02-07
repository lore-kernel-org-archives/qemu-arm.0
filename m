Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp265062lfp;
        Thu, 6 Feb 2020 23:41:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3YXa92exe/01eiYRJUDlyGm4nkBnhbZjyCWqRcV0FW2jzFwEcj+YIOa4yMdWFiCmS2r1A
X-Received: by 2002:a37:91c2:: with SMTP id t185mr5609066qkd.284.1581061296117;
        Thu, 06 Feb 2020 23:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581061296; cv=none;
        d=google.com; s=arc-20160816;
        b=DqdTdOtAfylrHKZaOAt+edlyIW6SI7xt5Fg3Z9WHom8RDA9FfJXN8wCEebmxQ9RAWd
         CgKNI8PwrXi/yQ9i/9k3QZwwvRPbT3N4Ixk8WtdmUlXvm7rne+8mQdJGvw0cA3kBgRba
         ZaoK0MArv1cYr6V5gfBoxFEzgD02/+WghlyP+xWyS7ioYoia2rFCP5q1NmVOVSyw2MnF
         pgLyoULTBjuj6ZXd7JEp58wfCYcigTGplQRfF8eBTht2DBzHVHLpxYdSuvfe/N0G/Nf1
         L4gO4kAAWtgTYHkN+McbwC2/fDp8slAu8OP+msL/J6h80CAdWzI8JAPJe7/u1CgJzzk2
         ImCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=kymZeyzsMBFu4akHy7XEY6KLbUKfvwkYqe02J2j7VWw=;
        b=DT3CH/zP5wloNTqMW8cxsXjGTxnIlYnamJQOvfr55Q+HAtcd4yZuL/dykSdfi9sTtU
         /YhIiRnnd42XN1ulxN687H0ms0DtiPLieaj3X+gHnaigBm4kv+KfR3O0TVItFWqZatCP
         12BrdgGHTFl1V40cY5p7If/zBr2T5nQNIix5bKg82ZRV6Vypfm3QEMEehFhTQIoBakWp
         lUs5Q24P3P2f7K0RHi8MAZPeZKb5HuX/tmuNTJCphbDCeCQDzHXWxNw0vLdFql7gT+rz
         ktH0AVmYPmrLrsUNybdHrX8Jc2R6h3vESpzB59M519rw0/nrePRT+PRY8+Z97gLcqWjY
         Cwng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=eomoCohj;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id x10si1054000qth.16.2020.02.06.23.41.35;
        Thu, 06 Feb 2020 23:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=eomoCohj;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A1A384A4E5;
	Fri,  7 Feb 2020 02:41:35 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYC-c7AWMbNQ; Fri,  7 Feb 2020 02:41:32 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 39D124A4F7;
	Fri,  7 Feb 2020 02:41:32 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 54CA64A4A9
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Feb 2020 02:41:31 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rS806BcBzx+L for <kvmarm@lists.cs.columbia.edu>;
 Fri,  7 Feb 2020 02:41:30 -0500 (EST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 408624A4A3
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Feb 2020 02:41:30 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8+dV5qOgRpncSSzSUiwmdaiC4cKdUtEBCRqg7fQpDw=;
 b=eomoCohjmGL553yE/zsW7t+el2Xq3Njoee8mRTfyKrpzOsvTDtmJ0mZgpWpzpzYO/cH3Fo
 apKswc5cPcYLdABHCnAR5ZFVFUYzjSNo3HIBeKc4y9P/n4VwUgeX2UvzQrfSHSME7VW0BR
 BAZwDnbzgkwHSMiKuQv22Q54GOs4AVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-x4rM60IcNg6d6naFPLjCbQ-1; Fri, 07 Feb 2020 02:41:25 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75396801E6C;
 Fri,  7 Feb 2020 07:41:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC0771000325;
 Fri,  7 Feb 2020 07:41:22 +0000 (UTC)
Date: Fri, 7 Feb 2020 08:41:20 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v2 1/2] target/arm: kvm: Inject events at the last stage
 of sync
Message-ID: <20200207074120.emuqo4syqubpay4k@kamzik.brq.redhat.com>
References: <20200129202441.12745-1-beata.michalska@linaro.org>
 <20200129202441.12745-2-beata.michalska@linaro.org>
 <20200204103447.naw26xl2y2zbyrqb@kamzik.brq.redhat.com>
 <CADSWDzuQvZThaoFbeYM2QrDbwRPrZuiyDrVJV=jxiSMTW9O-rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADSWDzuQvZThaoFbeYM2QrDbwRPrZuiyDrVJV=jxiSMTW9O-rg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: x4rM60IcNg6d6naFPLjCbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: cTRTo0pZpIQy

On Thu, Feb 06, 2020 at 09:41:10PM +0000, Beata Michalska wrote:
> On Tue, 4 Feb 2020 at 10:34, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Wed, Jan 29, 2020 at 08:24:40PM +0000, Beata Michalska wrote:
> > > KVM_SET_VCPU_EVENTS might actually lead to vcpu registers being modified.
> > > As such this should be the last step of sync to avoid potential overwriting
> > > of whatever changes KVM might have done.
> > >
> > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > ---
> > >  target/arm/kvm32.c | 20 ++++++++++----------
> > >  target/arm/kvm64.c | 20 ++++++++++----------
> > >  2 files changed, 20 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> > > index 32bf8d6..cf2b47f 100644
> > > --- a/target/arm/kvm32.c
> > > +++ b/target/arm/kvm32.c
> > > @@ -386,17 +386,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
> > >          return ret;
> > >      }
> > >
> > > -    ret = kvm_put_vcpu_events(cpu);
> > > -    if (ret) {
> > > -        return ret;
> > > -    }
> > > -
> > >      write_cpustate_to_list(cpu, true);
> > >
> > >      if (!write_list_to_kvmstate(cpu, level)) {
> > >          return EINVAL;
> > >      }
> > >
> > > +    ret = kvm_put_vcpu_events(cpu);
> > > +    if (ret) {
> > > +        return ret;
> > > +    }
> > > +
> >
> > I think we should put a comment above this that says basically the same
> > thing as the commit message in order to explain why kvm_put_vcpu_events()
> > *must* be after write_list_to_kvmstate().
> >
> Will do that.
> 
> > >      kvm_arm_sync_mpstate_to_kvm(cpu);
> > >
> > >      return ret;
> > > @@ -462,11 +462,6 @@ int kvm_arch_get_registers(CPUState *cs)
> > >      }
> > >      vfp_set_fpscr(env, fpscr);
> > >
> > > -    ret = kvm_get_vcpu_events(cpu);
> > > -    if (ret) {
> > > -        return ret;
> > > -    }
> > > -
> > >      if (!write_kvmstate_to_list(cpu)) {
> > >          return EINVAL;
> > >      }
> > > @@ -475,6 +470,11 @@ int kvm_arch_get_registers(CPUState *cs)
> > >       */
> > >      write_list_to_cpustate(cpu);
> > >
> > > +    ret = kvm_get_vcpu_events(cpu);
> > > +    if (ret) {
> > > +        return ret;
> > > +    }
> > > +
> >
> > Why are we moving kvm_get_vcpu_events()?
> 
> This is only to make things consistent with put_registeres.
> There is no functional change per se.

Without a functional change I wouldn't move it. It's much
more appealing to have the final state writes at the bottom
of this function.

Thanks,
drew

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
