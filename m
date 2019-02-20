Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5052117wrx;
        Wed, 20 Feb 2019 14:50:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYiKrGH7VqSb+L6OZPg2LXviBTMNTDBc4bzugJ1z99LQBd2IR1Qdem/CKTZajRo4FwdqB57
X-Received: by 2002:a25:c050:: with SMTP id c77mr29994507ybf.459.1550703056263;
        Wed, 20 Feb 2019 14:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703056; cv=none;
        d=google.com; s=arc-20160816;
        b=HBeyusNknHbPCjAaQ6gYyVMpZoLLp04kYWh7z50/DYuTIgxKoFhICfazT31GIyLyBL
         920FG5YAmFLUW5Csb78eEbdT642w94oUj61eaUogMTRiHDomiWbfm5qmCUp6uUzEaw95
         URS9MP5ea43vbPsSNvI91LG+lD5b6hHk/K7RLB8BTgnUbUxp1Jn8CItmjrL0oI0k/y9m
         dMsvA4iVdHa9ivHd2r/O16fEqJatlPO5HceJ9a3OCvO07JVhTNCkuFID3vjf2zajZF1L
         LImtMJiF1v7vdY8JtUHUiWx9HUcmfuy5BlHHCHjxB8O2sfCv/XxA09nI/ZuuLAW5Mz3m
         gyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature;
        bh=EudDAC2Yr0yKC1BuX/sFf5U4Pzk056iWdb4RJV7Oq70=;
        b=L9l068SwkWiBYTvt4nhNi4ZBvmcEcjQCaQv5tGsWtq6VKZz0vnjDAQXsrCWKTGb2BR
         dlCJzZ2XafxGAe/1kKtV3P8UoeDDKIgaonj5ARU1dbj3+pKhcLeyATLMR2iAtEGRqrGi
         XEuN3gEVSaEyCpTYUTh5Y1yg8eQ6tomcvt/rqjWEN6QDtCJkq8mVIseR8wdY+ujMkCx5
         f3ikxom9HmNTLoGGbCKzConAi2SK6Zq4zRmT2MuKQLzlDm4vUN7IQ1yBWB1eaZV6diDs
         uuEc0CwNVMy6gcAH13oMAcFLoTpSR+o5loIxiNaO0RdMXhY/Qi7NEL0brMReMaJ2amPF
         kHIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=ZrmOsscO;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=2Gyb66Vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c74si11489893ywc.400.2019.02.20.14.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=ZrmOsscO;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=2Gyb66Vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwahb-0003uy-LU
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gwahF-0003tG-Q8
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gwah9-0001NF-N5
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:50:29 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gwah7-0001Hr-G5; Wed, 20 Feb 2019 17:50:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 633CF22A6F;
	Wed, 20 Feb 2019 17:50:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Wed, 20 Feb 2019 17:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=EudDAC2Yr0yKC1BuX/sFf5U4
	Pzk056iWdb4RJV7Oq70=; b=ZrmOsscOePmao0KJo1K27ZiBq9F//A95BExbWc97
	hjBRAc/6wkI0kRWnSgmXRuLlZPBZxZ8Fai20bwPc8ploSojOS0TyNnW1RbgYTqFm
	pg1AM4L2BoXdyXtWXgL77D+Uvrww+rAl7m/yko/cMXMWAX7RclFkr6d6hQgoNxVa
	sCU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EudDAC
	2Yr0yKC1BuX/sFf5U4Pzk056iWdb4RJV7Oq70=; b=2Gyb66Vp3KoD/KDi/5REdG
	onsWr7pqlEcmeTuYsBO3ILRcjbYJaqhP0ESHWz34tdvaln80NUWjRfm/57rokc1i
	SL3oDhdZyfr1gypqfmAHxmKaGasusT2LXHsbbbIJa+0ZKulczusS25iSJQJO3My/
	wdj6kn+Q3KW54wjxPVWXBqrhGpNZpdKDU5E7hZY95H4ItoZMBd7HpexR5IXXtMrD
	PB46+krlr6g41vAcCZJXoQ4NwOFquwQAfjq1sQeLmuuncKY5cSscwsmIecQJEE2l
	QFToPrs4RADfBpxgDyaN1RoK/OsIHQzgd2m5wEPCFtydsb/Oajc3/Hs9TuRkdWCQ
	==
X-ME-Sender: <xms:qdltXFKTs48iewtbx4BkdJ82Vs6fIeu9LwNLzB8VVsgPnrXEFj7xDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdejgddtvdculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepfdfgmhhi
	lhhiohcuifdrucevohhtrgdfuceotghothgrsegsrhgrrghprdhorhhgqeenucfkphepud
	dvkedrheelrddvtddrvdduieenucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegs
	rhgrrghprdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qtltXI6oO0yM54c1gGXAim3hvxHtYlPp61GzXW6c861U6CFKd8KczA>
	<xmx:qtltXCvI0eyj2Dx2S80q_NdCg6ws6BobBrixCJgLGET55B0rT-5Ryw>
	<xmx:qtltXOaWoSKN1Jw8BQ4lbYtKcHRa9EJamk3PpaGcz0Yfk0yrc0qJtw>
	<xmx:rtltXIDbndoLTQR2dVQIU3IDK2GmsFc1YRBqXL9kT4WnJwI6x68WIQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 561D210323;
	Wed, 20 Feb 2019 17:50:17 -0500 (EST)
Date: Wed, 20 Feb 2019 17:50:16 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190220225016.GA19073@flamenco>
References: <20190130004811.27372-1-cota@braap.org>
	<70297ac5-defa-0d7b-b4da-44303b328ce2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70297ac5-defa-0d7b-b4da-44303b328ce2@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v6 00/73] per-CPU locks
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
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
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
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/CdF47XET39

On Wed, Feb 20, 2019 at 09:27:06 -0800, Richard Henderson wrote:
> Thanks for the patience.  Both Alex and I have now completed review, and I
> think this is ready for merge.
> 
> There are some patch conflicts with master, so if you can fix those and post a
> v7, we'll get it merged right away.

Thanks for reviewing! Will send a v7 in a few days.

		Emilio
