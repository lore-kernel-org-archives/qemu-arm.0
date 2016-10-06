Received: by 10.80.163.71 with SMTP id 65csp3326590edn;
        Thu, 6 Oct 2016 10:01:50 -0700 (PDT)
X-Received: by 10.55.4.22 with SMTP id 22mr15254902qke.254.1475773310046;
        Thu, 06 Oct 2016 10:01:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z29si1601211qtz.78.2016.10.06.10.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 10:01:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsC3J-0000w5-08
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 13:01:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsC14-0007va-9L
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 12:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsC13-0001YG-7n
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 12:59:30 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bsC0y-0001Tp-IV; Thu, 06 Oct 2016 12:59:24 -0400
Received: by mail-lf0-x244.google.com with SMTP id b75so1312615lfg.3;
	Thu, 06 Oct 2016 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K+GR84xy8q3WGXeVzBfRVJnLL946pOdgtCkz4exDd7I=;
	b=RZpomqzcuBEB/Izt90DSKNz7Tdstbvi4FDVyfchS4m6CtC9IcFNDXe8IRAreqx27nf
	m/h3GAfjj5lN3IwHynM4/PcsD//k7Fhrzb70L2tB3ME2pbEkJTM6I52WAqzZZK+Tvbbz
	Gjc8WByWNNC35ZBn1M53+xLxlDDZlHDs4+jXU/7bx81gARR6E22ht2Zx51khWoRXTSuv
	VR8YMfJe/gLs9QCrhsV/4o8CNxfwuSsN3QyrRitsrE5GrQDYnmwteUBf6Me6CQUNTHXp
	GP+9kKYpjXsYWUYscxALb+Okd11BYDbkQslhSIx44Joq275x7NTxbTjF7G3t67O7jrXj
	AoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K+GR84xy8q3WGXeVzBfRVJnLL946pOdgtCkz4exDd7I=;
	b=WX/+OyY56FQb4FO0Ai80AMBTQThffMcPE0R1LdEUzwHqk7gxGorSCAX2CFunbojxim
	KxQLeiG4ZyxyFDcIA+JisCDLJ2qEmmlA2E/Ojcvgp0UJtAK32AtkqfrtW4tY415GOhFr
	B/q6RdFO15wCxIS3xuDMF5C1X8jtraB988WStKXwkQNdT+AoIb9TS45S9hhNL/T0bsr4
	gOkL0X8SHHbOdZxgoITy4NwelNhEk+scg0iEwYjyy+JqbvGPZ/5X6OxAL4hoI8Yb4wwJ
	PE2RZ/fvRT/xqDuNNHDd8VTfFxqc74nTkUCFaEDfEAY8ly3Razj5EqQPt0mq8z5qQT33
	h0qA==
X-Gm-Message-State: AA6/9Rk7BDVr7Ib0kDpVPfsUAmVmyqbZmqm1SYZOmbV6BgNhiTfWxdl+AmA/Kd72KbjOFw==
X-Received: by 10.25.20.104 with SMTP id k101mr6810298lfi.133.1475773163249;
	Thu, 06 Oct 2016 09:59:23 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 23sm2848480ljf.9.2016.10.06.09.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 09:59:22 -0700 (PDT)
Date: Thu, 6 Oct 2016 18:59:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161006165921.GD28109@toto>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-devel] [PATCH 0/3] preliminaries for GICv3 virt support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eaff/kQkorZR

On Thu, Oct 06, 2016 at 02:21:04PM +0100, Peter Maydell wrote:
> This set of three straightforward patches is a preliminary
> for adding virtualization support to the GICv3 emulation:
>  * add a (nop implementation of) MDCCINT_EL1, since KVM
>    will read/write it on worldswitch
>  * fix some bugs in the GICv3 trace events
>  * add trace events for the generic timers
>    (which I have been using for debugging)
> 
> I actually have almost all of the GICv3 virt code written,
> but it currently has bugs which mean that a guest kernel
> under KVM won't boot. Debugging in progress...


That is very cool, we could soon enable EL2 :-)

What kind of issues are you seeing?

FWIW with our out of tree GICv2 virt models we've got issues
with SMP Xen were things go nuts some times with virtual
timer interrupts. Some times they take for ever to hit,
like if we loose events.

Last time I looked at it, I noticed that our GICv2 virt
implementation of the APR regs and EOIR stuff seems totally
bogus (my bad).

Cheers,
Edgar


> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   target-arm: Implement dummy MDCCINT_EL1
>   target-arm: Add trace events for the generic timers
>   hw/intc/arm_gicv3: Fix ICC register tracepoints
> 
>  Makefile.objs             |  1 +
>  hw/intc/arm_gicv3_cpuif.c | 23 +++++++++++++++--------
>  hw/intc/trace-events      | 14 +++++++-------
>  target-arm/helper.c       | 28 ++++++++++++++++++++++++----
>  4 files changed, 47 insertions(+), 19 deletions(-)
> 
> -- 
> 2.7.4
> 
