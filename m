Received: by 10.223.150.237 with SMTP id u100csp585442wrb;
        Thu, 16 Nov 2017 09:10:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbJWQ2hzKoaUFH3FV7UjXJMFzfY8FSG223vv4uUM6dHcjuhzcDqI4yZesNXkyr9he6AjeGn
X-Received: by 10.13.246.3 with SMTP id g3mr1370812ywf.420.1510852217700;
        Thu, 16 Nov 2017 09:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510852217; cv=none;
        d=google.com; s=arc-20160816;
        b=BHCr3vAAYJ0p2An+W4WyyaXUxuL1gC3+Ahfyz7zpduQth32rvsMwDrCQFWCiyOTpHt
         JxmB9oGb8rvTFh+fAlZU44x9WaY5lluj83fmg8dh0mdmzR/X2T+rdDBVevpPb05ZtlfN
         Y5YNNxdGiz5zVQXtNnyogo8gwS/yX13ljk7keV7qSPnpWzoJW+KVBXBOCh6k0kYXvOWm
         pEOCl0KHhFvnA11q8A4qw19o3H5TDNWMDxrEbmwfEgjqqCwCEZLOsKHEAYlFaFrfjBMT
         e4CTihEfg2lk/cXK86w+ZDATh+omA9v6/VYwEZOrs09GHIOiS0BY2zMAGxYzF8zEXaN9
         OTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=i9u61QU/chx/UD7a2p8VURb2HCIVy613u6f45GJubGc=;
        b=pegKm4aY15kFbUvtFIC0Qqy4InG1+h+qrFD2783LVZnBLqp74RMTVpn+0JJOwyWog5
         Lb6SmcScaswkM9MuXLvW5aAX8HkMn4P4sPWWR60wkT3U5+VzlsWjlkrkVG228CkmH3na
         Pu1Cehw1S7/RXX9MC/wgMTicYhStZJpiWhcC+Wn2f7STU3WEmezRcQTWbKAQCZBz9ExU
         PmSihKgRMS6R79GEL4ex0swZA15GJWHninY+PUzwoRotES8hLZOvxqZFpK6nAYWcPiON
         5TekP/52jfol//AraBZs6TrOZ1vp1ysaCbP4pdoCUapnhHuvNg+DPWwbqyL73Lj4ok8g
         5Z8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aVit+T4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m205si297094ywm.681.2017.11.16.09.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Nov 2017 09:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aVit+T4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eFNg9-0005JQ-43
	for alex.bennee@linaro.org; Thu, 16 Nov 2017 12:10:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eFNfw-0005HD-2y
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 12:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eFNfv-0004Tn-5e
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 12:10:04 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:46758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eFNfs-0004Rv-Rl; Thu, 16 Nov 2017 12:10:00 -0500
Received: by mail-wm0-x242.google.com with SMTP id z3so1620094wme.5;
	Thu, 16 Nov 2017 09:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=i9u61QU/chx/UD7a2p8VURb2HCIVy613u6f45GJubGc=;
	b=aVit+T4hr6t1fsMcEmtfE9oNoh9jwd0h/RhjwQ/9HhxFiPCsPU+z7iOELwBrGzrTZy
	2YZPOP8s5kvUswd61U4RcarFfrsweuebRIzTz4xW35NVeiPgAhGbNM5ogzwt3V9NtpvV
	s417iVfFGA1wmmouMBAXz6qFHNiSQAZva/LLdMnnxg6OvUBVll/8qqNUkfGnA+SSAZqA
	xcoQ+l6f2LoS6V5gnRMBpSomYcGnFMdRsnyaZCzJIvIkYeQEwW8R3wX4jBtEUUYbbyoW
	rZl2ViFcB7Uw0NHkm4RFvK21rgyJD9mmHvbwBuQBy7OanMgiPyEgdNUkS2bLs21uM+Ls
	Xt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=i9u61QU/chx/UD7a2p8VURb2HCIVy613u6f45GJubGc=;
	b=V+BP1VIF4oGOVoszRuF5lhN2Q8XA4dq5fvVpzmUYLnIPi+5U03W51VshFCa9vIaR75
	0A36eNIAsGndG4w/1M2AxJBSmLPNa2LpTUrdKPjkvspI6go0eUAKCs532R8pIePO5nBL
	UJL0SBTsyzHbFm1TacgSFUZ0t1ZIBPAd1C4XAAYAkdyUmPcXodfn7qzMQD/+A3ZVTrOS
	BM9Vayr5by8rdGf3R+oPTKghUGLU6kZp4JfYxWc93eNtfqHATMv/J7oB0bbx/YBODFcA
	POY8JbSNGKNtzBzh0sOp551ttQRmrqiT1T9I0rTY2ufRURFKoxOehhk5YVhX5CIZyUCt
	YVVQ==
X-Gm-Message-State: AJaThX5+xxvhDs7Rm1qSw0Lz+fWwxX4BWc7A/UmGgo3BWTXkRQg/av4B
	suuD1mHN33XbCjUB6wqKDDNt4PKMpZcvi4d1EVo=
X-Received: by 10.28.166.193 with SMTP id p184mr1915262wme.6.1510852199799;
	Thu, 16 Nov 2017 09:09:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Thu, 16 Nov 2017 09:09:29 -0800 (PST)
In-Reply-To: <1510846183-756-1-git-send-email-thuth@redhat.com>
References: <1510846183-756-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 16 Nov 2017 09:09:29 -0800
X-Google-Sender-Auth: hi8e7j4hpJCK6bzSVZb46GoBw6w
Message-ID: <CAKmqyKONK8R_bB1PqtEtDoDRGs6ZRPh97TCrw+ne0D91Mbr=Ww@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Silence xlnx-ep108
 deprecation warning during tests
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Emilio G. Cota" <cota@braap.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Vwxr+zTJfcV

On Thu, Nov 16, 2017 at 7:29 AM, Thomas Huth <thuth@redhat.com> wrote:
> The new deprecation warning for the xlnx-ep108 machine also pops up
> during "make check" which is kind of confusing. Silence it if testing
> mode is enabled.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: I slightly shortened the message so that the code still fits
>  into the 80-columns limit.
>
>  hw/arm/xlnx-zcu102.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 9631a53..bbe7d04 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -24,6 +24,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
> +#include "sysemu/qtest.h"
>
>  typedef struct XlnxZCU102 {
>      MachineState parent_obj;
> @@ -164,8 +165,10 @@ static void xlnx_ep108_init(MachineState *machine)
>  {
>      XlnxZCU102 *s = EP108_MACHINE(machine);
>
> -    info_report("The Xilinx EP108 machine is deprecated, please use the "
> -                "ZCU102 machine instead. It has the same features supported.");
> +    if (!qtest_enabled()) {
> +        info_report("The Xilinx EP108 machine is deprecated, please use the "
> +                    "ZCU102 machine (which has the same features) instead.");
> +    }

Looks good to me.

In future maybe it makes sense to never print info_report() when running qtest.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>
>      xlnx_zynqmp_init(s, machine);
>  }
> --
> 1.8.3.1
>
>
