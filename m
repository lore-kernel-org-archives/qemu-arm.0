Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1992020wrx;
        Thu, 25 Apr 2019 09:28:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUmaat+6lIRgn13QlgNLyERuRU6c2aqToYF58f4/P0TSuBh/qh8BUn6zYin/LGPXYXtVzh
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr6873163wrm.225.1556209714106;
        Thu, 25 Apr 2019 09:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556209714; cv=none;
        d=google.com; s=arc-20160816;
        b=H1dFNALeS3rwUgCJwh3qfARMxCO8kpbNF15Gr3VekfZPX0WYnzXrQhMPsK/fSkCv5D
         Uf8Bd0GLO7wuBa+PKTKTI6W7pRnK/2D7hXP4E4jaYJkfC25F4yQM3Hp9mSewA2336DI2
         P6fpXSIHNlq8sJ1TVTjqmanrABSqkdGoDJ6sYsNQkQF2gGgg72oYjVVGzmBxVBsseCnT
         l4Bo3oOMa4xeTO7taWN4xyMj0+Q+DcwRY8sNF5GTppt2Bs4vVzowYk8urpx45sDI4Abm
         kqZV1ET1Q0yUUkMVbHLS7pwXdMVm4OZdrukdbi48Rw87pyXgww5eaejuAhLnUoHPrrhe
         QHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=W/UnuPQta1eF1thP2IUrMKcGQZDkM6snYJmfOicnO8A=;
        b=MHbswRDOu69do+zC8ior3Mckoh6utIbgiEFKgZEjLqgKqLwpIYgoq15eeFSUQxpWsL
         T8FaAqX9Oh/l7DpRksA8sbehV6Dta7jiuDo84guUboB6Krt52cNZLjOa/xT5pC7F27ir
         uJVfGuH4SwvQCJFnUAqsM2kdecHL8tewxlF2dgra9AlJRCoo5zMBnf+tpS3cCOGKwqFT
         8PRhlBHLiPORRCZ2lkx8xPkOMHgTgHYCGVJgw9vZ+YEgX12dRJ0Wpnhg9LxM6Lnvt0/c
         loM2CX+wFhPwG3CNgGCbTpMVKVP/mk1FiQw9/qrea/k9CZCjl8tQAo1I9a2Mx+/WVbH5
         1ZSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si827804wrn.4.2019.04.25.09.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:28:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJhEf-00039f-7o
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:28:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hJhET-00037e-Re
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hJhES-0003OW-UG
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:28:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hJhES-0003NM-NI
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:28:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id r186so2030991wmf.1
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W/UnuPQta1eF1thP2IUrMKcGQZDkM6snYJmfOicnO8A=;
	b=HROklXuMVZx7u0RnIRBL988baxeGLrEeWbGc8Esq42yyPBtKbBSxqdfqXPlOcmlJ6m
	2nt/FEYkzvg3j9Kys6W3Q76Rx6eLqkXj6AyisOvu+uLF2nd0W244tf1tO1MrrIt+mUyw
	WC5/eXHQgGiN3tPPIxtZcrK24C4OqLtgUZRfCymunEhAJttCc1DfGOZJ9bB+ZFoQpcbU
	WX5i8o7BEled78O6sUhaH7rYv2Qfn0hGsAhrPC90U+3rRCcsswf2AL577ZIp3fU1eFDW
	M8rhrrPJl+6kQUmDVojaaX/iri6lSzhp7JeLNutjIIjQCrfSRK9bETguCInzq/ZHtKTc
	VSIw==
X-Gm-Message-State: APjAAAXpTBKldcaqPvXAby5qfZtD9K+f8pvkGmGQ+R/3C3nkOH0nnzuc
	IWa26SQAhj81ftjdupzuS3h4p3d5gBfShh7cVVLm/g==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr2368358wmj.144.1556209698392; 
	Thu, 25 Apr 2019 09:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-25-thuth@redhat.com>
	<4fcfff75-aa44-e1cc-2e14-38faba3a3e47@redhat.com>
In-Reply-To: <4fcfff75-aa44-e1cc-2e14-38faba3a3e47@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 25 Apr 2019 18:28:06 +0200
Message-ID: <CAP+75-UkU6RkqD02FE81g1WffkhqP-uGarX42afkbdT3b_r2Lw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>, Yang Zhong <yang.zhong@intel.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 24/29] hw/arm:
 Express dependencies for remaining IMX boards with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XpB9Y/Kd1rrO

On Thu, Apr 25, 2019 at 6:14 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 4/18/19 8:00 PM, Thomas Huth wrote:
> > IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > ---
> >  default-configs/arm-softmmu.mak |  2 --
> >  hw/arm/Kconfig                  | 19 +++++++++++++++++++
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> > index 1455d083d8..6dc388c43e 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -37,7 +37,6 @@ CONFIG_SABRELITE=3Dy
> >  CONFIG_EMCRAFT_SF2=3Dy
> >
> >  CONFIG_VGA=3Dy
> > -CONFIG_IMX_FEC=3Dy
> >
> >  CONFIG_NRF51_SOC=3Dy
> >
> > @@ -49,4 +48,3 @@ CONFIG_PCIE_PORT=3Dy
> >  CONFIG_XIO3130=3Dy
> >  CONFIG_IOH3420=3Dy
> >  CONFIG_I82801B11=3Dy
> > -CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index f5cd63860d..58439c492a 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -283,6 +283,10 @@ config XLNX_VERSAL
> >
> >  config FSL_IMX25
> >      bool
> > +    select IMX

At some point we should split the IMX config in hw/misc/Kconfig.

> > +    select IMX_FEC
> > +    select IMX_I2C
> > +    select DS1338
[...]
