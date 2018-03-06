Received: by 10.28.91.67 with SMTP id p64csp4212727wmb;
        Tue, 6 Mar 2018 13:32:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELsArw2DegKOFkFwZEPllgDyTQrpnewMC2I/5uZDLBOiLLMGpHU6RP1iglWXWWyFVwRUyZkm
X-Received: by 2002:a25:e057:: with SMTP id x84-v6mr12345344ybg.419.1520371956292;
        Tue, 06 Mar 2018 13:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520371956; cv=none;
        d=google.com; s=arc-20160816;
        b=b7doOJIAAM4Fk+GEbKFQDNfYTz+Sz8ks9aa5rkdkZ8R3p4IFWGbNFPK4WXrLyJhsZF
         BxJTweyBR2KdnXPqE22hRmBuOn4iJc+WDjX0E9CaBmiRg+XcgEzdV1uxgQBu3kN9CEgx
         pxX+67oheg1kiBcrNsh1VuS8G4WueqjLzDF7CWlomcLogPeKAIJjLxFnZgxtzfM02HrF
         KGXG/I4r3lr8U19x2pV9Dh+yO/w0BhWQqKR14N1K4OBVTTXJulcZnuakAKJwWUKDiZ5X
         vWesQmsPbX6QcaTcY2JIKhw6K37SyNld2/7nkF64FJ2bnNjV5+J7rJIqS6NuqOL9IMMs
         TBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=nuju2m9P7HN6XAWG9r91DeK/yVZVljRr+/+y+TLl9lo=;
        b=Pc4itPgs8jo+Vivby6igKvd4qO6WRClI69Wl9/1OJQRCW5DSMHGzkGpYI0D3VGUEc8
         3BGM3YArmB0Ec4aw+EJ+Z48iYLGtMRUPzFfya4uq4/iIbAVzM+GIHozFWnLnoEI6VTMh
         j6iPPl5YVVRcip1kaHn/PNP2BEsq90n/WkTGxopMagNHm8wGFSSvnJWTW+zhw0ZCTAaE
         VR2JiE7a1heJ0ICKP+kkTXWy9nW1IykU/tjXTxtfR5WfVb5LMu5N+qmlbSoQtxP4vLKW
         Sgp8GFuF0Ey6Sv98DoHwqQ1oyrb9FEkzOwIdZM/Q6llTwy+zy3QKHNoSGsiPEnNR9eHM
         GPAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DTdiLD65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62-v6si2671261ybb.356.2018.03.06.13.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 13:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DTdiLD65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etKCJ-0005hU-Ks
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 16:32:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1etJxd-0000cv-I9
	for qemu-devel@nongnu.org; Tue, 06 Mar 2018 16:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1etJxc-0003gv-FL
	for qemu-devel@nongnu.org; Tue, 06 Mar 2018 16:17:25 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:35358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1etJxX-0003Z5-Mx; Tue, 06 Mar 2018 16:17:19 -0500
Received: by mail-pl0-x243.google.com with SMTP id w22-v6so42298pll.2;
	Tue, 06 Mar 2018 13:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nuju2m9P7HN6XAWG9r91DeK/yVZVljRr+/+y+TLl9lo=;
	b=DTdiLD650cNlPCljT7xXdbsUsgAZkcXaNMTUaZGpP0v31TAx84yAMHOEh+AeUbXY1y
	W50F5kdf5kW+oTawKUJH97NF0Uk2TwXyt0nh/rW5zyjkRpdcFyNeRd1Hb0x2lCy5RSqS
	03liaqUOK7HryKQybc5wSLsqv6xBUdwUETFqc44gRcuqRw9BH3n9urW0bdPKvoe333lu
	adnFodu+14kfz3dCJsWHIkI0qhmlmYDEu6TNT4t4hPSxuwn2QCxEOxtFZauN7F4IL7oL
	h2kV0FlgAEgPhjleIQ1wTrioFlH7F4ZG8YNuhpH/jLmTe/iUfrciZEaKJKUVp8D0xzpd
	4uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nuju2m9P7HN6XAWG9r91DeK/yVZVljRr+/+y+TLl9lo=;
	b=jlnUcf9lRjQWIZBu4lk+p1N/cN6Q55ySlsyQ19/bUrPBrGiByGdpT2LTfR1gsO+qjS
	zRzV/WgjAHGWXFAOSXyXnx2megec6SalZhNMbW5BYGin3G7sZHLheLORdvID7hUcFHdp
	4bl5aR4zThoUlLkfp8IgT6kg5UI59jsW24n4CMZeqHirUD36tY+i0sDhrHM/uceaUQbf
	PtbkbFEcEhAP4cOFk1likFVUZszCDDRUxuDZKfR5Mo6VWq3o+21efhlDz4nagMFRsqCW
	bfBCDhGEQBuT/mDxAy1dEDHVNK6V2BaDNObYBxvtGfajZ1HB+4UP+NuVoV9ubcWRf7cR
	bEXQ==
X-Gm-Message-State: AElRT7HvV1solK965HdMWGFmN2t44UyRskUtIj5MNIryrduGK80gQzXX
	5NQA8lapruNDNPGB7mlb8J8=
X-Received: by 2002:a17:902:52a6:: with SMTP id
	a35-v6mr12586607pli.179.1520371038582; 
	Tue, 06 Mar 2018 13:17:18 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	h26sm24427341pgv.22.2018.03.06.13.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 13:17:17 -0800 (PST)
Date: Tue, 6 Mar 2018 13:17:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180306211716.GA21453@roeck-us.net>
References: <20180305061237.21484-1-andrew.smirnov@gmail.com>
	<CAFEAcA_Y3oY0w3Xmrs0BTfhXw1s7S-8pESZ-rB2HgXzZ_5Vxmw@mail.gmail.com>
	<CAHQ1cqFrb3eryu9Dvi2=8aV_=K-MX9bqPHNAH4Fc4p402Sm0Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqFrb3eryu9Dvi2=8aV_=K-MX9bqPHNAH4Fc4p402Sm0Bw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-devel] [RESEND PATCH v7 0/3] Initial i.MX7 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OLjAb2Ee8V40

On Mon, Mar 05, 2018 at 07:50:23AM -0800, Andrey Smirnov wrote:
> On Mon, Mar 5, 2018 at 7:31 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 5 March 2018 at 06:12, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> >> RESEND due to botched original v7 submission (patch 1/3 broken)
> >>
> >> Hi everyone,
> >>
> >> This v7 of the patch series containing the work that I've done in
> >> order to enable support for i.MX7 emulation in QEMU.
> >
> > Thanks; applied to target-arm.next.
> >
> > By the way there were a couple of i.MX bug reports this weekend:
> > https://bugs.launchpad.net/qemu/+bug/1753314  (about the UART)
> 
> Sure, might not be able to look at it immediately but I'll give it a
> spin by the end of this week.
> 
> > https://bugs.launchpad.net/qemu/+bug/1753309  (about ethernet)
> >
> 
> Peter:
> 
> Ha! This is a rather amusing coincidence since I was just talking
> about this exact bug with Guenter Roeck (added to this thread), who
> was going to submit a patch to fix it.
> 
> Guenter:
> 
> Sorry for just randomly pulling you into this seemingly random
> discussion, but I though this additional context would be helpful to
> you.
> 
I just updated https://bugs.launchpad.net/qemu/+bug/1753309 with my
observations. As it turns out, the Ethernet interface on older kernels
(4.9 and older) only works with the current version of qemu. It is
possible to fix the problem by applying upstream commit 4c8777892e80b
to v4.9 and older kernels. However, I don't know if the problem is also
seen with real hardware, or if there is some other problem lurking
somewhere in qemu.

Guenter
