Received: by 10.25.159.131 with SMTP id i125csp787331lfe;
        Thu, 8 Dec 2016 02:45:02 -0800 (PST)
X-Received: by 10.200.34.108 with SMTP id p41mr72195702qtp.269.1481193902628;
        Thu, 08 Dec 2016 02:45:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y38si16965618qtb.11.2016.12.08.02.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Dec 2016 02:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEwCE-0003Q8-2E
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 05:45:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEwBD-000380-6p
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 05:44:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEwB9-0004iu-9u
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 05:43:59 -0500
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cEwB9-0004iG-1o; Thu, 08 Dec 2016 05:43:55 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so2699662wme.2;
	Thu, 08 Dec 2016 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NQFO9qwne9uc1bsFWz2PDRXqPKmpUs+FNLtP0yp3nQs=;
	b=SPdopLq74hnez0lodfLQceETsEw/d3n7W+oA8kRt/xhMOGREQ3V3Lbc0vsncEIOunE
	5/lRV6l/Kz8a6NhG6p4m6L3heyBmIYVqekEUipkDHmH834sZFqSylFgjkymxg0sFl6Fl
	dJ3EaT58YnxExqCKIwFOKrl/29M1iN8aaAGB7c/orwDV6BuW9yxfosqOK7RBVNuq4htF
	BoDDokc3ZvuK4patEG3ql77wyqkL8saOXc8I0kLQW2rPIHYxgK3tzUYq+x5Z0QAEilaH
	Z8+fUXD+pyPDyUG4jrcqCoF+OGoNobM7q4V7CSww2Z7pucq9AYA1DrJvz6RSeRJB9IeW
	eXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NQFO9qwne9uc1bsFWz2PDRXqPKmpUs+FNLtP0yp3nQs=;
	b=ewTB3PbHyvZWHu76vpwuNNIEItHjJbQTF9e4g+FCmpJ1katLcqRrIW0aGaLyBzLCLh
	jvqMkm5gjQejflKg4qi3DSBPQsG/fi5sq8ufxMDeS0INtdMB6nSVcnpeRqcDyWNlAcKz
	bXdImANrj3HA5ecdNqbjTrz68nat1CXWo7jBefkOXssAZiP21LIeYz3f7xW0NF70Cnu8
	3WEKIUBn5C4ufZCpMODYcdSORIijnjGif5uv3kVM+jtSv+IvIQtOeG8nA6aZexFC/G2k
	N+jHlFyv6hhgp36ObN9AJmUp41gQe3yI2x7XMlk0rO+KOZ0Zo9ixX8M7H9AO7A13TmK+
	PhLQ==
X-Gm-Message-State: AKaTC03lgISpxWFlwF9DQoet1BDUmuxWSOmtjwQn4sVbRMIklvcuAsBtNe59SiN0NMqM9w==
X-Received: by 10.25.28.145 with SMTP id c139mr21895829lfc.167.1481193773691; 
	Thu, 08 Dec 2016 02:42:53 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 37sm5516402lfw.31.2016.12.08.02.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 02:42:53 -0800 (PST)
Date: Thu, 8 Dec 2016 11:42:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161208104252.GH9606@toto>
References: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
	<293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] cadence_uart: Check if
 receiver timeout counter is disabled
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
Cc: qemu-trivial@nongnu.org, Andrew Gacek <andrew.gacek@gmail.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMcRM7OmOJ0P

On Thu, Dec 08, 2016 at 08:50:40AM +0100, Laurent Vivier wrote:
> I CC: Xilinx Zynq Maintainers.
> 
> Laurent

Thanks

> 
> On 07/12/2016 22:12, Andrew Gacek wrote:
> > When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> > 0, the receiver timeout counter should be disabled. See page 1801 of
> > "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> > such a check before setting the receive timeout interrupt.

We could also try to disable the timer when rtor is zero but I think
that exposes a bunch of corner cases that would complicate the model a bit.
So IMO, this patch is good.


> > Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> > ---
> >  hw/char/cadence_uart.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index 0215d65..54194b1 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
> >  {
> >      CadenceUARTState *s = opaque;
> > 
> > -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
> > +    if (s->r[R_RTOR]) {
> > +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
> > +    }
> > 
> >      uart_update_status(s);

Since you are not modifying the IRQ state when the timeout is disabled, you can avoid calling uart_update_status too (because it will only end up recomputing the same state).

With that fix:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar
