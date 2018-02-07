Received: by 10.28.71.27 with SMTP id u27csp429609wma;
        Wed, 7 Feb 2018 00:52:52 -0800 (PST)
X-Google-Smtp-Source: AH8x2241i553yEzioGAIYBnF7SVBZXrLDfwYFRHW17WIZQJh1dqKuJ52rgpOy9uZkwK6bt1jtS1j
X-Received: by 10.37.65.23 with SMTP id o23mr337946yba.159.1517993572430;
        Wed, 07 Feb 2018 00:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517993572; cv=none;
        d=google.com; s=arc-20160816;
        b=EmgehI/NIn66qffFS5RXbb3EvJVi53SdOfncfQ/HcdosSUDZuipIvL7BjqJBqqpJM6
         plUBP0rjKrdFQI44GdTOEV5Kmok3jicOj6STOzElm8BJdiQDasMyAnJ3JB1or38KdXlA
         9QsH183IM/oGGAeQzTqvD4DsEz+RYkrLxxjashHVdsrwkdTi8lAmf7I5BKF+U9zbD0I3
         educLQHLVQlFiKdndj0kQiWabo0HjOmMP1EwfhOE83vnCRcL57xjQ9aVhuQj0fY1943m
         w3Fcp5KiewuVM2k8UL2G3cx445NCrOCQRA7yuPFQbXae4XfrA06x8Rk3ZEPmJzTKeswW
         JfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=tSoEgf9npxEcHrGZF0RfJVD92rO0ZNlaORzxw+BMVZ8=;
        b=0qUrtYEixuhM56EgFn86Do/YkqjvYqpdW6+Yak5qaYfVyQ8W7o9UY7qOetWoN7vFDI
         zQ0K5aV4tl7Z5Hi1yATAS7dVlGWCqt51CCbwcCl3qiGKJMbgmKCWmr+IM6JB6JftNzTx
         eBuvPL1PR0iyxud4AdjI+De/ZZa6M28skhqFSDhTDfWk7UBkbO2v6MPYC2axwPrszTZs
         OPBfXrPbH6iKUxT0ZwjeZ/VxGzz/P/DfkEcY66BuNb+oncYTJQZc9Lh6BJXZ0HJX8TP2
         N+7tUpzYOoAa3EV5nANBZlwIbCCf2gTEEnx680GN94aEps8aMUNVYYtgwQw7oz0AGxmv
         Ic6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w65si172681ywb.671.2018.02.07.00.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 00:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejLTH-00053O-Q3
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 03:52:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ejLT6-00052I-9T
	for qemu-arm@nongnu.org; Wed, 07 Feb 2018 03:52:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ejLT2-000477-Af
	for qemu-arm@nongnu.org; Wed, 07 Feb 2018 03:52:40 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55776 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ejLT2-00046f-3a; Wed, 07 Feb 2018 03:52:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4051740EC7E1;
	Wed,  7 Feb 2018 08:52:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DFA1208C178;
	Wed,  7 Feb 2018 08:52:26 +0000 (UTC)
Date: Wed, 7 Feb 2018 09:52:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180207095225.0400fce9@redhat.com>
In-Reply-To: <20180206223213.GG13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<20180206223213.GG13301@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 07 Feb 2018 08:52:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 07 Feb 2018 08:52:31 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 00/25] generalize parsing of
 cpu_model (part 4)
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tzr6W+MRWSfg

On Tue, 6 Feb 2018 20:32:13 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> I will try to summarize my comments here:

Thanks for review

> * I suggest squashing patches 2-22 together.  This way we
>   shouldn't have any intermediate commits where "make check"
>   generates warnings, and the series is shorter.
>   * Or, even better: squash the CPU_RESOLVING_TYPE parts of 3-22
>     into one patch, and the tests/machine-none-test.c parts of
>     3-22 into patch 2.
CPU_RESOLVING_TYPE parts we split to simplify review
for target maintainers.
I'll respin squashing them into one commit.

> 
> * The linux-user/main.c hunk of patch 03/25 looks unnecessary.
Indeed, I think it was a leftover slipped in from previous revision
where I was touching default cpus handling in *-user targets,
with the later dropped from series it's not needed.

> * I suggest testing all CPU models in patch 02/25, but this
>   shouldn't block the series.  Can be a follow-up patch.
the goal of the test is that refactoring didn't regress
'none' machine after following change in 23/25:

@@ -24,9 +24,9 @@ static void machine_none_init(MachineState *mch)
 {
     CPUState *cpu = NULL;
 
-    /* Initialize CPU (if a model has been specified) */
-    if (mch->cpu_model) {
-        cpu = cpu_init(mch->cpu_model);
+    /* Initialize CPU (if user asked for it) */
+    if (mch->cpu_type) {
+        cpu = cpu_create(mch->cpu_type);

for that it's sufficient to probe one cpu model.

We can do all cpus probing later if there will be need in it,
but that's not related to this series and would just waste
'make check' time if it won't be doing something meaningful
with probed cpu.

> All the rest looks good to me.
> 
> Thanks!
> 
> 
> On Tue, Jan 23, 2018 at 09:07:59AM +0100, Igor Mammedov wrote:
> > 
> > v3:
> >   - use qtest_startf() instead of qtest_start()
> >   - rename tests/machine-none.c to tests/machine-none-test.c
> >   - introduce first CPU_RESOLVING_TYPE for all targets and
> >     only then use it parse_cpu_model() 
> >   - stop abusing  mc->default_cpu_type as resolving cpu type,
> >     move cpu_parse_cpu_model() in to exec.c and embed in
> >     CPU_RESOLVING_TYPE, so that callers won't have to know
> >     about unnecessary detail
> > 
> > v2:
> >   - implemented new approach only for x86/ARM (will be done for all targets
> >     if approach seems acceptable)
> >   - add test case for '-M none -cpu FOO' case
> >   - redefine TARGET_DEFAULT_CPU_TYPE into CPU_RESOLVING_TYPE
> >   - scrape off default cpu_model refactoring, so it would cause
> >     less conflicts with Laurent's series where he tries to rework
> >     defaults to use ELF hints of executed program
> > 
> > Series is finishing work on generalizing cpu_model parsing
> > and limiting parts that deal with inconsistent cpu_model
> > naming to "-cpu" CLI option in vl.c, bsd|linux-user/main.c
> > CLI and default cpu_model processing and FOO_cpu_class_by_name()
> > callbacks.
> > 
> > It introduces CPU_RESOLVING_TYPE which must be defined
> > by each target and is used by helper parse_cpu_model()
> > (former cpu_parse_cpu_model()) to get access to target
> > specific FOO_cpu_class_by_name() callback.
> > 
> > git tree for testing:
> >    https://github.com/imammedo/qemu.git cpu_init_removal_v3
> > 
> > CC: Laurent Vivier <laurent@vivier.eu>
> > CC: Eduardo Habkost <ehabkost@redhat.com>
> > CC: qemu-s390x@nongnu.org
> > CC: qemu-ppc@nongnu.org
> > CC: qemu-arm@nongnu.org
> > 
> > Igor Mammedov (25):
> >   nios2: 10m50_devboard: replace cpu_model with cpu_type
> >   tests: add machine 'none' with -cpu test
> >   arm: cpu: add CPU_RESOLVING_TYPE macro
> >   x86: cpu: add CPU_RESOLVING_TYPE macro
> >   alpha: cpu: add CPU_RESOLVING_TYPE macro
> >   cris: cpu: add CPU_RESOLVING_TYPE macro
> >   lm32: cpu: add CPU_RESOLVING_TYPE macro
> >   m68k: cpu: add CPU_RESOLVING_TYPE macro
> >   microblaze: cpu: add CPU_RESOLVING_TYPE macro
> >   mips: cpu: add CPU_RESOLVING_TYPE macro
> >   moxie: cpu: add CPU_RESOLVING_TYPE macro
> >   nios2: cpu: add CPU_RESOLVING_TYPE macro
> >   openrisc: cpu: add CPU_RESOLVING_TYPE macro
> >   ppc: cpu: add CPU_RESOLVING_TYPE macro
> >   s390x: cpu: add CPU_RESOLVING_TYPE macro
> >   sh4: cpu: add CPU_RESOLVING_TYPE macro
> >   sparc: cpu: add CPU_RESOLVING_TYPE macro
> >   tricore: cpu: add CPU_RESOLVING_TYPE macro
> >   unicore32: cpu: add CPU_RESOLVING_TYPE macro
> >   xtensa: cpu: add CPU_RESOLVING_TYPE macro
> >   hppa: cpu: add CPU_RESOLVING_TYPE macro
> >   tilegx: cpu: add CPU_RESOLVING_TYPE macro
> >   Use cpu_create(type) instead of cpu_init(cpu_model)
> >   cpu: get rid of unused cpu_init() defines
> >   cpu: get rid of cpu_generic_init()
> > 
> >  include/qom/cpu.h         | 16 +-------
> >  target/alpha/cpu.h        |  3 +-
> >  target/arm/cpu.h          |  3 +-
> >  target/cris/cpu.h         |  3 +-
> >  target/hppa/cpu.h         |  2 +-
> >  target/i386/cpu.h         |  3 +-
> >  target/lm32/cpu.h         |  3 +-
> >  target/m68k/cpu.h         |  3 +-
> >  target/microblaze/cpu.h   |  2 +-
> >  target/mips/cpu.h         |  3 +-
> >  target/moxie/cpu.h        |  3 +-
> >  target/nios2/cpu.h        |  2 +-
> >  target/openrisc/cpu.h     |  3 +-
> >  target/ppc/cpu.h          |  3 +-
> >  target/s390x/cpu.h        |  3 +-
> >  target/sh4/cpu.h          |  3 +-
> >  target/sparc/cpu.h        |  5 +--
> >  target/tilegx/cpu.h       |  2 +-
> >  target/tricore/cpu.h      |  3 +-
> >  target/unicore32/cpu.h    |  3 +-
> >  target/xtensa/cpu.h       |  3 +-
> >  bsd-user/main.c           |  4 +-
> >  exec.c                    | 23 +++++++++++
> >  hw/core/null-machine.c    |  6 +--
> >  hw/nios2/10m50_devboard.c |  2 +-
> >  linux-user/main.c         | 10 +++--
> >  qom/cpu.c                 | 48 +----------------------
> >  tests/Makefile.include    |  2 +
> >  tests/machine-none-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
> >  vl.c                      | 10 ++---
> >  30 files changed, 162 insertions(+), 114 deletions(-)
> >  create mode 100644 tests/machine-none-test.c
> > 
> > -- 
> > 2.7.4
> > 
> >   
> 

