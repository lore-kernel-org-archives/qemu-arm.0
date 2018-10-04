Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1398072wrt;
        Thu, 4 Oct 2018 14:54:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV627RXgcXxEC3h4Dg2pJXKb1U1pAwIco1UABalbSdt1hiJKaIhWrJ+Co9g4GPK5ClIPc/LNI
X-Received: by 2002:ac8:36bd:: with SMTP id a58-v6mr7089774qtc.236.1538690057503;
        Thu, 04 Oct 2018 14:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538690057; cv=none;
        d=google.com; s=arc-20160816;
        b=1AJoHWgNp+OA66YjO2hJ3hfYdku6RQ9mqkjzEbMwlamYlHfIWmgVw1LXEiKBW1/OuS
         kRwKJ1BFqs5moiasF5T3TF41rRnhrUmfNUgGG81EWP3BESBgfPSRdcZqRz3F7LZfYrpv
         yfp2jYYSZUwW3FTU9DSrg7x809AwtOb2IGAwu9yC4bwjzvtfRFvesCxg622wzl4FsReu
         ALCx/aAbaDv5jnLN871RgxK/iGRL5cr4KkSyM4oAw7jnXM/0o0FSrNSb/7VFd+FNgOqj
         z3D6NK6pYOiyGGv+KftkikLwv81UwW/wyI2iiJpQycpwPREajz+hkhhPPNWLY7Z+q+yu
         kGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xPL7gi/hFLa9QnSxvW2fDJS9giaBjknjycK3/CmO7v8=;
        b=jv7LSSJj0xy/7kfF35M2e4QQCg01937t+L/9QjLBOCQMG9zculsDLTSrVyxU+Qh4w/
         TRh70Y0WOu2NtkcDP/sGMn/7XqLwVyPmH+BALp31ECK/Y5ftLIoRGx3Jk5Crffp9g9ze
         ptQcE4PtrBC/xjJTiVKXmoXZvsPGYKAy5XHNxPQMUrslzQZuxQRBeyLSUn17L+9fCwUT
         B49tMPbodNnC0Re9Ly87r/cgNecb6GdajkbhahUEhywBXP1BihShASPEei3G1p503GNC
         5k8Mfbw5Xf9gUQ04Rsbl85JC1d/oGlRwR9SB87jfAebC1Qx82+z0suu2TSmLst2ewaVC
         bW1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4-v6si1334416qti.388.2018.10.04.14.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 14:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8BZZ-0000W3-1u
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 17:54:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g8BZK-0000Vd-EB
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 17:54:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g8BZH-00058z-7E
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 17:54:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49848)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1g8BZH-00057J-0E; Thu, 04 Oct 2018 17:53:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B97098553D;
	Thu,  4 Oct 2018 21:53:57 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF9D61057042;
	Thu,  4 Oct 2018 21:53:53 +0000 (UTC)
Date: Thu, 4 Oct 2018 18:53:52 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181004215352.GW5738@habkost.net>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
	<20181004195225.GV5738@habkost.net>
	<CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 Oct 2018 21:53:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H0ON9RjWnQpR

On Thu, Oct 04, 2018 at 09:01:09PM +0100, Peter Maydell wrote:
> On 4 October 2018 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Changing the object hierarchy based on GDB groups doesn't seem
> > right, but I don't think it would be a big deal if we have the
> > board code explicitly telling the GDB code how to group the CPUs.
> >
> > If you really want to do it implicitly, would it work if you
> > simply group the CPUs based on object_get_canonical_path()?
> >
> > If a more explicit GDB grouping API is acceptable, what about
> > just adding a INTERFACE_GDB_GROUP interface name to (existing)
> > container objects that we expect to become GDB groups?
> >
> > I'm not sure which way is better. I'm a bit worried that making
> > things too implicit could easily break (e.g. if somebody changes
> > the CPU QOM hierarchy in the future for unrelated reasons).
> 
> I don't want things implicit. I just don't want the explicitness
> to be "this is all about GDB", because it isn't. I want us
> to explicitly say "these 4 CPUs are in one cluster" (or
> whatever term we use), because that affects more than merely GDB.

We already have a way to say "these 4 CPUs are in one cluster",
don't we?  That's the QOM hierarchy.

My question is if "the CPUs are in one cluster" should implicitly
mean "the CPUs are in one GDB group".

-- 
Eduardo
