Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp980631wrg;
        Fri, 21 Jun 2019 12:04:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy3MZSlpJxtkOcyM4jekg31q6xWZupPOfX9hqxC3seTg1e065Gd1viy2q3Dmur6FBSKnjM
X-Received: by 2002:a17:906:924c:: with SMTP id c12mr55046576ejx.60.1561143883942;
        Fri, 21 Jun 2019 12:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561143883; cv=none;
        d=google.com; s=arc-20160816;
        b=mG3ZMpb95VYFDAVFLbfWtdfZMOxR9qupdBfCWTESmpqEatGv/Gw+aJBdNuoxdlbTVF
         3Vqp9Nm1XlA/Q4Xr22TrMe6AeYFEcFV/o2ywWuVtQmpITMQ701fPWX54sH4Zx1AdNC6m
         M4ivMppVo74e0TWTrqslfbMVuUhbpqfWobFxA+sAZgLmSS5zGSt9lrrHl8i5GgJsr61T
         hLTY/BtkWgDcN/7hfDWCnUlLnu1XwpiREUhAwYwVVm3rClg001RxQUyXnXAQezeIU7Es
         vAbKkCVUoRMQ9HlOHL/dfWoyzAxCn9YZnNdQNKCO3AnBgzl5DhLt01/9skUrkZQ9uwOI
         tWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=K0+76zCKnH6smY9J00hSUXhvvfapqOGb5kcjGyXpcNM=;
        b=wMgyPRVV4Ahaf4nRNdYmUiq6LI1DykiYQIhCxIEymJslNJQBWLkcyfGyevg7mfdrzs
         4UVP3aCUg6fMoK6vaXPrsXiH/+Kuub3m889/wdLTJ0tZ1QjEV/F0p5RQjOLQSZaXhUAL
         HVnH4g7yspMo5LvYIsmf8FILkHRbeZNJ76RclrjWupsJ0Ak5w1ED1uUjsjaJL2FAuc1N
         MN6anSwbAtkoV9liAQNT5+B3Zo9adAGZ3pvMM2OGuauOgwxq9KkLNi3+Gu9QhDeh3iua
         KvsITMOWQIidvpuNgtl+IcJ3+/2S8S6wVjIcuxHnj6esBbhTSvRIw42s2cbUDShBghQ3
         kZWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si3063571edi.266.2019.06.21.12.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 12:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1heOq3-0006DJ-35
	for alex.bennee@linaro.org; Fri, 21 Jun 2019 15:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1heOpp-0006DB-Cg
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 15:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1heOpn-0006XZ-H8
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 15:04:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1heOpn-0006XH-BH; Fri, 21 Jun 2019 15:04:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF516308A968;
 Fri, 21 Jun 2019 19:04:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-204.rdu2.redhat.com
 [10.10.120.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BC495C21A;
 Fri, 21 Jun 2019 19:04:22 +0000 (UTC)
Date: Fri, 21 Jun 2019 15:04:21 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190621190421.GA679@localhost.localdomain>
References: <20190620222314.2670-1-wainersm@redhat.com>
 <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 21 Jun 2019 19:04:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XrZigC8AM1a8

On Fri, Jun 21, 2019 at 11:33:10AM +0100, Peter Maydell wrote:
> On Thu, 20 Jun 2019 at 23:23, Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
> > I came across this when running the acceptance tests in an aarch64 host.
> > The arch-independent tests fail because, in general, they don't set a
> > machine type. In order to avoid treating arm targets as special cases
> > on avocado_qemu framework I prefered to attempt to promote virt as
> > default for ARM emulation. Moreover since it represents a generic hardware
> > and its used is broaden advised [1], I found it the right choice.
> 
> Not providing a default machine type for Arm is a deliberate
> choice: there is no single right answer and the user has
> to decide what their preference is. We used to have a default
> machine type set, and it caused a lot of user confusion as
> they expected Arm to be like x86 where everything will run
> fine on the default machine type and it did not, which is
> why we switched to not having a default.
> 
> thanks
> -- PMM

The experience acquired here deserves the highest consideration, but I
can't help myself to wonder if this isn't one of the (conceptual)
reasons for parameters such as '-nodefaults'.  I know QEMU doesn't
promise the same behavior across different targets, but that could
improve considerably with very cheap actions.

You can consider me biased (I do consider myself), but trying to wear
the hat of a user first interacting with QEMU, I would expect a (any)
reasonably capable environment that can represent the given target.
That will probably be a different environment than the one I may need,
and I think that's fine.

Now on the functional testing side, this means less code adjusting to
the specifics of each target, and overall, more test code that could
be reused across different targets.  I believe the same to be true
for management layer code.

Anyway, it'd be nice to just double check if keeping things as they
are is in this specific aspect is a firm yes.  If so, tests (and
management layers) will (continue to) have to adapat.

Best,
- Cleber.
