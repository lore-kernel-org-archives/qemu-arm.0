Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7287879wrx;
        Thu, 7 Mar 2019 07:44:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgeZ8vNFUyN8x3cy5OOLmrEBZcBvb+M9g8p8YzZHLcM/KZZkC+y6WzNcDI1mB6AKe0iLRa
X-Received: by 2002:a25:d46:: with SMTP id 67mr7270944ybn.60.1551973442236;
        Thu, 07 Mar 2019 07:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551973442; cv=none;
        d=google.com; s=arc-20160816;
        b=gTjhVzVdzOaOgJnlJf2387DcpaPSgv7XT0PcSxx896lKxetdGpYHD9QWRLIOpbFnph
         QCJ5BPDiggPoIFwDeYD1i0sgwnBQ0cHu4abKET8bmsZEoFVqxpT5s5Wq+MVKeGYNjjb2
         vEOJjdk/S/qA6aMNLT3Md8fgOl787jj9M2vuCMFdW5o9L1iaIeDa79xBmnWIPAUZXRHS
         dXQTdUS/+NfjECfUlXB/Ammhw+dED0ODNU4lc7MPVLxYPy/qc+4Ej5p4xvEB1vY1ccI3
         Q+95zez4ZnFiZFoPwAWTmnchW5fHm7KaEMVhFSiWU7qbrhs3Fqpp19yNWyXYFEIi039e
         PC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R458yNBw6zBd0SsoF/1dyTCruNXjDzMPCwrNvBoMRJM=;
        b=uSfJbF12Isp0qErmmqeSZwnQZA7lIIVcvr/LSBknYWW08YHHhq8CZCEhX6Uu2VzGsR
         uZ5rsBOxqTVyPfcQNvgGhKJjO9BBiDjXAfCFjcUe/LLlMxq3SyJyVQ5bkyaEGaD4pvqW
         QkA266H/U1YxvYrOa+2+owmJ63i7rK0N9V3htNm5v6GWce9PthbTgS6v4zr8syct+/Hc
         tSZdtaWqs4anPH+s+dmAfFW+MigZa8rok0GuiczuC8bzrNJXPUpGftlOa6toMrNyMxL5
         BFtDHrgkezYLi8YjQAQ/SEe92eUClFSJCEHeME1Zrk7sT/FJLBEeAPyoQHgHcPjfwTio
         QHSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U5S1QlM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si746701ybk.270.2019.03.07.07.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U5S1QlM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1vBh-0002A7-Hr
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:44:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1vBR-00027b-C2
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:43:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1vBQ-0003vV-MO
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:43:45 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h1vBQ-0003uT-CA
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:43:44 -0500
Received: by mail-ot1-x343.google.com with SMTP id i5so14480606oto.9
	for <qemu-arm@nongnu.org>; Thu, 07 Mar 2019 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R458yNBw6zBd0SsoF/1dyTCruNXjDzMPCwrNvBoMRJM=;
	b=U5S1QlM3fVJx3+aVZa0X5ptSilRUjoyWkzkF/r7DzfwgaICeXTE+oP9oBw1HLZ5ulB
	2DWYpQ3FfKKLHIaEfuR9K/F8mPK3LwdhMnhko+PdKtIOzchYhq5sGpIb/dVPKlLPgPOo
	HKJEDaSkyw7W9J0gfHCESExk/NV+n5Q5gERYTwlsSmoENGNvdFo7Bn8slDo99B1lR6/q
	gGjRs3NkFQXqCZEMBqUCq+Fl2vD8MtjOLDML0nqCHglPVW/B6zjJzKnjRUBt77jSclLQ
	H/YR50qHhuJ1TgjMLbZizQDiuuoWH25XeXe4SpXyuGKEQWmKohjBmVFj6L/K4Nc86Mze
	xiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R458yNBw6zBd0SsoF/1dyTCruNXjDzMPCwrNvBoMRJM=;
	b=Nyur1B7sMVoEMv0w6w+wCRyr+QvB4dTcEtezTmvPmbyMMEmoMQPYjaxms5jNnn7QPq
	B6ICAyjqInQRjxJy6wRSJUej8K5yg3aCAvJJ+Qteat+LP/NeRwTqSb03y7sknkyTmdZW
	UPVs3tj0D0RNOVHCdVfEVdqh48wlj2eKosjCYK+qyeABywVrr5CfkBPbaLzbNTRZELxI
	CuNhNuLy123cB1fWifBociYSk+lQMWp814T3+CjTZguWFonSk9g8VJkGL6SBLuwqWl/B
	dheEZ3irqlLgNUwDS0okZ1KWYsKUH38g/DQ5NMdyFi6dmxZykMCCoJFnXBK0qeu3FTvp
	lOZw==
X-Gm-Message-State: APjAAAUCIrFXnN9TzDSUhYgGZpl1ouHDWPoUnwn1qYM6iDIQZG6yH3uf
	viiZnlHexyjBnZDxQeyo1+ErJFPFHW8hsONW2DcCxg==
X-Received: by 2002:a9d:6406:: with SMTP id h6mr2665885otl.238.1551973422637; 
	Thu, 07 Mar 2019 07:43:42 -0800 (PST)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
In-Reply-To: <CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Mar 2019 15:43:31 +0000
Message-ID: <CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IctjcNLaZ0yg

On Thu, 7 Mar 2019 at 15:27, bzt <bztemail@gmail.com> wrote:
> Yes, could be. The QA7 spec is not really detailed, and calling both
> timers simply ARM timers can be misleading. But it's not relevant
> anyway from the IRQ's point of view. My latest patch checks both bits
> to be set to generate the IRQ, so it does not really matter. As I've
> said, this patch adds only the periodic IRQ, and not a full timer
> emulation.
>
> Do you want any modifications on the patch? If so, what exactly? Let
> me know and I'll update it.

I assume by "latest patch" you mean a planned v3
that you haven't sent yet?

I think it's probably best to go with my interpretation of
the specs, if you think it makes sense:
 * running and stopping the timer is controlled by the
   "timer enable" bit (and doesn't care about the
   "interrupt enable" bit)
 * the timer timing out always sets the "interrupt flag" bit
 * we set the destination core IRQ/FIQ if the "interrupt flag"
   and "interrupt enable" bits are both set (we don't care
   about whether the "timer enable" bit is set for this)

That should be only very minor changes from what you have now.

thanks
-- PMM
