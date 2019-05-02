Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp7124758wrh;
        Thu, 2 May 2019 08:14:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAJR7d+a7oYfQNT0TE7Sq+8n5DaKip1dLjn+icgaOXG6kZveTV2Aoxv4tqeoeVg1K4PKvO
X-Received: by 2002:adf:db0c:: with SMTP id s12mr3366186wri.184.1556810055694;
        Thu, 02 May 2019 08:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556810055; cv=none;
        d=google.com; s=arc-20160816;
        b=cncSK8P34HDdkD+4AgF7Vm+TxWGbNCgWzM2WhT0XtIzGoiSOmJGKVS1glLsPEvuetx
         KJEWvDUbneaAIaPYPj7vaVeSoxNVQRHriADIAg2i6blhnkm2FPslrBEQf/LE7vU4F5q4
         qJVpcEDEsHFL8W/DOEKxtT643pYc2ZTgH7PopMkgPmnpbw9H4TMdt2Sqi3r58r2aI13r
         Qya1G5unU5D0LIPX6hb1N5uH9XFCvmpYTLpYeDTM7bP4S3Wl6ds2lBdyzmvR0HGgDGG6
         u+QrVV7oK/HINbV8LHeltt7cdlXqjgrwkq6jq1JKrQ6PFXFEUJ/28zfV0PW4pJuaz+0I
         nBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=L1MGlIWCgiG0kO3PmDfux4PHz1go13lZ8nRjo0aEAEI=;
        b=L9mAoD3iuc5RRsfNIvY/BGS4KfZJdToRZI9sPrwBUzF6nbx5b+RuyI/9maCDyTXOPm
         BfG7MswazHw+DjiwW3nEPTEPZwq2SRm6+tK7/6w0jtBvyXDc8yMUw5zwwi9ca8z8PLrY
         J0UMt1x+BqzVMHF/DW2qW8HyFtVyEWZYafuqVdUjEbIG6VZGUDeUHBQONLMX1df7Wjk1
         3G1jRNkA8ZfZOa8Mlp7USVU8gZwko3uQsKW/SUCuSPY+liNrtVTD29iUvbNHaj0n/bZQ
         wf2HoCV6RJ2w/NcQ3+x7oFCcouKJCUDyWwqcMoxV+u5JOU58asc081ZJ2ZRd0TSSvKIY
         4R1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si11520559wre.234.2019.05.02.08.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 May 2019 08:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMDPa-0007SO-Oy
	for alex.bennee@linaro.org; Thu, 02 May 2019 11:14:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDCp-00042A-4s
	for qemu-arm@nongnu.org; Thu, 02 May 2019 11:01:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDCi-0006RB-Tk
	for qemu-arm@nongnu.org; Thu, 02 May 2019 11:01:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hMDCi-0006QR-Np; Thu, 02 May 2019 11:00:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4868307D978;
	Thu,  2 May 2019 15:00:49 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3FD608A6;
	Thu,  2 May 2019 15:00:48 +0000 (UTC)
Date: Thu, 2 May 2019 17:00:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190502170042.4b714211@Igors-MacBook-Pro>
In-Reply-To: <CAFEAcA-SFrcbQMdv19tJw_baGR8c_ngR2CtsgZKVXMALOo=zoA@mail.gmail.com>
References: <1556614240-36369-1-git-send-email-like.xu@linux.intel.com>
	<CAFEAcA-SFrcbQMdv19tJw_baGR8c_ngR2CtsgZKVXMALOo=zoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 02 May 2019 15:00:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/fsl-imx: move cpus
 initialization to realize time after smp_cpus check
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 98bir8caKLj5

On Tue, 30 Apr 2019 10:18:37 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 30 Apr 2019 at 09:52, Like Xu <like.xu@linux.intel.com> wrote:
> >
> > If "smp_cpus> FSL_IMX6_NUM_CPUS" fails in *_realize(), there is no need to
> > initialize the CPUs in *_init(). So it could be better to create all cpus
> > after the validity in *_realize(). On the other hand, it makes the usages
> > of global variable smp_cpus more centrally for maintenance.
> 
> I'm not a great fan of this. I think that where possible
> we should init child objects in the parent's init
> function, and realize them in the realize function.
> There are a few cases where we're forced to do the
> child init in realize, but this doesn't seem like one of them.

well, if it were unconditional then initializing children in initfn would
be fine, however here number of children to initialize depends on global
smp_cpus. In order to get rid of global, we could move iniialization to realize
time or init all FSL_IMX6_NUM_CPUS and realize only smp_cpus at realize time.

> 
> thanks
> -- PMM

