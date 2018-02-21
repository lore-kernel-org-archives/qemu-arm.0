Received: by 10.28.71.27 with SMTP id u27csp747056wma;
        Wed, 21 Feb 2018 05:42:16 -0800 (PST)
X-Google-Smtp-Source: AH8x2256EJ3JjaEceubV8uqMgzgGDl69FmEhN07oDOHw0VnGkTRA5EY4qWFedomIs+zDUiuAKfB4
X-Received: by 10.129.145.6 with SMTP id i6mr2151829ywg.444.1519220536905;
        Wed, 21 Feb 2018 05:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519220536; cv=none;
        d=google.com; s=arc-20160816;
        b=lmKMP7eu3KTSucqvot881vULbAW3xZyytFyTV3j3pZ24ClvAbdUrZUd6h7X3IfZqoP
         NbKP3x7iDqpFkBEfQ0zoE6QkWcArtUZAo7CWmIlTGAofOhMSsWSvm89IEzH0F/bVJi3z
         YgDOsr7HYJuIpcxEcvMEg7/cEvMH7T2aqdJYAHx6LQBD/dsXxPd4uJh4+no5goIZLRaq
         xprr08UMKwWBUtQXpGO7OnzDoC5sLdiKDmr6khV/6vvfFKfCHIoTcSl2Kgh4xOfgh5QX
         NB4dLyuBhM6u8b8f2KCeRuyw56LClMSNHNUYtk2dodhIwaUTneQwvRYFWvXG4e2reSx+
         ZtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YiLo/m8E3iECtL4WiQW0l73edg3LJ9sUbVdWWXsxLKY=;
        b=BPDReHV61dS8Fub/MMtWdiNnjPS6gqD/MB96iG8c4UX4CQJHr3tzXfSWor5vWj8HOS
         vuPcWD/Ws+0d2NGNnTYzi7KIWlqFfSlzUOoHk/j42CBVZRaIT1crsj9slf3zoeg1zSJn
         sANCi5OiQEWPHQ788ZEoz3eg0csE4/e5pJ5iHNkgPKApO5kS+5DKg+iBVlsjqDcYqgJg
         v8R1gcl1tll+BmXCjAiGKKUnMPKVuWKLg/vlk4+qMP4KOgSScsxwxM1seiJL34l6/mpD
         uPrKDIsizFUM/uIZX8Mv3e+XWi1MG0N7hW+LjV0fRarGWo9ZlJMFKCkDfaRe5Zi7xeam
         dH6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=javUO08G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si384992ybi.830.2018.02.21.05.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Feb 2018 05:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=javUO08G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoUf2-0006Bx-Do
	for alex.bennee@linaro.org; Wed, 21 Feb 2018 08:42:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoUev-0006Bh-IU
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 08:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoUeu-0005FV-Et
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 08:42:09 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:45463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eoUeu-0005EC-9r
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 08:42:08 -0500
Received: by mail-ot0-x230.google.com with SMTP id f11so1396554otj.12
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 05:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YiLo/m8E3iECtL4WiQW0l73edg3LJ9sUbVdWWXsxLKY=;
	b=javUO08GTSDdXVjktV6RR6JHTbRARWxtSadBkqUly1rGzCArddB71SAxyjlxTAg9sy
	jng9D5yPAcQqHAsQh/2F02evrFPOBxYD5ptmIhHeWF/OMoAXBKB4J70PrDT6alL1nZVu
	V4AIv/cjCfZqNoz+p3vmT8TekLNbN+IUbrt1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YiLo/m8E3iECtL4WiQW0l73edg3LJ9sUbVdWWXsxLKY=;
	b=JWeav108uWDQlTK7Na77agiigq6RmpFpNICbn2GtNevgdi7wl54z37aSu2Tx/NYCtw
	C3FapvMnMVg8cS5UYL/EjF7qEvYqOD1IPXHg/aNB7/FrPyGgqZRXYyKeS7JNG0xtmvsv
	wanK9mkwzvqQw6AyakNRLvQ+XrBQKor5hF6tYnhYuMoVWIiWHYtgbnThVju2NRuUG0WI
	TKlNZFimjCUkSNL0KLNa9OGc6MopK5873Ku76pqdAHJuV3LConZT9fJREvrVwLdlHv/m
	DBnzivdTGnypNP5/kd1y5iKeLSBlDo7xyJb837ZBoKEhGQtfo/vcP/DLoJijtS4i9gYV
	cpvg==
X-Gm-Message-State: APf1xPBKGc1m1URP6PIfj1mcKD/uA/ucXHWef0L9dIPJuUyIzkZrc0dM
	ROqUrJ0rA9RRtyO70Etq3ZBAn1LCiqwNasGc+YnBuw==
X-Received: by 10.157.46.143 with SMTP id w15mr2248652ota.205.1519220527157;
	Wed, 21 Feb 2018 05:42:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Wed, 21 Feb 2018 05:41:46 -0800 (PST)
In-Reply-To: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Feb 2018 13:41:46 +0000
Message-ID: <CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
To: Rd Cheung <rdzhang@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] ARM cortex-m3 instruction fetch misbehaves during
 do_v7m_exception_exit
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBGbu6e5/oQ+

On 21 February 2018 at 03:52, Rd Cheung <rdzhang@vt.edu> wrote:
> I am emulating TI RTOS(Texas Instrument real time operating system) on a
> cortex-M3 device. I have made boot up code work, but I am currently stuck at
> exception handler.
>
> when the code return from exception handler it goes to:
> 0x1001c90e:  b401b402  strlt    fp, [r1], #-0x402
>
> while it should be:
> 1001c90e:   B402                push       {r1}
> 1001c910:   B401                push       {r0}

That looks like the guest has returned with an incorrect
XPSR bit that specifies Arm mode, rather than Thumb mode
(and the guest will take an immediate UsageFault trying to
execute the next instruction, since M profile CPUs don't
implement Arm mode).

> I notice the TI RTOS return from an exception with PC with bit 0 set. But it
> should not be an issue of current qemu.

Which version of QEMU are you using? For v7M doing an exception
return to a PC with bit 0 set is UNPREDICTABLE and this is
always a bug in your guest code. QEMU will (in more recent
versions) ignore the set bit, as M3 hardware does. It will
also print a warning if you pass QEMU the option "-d guest_errors".
Older QEMU versions would attempt to start execution at the
odd address, but we can see from the disassembly that that
hasn't happened in your case.

However, the PC value doesn't affect whether we think the code
is in Arm or Thumb mode -- that is determined by the XPSR
value we pop off the stack, and specifically the XPSR.T bit.
You should look at what your guest code has set up as the
XPSR value.

thanks
-- PMM
