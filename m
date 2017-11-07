Received: by 10.223.150.237 with SMTP id u100csp318423wrb;
        Tue, 7 Nov 2017 09:57:53 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QhAGhCsnKbt1jsHQnTiSxFQJwJsxnQi1T19ywukr61893WmCnLpHTh7PQJ7jezll0ASTag
X-Received: by 10.129.99.195 with SMTP id x186mr12304346ywb.30.1510077473260;
        Tue, 07 Nov 2017 09:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510077473; cv=none;
        d=google.com; s=arc-20160816;
        b=PmlbtntNmfM6vO0f43ypPL9XAmqb4agR9E86Ks9OAJaj42f+0tFFgd9Qy2bDRL+3Ry
         YXYirddmfXZsT38U5LzQv65o/KPrd2bIfFNqz0izEcIQijaMKT0YS95t3EzTvl/y7PEK
         IviN+XQnObGoKDc8zhmuvn6/QoYr0Rl7//oxs66S1eBcvTAk3cPDWiJTA/CsngetC77t
         74h/Lp/SojXpmzZojMySEPDAJQRfs/ggumehNXWZ+pmMpOp1uq51nN+Ktqbowelc6MGr
         ipjhTqKgH96Cne6bcckuob2SW2tOOKwz7ZELNfpMJRe651epiO67WVJ9qCMd1lZER5LB
         k7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=CjGf9AOEJVefnJa4TwGVLUgz1a2vhtOSjEOUAmqDOnI=;
        b=yKIE+aU27YdrEucUQAyIN0ICYwtjzRWHbbpH9LnJ9FMpAXBes4TuI6DLM5ZtKaRMSU
         5CkX3aiUMfYZqqbuKBy45fxXnYdP0qbqnLRKG0gRJ4mQDDGmK8zfyqsLLOXDe8kmozPb
         qRyqff4ZEacxemqNiwoYafs/jqeruZ7pd/3Yd6u2a18eV30rzMyYJmEka1TKugRPkk6R
         uicgZCzpv250ES8O3fyB3gWnBFO24k6EkapbpWnQVM7/GFVeQEObJ2OrhAckDZ5ouhKV
         HW4FCRgkEYZejp2LVZ2rlietpxe1VfiuhF7QZ/FxL7GYqoAVy6fSPDr8/uHoFLPZrf1r
         BqVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 194si375339ybl.242.2017.11.07.09.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 09:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC88G-0006Fb-IJ
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 12:57:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eC888-0006FH-1B
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 12:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eC884-0005aD-S9
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 12:57:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:53166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1eC884-0005Zb-Jc; Tue, 07 Nov 2017 12:57:40 -0500
Received: from sstabellini-ThinkPad-X260.attlocal.net
	(162-198-228-37.lightspeed.wlfrct.sbcglobal.net [162.198.228.37])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 23C4F218D0;
	Tue,  7 Nov 2017 17:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C4F218D0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 7 Nov 2017 09:57:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9txp80bxgV5dYCPx7xoxqgutpbLyZ7PDkkL_OfVjSxYA@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1711070957150.30448@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
	<CAFEAcA9txp80bxgV5dYCPx7xoxqgutpbLyZ7PDkkL_OfVjSxYA@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v2] aarch64: advertise the GIC system
 register interface
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
Cc: julien.grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6B7zYh44YTF

On Tue, 7 Nov 2017, Peter Maydell wrote:
> On 6 November 2017 at 22:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > When QEMU emulates a GICv3, it needs to advertise the presence of the
> > system register interface, which is done via id_aa64pfr0.
> >
> > To do that, and at the same time to avoid advertising the presence of
> > the system register interface when it is actually not available, set a
> > boolean property in machvirt_init. Check on the boolean property from
> > register_cp_regs_for_features and set id_aa64pfr0 accordingly.
> >
> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9e18b41..369d36b 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1401,6 +1401,9 @@ static void machvirt_init(MachineState *machine)
> >              object_property_set_link(cpuobj, OBJECT(secure_sysmem),
> >                                       "secure-memory", &error_abort);
> >          }
> > +        if (vms->gic_version == 3) {
> > +            object_property_set_bool(cpuobj, true, "gicv3-sysregs", NULL);
> > +        }
> >
> >          object_property_set_bool(cpuobj, true, "realized", NULL);
> >          object_unref(cpuobj);
> 
> I thought about this on the cycle into work this morning, and I
> think that rather than require every board that uses gicv3
> to set a property on the CPU, we should change the definition
> of the id_aa64pfr0 register so that rather than being ARM_CP_CONST
> it has a readfn, and then at runtime we can get that readfn to
> add in the right bit if env->gicv3state is non-null.
> 
> I'll put together a patch this afternoon.

Great, please CC me when you do, I'll help you test the patch.
