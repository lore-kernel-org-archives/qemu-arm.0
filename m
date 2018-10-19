Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3928374wrt;
        Fri, 19 Oct 2018 07:50:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62GsBMSSc8neUw7DraGe/v3PI8Gf7owQGCK3j5UbCdkww13Hc1eWO+AsV+FsVMFL1kvg6D8
X-Received: by 2002:ac8:71d1:: with SMTP id i17-v6mr6537391qtp.382.1539960650346;
        Fri, 19 Oct 2018 07:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539960650; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4VrQY++M+2DhQpMrpKXaNRYoCrcSn8wWVVe8NWxCS9Q7BoiM4ve46DdqwO7vM0sAY
         vZGCESYcQfd61UTAc04XrCFA/TVR8ROOP9LEYu2rskq/+vZ0OU837fqG0h3wP8uHSqRg
         3BhOgLEwfA0mW1Pk90lhMMEIXfKR0/wkXz5/xVHn4OIDsWd1YY181l8bkQ6SsTLUCBuJ
         1iy06dA2PutkqF4QFqBJSMgeeo7p8D7Bpv8LZfIoBbRKMmfv4uM8jfOK7kUyAhMdI9Tr
         ZNOk2mGbG9glcouUiySNnLXExlYnBQhY3tqhrwcW4R3LgwzLrb1/p/zrNkxNl/kNy2Cq
         xlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature;
        bh=/Tf0SUxMb+Axpc5yNjBvhTXQS8cXJsxuAlavIos2L6A=;
        b=syVgxnaWTDV8W9mSAkX7HC79Frf3rifmWw7HO6cNCjf6Gqw1JVDwGvd5JUheuERa8F
         4hKEENJeqgdfQ5nqJWwMESNks8h0BaGJ3d8sPqFVVdjJgD1wmenNKOJchospxPdZt1QD
         JGnv2Bu7MQpE/5nPbGnW0j8EUN5ZKQqqZQYLC8Tc6UT2Ssifrcw3R+P7mNDCeFyD5coq
         GQaYjyR+w453Igu/mNwTgcHwLYi3SuqZP8rlVkCP6AdNo/oEm5FMuYVhAa7uugFKu0he
         Q6UJRDplfy12gAut20r2ZVlTh6ovKBThi8Rds9Rrsk+S2SdkmRf/ugy91O0h3jz5fodm
         Fo/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mPSLNElk;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mIxJW5pA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si1071996qtr.118.2018.10.19.07.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mPSLNElk;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mIxJW5pA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDW6z-00027T-TF
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:50:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDW6l-00027H-P5
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDW6i-0001PL-Ij
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:50:35 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDW6i-0001Ku-9x; Fri, 19 Oct 2018 10:50:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B18E921E3E;
	Fri, 19 Oct 2018 10:50:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Fri, 19 Oct 2018 10:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=/Tf0SUxMb+Axpc5yNjBvhTXQ
	S8cXJsxuAlavIos2L6A=; b=mPSLNElkpeP59HQ5PznE7fJG6+MKAzWgQg6GiRwY
	ZpAWe58hgdvzdEuo2O8hZrFFA4wTHjOKvksZdCQW93+xDTHml8v9bCj8aYuNs4Ng
	x9bQfzIIl28OY8NJp+7Nf0bgKDm1HFNZ/FO7m4rKtJqI6zVRpKSNAB964zIGtcgE
	wBQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/Tf0SU
	xMb+Axpc5yNjBvhTXQS8cXJsxuAlavIos2L6A=; b=mIxJW5pAfDIudUcb8amq8M
	tpEwTYX1kAoGjJHn0uNdmKJ86PU01yApwsoXUuY3ih80PwOwYsHWa1eP5MdB9TTS
	/HHrNzfJBf/SKwclApRzmPA91GHxJpJI9hL/Gmie1VIFZBhQYq+Efkj/oFfRzCY1
	+xu2ff/P/PU2E31/lxsLzYNROHfeg2GNbHCZyGurz1LEcf511QGgzQhKky58gEM3
	dLH/UNbL6T9+1ocUyp/WQaVl7TplJWzUZSFeCUhQbtduFMkSWKLv5ctTTwNHBRbQ
	A2EL5JJWql6lVhY3Iq9JqJL63sJt19sTxXJIfXj+8x0YqG5tSvC6IZRZewgbDXRQ
	==
X-ME-Sender: <xms:K-_JWxse_vydZiP9hQVrxivmRuqF2RtQZXGy-XYNjD-MCzYJdY37Ug>
X-ME-Proxy: <xmx:K-_JW-6KdVwk2pf1O3I6zc4DTw2eRECwUuhW1EUeXDBpvTJPZUWohg>
	<xmx:K-_JW_hz_WcE5Fu9nZhVMdWwi3i6lOJzYIAgD0MZt5kTwcq3DuVnFw>
	<xmx:K-_JW9o3hAuvysPf5oZORvzS4n-wSF25K7XnZ9q4lpj3gqDa-pwbzQ>
	<xmx:K-_JWzKJM6EzgMCWt_CxSRirMLbGaDe580HMKVxciVUhtHtA6qU8sw>
	<xmx:K-_JWyv9XYyghN_2VFGntEyGJnN1z1wCANqk6UobOd7DYAdqfQpb-w>
	<xmx:L-_JW5O-Xjo72zEsvgp7O9wyYXmj0kHkbWTS-U8OdgiGj_J3ryBGoA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 18F82E435E;
	Fri, 19 Oct 2018 10:50:19 -0400 (EDT)
Date: Fri, 19 Oct 2018 10:50:18 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181019145018.GB7279@flamenco>
References: <20181019010625.25294-1-cota@braap.org>
	<f7067d72-3b2a-9e6e-4636-f18ac1cf5202@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7067d72-3b2a-9e6e-4636-f18ac1cf5202@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: Re: [Qemu-arm] [RFC v3 0/56] per-CPU locks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>, Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m6lQC3a+qQ+Q

On Fri, Oct 19, 2018 at 08:59:24 +0200, Paolo Bonzini wrote:
> On 19/10/2018 03:05, Emilio G. Cota wrote:
> > I'm calling this series a v3 because it supersedes the two series
> > I previously sent about using atomics for interrupt_request:
> >   https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg02013.html
> > The approach in that series cannot work reliably; using (locked) atomics
> > to set interrupt_request but not using (locked) atomics to read it
> > can lead to missed updates.
> 
> The idea here was that changes to protected fields are all followed by
> kick.  That may not have been the case, granted, but I wonder if the
> plan is unworkable.

I suspect that the cpu->interrupt_request+kick mechanism is not the issue,
otherwise master should not work--we do atomic_read(cpu->interrupt_request)
and only if that read != 0 we take the BQL.

My guess is that the problem is with other reads of cpu->interrupt_request,
e.g. those in cpu_has_work. Currently those reads happen with the
BQL held, and updates to cpu->interrupt_request take the BQL. If we drop
the BQL from the setters to instead use locked atomics (like in the
aforementioned series), those BQL-protected readers might miss updates.

Given that we need a per-CPU lock anyway to remove the BQL from the
CPU loop, extending this lock to protect cpu->interrupt_request is
a simple solution that keeps the current logic and allows for
greater scalability.

Thanks,

		Emilio
