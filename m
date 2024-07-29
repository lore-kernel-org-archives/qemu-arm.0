Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1766209njb;
        Mon, 29 Jul 2024 05:49:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX0m/UiH+RYmSztYlgtTw/kImow//qxrA18vWElEtdmbXlaHHLCxVrRMqBB26Tawbstt2H2u7k42BXqbwXNSiOPXt/G4WUW
X-Google-Smtp-Source: AGHT+IHkQIkupvTdYF6Wrblu0JTkKiufhJK+LgLD9J7jHFVUSZ4hj6kAz4ZG3iFrNGpaBgQIJX+4
X-Received: by 2002:a17:903:234b:b0:1fb:98db:ad5f with SMTP id d9443c01a7336-1ff047fe988mr94391925ad.5.1722257351439;
        Mon, 29 Jul 2024 05:49:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722257351; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q2UWwKgSHINkP/14KCJuTMoGiKwyM0yiCoYPl/kmUKC69FYaHP59yA+tfkBnI1SgnG
         9/xNLxz6tgDTAFPmZpBurfdP8m+WFlOCp7hldFpiKNwwQXB2Bsj2xoVVAqaIiQYZ+BIF
         1iJjQQr7iuY0U/vUkXeVbKkWwMnEND2j7dz63JdOGE6R8RxX/0NbVVfpOoCmJ6BrFwj+
         y5R0YsL6JwI6H/n47qroxr6YoXWsHHgawhicdOz89lL3Xq2egeUWCk/ctuOtq6lKWo1j
         zmu1lVRz/MKLvk7apbVd8dA8Geyvi8dpEs8a1FL3o7VsYxcNAZZU80RO39ka1GNJLaae
         j6jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cIyj2bzmY/LOL87bhpznbqbogOGucf37BU9M6sU0rBQ=;
        fh=8ENCcBrHy3Q2pKXNrtHlnww8fahOtwld/yjik7lvjMg=;
        b=OYOxO4qhEdiCPqivRwshq56vBE2JPVsNSnWrMJ+JIOba2yHDiM/ubJSr1CUQNU7ONX
         CGKDlGrlXvTwxdy22zYZZN7zk7rVkVU13eUrIUrGncOnX2Zpapfz++Z5i3Wt3ojJl75+
         tugXAMiBkAlsU0lEA335Mf+5JzAPo5bQ98I23sT9LB17fSOVny3LoJEnptbJAgCeegzR
         /pSsVGcooWu6C5cCWlESyoy7XUdBaImqeHPCqnStdIddcpe8H2m32NtxoQ9jeRfHTtxJ
         glCMnMJByBJUKFvAEmZpeChobyLMxY0TPDeRI8oYZzLwEKiiybVIZ4JVMMAcaFN+ci23
         T/zA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sHDtvnXk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed801d5b5si94419555ad.629.2024.07.29.05.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sHDtvnXk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265779-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DD12812E4
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80665148304;
	Mon, 29 Jul 2024 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHDtvnXk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42135145354
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257347; cv=none; b=gvYGYufYjq7WuFs7NTS2QkcSVFOzB+nMTiY1hgMK44Cv7LyKNb81n18aj0EOh7Toi+5wgITR2KrjhjFk1fRGSWxJ7tNCjQVUG9G4uQtaDR0a3lVttHTrGe/O3E7ZonCw/3oy0LH9/UG7iNqG8tJEnfdJTC2Q2W7jAsKF5gI5Aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257347; c=relaxed/simple;
	bh=qiXNpi1eTOPDfP97kK82wC1o8JCtBMWHZhQTd5JEvm0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRBMvh+X7y+rRyXCGvqriyO0vhnv6y5UtYElbeU5d2K+pxM3kERqoYz3m/kYnvXc3Bik6ZdfsYSeR81y2luJlD9/SRfdid7jISu1FqfeRgqHRrjXMQmQzOaAjuN6j+GyRWlw+hzWrD+QXS9NWsccCZMFUPYKLjHL4QhrBNC1jSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHDtvnXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3784C32786;
	Mon, 29 Jul 2024 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722257346;
	bh=qiXNpi1eTOPDfP97kK82wC1o8JCtBMWHZhQTd5JEvm0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sHDtvnXkt1avsRE4G2VxEXzbJzZO19bsvalHW82b3sv59QjOGjFxGMlHWv1/kFQCV
	 t/Gp8RZ+3WO/lHeLQUowJJz0cj/XpMHuc1mSkINsMCCpYXvC6ZeO9hPkKZoelYMcCU
	 vKzlP2YCJmphZTwvUaGcXHxSvGXG+CE7ei9mMB4y/2+Q3avUvpLnzAXL7zPFQ45sTP
	 3ZROSt5H8tJuVfMjEYerxXQ5rFe7uHJPA5yBBeLZNXIBL+PhhwTYaPS2peN0UoyP3D
	 sW4iqf04vpb73PXpxsULOTzazuippCR+KZEJnrJv3QyPt1SuNIZ9XMpXwMShPakRn7
	 2XfMlKYJz/Iyg==
Date: Mon, 29 Jul 2024 14:49:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Markus Armbruster <armbru@redhat.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 4/7] acpi/ghes: Add a logic to handle block addresses
 and FW first ARM processor error injection
Message-ID: <20240729144900.459c0a42@foz.lan>
In-Reply-To: <20240726134646.000046e3@Huawei.com>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<6a3542a7d8acfbf88c906ec6f6dc5a697257b461.1721630625.git.mchehab+huawei@kernel.org>
	<87bk2lreeb.fsf@pond.sub.org>
	<20240726134646.000046e3@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: oCXbb4TEnT1g

Em Fri, 26 Jul 2024 13:46:46 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> A few quick replies from me.
> I'm sure Mauro will add more info.
> 
> > > +           'tlb-error',
> > > +           'bus-error',
> > > +           'micro-arch-error']
> > > +}
> > > +
> > > +##
> > > +# @arm-inject-error:
> > > +#
> > > +# Inject ARM Processor error.
> > > +#
> > > +# @errortypes: ARM processor error types to inject
> > > +#
> > > +# Features:
> > > +#
> > > +# @unstable: This command is experimental.
> > > +#
> > > +# Since: 9.1
> > > +##
> > > +{ 'command': 'arm-inject-error',
> > > +  'data': { 'errortypes': ['ArmProcessorErrorType'] },    
> > 
> > Please separate words with dashes: 'error-types'.
> >   
> > > +  'features': [ 'unstable' ]
> > > +}    
> > 
> > Is this used only with TARGET_ARM?
> > 
> > Why is being able to inject multiple error types at once useful?  
> 
> It pokes a weird corner of the specification that I think previously 
> tripped up Linux.
> 
> > 
> > I'd expect at least some of these errors to come with additional
> > information.  For instance, I imagine a bus error is associated with
> > some address.  
> 
> Absolutely agree that in sane case you wouldn't have multiple errors
> but we want to hit the insane ones :(

Yes.

> There is only prevision for one set of data in the record despite
> it providing a bitmap for the type of error.

Well, there isn't anything at the UEFI forbidding to use multiple bits.

On a "normal" field with a bitmask, more than one bit set is supported.
So, as spec doesn't deny it, it should be valid to have more than one 
bits filled.

Now, when multiple errors bits from this table are set:

            +-----|---------------------------+
            | Bit | Meaning                   |
            +=====+===========================+
            |  1  | Cache Error               |
            |  2  | TLB Error                 |
            |  3  | Bus Error                 |
            |  4  | Micro-architectural Error |
            +-----|---------------------------+

- if bit 4 is set, as specified at the spec, the error-info field is 
  defined by the ARM vendor, according with:

	"N.2.4.4.1.1. ARM Vendor Specific Micro-Architecture ErrorStructure

	 This is a vendor specific structure. Please refer to your hardware
	 vendor documentation for the format of this structure."

  So, provided that the vendor-specific documentation explicitly allows
  setting bit 4 with other bits, I don't see an UEFI compliance problem.

- if bit 4 is not set, but multiple bits 1 to 3 are set, the content
  of error-info is currently undefined, as tables N.18 to N.20 won't
  apply.

Anyway, from spec PoV, IMO UEFI API requires an errata to clearly enforce
that just one bit should be set or to define the behavior when multiple
ones are set.

Thanks,
Mauro
