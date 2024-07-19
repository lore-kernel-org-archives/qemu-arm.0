Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp314490njc;
        Fri, 19 Jul 2024 01:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVtO8TH5D2qSrRXW2zQ3G3eVzjIr1PqbI8KybxCPMGtotwCB29EMgMoZFvChnCpOk9dcrY8XMwitYISbTk35PIRMFR6UAkl
X-Google-Smtp-Source: AGHT+IGfOCK+8dc5xJps0V3SSP7+9wvUgHSYmDUYcxJ9j1Xk+9iKx12y4F9WomzuRGCHiN6Et2vx
X-Received: by 2002:a17:906:b0c3:b0:a79:fb0e:55ab with SMTP id a640c23a62f3a-a7a01147953mr574840166b.23.1721377530190;
        Fri, 19 Jul 2024 01:25:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721377530; cv=pass;
        d=google.com; s=arc-20160816;
        b=ONvCnT5yH+xAR/4h1UnN1OWaMyku5ziSQxv82igZFvIbvyWKazTMdKTvYu8xXL1dex
         uPsDdzWflJA8jTQ0ATrlqoitASRmWqdD1niYryYSzaXt72/mNSoB/7vQHTc6q/ab9LLS
         gbD1DCPUrx+mn5W5aApS/3yv0kM320BXybltenZO2/4nsmvSGw4pjJInP0ldXFbFkw3x
         yVLdJj/Aoqwe0jbsM/MCVNL/1iaEuFSPeaJZ2rXcHZC6K0icR/bzAHumxppRDdwZQDfx
         L61NGaMOg+6knXwUow7vLuFKjjOmBg6F2nYl/9XF/M8twLTav+RaqlZwUZVPyCY7lWjr
         SLvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=GpUebqG24s15mI0zmHBAhGgkeBhYDiAq+qp7z74f7oA=;
        fh=jvChnUTwCXb1gioMXkxjtoZaudMho8z97CzM+A3uQmg=;
        b=k6Ln8exM9X5yP2Jvcl10rc3NYYoanrJ7wKNc132brCs8Hsczohnl8M/LMpBArGR7Mf
         JbS77MCoNIdFR1JT7l+LSzElCAnf4fQ2WH/VfSn3KDRCpjkgTxJYldIAwWtRrYXKpZ/T
         +gvmuKWvbvkSZqep+oXG5zawuh4bzLQmiJLePseLYQOzV5WpXm4l5718mVemj8qcQ4ml
         65yTxxoIgDJniedLRr1KqccgKPi/rnAAWPwnz1NSba8Jf84J2UJo48m+j2qZnKHFCVXg
         oDIon3g98gwvqhYQsBWX6oCX1F0EfV6T7qme4SqvaYMxQwuSkzayzGbZ8aNyrjKZz9pF
         I1CA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fU3PsIfB;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7a33d71c70si59576366b.448.2024.07.19.01.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fU3PsIfB;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21922-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3D41F21B95
	for <alex.bennee@linaro.org>; Fri, 19 Jul 2024 08:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281556FE16;
	Fri, 19 Jul 2024 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU3PsIfB"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FEF6F073
	for <kvm@vger.kernel.org>; Fri, 19 Jul 2024 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377525; cv=none; b=rU3iY+REbB3UldiLr629W0ETs2Qa3LVllrfN6tIXgU1JAMZoDPRmGCV84i0DLMlBxpl+t+Xl70yappqA8zCmKzUA2h0wNTxUBTWmU8H5DYQqN3esDrdgwMjyPKJM45UpGEn1rf+dHlC2E6MHD3ZcZVNufsRwOgGcrZeTmvKB3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377525; c=relaxed/simple;
	bh=Cbq1XzEG/Z5bPHmoZpGA9EqItTHH1azGryyZCO1RmSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdnlJS03GUrdPkD2Ugvr7UMPEl56Mcs5jWIba+xk+7eWLmwuygb6QCod4QsXIExQ4v08t0e/pfyMd3HGOl50f/AppUWaVefLvOUMjvdsf5+Sh1otOo0tMstS7xhFgQiQpSXkJjlQ4drgRrnt+lu8/cgYEiQmiN0oBMOgCSnKsv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU3PsIfB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721377523; x=1752913523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cbq1XzEG/Z5bPHmoZpGA9EqItTHH1azGryyZCO1RmSk=;
  b=fU3PsIfBCyQxlPdkiTl/jay8gw5+bNwoKy3Hm0FOVDbXRJDG+of+C4tu
   fLHgQvbocXe2gVDTfwChDQmgxGs43sIhCGS513CYve4lQjMX071I6/c3D
   9WJi2OwSDB6R0SGgRHAqHmlvee2PinyAl3StlfmbzUBEJhtH0KErPNVQb
   fiI0ypks0Cla3S14u2w0n4nhKMVjJnW4/fBcA82HbgdtZgsItQlDBMJ1u
   ccSRFyJfIpwku6fyTgE324jVs2n7fb5wY2B6zOxoieOa9KjnKxEMm4XyV
   OJihcRs/bFeDaue7taNlQjqfUGnoTTQ3FFQh2x8NuSWEqk4STiUWtUFJ1
   w==;
X-CSE-ConnectionGUID: 332qnMo6Rua0Gcru27Ahiw==
X-CSE-MsgGUID: aQILgsAnTIu4UOylw9sr0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19114658"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="19114658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 01:25:23 -0700
X-CSE-ConnectionGUID: FEQBshkLRX6+VaqwSaN65w==
X-CSE-MsgGUID: c8dJjs78SHitlazWSzRUWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="50784003"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jul 2024 01:25:16 -0700
Date: Fri, 19 Jul 2024 16:40:59 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>, Yuan Yao <yuan.yao@intel.com>,
	Xiong Zhang <xiong.y.zhang@intel.com>,
	Mingwei Zhang <mizhang@google.com>,
	Jim Mattson <jmattson@google.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 3/5] i386/kvm: Support event with select&umask format in
 KVM PMU filter
Message-ID: <Zpomm3hLhSM5O6em@intel.com>
References: <20240710045117.3164577-1-zhao1.liu@intel.com>
 <20240710045117.3164577-4-zhao1.liu@intel.com>
 <f18ab76c-abbe-4599-9631-603853bcfa0b@linux.intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f18ab76c-abbe-4599-9631-603853bcfa0b@linux.intel.com>
X-TUID: EwRQgK1i2sxa

Hi Dapeng,

On Thu, Jul 18, 2024 at 01:28:25PM +0800, Mi, Dapeng wrote:

[snip]

> > +        case KVM_PMU_EVENT_FMT_X86_DEFAULT: {
> > +            uint64_t select, umask;
> > +
> > +            ret = qemu_strtou64(str_event->u.x86_default.select, NULL,
> > +                                0, &select);
> > +            if (ret < 0) {
> > +                error_setg(errp,
> > +                           "Invalid %s PMU event (select: %s): %s. "
> > +                           "The select must be a "
> > +                           "12-bit unsigned number string.",
> > +                           KVMPMUEventEncodeFmt_str(str_event->format),
> > +                           str_event->u.x86_default.select,
> > +                           strerror(-ret));
> > +                g_free(event);
> > +                goto fail;
> > +            }
> > +            if (select > UINT12_MAX) {
> > +                error_setg(errp,
> > +                           "Invalid %s PMU event (select: %s): "
> > +                           "Numerical result out of range. "
> > +                           "The select must be a "
> > +                           "12-bit unsigned number string.",
> > +                           KVMPMUEventEncodeFmt_str(str_event->format),
> > +                           str_event->u.x86_default.select);
> > +                g_free(event);
> > +                goto fail;
> > +            }
> > +            event->u.x86_default.select = select;
> > +
> > +            ret = qemu_strtou64(str_event->u.x86_default.umask, NULL,
> > +                                0, &umask);
> > +            if (ret < 0) {
> > +                error_setg(errp,
> > +                           "Invalid %s PMU event (umask: %s): %s. "
> > +                           "The umask must be a uint8 string.",
> > +                           KVMPMUEventEncodeFmt_str(str_event->format),
> > +                           str_event->u.x86_default.umask,
> > +                           strerror(-ret));
> > +                g_free(event);
> > +                goto fail;
> > +            }
> > +            if (umask > UINT8_MAX) {
> 
> umask is extended to 16 bits from Perfmon v6+. Please notice we need to
> upgrade this to 16 bits in the future. More details can be found here.
> [PATCH V3 00/13] Support Lunar Lake and Arrow Lake core PMU - kan.liang
> (kernel.org)
> <https://lore.kernel.org/all/20240626143545.480761-1-kan.liang@linux.intel.com/>

It's tricky...now I referred the RAW_EVENT format in tools/testing/
selftests/kvm/include/x86_64/pmu.h, which is used in KVM PMU and is
compatible with AMD and Intel.

The current KVM PMU filter for raw code doesn't define the layout in
the standard API like masked entries (KVM_PMU_ENCODE_MASKED_ENTRY), but
actually uses the RAW_EVENT format. So I even plan to move RAW_EVENT
macro into arch/x86/include/uapi/asm/kvm.h...

For the changes you mentioned, I think it would be better for the raw
code layout design not to break RAW_EVENT, so that AMD and Intel can
equally use the same macro to encode. Is it possible for a unified
layout macro?

What about extending RAW_EVENT as the following example? I understand
the umask2 is at bit 40-47.

#define X86_PMU_RAW_EVENT(eventsel, umask) (((eventsel & 0xf00UL) << 24) | \
                                            ((eventsel) & 0xff) | \
                                            ((umask) & 0xff) << 8) | \
					    ((umask & 0xff00UL << 32)

Thanks,
Zhao

