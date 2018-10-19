Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4269093wrt;
        Fri, 19 Oct 2018 12:29:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV637KQPnDCfR0XBL3kv4beOH8qJHZb7ifQ0lYjMvDu9DSnEpVpRqnfgfF6JPHyxnRr0vPk6d
X-Received: by 2002:a37:7ec7:: with SMTP id z190-v6mr7184381qkc.20.1539977392079;
        Fri, 19 Oct 2018 12:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539977392; cv=none;
        d=google.com; s=arc-20160816;
        b=Cu9YstaFZy/bYYoSytDpXKCnB0jUC5/oFdVq5+rdDvPuw9Ra7jP3qaHSdz4b9Ey0Q/
         ZoKi+kMm/LHlouqfKuBW/HvOkYPHJOmzK8x1zW0WatXK093GB3bK4zDibgZfaDHnuH0w
         5D4o1hjWA6SmSLOG5C3ns+KSrkF5IbXMrqEwEkKTOTzORXoeylSyPN0RXIDgnO9yxrMc
         71UAA5oCGP+4XTiUSdWwYlQeb2ZDqz0H6Fsrt6jOhPuvoqzMEy3h5Fdkn2zJlFCU3mso
         losYNMKX4CuIc4Jh7S+bg5174TfyJ2GbMm/0UxTglFSJRRTUEfV6wMTznpBpes1nn6ya
         WQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature;
        bh=U9OHKHb1r3NrWD2xUGwW5NEwhuYoka4RFeKE+96Zocs=;
        b=ZXNO59wMPwnmERaYFTa+BEHvZvAgtzsPct4BSz3Mfr5K3A1OwnaCYGvl6Ers/P2woY
         xWlgO11B1qiqqk7VLFwfddNrU5W1LbvVJnYDLcTaWr4YM27bhWJNAX7Fc7f2RLsW3vzd
         eb0i1XmVA1ygDqn0TIljOkwCghxVvmeYv1nOFnG4mNBGwED5FXil+zU6ZssLXpHB3aCo
         7jP6Nsnx0cG+94KYQ3qTuW45ABhrBPqgQMUgjeARkhteqnjBxPAkep1/uenFuc7Fy7TN
         Decq9zioyszL0cHfsP92khHM0p15o3oaptXAFxoVfxwDJvvXm9184iuW1XEfWIRaeNoQ
         G/9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="M3/6Ou3m";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=xvhLgnG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13-v6si5744917qki.23.2018.10.19.12.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 12:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="M3/6Ou3m";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=xvhLgnG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDaT1-0005cH-7C
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 15:29:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDaSs-0005cB-Fk
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 15:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDaSp-0008KJ-7R
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 15:29:42 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43001)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDaSo-0008EY-TY; Fri, 19 Oct 2018 15:29:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E634921EF0;
	Fri, 19 Oct 2018 15:29:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Fri, 19 Oct 2018 15:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=U9OHKHb1r3NrWD2xUGwW5NEw
	huYoka4RFeKE+96Zocs=; b=M3/6Ou3m6KWB+EuMccB7sS9a0t1dch9HJRs0nnjh
	LksGqwbOtZ3Wc9NHpl3+bqLRnrp2RiRjAJBgr9eQXpXJ92eGH1kOzyPjhNKpVKCH
	NJwFsjtN6kSRetRCw73HduLpUv89FDebiS87XGTdQMdRJV4uvVXWPRWJ1BnUh90l
	z+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U9OHKH
	b1r3NrWD2xUGwW5NEwhuYoka4RFeKE+96Zocs=; b=xvhLgnG1Z5T7yJNyr4U027
	/N+b0lgcN1St/Ki10Mwj6obCPxxeu5mTwLxez/aAiP5KeIy2Q78iVi2fRRwa2Slz
	ATil3noaFuFogC8z9H4cv2Kn6yHQyOfFP08HvUQ5ELkD31ZE2pV6V0Dpr4EGZEOn
	ZPaCeqh6bnK3UGULQjAKHaYPzE3yLoH95tAB48L24JiYBRHILBBsXgUUc1cR7a2S
	myMq17dhgQSXxbN3zaC1UdvrDmZ+nA3YFrO1CiRMWuttbMNicqbcqQMkCwKzldLi
	OBC5iF1LlBTzfOk8LYpKzDwMqcC9yGyzWiGhmdSM1kA/RPD4FSxUcJbB39LanwzQ
	==
X-ME-Sender: <xms:nTDKW7gl9dKQP1ppgtYC4qrMpmKPBBP2JSmrONecDgo9JqnMuPPWNQ>
X-ME-Proxy: <xmx:nTDKW42wDWfmLVV1807uuZmVZ9XkheYh01tytSnMjVYvi9KuQetTrg>
	<xmx:nTDKW-QXbgUAsExR9i25VraXBE6XSqlkcN2CMtednBEpXLbbSqZjnw>
	<xmx:nTDKW0uCvzOtPkahyzscM8H2CwPyGvPh3l-Inn6H726XwWHkIl8Qgg>
	<xmx:nTDKW8Lhah12-LC460kJSztX0npJ8JV3XZdMyMNvwoQHD8Fowy059Q>
	<xmx:nTDKW4c1sJXPUEwRxFWceJss7POTAmjNebLNUZcH-yBy_gnxWIbt7w>
	<xmx:oTDKW4TwsyiLX_EKlKpo87NEADIzJBHU4CmRPoGqwIq-QKn6xJQocA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5171AE489B;
	Fri, 19 Oct 2018 15:29:33 -0400 (EDT)
Date: Fri, 19 Oct 2018 15:29:32 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181019192932.GA17761@flamenco>
References: <20181019010625.25294-1-cota@braap.org>
	<f7067d72-3b2a-9e6e-4636-f18ac1cf5202@redhat.com>
	<20181019145018.GB7279@flamenco>
	<6190036c-cd1f-4549-9b7e-9e7913c972d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6190036c-cd1f-4549-9b7e-9e7913c972d4@redhat.com>
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
X-TUID: KQbaMx1J7JXq

On Fri, Oct 19, 2018 at 18:01:18 +0200, Paolo Bonzini wrote:
> On 19/10/2018 16:50, Emilio G. Cota wrote:
> > On Fri, Oct 19, 2018 at 08:59:24 +0200, Paolo Bonzini wrote:
> >> On 19/10/2018 03:05, Emilio G. Cota wrote:
> >>> I'm calling this series a v3 because it supersedes the two series
> >>> I previously sent about using atomics for interrupt_request:
> >>>   https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg02013.html
> >>> The approach in that series cannot work reliably; using (locked) atomics
> >>> to set interrupt_request but not using (locked) atomics to read it
> >>> can lead to missed updates.
> >>
> >> The idea here was that changes to protected fields are all followed by
> >> kick.  That may not have been the case, granted, but I wonder if the
> >> plan is unworkable.
> > 
> > I suspect that the cpu->interrupt_request+kick mechanism is not the issue,
> > otherwise master should not work--we do atomic_read(cpu->interrupt_request)
> > and only if that read != 0 we take the BQL.
> > 
> > My guess is that the problem is with other reads of cpu->interrupt_request,
> > e.g. those in cpu_has_work. Currently those reads happen with the
> > BQL held, and updates to cpu->interrupt_request take the BQL. If we drop
> > the BQL from the setters to instead use locked atomics (like in the
> > aforementioned series), those BQL-protected readers might miss updates.
> 
> cpu_has_work is only needed to handle the processor's halted state (or
> is it?).  If it is, OR+kick should work.
> 
> > Given that we need a per-CPU lock anyway to remove the BQL from the
> > CPU loop, extending this lock to protect cpu->interrupt_request is
> > a simple solution that keeps the current logic and allows for
> > greater scalability.
> 
> Sure, I was just curious what the problem was.  KVM uses OR+kick with no
> problems.

I never found exactly where things break. The hangs happen
pretty early when booting a large (-smp > 16) x86_64 Ubuntu guest.
Booting never completes (ssh unresponsive) if I don't have the
console output (I suspect the console output slows things down
enough to hide some races). I only see a few threads busy:
a couple of vCPU threads, and the I/O thread.

I didn't have time to debug any further, so I moved on
to an alternative approach.

So it is possible that it was my implementation, and not the approach,
what was at fault :-)

Thanks,

		E.
