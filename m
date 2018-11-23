Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2295357wrt;
        Fri, 23 Nov 2018 09:05:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5dRqIGgxdD2LwsgCrjRhovrJkB3wuPPPOH8G00UVfWXTWlc36Fw3TgLTthMi6V3AhPd1eCN
X-Received: by 2002:a81:9382:: with SMTP id k124-v6mr18029005ywg.229.1542992756629;
        Fri, 23 Nov 2018 09:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542992756; cv=none;
        d=google.com; s=arc-20160816;
        b=nATEvOHhk80c1gNYFAvpPg0h4YwJhczNFVvCcZ45oYRHFxJONqXRmcbOr8ukdUqoxR
         zAnMCneIs7cMare4tAGLEcSkyTFH82x0SGc5RX8D5AjoWzKumL8U8XG0iQUBuRtZcHri
         9fBsaF03/fBby0jFeXKH3NmJWFHHFWC1Ojjap+54Ew6d445ylYLFw2pKvxtzNCa2gEdp
         GEIU/V1N9dDPthWVVp1gMnCbcM/50y/TlCNxKn07Y9ImpxhOC0nTCAJhlYq9c3jLdlVF
         5Rnve4PHg3zLfVVk/ALwtsJLwJR3h5EEvPL0k/pI6ZcAVtVC7W35bOAYXVubSXroywls
         R4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=VdYXtIDgwdn+M+q/xQX/IbA9hN5w2jHVfP00jMaIb4c=;
        b=e14JaG9HyjN1XOEVne/cFvhrVzu/SyqZcVB/ty75nY6mDUSxpWDQk0btfeENby5W1l
         dqa3NQ/+KBFu06LaweG82KuMIytl+9ymCxNH0DWv9QSqijYX9OwZPI/piJKFh1/BR8Ag
         1U2jWmkmkVcIMI8cfvMj2xCTS9j0IoABNozbOplpn4BYh4mpO/4SdGcjpm2EGG0NZmIx
         4B5Bm91Ju030a50OwoC+JE+5MbFYUhkwVBUcfUrNzgKyz/RbgDFmn9t6bJg4c7pxuIuD
         QzLrK4YRRSjm29tB3n6qeIChVU2Zo4sEso/Dt3+1kiL4XPBMFP86fi/Z2REeky/KMVUJ
         t2Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QQamrwxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y185-v6si24961133ybc.170.2018.11.23.09.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 09:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QQamrwxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQEtv-0002UE-WD
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 12:05:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEo7-0005gA-7v
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:59:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEo6-0001xf-6f
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:59:55 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:45185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQEo0-0001la-NU; Fri, 23 Nov 2018 11:59:49 -0500
Received: by mail-lf1-x141.google.com with SMTP id b20so9116564lfa.12;
	Fri, 23 Nov 2018 08:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=VdYXtIDgwdn+M+q/xQX/IbA9hN5w2jHVfP00jMaIb4c=;
	b=QQamrwxLoAjt2jiGuliAcON7vlV6npXwMm/tpe54Kb4LpkrFftGDyW6AXZxTCKe7Nt
	c3OlGdITbiT8aWO55cvuRDENl4rpw+7H7V/gNbH92a4Mj4onEscpn/nPgogcy9TslYIh
	pmpbQ888cDAAyFryGFQLbtbbeTi6qt5LDzgeAno1lMYWJQ6n1u/W+bPCAXjKJxDDBeaW
	bV+hEWZB9GqMEG+Tb9WhMVKp4PGQHDKwtwRS7aLlrxaEs6hi/B1A13v/cpivZ5p1XM0d
	E0VS99rKX7J6fzczYgs3ov8Ikm1KYhC2pyB7aGQIXCAKzcGEM7EfuxYI80yLrUxHuE+A
	I4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=VdYXtIDgwdn+M+q/xQX/IbA9hN5w2jHVfP00jMaIb4c=;
	b=bdmj4P9fov762dccRy4BA+5Bp2GRB5ajPTARLYtuS0f1vRcnUDQTIo6SjDR0LPGdu5
	mqvp0NPoXbj/qg9WKc36hJ8Ow0AsLyCukl0gEBfw6xqoWy7L/74mlq7WlVxmlDYfgviX
	af5lq4tmwwUBy6Ts0WKGvySclDlc3YyOMNYPcpqhMIBMxLwsxyWMRzFGDV0XZZfL7V2M
	vetGKW6DxhM9cP161aNdkiJH90+Icm/zxoXlvZos1Ip5qNybFYU79u2MJV8b7Mcdtc33
	188DO9epn2uMreFHBpgBXyN2oSInwmo//y8Z7WSAwLKD/uU3laZdzYqbCyJ6rhx5quw/
	uqMQ==
X-Gm-Message-State: AGRZ1gLUPzHstPkwKN8Sg1BFG68aGlNAlpxKUwNuab7Yzq9/e5GglaiB
	k+CQ+MvtIvaqH2l7n60glck=
X-Received: by 2002:a19:d8ea:: with SMTP id
	r103mr10667914lfi.146.1542992386866; 
	Fri, 23 Nov 2018 08:59:46 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	26-v6sm4562156ljb.16.2018.11.23.08.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 08:59:46 -0800 (PST)
Date: Fri, 23 Nov 2018 17:59:45 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181123165945.GM1148@toto>
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	qemu-devel@nongnu.org, frederic.konrad@adacore.com,
	qemu-arm@nongnu.org, muhammad_bilal@mentor.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Ld4nJ+3XnIF

On Fri, Nov 23, 2018 at 05:46:17PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Edgar,

Hi Philippe,

> 
> On 23/11/18 14:54, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > 
> > Don't assert on RX descriptor settings when the receiver is
> > disabled. This fixes an issue with incoming packets on an
> > unused GEM.
> > 
> > Reported-by: mbilal <muhammad_bilal@mentor.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/net/cadence_gem.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index d95cc27f58..7f63411430 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
> >  
> >          /* Do nothing if receive is not enabled. */
> >          if (!gem_can_receive(nc)) {
> > -            assert(!first_desc);
> 
> Maybe worth:
> 
>                trace_gem_receive_packet_drop(size);

Or perhaps a generic tracepoint on packet drops for any device.
Anyway this is probably something for after the release.

Not sure if it's too late to even get the removal of the assert into this release? Peter?

> 
> >              return -1;
> 
> Shouldn't this be 'return 0'?
> 
> The "net/net.h" doc is scarce...

If we return 0 my understanding is that we later need to actively
call qemu_flush_or_purge_queued_packets() to renable the rx
path which the GEM model doesn't do. So that would mean
refactoring the model a bit.

Cheers,
Edgar


> 
> Regards,
> 
> Phil.
> 
> >          }
> >  
> > 
