Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp567426njf;
        Wed, 14 Aug 2024 10:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWdv4q78qn6Aec0SPuSZZ96NfSCTNBYWEiakZtk2Slln9gR7imc8WmF2lJt/MRSG6k1mq5IkMKppDwwxnz7NL+CEyof6uU8
X-Google-Smtp-Source: AGHT+IFsue8/DwEKRPdM37BXQatVgC+ryCyMxj95wCWTls0LL7EGZTxA53i/NbMwG20YXVH5saBp
X-Received: by 2002:a17:903:41cd:b0:1fd:70a6:ffbf with SMTP id d9443c01a7336-201ee4a0b16mr4054835ad.2.1723655728245;
        Wed, 14 Aug 2024 10:15:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723655728; cv=pass;
        d=google.com; s=arc-20160816;
        b=m9D9CVKP/VsiktSrepXLsJpeaz+xFAxo0hWgGcvkY/3+KdX8iW+Z/fqKp5Y7Ad1+p1
         EEWZ1xlsYkVEv6oA9Sc3cuBWlCLON6u317FDsttygSx3/lIm1qxcOCFn0Cv3tPoRBTRM
         oIpO1r7rSqp9pvScLt7CvQQzf85N2WyQzkGizanrFPYv7Liwzsw/UO5+IxImmqkgbtoG
         Qw5nn11lwxCf4hprKNC9F9LKFq1S0VPSs9ZZzfXWK1XF5vKRhK0JdjW9Y+qV4bKnFaj9
         KU0B4up4uhkSfBBcdiGzB2UhFRu9m0zFvblvoL70EbHAm+zKdg7WVCY2TVd5rt+TdC6a
         ybLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=20oXlOTqFXzNtiB9zalw3/tJ03Rmm3PQJLfpx4LbHlA=;
        fh=QKFJltYE7DfAemCUwUHGbfWbmMtcizfJGF3EsGIjwGs=;
        b=u9xrWUxR1Rkl4vIB1wVp95OXVkQP9iI3Ng0i56J4qe5e2rFUSgttKEST9GzzyppNI2
         cJ31aIsLWn+xBb/CPZTnrdhGOsYYZoxdIlKb+ji3CU+3AEIQ9+AZtUuisZijPGi73zjW
         ZxbRY8+cqRl7JILdO3xVOuEUU2l1O/K5/qAl9V3C0PFSgOr0pz0GSu79ZgbClwvR56QG
         3Xfn3URS9AW2kyjD45nMlJlIyFhWcKWrXbbo+PsOVyocPIBd0hvpLtT12+L6vXEDo4gV
         nKUaOux4wvwB84Rr1fYPIudSqcIYyRuIO4H7ZnpfStSfyGJ+UrvoR8ivUdbxaVO/GieJ
         zbqQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TfzfbRKD;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-201e3063bb9si9489405ad.136.2024.08.14.10.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 10:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TfzfbRKD;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286958-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12A4288DDB
	for <alex.bennee@linaro.org>; Wed, 14 Aug 2024 17:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4051BC07A;
	Wed, 14 Aug 2024 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfzfbRKD"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC41BC068
	for <linux-kernel@vger.kernel.org>; Wed, 14 Aug 2024 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655713; cv=none; b=drp9YotBJO5r1ZgoRrVuNsdFvEhku31LWfv55eac4AImq9g+U1yy7OIUfUoYXG+fBPLtPPWzIfgMKtVx4/4+um8EoxhF4dq3dUv94eQy67j1P37LqoPV8KZF81zhZ92Tb9LCltniM5PxHELv1SffPbJ5+ZpRnRg5OoQ28KiufwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655713; c=relaxed/simple;
	bh=CNLvWdFSpWetfnrk3/sCACP6QDOdIi1nd9Px9y/UFMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DM/pocHu/Onjfeg/p0cyT4YZ5XQZN+D55E5Tl3eTQ7daDSgiD4NY/6J4qC+AaClMjHvhqbuuCgtJ36h4p42FYnyFEMCfzhb5ZZ4HTKKJoruhJ3DNPw3Y14SzxTWlSLfxkJAiWPZuk3dyGJufN1uq8PSgbct5N5pW9d9jPrXZ3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfzfbRKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345F8C4AF0F;
	Wed, 14 Aug 2024 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655713;
	bh=CNLvWdFSpWetfnrk3/sCACP6QDOdIi1nd9Px9y/UFMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TfzfbRKD9wGn4D9M8fk4CCETgUFtL32SrbiMFdKE23lCkGfwf1rDw55LhbzMvFBrT
	 EgdUBKJ3s6013h0AiFvGZ31h4DL306mX7ipmx/kgLFP+FXQUhBZPEPKzTZoqRpTYXm
	 kvNM4Fuo6gi+MmF1P9/KaxhpzPiqjTREwkdgbSP+R+YYswCBTfT3YfjQGRsfQyKZ0d
	 g8WdX2pvpPsNS5K8lwY5VjMoG/rkLf+fQadbaz9t7//pKNCKrAy9ltNyfxcy+fh+6v
	 ojvvVZN6XlBObYLsOXrzEBX25z9bdqs7K7PLsJ75lbXZ8IasDPqo7L78Oi7XSlpBAY
	 vCucE9LlzDM1Q==
Date: Wed, 14 Aug 2024 19:15:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 04/10] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20240814191506.21894ac7@foz.lan>
In-Reply-To: <20240814145322.00002dcb@Huawei.com>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
	<c44e6c39e6cf95a738999b721cdf71e4887258a9.1723591201.git.mchehab+huawei@kernel.org>
	<20240814145322.00002dcb@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 28TFMDEQKDkF

Em Wed, 14 Aug 2024 14:53:22 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 14 Aug 2024 01:23:26 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Creates a QMP command to be used for generic ACPI APEI hardware error
> > injection (HEST) via GHESv2.
> > 
> > The actual GHES code will be added at the followup patch.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> A few trivial things from a quick glance at this
> (to remind myself of how this fits together).
> 
> > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> > index e07d3204eb36..73ffbb82c150 100644
> > --- a/hw/acpi/Kconfig
> > +++ b/hw/acpi/Kconfig
> > @@ -51,6 +51,11 @@ config ACPI_APEI
> >      bool
> >      depends on ACPI
> >  
> > +config GHES_CPER
> > +    bool
> > +    depends on ACPI_APEI
> > +    default y
> > +
> >  config ACPI_PCI
> >      bool
> >      depends on ACPI && PCI
> > diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> > new file mode 100644
> > index 000000000000..92ca84d738de
> > --- /dev/null
> > +++ b/hw/acpi/ghes_cper.c
> > @@ -0,0 +1,33 @@  
> 
> > +#include "qapi/qapi-commands-acpi-hest.h"
> > +#include "hw/acpi/ghes.h"
> > +
> > +void qmp_ghes_cper(const char *qmp_cper,
> > +                   Error **errp)  

Heh, with all code changes, this is not a lot simpler than before ;-)

I'll address it on a next spin.

> That's a very short line wrap.
> 
> > +{
> > +
> > +    uint8_t *cper;
> > +    size_t  len;
> > +
> > +    cper = qbase64_decode(qmp_cper, -1, &len, errp);
> > +    if (!cper) {
> > +        error_setg(errp, "missing GHES CPER payload");
> > +        return;
> > +    }
> > +
> > +    /* TODO: call a function at ghes */
> > +}  
> 
> > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > index 419a97d5cbd9..99d12d69c864 100644
> > --- a/include/hw/acpi/ghes.h
> > +++ b/include/hw/acpi/ghes.h
> > @@ -23,6 +23,7 @@
> >  #define ACPI_GHES_H
> >  
> >  #include "hw/acpi/bios-linker-loader.h"
> > +#include "qapi/error.h"  
> Odd to have an include added with no other changes in file?
> Wrong patch maybe?  Or should it be included by a c file instead?

Removing it would cause a compilation breakage. It might be moved
to a c file, but patch 5/10 requires it at ghes.h, as it adds
this to ghes.h:

	void ghes_record_cper_errors(uint8_t *cper, size_t len,
        	                     enum AcpiGhesNotifyType notify,Error **errp);

So, instead of poking around moving this to/from .c/.h, I opted to
place it on its final place.

> >  #include "qemu/notify.h"
> >  
> >  extern NotifierList acpi_generic_error_notifiers;
> > diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json  
> 
> 



Thanks,
Mauro
