Received: by 10.80.163.71 with SMTP id 65csp1795417edn;
        Mon, 3 Oct 2016 15:27:10 -0700 (PDT)
X-Received: by 10.237.55.232 with SMTP id j95mr397519qtb.131.1475533630853;
        Mon, 03 Oct 2016 15:27:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si323109qke.335.2016.10.03.15.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 15:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brBhW-0002ij-9M
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 18:27:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brBgr-0002Gt-Sb
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 18:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brBgq-000164-0C
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 18:26:28 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1brBgi-0000zK-Jq; Mon, 03 Oct 2016 18:26:20 -0400
Received: by mail-wm0-x244.google.com with SMTP id f193so12216719wmg.2;
	Mon, 03 Oct 2016 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4An1K4Q8NJGWExfwIABozcuLdlvHSj+hoe365mX/pls=;
	b=cTJsbrQitu8zIu3FDgTj9VUwNsPZAWFTibFkqLZLggvsUtdLVtYnWxgEu7u7YS76n0
	UptCDIG1gT/a57zb+uP/IVxw/DmUfUZ0M8165ZXxFbQGRpNg1sgVr5duIVZn4nbWkdf6
	J6EMZ0cOe+8DBnW9mZdgsCe6qYuJNmzRPtJIrkvCMqmGQrghWbxJkNmxV9nrz/5zPzaE
	49EnAzamvVgCEM5XpXl38AFCNusb0P9bHVN75/wFxwDokmCwq6yJeoKp3fbpS/tq1i3Y
	GqrOp8Bc9282c0FcROXjUS4Rv8zn5830yI8MMGcMLFQNLa7UPvyHT1T53rYOVBvUP4e9
	xtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4An1K4Q8NJGWExfwIABozcuLdlvHSj+hoe365mX/pls=;
	b=T6YvmV2DBu2TTyUgL/k2now/gh1nVv0CoMaeZIS1pl61aqNtA27yoNkG0ELYYyIiC9
	p4Q5ZSRW78ZmZYkTn4MBwiSUC5EXRjyHYJ+oPAPS6UsBNchfOuBwMPFbb1d+dwhkc7BF
	F8FO9BzjpqmAk9yRTnwQBRN4iOuGO/78QurYcQhUAtsMz7YRO5Dx9gghoF+dBwsMek+G
	21QWp4BB+CL/kRU2Rv8+31P21/xDjp+zG9MEMs2M7GVbD+b/ibqp2mdutIRcnkzTQlUs
	MJ3H2c+MJjtXJkQ7p76oLv0lT97/wPWHZB+UKWoTzGDM+5Gb4xdbSAbNrkAfJ8LN0Nky
	nvUA==
X-Gm-Message-State: AA6/9RmRq11tXE7fS7l8f9tpm7jkueGVmYYwLyfl7uuPcmwetFdWH3tsYpDBBXT4iZfzKA==
X-Received: by 10.194.142.116 with SMTP id rv20mr231065wjb.184.1475533579539; 
	Mon, 03 Oct 2016 15:26:19 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id v128sm870703wmv.3.2016.10.03.15.26.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 15:26:18 -0700 (PDT)
Date: Tue, 4 Oct 2016 00:26:17 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Rutuja Shah <rutu.shah.26@gmail.com>
Message-ID: <20161003222617.GA11832@toto>
References: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
	<CAFE_T+QzrfgGwSkqfbL6dArsSH_dyFREM=mma1sBeokO7gpX6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFE_T+QzrfgGwSkqfbL6dArsSH_dyFREM=mma1sBeokO7gpX6Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCRmiasCcfl+

On Mon, Oct 03, 2016 at 10:32:40PM +0530, Rutuja Shah wrote:
> ++ stefan Sorry for the typo.
> Regards
> Rutuja Shah
> 
> 
> On Mon, Oct 3, 2016 at 10:26 PM,  <rutu.shah.26@gmail.com> wrote:
> > From: Rutuja Shah <rutu.shah.26@gmail.com>
> >
> > This patch allocates memory for txbuf array on the heap rather than the stack.
> > As a result, the stack frame size is reduced.
> >
> > Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> > ---
> >  hw/dma/xilinx_axidma.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> > index b135a5f..6c63575 100644
> > --- a/hw/dma/xilinx_axidma.c
> > +++ b/hw/dma/xilinx_axidma.c
> > @@ -256,13 +256,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> >                                   StreamSlave *tx_control_dev)
> >  {
> >      uint32_t prev_d;
> > -    unsigned char txbuf[16 * 1024];
> > +    unsigned char *txbuf;
> >      unsigned int txlen;
> >
> >      if (!stream_running(s) || stream_idle(s)) {
> >          return;
> >      }
> >
> > +    txbuf = g_malloc(16 * 1024);

Hi,

Two comments.

We need to move the allocation from the data-path to initialization of the DMA objects. (e.g put txbuf into the Stream struct)
We also need to fix up the use of sizeof txbuf.

Best regards,
Edgar


> >      while (1) {
> >          stream_desc_load(s, s->regs[R_CURDESC]);
> >
> > @@ -304,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> >              break;
> >          }
> >      }
> > +    g_free(txbuf);
> >  }
> >
> >  static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
> > --
> > 1.9.1
> >
