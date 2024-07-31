Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp209166njb;
        Wed, 31 Jul 2024 00:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVb+bmTqVg3MvhR01Xjv4HgY4si8XWptGSrHBjYM+eKeigXUFVJJf04vVK/4I/tsQqynwrDV3sW8mBewp3xQt69re8HwQX0
X-Google-Smtp-Source: AGHT+IHnLagsDZRK9XMGTpcAFXmE01beXqLxtZGXWtbr19NNDL7yxZwaYgoItQ81c1GCm48OcLF3
X-Received: by 2002:a17:907:1c85:b0:a7d:2429:dc16 with SMTP id a640c23a62f3a-a7d40150bb9mr879941366b.65.1722411880262;
        Wed, 31 Jul 2024 00:44:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722411880; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dw6IzzhxEwNhcX/c4bBlmq30wYPDMXkKWbjo49bwfs2W7UgfxvKsMkWLUGQAxhJuVT
         gRylxgAwx7TywLq6IrCyvzUVLPj6tpKx8i43YlIAY1cKN9HnOFRanAN86yBO66tMgL/U
         bsJHpCpxdpNxbLjAUyOsEptqVB0Bu1FTry+fbzSJEx2p2r47w1S1vOt9p/0lCFEzgoeF
         vm2/nuy3Pyy0XWpQQNdRewtaPrK1hM0tveSJq1ZNYqJ859b405bonPcpwNEVwkcuKanX
         ThIHnaQleyzBhygY4EMpYXG2uLdzjhS6f2/KWxtSCwRHYjZKJUTFqE2hklO3h0/hTi0O
         iEnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=v6wAAlcqmVLaLuwyXlcwM3EVRiSRxzVwDwzFvKbOhiw=;
        fh=UscwW1rX8CGIPHOVTfAuMO5KZvEuwv5X6kPG3yD6D+s=;
        b=U8gIt4SNaZBZXJlqII7bbwFlR5yDBO4U17/G39W/dEqyZ2EmWyu1t6ezS1F2Wgtjy1
         PfhoEt/pZ/AaTLR373k/FZwrt1GfGt8JAajIRiWmaK78NqKgwRXETsK/wodd0JilFg53
         7l7IypAwQ/XoLLW2n25ZlL4dIGprkCOtHQrDR7BoW+ZlTotAOVNdU87YV2MhAwtDepE7
         XTBiXdzB0eMwkBCCC4wDTBPU0gJUSeUWXU+bMNIA1g5bhTDvd1d6vsN33fetQqeiJEl4
         op0GjK+EfiZtIER7EOMsVCLx4XFn736q9fiaHhgTHURADZz3JE50llGzU0AqSEbJv/kK
         GTew==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l0laINnu;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5ac650a3d42si9081060a12.316.2024.07.31.00.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l0laINnu;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268717-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1C491F22304
	for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 07:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97AA1A76C1;
	Wed, 31 Jul 2024 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0laINnu"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBBD1A76C2
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jul 2024 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411874; cv=none; b=gVUvqLYZheRBVuUkZJCd3UpW9m8lf7aYCXNrfbVSlmFC1BXkPMhMy4L1RUzFqIgqHzOyIcW3ABgRCRHGVI9GH91hpQfQ8/fGr577izjIYg0EnZ+EeLSy9jHm0vVm8NJkz8jyIllBKG6MrZEGckvXyLVNQczn+ewhblht5lvlWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411874; c=relaxed/simple;
	bh=uI8ued3A1y+KABwhLnnHrEksiCAWTyppjF8eLSYsOcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNN7oapW/zLacpGtPgHwzSEYBQULc5BFprzTnq6ezj0ur6/24HY3gFcWMOgggzh6hYb1vFt5OFt5yUMRtk7+/OJRo7b+yIF5Jq1qToWnTJqZKNWneH0IycCHsOqPzpBv21z+ELr+QZ9QDuXOzwKDnYeiHN1IdXtZkLIAVyxJ8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0laINnu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722411873; x=1753947873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uI8ued3A1y+KABwhLnnHrEksiCAWTyppjF8eLSYsOcw=;
  b=l0laINnu+BHwe9Guc8BNYfCm4z6Bgv5F+saioXY3TXtRrJRFr5KkZMZa
   3o+oLh4eDey8MDeOgVTNljlgAUl9j36Zfzi8YgN80iBQEkRVIqlwvDS+F
   mdTNchTdXhiTk6zn+pXI2rqHdELSoAZZCHXVcP6T0hBsz1lsz6qEHZ+Br
   0idyzvSwVW5B52thbF9YjYV9znOK2rBoBeiG9zAkoy0Lz5vNZMqbHG21n
   jmXltJRL/J2mabJ/Kgs6RkPOmw4RVGdixePUkwiFJ8mMwSW8FtvA3cS6C
   DmG3VT8QPpHmIVTCyhGVoSSVvMiYoMU9yvuinsRHwiRrEq8zD7qbSOmnQ
   g==;
X-CSE-ConnectionGUID: zKLcK9SbRCi04ORwBvbhRA==
X-CSE-MsgGUID: eddvyOtLRAaITHFbOQQnaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31423135"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="31423135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 00:44:33 -0700
X-CSE-ConnectionGUID: AU/vUc6qTpOrr5lhfWTkQg==
X-CSE-MsgGUID: cu7MWQ00QVmLseBL9zTmcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="59455163"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 00:44:28 -0700
Date: Wed, 31 Jul 2024 16:00:15 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>, linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI /
 GHES
Message-ID: <ZqnvD8o+Fa4o/+Db@intel.com>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
 <e994c3944d31775d62bbd017dec3adff50ddf269.1722259246.git.mchehab+huawei@kernel.org>
 <ZqigPgTl7quJ553J@intel.com>
 <20240731072158.3aaf85ac@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731072158.3aaf85ac@foz.lan>
X-TUID: znBj9zILRS8U

On Wed, Jul 31, 2024 at 07:21:58AM +0200, Mauro Carvalho Chehab wrote:

[snip]

> > The name looks inconsistent with the style of other MachineClass virtual
> > methods. What about the name like "notify_xxx"? And pls add the comment
> > about this new method.
> > 
> > BTW, I found this method is called in generic_error_device_notify() of
> > Patch 6. And the mc->generic_error_device_notify() - as the virtual
> > metchod of MachineClass looks just to implement a hook, and it doesn't
> > seem to have anything to do with MachineClass/MachineState, so my
> > question is why do we need to add this method to MachineClass?
> > 
> > Could we maintain a notifier list in ghes.c and expose an interface
> > to allow arm code register a notifier? This eliminates the need to add
> > the ¡°notify¡± method to MachineClass.
> 
> Makes sense. I'll change the logic to use this notifier list code inside
> ghes.c, and drop generic_error_device_notify():
> 
> 	NotifierList generic_error_notifiers =
> 	    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
> 
> 	/* Notify BIOS about an error via Generic Error Device - GED */
> 	static void generic_error_device_notify(void)
> 	{
> 	    notifier_list_notify(&generic_error_notifiers, NULL);
> 	}

Fine for me.

Regards,
Zhao


