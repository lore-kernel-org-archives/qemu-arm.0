Received: by 10.25.0.147 with SMTP id 141csp1468593lfa;
        Mon, 6 Mar 2017 09:14:58 -0800 (PST)
X-Received: by 10.237.36.153 with SMTP id t25mr17647437qtc.134.1488820498573;
        Mon, 06 Mar 2017 09:14:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si15912697qtc.156.2017.03.06.09.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 09:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckwDn-00006h-Sg
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 12:14:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckwDl-00006Y-0x
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:14:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckwDh-0001o3-Qt
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:14:53 -0500
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ckwDh-0001nY-Je; Mon, 06 Mar 2017 12:14:49 -0500
Received: by mail-wr0-f196.google.com with SMTP id u48so22602569wrc.1;
	Mon, 06 Mar 2017 09:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dNphvb+nXU1mkerEJwWz2BjvX6r12RlonygMTlSFWx0=;
	b=HbvuytsmJjwcTGLUIYDxqthRXIIOpXVlcrzau6VAoKEJp937MJd2WEeaCh2fQwR5w7
	+s4Pg8xVPhA49D0/Cfr06kvKxc6MZJL2N/NzOZMO9/xEeIvcDMAx7C4AAVsvkYNfpDN7
	Bx3PgGS+xEEf7b22A0OG2+EHWwiKJJIElVoHk8r5XRX4UAYOYP9bWrew9dw+GeaW5Oq4
	wxtfwd7dxo225mZ+N5ZRA0+q1+pT/IP9QEvbnOAk+YBuiYYvJCc+b91Dlp6NYX0uFPUy
	rM41QK4y3slFEt3PmIogWBpYTnrqWJYKEidPk0E2sOINNO1mVlJjIPRe1yANID9srpeG
	I5wQ==
X-Gm-Message-State: AMke39k0u4BWNi+V/cCT7e7HsZjXgQo+2BS4vSl4EZ7SwWpSgaj2nJktkyf/Byz4xh8WQQ==
X-Received: by 10.223.132.163 with SMTP id 32mr3382826wrg.147.1488820488279;
	Mon, 06 Mar 2017 09:14:48 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	o26sm27694250wro.44.2017.03.06.09.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Mar 2017 09:14:46 -0800 (PST)
Date: Mon, 6 Mar 2017 19:14:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170306171427.3gvuduo5hss2good@kozik-lap>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-2-krzk@kernel.org>
	<CAFEAcA-09S5LtTLA6iMf9qYaJvxT2qW=LiTBqnRtUMDy+9BSiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-09S5LtTLA6iMf9qYaJvxT2qW=LiTBqnRtUMDy+9BSiA@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.196
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/arm/exynos4210: Constify data pointed
 by few arguments and variables
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXjTgYS/a3iS

On Mon, Mar 06, 2017 at 09:44:49AM +0000, Peter Maydell wrote:
> On 5 March 2017 at 21:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > In few places the function arguments and local variables are not
> > modifying data passed through pointers so this can be made const for
> > code safeness.  Also the static array exynos4210_uart_regs is not being
> > modified.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  hw/char/exynos4210_uart.c     | 10 +++++-----
> >  hw/intc/exynos4210_combiner.c |  2 +-
> >  hw/intc/exynos4210_gic.c      |  8 ++++----
> >  hw/misc/exynos4210_pmu.c      |  2 +-
> >  4 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> > index b75f28d473bf..83e1be253255 100644
> > --- a/hw/char/exynos4210_uart.c
> > +++ b/hw/char/exynos4210_uart.c
> > @@ -102,7 +102,7 @@ typedef struct Exynos4210UartReg {
> >      uint32_t            reset_value;
> >  } Exynos4210UartReg;
> >
> > -static Exynos4210UartReg exynos4210_uart_regs[] = {
> > +static const Exynos4210UartReg exynos4210_uart_regs[] = {
> >      {"ULCON",    ULCON,    0x00000000},
> >      {"UCON",     UCON,     0x00003000},
> >      {"UFCON",    UFCON,    0x00000000},
> > @@ -220,7 +220,7 @@ static uint8_t fifo_retrieve(Exynos4210UartFIFO *q)
> >      return  ret;
> >  }
> 
> Constifying this sort of thing is OK...
> 
> > -static int fifo_elements_number(Exynos4210UartFIFO *q)
> > +static int fifo_elements_number(const Exynos4210UartFIFO *q)
> >  {
> >      if (q->sp < q->rp) {
> >          return q->size - q->rp + q->sp;
> > @@ -229,7 +229,7 @@ static int fifo_elements_number(Exynos4210UartFIFO *q)
> >      return q->sp - q->rp;
> >  }
> >
> > -static int fifo_empty_elements_number(Exynos4210UartFIFO *q)
> > +static int fifo_empty_elements_number(const Exynos4210UartFIFO *q)
> >  {
> >      return q->size - fifo_elements_number(q);
> >  }
> > @@ -245,7 +245,7 @@ static void fifo_reset(Exynos4210UartFIFO *q)
> >      q->rp = 0;
> >  }
> >
> > -static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(Exynos4210UartState *s)
> > +static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState *s)
> >  {
> >      uint32_t level = 0;
> >      uint32_t reg;
> 
> ...but I disagree here somewhat...

This is a static function not modifying the state. Const in argument is
a clear indication of that for the readers.

> 
> > @@ -488,7 +488,7 @@ static const MemoryRegionOps exynos4210_uart_ops = {
> >
> >  static int exynos4210_uart_can_receive(void *opaque)
> >  {
> > -    Exynos4210UartState *s = (Exynos4210UartState *)opaque;
> > +    const Exynos4210UartState *s = (Exynos4210UartState *)opaque;
> 
> ...and definitely here.
> 
> These are effectively method implementations for QEMU objects,
> and defining the "this" pointer as const in some methods
> because it happens not to be modifying things just makes
> the code look out of line with every other method implementation

I get it, better to keep consistent style.

> in the code base (and means somebody will have to drop the 'const'
> again at some point if the method needs to be updated to
> modify state in the future).

I think the code should be const-correct for current implementation
(following the HACKING guide). If we would have to predict future
changes, then almost no const would be possible to add...

Best regards,
Krzysztof


