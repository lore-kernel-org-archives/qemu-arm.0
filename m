Received: by 10.25.30.65 with SMTP id e62csp824991lfe;
        Tue, 24 May 2016 09:32:24 -0700 (PDT)
X-Received: by 10.55.64.77 with SMTP id n74mr4343619qka.208.1464107544420;
        Tue, 24 May 2016 09:32:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h83si3222907qhd.77.2016.05.24.09.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FFn-0004vW-Kn
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5FFi-0004tP-C3
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:32:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5FFg-0005FJ-8Z
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:32:17 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5FFY-0005ED-Mn; Tue, 24 May 2016 12:32:08 -0400
Received: by mail-wm0-x241.google.com with SMTP id f75so7772395wmf.2;
	Tue, 24 May 2016 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TvqX74Vuvd1QDkySM3McP4naXMXRI4ERgHFfgMZFQ8E=;
	b=IktoCgAkCLXlcqeLGKZiyar/RP5h36MU+PQOoEjHwxm8AXSjCicA3kXQdNcSKK1TsD
	nqx35S0hUgJsQea72jOPJM6Plz2i8Go8SCaGA6c6//EK8g04OAa6sXjFF1Slv7xnNiLc
	wlXW+zc5B9mh6+iRhtvWeUElVTNAKPH7pZMvuUBu22fMDcsveiSP658usnJgL33lHg4b
	IRzFqPPbWoqdTxkDcalDm2u+j1AIwQsnVTw1Im03+JN/3WzR3v/z/YhopEgBzZBZYvLp
	DrcKCUuOAKDOCbV02ICUsGA8hqrk1dfZ+CC+UY/YA+IdlhwyO1dPVhvExZHfPdP43cYR
	VX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TvqX74Vuvd1QDkySM3McP4naXMXRI4ERgHFfgMZFQ8E=;
	b=XHx/CSAUNChxnxXVBm37yN1Nje8U4cX7Ke8Fmw2riwBQ5XwiU4HVDH69cNDMzk+F7U
	zXpBoPXS3Lm1XWH0Auax4Ac1FauRMhIzXyCiHcxe7q8p+5p6YHCwadCZq2IZPt7429JD
	Upclo9bK12Vt2QUNEppTIIPXbEvrRrNGWq86EP+5QiryM7ksw/BKCb2sidlvpfq9SFWX
	xXicbLaYKZxcaVOhruXBLu4qfVsYYif4JZJlxa2pfwVWKSKOngO7PfOLBkU0UmD17Erl
	tNU7lqtkSbX+x3gfQsztmtqpsJ7zTAaIemGiq1Tzot/q2KdmPHefgZGw8wOTiReylVUi
	3EhQ==
X-Gm-Message-State: ALyK8tJaVj9CVVAJCa1heyfR0f+zFy4c+NRBsvxIvRSZtbHuOKc2J8jdzYrlq0Uggd7WAA==
X-Received: by 10.194.242.167 with SMTP id wr7mr5202082wjc.145.1464107527232; 
	Tue, 24 May 2016 09:32:07 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	he10sm4067622wjc.21.2016.05.24.09.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 May 2016 09:32:05 -0700 (PDT)
Date: Tue, 24 May 2016 18:32:04 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160524163204.GV16305@toto>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9+ow6BAhqk5hUeoR50gUhX0TJy75r1ViUZJ-vEbLawJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9+ow6BAhqk5hUeoR50gUhX0TJy75r1ViUZJ-vEbLawJw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v1 3/5] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ZMCfer2H/tc

On Tue, May 24, 2016 at 05:26:54PM +0100, Peter Maydell wrote:
> On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > The way we currently model the RPU subsystem is of quite
> > limited use. In addition to that, it causes problems for
> > KVM and for GDB debugging.
> >
> > Make the RPU optional by adding a has_rpu property and
> > default to having it disabled.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/arm/xlnx-zynqmp.c         | 50 +++++++++++++++++++++++++++++++++++++-------
> >  include/hw/arm/xlnx-zynqmp.h |  2 ++
> >  2 files changed, 44 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 250ecc4..c180206 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -83,6 +83,40 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
> >      return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
> >  }
> >
> > +static bool xlnx_zynqmp_get_has_rpu(Object *obj, Error **errp)
> > +{
> > +    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> > +
> > +    return s->has_rpu;
> > +}
> > +
> > +static void xlnx_zynqmp_set_has_rpu(Object *obj, bool value, Error **errp)
> > +{
> > +    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> > +    int i;
> > +
> > +    if (s->has_rpu == value) {
> > +        /* Nothing to do.  */
> > +        return;
> > +    }
> > +
> > +    /* We don't support clearing the flag.  */
> > +    if (s->has_rpu) {
> > +        error_setg(errp, "has_rpu is already set to %u",
> > +                   s->has_rpu);
> > +        return;
> > +    }
> > +
> > +    /* Create the Cortex R5s.  */
> > +    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> > +        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> > +                          "cortex-r5-" TYPE_ARM_CPU);
> > +        object_property_add_child(obj, "rpu-cpu[*]", OBJECT(&s->rpu_cpu[i]),
> > +                                  &error_abort);
> > +    }
> 
> Do we have to create them in the set function so we can
> set properties before realize, or could this be deferred
> to realize time?

Yes, I thought it was recommended to avoid object creation
in realize. But creating the PRU in realize works too.

Cheers,
Edgar
