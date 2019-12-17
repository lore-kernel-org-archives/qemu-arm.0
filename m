Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6159720lff;
        Tue, 17 Dec 2019 07:25:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuoVkuOL/9r0sxQceTluIF2gp14btFrwg1Em3hon07MAtvPsgdeMJO/mj6ILjTKHmn9OLm
X-Received: by 2002:a05:620a:201d:: with SMTP id c29mr5485401qka.91.1576596336267;
        Tue, 17 Dec 2019 07:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576596336; cv=none;
        d=google.com; s=arc-20160816;
        b=KwEGgP0HXvQ/lDT7MS1j/NLWLLtHhhc5FJV50HIaVt95eHo57lCJ+U4eb4yKy4KtiX
         01mDlO3PxHt8QUV/E+4nO04sANQFhEhaZV3NutBq+Uc4CpZZl9lHHxFBp82YqvG4OjnK
         jeeSgOO4pXunNwbu7XKg52/f3JIbY5D4b2ez6Ai80B0+BlCzUsEYsDHJqv/ugMZWL+3x
         GmW9yrw7R7ejB1uqUSv/9MxJx/XY5eveL3BjW5pFho26r8Vj2OMHMZQ9pWgXcP6bO/5u
         KfQYx1Z8Qfq1LOfKXBeEe1h+riDlUBES9rEiPJpaMIhbrusnL/bMpSgwbJA6U7gJxBnR
         rU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1r3TUAOg93CqYB/EqAX5MDLFd3UQVOc322Wa0FEsFo=;
        b=tkfBjTTaCXDNeVJKAKWoPDBaunYkeSHE0i/fHAEw/2J3bABlWsRXct7sJxU4Tn233w
         TQxqLZ7eNQbeQwDovwpD2il0vsLtlV1KTeUcajTiGR1Z0ko72SZcQDoc6ynuFhOk3bjG
         n1tJZPm9D/DkASnQekbJeZHrygmMiX7+gZiaU2GwAT9Pv81/XFgLBRHQH0DNGi2W8TV5
         NhnUetkf/aUY6z3+Btif4TxlJJ+XjltxzhFDuNguUYFBOSVwJB3CNdmwq6Z/oU79mOz5
         i8Bi+BdswihMaBKTyO41mCOh6IdX96udC0cKNVAvXFzKKkppOuCIECXEq97hIUoWjObw
         /Xmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIL0GvhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si11879011qkk.284.2019.12.17.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 07:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIL0GvhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihEj9-0002vx-Ip
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 10:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihEiz-0002vb-3T
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 10:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihEix-0000Fw-D9
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 10:25:24 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36304)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihEix-00007J-5u
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 10:25:23 -0500
Received: by mail-oi1-x241.google.com with SMTP id c16so4882471oic.3
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 07:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1r3TUAOg93CqYB/EqAX5MDLFd3UQVOc322Wa0FEsFo=;
 b=eIL0GvhZlsZfWhCqXhOuOjIlI/H1KiFYYdsdfwqzsfTSkLm/nMGu4AmJLRBQ93oh4F
 NjWewEWYr9bXQHGC5ETYFY7YpnfYDpW321rVzuRvAIpscY+Y/i88jAHlWIC3yZIXmAsh
 uReP53ITxTynhp93oBw0xr4QWNHDA+R3HYdSUXiQatErkfxq/FmNgjYBr4UaLEZsPKYh
 JmNV82E91rGRa5Adb6cMqzn9D3Zlzpk+rGblS7+Of7KUfmyhHCpEzLGBoh68jTMf5o9e
 9Hzh4wTlin/5V51LBqX1AVQW/HyWTupfmYrGGj9ikF/R1YTuVDBqgSmWjOaV4iSCWwCB
 T4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1r3TUAOg93CqYB/EqAX5MDLFd3UQVOc322Wa0FEsFo=;
 b=tYyhAcqJGbFGrWOwsAHo88vAtiXeUlyJOCRr7bAm+NgqUF7psPpTuYe9fajXJf9T9P
 EDkQ3H2eRgQeknV8iLevjSh1JNGID4DoMaYwd3oOmYqH9YpxPzzCk1MjsE2Tiv4IM1rf
 5eQb7YymAnvrFKwU31ZIB/R/Aq5jo7mSQJh9IwuGbTaUorBBnWustnUbAdEgRFQcVkcF
 vUxNV9gOqYScm6GvhANsCVsH05wx8ABbQIJ7YemzwPJKmr5pSPgXfVWO90J/huuhjC2S
 LJESaL9aVEzuiAzJSUDp3DIUfH0AVTgCUFYyYZL1dF5e2SQ8CKZFtTM2V5+D7m8g7XA8
 Szng==
X-Gm-Message-State: APjAAAVtFQPWP7DRCKxTendJSXZVA6YB64ZsXGbbr1IPdcmrcEN21tPH
 CVRkt8N9ujHF1wveBQ9XIOFLvImPCYKNNdqipis/NO9K
X-Received: by 2002:aca:3182:: with SMTP id x124mr1903142oix.170.1576596321508; 
 Tue, 17 Dec 2019 07:25:21 -0800 (PST)
MIME-Version: 1.0
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
 <e0a55905-e76e-40d2-3d9b-06ea5b917001@redhat.com>
In-Reply-To: <e0a55905-e76e-40d2-3d9b-06ea5b917001@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2019 15:25:10 +0000
Message-ID: <CAFEAcA9PcjQq_0b+ho70ydn4gew7xE3o3CeSvdW19v5WdkeJow@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Simon Veith <sveith@amazon.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RV0ukpg68kvE

On Tue, 17 Dec 2019 at 10:04, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi,
>
> On 12/16/19 4:15 PM, Simon Veith wrote:
> > While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
> > SMMUv3 behavior relating to stream tables was inconsistent with our hardware.
> >
> > Also, when debugging those differences, I found that the errors reported through
> > the QEMU SMMUv3 event queue contained the address fields in an incorrect
> > position.
> >
> > These patches correct the QEMU SMMUv3 behavior to match the specification (and
> > the behavior that I observed in our hardware). Linux guests normally will not
> > notice these issues, but other SMMUv3 driver implementations might.
> >
> > Changes in v2:
> >
> > * New patch "hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value" added
> > * Updated patch "hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE"
> > * Updated patch "hw/arm/smmuv3: Align stream table base address to table size"
> >
> > Changes in v3:
> >
> > * No changes, but sending again to correct a patch submission mishap that
> >   confused Patchew
> >
> > Simon Veith (6):
> >   hw/arm/smmuv3: Apply address mask to linear strtab base address
> >   hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
> >   hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE
> >   hw/arm/smmuv3: Align stream table base address to table size
> >   hw/arm/smmuv3: Use correct bit positions in EVT_SET_ADDR2 macro
> >   hw/arm/smmuv3: Report F_STE_FETCH fault address in correct word
> >     position
>
> The series looks good to me. Also tested against non regression.
>
> Tested-by: Eric Auger <eric.auger@redhat.com>

Applied to target-arm.next, thanks.

-- PMM
