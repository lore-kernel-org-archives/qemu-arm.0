Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4792031wrt;
        Tue, 5 Feb 2019 05:55:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYCUjaTxUCZjHyrO42loyb8pHX+mIG1wqRznQanCevkqT2MdYHu53rrjdaafh3C8l6riSlX
X-Received: by 2002:a25:8150:: with SMTP id j16mr4024575ybm.499.1549374902570;
        Tue, 05 Feb 2019 05:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549374902; cv=none;
        d=google.com; s=arc-20160816;
        b=fwTiibbMtx3Nl9IiOSNz7S0QV9acsqX9dVS/0zCOxgc5ctRTY4oiuas3whQ1VMoNHN
         4NL23ijhom18bumM9gNO51u/OXN16mT0xFMTX8FeBV6X5PQd99J9m8uz9HuoEo0gJhhW
         QOUn1AETxJO/WsKgoHLzbCjz6uT8Nx+Cpi/wnH2roU9WGLTcVu5LTmfVZJr4/6ULQNOb
         eyXld9TZFq6QL2douwj2pgwRP0tg6CYGnOKtYmoNolDWJ5xi8jGxRiueUH6dlsCsBBKY
         6I6mmNZMX21fO7yrfzrQAh0HNbV04DyP2I2afFXvY95Dj44Bw/Tz0GRq777bK+koBZaC
         LndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bR+lVNfJsrWoXRIWW9015X6aXEeofdDilcWk2MaBFXw=;
        b=Fs1H8/yq8PztP0nB35xTTmXSOU7O5zxoeOAEyjdqh+OthPbyhaF34zE1SS4/rKVJHi
         MeCLoD+X1yYNHx6JxhY7oAK1owiKe6RT7D2W9hXpzvY9py0OgcyMsG7aaJQgSiEWHE7T
         rSRJR23JcDVa0CDUEAMhfFFD8azOQV2MLqGU/qf48l0Z+FGtnfaj6AKEDa5fauBKP/Iy
         IdUg4/+oKt/EUKo+AWG4bbDxvaRLpUrmQ0YtVTnIGqSPrKR2yB6oewvucvrZufaLQHe1
         TULcPR2oY2EfNge5Lmr1MDhVl/35+EsxGa6ihsxjF0Lihn1Kh7tkg8BFR989xVExWaYv
         8jAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GRoX36Cg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si1873567ybl.86.2019.02.05.05.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GRoX36Cg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:60675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr1Bl-0006ON-Vu
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:55:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr1BT-0006Mg-0y
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:54:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr1BR-0007Wd-4N
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:54:42 -0500
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:35513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1gr1BQ-0007VI-Ew; Tue, 05 Feb 2019 08:54:40 -0500
Received: by mail-it1-x143.google.com with SMTP id p197so8358502itp.0;
	Tue, 05 Feb 2019 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bR+lVNfJsrWoXRIWW9015X6aXEeofdDilcWk2MaBFXw=;
	b=GRoX36CgxDsvKw6xJamHeehn1lj+smxWhALKYfKYK7E48RbeRha9cr1OByLg+q2glU
	0DuM0qSpD9eHW8BcYpwuCHmtZQuOR2DFwkoLYp2KBNlDcJZdxOuMnDLQV3bJbaXWR1ni
	gzDPmlv5BtXa3o+XLJBD61dVaryB4xqacZLZsz0orS1R4Eh6KCAy7uH2XOGNK9utimN2
	P8CRhaRYW4V4en1/YwimcrxB+cImaA4rOnKgV4sSYywPXTcYhkYOXJJEh8ywt0ATCPOL
	lFcqszb5547PfnHuqwYusJ5Mg7Y/14cosO+knMy9q0R19Whp/yBVd6b9yu6xMhk2mutn
	flww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bR+lVNfJsrWoXRIWW9015X6aXEeofdDilcWk2MaBFXw=;
	b=ceA9smJdy/SpEljQDTS7PL235aCUMTZp/SsUDEVXuSgnqfSfjJ8FKyPj5Hh+on9g4h
	z/r+m2qoQvUhbxSWvUSjg/ue4GA6yRMSXgmKvM3RQh8OnV4CPU7zfDHtTC9PJTO3I4UE
	R8U6hayfwUIMhT+UIp1bj85kqn69x/tptcUFWr0sksCStoKK9mvUmp7yE8yqaGqNIBL3
	qMhwvXK0dqTbop2BrOC42yeCU9dMcqtKbGvP2VunnH/KEw0yYBcuuvO+C/Dk7P9goyA1
	VIwa9o4hkowu1ShvdjrHoluV2qNEPQZ62GyR7VrJPG5/ByxHDIpkGBHXEqGMCvV3aPem
	BLNg==
X-Gm-Message-State: AHQUAuYYTrSOEpR17WBPkvIOJ3h6DqUIs1l7J7FNPACICt8Hk17I+gAU
	VoUYAt43v0+8319YbjQxwoGrvMQ/T0Wpe0yEhqE=
X-Received: by 2002:a24:4293:: with SMTP id i141mr2317717itb.5.1549374878939; 
	Tue, 05 Feb 2019 05:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-11-aaron@os.amperecomputing.com>
	<CABoDooPMwWR3TXxAqzoByeyuaReVmV0NFpWCJr897QL6r7n_nw@mail.gmail.com>
	<20190205134124.GM5213@quinoa.localdomain>
In-Reply-To: <20190205134124.GM5213@quinoa.localdomain>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 5 Feb 2019 14:54:27 +0100
Message-ID: <CABoDooNTkg2WUpWneOGMNmT_4hHuZTT5qG=uhp6vxY_w73zd_Q@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-arm] [PATCH v10 10/14] target/arm: Finish implementation
 of PM[X]EVCNTR and PM[X]EVTYPER
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
	Aaron Lindsay <alindsay@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WtqIh+EonGSB

On Tue, Feb 5, 2019 at 2:41 PM Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> On Feb 04 20:22, Laurent Desnogues wrote:
> > Hello,
> >
> > On Tue, Dec 11, 2018 at 4:25 PM Aaron Lindsay
> > <aaron@os.amperecomputing.com> wrote:
> > >
> > > Add arrays to hold the registers, the definitions themselves, access
> > > functions, and logic to reset counters when PMCR.P is set. Update
> > > filtering code to support counters other than PMCCNTR. Support migration
> > > with raw read/write functions.
> > >
> > > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >  target/arm/cpu.h    |   3 +
> > >  target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
> > >  2 files changed, 282 insertions(+), 17 deletions(-)
> > [...]
> > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > index fd2923f033..1b851d1689 100644
> > > --- a/target/arm/helper.c
> > > +++ b/target/arm/helper.c
> > [...]
> > > @@ -5301,6 +5526,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> > >          };
> > >          define_one_arm_cp_reg(cpu, &pmcr);
> > >          define_one_arm_cp_reg(cpu, &pmcr64);
> > > +        for (i = 0; i < pmcrn; i++) {
> > > +            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
> > > +            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
> > > +            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
> > > +            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
> > > +            ARMCPRegInfo pmev_regs[] = {
> > > +                { .name = pmevcntr_name, .cp = 15, .crn = 15,
> > > +                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> > > +                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
> > > +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> > > +                  .accessfn = pmreg_access },
> > > +                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
> > > +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
> > > +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> > > +                  .type = ARM_CP_IO,
> > > +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> > > +                  .raw_readfn = pmevcntr_rawread,
> > > +                  .raw_writefn = pmevcntr_rawwrite },
> > > +                { .name = pmevtyper_name, .cp = 15, .crn = 15,
> > > +                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> > > +                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
> > > +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> > > +                  .accessfn = pmreg_access },
> > > +                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
> > > +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
> >
> > Looking at ARM documentation, I think the value for crn should be 14
> > for PMEVCNTR<n>_EL0 and PMEVTYPER<n>_EL0.
>
> You are correct. I'll post a fix momentarily.
>
> Out of curiosity, how did you discover this? I've been using recent
> Linux kernels for testing, and thought it used these registers, but I
> guess it must only be using PMSELR/PMXEVCNTR/PMXEVTYPER.

There regs are used in a proprietary bare metal bootloader on a
virtual platform my company uses for performance measurements.

Thanks,

Laurent
