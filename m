Received: by 10.28.173.206 with SMTP id w197csp6980336wme;
        Thu, 18 Jan 2018 12:36:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBovD8c+2IHlUtCRQ54wprVFDZlFbR2uzkqz+MzLk1CBKJ3mZTmZHXgAJm/J0MyMTZob995Xa
X-Received: by 10.37.142.11 with SMTP id p11mr16846272ybl.246.1516307765949;
        Thu, 18 Jan 2018 12:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516307765; cv=none;
        d=google.com; s=arc-20160816;
        b=S+RO2S24KKrGD231dmnfB+Y7Ww/4u7uW7oOF1YgPPVrKN9n3CwkgN7JRcDPUOIwZKj
         g7KyWwV6lfxhnUN2Mk+HqWuLftFDuvd2pbsQZUFsxjbMH+Iwc/KoMme5NAtE6cXut6uu
         guWWjJEuMiwDrUYj3A9pgBpt8WvWl5u2QXG/wXEv/HoWK17A6oox7JZ3MqI8dHnIp6OM
         1NfjgBZEff7EYtgNZOWM1b7f0cSUWsceEmrdP+dNU4vG58AAcuHsKWCAuW4pSE0xrmv3
         bP2lrsu6lnnSlsnlsTc4WNGDhkre+IY1U9mG+egCu2d2IrDSgdKhr7s3CbNabDt3Plpq
         Nt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=VfcLtPNID8EynzilO6MUKBva2B6eisqrGH7hKWCMPmE=;
        b=KRSNrOXjVUhUCQ2wvfd6H0xo4CxESaTRDYlfYVt7OG7dbu/F6G4/TwJOEWsTKW4tom
         5bw/KGYmHiJCOICDxM9Y0+pOS1iu00OTLwOTzziF9Wy1SsnROefhkI+p5renDWO8wl/m
         1qb+ZXF7bs9aMP+ibGVXBuyby1novavCl/xLa3nDCAnn2GNzo+893jE5Dt1gPzw+MH6L
         txhiHXUS2YbMrSWJSrtlITmTSZQeEW73c/WG7ESganG+Bk7QQZzY0tDBMjyrVZ1mdbjk
         9uNn/kFl7YuX6mawFNA0RB6BaMocQWHnl6eAAx7qCTch8UyV5DxXjg7gJ4Zw+HF3zYuB
         +SHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80si1898300ywe.604.2018.01.18.12.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecGur-00073u-CO
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecGuh-00072z-8O
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecGue-0004UG-5F
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:35:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ecGud-0004TE-S9; Thu, 18 Jan 2018 15:35:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0B2FCD264;
	Thu, 18 Jan 2018 20:35:50 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74BA85DD6C;
	Thu, 18 Jan 2018 20:35:48 +0000 (UTC)
Date: Thu, 18 Jan 2018 18:35:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180118203546.GF5292@localhost.localdomain>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-3-git-send-email-imammedo@redhat.com>
	<33aa0c19-59ec-7063-f638-884fe2249aee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33aa0c19-59ec-7063-f638-884fe2249aee@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 18 Jan 2018 20:35:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [RFC v2 2/5] machine: prepare machine
 'none' to gradually switch to cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /crB/rhB4X8z

On Thu, Jan 18, 2018 at 08:06:03PM +0100, Thomas Huth wrote:
> On 18.01.2018 18:33, Igor Mammedov wrote:
> > temporarily add #ifdef CPU_RESOLVING_TYPE in null-machine.c,
> > so that each target could gradually switch to cpu_create() and
> > not converted yet could continue to use cpu_init().
> > 
> > Once all targets are converted
> >    temporary ifdefs, MachineState::cpu_model and cpu_init() API
> > will be removed
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/core/null-machine.c | 13 ++++++++++++-
> >  vl.c                   |  8 +++++++-
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> > index 864832d..3cc6a49 100644
> > --- a/hw/core/null-machine.c
> > +++ b/hw/core/null-machine.c
> > @@ -23,10 +23,18 @@
> >  static void machine_none_init(MachineState *mch)
> >  {
> >      CPUState *cpu = NULL;
> > +#ifdef CPU_RESOLVING_TYPE
> > +    MachineClass *mc = MACHINE_GET_CLASS(mch);
> >  
> > -    /* Initialize CPU (if a model has been specified) */
> > +    /* Initialize CPU if cpu_type pointer is user provided
> > +     * (i.e. != to pointer tot static default cpu type string)
> 
> s/tot/to/ ?
> 
> > +     */
> > +    if (mch->cpu_type != mc->default_cpu_type) {
> > +        cpu = cpu_create(mch->cpu_type);
> > +#else
> >      if (mch->cpu_model) {
> >          cpu = cpu_init(mch->cpu_model);
> > +#endif
> >          if (!cpu) {
> >              error_report("Unable to initialize CPU");
> >              exit(1);
> > @@ -54,6 +62,9 @@ static void machine_none_machine_init(MachineClass *mc)
> >      mc->init = machine_none_init;
> >      mc->max_cpus = 1;
> >      mc->default_ram_size = 0;
> > +#ifdef CPU_RESOLVING_TYPE
> > +    mc->default_cpu_type = CPU_RESOLVING_TYPE;
> > +#endif

As mentioned in a reply to a previous series, this is making
mc->default_cpu_type lie about the default CPU type.  If vl.c is
relying on default_cpu_type to parse the CPU data, I'd like to
fix vl.c first instead of adding this hack.

> >  }
> >  
> >  DEFINE_MACHINE("none", machine_none_machine_init)
> > diff --git a/vl.c b/vl.c
> > index 2586f25..8aa0131 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -4609,7 +4609,6 @@ int main(int argc, char **argv, char **envp)
> >      current_machine->maxram_size = maxram_size;
> >      current_machine->ram_slots = ram_slots;
> >      current_machine->boot_order = boot_order;
> > -    current_machine->cpu_model = cpu_model;
> >  
> >      parse_numa_opts(current_machine);
> >  
> > @@ -4619,6 +4618,13 @@ int main(int argc, char **argv, char **envp)
> >          if (cpu_model) {
> >              current_machine->cpu_type =
> >                  cpu_parse_cpu_model(machine_class->default_cpu_type, cpu_model);
> > +
> > +            /* machine 'none' depends on default cpu type pointer not being
> > +             * equal to resolved type name pointer to fugure out if type was
> 
> s/fugure/figure/
> 
> > +             * user provided, make sure that if it becomes not true in future
> > +             * it won't beark silently */
> 
> s/beark/break/
> 
> > +            g_assert(
> > +                current_machine->cpu_type != machine_class->default_cpu_type);
> >          }
> >      }
> 
>  Thomas
> 
> 

-- 
Eduardo
