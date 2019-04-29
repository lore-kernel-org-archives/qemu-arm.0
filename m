Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3661206wrh;
        Mon, 29 Apr 2019 08:54:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/LNGqo9ElF1tT7b69cPokuJopGXVEF3SZcbrOGoC7Ic7STnTSHGhkEyRZeBudpe7orMtc
X-Received: by 2002:adf:9364:: with SMTP id 91mr19964394wro.56.1556553259690;
        Mon, 29 Apr 2019 08:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556553259; cv=none;
        d=google.com; s=arc-20160816;
        b=dbRzhuUfjO8/x/demtd5I50L6BeOBveMOhXFVF3K4sEW+inW0LZ7jCP8QvLYj6R1Qk
         FrXkxg2kom63BOpVMNuRd1hrSSYq5PIb4J8C+pH1NEh+kidxzlAlWJJK/kvtk55v31Ir
         LCwaEkzaweeF8S+hT1Yg7jLVGuvi3fJs47rHd1Co9T36WchKqVbEL0FN/cLcDPkoFf8L
         fR5WuEslfc6ApTTEiSWmnuj88s2x/zjDOY8D2Z2qKnbORhVFf3tkMt0c2NkaC+Mqb6IH
         j5rb/3xNkfBak73IWboC4auf/hr0APHuxAyJB10y0SHlhSI586XWtiDAMkLViStSbgo3
         sqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=PNjaz5jmGqscrk5EWGZMQ4X+yWZT9bb9jB43XJMl6i4=;
        b=jXjmngsKdIBlJUPYQZiWjmc0RU5R5yJngDB9FbJQ7GcrTkEjyZyYgvtsLfjY+mM+hN
         Bm+5uTtykB9lc6vUoqVcgyRiVReeJBC/VEqfzUTiIShOVORfX9WJN0T7KQVXSFxOMLue
         OSF5D7W31/E4YYIC0RndAmrsO9VeB+dqMriglstijoua81vswiIblPmdWzO99WFMvmMw
         0vQhM1r3su5ez/53nud26Hx7W3TV9t1mI+WWYVeah2SI7rrbHpH+Xtgir7M9HjSOFgzE
         4LtezaY1HWiLfsGBHzhUD387snsMjXHSH/n1AZGSbNXQucWmq9GQra/5BoVOc65LdTOK
         jM2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N9SkNCEX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si7892742wru.324.2019.04.29.08.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 08:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N9SkNCEX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL8bi-0006Yu-Qj
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 11:54:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL8bU-0006YF-KS
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 11:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL8bS-0006Uf-Ph
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 11:54:04 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL8bR-0006TM-SU
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 11:54:02 -0400
Received: by mail-oi1-x241.google.com with SMTP id l203so8722169oia.3
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PNjaz5jmGqscrk5EWGZMQ4X+yWZT9bb9jB43XJMl6i4=;
	b=N9SkNCEXnJyG3qIRNwg52YwUMfr8FENlIX4wsjmzWMm2mJ2veacFrSB5J1zDv/cbeD
	YvXOPRkBjG/AA9Mt/Yk9ftgDIt+LrDf4aIoqYSkFFg9Izm8hFzzAgGBClIflq16M5g4o
	HPsPVOq4JofISRHa3+QNXlU0sMv0nJXBVd2aE31WluSNjpuyVPtAU5ImW1o28lsqVvAw
	NX1Axb1d+EDbTCEVbCV2r0KLDsPaspQV0QP+QkkczN6a1eA8vvWRZ4BxqHiYVNPn2slC
	zLGmZU6bxgMCAI+Go0brbMMffsC4VMIVR/54T7ksYpdTOucXuSEHlVcP6/3NVn10ksOw
	37vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PNjaz5jmGqscrk5EWGZMQ4X+yWZT9bb9jB43XJMl6i4=;
	b=YfR7xlYZgkjP2Huxe7VdVBqPDii0txVQQG2YOzi92gzJ8W85u0FofHi41fNHBsqq2u
	gCjUmGmI5+FQ2UKOQ9XCO9DH5O6r5aiG6kKrA0QwFPX8Ov9Een6IejJGLqrdR1pYP7HA
	R17wL/7MHLCVGyLPBNuxXblKkghkIOtxXxzFaX0r49yAxwiy3d7PRDvlMnDIj9BDZDUx
	zdTvNC0NNMsrlLg4qpG3Lf+0vZzESyp8E0TlyjE5XUz2vmPcCeJ3XZufN7H0tV4YGlCF
	8tCDK3MN++GTrBXUTnN4hkYCZQtluqCf4Dpq6dM9mkeevvq7itObwJn65X2/jBkeJZV2
	3zRQ==
X-Gm-Message-State: APjAAAUO9B3lAAIWrfPgJ6w5hA7NFBjGYwklmFUh+DnrSv6JCglr16Tm
	SIm/OlVUPrgybcoBwXy8RrfwUdCdPHPLvJQrd/f0Rg==
X-Received: by 2002:aca:4c88:: with SMTP id
	z130mr16675548oia.170.1556553238956; 
	Mon, 29 Apr 2019 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-17-thuth@redhat.com>
	<98855a34-ff5a-896f-7959-480b89d62833@redhat.com>
	<b78d5517-5f23-6028-6726-b60f916f22fd@redhat.com>
In-Reply-To: <b78d5517-5f23-6028-6726-b60f916f22fd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 16:53:48 +0100
Message-ID: <CAFEAcA8xWTwbU6RSBbQkF2j5OfozEq9g3Pq83KyYG_J1CqGM-A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 16/29] hw/arm:
 Express dependencies of the virt machine with Kconfig
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
Cc: Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yang Zhong <yang.zhong@intel.com>, Rob Herring <robh@kernel.org>,
	Qemu-block <qemu-block@nongnu.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0puold5Lt8lH

On Mon, 29 Apr 2019 at 16:34, Thomas Huth <thuth@redhat.com> wrote:
>
> On 25/04/2019 17.53, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Thomas,
> >
> > On 4/18/19 8:00 PM, Thomas Huth wrote:
> >> Dependencies have been determined by looking at hw/arm/virt.c
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  default-configs/arm-softmmu.mak | 11 +----------
> >>  hw/arm/Kconfig                  | 19 +++++++++++++++++++
> >>  hw/arm/Makefile.objs            |  3 ++-
> >>  3 files changed, 22 insertions(+), 11 deletions(-)

> > Without -nodefaults I get:
> > qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
> > This is expected.
>
> Yes, it should still work with "-nic none" or "-nodefaults".

Er, if you need either -nic none or -nodefaults after this
patch then this would be a change in behaviour, which seems
wrong to me.

thanks
-- PMM
