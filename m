Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1753896njb;
        Mon, 29 Jul 2024 05:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUB/o7pDw/I3G4rsO4r5MVjkoerx5dUWcdqfIFxNCG4AhsEY+2MPL93PRyFBBgu+6QeFAOnF531Ql1eXY3snfsq7kHLGLEr
X-Google-Smtp-Source: AGHT+IEa7IMMpzYzrGhx3+eQxRybXGR2ezoiyqRL2rD1j4+hq07ohEqUGO1L62DWCjkfzO24JNKa
X-Received: by 2002:a05:6214:c68:b0:6b5:2bfa:edd5 with SMTP id 6a1803df08f44-6bb56361169mr141526146d6.17.1722255738163;
        Mon, 29 Jul 2024 05:22:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722255738; cv=pass;
        d=google.com; s=arc-20160816;
        b=GC3zUGEsY8qw2+Hy5cI3bEABHQQfsuQywn3qJx42RBI1WKqQd+HuRjO67T4cCWpuLX
         sTqXwNTCGohoG1krh0Cvk3M7jLloh4cXX+J9yKPZqGuILzM0O/MJs50nnj1AcLhCqmbH
         M53vUeQa/ksj/Dn8hbhRyeVIGxZOYodbucXvqZ6BX3jB0DdMBwhnNjCrRnb45d4bv5F2
         xf2cgwVvhxNEhRBijG55Yo5BW4zsWeMtZf5Inw9oO89tv6yl8nKNRvbVGrJLJYBKBV04
         3jRsVZZLgP4JdZdEqT/0KwylN5vDFqPCRRxBII3I7gDdoJmMPYXaOo1hPEvoUgap36Ce
         SRTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=dkq2AuOMgCskdbpZqXTO/zQweWlUZaMWR5l/WpTln9Y=;
        fh=ztu+7y0Pc0MGlFkdBUqcRJ8TIWQg+rF9cUr9MoKbAk4=;
        b=xssW3jfRRKlthIx04By1QFeQcX3C63IYfoFfw58/HEYTx+aid/1TZOXoBjwDN4SnvK
         kPaJ5ZaGs3KgIOlULW75a+yeq0C1lmCWNdxB4IPbRIb+FOy0yaXrv9aZranWFGVyzxAl
         uaeQPm2la9rF4SqE/nFF/LNj4FEPkKlB9FDRE33t902H+ETmlqwBNvHnV1Thk8hgr1zl
         lRFaP7HpVh+qFNLtRJuEmKNr7oKHIIS4BMoH7/pMMAN1LTXHx6qvIrmG1c/fjsycP20U
         HOuf2uj1CerbWPX0/ezbB+JDbRFiP1U7eBvY1JNxkePvNNsMX3JLMiCoETUHQ63YZkMw
         ZR3Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jpr5f4c8;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fa86541si98722586d6.275.2024.07.29.05.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jpr5f4c8;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265725-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C96501C21700
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 12:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED871147C6E;
	Mon, 29 Jul 2024 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpr5f4c8"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F3145B12
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722255720; cv=none; b=Mo/xnJBx1dvIJke41KbhzCsKnjGIGLefD2VE679gJVj0pxQTrKPJQKTnQ4/FEgDWRIdIYY+Sz7XINHsJJ4MQ+xgbtoCk/cKMAJLdgebOPp+PR1CeYkg7Pk8PVas3muclsWaZ5SDRT6O6eAOEG0VnmPJz2FuZ24PRJV14M7u/KnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722255720; c=relaxed/simple;
	bh=OHF10ytzKDJKK8yB0tCLTAdFrlhZAGLKi90cSr3k3kk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWICw+9L8ahcw2vbacEKoEotoSNyYAlWyBjAx3fGwp+M5Mu/8GVX54yadcFe8PSvn8yInE1W/8emje9j/k3WbsFIKJGHc1bggzzA7iOtOrg3g5jT+tKWlhi8fYiwtDYdqLyxnBVPfVYUDjef/doR+eJ/AIytctq7qVXN/PTDClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpr5f4c8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76609C32786;
	Mon, 29 Jul 2024 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722255720;
	bh=OHF10ytzKDJKK8yB0tCLTAdFrlhZAGLKi90cSr3k3kk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jpr5f4c8+eLVa6HVIpPRqw53PW26Fs+uOZ5f0V8Zp4mO6aZtiwvTjSFsvnnHGdCRD
	 g617SKwFCI1j5Fno2Zz7F591CM3xqagE0KeDqsiyXQwD8bW0y9PDC6OBVOs4quGnuZ
	 Nv8b/cop5l25OyMo9L2IBPkjWNy82aMHFHCL4NE2W1CvugwC/0V9u0/T2pVZ/SsveC
	 SUiTTswQxuMwLIPasKT+uc9/rH5b2ooM5Hh0+vVBug2zeMC3+lbKxQ6ZUhWex4miqA
	 B4fIu4tsttdNL2Tn/e4nz+ZvSA4B9/bmzjFfl1b80Bb4OPG+fN9U1Xz/bd0DpK9w2P
	 uVKmDGRBgwkVw==
Date: Mon, 29 Jul 2024 14:21:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 4/7] acpi/ghes: Add a logic to handle block addresses
 and FW first ARM processor error injection
Message-ID: <20240729142154.44d484c4@foz.lan>
In-Reply-To: <87bk2lreeb.fsf@pond.sub.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<6a3542a7d8acfbf88c906ec6f6dc5a697257b461.1721630625.git.mchehab+huawei@kernel.org>
	<87bk2lreeb.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: o1DEj07ggWlf

Em Thu, 25 Jul 2024 11:48:12 +0200
Markus Armbruster <armbru@redhat.com> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >
> > 1. Some GHES functions require handling addresses. Add a helper function
> >    to support it.
> >
> > 2. Add support for ACPI CPER (firmware-first) ARM processor error injection.
> >
> > Compliance with N.2.4.4 ARM Processor Error Section in UEFI 2.6 and
> > upper specs, using error type bit encoding as detailed at UEFI 2.9A
> > errata.
> >
> > Error injection examples:
> >
> > { "execute": "qmp_capabilities" }
> >
> > { "execute": "arm-inject-error",
> >       "arguments": {
> >         "errortypes": ['cache-error']
> >       }
> > }
> >
> > { "execute": "arm-inject-error",
> >       "arguments": {
> >         "errortypes": ['tlb-error']
> >       }
> > }
> >
> > { "execute": "arm-inject-error",
> >       "arguments": {
> >         "errortypes": ['bus-error']
> >       }
> > }
> >
> > { "execute": "arm-inject-error",
> >       "arguments": {
> >         "errortypes": ['cache-error', 'tlb-error']
> >       }
> > }
> >
> > { "execute": "arm-inject-error",
> >       "arguments": {
> >         "errortypes": ['cache-error', 'tlb-error', 'bus-error', 'micro-arch-error']
> >       }
> > }
> > ...
> >
> > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> > For Add a logic to handle block addresses,
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > For FW first ARM processor error injection,
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> > ---
> >  configs/targets/aarch64-softmmu.mak |   1 +
> >  hw/acpi/ghes.c                      | 258 ++++++++++++++++++++++++++--
> >  hw/arm/Kconfig                      |   4 +
> >  hw/arm/arm_error_inject.c           |  35 ++++
> >  hw/arm/arm_error_inject_stubs.c     |  18 ++
> >  hw/arm/meson.build                  |   3 +
> >  include/hw/acpi/ghes.h              |   2 +
> >  qapi/arm-error-inject.json          |  49 ++++++
> >  qapi/meson.build                    |   1 +
> >  qapi/qapi-schema.json               |   1 +
> >  10 files changed, 361 insertions(+), 11 deletions(-)
> >  create mode 100644 hw/arm/arm_error_inject.c
> >  create mode 100644 hw/arm/arm_error_inject_stubs.c
> >  create mode 100644 qapi/arm-error-inject.json  
> 
> Since the new file not covered in MAINTAINERS, get_maintainer.pl will
> blame it on the QAPI maintainers alone.  No good.

Added myself there:

diff --git a/MAINTAINERS b/MAINTAINERS
index 98eddf7ae155..713a104ef901 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
 F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
+ACPI/HEST/GHES/ARM processor CPER
+R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+S: Maintained
+F: hw/arm/arm_error_inject.c
+F: hw/arm/arm_error_inject_stubs.c
+F: qapi/arm-error-inject.json
+
 ppc4xx
 L: qemu-ppc@nongnu.org
 S: Orphan

> 
> [...]
> 
> > diff --git a/qapi/arm-error-inject.json b/qapi/arm-error-inject.json
> > new file mode 100644
> > index 000000000000..430e6cea6b60
> > --- /dev/null
> > +++ b/qapi/arm-error-inject.json
> > @@ -0,0 +1,49 @@
> > +# -*- Mode: Python -*-
> > +# vim: filetype=python
> > +
> > +##
> > +# = ARM Processor Errors
> > +##
> > +
> > +##
> > +# @ArmProcessorErrorType:
> > +#
> > +# Type of ARM processor error to inject
> > +#
> > +# @unknown-error: Unknown error  
> 
> Removed in PATCH 7, and unused until then.  Why add it in the first
> place?

I folded this with patch 7, so this was gone now.

> 
> > +#
> > +# @cache-error: Cache error
> > +#
> > +# @tlb-error: TLB error
> > +#
> > +# @bus-error: Bus error.
> > +#
> > +# @micro-arch-error: Micro architectural error.
> > +#
> > +# Since: 9.1
> > +##
> > +{ 'enum': 'ArmProcessorErrorType',
> > +  'data': ['unknown-error',
> > +	   'cache-error',  
> 
> Tab in this line.  Please convert to spaces.

Ok.

> 
> > +           'tlb-error',
> > +           'bus-error',
> > +           'micro-arch-error']
> > +}
> > +
> > +##
> > +# @arm-inject-error:
> > +#
> > +# Inject ARM Processor error.
> > +#
> > +# @errortypes: ARM processor error types to inject
> > +#
> > +# Features:
> > +#
> > +# @unstable: This command is experimental.
> > +#
> > +# Since: 9.1
> > +##
> > +{ 'command': 'arm-inject-error',
> > +  'data': { 'errortypes': ['ArmProcessorErrorType'] },  
> 
> Please separate words with dashes: 'error-types'.

Done.

Folding with patch 7 broke it on two separate fields: error and
type.

> 
> > +  'features': [ 'unstable' ]
> > +}  
> 
> Is this used only with TARGET_ARM?

Yes, as this CPER record is defined only for arm. There are three other
processor error info:
	- for x86;
	- for ia32;
	- for "generic cpu".

They have different structures, with different fields.

> Why is being able to inject multiple error types at once useful?

The CPER ARM Processor record is defined at UEFI spec as having from 1 to
255 errors, that can be using the same type or not. The idea behind UEFI
spec is that a single root error may be reflected on multiple errors.

It may also help to reduce BIOS interrupts to OS, by merging errors
altogether, as memory errors usually happen in bursts.

Due to that, a single Processor Error Information inside a CPER record
for ARM processor can, according with UEFI spec, contain more than one
of the following bits set:

            +-----|---------------------------+
            | Bit | Meaning                   |
            +=====+===========================+
            |  1  | Cache Error               |
            |  2  | TLB Error                 |
            |  3  | Bus Error                 |
            |  4  | Micro-architectural Error |
            +-----|---------------------------+

So, the spec allows, for instance, to have a single Processor Error
Information (PEI) with micro-arch and tlb-error flags raised at the
same time.

We need the capability of testing multiple error types in order to check
if OS implementation is decoding it the right way. In particular, Linux
was not doing it right, as the CPER ARM Processor record handler was 
written at the time UEFI 2.6 spec was written, while the actual encoding
for the error type was only defined at UEFI 2.9A errata and newer.

> I'd expect at least some of these errors to come with additional
> information.  For instance, I imagine a bus error is associated with
> some address.

It actually depends on the ARM and PEI valid fields: the address may or 
may not be present, depending if the phy/logical address valid field bit
is set or not.

> 
> If we encode the the error to inject as an enum value, adding more will
> be hard.
> 
> If we wrap the enum in a struct
> 
>     { 'struct': 'ArmProcessorError',
>       'data': { 'type': 'ArmProcessorErrorType' } }
> 
> we can later extend it like
> 
>     { 'union': 'ArmProcessorError',
>       'base: { 'type': 'ArmProcessorErrorType' }
>       'data': {
>           'bus-error': 'ArmProcessorBusErrorData' } }
> 
>     { 'struct': 'ArmProcessorBusErrorData',
>       'data': ... }

I don't see this working as one might expect. See, the ARM error
information data can be repeated from 1 to 255 times. It is given 
by this struct (see patch 7):

	{ 'struct': 'ArmProcessorErrorInformation',
	  'data': { '*validation': ['ArmPeiValidationBits'],
	            'type': ['ArmProcessorErrorType'],
	            '*multiple-error': 'uint16',
	            '*flags': ['ArmProcessorFlags'],
	            '*error-info': 'uint64',
	            '*virt-addr':  'uint64',
	            '*phy-addr': 'uint64'}
	}

According with the UEFI spec, the type is always be present.
The other fields are marked as valid or not via the field
"validation". So, there's one bit indicating what is valid between
the fields at the PEI structure, e. g.:

	- multiple-error: multiple occurrences of the error;
	- flags;
	- error-info: error information;
	- virt-addr: virtual address;
	- phy-addr: physical address.

There are also other fields that are global for the entire record,
also marked as valid or not via another bitmask.

The contents of almost all those fields are independent of the error
type. The only field which content is affected by the error type is
"error-info", and the definition of such field is not fully specified.

So, currently, UEFI spec only defines it when:

1. the error type has just one bit set;
2. the error type is either cache, TLB or bus error[1].
   If type is micro-arch-specific error, the spec doesn't tell how this 
   field if filled.

To make the API simple (yet powerful), I opted to not enforce any encoding
for error-info: let userspace fill it as required and use some default
that would make sense, if this is not passed via QMP.

[1] See https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#arm-processor-error-information

> > diff --git a/qapi/meson.build b/qapi/meson.build
> > index e7bc54e5d047..5927932c4be3 100644
> > --- a/qapi/meson.build
> > +++ b/qapi/meson.build
> > @@ -22,6 +22,7 @@ if have_system or have_tools or have_ga
> >  endif
> >  
> >  qapi_all_modules = [
> > +  'arm-error-inject',
> >    'authz',
> >    'block',
> >    'block-core',
> > diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> > index b1581988e4eb..479a22de7e43 100644
> > --- a/qapi/qapi-schema.json
> > +++ b/qapi/qapi-schema.json
> > @@ -81,3 +81,4 @@
> >  { 'include': 'vfio.json' }
> >  { 'include': 'cryptodev.json' }
> >  { 'include': 'cxl.json' }
> > +{ 'include': 'arm-error-inject.json' }  
> 

Thanks,
Mauro
