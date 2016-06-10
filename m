Received: by 10.25.27.66 with SMTP id b63csp241424lfb;
        Fri, 10 Jun 2016 04:39:16 -0700 (PDT)
X-Received: by 10.237.48.45 with SMTP id 42mr1243409qte.7.1465558756316;
        Fri, 10 Jun 2016 04:39:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f21si6041970qkh.99.2016.06.10.04.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 04:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBKmR-0000V0-Rf
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 07:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bBKmN-0000Ue-Kh
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 07:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bBKmK-0004W1-Dy
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 07:39:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bBKmK-0004Vx-62; Fri, 10 Jun 2016 07:39:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9FD9C04D296;
	Fri, 10 Jun 2016 11:39:06 +0000 (UTC)
Received: from localhost (vpn1-7-122.gru2.redhat.com [10.97.7.122])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ABd5Aa016189; Fri, 10 Jun 2016 07:39:06 -0400
Date: Fri, 10 Jun 2016 08:39:04 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160610113904.GF18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-4-git-send-email-imammedo@redhat.com>
	<20160609183430.GC17952@thinpad.lan.raisama.net>
	<20160610091544.67b6a69a@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160610091544.67b6a69a@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 10 Jun 2016 11:39:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/10] target-i386: cpu: move
 xcc->kvm_required check to realize time
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJ4+MYiOWSgV

On Fri, Jun 10, 2016 at 09:15:44AM +0200, Igor Mammedov wrote:
> On Thu, 9 Jun 2016 15:34:30 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Mon, Jun 06, 2016 at 05:16:45PM +0200, Igor Mammedov wrote:
> > > it will allow to drop custom cpu_x86_init() and use
> > > cpu_generic_init() insteadi, reducing cpu_x86_create()
> > > to a simple 3-liner.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Eduardo Habkost <ehabkost@redhat.com>  
> > 
> > This triggers an assert when trying to use -cpu host with TCG:
> > 
> >   # ./x86_64-softmmu/qemu-system-x86_64 -machine accel=tcg -cpu host -nographic
> >   qemu-system-x86_64: /root/qemu/target-i386/cpu.c:1558: host_x86_cpu_initfn: Assertion `(kvm_allowed)' failed.
> >   Aborted
> This is not related to this patch and it was there before.

It is caused by this patch. The assert() was there, but you
removed the check on cpu_x86_create() that prevented it from
being triggered.

> 
> Maybe a separate patch saying that it replaces assert() in
> host_x86_cpu_initfn() with error check and user friendly
> error message at later stage.

We could apply the fix below as a separate patch before 03/10, or
just squash the fix in it. What do you think? (We can't do it as
a follow-up patch.)

If you prefer to suggest another fix, I will remove the series
from x86-next and wait for v3.

> 
> > 
> > I will squash the following fix in it:
> > 
> > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > index 3f886a5..dcbfa0b 100644
> > --- a/target-i386/cpu.c
> > +++ b/target-i386/cpu.c
> > @@ -1555,16 +1555,17 @@ static void host_x86_cpu_initfn(Object *obj)
> >      CPUX86State *env = &cpu->env;
> >      KVMState *s = kvm_state;
> >  
> > -    assert(kvm_enabled());
> > -
> >      /* We can't fill the features array here because we don't know yet if
> >       * "migratable" is true or false.
> >       */
> >      cpu->host_features = true;
> >  
> > -    env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
> > -    env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
> > -    env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
> > +    /* If KVM is disabled, x86_cpu_realizefn() will report an error later */
> > +    if (kvm_enabled()) {
> > +        env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
> > +        env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
> > +        env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
> > +    }
> >  
> >      object_property_set_bool(OBJECT(cpu), true, "pmu", &error_abort);
> >  }
> > 
> 

-- 
Eduardo
