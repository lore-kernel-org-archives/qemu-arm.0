Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2304073wrt;
        Fri, 23 Nov 2018 09:12:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WoVryUV717Y2fJYvIyp4SgnUcn/93crUeeE6BMCPP0crmVtrmsJj+pJqzMMXe2FZponK+l
X-Received: by 2002:a25:37d7:: with SMTP id e206-v6mr16531442yba.243.1542993147504;
        Fri, 23 Nov 2018 09:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542993147; cv=none;
        d=google.com; s=arc-20160816;
        b=lHbKGeaj1hROU6lwzdOPf12Cxw8ROUmoAEMsou2mO8Ogj6R0r8YKMMcEcQZstNjeaP
         +dHVKE554+L99+Nq+iek2HG4NNyie3W72G3xRXogUg5j6y9nRwgo5X6r5OnUjPXhuUwb
         cZ8ZETqFMfW9PpW3bWGyLQ4hOinZwR91ydKN8OcH7wZ+RjDqXSzSioKiUEmnuWQZ04DW
         DK+Q2cTcV9bBpsVGbm0CWsO4Gt6gVn4CBX3cF3DaBpyYPh2go7wBBDQzlB7YG0UWBKW5
         8FBJPT5uILJmTYBGsGuULbDO9uRMPqZ6V3QiqV26UAG7xFvqo/c0PXuFc9vjuzjwtYEu
         vdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=m0VkO5n/I3g80WmrRNDd1H4Fmr2sBu08aaUjTw6FVeQ=;
        b=eju7cMsbaVsGALhhDHY0WJXOQCDzICWRb4O21DXZmmnY96kwgYZGSBfpZ4Rkk8oLT6
         fd1XTTpHlmR9ykiDcbf+Hpszyj59hTpF79lR+Nfse2WzFo4pM33VCdhQOdwLpw7OhDTi
         ZnsiJhHlRdAKTziwIC+9/4MVWR3zDvaiCE5hCXm1anjCRLdaZ8NuWdg62w1T0XHLZT7S
         opHY4GAqSBsD9lz330y21arbeY0+a+B9m7S1PIx6LrvrSSizKmsEigbzlklol0qq806p
         TL/WkIfDm5NViH+t+XyY1xyjA0LZsvY9RAfjfT5pf2oR+h9bFMlN2bz5ylHQJ0owZXt3
         897w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jC55k6CO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si16381543ybh.266.2018.11.23.09.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 09:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jC55k6CO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQF0F-0000MI-0Q
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 12:12:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEuZ-0003B6-Fi
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 12:06:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEuY-0000M8-MW
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 12:06:35 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQEuT-0008Pz-9B; Fri, 23 Nov 2018 12:06:29 -0500
Received: by mail-lf1-x142.google.com with SMTP id p6so9169934lfc.1;
	Fri, 23 Nov 2018 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=m0VkO5n/I3g80WmrRNDd1H4Fmr2sBu08aaUjTw6FVeQ=;
	b=jC55k6COSEO/3hxiUEV5sAX4HeTB1Xofrm9UJDljxk/X024E0PpcM//aWkaLZMjo1T
	8Dpu7mqUl72iL+WauWH3SCYRNNnaHw5vLla9mLP9SZ6xgjy62neM0uuaZAUpIaJhNXq8
	1wDObFObWR4kyXM0Dhnp3Y9VdyP812huccT5EDZLhNWb4NMvNtcMW2LqY4xKojSfxJu2
	0ugTZP2VcSI6opZyX0j8IqD/bkjEU1xur4Yi7cCMvPmVECsC4t8H9P5BtnTcLFlGfjal
	tNEXbUZQ5YZRxL0GZURZceL+W2Tz/ZkOjxGYH6mYn0qwjtqZIhydfcyYVkANOPUidppK
	pStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=m0VkO5n/I3g80WmrRNDd1H4Fmr2sBu08aaUjTw6FVeQ=;
	b=nYTjQgRF2BjLXTNWyoRZUIJ/edlw4Ev4PmlTp5Is/OqVp+2CVbL4Nql4Fu/wSZiEhe
	jzKNz1GHdx+z7y8vGI6WX5Po36q5f6woNbzxDKX17KkR/7pPkR6lWZFynbqY3EGg7dBG
	KBDBt6Pvv4XloEfRcILNdtSDngxfXBynUKFVG2au4zgRk9QN1Elhy7KEYD1AgyAXD870
	JSa9g+YUinqp9mCetC/33PxMw+1+K0joea+n/SJKdNewoCHiIfBqEzYkm43QZzAA5ikp
	OYJMThqBSdmpkFcxSn79ERDw0sQyiT2tu5N4VYX/KgRwdrgJDoys+7v5wnRgwE12u3v8
	wTsw==
X-Gm-Message-State: AGRZ1gINyqNDvIoILomX856Nmj2CP2YHXRJE8RvJxIrbfNhVe3qa7V3Z
	C5ka2nN4+XEC5kysTPCcpBU=
X-Received: by 2002:a19:7111:: with SMTP id m17mr9548761lfc.64.1542992785706; 
	Fri, 23 Nov 2018 09:06:25 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	g17sm2614156lfj.36.2018.11.23.09.06.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 09:06:24 -0800 (PST)
Date: Fri, 23 Nov 2018 18:06:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Message-ID: <20181123170624.GN1148@toto>
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
	<20181123165945.GM1148@toto> <20181123170225.GJ7447@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181123170225.GJ7447@toto>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
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
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, qemu-devel@nongnu.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org,
	muhammad_bilal@mentor.com,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6tLgkmn9viMa

On Fri, Nov 23, 2018 at 06:02:25PM +0100, Edgar E. Iglesias wrote:
> On Fri, Nov 23, 2018 at 05:59:45PM +0100, Edgar E. Iglesias wrote:
> > On Fri, Nov 23, 2018 at 05:46:17PM +0100, Philippe Mathieu-Daudé wrote:
> > > Hi Edgar,
> > 
> > Hi Philippe,
> > 
> > > 
> > > On 23/11/18 14:54, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > > > 
> > > > Don't assert on RX descriptor settings when the receiver is
> > > > disabled. This fixes an issue with incoming packets on an
> > > > unused GEM.
> > > > 
> > > > Reported-by: mbilal <muhammad_bilal@mentor.com>
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > > ---
> > > >  hw/net/cadence_gem.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > > > index d95cc27f58..7f63411430 100644
> > > > --- a/hw/net/cadence_gem.c
> > > > +++ b/hw/net/cadence_gem.c
> > > > @@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
> > > >  
> > > >          /* Do nothing if receive is not enabled. */
> > > >          if (!gem_can_receive(nc)) {
> > > > -            assert(!first_desc);
> > > 
> > > Maybe worth:
> > > 
> > >                trace_gem_receive_packet_drop(size);
> > 
> > Or perhaps a generic tracepoint on packet drops for any device.
> > Anyway this is probably something for after the release.
> > 
> > Not sure if it's too late to even get the removal of the assert into this release? Peter?
> > 
> > > 
> > > >              return -1;
> > > 
> > > Shouldn't this be 'return 0'?
> > > 
> > > The "net/net.h" doc is scarce...
> > 
> > If we return 0 my understanding is that we later need to actively
> > call qemu_flush_or_purge_queued_packets() to renable the rx
> > path which the GEM model doesn't do. So that would mean
> > refactoring the model a bit.
> 
> Actually, the GEM model does do that, my bad, so yes return 0 seems to be the right thing to do here.

I take that back, the GEM model only handles some of the !can_receive cases
with qemu_flush_queued_packets(). Not all, so return -1 is correct I think.

Cheers,
Edgar
