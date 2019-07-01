Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2793855wru;
        Mon, 1 Jul 2019 08:52:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhz4o1sEiuAJeS9k8l3ly+ijj7m9UH/29BWC8YJAvTub1E+JHgPxjjubuYyHzq6yDV2RCs
X-Received: by 2002:a17:902:9a06:: with SMTP id v6mr29132527plp.71.1561996333197;
        Mon, 01 Jul 2019 08:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561996333; cv=none;
        d=google.com; s=arc-20160816;
        b=T+mEhjsoXROrPXLxhQloZpEGw4CEI9gsT8dc7v3hIJRuUi/59+0Rkcxvtxdx+OdfCF
         cqmqxxraIHM9yuT1LIK4o/9ZQfVuQ3aWizs9lPm0YmbMGnVCMMXsi3Mnk1EnfUbt7I7I
         D/ic7BkF1nSFeFnjqZWTDAz7zbeQ4/2fGyhHf98nrXdL/G4JJSSVtQRsavuDvce3aylp
         tRkYa8Na9Oim7uXbyLOPy8ztlqwvT38FX1rDwngoxoVT4eWS0KLCffFZgrJw9Kc4nqNR
         z8R3JgfpNRB0nvQ8RKFHgaBGMGobhbN4qIGnK18wCiiwdQb+o5/dAn+JS+Z0Wa+Xj6wR
         9iJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=tkyL8sjck3/vvK94ncrGOfxQC3iuiB3ikGBEhhXCA3E=;
        b=AWvwwHomXcv5EICi+kd1B/4LiExfW9Pnq9Nxfdrl16QdnUsd6nLaSAEneY0/mQy2kF
         l1j4PIdOal83osFA8JW7vAF9v4rasqYzJr6G2v4YbGZOC2qke78f/+z8G/0tGL5IYwn0
         lfRGXv0yGvp4p0yVavTFPgnCsAz/fodIf6O4Dg8vk9gZOtHyS9IZK5J4oyr0Jp4kpmlc
         tS5r810n6IAdOIysTiLbO9sK8l3FMIFnQcFepeuBXE9PuiK6hmaxyJxU1dhsVYC352VN
         6D1nv0t4gayo/BBeaBfFmzPoPj/5HCRkHnhVHkF5/mc8CTyddrbqYXMzeK18+zO+snHH
         PX3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of sameo@linux.intel.com designates 192.55.52.120 as permitted sender) smtp.mailfrom=sameo@linux.intel.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <sameo@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com. [192.55.52.120])
        by mx.google.com with ESMTPS id e9si10364594pgc.321.2019.07.01.08.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:52:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of sameo@linux.intel.com designates 192.55.52.120 as permitted sender) client-ip=192.55.52.120;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of sameo@linux.intel.com designates 192.55.52.120 as permitted sender) smtp.mailfrom=sameo@linux.intel.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 08:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; 
   d="scan'208";a="157332526"
Received: from tcouniha-mobl.ger.corp.intel.com (HELO caravaggio) ([10.251.80.81])
  by orsmga008.jf.intel.com with ESMTP; 01 Jul 2019 08:52:08 -0700
Date: Mon, 1 Jul 2019 17:51:30 +0200
From: Samuel Ortiz <sameo@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Yang Zhong <yang.zhong@intel.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 00/27] Support disabling TCG on ARM
Message-ID: <20190701155130.GA4424@caravaggio>
References: <20190701132516.26392-1-philmd@redhat.com>
 <CAFEAcA93x6zkbHe1hdg0c8cbo9ErSByP+g6UvwZefxn-6346zg@mail.gmail.com>
 <6222de8e-5b4e-db05-a453-ae4920c2002a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6222de8e-5b4e-db05-a453-ae4920c2002a@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TUID: k3RGGeDZiRxz

On Mon, Jul 01, 2019 at 05:44:58PM +0200, Philippe Mathieu-Daudé wrote:
> On 7/1/19 5:41 PM, Peter Maydell wrote:
> > On Mon, 1 Jul 2019 at 14:25, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >>
> >> Paolo motived me to salvage this (other!) previous series fromi
> >> Samuel Ortiz (NEMU project).
> >>
> >> v1 cover from Samuel [1]:
> >>
> >>   This patchset allows for building and running ARM targets with TCG
> >>   disabled. It splits the target/arm/helper.c file into logical TCG and
> >>   non TCG dependent files so that one can build and run QEMU binaries with
> >>   or without TCG enabled.
> >>
> >>   The rationale behind this work comes from the NEMU project where we're
> >>   trying to only support x86 and ARM 64-bit architectures, without
> >>   including the TCG code base. We can only do so if we can build and run
> >>   ARM binaries with TCG disabled.
> > 
> > I have applied to target-arm.next:
> >  1-12
> >  14-17
> >  19-21
> > 
> > I had comments about 13 and 18. 22 has a conflict when I try to apply it:
> > I think this is just accidental because the functions it's moving are
> > next to changes in patch 13 so there's a minor textual conflict, so it
> > would be fine with a fixed-up version of patch 13.
> > 23-27 are still RFC status so I think best left for the next release.
> 
> Thanks a LOT!
Indeed, thanks a bunch!

Cheers,
Samuel.
