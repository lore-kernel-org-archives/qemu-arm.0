Received: by 10.28.71.27 with SMTP id u27csp4338405wma;
        Tue, 6 Feb 2018 14:34:08 -0800 (PST)
X-Google-Smtp-Source: AH8x225wk61M5wHq6JNFHiULeCJ146X4c0XgnnJOE6vfewcn9sxRfa0XzDFOM6LZJixhZhIH19ZM
X-Received: by 10.37.22.195 with SMTP id 186mr2592887ybw.300.1517956448148;
        Tue, 06 Feb 2018 14:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517956448; cv=none;
        d=google.com; s=arc-20160816;
        b=diFb/E4xBCIvfq8HAPGj1WAByjhmpl/K9fJXSKrmihQqSvdwg4n5wSLo7axDD0jJ6V
         oaFkhsK1ZKG2yFiW9BjMsXw9OF9eHuA5x6+a5UaXXBBy/kc34DEqBmFcOnXgI8fu4wZy
         7LI1oQPVC6aEeSEtJDW0rlHRQ1I8MOhUhgjKfbxfIqmGk5w44uEZsdJEdGnH+2XSkBiB
         qg0hqAgw2xlgA7mZAGT97tGXeaYNuEZdyuzcUyYgH7f0LVhoaRekaS8th/91els4LlSv
         M/kSRFrCqoewu+Qz3KJb1mUiP5ffM6bggfU6WRmZ36UmvU3mXOYnJLc5/D2o1Qz94VXM
         7RZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=5eCcna/4GlYf8nVob0CnP6ESi9bO7Q4AzgFtSyBPi8U=;
        b=azk5Hbl91V7+qeTMxvsWh7YagP/jxP4/V8ChURA0wc+18VPRbzTJgjShOTU1s3yqU/
         zSgyUfiVVeSRNe5RGXjp/Sw33KlzGJTzhD2FPieK0XB32W7lTWbIHj8WGKudWvRxB/JU
         fY+bz4cxYMTvIjCBc84aFoV5oQ92JuZhaHfbmySv1qypTNt9HS42IgFrzy8mXGIvnO9E
         yRGkU60BQpws3YOf/nDYGU5ABywTg4EdoPRGxPvq5Oy7eK6c9Dm0U170hZIN9IbAGbsZ
         t5vjtBPGGlRc3jHbSJaYbSIf/Kb/crRx6mspcIS7Qqj76uWAWghJk8hqggfIwFYi3Wzr
         7JoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d15si8908ywa.249.2018.02.06.14.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBoV-0003pA-KK
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:34:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBmm-0002Ke-Is
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:32:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBmj-0007u8-Dp
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:32:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBmj-0007tG-4O; Tue, 06 Feb 2018 17:32:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0273C036744;
	Tue,  6 Feb 2018 22:32:15 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 824FA12A78;
	Tue,  6 Feb 2018 22:32:15 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:32:13 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206223213.GG13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 06 Feb 2018 22:32:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: GKgxqA/euEQ5

I will try to summarize my comments here:

* I suggest squashing patches 2-22 together.  This way we
  shouldn't have any intermediate commits where "make check"
  generates warnings, and the series is shorter.
  * Or, even better: squash the CPU_RESOLVING_TYPE parts of 3-22
    into one patch, and the tests/machine-none-test.c parts of
    3-22 into patch 2.

* The linux-user/main.c hunk of patch 03/25 looks unnecessary.

* I suggest testing all CPU models in patch 02/25, but this
  shouldn't block the series.  Can be a follow-up patch.

All the rest looks good to me.

Thanks!


On Tue, Jan 23, 2018 at 09:07:59AM +0100, Igor Mammedov wrote:
> 
> v3:
>   - use qtest_startf() instead of qtest_start()
>   - rename tests/machine-none.c to tests/machine-none-test.c
>   - introduce first CPU_RESOLVING_TYPE for all targets and
>     only then use it parse_cpu_model() 
>   - stop abusing  mc->default_cpu_type as resolving cpu type,
>     move cpu_parse_cpu_model() in to exec.c and embed in
>     CPU_RESOLVING_TYPE, so that callers won't have to know
>     about unnecessary detail
> 
> v2:
>   - implemented new approach only for x86/ARM (will be done for all targets
>     if approach seems acceptable)
>   - add test case for '-M none -cpu FOO' case
>   - redefine TARGET_DEFAULT_CPU_TYPE into CPU_RESOLVING_TYPE
>   - scrape off default cpu_model refactoring, so it would cause
>     less conflicts with Laurent's series where he tries to rework
>     defaults to use ELF hints of executed program
> 
> Series is finishing work on generalizing cpu_model parsing
> and limiting parts that deal with inconsistent cpu_model
> naming to "-cpu" CLI option in vl.c, bsd|linux-user/main.c
> CLI and default cpu_model processing and FOO_cpu_class_by_name()
> callbacks.
> 
> It introduces CPU_RESOLVING_TYPE which must be defined
> by each target and is used by helper parse_cpu_model()
> (former cpu_parse_cpu_model()) to get access to target
> specific FOO_cpu_class_by_name() callback.
> 
> git tree for testing:
>    https://github.com/imammedo/qemu.git cpu_init_removal_v3
> 
> CC: Laurent Vivier <laurent@vivier.eu>
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: qemu-s390x@nongnu.org
> CC: qemu-ppc@nongnu.org
> CC: qemu-arm@nongnu.org
> 
> Igor Mammedov (25):
>   nios2: 10m50_devboard: replace cpu_model with cpu_type
>   tests: add machine 'none' with -cpu test
>   arm: cpu: add CPU_RESOLVING_TYPE macro
>   x86: cpu: add CPU_RESOLVING_TYPE macro
>   alpha: cpu: add CPU_RESOLVING_TYPE macro
>   cris: cpu: add CPU_RESOLVING_TYPE macro
>   lm32: cpu: add CPU_RESOLVING_TYPE macro
>   m68k: cpu: add CPU_RESOLVING_TYPE macro
>   microblaze: cpu: add CPU_RESOLVING_TYPE macro
>   mips: cpu: add CPU_RESOLVING_TYPE macro
>   moxie: cpu: add CPU_RESOLVING_TYPE macro
>   nios2: cpu: add CPU_RESOLVING_TYPE macro
>   openrisc: cpu: add CPU_RESOLVING_TYPE macro
>   ppc: cpu: add CPU_RESOLVING_TYPE macro
>   s390x: cpu: add CPU_RESOLVING_TYPE macro
>   sh4: cpu: add CPU_RESOLVING_TYPE macro
>   sparc: cpu: add CPU_RESOLVING_TYPE macro
>   tricore: cpu: add CPU_RESOLVING_TYPE macro
>   unicore32: cpu: add CPU_RESOLVING_TYPE macro
>   xtensa: cpu: add CPU_RESOLVING_TYPE macro
>   hppa: cpu: add CPU_RESOLVING_TYPE macro
>   tilegx: cpu: add CPU_RESOLVING_TYPE macro
>   Use cpu_create(type) instead of cpu_init(cpu_model)
>   cpu: get rid of unused cpu_init() defines
>   cpu: get rid of cpu_generic_init()
> 
>  include/qom/cpu.h         | 16 +-------
>  target/alpha/cpu.h        |  3 +-
>  target/arm/cpu.h          |  3 +-
>  target/cris/cpu.h         |  3 +-
>  target/hppa/cpu.h         |  2 +-
>  target/i386/cpu.h         |  3 +-
>  target/lm32/cpu.h         |  3 +-
>  target/m68k/cpu.h         |  3 +-
>  target/microblaze/cpu.h   |  2 +-
>  target/mips/cpu.h         |  3 +-
>  target/moxie/cpu.h        |  3 +-
>  target/nios2/cpu.h        |  2 +-
>  target/openrisc/cpu.h     |  3 +-
>  target/ppc/cpu.h          |  3 +-
>  target/s390x/cpu.h        |  3 +-
>  target/sh4/cpu.h          |  3 +-
>  target/sparc/cpu.h        |  5 +--
>  target/tilegx/cpu.h       |  2 +-
>  target/tricore/cpu.h      |  3 +-
>  target/unicore32/cpu.h    |  3 +-
>  target/xtensa/cpu.h       |  3 +-
>  bsd-user/main.c           |  4 +-
>  exec.c                    | 23 +++++++++++
>  hw/core/null-machine.c    |  6 +--
>  hw/nios2/10m50_devboard.c |  2 +-
>  linux-user/main.c         | 10 +++--
>  qom/cpu.c                 | 48 +----------------------
>  tests/Makefile.include    |  2 +
>  tests/machine-none-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
>  vl.c                      | 10 ++---
>  30 files changed, 162 insertions(+), 114 deletions(-)
>  create mode 100644 tests/machine-none-test.c
> 
> -- 
> 2.7.4
> 
> 

-- 
Eduardo
