Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5847418wrt;
        Tue, 16 Oct 2018 05:47:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61hts0QlvLCXTvtYDFt8cHLd+91+4t/DKnE8ePm0VSOP4jm4ilae0UoiwTpKv/CEbXhQ4JQ
X-Received: by 2002:a0c:b994:: with SMTP id v20-v6mr20727046qvf.110.1539694029956;
        Tue, 16 Oct 2018 05:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539694029; cv=none;
        d=google.com; s=arc-20160816;
        b=KPZt5WeyUdD7dDSaMO8Pu3hAqwciZIu7rHKhrsxf0kxZR4RcqFLWP+YEBOmFkYXaqS
         xFs1GSXeQnYpIFpsNVIgMJMfKuhUdGlssI4oddOi9iijAfjo1C+//w6apYVNxTxZbysg
         9lZrKBMBJJySqlEmhFjcFiG2prOq7liTgOABGQJ2yXizmwOGkDRmghBUTDamG3vZM/0T
         cjIBVWqesa4GN/WII2jZnAsO9YgbguC1NaGxcrjXpHlL0JGOy+4q8UHWDSX/3mkcNNJ3
         azBk8lv36LFUURPbPen0iQ1EbHavWLNhge/1m/JwyPRe/BN9q2RxtoaWFbiLgkvszSuO
         pwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=1am6ykS4WWM6xRZyfnxdluMi2mj1/MGXoZplXJgEmg4=;
        b=CxxFp5me1czK065dHPDL0MSaMKY5VhdtvGwvFdJ2kaNOOeV6NRUQKG1HnrH36bvG8j
         ECk9ZOCHVO/853Jm3BsOS038ABSFQMyBqLz0Ye+zp29knIRj5YLHeUTvVZoONuvS4uay
         hVaQ7CxqzUmo1ggpvmviuyQfh/O0Ca47WxVWouVQnjpYKNTbuApATlYpM4YAhePQpDKH
         mJNBcsQm1avNmUMshes6816AnraAOjkT1caze8H1MBFqtf6PqtXORK5LRT+G1ibmtbWk
         OiDcSTs6aai/fogGAnOVhLMGmTwPyA1eP+9hk1yUC/w6lgcrF8zhN++iaBeyobuc41nm
         EvSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JLZdcxBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si491342qvf.61.2018.10.16.05.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 05:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JLZdcxBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCOkf-0007j7-G6
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 08:47:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCOkO-0007i8-2I
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 08:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCOkN-0001of-9R
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 08:46:51 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:33994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gCOkN-0001oZ-4K; Tue, 16 Oct 2018 08:46:51 -0400
Received: by mail-qt1-x842.google.com with SMTP id o17-v6so25471789qtr.1;
	Tue, 16 Oct 2018 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1am6ykS4WWM6xRZyfnxdluMi2mj1/MGXoZplXJgEmg4=;
	b=JLZdcxBKAsO1dP2S9NV3migS4bGiEkOnUlB0VpoE76ybQzxzrcpFdw89moVdjcHKnd
	O3lmzlPcnBhZBd21r7jP2xqX9/hr6j/DgYTjNFi7iR1feN/qHgTxByU8wXe8bpeZuS5v
	7nG6+2i5CSRw8ho2oCxn3VJrSVZQyHT2A2ewFxwHYo1BTTTytHZi0MS43TFTaQVk3sja
	kHT9QXE1GpmOJYEFcICAiymNXFF8ex4w9b6P9G513F1qq3IM72xK/qgTtouCpX1+zDuo
	ERm9DXpim/9lR3UGXrxHgumTc5Jeka5xglTHEWlepqx0THma9pI/ahFDztZuP64mviHj
	WJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1am6ykS4WWM6xRZyfnxdluMi2mj1/MGXoZplXJgEmg4=;
	b=lRKTEMqlOB8JE7LgmiqggMV8V/tnACw036lhPCoMBJr09QJFd9SR9Nx1mY8oe0UGI+
	hZpIHTjxoxrY/vhywcDjANmXTY6PKDuwvWycQLT0/+Y5nooVD0qIX/PHa8+Edz/08F62
	gdBO9p5tM+RymwcHQulc7wkxqDlXutrVSVgNLmhO8cWDgUQ17HMNYcwYXcwXQ/40dHUc
	wGMQh3wvi9q9KyAzM1Jl5MGwT+nq7wps7aNDgpQvrQzFkeGIu2+AWGyjGrgo7BiUTjlh
	cB5O39iUiWIn6qmONTTgxjaTsIiDRltRbW+SIBzn2LimrR2aHMAsZh3MuhxNh/hPhv60
	qLeg==
X-Gm-Message-State: ABuFfogyS9wAArumwIpt+bQcU5uI42+lBSvLsb8J+AI07Bs/VvQ3gyW6
	75tT0W8TwQHGG8FmMwFQl8g=
X-Received: by 2002:ac8:83a:: with SMTP id
	u55-v6mr20199990qth.48.1539694010648; 
	Tue, 16 Oct 2018 05:46:50 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	c43-v6sm9911089qte.12.2018.10.16.05.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 05:46:50 -0700 (PDT)
Date: Tue, 16 Oct 2018 08:46:49 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181016124648.GN3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<CAFEAcA9cACQa7A8VUdfuSk-FcmFeHu+4x5m7HDE1A-+LYcwvXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9cACQa7A8VUdfuSk-FcmFeHu+4x5m7HDE1A-+LYcwvXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-arm] [PATCH v6 00/14] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HdqGU59SDKSg

On Oct 16 13:01, Peter Maydell wrote:
> On 10 October 2018 at 21:37, Aaron Lindsay <aclindsa@gmail.com> wrote:
> > The ARM PMU implementation currently contains a basic cycle counter, but
> > it is often useful to gather counts of other events, filter them based
> > on execution mode, and/or be notified on counter overflow. These patches
> > flesh out the implementations of various PMU registers including
> > PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
> > arbitrary counter types, implement mode filtering, send interrupts on
> > counter overflow, and add instruction, cycle, and software increment
> > events.
> >
> > Since v5 [1] I have:
> > * Taken a first pass at addressing migration
> > * Restructured the list of supported events, and ensured they're all
> >   initialized
> > * Fixed aliasing for PMOVSSET
> > * Added ARM_CP_IO for PMINTENCLR and PMINTENCLR_EL1
> > * Addressed a few non-code issues (comment style, patch staging,
> >   spelling, etc.)
> >
> > [1] - https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg06830.html
> >
> > Aaron Lindsay (14):
> >   target/arm: Mark PMINTENCLR and PMINTENCLR_EL1 accesses as possibly
> >     doing IO
> >   target/arm: Mask PMOVSR writes based on supported counters
> 
> Hi; Richard has reviewed most of this series and suggested some
> changes (thanks!); I'll just take these first two patches into
> target-arm.next, since they're simple fixes that have been reviewed.

Thanks, Peter and Richard!

Is anyone willing to take a glance at the final patch in this series,
"target/arm: Send interrupts on PMU counter overflow", before my next
iteration? I'm particularly interested in a review of the approach I
took for detecting overflow.

-Aaron
