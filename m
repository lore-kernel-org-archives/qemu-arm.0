Received: by 10.25.150.194 with SMTP id y185csp2477030lfd;
        Wed, 23 Nov 2016 02:06:23 -0800 (PST)
X-Received: by 10.55.16.22 with SMTP id a22mr1743622qkh.226.1479895583385;
        Wed, 23 Nov 2016 02:06:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si5260731qtd.241.2016.11.23.02.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 02:06:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9URa-0005v6-Q3
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 05:06:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1c9URS-0005qe-9j
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 05:06:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1c9URP-0003LV-4q
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 05:06:14 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1c9URF-0003HH-PS; Wed, 23 Nov 2016 05:06:01 -0500
Received: by mail-wm0-x244.google.com with SMTP id m203so1419997wma.3;
	Wed, 23 Nov 2016 02:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=5mp0TRtc0clN0aA0uJHZUB8WchuLnMIotG7l2QcQeVw=;
	b=kvbYghGp7LnByA6ejW6kZWs/qyJMTNNWY0Z75HUw4hHB9b8pgGLgvRW5FjzzllgZU9
	oZWlDI+QZsFzKrV4phLW6U2VvkJQH1zRwR03q2YnGGpFERtIdTVMSKQI7Ur3p6HR516E
	Vh+cA/o7rOLHqXIy+BeD3GC9WZVOgaiyhKlGJtjWO1f1uPMwQb5nofpEQlC/714+eKS1
	0F912LP3C87c76Aw6dgmu7UjBPimQfo0Vy7hZhDaD9czoNMhKg+R4xnom2TAb/COQFiu
	1nq+BG4UpfRI6qUy9XmTAkqWFOH0TXfAAdsJYL/x7db0/bEB2w8nqbTTozZilR1r0zu1
	397w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=5mp0TRtc0clN0aA0uJHZUB8WchuLnMIotG7l2QcQeVw=;
	b=Cj/eVF5UYn7weijJZ3D+n1YL7S6++cW1ziL/pq6E3gRFdt548pQCd6+Xbi8GMBUL1c
	hnnwk9TkB9mef3tcuXCupmMDSlgZX/18VFblz9N12bG0JAyDMLVgOgziIUaeJUvv7cla
	yGbLLsmPF5Nv3jFSmi1TpTx1PGKAFj88x7uk/V01mv5nroj4Dlzi1VTOULFZlskb4XTG
	Sz4YUNsd0cu+a/EKF4MBY2SUvn4dA/QCo8EUajdh8R10Zgi0EgHA6jt94DE4sGwaEZjW
	L+VKpMGmip4OodV/NeCM0F5nvC/XkYtpPPJqydOrAs3uLAoTowkeJj4MfBa/bood25tW
	vwrA==
X-Gm-Message-State: AKaTC01ST4Iq3ouimOFGegSmiY5orHac3CytOafG4Nh2WU/xyKkVUocaIsGtSpFQZswB1Q==
X-Received: by 10.25.24.165 with SMTP id 37mr603288lfy.168.1479895560194;
	Wed, 23 Nov 2016 02:06:00 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	g12sm7035425lfg.28.2016.11.23.02.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 02:05:59 -0800 (PST)
Date: Wed, 23 Nov 2016 11:05:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20161123100558.GW9606@toto>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
	<1479853887.11116.95.camel@au1.ibm.com>
	<6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
	<1479856790.11116.111.camel@au1.ibm.com>
	<1761115996.1384447.1479894181425.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1761115996.1384447.1479894181425.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH 2/4] qtest: Support named interrupts
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
	Alastair D'Silva <alastair@au1.ibm.com>,
	Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /mDI083/j6RL

On Wed, Nov 23, 2016 at 04:43:01AM -0500, Paolo Bonzini wrote:
> 
> 
> ----- Original Message -----
> > From: "Alastair D'Silva" <alastair@au1.ibm.com>
> > To: "Paolo Bonzini" <pbonzini@redhat.com>, "Cédric Le Goater" <clg@kaod.org>, qemu-arm@nongnu.org
> > Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, "Andrew Jeffery" <andrew@aj.id.au>, "Joel
> > Stanley" <joel@jms.id.au>
> > Sent: Wednesday, November 23, 2016 12:19:50 AM
> > Subject: Re: [PATCH 2/4] qtest: Support named interrupts
> > 
> > On Tue, 2016-11-22 at 23:39 +0100, Paolo Bonzini wrote:
> > > On 22/11/2016 23:31, Alastair D'Silva wrote:
> > > > > 
> > > > > This seems wrong.  The IRQ should not be modifiable by the
> > > > > test.
> > > > 
> > > > Thanks Paolo, could you please advise as to why that is?
> > 
> > Could you answer this please? I would like to understand why.
> 
> Well, I didn't know yet until I knew what the GPIO line was for. :)
> 
> But in general, the idea is that the qtest acts as the CPU.  The test
> cases can control the passing of time precisely, and they can _observe_
> additional events (such as interrupts or GPIO lines) but they don't inject
> anything that the CPU cannot inject.  The reason is to make the tests
> more like small programs.  It does mean that you are limited by the
> connections of the board.

Hi Paolo,

At some point we added support for using Qtest together with emulated
CPUs. In those cases, Qtest acts more like a test access port that can
access stuff within the VM. It can be used to test devices in combination
with guest SW.

IMO, raising and lowering signals is useful and extending it to support
named interrupts seems like a useful feature to me...

Best regards,
Edgar


> 
> > > > The situation I am addressing is that I device under test that
> > > > changes
> > > > behaviour when a GPIO line is raised. Is there another way I should
> > > > be
> > > > raising that line from within qtest?
> > > 
> > > What causes the GPIO line to be raised in the normal emulated case?
> >
> > It would be wired to a GPIO line from the host microcontroller, under
> > software control.
> 
> Note I said the normal emulated case, not the real hardware case.
> Is there a GPIO controller that is not yet part of the ASpeed models?
> 
> If the emulated ASpeed board cannot yet work with FOut, I would just
> leave it out of the testcases.
> 
> Paolo
> 
> > In this test case, the device is connected to a "borrowed" board via
> > the command line:
> >     snprintf(args, sizeof(args), "-display none -machine imx25-pdk "
> >             "-device rx8900,bus=i2c.0,address=0x%x,id=%s",
> >             RX8900_ADDR, RX8900_TEST_ID);
> > 
> > I couldn't see a way to wire in the the GPIO to the host via the
> > command line, but even if there was, manipulating it would require
> > manipulating the host CPU, which would broaden the scope of the test.
> 
> > At the moment, the test has no dependency on/interaction with the host
> > CPU, it's just using it to provide an I2C bus.
> 
