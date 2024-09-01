Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp748591njf;
        Sat, 31 Aug 2024 23:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX70cPkRFib5hPY879wvnITwnMI4tkIygOAR03115D21Houa69idOF0iFis2nzNeVwB0Gt08BYBuIfu5g==@linaro.org
X-Google-Smtp-Source: AGHT+IGNC7QVOmhncJZLvFbsjOqcD3l8paWBiN67OBKM7BsWmH0YyuENhD3OTIQErKVSAvm6RRLy
X-Received: by 2002:a17:903:228e:b0:202:1b6f:2bd0 with SMTP id d9443c01a7336-2050c33e466mr138890715ad.12.1725172818495;
        Sat, 31 Aug 2024 23:40:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725172818; cv=pass;
        d=google.com; s=arc-20160816;
        b=06JQmNHl7821nNux/Z5vsS4mC54op5QWJOcJHPexrzL4zTYR02NXOYf6vvhg4WTCcO
         kkOibofOuHUTx6juH+PrQ8AZ+qHyUnc3zW7gJYPGcvAGYI0tTDQb/SMLERSRuq58CkQq
         +t3diGAXBeeL2M+Fn0g3GyMsrct0JKzqRIhwleVbd85ATwXx7PCz02m1KDm+SBYwlsG/
         VBN1yyiCS1Or6t+wGAin6sqIsFNQZmw/35jnEkLOnwS6OLNojHBhcDkYFplfeL+I1myF
         1m/D2QyY8uP3GfciAkCfmc8Wcl9i8AEd8ntgxKsgXr35bMOdgbVQ+aKBfMLgiwznxWjH
         Hldg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SHmkbJqtX+13r6mEy8IQa71ttISe+uK8C6El6iMuOS0=;
        fh=1bMal7ZNSX/lDuqHQwwjFV4AB4ocwHHpWUn+K9h0zSg=;
        b=WKL5haD8dRCG2H8uVc2oVtBRpN57VgUtsqRG827j8N/AM9DNZgE8EQhjYy5kb/U3fu
         i2mcozVcKp/bg0AoTcZ9RwMG5Gf2DgIDRXf9BXkSNPqWmycjDzXOjURWXWaD0NGctJ/o
         +xGxGgL8PXJDyhzk6HW7eAiHphwmRs5nCLurt0ZrXjy8ty2JQzX4nVJw7RiUNTHCsXKC
         xvBvfSyr34XgrQ1y7pQyHYxkRT3/4yXQqcsrjrKlgiJXFWV+FulC0FNkKWRmLQwI79s3
         D/QTkhSD+N7IvxKYHem2n8zv4SK9QYrXraF6JWpvlj6uy/OroXmDXuwUbcKnm06Y5PUb
         3ejQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldjtfvUa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-205152b55b0si77663015ad.130.2024.08.31.23.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 23:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldjtfvUa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-310132-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D2E6B21369
	for <alex.bennee@linaro.org>; Sun,  1 Sep 2024 06:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752A16F305;
	Sun,  1 Sep 2024 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldjtfvUa"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B1748A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Sep 2024 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725172810; cv=none; b=fFQ4GOvSFELQTmn0/AdUe0qaJnlsbmx4OaH1vw3geo0v1YRtPobDDLkXrVN2OtpF9p64/GS6Zzz+lGFwiefu4WaMMXwlsJcRXe065AZrBlfLj/ZqSXZk5jCDzaNTyBveH2tzzVOlCo2YFwjEygDi2MvlZE3QWVl//eWpExQ0vYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725172810; c=relaxed/simple;
	bh=tmjR4zaDQqO7YRVjV6+NxBxXp7jCIOzTqAf/ZYvJSWg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhxUL/lomCrnMZS2vsxuzFma/+Tju/aKwAMCEGJ/Mdujl+5lSNbhxpdKowKyX3fJ8mLCmuJERH5X7gStXVrgt479ZFvhhXC1oTt9FyihQRdr3jP72myAoP2pVk/lQkUEOCto2TeZXY+e4Gw2jhNFgcDgO4+23wEOJDgTZC2F8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldjtfvUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6867FC4CEC3;
	Sun,  1 Sep 2024 06:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725172809;
	bh=tmjR4zaDQqO7YRVjV6+NxBxXp7jCIOzTqAf/ZYvJSWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ldjtfvUatoq9YBC87fc5MdxjbiEcER9AURhuULLUaCOs071PXg1Dl+BfXWACnwyu/
	 PBQLg33aUl579Oda2tTd4R1NGJw1EWpEUBHSds9n0YlfHEO7DA5874CJ1a5LoYG3Yt
	 ZLPUP9Cp1JHRmHzjQGBCHDMwYpvqK0Q7fcE2m3GsawMWKCee+4s8a844L/OdzGLIuS
	 18rliCCCPbBuoet2xQBgRNJpGPSfHaGzhVx8bS3CsPig3sH5UUJDhsO5AB8gECihDe
	 QmC3QlDrl4CPl9LWHiCnhPsxGYcn03VR8ZyyE9LL9mQbL8kEFfHE7VsW2Ic6ylgLzr
	 lbmjatXIuz6tA==
Date: Sun, 1 Sep 2024 08:40:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 11/12] target/arm: add an experimental mpidr arm cpu
 property object
Message-ID: <20240901084004.166a3c96@sal.lan>
In-Reply-To: <CAFEAcA-wD6U+onh3y4Y-LDTFuYoeWbGShkRPx7emi1ZPfKJP0w@mail.gmail.com>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
	<b88fe895e6f71711387ca153f4f1b3fbb0aa2176.1724556967.git.mchehab+huawei@kernel.org>
	<CAFEAcA-OaQ1ypa7LXz5nOs+6+fjmYNHzNL0VVgapoXEHU=rHnQ@mail.gmail.com>
	<20240826035324.6b1edcc7@sal.lan>
	<CAFEAcA-wD6U+onh3y4Y-LDTFuYoeWbGShkRPx7emi1ZPfKJP0w@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: eFMVJjddzdBf

Em Fri, 30 Aug 2024 17:27:27 +0100
Peter Maydell <peter.maydell@linaro.org> escreveu:

> On Mon, 26 Aug 2024 at 04:12, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Sun, 25 Aug 2024 12:34:14 +0100
> > Peter Maydell <peter.maydell@linaro.org> escreveu:
> >  
> > > On Sun, 25 Aug 2024 at 04:46, Mauro Carvalho Chehab
> > > <mchehab+huawei@kernel.org> wrote:  
> > > >
> > > > Accurately injecting an ARM Processor error ACPI/APEI GHES
> > > > error record requires the value of the ARM Multiprocessor
> > > > Affinity Register (mpidr).
> > > >
> > > > While ARM implements it, this is currently not visible.
> > > >
> > > > Add a field at CPU storing it, and place it at arm_cpu_properties
> > > > as experimental, thus allowing it to be queried via QMP using
> > > > qom-get function.  
> > >  
> > > >  static Property arm_cpu_properties[] = {
> > > >      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
> > > > +    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
> > > >      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> > > >                          mp_affinity, ARM64_AFFINITY_INVALID),
> > > >      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),  
> > >
> > > Why do we need this?  
> >
> > The ACPI HEST tables, in particular when using GHESv2 provide
> > several kinds of errors. Among them, we have ARM Processor Error,
> > as defined at UEFI 2.10 spec (and earlier versions), the Common
> > Platform Error Record (CPER) is defined as:
> >
> >    https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html?highlight=ghes#arm-processor-error-section
> >
> > There are two fields that are part of the CPER record. One of them is
> > mandatory (MIDR); the other one is optional, but needed to decode another
> > field.
> >
> > So, basically those errors need them.  
> 
> OK, but why do scripts outside of QEMU need the information,
> as opposed to telling QEMU "hey, generate an error" and
> QEMU knowing the format to use? Do we have any other
> QMP APIs where something external provides raw ACPI
> data like this?

This was discussed during the review of this patch series. 

See, the ACPI Platform Error Interfaces (APEI) code currently in QEMU
implements limited support for ACPI HEST - Hardware Error Source Table [1].

[1] https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#acpi-error-source

HEST consists of, currently, 9 error types (plus 3 obsoleted ones). Among 
them, there is support for generic errors via GHES and GHESv2 types. 
While not officially obsoleted, GHES is superseded by GHESv2.

GHESv2 (and GHES) has a section type field to identify which error type it
is [2]. Currently, there are +10 defined UUIDs for the section type. 

[2] https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#section-descriptor

The current code on ghes.c implements GHESv2 support for a single
type (memory error), received from the host OS via SIGBUS.

Testing such code and injecting such error is not easy, as the host OS needs
to send a SIGBUS to the guest, this reflecting an error at the main OS.
Such code also has several limitations.

-

At the first three versions of this patch set, the code was just doing
like what you said: it was adding an error injection for a HEST GHESv2 
ARM Processor Error. So the error record (CPER) were produced in QEMU using 
some optional parameters passed via QMP to change fields when needed. 
With such approach, QEMU could use directly the value from MIDR and MPIDR.

The main disadvantage is that, to make full support of HEST, a lot
of code will be needed to add support for every GHESv2 type and for
every GHESv2 section type. So, the feedback we had were to re-implement
it into a generic way.

The generic CPER error inject approach (since v4 of this series), has
soma advantages:

- it is easy to do fuzz testing, as the entire CPER is built via a python
  script;
- no need to modify QEMU to support other GHESv2 types of record and
  to support other types of processors;
- GHESv2 fields can also be dynamically generated;
- It shouldn't be hard to change the code to support other types of
  HEST table (currently, only GHESv2 is supported).

The disadvantage is that queries are needed to pick configuration and
register values from the current emulation to do error injection. For
ARM Processor Error, it means that MPIDR and MIDR, are needed. Other 
processors and other error types will also require to query other data
from QEMU, either using already-existing QMP code or by adding new ones.

Yet, the amount of code for such queries seem to be smaller than the
amount of code to be added for every single GHESv2/HEST type.

-

Worth saying that QEMU may still require internal HEST/GHES errors to be 
able to reflect at the guests hardware problems detected at the host OS. 

So, for instance, if a host OS memory is poisoned due to hardware errors,
QEMU and guests need to know, in order to kill processes affected
by a bad memory. 

Regards,
Mauro
