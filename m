Received: by 10.223.197.9 with SMTP id q9csp3637688wrf;
        Tue, 10 Oct 2017 07:49:04 -0700 (PDT)
X-Received: by 10.55.19.98 with SMTP id d95mr14724627qkh.123.1507646944463;
        Tue, 10 Oct 2017 07:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507646944; cv=none;
        d=google.com; s=arc-20160816;
        b=EDmqsJBCN6UMLDdDm/P8eMpqfhcAZlVme4QRw9qpP78QOqvejmr4w8vzdytfkz3Iv5
         lCB/ir8rmtPKOaj9TmnazQ1sFD8gyx6Wdj4L8fbGHXWrRdkll+HipZVTshbZ/djO/Aqk
         2RXXyP+l3JqU1xjcYrKuT5BzvhCTvnbrkzjZmxUFILwN0Ryox5+zOOJ1QduHmxsOVGKm
         aojBanWj/+fXqvQ8xTImHJr0o501y7zUAydbXe6CTtR/x+0wDdSfQVZf4eQ0myicWfsy
         n05JZG9Td5eQygw3893X/XQgDM9JrzPRJK0ImcIQnSnVQkTI9aTcmpQMjYjqAhx8iEJw
         uuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=x31vu5InvpTLGEogDKkBiQgb1p0lC+p9QyNVzQvvKuo=;
        b=UneGrv9af1jway8QOFMvnYkZPSgW4GTC/xhHLDyB0ybAZHcDqi64DeJy+JbVbFEUJJ
         Lqxmlb1I6DVl4m1jGD0+xJ49HfUmOyMoLwHEmzDq4FC8SRoxCyWfkAlX1V1mS13FojMi
         mGI73RbKv1l18bZSFwQzRqUCrVWSqsTNq6E9Za6C5y5JwjRbU2fjGUTi35PwPEQ+QC9A
         fQUqF5ptE3F6YIF9VJ1MlbnLkCXl8IXxPdUIL1Q7XMxk3e3pzaq5vbW3AJja2YukD5sa
         Nv7ZiEtY6LhT2xddFG7+XJSNmgIGvWcwKNS/mx314c/N4ptHtTgrZxf45yZMhBiPtv8a
         k4ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TLK+TAwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b97si9352449qkh.76.2017.10.10.07.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 07:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TLK+TAwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1vqA-0001r2-5e
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 10:49:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e1vps-0001ld-TU
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 10:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e1vpr-0005w8-Rz
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 10:48:44 -0400
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:55244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1e1vpn-0005tK-6v; Tue, 10 Oct 2017 10:48:39 -0400
Received: by mail-lf0-x234.google.com with SMTP id d10so29013013lfg.11;
	Tue, 10 Oct 2017 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=x31vu5InvpTLGEogDKkBiQgb1p0lC+p9QyNVzQvvKuo=;
	b=TLK+TAwS0nCpgfpbfgv4vr6Vn0gleOq0JSx5jsLPXzBoMcKp1lB5X9iNQvrQBUUWgI
	fq1NFVVpYlrhJXuO/sVGnVB+IZo8LZx6PX7wX/aEHTLzxIeoz8f94GcdkZgf8QEmy8fW
	IoXkT+IOwXb9hSqs9Fkl9AGQzjJUdq7uaumTT2yiJII5uAvnwEtRKpp8I31J7yL7GMhu
	H9YrELuEau3WSHvtz6DywwJOnbggnx9J+YzMZ+cS6CGaIj40TAFCQCDhqWjHdUxn/yTw
	LBXQWlgSFbeAjHIx8gZ1qN41GcgvAo6RF2COLKVYHtQsUtdot9asgx6pA47TESgLBQ3j
	LudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=x31vu5InvpTLGEogDKkBiQgb1p0lC+p9QyNVzQvvKuo=;
	b=nkUir0N3cgSSiWc7Gspd5bc8DSzwHiFwCFFRippVEm6iPV6WDeeyv2dt2kfsHk8O4f
	FO3/3xme9ykQbMA3QDvAHVhx93Z+McDB6NBKGALrpFQv9FBYgU8QND5xRwQ36einjohK
	uYJPYZ9Gxsj9xRY9CLvgMI8t+HKtvnRIdlSj2sb3VTf8YYMSJ1DQL+UZxv1YzbUasUwB
	L0fzdBbRrYoeEMHLor8Wm7yJhJ+fTqPscmzMS/MJzPOrNz4Cbmt4BkFK/gUXO1SheLmc
	9wfB00SWK5YsZUwMZemhsNtRWLk6fXPCfR8KYEHR7O/NZ4QbuhMBlcPM72Zpw1Ehc/jp
	ZhTA==
X-Gm-Message-State: AMCzsaVTWWkNqPtaP3oXXhVrRb+cM7W2fb5xdUcYl0+NDAOeVzY9wccH
	9licsrOAmGb3kEd0RirUn74=
X-Google-Smtp-Source: AOwi7QCbjo1uNGmJkzJ+Zq0O8TlOHNQg0FdRZzG4rnDbqUB6SR/tHmL/APnt8kxYoJfy38FBySgtwg==
X-Received: by 10.25.222.202 with SMTP id i71mr5533029lfl.177.1507646916302;
	Tue, 10 Oct 2017 07:48:36 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	z204sm1815883lff.33.2017.10.10.07.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 07:48:35 -0700 (PDT)
Date: Tue, 10 Oct 2017 16:48:34 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171010144834.GC5553@toto>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
	<20171008222029.GA29979@toto>
	<CAKmqyKMEbQ3JbqMxeeOTBV92ixRVDfw1wFi57xNKGyF82DSC_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMEbQ3JbqMxeeOTBV92ixRVDfw1wFi57xNKGyF82DSC_Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::234
Subject: Re: [Qemu-arm] [PATCH v3 0/8] Add the ZynqMP PMU and IPI
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +K0zaodUsDeK

On Mon, Oct 09, 2017 at 05:12:39PM -0700, Alistair Francis wrote:
> On Sun, Oct 8, 2017 at 3:20 PM, Edgar E. Iglesias
> <edgar.iglesias@xilinx.com> wrote:
> > On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wrote:
> >>
> >> This series adds the ZynqMP Power Management Unit (PMU) machine with basic
> >> functionality.
> >>
> >> The machine only has the
> >>  - CPU
> >>  - Memory
> >>  - Interrupt controller
> >>  - IPI device
> >>
> >> connected, but that is enough to run some of the ROM and firmware
> >> code on the machine
> >>
> >> The series also adds the IPI device and connects it to the ZynqMP ARM
> >> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
> >> and MicroBlaze instances though.
> >>
> >> v3:
> >>  - Add the interrupt controller
> >>  - Replace some of the error_fatals with errp
> >>  - Fix the PMU CPU name
> >
> > Hi Alistair,
> >
> >
> > Sorry for the super long delay...
> >
> > I think this mostly looks good but I was wondering if we really need
> > to have a board specific (zcu102) PMU?
> 
> It doesn't have to be board specific. What I wanted though was an SoC
> and a machine so that maybe one day we could add the PMU SoC to the
> ARM ZCU102 machine. After that it was hard to think of a name to
> differentiate the SoC and the machine. Do you have a recommendation on
> names?


Hi Alistair,

Yes, I agree with your approach but I got a little confused by the names.

I think all the stuff that is inside the PMU subsystem architecture-wise
should have generic PMU names (no ZCU102). I.e the ROM, the RAM, the IOModule,
interrupt controller etc.

The IPI block can be outside of the PMU module and be instantiated by the
board or perhaps better if we could reuse some of the ZynqMP modules
instantiated by the ZCU102 machine to get a CPU-less PS for the PMU
to interact with. Or something along those lines.
How does that sound?

Best regards,
Edgar
