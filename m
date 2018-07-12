Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1546110wrq;
        Thu, 12 Jul 2018 09:10:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf6Za26ihi3igLOu9fZpdjB5iyoDGr6oWGq5+NiaiCjXTXUr5xtV4MG8eHPZZaFwA8O2McZ
X-Received: by 2002:ac8:4402:: with SMTP id j2-v6mr2425136qtn.233.1531411845434;
        Thu, 12 Jul 2018 09:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531411845; cv=none;
        d=google.com; s=arc-20160816;
        b=J8W2FXubNfwOSi2yKuqg6LEpxVgjOkOfjHoDTWvVeRvyw9cj9UdmqthW+MFxsbPwTP
         tqJUIX8VnUHMofmg2mAQQzUWHTcFvJaJr0+IWamUzCdyQyaMVc3HfaHjTdEzgKskh74h
         9Nv/3Pb1eW+4qW34mrYCeaiY27iL/LcMw9L5X02uCWgJUk/nGywOEljAWXgNB0rcTg/x
         HrmiNmTt8rKeoUlz5VV6b70x0qJ80OnaopfNF/NKcsSOcxVxJAqfHpegNWTz21mcNZq9
         UPrXOjWlsCTFQWiWmk3YjVd1kdGFfPQfjFfaeZI6ooqf6+KFMCVhN7UioQh5qKfCshui
         MTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:date:references
         :in-reply-to:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=CbdnLGVh0Cc3IeiQKoCej/KzRnTMuTEanCYJ72i3tiE=;
        b=MJKvF14kexW3zXIYFA5bQgOCJ8t200GUIgNEhOOOPTKwjVFfR5wOBKpYaY4y4ZEuDs
         H6S7mY3oG+5NavjESFt1404y3CZ0hLXWWq35lzJfRCg0ndIeAMoBTL2YkxwFR4pM6HkC
         FUnjyYUAmYuanO05+MAYOgdCEUFN4qaJMPCankICjrBrg8Oi2cJezUhUDYobtnW3CEzJ
         h4HJEhH0H7UWKYqyDgX51Q5SPiFPfsc+JUxhMfJ9C+bmGxroP/cSeQhPDl4syqFkmSQx
         QckE9Ov9Bmp0FD7LUD5GvtY1QKN7SaT1SrM9TPBUSEccT27AG01eJ4nEs1bcCQTyDBZv
         tThg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=mGR5Zpkt;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=bjcL7aYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t81-v6si5166215qkt.248.2018.07.12.09.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=mGR5Zpkt;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=bjcL7aYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdeB2-0003NY-Uv
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:10:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fdeAv-0003NQ-Tg
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fdeAr-0003bg-6c
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:10:37 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52959)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fdeAq-0003UN-U0; Thu, 12 Jul 2018 12:10:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 35CFC20D12;
	Thu, 12 Jul 2018 12:10:31 -0400 (EDT)
Received: from web5 ([10.202.2.215])
	by compute4.internal (MEProxy); Thu, 12 Jul 2018 12:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=CbdnLGVh0Cc3IeiQKoCej/KzRnTMu
	TEanCYJ72i3tiE=; b=mGR5ZpktfT+nRvcU50ZhvASsXt3m+L/0ZVEuVoawEcqtO
	w7PE5IAv7YhkzPWRcsf/h2eQlVCRwLbSXetSgfAsh3ccnQE236o+qF0OmCIrgOL0
	HbCe3m28925OIn0x6t1vnn+FZSQ+TR87RkpgU7UlBwVtmwmjFTiX/Qp//pviWzh4
	4wg1MTsQZ428evY3hhwxcKTDF/XcK4Qxomr9kA/5G8/61P85ZDnih+MFXXdemfGp
	XV9PWtL4j1oAaKQC1HU/xoUK3Wq7sDlt1AAU79kWjrUir/tfVVr1I6HJS5OSp09X
	vtT2lXKAM8iRQws0bSTRQxZsEa7WKV45/x3OlwqIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CbdnLG
	Vh0Cc3IeiQKoCej/KzRnTMuTEanCYJ72i3tiE=; b=bjcL7aYEw3Uqc/esm8eyUs
	Txgmsh2lMNVTfnvsPh1zitjPIvt0By7fEEH5WAYLQmTEqDvatAPccvMf9c9tkBV1
	xqxvYr2ibvGjHrdHFMnCRWNu7gJzPna0KaQjqU+S4XbGQTRSiu7tetkS6J+Qul1u
	c3M8b0JnLElrnx3UMfSrqzgyv2j2r7MeVPJ97o7DJUDXxTj8eQXVjy1oUi3OZiyt
	syUYA+xiiErRy0pk/eYN5SLcLEV9LTmyq+tegVcboW+FxBO7wPGLSGaLQrb05JVw
	37VmcI8K6zAGTkoRz+e8sqKpKvS0r1OcoR532U14RT9AH4u8Pn0TIjI950K9RwUQ
	==
X-ME-Proxy: <xmx:dn1HWyPe23JYoocmZyB5HXvB-Q8vmpSD_pR7_C4bCXvNoS4fSucAgQ>
	<xmx:dn1HWxL9vcf8hka0UsakgFjQWk9LuP62k7pkfXvvhJfYr71dtcEQrg>
	<xmx:dn1HW7E1tc1xX1HM-OwGisKEeh0WOqY3ertLkwsRKV9oGgG6uVcybQ>
	<xmx:dn1HWxRgV0vsh_eDzJmM3uZSfbw0phjqCSgKxc8CGecliwkzqkyYsg>
	<xmx:dn1HW_HLjRxu33BBS5GXUARvV5p4JujIipWhCFx70OwlIz_Gz5a-qQ>
	<xmx:d31HW9KRnDMrqK0tPhjKXXIXA8lLj14aGvsE0oX1LPry9OtmK8MtAA>
X-ME-Sender: <xms:dn1HW15AUImaVAfQPjo3-HLZTQrZHwQx_4JpXxjHpT-OrvezIItwEA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 7D8969E0F0; Thu, 12 Jul 2018 12:10:30 -0400 (EDT)
Message-Id: <1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
In-Reply-To: <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
References: <20180709143524.17480-1-andrew@aj.id.au>
	<CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
Date: Fri, 13 Jul 2018 01:40:30 +0930
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	=?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Djm8JBZjXbL

On Fri, 13 Jul 2018, at 01:28, Peter Maydell wrote:
> On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> > The AST2500 SoC family changes the runtime behaviour of the hardware
> > strapping register (SCU70) to write-1-set/write-1-clear, with
> > write-1-clear implemented on the "read-only" SoC revision register
> > (SCU7C). For the the AST2400, the hardware strapping is
> > runtime-configured with read-modify-write semantics.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> 
> Hi -- is this a bugfix suitable for 3.0, or something you'd
> like to wait until 3.1 ? The commit message sounds like a bugfix...

If we could get it into 3.0 that would be great. I ran into a case where the distinction was important so it would be good to have it resolved sooner rather than later.

Cheers,

Andrew
