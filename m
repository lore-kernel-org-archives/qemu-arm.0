Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4506000wrt;
        Fri, 19 Oct 2018 16:46:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63kLfQZNcAA1Dg5W042f0wSc/QDY22DhrBPYQDQ1BD4R6698zmcqJh9wvoVQT0b9mJqHfg8
X-Received: by 2002:a37:3642:: with SMTP id d63-v6mr33569965qka.306.1539992797898;
        Fri, 19 Oct 2018 16:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539992797; cv=none;
        d=google.com; s=arc-20160816;
        b=mRKgZU5u9SAlsvkYiJTnFfSlNqiTNDE3/HDKEw1+OHSj09upNY1dBsfECX9ZQBI6TH
         8/TbhuU+DeCtYD5ygJJvrRDGj8At5bvfO2/1F619Qwlftpmkrl7l8/q+VWe7Yo8UedRU
         xQMzGx4kcROQg0HTtZHpggcsxuW2D4CDAhtDs72MqE453BcFtbiZlsFnUjATw1uw9aNE
         xGoBPvLy2Tvflgz2E7JSqMzy7/qZTMKnGNDJvV4vhb+R0wS/pobdiY9hiR60Y2DM8p56
         ofsOJwSa1lfJ4f2pdhTTr5oOxvBmKkgpHYnLu2FxObFdh06iDk6KII1TZLaD90nYRwqC
         Wtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature;
        bh=r2wZV8RiAIuzOfbpHWBIH+hxRH4LBZOcToVYN/gL8cE=;
        b=KO3OoHOE0Sxwoh+uk8WAY66sOaEwHagg8WcLJoKdu0oGfnkXXgvO8yY6a2kR1U2tgv
         3zZ6L16BzpAqPxqwVeYDFhOuWrONphqP6h2aFXW5LnVHgkPKUeKLinT3qtnBpZDbPEDL
         DSQyVvX5y84LMllki+fundjtdFQYGVybmU+CpYZZw7RfeYfLjG30nok3dxCYhJi7rOpC
         CxDHSTWlYPpq5IUNhJSDUT34/F8nZZo0M81eTdLDh2YBzfYpaR0Bf1ehXRrc7hh31/Bn
         58xQ26DazOgQifC8RDsQb/vpecRNveRh0bRjUd2jqlKwiE+RbGD5Lksmuf8Gnp1oxa3k
         hfrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=oDF1Y1NA;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MnxhQC23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14-v6si1357552qkk.201.2018.10.19.16.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 16:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=oDF1Y1NA;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MnxhQC23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDeTV-000148-FJ
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 19:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDeTM-000140-PD
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 19:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDeTB-0006qI-4b
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 19:46:23 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37367)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDeTA-0006my-5p; Fri, 19 Oct 2018 19:46:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 014BE22133;
	Fri, 19 Oct 2018 19:46:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Fri, 19 Oct 2018 19:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=r2wZV8RiAIuzOfbpHWBIH+hx
	RH4LBZOcToVYN/gL8cE=; b=oDF1Y1NAnnIX4THEtdU9Brfr0qcCjRzeAX9ALIwG
	gauE1+xG1Istmb+yJ+4ksB4OWHsRd1b+KLPZ0BKG64fHaxK0k8BPrM3qO7jlJFBC
	K6pgqp7PymLkFaQFIFG7cW65QKozeGaG/zYYSQ7/QITGIM0V14Dor/QgtxRLJnzH
	2DQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=r2wZV8
	RiAIuzOfbpHWBIH+hxRH4LBZOcToVYN/gL8cE=; b=MnxhQC23ZR1cljYdsgrlfu
	s0LrJKpf+nAS4wETsGWWHveJKF5XokmMn64+iej7LkU3w+ZS++5DkrH9B095n71p
	a4od9myCIXAVV7QVAjxjsPTyjZah5S4JYxQP4oB2gG3GsKsJDavt7rU8f1aIhPw0
	GkkSWMbpclTsCNAjEiDFHPpw62lC5HqfO/XxqSeaetE+yw6C8G5UAOmb3HuBOOGl
	BR/y8v+fI2FUo7jJw/3Jm03QRq5TXtIPeIPSBHWjstyhQjTZr5usSJRx/sgHNdVn
	EmlI5Zm6RpEMltPkannbAqiR/MNmLYWodn2UDEoBiujE6RcCP9cxWcJu6plQslbQ
	==
X-ME-Sender: <xms:wWzKWw5ag4G9k2sSBkVUlMeeu97FLcHpGdRPNsX41UN02_iDuxM6ug>
X-ME-Proxy: <xmx:wWzKW1PH3D1zIC4cJK3Wz-dtxvPi8ljdjfAPm_oBgsrMe0fojAuZjA>
	<xmx:wWzKW2x8YL6v6ey9YHw9AepfsjGCcy68gL8uGRjm5pgJ032vdoSyrA>
	<xmx:wWzKW-98YYc9-n75hff1nPX2eMpdkLGa8kA9WCGCcc6zdYDMQbN_kw>
	<xmx:wWzKW4xeb6jXk01kYEiG5ESp4GDsAe7RfJnQGS5C-wt_I7dLVB7rnQ>
	<xmx:wWzKWzElqbu--ni7q4KarhPrLWZLnY6qzUsdX8hghSO61dnJcWyg2A>
	<xmx:xWzKW_ngwqdlQz3SNqs48-KuWJPdKp49XIuYgCTsehn0rxWvDLuExg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 46C75102DD;
	Fri, 19 Oct 2018 19:46:09 -0400 (EDT)
Date: Fri, 19 Oct 2018 19:46:08 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181019234608.GA32420@flamenco>
References: <20181019010625.25294-1-cota@braap.org>
	<f7067d72-3b2a-9e6e-4636-f18ac1cf5202@redhat.com>
	<20181019145018.GB7279@flamenco>
	<6190036c-cd1f-4549-9b7e-9e7913c972d4@redhat.com>
	<20181019192932.GA17761@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181019192932.GA17761@flamenco>
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
X-TUID: +bPJ6bI4OP15

On Fri, Oct 19, 2018 at 15:29:32 -0400, Emilio G. Cota wrote:
> On Fri, Oct 19, 2018 at 18:01:18 +0200, Paolo Bonzini wrote:
> > > Given that we need a per-CPU lock anyway to remove the BQL from the
> > > CPU loop, extending this lock to protect cpu->interrupt_request is
> > > a simple solution that keeps the current logic and allows for
> > > greater scalability.
> > 
> > Sure, I was just curious what the problem was.  KVM uses OR+kick with no
> > problems.
> 
> I never found exactly where things break. The hangs happen
> pretty early when booting a large (-smp > 16) x86_64 Ubuntu guest.
> Booting never completes (ssh unresponsive) if I don't have the
> console output (I suspect the console output slows things down
> enough to hide some races). I only see a few threads busy:
> a couple of vCPU threads, and the I/O thread.
> 
> I didn't have time to debug any further, so I moved on
> to an alternative approach.
> 
> So it is possible that it was my implementation, and not the approach,
> what was at fault :-)

I've just observed a similar hang after adding the "BQL
pushdown" patches on top of this series. So it's likely that the
hangs come from those patches, and not from the work on
cpu->interrupt_request. I just confirmed with the prior
series, and removing the pushdown patches fixes the hangs there
as well.

Thanks,

		Emilio
