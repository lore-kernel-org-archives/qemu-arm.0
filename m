Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2484350wrt;
        Wed, 21 Nov 2018 15:22:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5dMC64OBjtndsdeq0XJ30DXXkoXWG0w7MZCG2ILRs1fF7axI68r0KktIHZ5mRfJipsf8vmv
X-Received: by 2002:a5b:185:: with SMTP id r5-v6mr8597253ybl.404.1542842520264;
        Wed, 21 Nov 2018 15:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542842520; cv=none;
        d=google.com; s=arc-20160816;
        b=cL9DxlgGL7A2LOtws4ge/yGIpdRM+nHqRRGB3Q0SUCG99O91BLh4uJxVRUaJfPnoYY
         WRr0z2Xr6q46GIPh10HckQRGC5899kBZONGAN4xPdQY8TEacU8etGvaUhAiACuJuBBsO
         nmjJQUlujKoCjB5UWu21JlpMIIUEAVbOskQeXu2RBcEqun9+RDaUxCGjrsBgiwF5+yxY
         w9QNo8jw+i3j3whlh2Z3q3yHimjYZyAkJTNoVxTtJu3pzt+BZIZ6WZwG4Fit7umwn+WO
         azHtvRxMHD2sBnneWIjT6+8GKNH4lrVg/N86fElAyIF5xXC4ZLRBbdgnceLo5pP/PlIh
         Sslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=VDhQorVRTUYpqlC6FyFrf80+Q1nMybbWTVDM/sP2VpQ=;
        b=NQs06FUVHSzXk04V4MJK2W8ylYrkYJ+DKqbBrr1f4sl0ogv4CQozEgs8QSo+49uFUY
         +QM+we1ejh2zQogB9kayCF03W9rKebAgkeX8smzjRNnTu0sOQ1P5TudeD8CWSWQ6oypr
         xnarUlMjk67MzyYPqYjj8nrfihB0Qel6OEkIxSxg01NQhOwmP4eMD6NaSnfcPoU7ej2F
         rF2nBObeidmOoOeubzoAUFfJR08PU1YX9tQn5ru+JrzVUZMpmAe7jE7o3DrYBV8QYski
         XZtUBmo8T3Lbs+81dMHSf32Thx2pdOgNMl/LVGzEup3R7TJjT0qeoH4FbXXLE/b9Z7Jx
         7ocw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n77-v6si3088685ybf.274.2018.11.21.15.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 15:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPbol-00043Z-L6
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 18:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPboa-00043I-Lp
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:21:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPboX-0002Qx-M6
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:21:48 -0500
Received: from mga03.intel.com ([134.134.136.65]:47871)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPboX-0002P2-DI; Wed, 21 Nov 2018 18:21:45 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 15:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,262,1539673200"; d="scan'208";a="91165703"
Received: from slgibson-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.202])
	by orsmga007.jf.intel.com with ESMTP; 21 Nov 2018 15:21:39 -0800
Date: Thu, 22 Nov 2018 00:21:06 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121232106.GB4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-13-sameo@linux.intel.com>
	<20181115133658.2cdbd918@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115133658.2cdbd918@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 12/24] hw: acpi: Export the
 MCFG getter
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OAdpxeSIDe93

Hi Igor,

On Thu, Nov 15, 2018 at 01:36:58PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:35 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > The ACPI MCFG getter is not x86 specific and could be called from
> > anywhere within generic ACPI API, so let's export it.
> So far it's x86 or more exactly q35 specific thing,
It's property based, and it's using a generic PCIE property afaict.
So it's up to each machine type to define those properties.
I'm curious here: What's the idiomatic way to define a machine
setting/attribute/property, let each instance define it or not, and
make it available at run time?
Would you be getting the PCI host pointer from the ACPI build state and
getting that information back from there?

Cheers,
Samuel.
