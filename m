Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1620686wrx;
        Fri, 29 Mar 2019 02:20:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfAn/AG8jdO32PaCqDPLfA08I/IFFZpS46UFq41B5UWslXagBUChs1ww4KISdzncKRMKaF
X-Received: by 2002:a24:2b8c:: with SMTP id h134mr3588626ita.15.1553851236068;
        Fri, 29 Mar 2019 02:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553851236; cv=none;
        d=google.com; s=arc-20160816;
        b=GjaqfzSfcz3r31lu5RP1Z6Wawr0rZTlfVVU5lNf28mUVa7mT2YwAPwm1DTPVLJNq41
         /ImbX7ybKNWNsaYWsqZu8Mmc8hpAUScaMePrd3wFgByOzXzj9iBmSgs6Xenc5qNuUIoC
         ovFfhrLSKTW9DbSw/gFJILDZhYzlLLYettRuE80ivxV9jKuf5bltPS9YOu0ERMJ7+ZL6
         K6H3ZX3cQl+23oizCwOOCrHEoTi/VZWQ6Zf5c6Onizn+3eQcY2grEsx/N3KZBwfiQogF
         qzkerbnSxWcKVXnue/mNLi4tMJgq9rcvmMQlS3PlpB7yqE6Yq+ENgR2rNAOBMJfEuFJg
         Jl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ioQv0DHEjnrKUUWd/Jic6wW4lRmAasFzuyRAhwsJcR8=;
        b=bYFCBWz7xCNZJR3Y+1edaxhWgA4OwSquufUqpha/SHMHxUQNwMX3OKzktw/hx5HEBD
         4zMop+g41J1Iu6SwEedv+UgSpkrPtPBolg3SpjY38ifuATBeB+lwI3bGMCvrv6zcaY+3
         MYmFgpBBKT4673ON9oZbIlZdvrob00a70RNDx7YvqX+vdnCcdq8kbREZF+sYiQV2hYLP
         Pja/2iyYwbR7zIelPP5WmoaSi+hDM9sks0pGcKZ18X/9AkFX7gaDXyaVGUeZ6L5UnmMA
         14b+wU0LUCltyY3AUYj2NhplrWRvCGiCpzy77gbJsp/b9JrzPV7tLGvozXsvU7b7eFrI
         l9Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pAVcF4B8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si838204iog.96.2019.03.29.02.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 02:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pAVcF4B8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9ngh-0000r3-C5
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 05:20:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9ngQ-0000pv-DO
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:20:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9ngP-0001wr-AU
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:20:18 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9ngP-0001vx-3y
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:20:17 -0400
Received: by mail-ot1-x344.google.com with SMTP id k21so1502704otf.1
	for <qemu-arm@nongnu.org>; Fri, 29 Mar 2019 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ioQv0DHEjnrKUUWd/Jic6wW4lRmAasFzuyRAhwsJcR8=;
	b=pAVcF4B8cHzhMyo5JpefxedYsUeyRC8UNo82j8A6+u73sI107KEqa4mBUuCHFcCM+s
	fGDDe7ZVmyIfAKaQ5EBJJKqM3/KO8BuGBe+jlgEYQW0qRfkV1Os2L0XbGyjMgFyJeO5T
	w2nib32NhpYJV49/P+drUNZK/V5SuT3gq6UtXYP7gi1pDpysjYTsUCdFTIzn7zrGSWQm
	f23aTxCkFcU9g32+H0sqXgC7R8QcIP1qiCDkxvEjvgDdaHRwKNO+I7UJYM3CIgVcIkmk
	8wEePNOuNIeAOZvIGb2QgKHwKfdSHbR+fkLSfNTs9OY58CXfsx3ZeuOpwuc3gciaPTQg
	mQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ioQv0DHEjnrKUUWd/Jic6wW4lRmAasFzuyRAhwsJcR8=;
	b=tPs8LNtSG6DBPqFZ/FrvjI1WgmQqni8ml8nzeQeUADDdRQL9A03mPciOZH03ERC7af
	FVYP5Sb5C8JVceQUexwsLC0aYflsT3ab7Zm0S14UjwzqzvaW2QN0a/WUCbNm5aVwr3CA
	ZL+Vm1brCmUgTxt8jdAveMnTwrx+N/BXS9mZgCXkrV3foSy3wfBC6xdchm7L1jIjPng0
	vt1ekbXcL1lQl2fQq51Z/KGkbYFDRQSGNVsN7KVx3fWxk852VPqi7KzOO2efEektM2LU
	udT3aatA4BRqMjr1AuZE1wBkJ2yzwzp4yzD9w5xnxBbX/l2WL2aGA7rvzlE82GoVZo8i
	2Jsg==
X-Gm-Message-State: APjAAAVZjSHWKr8IRQVcCqYNtTWhzXe87I2r4PfjRN6A/FFQV7lslo3+
	mRrGgynfhcDBJGnxp+ZZ0v0r/m5onrBdATEb4dgeIg==
X-Received: by 2002:a9d:7f18:: with SMTP id j24mr32084952otq.151.1553851216242;
	Fri, 29 Mar 2019 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152944.3199-1-peter.maydell@linaro.org>
	<4eb279f0-be5a-6250-678d-bec430d8473b@redhat.com>
In-Reply-To: <4eb279f0-be5a-6250-678d-bec430d8473b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Mar 2019 09:20:04 +0000
Message-ID: <CAFEAcA8S+fo--kRVyDe=rO21Md8ypxCfcVaq5w4iosgM=H7nNg@mail.gmail.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 for-4.1] hw/arm/raspi:
 Diagnose requests for too much RAM
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
Cc: "patches@linaro.org" <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yvVTC2KyoRaC

On Thu, 28 Mar 2019 at 21:29, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
>
> On 03/28/2019 12:29 PM, Peter Maydell wrote:
> > The Raspberry Pi boards have a physical memory map which does
> > not allow for more than 1GB of RAM. Currently if the user tries
> > to ask for more then we fail in a confusing way:
> >
> > $ qemu-system-aarch64 --machine raspi3 -m 8G
> > Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> > qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> > Aborted (core dumped)
> >
> > Catch this earlier and diagnose it with a more friendly message:
> > $ qemu-system-aarch64 --machine raspi3 -m 8G
> > qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB
> >
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Changes v1->v2: use '>', not '>='...
> >
> >   hw/arm/raspi.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > index 66899c28dc1..fe2bb511b98 100644
> > --- a/hw/arm/raspi.c
> > +++ b/hw/arm/raspi.c
> > @@ -12,6 +12,7 @@
> >    */
> >
> >   #include "qemu/osdep.h"
> > +#include "qemu/units.h"
> >   #include "qapi/error.h"
> >   #include "qemu-common.h"
> >   #include "cpu.h"
> > @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
> >       BusState *bus;
> >       DeviceState *carddev;
> >
> > +    if (machine->ram_size > 1 * GiB) {
> > +        error_report("Requested ram size is too large for this machine: "
> > +                     "maximum is 1GB");
>
> 1GB vs 1GiB... maybe the message should display "GiB" to avoid any
> confusion?

I don't know why we call our #defined constant GiB -- to me
the unit is GB and I think printing anything else in user
messages is weird.

thanks
-- PMM
