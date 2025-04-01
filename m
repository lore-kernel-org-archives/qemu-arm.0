Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2597751njd;
        Tue, 1 Apr 2025 00:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWWP60ETYplCfUv/YdLn1NjsSMV1VToumknmmJjpgWQBK1/zdhY8QaK5Gxh3+sUszBkkw/V5KnKlATcig==@linaro.org
X-Google-Smtp-Source: AGHT+IFmgpn4T9uBfmCDZR/hhRMlwnkB2C3YVpHZhcd4McbxaFqno43/ZnVMdHNHPUgELeFSiwdJ
X-Received: by 2002:a05:6214:414:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6eed61d72famr172848566d6.12.1743492447868;
        Tue, 01 Apr 2025 00:27:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1743492447; cv=pass;
        d=google.com; s=arc-20240605;
        b=e0rm/ouXl4B2a3wwu0ez+tGQKzhtc8YXjuF5uKjpegSYObdc1+rExLLTjTuuJ2IuYA
         r/azKyGALmlF4GLFQGSxjadiBPHmqkjFIe01EKxB2cURjh6y9P1hiUCy/ehKUtfWsmaX
         gfqq/sMu1vBf8X+IMJHn4415QhrFAy+ES0aZT5hcmwtb7AYKi/GBnpRT063wDjJ8wBrf
         nWpdCHGyZmQ/eZvgTcnS2eGgCrMLEji9dYfKBwkpZTKJndAWqDU37mDXqQmypoQNb+nZ
         pn4H6xYBLByvyq7eatzC8c9UAxdqD8KNbnhjAyUssqDYwnOfBNNSj1cd/9miOfFYSkRh
         m4BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=J81BwcdYUEkI4qP8Nut13zuF7LWhHMK11WBy1tVWjUo=;
        fh=rKwxNIUM7rUbgmTKSIJJVb3T/2LXNsbHsJXPyLNapgw=;
        b=Bj5rem6GFKvV+QErX94sDln3DQr0nPkOUFJTiiFxIacLk1sSHxCxZ/hU/8QdnD0EJH
         neAu1DIHdwrxx7/qmo7M+qpK9p9DEA19jEGMO5aJD/g1HsMrEsPc+FYq0IQMV5MtOo/R
         7uuN+BVodBpY2WfWLdoJvBCjJddBhduRat0LqlfUa/zFjhN3+cwzd2yELS+FoGJ1CStk
         e/UlH4Eb3yhfYFSP1PAI8lwiqPNyUWdFjVlU5e6od8jH2JipBIhVJX08DaEZ7v9LLGrg
         mXnf+K/l27LO6U2RXVwT+2YX0ge/U3ObcjrmiFnmOT1dPObClT4zVziWqz5uZoNfNEfL
         Q8gA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UQ7aXQG2;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97d300dsi82868686d6.447.2025.04.01.00.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UQ7aXQG2;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-42293-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1041C168FBC
	for <alex.bennee@linaro.org>; Tue,  1 Apr 2025 07:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0691E5B6F;
	Tue,  1 Apr 2025 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQ7aXQG2"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25721E2606
	for <kvm@vger.kernel.org>; Tue,  1 Apr 2025 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492443; cv=none; b=sxNKUv3u5b6ij17SN79Szerf2yK+sf3a3/xJABdkNDOksL1DGW6VgU1ZX2LG/VSA31F+ZUq6sxFg7Jyi0pyHj1SZszUWsZY/v/GJl5jeto/GEVplcmjZXigPZXMqzEoTtCodm3fhTq7pdKzVNUq7JCDoFbB52Yv2fiEpr3TNINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492443; c=relaxed/simple;
	bh=P00DF62q0qLd/W0aUFm42eTHI3bD77qudmwGeRB8KZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCYAwZGeuj2vrDKpE6XGii+qflS021EKIyTRNPdM5ND3aAvHBWcxq2CgyYMwChHvBOwSNrvd5o4w0vY1Up7OBOz8uR3s5KjgcmeyLP1D92L5DGuljs9nkK3nmW3jAV06NNFNFkMvsjDd4aiScNp9Er13/0NpzOfBTHK1P9/ae9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQ7aXQG2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743492442; x=1775028442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P00DF62q0qLd/W0aUFm42eTHI3bD77qudmwGeRB8KZY=;
  b=UQ7aXQG2ZF4nO1QIA2azl7W0wnLDkHlz9rWzcQbTmkCVmDjyL5aXHGz6
   rH6cRbE8NMVpAsrEYF1qj5CsnhbeeU6uAFw32Pu/2iOnXwqxWAqgbJuzg
   dWVOlzxVpk/EqJo8ywodckqR5shDQVlOmhdovAilWf6B41Thi/0eBwyYu
   4c0bkJtsF3vfBxVoaT3UJKr73toCwtYhn4RDuyTjORq8SSWvwUJJ/loha
   fLDJcMt7JMlVlhJWH4JKWWGDP+1mCHHqhqvz37Xf6yZ8SA3x8yVyM6lnE
   oO8WpuQbujR9g35BJP+ex26wHkLFHKL8L5u6yK5AJiLj21sSvu9v2zCpF
   w==;
X-CSE-ConnectionGUID: pzIo7aScStuXQJUB92UHcA==
X-CSE-MsgGUID: DMzyuFbqQvOdqdw/rzfA6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="67275281"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="67275281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:27:21 -0700
X-CSE-ConnectionGUID: ZccWOwgLShqWgOHWvps2NA==
X-CSE-MsgGUID: 4EAw6vdBS0yfQ4s3rR4bKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="131308361"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2025 00:27:17 -0700
Date: Tue, 1 Apr 2025 15:47:36 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC v2 1/5] qapi/qom: Introduce kvm-pmu-filter object
Message-ID: <Z+uaGHiOkFJd6TAO@intel.com>
References: <20250122090517.294083-1-zhao1.liu@intel.com>
 <20250122090517.294083-2-zhao1.liu@intel.com>
 <871pwc3dyw.fsf@pond.sub.org>
 <Z6SMxlWhHgronott@intel.com>
 <87h657p8z0.fsf@pond.sub.org>
 <Z6TH+ZyLg/6pgKId@intel.com>
 <87v7tlhpqj.fsf@pond.sub.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7tlhpqj.fsf@pond.sub.org>
X-TUID: p+ermlFOXHXZ

Hi Mrkus,

I'm really sorry I completely missed your reply (and your patient
advice). It wasn't until I looked back at the lore archives that I
realized my mistake. Thinking it over again, I see that your reply,
which I missed, really helped clear up my confusion:

On Fri, Feb 07, 2025 at 02:02:44PM +0100, Markus Armbruster wrote:
> Date: Fri, 07 Feb 2025 14:02:44 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [RFC v2 1/5] qapi/qom: Introduce kvm-pmu-filter object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> >> Let's ignore how to place it for now, and focus on where we would *like*
> >> to place it.
> >> 
> >> Is it related to anything other than ObjectType / ObjectOptions in the
> >> QMP reference manual?
> >
> > Yes!
> 
> Now I'm confused :)
> 
> It is related to ObjectType / ObjectType.
> 
> Is it related to anything else in the QMP reference manual, and if yes,
> to what exactly is it related?

I misunderstood your point. The PMU stuff and the QAPI definitions for
ObjectType/ObjectOptions are not related. They should belong to separate
categories or sections.

> >> I guess qapi/kvm.json is for KVM-specific stuff in general, not just the
> >> KVM PMU filter.  Should we have a section for accelerator-specific
> >> stuff, with subsections for the various accelerators?
> >> 
> >> [...]
> >
> > If we consider the accelerator from a top-down perspective, I understand
> > that we need to add accelerator.json, kvm.json, and kvm-pmu-filter.json.
> >
> > The first two files are just to include subsections without any additional
> > content. Is this overkill? Could we just add a single kvm-pmu-filter.json
> > (I also considered this name, thinking that kvm might need to add more
> > things in the future)?
> >
> > Of course, I lack experience with the file organization here. If you think
> > the three-level sections (accelerator.json, kvm.json, and kvm-pmu-filter.json)
> > is necessary, I am happy to try this way. :-)
> 
> We don't have to create files just to get a desired section structure.
> 
> I'll show you how in a jiffie, but before I do that, let me stress: we
> should figure out what we want *first*, and only then how to get it.
> So, what section structure would make the most sense for the QMP
> reference manual?

Thank you for your patience. I have revisited and carefully considered
the "QEMU QMP Reference Manual," especially from a reader's perspective.
Indeed, I agree that, as you mentioned, a three-level directory
(accelerator - kvm - kvm stuff) is more readable and easier to maintain.

For this question "what we want *first*, and only then how to get it", I
think my thought is:

First, the structure should be considered, and then the specific content
can be added. Once the structure is clearly defined, categorizing items
into their appropriate places becomes a natural process...

Then for this question "what section structure would make the most sense
for the QMP reference manual?", I understand that a top-down, clearly
defined hierarchical directory makes the most sense, allowing readers to
follow the structure to find what they want. Directly adding
kvm-pmu-filter.json or kvm.json would disrupt the entire structure, because
KVM is just one of the accelerators supported by QEMU. Using "accelerator"
as the entry point for the documentation, similar to the "accel" directory
in QEMU's source code, would make indexing more convenient.

> A few hints on how...
> 
> Consider how qapi/block.json includes qapi/block-core.json:
> 
>     ##
>     # = Block devices
>     ##
> 
>     { 'include': 'block-core.json' }
> 
>     ##
>     # == Additional block stuff (VM related)
>     ##
> 
> block-core.json starts with
> 
>     ##
>     # == Block core (VM unrelated)
>     ##
> 
> Together, this produces this section structure
> 
>     = Block devices
>     == 
>     ##
> 
> Together, this produces this section structure
> 
>     = Block devices
>     == Block core (VM unrelated)
>     == Additional block stuff (VM related)
> 
> Note that qapi/block-core.json isn't included anywhere else.
> qapi/qapi-schema.json advises:
> 
>     # Documentation generated with qapi-gen.py is in source order, with
>     # included sub-schemas inserted at the first include directive
>     # (subsequent include directives have no effect).  To get a sane and
>     # stable order, it's best to include each sub-schema just once, or
>     # include it first right here.

Thank you very much!!

Based on your inspiration, I think the ideal section structure for my
issue could be:

    = accelerator
    == KVM
    === PMU

Firstly, I should have a new accelerator.json () to include KVM stuff:

    ##
    # = Accelerator
    ##

    { 'include': 'kvm.json' }

Next, in kvm.json, I could organize stuffs like:

    ##
    # == KVM
    ##

    ##
    # === PMU stuff
    ##

    ... (the below are my current QPAI definitions.)

Is such a structure reasonable?

Thank you again for your guidance!

Regards,
Zhao


