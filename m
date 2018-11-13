Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5019394wrw;
        Tue, 13 Nov 2018 15:29:23 -0800 (PST)
X-Google-Smtp-Source: AJdET5c2RUoJ9dMYhuUfUQyT7FThzCL3tcqONSFefbzeoTHE0DdvOfuK3y86jUlcdKegvzJJLBwm
X-Received: by 2002:ae9:eb4c:: with SMTP id b73mr6718774qkg.88.1542151763612;
        Tue, 13 Nov 2018 15:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542151763; cv=none;
        d=google.com; s=arc-20160816;
        b=hdvksFisFehnoDkOuLMkouQXl80DES9c4PrRVHfwWZ5lT2lBFLebOR3au2avqdYXd0
         Ro8K7bDJdUjhRa2OyvUUamTVxcr7pP33cBsA41sAbTyv8s+8to3epI+rH/XMZz8zqzkw
         t0i1vnJRO8Ael/KUuIGnIeIl+anXf/6ZKUXB12S0S1XukAF1OkjZkoEHQfCivw6AQmDa
         laZ9gvUvGaYYdodEJjnywEUd/yZyMKLSK46XGvKfTbbg9H8cZBKr+fcGuJ9QWzRwvyB2
         XmzcktUcBX/XvLPYqW/9m1cPV3ZhR/a11eCNvSbFOelBKjDAyP1p4WNcyCVwg6IFIrmN
         Xnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=Ti7v1hrIPsJyPW/h6mvuc1M00KgLTwSs4jP0FK+h7F0=;
        b=FmR1/r7gHxqW7dEJdmb/h6i8UyT2aBbqkCiFr4ad0Ep777PHgN2hmUg+A9lQvXypO7
         IauTsmgstkHgBFFwi4CRZvmZ5/UGS4+QB1241zsgs0lO5YV00w8EUg8r1+3a3sUOY3nL
         INGHRb7pqNKHxwBHU4LBLl82RARx4oA8H+Jm7CEyqprc39V7ghAa8SqucZ2aobnn78mR
         puSvxE+5m6VfVSjNxzVDy/AvLJhtv5K7tvBzboOgp6r1MlT+SiX8nfkURLnqfGg56sOf
         Ew0KLIfal69GXKMFHGIhUHAbX6+5Cs91FRc0E7O/9wp62gxu0E5gfFSch0lPYACMA4pz
         yE1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si3632281qkw.269.2018.11.13.15.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 15:29:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:56446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMi7W-0005wR-Gq
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 18:29:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMi7P-0005wJ-Jw
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 18:29:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMi7L-0003w9-OJ
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 18:29:15 -0500
Received: from mga11.intel.com ([192.55.52.93]:15634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMi7K-0003vF-Em; Tue, 13 Nov 2018 18:29:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 15:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,230,1539673200"; d="scan'208";a="100019784"
Received: from rleong-mobl4.gar.corp.intel.com (HELO caravaggio)
	([10.252.39.126])
	by orsmga003.jf.intel.com with ESMTP; 13 Nov 2018 15:29:07 -0800
Date: Wed, 14 Nov 2018 00:28:32 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181113232832.GD23562@caravaggio.hotspot.internet-for-guests.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-3-sameo@linux.intel.com>
	<CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
	<37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-arm] [PATCH 02/13] target: arm: Remove unused headers
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHtVWkfJG21O

Hi Philippe,

On Tue, Nov 13, 2018 at 07:02:57PM +0100, Philippe Mathieu-Daudé wrote:
> On 13/11/18 18:01, Peter Maydell wrote:
> > On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > > From: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> > > Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >   target/arm/helper.c | 3 ---
> > >   1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > index 3d4e9c5c8a..27d9285e1e 100644
> > > --- a/target/arm/helper.c
> > > +++ b/target/arm/helper.c
> > > @@ -12,13 +12,10 @@
> > >   #include "internals.h"
> > >   #include "exec/gdbstub.h"
> > >   #include "exec/helper-proto.h"
> > > -#include "qemu/host-utils.h"
> > 
> > This is for muldiv64().
> 
> But it is already included by "cpu.h" -> "exec/cpu-defs.h"
> 
> > 
> > >   #include "sysemu/arch_init.h"
> > >   #include "sysemu/sysemu.h"
> > > -#include "qemu/bitops.h"
> 
> "cpu.h" -> "cpu-qom.h" -> "qom/cpu.h" -> "qemu/bitmap.h"
> 
> > 
> > This is for extract32() and friends.
> > 
> > >   #include "qemu/crc32c.h"
> > >   #include "exec/exec-all.h"
> > > -#include "exec/cpu_ldst.h"
> > 
> > This is for cpu_stl_data().
> 
> Included by "arm_ldst.h"
> 
> > 
> > >   #include "arm_ldst.h"
> > >   #include <zlib.h> /* For crc32 */
> > >   #include "exec/semihost.h"
> 
> So they are not "unused" but "unnecessary".
> 
> I thought this would be better to clean this once, before Samuel split.
> 
> Samuel: please drop this patch from your series.
Dropped. I updated my
https://github.com/intel/nemu/tree/topic/upstream/arm-tcg-disable branch
accordingly. I will wait for Richard's review before sending a v2.

Cheers,
Samuel.
