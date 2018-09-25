Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp461152wrt;
        Tue, 25 Sep 2018 02:50:47 -0700 (PDT)
X-Google-Smtp-Source: ACcGV605498RudYGQx9VdgWsGkcdiZmDjWxao16XpLpXbsVTZMIrWOXWmFaQxB1E6V5o/vCZypTm
X-Received: by 2002:a37:ae03:: with SMTP id x3-v6mr143721qke.170.1537869046943;
        Tue, 25 Sep 2018 02:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537869046; cv=none;
        d=google.com; s=arc-20160816;
        b=Eamyap9D16YwMwWonrNrrt3ZRuY/0yel9YHSVJpqeVfvdivwsd8YVLm3qpgadP2Duh
         ovps8ki9K+tdi7sprY/zs2qfDIyRBGf5onrgS32e0YVZgTf01qzu5Nz5wJn3rvacw0KX
         iWU/mpGnLIsLF6dcMH7NwqeNLfuI3KkwAyxLuaVJNIgc0VJ78qooOMHOYRC1dKQGGKrt
         tHPrc5HECN1/1YutDPN8MuZ4Bivbc8k6d343UNnza6C1ikddGK2UxmoW2l1GrMX74M52
         c3aK+SD+/pE0WgZt3mn84lt7+wK/EolozWy/q1fvvGZLs/OzVv2cqY3mNJjZHvnFE02Z
         xdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=utrMRxZKglWxs7mfxEGWz4DQZn55OKoIGiuH6WZ7pqs=;
        b=FcO+YEWKADfhfJW83R7zkrN/6zfogomXVBOV8AKUtYyREnR2fm3uXZhwqC7S6KLNBD
         WBVFZTbgqw0GSjeja6i2dNHnr1emt2PFKBgo7dCb8o69h3z3QpLZX5a/9MP9uhPoxQlj
         iGFIhZ+ESJ8ERtHnkI3C4qtCVjWLhrfFPixOMtx+UnubPeBF5l4KOwEfDND3DgcZxn4k
         tq9I/3hqHDyp1xcwjMJ+8hxotD+HVaGpjOm16gPb+ed6Kdf9ivh4pD225BddD3B++mJb
         S3d/jv96B64MHktXkd3aHnlYEp8nQr+cVzmH69aZ3fPUKssYt1yl3IWMMSL1A+ZxyIPe
         TGDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Eib/Ieok";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26-v6si1601290qtl.339.2018.09.25.02.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 02:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Eib/Ieok";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4jzS-0007to-Dn
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 05:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4jzD-0007c7-A9
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:50:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4js9-0006DP-8H
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:43:15 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4js3-00069M-JG
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:43:07 -0400
Received: by mail-oi1-x242.google.com with SMTP id s69-v6so923956oie.10
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=utrMRxZKglWxs7mfxEGWz4DQZn55OKoIGiuH6WZ7pqs=;
	b=Eib/Ieok7aF4H3eRQPNM6CbC7Q/NXmeDgMUHsc3Pc0gpSWu36Cih5hi8SkHKNBttmw
	jIN9m67Oo/mZsWERbCcSRvT7AJcoV6OpF5HNY6Ld6/9yyrOCSllCt70EE5pJdxePvRV2
	yFmd6wG2WFAuJv7AIJD0+s8HshqUZwFQfYcM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=utrMRxZKglWxs7mfxEGWz4DQZn55OKoIGiuH6WZ7pqs=;
	b=cEcrhioolgKWiR3chGDDLgvTHPktKfrVcJ03UQMeEH3gjnScUdrkBMlLLAEa4tNldm
	ecd0C+w6BiBqd/XIlWv+UBP+U1qj2euruxkuQQYaWcbTHyOjfZol3E9X8frGMpF4DfWb
	RD+Jh2vGqhTCta7IONsBfC2Nt71MvxskC+xwd3SXuOOoOjHjq/2v4kRf/I3YuktIcRP9
	jcIh5HBuZQDat+i3sSOPngm7c658IzPbovXBPgDGahRMCn/bCK/twL9gZlksdO/1M/NF
	OoKeTquA6uVNBehXDxIMbKojds3y7G5ATuFvpAw6jvyMl4te/cXIpv3WrBXfBTIP1fA7
	mnmQ==
X-Gm-Message-State: ABuFfohQ7hDKPLqqgbhT4XSxllRZDyV9TU1KPc88Z94exQhYBKfPQOh8
	zsuqsjXdBvpzj4Hzibu1tWyq/+AeUSOzx4UIRH+yNA==
X-Received: by 2002:aca:6898:: with SMTP id o24-v6mr112285oik.44.1537868586751;
	Tue, 25 Sep 2018 02:43:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 02:42:46
	-0700 (PDT)
In-Reply-To: <20180917084016.12750-2-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-2-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 10:42:46 +0100
Message-ID: <CAFEAcA9M1MDcbx9CA60zaHnFbtHQD2G_HAWFdPimWhyn==_jqA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v4 01/10] hw/core/clock-port: introduce clock
 port objects
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NoBYLhjcOnG7

On 17 September 2018 at 09:40,  <damien.hedde@greensocs.com> wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
>
> Introduce clock port objects: ClockIn and ClockOut.
>
> Theses ports may be used to distribute a clock from a object to several
> other objects. They do not contain any state and serve only as intermediate
> to carry a ClockState which contains 2 fields:
> * an integer which represent the frequency in Hertz
> * a boolean which represent the reset status of the clock domain
> Both are independent: eg the reset can be asserted while the clock running and
> vice versa.
>
> A ClockIn may be connected to a ClockOut so that it receives update,
> through the callback, whenever the Clockout is updated using the
> ClockOut's set function.
>
> This is based on the original work of Frederic Konrad.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  Makefile.objs           |   1 +
>  include/hw/clock-port.h | 153 ++++++++++++++++++++++++++++++++++++++++
>  hw/core/clock-port.c    | 145 +++++++++++++++++++++++++++++++++++++
>  hw/core/Makefile.objs   |   1 +
>  hw/core/trace-events    |   6 ++
>  5 files changed, 306 insertions(+)
>  create mode 100644 include/hw/clock-port.h
>  create mode 100644 hw/core/clock-port.c
>  create mode 100644 hw/core/trace-events
>
> diff --git a/Makefile.objs b/Makefile.objs
> index ce9c79235e..b29747075f 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -210,6 +210,7 @@ trace-events-subdirs += hw/audio
>  trace-events-subdirs += hw/block
>  trace-events-subdirs += hw/block/dataplane
>  trace-events-subdirs += hw/char
> +trace-events-subdirs += hw/core
>  trace-events-subdirs += hw/display
>  trace-events-subdirs += hw/dma
>  trace-events-subdirs += hw/hppa
> diff --git a/include/hw/clock-port.h b/include/hw/clock-port.h
> new file mode 100644
> index 0000000000..2ab554c30e
> --- /dev/null
> +++ b/include/hw/clock-port.h
> @@ -0,0 +1,153 @@
> +#ifndef CLOCK_PORT_H
> +#define CLOCK_PORT_H
> +
> +#include "qom/object.h"
> +#include "hw/qdev-core.h"
> +#include "qemu/queue.h"
> +
> +#define TYPE_CLOCK_PORT "clock-port"
> +#define CLOCK_PORT(obj) OBJECT_CHECK(ClockPort, (obj), TYPE_CLOCK_PORT)
> +#define TYPE_CLOCK_IN "clock-in"
> +#define CLOCK_IN(obj) OBJECT_CHECK(ClockIn, (obj), TYPE_CLOCK_IN)
> +#define TYPE_CLOCK_OUT "clock-out"
> +#define CLOCK_OUT(obj) OBJECT_CHECK(ClockOut, (obj), TYPE_CLOCK_OUT)
> +
> +typedef struct ClockState {
> +    uint64_t frequency; /* frequency of the clock in Hz */
> +    bool domain_reset; /* flag indicating if clock domain is under reset */
> +} ClockState;
> +
> +typedef void ClockCallback(void *opaque, ClockState *clk);
> +
> +typedef struct ClockPort {
> +    /*< private >*/
> +    Object parent_obj;
> +    /*< public >*/
> +    char *canonical_path; /* clock path shadow */
> +} ClockPort;

Having a ClockPort which ClockIn and ClockOut are derived
from seems a bit heavyweight. When would you want to operate on
a generic ClockPort rather than either a ClockIn or ClockOut ?
Why would you want the name (canonical_path) to be different
at the input and output ends -- is it possible to simplify
to just having the output end keep the name string ?

> --- /dev/null
> +++ b/hw/core/trace-events
> @@ -0,0 +1,6 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# hw/core/clock-port.c
> +clock_connect(const char *clk, const char *driver) "'%s' drived-by '%s'"

"driven by"

> +clock_disconnect(const char *clk) "'%s'"
> +clock_update(const char *clk, uint64_t freq, int reset) "'%s' frequency %" PRIu64 "Hz reset %d"
> --
> 2.18.0
>

thanks
-- PMM
