Received: by 10.25.150.194 with SMTP id y185csp237493lfd;
        Fri, 25 Nov 2016 01:42:38 -0800 (PST)
X-Received: by 10.200.37.221 with SMTP id f29mr6318780qtf.123.1480066958542;
        Fri, 25 Nov 2016 01:42:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si17466007qtd.332.2016.11.25.01.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Nov 2016 01:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cAD1h-00085j-UE
	for alex.bennee@linaro.org; Fri, 25 Nov 2016 04:42:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1cAD1b-00084r-Kp
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 04:42:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1cAD1W-0008Le-Vx
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 04:42:31 -0500
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a]:35867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <christoffer.dall@linaro.org>)
	id 1cAD1W-0008Ij-Fh
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 04:42:26 -0500
Received: by mail-lf0-x22a.google.com with SMTP id t196so46428684lff.3
	for <qemu-arm@nongnu.org>; Fri, 25 Nov 2016 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4LRf7ab3sNvKWt4Z5rss1iJ5A9xVZkiyErLAgjdrxk4=;
	b=VPHtJlm/58VAGrJtsvU8wczVLkPipeehPPO3AZ4c2jZGIsHkbokP4v5C1Ne8gIg0A1
	OFdukRIBA2GDB+qsbgHZdj5hco6lAaZ8zllYv9SyBa8N6604J8DJFBcARu47YboSctQX
	ojFvMjb52krb+jTkTH8Y/mf35kSj35xWdeQeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4LRf7ab3sNvKWt4Z5rss1iJ5A9xVZkiyErLAgjdrxk4=;
	b=CF36xcwHDOEbpdBjjaaKAoE1NK4G2XJ60IqqRQuXEup3afa4bfDAgpnaYsVdWzeDUH
	zqR/xmK8IcedY/Q7hKYRjOBulWg5iTzA7aMsPGhTgFelFVgV8BNPruhA18X/4CAgMD7e
	1uGz4k0aMWzQHubecyT1U64Qqz7pzqBkzk8j0tSO2n3U+aNcTrhWvQLZLxn+b1Z/kaiC
	V7pOeeKIGDcDollDRPMaHXg+enGV3JDdBL9HpX05ky/N4i0zuU3MJdJPZdK8LEqWlRmi
	fLI8fID7j8WGfgim+Yhkk+BMkBDqP5HBFZQO5RdWmSFKwIpPhabbYu20wsIyy0tDGpgX
	EfXw==
X-Gm-Message-State: AKaTC021m4GtRhDACcxHTgBGz7fdb2tVDT49cvfbp4a5bmQPHiI++SEnEN2kbTirYZB5ihgy
X-Received: by 10.25.219.65 with SMTP id s62mr2470298lfg.35.1480066944561;
	Fri, 25 Nov 2016 01:42:24 -0800 (PST)
Received: from localhost (x1-6-50-6a-03-de-ec-c2.cpe.webspeed.dk.
	[2.108.209.202])
	by smtp.gmail.com with ESMTPSA id 89sm9113095lja.16.2016.11.25.01.42.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 25 Nov 2016 01:42:23 -0800 (PST)
Date: Fri, 25 Nov 2016 10:42:20 +0100
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Vijay Kilari <vijay.kilari@gmail.com>
Message-ID: <20161125094220.GC14809@cbox>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-2-git-send-email-vijay.kilari@gmail.com>
	<02c5cf76-e3c0-5496-dfb3-d933e540d7d7@redhat.com>
	<CALicx6vPJ9ZruSdm=w1LPWZdgrAxJVN2o9ktCYHFA8TbyakDSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALicx6vPJ9ZruSdm=w1LPWZdgrAxJVN2o9ktCYHFA8TbyakDSw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 1/4] kernel: Add definitions
 for GICv3 attributes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjUBqKxDwuKl

On Fri, Nov 25, 2016 at 02:12:12PM +0530, Vijay Kilari wrote:
> On Fri, Nov 25, 2016 at 1:27 PM, Auger Eric <eric.auger@redhat.com> wrote:
> > Hi Vijay,
> >
> > On 23/11/2016 13:39, vijay.kilari@gmail.com wrote:
> >> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> >>
> >> This temporary patch adds kernel API definitions. Use proper header update
> >> procedure after these features are released.
> >
> > Did you send the complete v6 series? I only see 1/4 and 4/4 of this v6
> > (https://lists.gnu.org/archive/html/qemu-devel/2016-11/threads.html#04318)?
> > Did I miss something?
> 
> Strange!. Yes, I have sent complete series.
> 
I am seeing the whole thing.

Thanks,
-Christoffer
