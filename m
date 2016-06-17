Received: by 10.25.21.96 with SMTP id l93csp365121lfi;
        Fri, 17 Jun 2016 10:14:25 -0700 (PDT)
X-Received: by 10.55.154.136 with SMTP id c130mr3476529qke.79.1466183665608;
        Fri, 17 Jun 2016 10:14:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v82si32172503qkb.250.2016.06.17.10.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 10:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDxLc-0005qk-Sg
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 13:14:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1bDwhg-0004iQ-62
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 12:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1bDwha-0002fZ-Vw
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 12:33:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1bDwha-0002fS-QY; Fri, 17 Jun 2016 12:33:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3824480E4A;
	Fri, 17 Jun 2016 16:33:02 +0000 (UTC)
Received: from localhost (ovpn-204-136.brq.redhat.com [10.40.204.136])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5HGX17D012815; Fri, 17 Jun 2016 12:33:01 -0400
Date: Fri, 17 Jun 2016 17:33:00 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160617163300.GV16797@redhat.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
	<20160526144629.GH28935@redhat.com>
	<CAFEAcA-G4rL8o-6gmQvXHMVUrvH9utZOQuFhDO=J9imtzophjA@mail.gmail.com>
	<CAFEAcA8QmK+_cHfPuk90poixxbqSJpb+OuoXg-3OnXcfRYKQUg@mail.gmail.com>
	<20160617161016.GU16797@redhat.com>
	<CAFEAcA931Pn7jbyRF-G5jGSi=h7CjV3j7v7Xvpb8rbPttVJKvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA931Pn7jbyRF-G5jGSi=h7CjV3j7v7Xvpb8rbPttVJKvQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 17 Jun 2016 16:33:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Reject
 gic-version=host for non-KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8DZvchdkS0oQ

On Fri, Jun 17, 2016 at 05:31:20PM +0100, Peter Maydell wrote:
> On 17 June 2016 at 17:10, Richard W.M. Jones <rjones@redhat.com> wrote:
> > On Fri, Jun 17, 2016 at 03:49:38PM +0100, Peter Maydell wrote:
> >> > I agree that we really need to do better here (thinking about
> >> > the problem is on my todo list but generally other more pressing
> >> > issues intervene). I'd welcome suggestions for semantics which
> >> > (a) do what you want (b) are reasonably in line with what we do
> >> > on other host architectures (c) don't break existing command lines.
> >> > (I think those are the main requirements.)
> >>
> >> ...so does anybody have any concrete suggestions? We could fix
> >> this for 2.7 but we're starting to run low on time for that.
> >
> > I have changed libguestfs so it tries to guess if KVM will be used or
> > not.  We have to do this for the -cpu option too, but the guess is not
> > too reliable.  Only QEMU has the actual knowledge we need.
> >
> > https://github.com/libguestfs/libguestfs/commit/7023f20830a681ef36f8f99415fe41791555a3db
> >
> > Can we not have a "give me a GIC which will work" option, eg.
> >
> >   -M virt,gic-version=besteffort,accel=kvm:tcg
> >
> > I don't care if it's not the fastest or most featureful.
> 
> Do we also not care if the result is not consistent
> between versions of QEMU? (eg if you go from 2.6 to
> 2.7 does it have to stay doing the same thing it
> always did?)

For libguestfs, no, since we don't do any migration or saving the
state of the VM.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW
