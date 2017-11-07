Received: by 10.223.150.237 with SMTP id u100csp3720660wrb;
        Tue, 7 Nov 2017 04:32:11 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SKpucSVZw6ju7h+xFuJmHyE7WLOTgSmbgy5Aq3sYVvVwsboEB/olh02uCIp3NFFR3LTiMe
X-Received: by 10.37.11.72 with SMTP id 69mr12284199ybl.226.1510057931279;
        Tue, 07 Nov 2017 04:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510057931; cv=none;
        d=google.com; s=arc-20160816;
        b=dDne4Vf5wBxnt/+eYz/DMqQ7/VDBks6VS1YO+bCiVU3Yy57+O9Eftoa1kwaxzCqUvv
         5YZ71z//afUAuQ++Z4pljIr/qOTqnB1MM7hr2Vqa/fNdIti1/q+scMltRwz6K3QQXPz5
         4U5u45XhKh8CQQunouVCITPhKlcF8pg3Y/7NUZZzb004M5apfX/IEEfTH+RkSJOhc3QZ
         Mk6ASLztKedqbAVhpv1HhiC6FUpxOU1B65VrFj5fcHYGXsCSVqJ2CCgAgUhEeIpF8rLI
         BqbRvL71jsvyNNrDv1bYUMJfC70GGBhXrEE664Pav1uXSYWqhgmsFnBe3Gw+evjXrFF9
         0pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=mFUt4xFauxVLJPi9ZJChJrYS8Lm2eCvdn6xP+osg/so=;
        b=xiIlKbViJV0EXy9gKNPhR6pT/Sme0/IobpgvWQbEdy0hzRNtPjmTTtf+qlkpwghlZl
         SRg0DHo9tYHtRfT4/pINXmYMfp1m/K9HX5j7pyDG7NJrfD3NqnNZXZK1pvWh9WfQxIoZ
         RXPds2j4WRkryQtxWQoS2GwTHChYWgmmTUFcUZJKpdCDGQ4J6dcsuavvp+eTr7TuSWti
         9Tc0h1c15DyAdtIDfOEdNHgO05DimLJ4g5QspgRka5AARUr7M+ie7Bzfc/11fNDNfrJM
         R/g3MPPQYXjit59bljLNJxFvXx2CDjUfINHVl9N6v1HDC8Qi/EVIv3l1rO8Bhfc8l0LU
         iFTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14si238798ybn.522.2017.11.07.04.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 04:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC334-0000ic-PW
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 07:32:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eC32s-0000hq-2G
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 07:32:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eC32p-0000TR-D3
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 07:31:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eC32p-0000Ss-4P; Tue, 07 Nov 2017 07:31:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA5C1A999;
	Tue,  7 Nov 2017 12:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EA5C1A999
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E43EC60C90;
	Tue,  7 Nov 2017 12:31:50 +0000 (UTC)
Date: Tue, 7 Nov 2017 10:31:49 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171107123149.GZ3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106201332.GA2152@flamenco>
	<CAKmqyKO41gHX1Y0+rq8wMygf+ZoZLvOJPzqhfviPsgbDGHecsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKO41gHX1Y0+rq8wMygf+ZoZLvOJPzqhfviPsgbDGHecsQ@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 Nov 2017 12:31:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fe3TsQt97vqi

On Mon, Nov 06, 2017 at 04:43:34PM -0800, Alistair Francis wrote:
> On Mon, Nov 6, 2017 at 12:13 PM, Emilio G. Cota <cota@braap.org> wrote:
> > On Mon, Nov 06, 2017 at 12:10:22 -0200, Eduardo Habkost wrote:
> >> IMO, initialization state doesn't belong to CPUClass.  We already
> >> have a single accelerator object in MachineState::accelerator,
> >> and tcg_initialized could be moved to a AccelState::initialized
> >> field.
> >
> > I don't know how to cleanly get AccelState from a CPUClass pointer
> > (as I said I'm not familiar with object code / qom) -- suggestions
> > welcome! The best I could come up in the limited time I have for
> > this is to use a static bool, as shown below.

I don't believe a TYPE_ACCEL object is created in *-user.  We can
consider changing that, but not during 2.11 freeze.

> >
> >
> > ---8<---
> >
> > Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global
> >
> > 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> > introduces a per-CPUClass bool that we check so that the target CPU
> > is initialized for TCG only once. This works well except when
> > we end up creating more than one CPUClass, in which case we end
> > up incorrectly initializing TCG more than once, i.e. once for
> > each CPUClass.
> >
> > This can be replicated with:
> >   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
> >       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> > In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
> > whereas the "regular" CPUs are prefixed by "cortex-a53-". This
> > results in two CPUClass instances being created.
> >
> > Fix it by introducing a static variable, so that only the first
> > target CPU being initialized will initialize the target-dependent
> > part of TCG, regardless of CPUClass instances.
> >
> > Fixes: 55c3ceef61fcf06fc98ddc752b7cce788ce7680b
> > Signed-off-by: Emilio G. Cota <cota@braap.org>
> 
> This works great for me, is this ok to be applied?

It depends if we are already relying on initialization of CPUs of
different types to be calling two different ->tcg_initialize()
functions.  I think that's the case today, so this looks
reasonable as a quick fix for 2.11.

I would wait for an Acked-by from Richard Henderson before
applying it, though.  Richard, what do you think?

> 
> Thanks,
> Alistair
> 
> > ---
> >  exec.c            | 5 +++--
> >  include/qom/cpu.h | 1 -
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/exec.c b/exec.c
> > index 97a24a8..8b579c0 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -792,11 +792,12 @@ void cpu_exec_initfn(CPUState *cpu)
> >  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
> >  {
> >      CPUClass *cc = CPU_GET_CLASS(cpu);
> > +    static bool tcg_target_initialized;
> >
> >      cpu_list_add(cpu);
> >
> > -    if (tcg_enabled() && !cc->tcg_initialized) {
> > -        cc->tcg_initialized = true;
> > +    if (tcg_enabled() && !tcg_target_initialized) {
> > +        tcg_target_initialized = true;
> >          cc->tcg_initialize();
> >      }
> >
> > diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> > index fa4b0c9..c2fa151 100644
> > --- a/include/qom/cpu.h
> > +++ b/include/qom/cpu.h
> > @@ -209,7 +209,6 @@ typedef struct CPUClass {
> >      /* Keep non-pointer data at the end to minimize holes.  */
> >      int gdb_num_core_regs;
> >      bool gdb_stop_before_watchpoint;
> > -    bool tcg_initialized;
> >  } CPUClass;
> >
> >  #ifdef HOST_WORDS_BIGENDIAN
> > --
> > 2.7.4
> >
> >

-- 
Eduardo
