Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1993120wrx;
        Fri, 29 Mar 2019 08:20:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHF+sUGFTNCGh87xaHwy1Qz/i+vRfwdQqZWST8lFVKsMkPpnsUYffI9C0om+KvLo1Jl1Sb
X-Received: by 2002:a6b:4102:: with SMTP id n2mr12821710ioa.256.1553872807335;
        Fri, 29 Mar 2019 08:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553872807; cv=none;
        d=google.com; s=arc-20160816;
        b=XD+5e506yi8ghvit5vJpwwSG9dA7XmB94KGaDTuFKYrMzuasZtq4EHZM0ArWBQBQph
         3bs7ldx9NVK4nDtXNK02/+Wx148Za1tBSCLpMQettHnqjHIWy4VX7gdhtK1IH7dVGPAa
         MXqgheAPlC/4SiqCgRBCLKKvXZo7Xt3GzsP9cUirNJFL73AV5poBhAdOjgstriKxDzSL
         YANJEbZBy8bCsuMlUnoC2a8hTxZfmi2A/G5WisZ6QnFwrd2Q7JULxAwngJAKh4kENiP/
         xgoZtoKc2YoEW/5KwQXd162TonCmiEQFh6dJOKQ53j10wMXrGQd1OKBq8JhQTRHPzMtz
         GqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=knWxBdaYrem1PH+4nss4aOcj2H4D+0harS/PiXKYDgQ=;
        b=VuydrEvlPxKWaSc4jw3XoFM/nKhnx48u+rZ5UjWbzWw+EEuMxvKyo52rTCJOjCkqXy
         mIWibSgP4mqoA54NhKu+ODINVBwTqLzls05dB7tTEqeR6X6cAd4UhpujbWPBVXKu7bO6
         xTP0sXJzEkgEwUM/iL1yEMuLI4UA6nOdPWVPSBVKopZfD2oKjN8qjrXnoW3qQzTqPVDc
         3beRkOTcocWZRVPqdnzoyRkSC9ehmcf3rqEQmfYNh5fxYpDadCOZPPWKC5rqHeiEltGL
         Bxj/NzNA11KIlffNJPJPNDVdn8u0ODIat6CCvmocm/+xVqAuGpc5V9lInn++6BiVAS0L
         o5+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68si1188573itz.36.2019.03.29.08.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 08:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9tIc-00086b-K5
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 11:20:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9tIO-00085e-Fh
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 11:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9tIN-0000p6-Kd
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 11:19:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h9tIN-0000oL-2T
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 11:19:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id p10so3091174wrq.1
	for <qemu-arm@nongnu.org>; Fri, 29 Mar 2019 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=knWxBdaYrem1PH+4nss4aOcj2H4D+0harS/PiXKYDgQ=;
	b=FfmbJEifmdEriDFScMKEvEN8XwCLjAyr3tHQ6OMDDAeMeFjezmI+xn5Ozk1C1Vxz34
	il61OQO+m62Bn1fV8Hce86moXNA45Fzmes75IsS7cgjCGCYM6GM52YkMMr/pJ0zXoCfZ
	3xyY5NbeXYl9lZLZxPZdWlgeUyRVoCIt0qSqw3yjWLuc7hgJ+gB9AmnUO/SO/PbF5+DW
	uzmmx+FHAw5YsU+hJdQsst9nih88VKkexyLiQNzCDYu+YHPHB/XnbBynC5W1q/CsyD8q
	YJDMtDrKzWRquOxfCJFPqzpoU6PzjDBXTPneEOZOqQIC1FJAirZsWfJJz/uPJwxrGsX6
	os3w==
X-Gm-Message-State: APjAAAUuF0LxuYOkpCHtaoO2SBIAQLQOaZmRSooT71U0BoDZ71mw69eD
	62bQPD82Rf8re0H6QVSce902cw==
X-Received: by 2002:a5d:69c1:: with SMTP id s1mr34828291wrw.245.1553872789369; 
	Fri, 29 Mar 2019 08:19:49 -0700 (PDT)
Received: from steredhat (host40-210-static.34-79-b.business.telecomitalia.it.
	[79.34.210.40]) by smtp.gmail.com with ESMTPSA id
	m13sm2465864wmg.42.2019.03.29.08.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Mar 2019 08:19:48 -0700 (PDT)
Date: Fri, 29 Mar 2019 16:19:46 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190329151946.yr5xvihczbza6xxp@steredhat>
References: <20190328152635.2794-1-peter.maydell@linaro.org>
	<20190329131304.fnh4fjyhtw2eji7t@steredhat>
	<CAFEAcA89948Voc8vC2CUuPMMiuVFz7QxU7FMQzNPEwtLBD4ULg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA89948Voc8vC2CUuPMMiuVFz7QxU7FMQzNPEwtLBD4ULg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips:
 Avoid variable length array
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
	Alistair Francis <alistair@alistair23.me>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OkI9sgIJxfUN

On Fri, Mar 29, 2019 at 01:50:04PM +0000, Peter Maydell wrote:
> On Fri, 29 Mar 2019 at 13:13, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Thu, Mar 28, 2019 at 03:26:35PM +0000, Peter Maydell wrote:
> > > In the stripe8() function we use a variable length array; however
> > > we know that the maximum length required is MAX_NUM_BUSSES. Use
> > > a fixed-length array and an assert instead.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/ssi/xilinx_spips.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> >
> > I really think is a good idea to remove variable length arrays!
> >
> > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Yeah; we have some but not a vast number, so I thought I'd
> whittle down a few easy candidates. Feel free to have a
> look at some yourself :-)

I'll take a look for others candidates :)

Thanks,
Stefano
