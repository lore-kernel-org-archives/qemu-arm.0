Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp381638wrg;
        Fri, 10 May 2019 17:00:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqWVf0WK5iPmAWm2M33qQjjvK9zJmIQmmUkCRyDWU1ZTVtUeE/JZjMCKcpNKxrb73Z+dPE
X-Received: by 2002:a50:8a8b:: with SMTP id j11mr14329013edj.212.1557532804806;
        Fri, 10 May 2019 17:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557532804; cv=none;
        d=google.com; s=arc-20160816;
        b=Cmo5gLk3WL9WxKZUQNwWqYWISPJ5tRPxQci7J/J1hWcgPXvojUME931FAhHdTBZUa7
         gC3CLELDNHFEOjqiL//unWVlokAZtNPqAwsY1yCTSu1atPVsvwZ2+0hZahSXIH8mC4Za
         1PK7vK4ROE+bRgt/4x8imk2/0vGsqy3aAKR8UrIr6Ubi8Qav4xJyHxSLcUNFcuhR+etg
         WeqcPuprWKXwVOdaiTiQ1FMT0L4xpOPatjER9qyv7L9yqI5yKOAmF1xn/B0rz4WbplWo
         RRhviJ/dZt13GW6O+SVVkzmSME+HBFUeEiewzveTBhlSzUGihAxQNXE4+zTp/RDqGdh6
         Zs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=g3iOqTGZfIcnm2nw2p/h7X+7c2kZhBQMIdV3gu8sFlo=;
        b=M0YCszvFgPWybrDVDetlAp+gAZBVFY/Djs0ZJ8ORPxcTSTwCm1SVP92R2XdiDjC0Pm
         n02spcTIqu7qbMYdZYsVItbeBufNe1o64X4kzztdfJb/mEzYUMSaqbJ+kFi0bBDreVtD
         uNkesWLw9GKxesny/oLqpF8vswKT44iDlJ6guVEsbPIHDhAs7YK9dR+iYBjDlxPrWrAx
         MJO3ERIIVp39Eo3hjIhCLlB2mGfOoMtPab6i/Ok0UtuGtWBAcK6gzWAbMZPsGkyoCGrL
         C05Ijpe3ULmuz0edTZnwa4ogZBqo1epGdM7UYax4y5jsqy5v9bpyOpNWU8072vLny4uV
         atqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 25si4291080eds.277.2019.05.10.17.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 17:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPFQp-0004pu-U3
	for alex.bennee@linaro.org; Fri, 10 May 2019 20:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hPFQa-0004p1-QY
	for qemu-arm@nongnu.org; Fri, 10 May 2019 19:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hPFQZ-0004RV-LK
	for qemu-arm@nongnu.org; Fri, 10 May 2019 19:59:48 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hPFQZ-0004R0-HV
	for qemu-arm@nongnu.org; Fri, 10 May 2019 19:59:47 -0400
Received: by mail-qk1-f196.google.com with SMTP id n68so2184989qka.1
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 16:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=g3iOqTGZfIcnm2nw2p/h7X+7c2kZhBQMIdV3gu8sFlo=;
	b=Uup/74PyX8DLm8oG3INYKtzzgx7MIShdjFDsXbcf9oRiy5WyVB8SxKcYr56SkoNZvt
	RkYfMXMnfMhhWakkp9VtnBpC839gr/G1f81dooZN+yZ9Re1m5V73DqxXtYnwp3a0jivp
	ne+14aUTdt0JPuJqU5llxxOX9HEXTnzg96nlK2L97QEKsfwgroCWsO66oSCymS4U+TPd
	p+3QqkhqjznlSD3/xS832w6N62h6Ufxqz4+bkPIqrkU+OqXvkGZ4EAL6qTfo556l9DV7
	jvjZ+pWg1N+1D8C205y0syDpeBqq/g93pm8BTM1oltFyX/c3Qf9PwXhE+3hwak3/bTDi
	dDQg==
X-Gm-Message-State: APjAAAUmAcILTzkfINcmJfOnim9KjCeZ98cQJIFlgXVouz8VbwPdgjYZ
	Sh1pSG6piaNJtymEHlU2CGf5Dw==
X-Received: by 2002:a37:a24b:: with SMTP id l72mr11124467qke.166.1557532786923;
	Fri, 10 May 2019 16:59:46 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	n22sm4269244qtb.56.2019.05.10.16.59.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 10 May 2019 16:59:45 -0700 (PDT)
Date: Fri, 10 May 2019 19:59:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20190510195932-mutt-send-email-mst@kernel.org>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190510212210.4ao2zoikky7jivwc@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510212210.4ao2zoikky7jivwc@master>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/6] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkXyCdG0F2I1

I merged this will send pull request soon.

On Fri, May 10, 2019 at 09:22:10PM +0000, Wei Yang wrote:
> Hi, Igor
> 
> You would take this one? Or what should I do next?
> 
> On Fri, Apr 19, 2019 at 08:30:47AM +0800, Wei Yang wrote:
> >This patch set tries to generalize MCFG table build process. And it is
> >based on one un-merged patch from Igor, which is included in this serials.
> >
> >v3->v4:
> >    * adjust comment to give more information about MCFG table
> >
> >v2->v3:
> >    * Includes the un-merged patch from Igor
> >    * use build_append_foo() API to construct MCFG
> >
> >Igor Mammedov (1):
> >  q35: acpi: do not create dummy MCFG table
> >
> >Wei Yang (5):
> >  hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
> >  i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
> >  hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
> >  hw/acpi: Consolidate build_mcfg to pci.c
> >  acpi: pci: use build_append_foo() API to construct MCFG
> >
> > default-configs/arm-softmmu.mak  |  1 +
> > default-configs/i386-softmmu.mak |  1 +
> > hw/acpi/Kconfig                  |  4 +++
> > hw/acpi/Makefile.objs            |  1 +
> > hw/acpi/pci.c                    | 55 ++++++++++++++++++++++++++++++++
> > hw/arm/virt-acpi-build.c         | 31 +++++-------------
> > hw/i386/acpi-build.c             | 44 ++++---------------------
> > include/hw/acpi/acpi-defs.h      | 18 -----------
> > include/hw/acpi/pci.h            | 34 ++++++++++++++++++++
> > 9 files changed, 111 insertions(+), 78 deletions(-)
> > create mode 100644 hw/acpi/pci.c
> > create mode 100644 include/hw/acpi/pci.h
> >
> >-- 
> >2.19.1
> >
> 
> -- 
> Wei Yang
> Help you, Help me
