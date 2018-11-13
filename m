Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5020400wrw;
        Tue, 13 Nov 2018 15:30:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5ftggZAaMEaZbHXnzH6TE0nwpyUc6DMOaJI3xH3aOFmRjUDqSdMcT0BWOfVXrhPkcwXCgaF
X-Received: by 2002:a37:6191:: with SMTP id v139mr7008208qkb.25.1542151815346;
        Tue, 13 Nov 2018 15:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542151815; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3X0OD7N2FbodmUUdRDQP0LEFjeuRSnXL1V/c1WfPnWrtRKt1bkgddUykdKgCWQpod
         5CWOeHGsP62ULLNjPQPlOhoGfuNpyCQfFvjESw7I0XIwyGS5n9IWm4+YJBuB0jjZLPOe
         FJvaFBbnZHoQYSBhl1AdrsWmLJ7DsTHrzbVlzWo9U50rtuTiWHkl/lG103iDzo+cq3z4
         sOWhWLXj988WYpyASPX4HXQm0UhnUpH/pIUjTUjS6Ntum3aTd5KGsqrzx1/vX0Au1QKI
         r1ztVcqZyIb8NyHixRkLFJGpiYIRB2DEnfiUaxO4L2kpYi1NH+BP16EFS0WbDBAk5qG3
         087A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=O7GzNHm6XcXmGIkR5LpMKewYHN6lz0d6jgRDEV1NFu8=;
        b=vsGsu3XRYwStf2HLgfeE6Ai/G/XWTAJTEvDmKRSBX87dZ7B1G3bR+qGFbYtUj8c4dp
         DBUdv014wYooNo/D/f4H9Qicp+/D5OJESq0cwW4XztEZpFbIhD6v0AhG1eGHwKNT1P5n
         sF8p1PGDiM24AqultQBx4rTyFjcS+LdLGuaNc8VyzINEKWGO5AcVxSjQorCBlmQsVHzS
         FI8tV2IidvurMZ1P5BOPYwOVhtgbNJmkcIzuoej4hBwDtV/Mz6bSBSCCSMZ0euKxENF6
         p0DsYfHpYaa4JRhCasbgFcNDNjKtCyG1O0kMUvqdlnILZBi3vzjpffDOGdYO0GCs/t4M
         jl8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y14si4359549qtj.67.2018.11.13.15.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 15:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:56451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMi8M-0006Ml-Mw
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 18:30:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMi89-0006KP-TS
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 18:30:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMi88-0004DY-Ru
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 18:30:01 -0500
Received: from mga02.intel.com ([134.134.136.20]:60450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMi84-0004Bl-Br; Tue, 13 Nov 2018 18:29:56 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 15:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,230,1539673200"; d="scan'208";a="108328214"
Received: from rleong-mobl4.gar.corp.intel.com (HELO caravaggio)
	([10.252.39.126])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2018 15:29:53 -0800
Date: Wed, 14 Nov 2018 00:29:18 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181113232918.GE23562@caravaggio.hotspot.internet-for-guests.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-2-sameo@linux.intel.com>
	<CAFEAcA-npVS1Q0=or=p-kjP0Nf4h1n+qUL7y8+yYCdtuHa7Fxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-npVS1Q0=or=p-kjP0Nf4h1n+qUL7y8+yYCdtuHa7Fxg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/13] target: arm: Add
 copyright boilerplate
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDKpoFp4WRJh

On Tue, Nov 13, 2018 at 04:58:40PM +0000, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > From: Philippe Mathieu-Daudé <philmd@redhat.com>
> >
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> > Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  target/arm/helper.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 0da1424f72..3d4e9c5c8a 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1,3 +1,10 @@
> > +/*
> > + * ARM generic helpers.
> > + *
> > + * This code is licensed under the GNU GPL v2.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> 
> The human readable text says "v2", but the SPDX tag says
> "v2 or later". Which is right? (The top level LICENSE file says
> source files with no specific license are 2-or-later).
Fixed in my
https://github.com/intel/nemu/tree/topic/upstream/arm-tcg-disable
branch, thanks.

Cheers,
Samuel.

