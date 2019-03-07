Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7286499wrx;
        Thu, 7 Mar 2019 07:42:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqySC/y6JMVhtljx7f5f7+4ki78G81VrGmtScb3RcjnL7ifRprvxVlnI/h+qtJsTTCSPsAVB
X-Received: by 2002:a81:a849:: with SMTP id f70mr10589012ywh.219.1551973349258;
        Thu, 07 Mar 2019 07:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551973349; cv=none;
        d=google.com; s=arc-20160816;
        b=nCjJ4GsviukxNaRrxlVg9XtGRweinLbKVR5EBneNl3oVFVLHsatUwTgf3A2GUSfqxv
         ZAfmYaNCre0bMaIjgYIB0LTr/GQZilVgUlLQ8yoelhrNLri+T22oQo/9K13y9zCm6Qx2
         WrC7dLaUUgEpWaMRU8XkAjxHFm9JoNAMvCodaOq/aCui+Mw8r7K3h15w6jydBpnBMRcI
         ixV+4OWJK+gPPxiUONEgAyZ3qLuRp5bQM8oQOjaeQOk8eg4uJ6DMJHBywebwueLxYG9E
         pLejmPBXTVTD1fCYmEBzcBfoFAh9XWQrWw7x7Le1lHTn5it9iCQEVbYp7OLsoKhrBZdy
         nN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=nXWrKGcG8gSoFa4il11s6wS6XI4LYWd4YC8o7XpICnU=;
        b=auzmThoZ9fBPxbVQ/k+Ra+DnYDgZwGNqlNppUARRk6wB0Yg/jb8FSjnEwfFZii8oE2
         i+qI6ojkkGoMRx0ByThfSNIlSWIXI7bfp5OePM4dA90C4X9phzFHOPQnCTWGrYHNUIHM
         KgAvFFUB3rt56cfAO1tcL9kALhSC0HXIQp7h/QIi56dwabsAuiA22tJeoryfl/OrR484
         QEMDotPXoagyLJ8mlfJO8qoHjfOdMf17veMmak3Mcw1ut0XuDsZYPav7y7M0lIJqJQ6a
         DyZ07lB/1b73BqZzM/5hnkvFqoWewiq2LQMBmsrPxeZsnKbCR/C3bQg8QD+2XHyKF5rR
         QwOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thuouwDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p192si3012255ywh.50.2019.03.07.07.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:42:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thuouwDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:54077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1vAC-0000U7-Mt
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h1uvs-000588-NK
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 10:27:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h1uvr-00078O-Iq
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 10:27:40 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:38438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1h1uvm-0006ya-15; Thu, 07 Mar 2019 10:27:34 -0500
Received: by mail-lj1-x244.google.com with SMTP id 199so14592477ljj.5;
	Thu, 07 Mar 2019 07:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nXWrKGcG8gSoFa4il11s6wS6XI4LYWd4YC8o7XpICnU=;
	b=thuouwDjTlvZjzhNl+0XVO/6DOOq5Lc7mDlieK5AAc6eg/lIt+3IUjcB9xGC1uhnWP
	WSJ3nIconAAdaYd2qLH6ZGiNlcOVBYu8CF6edavs9bsHrZfOGrVDVa+DseFhN2YjLCqt
	3J/gZE167EKozUui/DI+JtRvupMjuoGfxk6/DNoPGSIUC0PllLdkHW+ReU+PKszszURA
	p7WqMWG8cQHJsUQ3KLt/5Hh6QBLYLWlv5r0iSS6CmoTy36gRc3r6PqxaZrbMDqdhoR/1
	3zhZ5pITMhKhQj8BaP95OGyIhRswRw/njb3yCb7Re020q8tAls/CWurgccEfVsBQ6cGJ
	iO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nXWrKGcG8gSoFa4il11s6wS6XI4LYWd4YC8o7XpICnU=;
	b=IIsROeNDqmoDLRovMz9OCUaqZGciQoA9yrVRRrIaTNkK3HIYWkGKkdEl3caEtw7nN7
	T6nEiFGuvTI7BlE45HFcgEc2Ir9dSBufTHWhtHeA7XcviHei4K8ct0GpTQqdnlN44EzF
	yLt/K/Ln/e7BLzxsrjxWEAg6xlqVKgGCNqgM9KNy8p/3MQs2j/AssoNYDiDaqCwyXFR3
	4xzxvD+emSmu1AC7vNxxkCudb//LHgwVQeyxHuDQRt8/K9YYzpZaNR1nhtXUJRaqd1NS
	JLQGlhTHSeYiiIn+ThJoa8EgGO1To/9JAJ5CHAkCSpnGoovpsF2ipnzoPXTcQSkSDIVV
	/MMw==
X-Gm-Message-State: APjAAAUDYNiBhcufJZlLSudyoI+sHjBpRkv0VmtSKVIr15pFobMAe0yo
	68vDj1OWcOu7+iz3SgE4f+O/44BeByAyBO33lqQ=
X-Received: by 2002:a2e:801:: with SMTP id 1mr6701700lji.61.1551972448567;
	Thu, 07 Mar 2019 07:27:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP;
	Thu, 7 Mar 2019 07:27:27 -0800 (PST)
In-Reply-To: <CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Thu, 7 Mar 2019 16:27:27 +0100
Message-ID: <CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: thRppU5oaioo

Hi,

Yes, could be. The QA7 spec is not really detailed, and calling both
timers simply ARM timers can be misleading. But it's not relevant
anyway from the IRQ's point of view. My latest patch checks both bits
to be set to generate the IRQ, so it does not really matter. As I've
said, this patch adds only the periodic IRQ, and not a full timer
emulation.

Do you want any modifications on the patch? If so, what exactly? Let
me know and I'll update it.

Cheers,
bzt

On 3/5/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 4 Mar 2019 at 19:27, bzt <bztemail@gmail.com> wrote:
>>
>> On 3/4/19, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> + * The IRQ_TIMER support is still very basic, does not handle timer
>> >> access,
>> >> + * and such there's no point in enabling it without the interrupt
>> >> flag
>> >> set.
>> >
>> > Can you be more precise about what's missing here? I didn't
>>
>> The local timer (as per the referenced QA7 doc calls it, section
>> 4.11), means 3 registers in the ARM Control MMIO, at addresses 0x24,
>> 0x34, 0x38. Please note that I haven't named IRQ_TIMER bit in the
>> irqsrc and fiqsrc fields, that was already defined. This patch
>> implements that one.
>>
>> > see anything in the spec that looked like a register for
>> > reading the current timer value (though it would certainly
>> > be usual to provide one).
>>
>> Those are registers 0x1C and 0x20, called "Core timer access LS/MS",
>> section 4.3. I'll make the comment more clear. Those are not local
>> timer IRQ related, because they could use a different frequency than
>> the IRQ, just happen to be enabled with a bit in the local timer's
>> control register (and not in the core timer control register at 0x0),
>> and on real hardware triggering an IRQ requires both the timer enable
>> and interrupt enable bits to be set. The timer counter is a 64 bits
>> one, while the IRQ's counter is only 28 bit wide, which cannot be
>> directly read, does not use the prescaler, and it's reload value
>> stored in the local timer control register itself (unusal, but that's
>> how it is).
>
> OK, so that's just an entirely separate timer whose control bit
> happens to be in the same register? I'd assumed that the enable
> bit here was so you could have the local timer be running but
> not generate interrupts -- in which case when it expired it would
> set the "interrupt flag" (and reload), but it wouldn't assert
> the external interrupt line.
>
> In fact thinking about it that does seem like the more plausible
> reading of that specification:
>  * bit 28 (Timer enable) enables the timer
>  * when it gets to zero we set bit 31 "Interrupt flag"
>  * the outbound interrupt line is the logical OR of
>    bits 31 ('interrupt flag') and 29 ('interrupt enable')
>
> Are you sure it doesn't work that way ?
>
> I'd have thought that any enable bit for the "core timer" would
> be in the core timer control register at 0x4000_0000. Since the
> "core timer" is (apparently) the source of the clock for all the
> per-CPU architected generic timers, it seems more likely that
> it just runs constantly without an enable bit.
>
> thanks
> -- PMM
>
