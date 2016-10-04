Received: by 10.80.163.71 with SMTP id 65csp2236945edn;
        Tue, 4 Oct 2016 10:19:51 -0700 (PDT)
X-Received: by 10.237.36.235 with SMTP id u40mr1563477qtc.152.1475601591400;
        Tue, 04 Oct 2016 10:19:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h51si25235460qth.83.2016.10.04.10.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 10:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brTNe-0004CR-Jc
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 13:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brTNU-00049l-O9
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 13:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brTNR-0005ZV-G0
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 13:19:40 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1brTNH-0005WH-Pf; Tue, 04 Oct 2016 13:19:28 -0400
Received: by mail-wm0-x242.google.com with SMTP id b201so15525151wmb.1;
	Tue, 04 Oct 2016 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wFl4hcgDsoFP4RcTSSlM5Su4DLh/7YN3+RxT1rf/UdU=;
	b=sQEfBE9D7VvTlcIc5i4fWVra1NtGASL03GX16Cf/3/ZA6Cs15uB+hj3JN0zIk0VxaI
	C6uJQbhSHyITq9q+IFbud7hL92Y2lvV21rb/dB/6eSvAhHuSNZD9oGVhGIPOcH+CYMMN
	4D5ka02vauV3teRvLmuNUkEcsvtnUPO9EOVcdOmRrZTZ11FDU/xDg2tBMuWHCXoFahSx
	7XF81s+Iokti6dH981FHbjiYr0rTVmd10DbDdnktqnrvwP7l7r4/WsDNkfgomjiC5ZsW
	60oY1+xTGqat/Tl8koAcs6wXl16oQ9rrVPbpZGgLKCVMSaomq+2KihV8hE/osbS+EAAX
	JZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wFl4hcgDsoFP4RcTSSlM5Su4DLh/7YN3+RxT1rf/UdU=;
	b=ZlG7t3OvHFtxgryMte89vVS20l4b1UgUL/FRbPTDVqThyLt2vSuTjqj4kGulYwT9an
	G8c1wuL59tGHae1RnjdSedrzoFhFEfatlOlu2e2uuk1kPj7DBZUa6G0czU1v3pK4dPjT
	eUPisvGvZnReOGiPqY+gwCnN9B9SiBJzgA5Tq6Ko77pUS/2z9+IqdHbXEm060JSdc95j
	HdpDBYX6uTGz9GWJ3DaDFbveGKiKuCmPRW7isQ5D7pj1NYmcBmTtBKd1r8O8K6txtL4y
	YsgU+AP1ZOjaGUDTtPvoyuTnMM4f1usKT+7o+ef9m5JeHQ69JoZ3ly0CsbxYA37uEQNR
	svvQ==
X-Gm-Message-State: AA6/9Rm7N1YE83MBIdq0MEQuOsffLu1hIXLv9i2V5YrUA4U4vQ0E1nmj1M18FXgjEsqS7w==
X-Received: by 10.194.205.134 with SMTP id lg6mr5046387wjc.148.1475601566684; 
	Tue, 04 Oct 2016 10:19:26 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	ce6sm4513958wjc.27.2016.10.04.10.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Oct 2016 10:19:24 -0700 (PDT)
Date: Tue, 4 Oct 2016 19:19:23 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Rutuja Shah <rutu.shah.26@gmail.com>
Message-ID: <20161004171923.GA28411@toto>
References: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
	<CAFE_T+QzrfgGwSkqfbL6dArsSH_dyFREM=mma1sBeokO7gpX6Q@mail.gmail.com>
	<20161003222617.GA11832@toto>
	<CAFE_T+SVu+vh1RMO08eCQgOYsLzhGW-9CU3KZ7FYtpWbWmVLeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFE_T+SVu+vh1RMO08eCQgOYsLzhGW-9CU3KZ7FYtpWbWmVLeg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
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
X-TUID: CyQRki0SeEFH

On Tue, Oct 04, 2016 at 06:53:20PM +0530, Rutuja Shah wrote:
> Hi,
> Allocating txbuf in struct Stream seems to be good. I can see other
> pointers of struct Stream being allocated in xilinx_axidma_realize(),
> but I am not able to find their deallocation point anywhere?

Hi,

Actually, since the allocation is of fixed size you can just
use an array in the Stream struct.
Otherwise, there's an unrealize method that I think is meant
to be used for cleanup.

Best regards,
Edgar


> Regards
> Rutuja Shah
> 
> 
> On Tue, Oct 4, 2016 at 3:56 AM, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > On Mon, Oct 03, 2016 at 10:32:40PM +0530, Rutuja Shah wrote:
> >> ++ stefan Sorry for the typo.
> >> Regards
> >> Rutuja Shah
> >>
> >>
> >> On Mon, Oct 3, 2016 at 10:26 PM,  <rutu.shah.26@gmail.com> wrote:
> >> > From: Rutuja Shah <rutu.shah.26@gmail.com>
> >> >
> >> > This patch allocates memory for txbuf array on the heap rather than the stack.
> >> > As a result, the stack frame size is reduced.
> >> >
> >> > Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> >> > ---
> >> >  hw/dma/xilinx_axidma.c | 4 +++-
> >> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> >> > index b135a5f..6c63575 100644
> >> > --- a/hw/dma/xilinx_axidma.c
> >> > +++ b/hw/dma/xilinx_axidma.c
> >> > @@ -256,13 +256,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> >> >                                   StreamSlave *tx_control_dev)
> >> >  {
> >> >      uint32_t prev_d;
> >> > -    unsigned char txbuf[16 * 1024];
> >> > +    unsigned char *txbuf;
> >> >      unsigned int txlen;
> >> >
> >> >      if (!stream_running(s) || stream_idle(s)) {
> >> >          return;
> >> >      }
> >> >
> >> > +    txbuf = g_malloc(16 * 1024);
> >
> > Hi,
> >
> > Two comments.
> >
> > We need to move the allocation from the data-path to initialization of the DMA objects. (e.g put txbuf into the Stream struct)
> > We also need to fix up the use of sizeof txbuf.
> >
> > Best regards,
> > Edgar
> >
> >
> >> >      while (1) {
> >> >          stream_desc_load(s, s->regs[R_CURDESC]);
> >> >
> >> > @@ -304,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> >> >              break;
> >> >          }
> >> >      }
> >> > +    g_free(txbuf);
> >> >  }
> >> >
> >> >  static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
> >> > --
> >> > 1.9.1
> >> >
