Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2564093lfb;
        Fri, 27 Nov 2020 08:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6FoRkqSRZjz3qSFZAwIjDH809EL4yV85NRHkvy5Y2OcCYXbt+TQA6SHFKcjyAYm/AXqRH
X-Received: by 2002:a25:d94:: with SMTP id 142mr10189733ybn.258.1606494412198;
        Fri, 27 Nov 2020 08:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606494412; cv=none;
        d=google.com; s=arc-20160816;
        b=DFrzXVfKJ5MyN4/TCDvgRcSTB2IcjZxGgpu+ju168/cGcn1gGHvKnjzX3xQwLNAFlz
         AIRGYmXBrDBEAYTvYr5vDr3XE1ur5jQBJ83477OzCmbG2osU+YtBTjxVI88oR0tXr+NB
         0PzyCQ0jV4oMZVPBdzFbRgLNYWTuxx5Nn+pT88zb6Mv7pfARffHV3YQPN0ONat+dXso6
         9Du2neWYGdRdqTNeNp83WNAfeSVbouRiSjUftV1hhEiCwq+LCLp/XHW9rWJxA1mPEyq7
         UUbX1Ou2SPAHU4+i3G04s0mNgNvKhdc3WF988yJhqcCuv4zlwwXK8XHIVqttX79hpqqo
         mK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TrvBDi9yZGeY5Vbt3RGNQX372OakVVQv1ebR/1++2uo=;
        b=hykBOoOf7xTvJZewPjIhM1wf6ziGfFaUcFYeg22nUZHqFcFsDJxxqT2XHt+iVZdY0H
         P1jUp31AHrzG+5tj/hstZKGIiXHtZ2df8M32ksZBxVJdbCLctdm670g75dqttRT8lQ0L
         S4FkYUdyK/OnVL9ti4l0fmWzrsmSb91/bWJnUQfrj+6iZdAL0QPjPo/ikAyvxt4p5VKB
         W0SYmYnKPglgH5frgyOsLxLiLQ/iT8GIA3gaziGzFZtJQg/EnncV0glJTCslXmqfs9/v
         5QlM9tB/1guRo3oIQnbEc7Vxhi0enFrkJUdYEBNJpuXZYjNldJ6EguroG7Ypco7ZDv0A
         0wmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y2xe7mhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si13436952ybg.360.2020.11.27.08.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 08:26:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y2xe7mhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kigaB-00025s-FB
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 11:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiga2-00025B-GM
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 11:26:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiga0-0001ic-Tp
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 11:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606494399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TrvBDi9yZGeY5Vbt3RGNQX372OakVVQv1ebR/1++2uo=;
 b=Y2xe7mhSiTRzOJEnQzj0Uja83IoOcRyRNucX3QkAYHG7CLXdHr7ULWwj7SpcIsS1ze/3Fe
 Vcz4TpFtD/SUscVCHn7n8MesT/YVBI5VCyGarAxABs7QoCYpAIczD6q5N8GvoHIdJNyRcB
 zcmfC7ZT75qZjlOWqJhhHQiLcqFhAnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-jiQkH88kN--0iwqy45zqVA-1; Fri, 27 Nov 2020 11:26:36 -0500
X-MC-Unique: jiQkH88kN--0iwqy45zqVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2FD910066FC;
 Fri, 27 Nov 2020 16:26:34 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 395495C1C2;
 Fri, 27 Nov 2020 16:26:34 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:26:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127162633.GY2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CmFS9wV9VZT

On Thu, Nov 26, 2020 at 10:29:01PM +0000, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 22:14, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Thu, Nov 26, 2020 at 10:50:17PM +0100, Alexander Graf wrote:
> > > The Apple M1 only supports up to 36 bits of physical address space. That
> > > means we can not fit the 64bit MMIO BAR region into our address space.
> > >
> > > To fix this, let's not expose a 64bit MMIO BAR region when running on
> > > Apple Silicon.
> > >
> > > I have not been able to find a way to enumerate that easily, so let's
> > > just assume we always have that little PA space on hypervisor.framework
> > > systems.
> > >
> > > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > > ---
> > >  hw/arm/virt.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 27dbeb549e..d74053ecd4 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -45,6 +45,7 @@
> > >  #include "hw/display/ramfb.h"
> > >  #include "net/net.h"
> > >  #include "sysemu/device_tree.h"
> > > +#include "sysemu/hvf.h"
> > >  #include "sysemu/numa.h"
> > >  #include "sysemu/runstate.h"
> > >  #include "sysemu/sysemu.h"
> > > @@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
> > >      unsigned int smp_cpus = machine->smp.cpus;
> > >      unsigned int max_cpus = machine->smp.max_cpus;
> > >
> > > +    /*
> > > +     * On Hypervisor.framework capable systems, we only have 36 bits of PA
> > > +     * space, which is not enough to fit a 64bit BAR space
> > > +     */
> > > +    if (hvf_enabled()) {
> > > +        vms->highmem = false;
> > > +    }
> >
> > Direct checks for *_enabled() are a pain to clean up later when
> > we add support to new accelerators.  Can't this be implemented as
> > (e.g.) a AccelClass::max_physical_address_bits field?
> 
> It's a property of the CPU (eg our emulated TCG CPUs may have
> varying supported numbers of physical address bits). So the
> virt board ought to look at the CPU, and the CPU should be
> set up with the right information for all of KVM, TCG, HVF
> (either a specific max_phys_addr_bits value or just ensure
> its ID_AA64MMFR0_EL1.PARange is right, not sure which would
> be easier/nicer).

Agreed.

My suggestion would still apply to the CPU code that will pick
the address size; ideally, accel-specific behaviour should be
represented as meaningful fields in AccelClass (either data or
virtual methods) instead of direct *_enabled() checks.

-- 
Eduardo

