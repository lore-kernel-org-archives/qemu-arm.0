Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5510208wrt;
        Mon, 26 Nov 2018 04:53:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XyPb9nL3fvyURg9F/mT2dFFQBJ0khlT7tg/OCLB+Ld8vu+r6A380vY6cxRAxT3+/gvh7DB
X-Received: by 2002:a81:4641:: with SMTP id t62mr907304ywa.261.1543236804075;
        Mon, 26 Nov 2018 04:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543236804; cv=none;
        d=google.com; s=arc-20160816;
        b=QajSlMfKyqSoOTd61QfxQNauQ8JLRVBHY2xuFc9BjophDCkwgk7UKWeT3gLDuFRkZL
         qi84dmkLQh0f7CVZ4SuNdAo9UH3gXlEBnjo6f1U6o6cOyVHsisD6WDL/95KECb5DOflb
         Wz65xUFCf86zdF7laI3W3SMGWA4uBS5ODj6MP0i2Q7pvx3sPn6CiFwuXL5dB6npEBSxD
         cszoBA7DpbYgDYArHiwBsv6tk3pDXdPn1xlACCl6yEDZTqF1bhNA6+yh359PIxOE+2iS
         qSVLO0yJ5/U8cwbfAMACy1mswi4Fky9D5OjkNGKOrje+1zrEOTvmKhgT75/R/LSg/i4L
         fMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=FkNe/ymR90qOfDsRqDxyJ0iJUNe0JsKWYdKQvFuZ8Ck=;
        b=TMsx6XH9MdVP+vJqmNYc8Qb1BSB4IMIhUiD3bG+ZIJkRaXcMktVXb6bbI/O1JKOWzz
         0eQ7itMbL8hs+dCXliEME7ylgd3tMQE29lYLM/ySrsRXS/lyJ4KHHw2UM/UPMjXvZCTT
         QFFMAgXINP1DK8mWYRaCdgB+WqtIVAHQV4bdkIx8Jnh2D+R49ggqHfn45D+tC6mFxVQ6
         dsaOZLSjhsnjqy6/evV5DFq26ZDcPXv6uFTeifW7y2IK9aaCp00GvV3zCmJfhEXUNTQk
         LdOO7dIrBB7UpnEiziClU3qZheBxn+6R+x3pSUnhpJJFymWmRMSmTiRLnORQraJhHTVT
         AJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eCf/7ug0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m125-v6si173518ybf.94.2018.11.26.04.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 04:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eCf/7ug0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRGOB-0006jj-4g
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 07:53:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gRGNS-0006j8-Ho
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 07:52:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gRGNO-0007wl-Jb
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 07:52:38 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33561)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gRGNO-0007vO-Cb; Mon, 26 Nov 2018 07:52:34 -0500
Received: by mail-lf1-x143.google.com with SMTP id i26so13448386lfc.0;
	Mon, 26 Nov 2018 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FkNe/ymR90qOfDsRqDxyJ0iJUNe0JsKWYdKQvFuZ8Ck=;
	b=eCf/7ug0CqOHyC8dq18gTuLp1x7kMrYKLA4MyT5D7OnuW81RbPwnQI9/03qFpC7Ut4
	T6fablFEYzA4q0B5YWyZMKIvdTDFUll5UoDq7rwv0aPGs3IgIlgp+7i/7lm6te9yOpnY
	4ORrCbsFOys9HbmirWD1INOU0a1d7Dy7u7ed24fU0ODGlfkKYYhMiPUO7sgC/HyX4/bl
	kqBSXkW2RY+H73yuILzlErRxHUzBnrL3ahrmxzDKn3bIine1EkgBJREUIMOhBJLYA6mC
	QYNc8D+WTkuCAEMKP8PQ5I1vIre1X4bgKfSyGYbwYFHO3ls4R/YANAJwIb3aqdbSWiMo
	i/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FkNe/ymR90qOfDsRqDxyJ0iJUNe0JsKWYdKQvFuZ8Ck=;
	b=BKuGxKGSjZeYAevmryRRFnUzMkCrQRlJ97+gnO6qqtKT+3e98FxnGDwhzwMFWw4hdi
	1pOHKCFcss9T1EuGkvTDnNhiRt+J26udQ83Jk8SuUQrzdbI0Qr2d+RVh7i+au2Vvs+ef
	pemf3ikNvDw3s60/xQc44efCy4UMYJGfNWSwv+pRVZdV2Fg+J2gaIp9sre12hbxbsFrI
	iXaJD/IeXDhZyHMgdF158RPycPRbTSp+4dglkg0dzdRS3fblE8qvXSCf+eJbJf9f3ciR
	gg8tp7ak9gpF6xBL2NweRCBdd/nXHk3+7r2xzDSbUvnwzb/lkMn6z+75h22rSveGUKYv
	zYEg==
X-Gm-Message-State: AGRZ1gL1nlo6bhb653V7PI32avViBFqMPdY3cXHW9PJ2j1sdb9VmHYvE
	4gZmUfEtC6/yYap2n3BE+Hw=
X-Received: by 2002:a19:7013:: with SMTP id h19mr17059858lfc.147.1543236752230;
	Mon, 26 Nov 2018 04:52:32 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id h3sm41897lfj.25.2018.11.26.04.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Nov 2018 04:52:31 -0800 (PST)
Date: Mon, 26 Nov 2018 13:52:30 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181126125230.GO1148@toto>
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
	<20181123165945.GM1148@toto>
	<CAFEAcA8vWT5sayyBzbU7S8BwA06Kj=G1izioufjHFJdsEkyq4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8vWT5sayyBzbU7S8BwA06Kj=G1izioufjHFJdsEkyq4g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, mbilal <muhammad_bilal@mentor.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ews1fCaMALGE

On Fri, Nov 23, 2018 at 05:09:35PM +0000, Peter Maydell wrote:
> On Fri, 23 Nov 2018 at 16:59, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > Not sure if it's too late to even get the removal of the assert into this release? Peter?
> 
> If you're happy that removing the assert is the correct fix,
> yes, this could go in before rc3 next week.


Yes, I think removing the assert is a suitable fix for the release.

Thanks!
Edgar
