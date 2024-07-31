Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp235082njb;
        Wed, 31 Jul 2024 01:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXZqEWUhuXXZ0mGHkWXOZD9+SkdnbCJguqgZHuGNk77QwiZ1wBFOxC0pKPJr64ea+74DLqalzj8xt7XtPMNG6nvTAd4GndT
X-Google-Smtp-Source: AGHT+IEKvLtJMILIR1MguWxd6S9cCjqdwTcGnTsw4IKbPtCRKlkjTim7avY2GOnIgyeH1QGheDhI
X-Received: by 2002:a50:ba8c:0:b0:5a3:76e3:1dc with SMTP id 4fb4d7f45d1cf-5b0208c200dmr8151549a12.10.1722416262857;
        Wed, 31 Jul 2024 01:57:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722416262; cv=pass;
        d=google.com; s=arc-20160816;
        b=xOP9V7T0mjBQ3Q4wOGozhWcIE0OuHUWmG1AUzTXrHIbYpb0khgUZFS60kXHjb7Bne7
         mLcADaKRNzRLlPJGvpzFTCWIfKbYunaB/swXl8AUMRTKOTZCpac945164R76jTE8nz/a
         It82BAPxcANHvM7E/KGsxfKCjGkZnS8N7Gg/OgUzc+yE6YclYXLWfuMIsU8uBD8iowD2
         vTlFcb94JJHoAmOqowTpNx/JmuK0Tiqdyff2Nfv75GoUhFjDHpZcGCAq/2hc1oy8Ld+m
         PQIMR0JLW3jFOU10v6isEq1g2ozmDzv8gILJOms/0tuGCx8oUxXg38ZY/WTeeX7B84Wy
         u4ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=fQ2EXHVMWPRnldsSvwWxIdV5lsZUaGT1t5oZATFQcNA=;
        fh=csyc8mMbtZ42gUCdgkhHwjVzfYBwuvJwiCAZAt/sVag=;
        b=lNK9SI/SriXe28h1G1+rs/ZbJ/oS1ftNmhJXkb30mg0dP257mm0pPLuRJcb/vb3zer
         3glzZSLUtGS5YOcj6xpZZ0CAsPfuo+7L5HtS1wNxYS2gG2mX/eBXYg+BHubCJRkNI8wJ
         7YlCiFS35qfU1OJ0cEVYSNEimmaldBhnLuLMRAc/TQuIpero0hVFxKf9BY4sg8nrxqo7
         PHUDiAmFmFzfth6dGIu5QRi7x8ubF3VMYBFIATGmyB1RWL2nRKZQatonq0ILKDKFw+bT
         /HFpdasqN9lUxIa7MLYXVjfFZ7sjwl6YWH+Y1TaGEO6AbwZ9NixnRRSi7c4ZLyX0yoJg
         C0mQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5ac6339eb4csi8957961a12.129.2024.07.31.01.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:57:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268816-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AE971F23C89
	for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 08:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE43E1A8C16;
	Wed, 31 Jul 2024 08:57:27 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4111A8C14
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jul 2024 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416247; cv=none; b=hVAawQSemFHmNOZupiqSGwdgTjJGnZM9lXxXTduCr+fpgPLLRs4kIMdnRrnefXy8Z9d/7BbUykP4Mr7qNTitBGgHdMRIQwFxcXJ/ls9j+GO7I6EyA8bFkFz6VtCiP7X1qxEDR6JJzqjpMA6JcBqhCS6uUCt7OqmVuUARt1zS3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416247; c=relaxed/simple;
	bh=dS/WUeVoyOL4X0cxu30ybYHy5zo+7vMiQV242Sp/wvc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgYPmbe0PKhGu8PNQ+c9jSHxxO0GKuPVUwYs5SWO3suWzVvajIWL8yJ9eMfehmVwktLARd8v3fu8WN3oLYWvaJqRxop404rHtds33LreJF/vc/IQUK3q3OfI7TR4vDaD8gzWj6P1xBJ4GFZsQZE0lt/KnWSme9XQMmWIXIOemiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WYmBG5cv2z6K9Dq;
	Wed, 31 Jul 2024 16:54:46 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 16F911408F9;
	Wed, 31 Jul 2024 16:57:21 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 31 Jul
 2024 09:57:20 +0100
Date: Wed, 31 Jul 2024 09:57:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 4/7] acpi/ghes: Add a logic to handle block addresses
 and FW first ARM processor error injection
Message-ID: <20240731095719.000004dc@Huawei.com>
In-Reply-To: <20240731091133.07ddd58c@foz.lan>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<6a3542a7d8acfbf88c906ec6f6dc5a697257b461.1721630625.git.mchehab+huawei@kernel.org>
	<20240730131709.10e72c7d@imammedo.users.ipa.redhat.com>
	<20240731091133.07ddd58c@foz.lan>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: y2YV17UTgnOX

On Wed, 31 Jul 2024 09:11:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 30 Jul 2024 13:17:09 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Mon, 22 Jul 2024 08:45:56 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > 
> > that's quite a bit of code that in 99% won't ever be used
> > (assuming error injection testing scenario),
> > not to mention it's a hw depended one and governed by different specs.
> >
> > Essentially we would need to create _whole_ lot of QAPI
> > commands to cover possible errors for no benefit to QEMU.

Fair point.  A 'few' error types might be helpful to general
users like the original memory error injection this is built
on which is reduce blast radius of a real error (and used in
production VMM cases), but most are about testing the rest
of the stack, not really QEMU.

So it's very helpful for a smallish group of users.

> > 
> > Let take for example very simple _OST status reporting,
> > QEMU of cause can decode values and present it to users in
> > more 'presentable' form. However instead of translating
> > numbers (aka. spec language) into a made up QEMU language,
> > QEMU just passes values up the stack and users can use
> > well defined spec to interpret its meaning.
> > 
> > benefits are: QEMU doesn't have to maintain translation
> > code and QAPI ABI is limited to passing raw values.
> > 
> > Can we do similar thing here as well?
> > i.e. simplify error injection commands to
> > a command that takes raw value and passes it
> > to guest (QEMU here acts as proxy, if I'm not
> > mistaken)?
> > 
> > Preferably make it generic enough to handle
> > not only ARM but other error formats HEST is
> > able to handle.  
> 
> A too generic interface doesn't sound feasible to me, as the
> EINJ code needs to check QEMU implementation details before
> doing the error inject.

To be clear we are talking here about a script that
generates 'similar' stuff to ACPI EINJ does and injects
via qapi, not guest injection (which is almost always locked
down on production machines / distros because of the footgun
aspect).  + ACPI EINJ interface suffers exactly the same
problems with state discoverability we have with a raw interface here.
(I checked with Mauro offline that I'd interpreted this
comment correctly!)

> 
> See, processor is probably the simplest error injection
> source, as most of the fields there aren't related to how
> the hardware simulation is done.
> 
> Yet, if you see patch 7 of this series, you'll notice that some
> fields should actually be filled based on the emulation.
> 
> On ARM, we have some IDs that depend on the emulation
> (MIDR, MPIDR, power state). Doing that on userspace may require
> a QAPI to query them.

We could strip back the QAPI part to only the bits that are
not dependent on state.  However, the kicker to that is we'd
need to make sure all that state is available to an external
tool (or fully controllable from initial launch command line).
I'm not sure where the gaps are but, I'm fairly sure there
will be some.  Doesn't save much code other than documentation
of the QAPI.

> 
> The memory layout, however, is the most complex one. Even for
> an ARM processor CPER (which is the simplest scenario), the 
> physical/virtual address need to be checked against the emulation
> environment.
> 
> Other error sources (like memory errors, CXL, etc) will require
> a deep knowledge about how QEMU mapped such devices.

For CXL stuff we'll piggy back on native error injection interfaces
that are already there and couldn't be avoided because they
are writing a bunch of register state (that we elide in the FW
first path). 
https://lore.kernel.org/qemu-devel/20240205141940.31111-12-Jonathan.Cameron@huawei.com/
So we won't be adding new QAPI, but the error record generation logic
will be in QEMU.  For background, the CXL FW first error injection
has taken a back seat to the ARM errors because of the obvious
other factor that CXL isn't supported on ARM in upstream QEMU.
Once I escape a few near term deadlines I'll add the x86
support for GHESv2 / SCI interrupt signaling as you'd see on a
typical x86 server.

> 
> So, in practice, if we move this to an EINJ script, we'll need
> to add a probably more complex QAPI to allow querying the memory
> layout and other device and CPU specific bindings.
> 
> Also, we don't know what newer versions of ACPI spec will reserve
> us. See, even the HEST table contents is dependent of the HEST 
> revision number, as made clear at the ACPI 6.5 notes:
> 
> 	https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#acpi-error-source
> 
> and at:
> 
> 	https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#error-source-structure-header-type-12-onward
> 
> So, if we're willing to add support for a more generic "raw data"
> QAPI, I would still do it per-type, and for the fields that won't
> require knowledge of the device-emulation details.

Could blend the two options and provide no qapi for the bits
that are QEMU state dependent - if fuzzing, can inject
the full record raw as doesn't have to be valid state anyway.

> 
> Btw, my proposal on patch 7 of this series is to have raw data
> for:
> 	- the error-info field;
> 	- registers dump;
> 	- micro-architecture specific data.
> 
> I don't mind trying to have more raw data there as I see (marginal) 
> benefits of allowing to generate CPER invalid records [1], but some of
> those  fields need to be validated and/or filled internally at QEMU - if
> not forced to an specific value by the caller.
> 
> [1] a raw data EINJ can be useful for fuzzy logic fault detection to 
>     check if badly formed packages won't cause a Kernel panic or be
>     an exploit. Yet, not really a concern for APEI, as if the hardware
>     is faulty, a Kernel panic is not out of the table. Also, if the
>     the BIOS is already compromised and has malicious code on it, 
>     the EINJ interface is not the main concern.
> 
> > PS:
> > For user convenience, QEMU can carry a script that
> > could help generate this raw value in user friendly way
> > but at the same time it won't put maintenance
> > burden on QEMU itself.  
> 
> The script will still require reviews, and the same code will 
> be there. So, from maintenance burden, there won't be much
> difference.

Agreed. I'd also be very keen that the script is tightly coupled to
QEMU as doesn't make sense to carry with kernel or RAS daemon and
I'd want to ultimately get this stuff into all the appropriate
CI flows.

> 
> Btw, I'm actually using myself a script to test it, currently
> sitting together with rasdaemon - which is the Linux tool to detect
> and handle hardware errors:
> 
> 	https://github.com/mchehab/rasdaemon/blob/master/contrib/qemu_einj.py
> 
> as it helps a lot when trying to simulate more complex errors.
> 
> Once QEMU gains support to inject processor errors, I can prepare a 
> separate patch to move it to QEMU.
> 
> Thanks,
> Mauro

So tricky questions. I'm not sure which way is the least painful!

Jonathan


