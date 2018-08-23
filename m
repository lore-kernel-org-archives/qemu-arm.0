Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp963321wrd;
        Thu, 23 Aug 2018 02:38:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYRgp5Qq3Ke+2EQckKtv9fEtbvebLS/hSVlk2WMyAW3LQJiS85N4qDC+vOIrlX5SsxHMAGW
X-Received: by 2002:ac8:1ca:: with SMTP id b10-v6mr8295981qtg.300.1535017089949;
        Thu, 23 Aug 2018 02:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535017089; cv=none;
        d=google.com; s=arc-20160816;
        b=d62LbZ8auYsPUlS1KBLfjK+10Z7u/EJTo2NGxIF1nbCjy9ZPV75Wxvz4DsgXN8Yv6+
         ALc/5A0N7g42PHsnNHGSykZGZtEbyPCicxtuz/rVE/7+SQGcNohbVWgU40Cx98croE0q
         Kd+dtio+ZkWKeG128th2YBng4VxOBy1qm5X5Z4IsEYa3ivm3BKXcU1muQC6dnTsfI2hQ
         WVyJSggUS5dTrWee9qs45XAb+OhXDw8/HoMXEUgFQNobZjaOzLNSMsnVFqJNkKGBqqJy
         YVtuNv8gfAy8ShdiGG7W9wViFU3tjaMrAcj1tj+XMbqp7vWDShADKwBRnuO7rNLQdneq
         f9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/gpb/eiJp16nt3cCGXYnTyKjWHU5dFdMcV1G7eksH2I=;
        b=0DzmT8rQ+jjSEpL5ZO/WtAVqkj10rL0UrTQdG3/S4X0LPz5aIBtmhtUlcZyRN8gs7z
         jeoi0mh6qfQ8tjXG6VqaUd8r0n0OGcBInDLvsQ7lnZO8aaj9KVBKOw4IxSZNAIbjowiE
         KW6uwBLjZgrqe4MySHy7w6nC50EWnbE7ljzLwLq9vIGgBtxM0qMUsbBy2YNu6scsCzh9
         h+ssOigop5Vvn9g4hrB2yG4CR2Mkm253fXxhjq9RQpUhEhP0rW+a6Yb+etk5eWnDblD6
         OcnAn2tbeqIX3Ll7fx8ylRhJndpoHT7c22tX4ucfk2qF6GxINbcoGWByQElJPMv9xQ0D
         Sr8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAvKjOp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4-v6si3715785qvi.277.2018.08.23.02.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 02:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAvKjOp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsm49-0004Mc-Dc
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 05:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsm3u-0004Lv-0M
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 05:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsm3t-0004GY-1l
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 05:37:53 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:44105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fsm3s-0004Fz-QZ
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 05:37:52 -0400
Received: by mail-oi0-x241.google.com with SMTP id l82-v6so2581635oih.11
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 02:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/gpb/eiJp16nt3cCGXYnTyKjWHU5dFdMcV1G7eksH2I=;
	b=dAvKjOp9crji6Z2pkm5Ez8yF0Uta+PsF6yDj0ls2xrKTH7oI9XGdy3ryzWyhDIt+cQ
	/9XcUmOYKNam534xypoV94lSAX40mz4xNkqroiGa8piE4FmhuPW6gFM54bwGlPEkWhkb
	uKPKFvK31E753DdgL5aP9F2zSGt7oc+7iZ9pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/gpb/eiJp16nt3cCGXYnTyKjWHU5dFdMcV1G7eksH2I=;
	b=SOhuRlEsMlCNY+GoafKFfndIdf/BnXAmWgS7w7Wh3f/2IJ9HwkkqMis4f6CDRZ1vLv
	S0laFavmmAC4wq40EP7thDNqTXayOhjD/klLTawE8ejSrdO2cjL4Tpr6eyWtfMgB+gBb
	oEbuEQIaxJBl5iSS76EvDBGxXzZOwwhvx/QOR1VC42somg5+tVw0RXCQIm/5EnAf3p50
	XuybOkzkj+HLGwLHqhz7WG9WwUnJ9uJUEmskOycVo/HVLFZuij49u1Z9O+Gf27fHZSTa
	QamFzHMOpjX7h42gmxvQlF8tjr1Km5ZyBywiRqwtj63nqqL+G9gtgoCD9jCdKcAftd0+
	5T+g==
X-Gm-Message-State: APzg51AQMzKPkdtiVOwMtr7KcAVaDhQ/PnvZsgtQPj6sbEwXqHyB5qcX
	aLQc723AprL8AVQcAcLbHQXafKDqIguPo8o0SJgVD5+1ss4=
X-Received: by 2002:aca:dd0a:: with SMTP id
	u10-v6mr7817594oig.171.1535017071924; 
	Thu, 23 Aug 2018 02:37:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 02:37:31
	-0700 (PDT)
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 10:37:31 +0100
Message-ID: <CAFEAcA-PcXDbBFW3ZyXazp2RRz5xoo-KQesq9s_76ariyKpGBg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 0/8] arm/raspi: Make fb handle virtual
 viewport
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vxPlpjRN3q0X

Ping for code review?

thanks
-- PMM

On 14 August 2018 at 15:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> The raspi framebuffer supports a virtual viewport which can
> be set up so that the virtual framebuffer size is larger than
> the physical screen size, and the displayed area is at some
> offset within this virtual framebuffer area. This patchset
> implements that support.
>
> To do that I had to do a fair amount of refactoring, because
> getting the viewport code to work correctly and prevent the
> guest from making it fall over by specifying silly offsets
> or sizes requires that we properly validate and clip the
> config that the guest sends us.
>
> Note that the documentation in places like
> https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface
> has various errors in it. The behaviour implemented here
> corresponds to how a hardware raspi2 I tested seems to behave,
> using test programs based on the code from
> http://www.valvers.com/open-software/raspberry-pi/step05-bare-metal-programming-in-c-pt5/
>
> (I was a little bit hampered because I couldn't get the rpi
> to actually *display* anything to the HDMI port, so mostly
> I was testing the edge case behaviour of attempting to set
> and read back various config values.)
>
> This series fixes this bug:
> https://bugs.launchpad.net/qemu/+bug/1777672
>
> thanks
> -- PMM
>
> Peter Maydell (8):
>   hw/misc/bcm2835_fb: Move config fields to their own struct
>   hw/misc/bcm2835_property: Track fb settings using BCM2835FBConfig
>   hw/display/bcm2835_fb: Drop unused size and pitch fields
>   hw/display/bcm2835_fb: Reset resolution, etc correctly
>   hw/display/bcm2835_fb: Abstract out calculation of pitch, size
>   hw/display/bcm2835_fb: Fix handling of virtual framebuffer
>   hw/display/bcm2835_fb: Validate config settings
>   hw/display/bcm2835_fb: Validate bcm2835_fb_mbox_push() config
>
>  include/hw/display/bcm2835_fb.h |  59 +++++++--
>  hw/display/bcm2835_fb.c         | 218 +++++++++++++++++++-------------
>  hw/misc/bcm2835_property.c      | 123 +++++++++---------
>  3 files changed, 240 insertions(+), 160 deletions(-)
