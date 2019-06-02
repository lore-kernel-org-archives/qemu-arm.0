Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp2632018pjq;
        Sat, 1 Jun 2019 20:31:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0bdSNBbGvgOtZCCslzl+lddQobqALSAfuz5f0ee4QjU4IGOa5npyBXMnQ9ZeNl+yYrMZp
X-Received: by 2002:a37:f50f:: with SMTP id l15mr16552666qkk.343.1559446286038;
        Sat, 01 Jun 2019 20:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559446286; cv=none;
        d=google.com; s=arc-20160816;
        b=rSbzvDjw/I/PK2wLFqSvQQUGIX/KrGnYBaQ8hRDCHBGI1ZEpJr0AnJWAhbc9e1X72m
         L5nWSG1yX42luR8onx+IGAGVEKXs06xRD0gElf/IPTnCmXzBpvUob35LO0rcvJ03Qhc3
         6xzgGXNU8GkHblvGBSjS5Sw2bgcXgtc4OvMYTqOPwYhEVWswriPtorcRT/JoclW1RYOD
         hMO5NEfdXtpR4c++wNy0wtT51HJaslihwMFaOR2dp0bHShfCQ3O/NHXtkG0t98bGh/C9
         og+bs9Ak6JQm75bNet4kiIgcazOiHyOLkn0VOjiHViQ4y0lnYzJW57M5I3UbuKxM4D7r
         /OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D3JFs7E1SZmBAPQiKL3HwgWeR0oL/aOl1WIX3xka4To=;
        b=jqbF4uUDU8CJgNNP9xe9UwR9Y8zkAASzK0Dcz0a5HTDHGdcsPqMQxT5gESbovjaGJl
         d+94A5iSYDJxoSVC1qrsRsSXr0B9YIqMrAaqeJplNVXy0wejNC5bsoVr4dMYZ9y/DMc5
         rT2zZt95k7w3fUJ9FUNdjiUxO5MMokjjMb/cAcSt3fWa5GbQEIcutmm4rSBcv8rsBSb2
         US4Dj6r5ogpJm3bVYJCPiEFazmZ7owt7ikr3s4eiaMjMypGvmoG0Tre3ZIqdbuD7MmYf
         UEHYDkulivkXB4CaSm7NrWrGIj/evYKzNbRLpjt4Oq8lKcle6HuHMuJ2qPpvLmaHUf/I
         87uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QxbO5xw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23si1466498qvc.127.2019.06.01.20.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jun 2019 20:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QxbO5xw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXHDR-00043z-Ap
	for alex.bennee@linaro.org; Sat, 01 Jun 2019 23:31:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hXHDI-0003oq-5I
	for qemu-arm@nongnu.org; Sat, 01 Jun 2019 23:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hXGz5-0006LM-JM
	for qemu-arm@nongnu.org; Sat, 01 Jun 2019 23:16:37 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hXGz5-0006Ip-6c
	for qemu-arm@nongnu.org; Sat, 01 Jun 2019 23:16:35 -0400
Received: by mail-lj1-x243.google.com with SMTP id m15so4795801ljg.13
	for <qemu-arm@nongnu.org>; Sat, 01 Jun 2019 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D3JFs7E1SZmBAPQiKL3HwgWeR0oL/aOl1WIX3xka4To=;
	b=QxbO5xw80ma37MnNcZBBV85+KSPLHrezEfuBW0slPi8oZF3BGFinCjq2QMHH5/lsGS
	3Rlo3qrTYM8Wf5bP/11pjtYNC2CdvlpC7EHAdjQMktyTm7jZx+tgNFBV2tQYyrehAp5X
	FoiDxv+bRxA3sSoUqyTE+1S0fl/krs/0E0hNCOm7QIaGR9mcICqUeKLfUuS9miT7wtuu
	wtwJfMDchSDwO4eSqRH0NiB7LOs10pBjrAQt2qAW4NDZEa9PJpee0HKzOJZNdqLshBxi
	5todOSPVU/UeJuflyQYIfYKf2SMgWuvLrSUyCI2yA4vg0HLwN2XEkFdT/ApstzjHSTdR
	NFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D3JFs7E1SZmBAPQiKL3HwgWeR0oL/aOl1WIX3xka4To=;
	b=WURyvbatxsQV5fKSZLACegT/RMjUZgqoR6+Np7W0O+wBGMwqpUiZ/xhXzmsO7b/kC+
	Dmu0DZeKU1ToofPter3DEZY0+fI6xX2pwOmbp8znDlYpzVS6kxnCAngozVO4neSuB+r+
	BqXnR89IeR/QLJVyLlB3D8GlkUxBxQjLPdam2U9AbYdbawZzECq+DqKA6LWH5gzb0a3V
	+Gr/g/REh42QzE9XGKpzYCQM1CQp8Dp96J3YdPDYOH9IN0BVpGufYq7ksDuYPY8rbpBh
	4sK0R39K1kCk9eMPj3SeZ+sZlkDA/Lnu72wsFI+JlmlB1rtkey1trMv3/B03/J9WUMXD
	Vwqw==
X-Gm-Message-State: APjAAAWU/SHH9O+lYqGJ0DbtXq2s6RRFXdhX+TzfB6GYqybi7EmXUhar
	UDI4aHz3qchubFVVTM9K7Q8v4HPh6DzmDtGlkhnmvQ==
X-Received: by 2002:a2e:824d:: with SMTP id j13mr9919004ljh.137.1559445389243; 
	Sat, 01 Jun 2019 20:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
	<87mujxavy3.fsf@dusky.pond.sub.org>
In-Reply-To: <87mujxavy3.fsf@dusky.pond.sub.org>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Sun, 2 Jun 2019 11:16:17 +0800
Message-ID: <CAHmQWvDC5392euk2zdKhjYBuxHx7Bw7+pnDhTPfqsRnHk51qhw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 2/2] hw/arm: Add arm SBSA
 reference machine, devices part
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
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rl0OyAWn2nOV

On Wed, 8 May 2019 at 21:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >>
> >> Following the previous patch, this patch adds peripheral devices to the
> >> newly introduced SBSA-ref machine.
> >>
> >> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> >> ---
> >>  hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 451 insertions(+)
> >
> > Some fairly minor comments on this one.
> >
> >> +static void create_flash(const SBSAMachineState *vms,
> >> +                         MemoryRegion *sysmem,
> >> +                         MemoryRegion *secure_sysmem)
> >> +{
> >> +    /*
> >> +     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
> >> +     * space in the memmap, file passed via -bios goes in the first one.
> >> +     */
> >> +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
> >> +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
> >> +
> >> +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> >> +                     bios_name, secure_sysmem);
> >> +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
> >> +                     NULL, sysmem);
> >> +}
> >
> > I think Markus might have an opinion on the best way to create
> > flash devices on a new board model. Is "just create two flash
> > devices the way the virt board does" the right thing?
>
> Short answer: create flash devices the way the ARM virt board does now,
> after commit e0561e60f17, merged into master today.  Possibly less
> backward compatibility stuff you don't need.  As is, your patch creates
> them the way the ARM virt board did before commit e0561e60f17.  Please
> consider updating.
>
> Longer answer:
>
> The old way to configure block backends is -drive.
>
> The newer -blockdev is more flexible.  Libvirt is in the process of
> transitioning from -drive to -blockdev entirely.  Other users with
> similar needs for flexibility may do the same.  We hope to deprecate
> -drive eventually.
>
> The traditional way to configure onboard flash is -drive if=pflash.
> Works, but we need a way to configure with -blockdev for full
> flexibility, and to support libvirt ditching -drive entirely.
>
> I recently improved the i386 PC machine types (commit ebc29e1beab) and
> the ARM virt machine types (commit e0561e60f17) to support flash
> configuration with -blockdev.
>
> I recommend new boards support flash configuration with -blockdev from
> the start.
>
> Questions?

Sorry for the late response.
Thank you for the detailed explanation, and I'll follow the new
pattern in my next version of patch which will be sent out in a few
days.
