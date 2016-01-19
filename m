Received: by 10.25.159.19 with SMTP id i19csp2220391lfe;
        Mon, 18 Jan 2016 17:35:00 -0800 (PST)
X-Received: by 10.140.31.8 with SMTP id e8mr26138145qge.14.1453167300685;
        Mon, 18 Jan 2016 17:35:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si34203854qhm.62.2016.01.18.17.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 17:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:34436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLLCF-0004Ze-1u
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 20:34:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLLCD-0004YA-Gw
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 20:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLLCC-0005XG-MZ
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 20:34:57 -0500
Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241]:33247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aLLCA-0005Wf-NZ; Mon, 18 Jan 2016 20:34:54 -0500
Received: by mail-ob0-x241.google.com with SMTP id oj9so17305744obc.0;
	Mon, 18 Jan 2016 17:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=3bWPlZoEC61G5f+GXsGEmTTCW6H3ZlgR9p82kEmZL9Q=;
	b=qy/3WFR0fNUvlQnRURGlKYN+RA3X08qh7nEAab/2TTyKsGdqvsLh7F86J/IqFrjtYb
	Flis8LCNIlwKCsI7Ct2CVtFRZFwvI9tC2/Ayv/tySLOnlc86YTNJgHrdlcgYWECSplQN
	YQEmhoRO9PzZ4wNokkfgduCs+LrvvfENynL+72HYaOz/HuSM4wwP1HsfKpxfUjSaRBF5
	VLU/okkgpdMffaJEpD8zjmpvG+a9pSI+B4KUkut+xot4PtqMg6nrOZgAyg+CSGs99PyB
	umlpULN53oAdkTeqMWuMOyMRI6hiNHiFfdLz82qhcNM1cnb8TWamzBI70i0ZmpkL1eZ1
	U1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=3bWPlZoEC61G5f+GXsGEmTTCW6H3ZlgR9p82kEmZL9Q=;
	b=DQSzkzfzi4q3ZGtmFspVgVJykOUvd87C0muPlVIzCo8y7iYHN1uNG1VlLQNloTBWOP
	uwyUeajn0OAC+WYQAzwTyZHOMXNvRbvydO/lDpybhr9+SUgSRzCQYVYm08E9CFXC2cGq
	VtQL3UPiOMWU2CH80IsBSUd3q8Pi8KIefAbt57WBlKGetyeOR7C6DasQFVu93PNjnTrJ
	+L7cjtSCos2WsciRqlzoyXcu9T47cF4j0AhZ6owl9kXBsiKn+5awQuOLEnJJLMBFsFdc
	ZZOaQP0ojHvqGFFnl/1GCzzokFmJLOtgKo48KOiKji3trXwf6xkYAR4V+16qFycte+zD
	Ub6w==
X-Gm-Message-State: ALoCoQmNl9JtkOlne9juW6dcdKIJ6RF6nYiQyjSkWIAlWJd1MVsWHIkR17wkugNKm9S0ZPj+dYIo9otBT4q35kkRASiSb9kLvg==
X-Received: by 10.182.28.66 with SMTP id z2mr21930442obg.32.1453167294093;
	Mon, 18 Jan 2016 17:34:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 18 Jan 2016 17:34:24 -0800 (PST)
In-Reply-To: <CAFEAcA98nrOuWTjgpkJ9W4QRS+pDZprnYLPNNKd=GqYBD9Zc=A@mail.gmail.com>
References: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
	<CAFEAcA-mmYVGqBP9J855Xm20n0XGVMLoWv4Lze61y00EvFBDyw@mail.gmail.com>
	<CAKmqyKNyc2tU0cmGhGDz2tm17q7fYRzqmML-Yo2fE8Ly4fmtAQ@mail.gmail.com>
	<CAFEAcA98nrOuWTjgpkJ9W4QRS+pDZprnYLPNNKd=GqYBD9Zc=A@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Jan 2016 17:34:24 -0800
X-Google-Sender-Auth: iCxum66uPgUyrLmQGGWKoXN86e0
Message-ID: <CAKmqyKP4M1nea=dFNGu+OteqC_0Xxb_UceoD5CBP_LejTrDuuA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::241
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] arm_gic: Include the GIC
 ArchRev in the ICPIDR2 register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OLG8dpW70ETc

On Mon, Jan 18, 2016 at 2:13 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 21:41, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Mon, Jan 11, 2016 at 5:58 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The current implementation of the ID registers seems to be
>>> simply "like the 11MPCore interrupt controller". I think we
>>> should get them right more generally if we're going to fix them:
>>>
>>>                        fd0 .. fdc     fe0 .. fec      ff0 ... ffc
>>> 11MPCore               reserved       90 13 04 00     0d f0 05 b1
>>> ARM GICv1 (eg A9)      04 00 00 00    90 b3 1b 00     0d f0 05 b1
>>> ARM GICv2 (eg A15)     04 00 00 00    90 b4 2b 00     0d f0 05 b1
>>>
>>> Your patch doesn't account for ICPIDR1 also having a field that
>>> changes between GICv1 and GICv2 (for ARM implementations), and
>>> we're missing the fd0..fdc bytes.
>>>
>>> I think this is probably simplest modelled with several
>>> gic_id arrays and using the appropriate one for 11MPCore/GICv1/GICv2,
>>> rather than trying to OR extra values into the 11MPCore ID values.
>>
>> Ok, just to make sure I am reading this right. You think I should just
>> create three arrays and then if() the revision to determine which one
>> to use?
>
> Yes, something like that. The fd0..fdc being reserved for 11MPCore
> is documented to mean RAZ/WI, so you can just make those array elements
> zeroes.

Ok, sounds good to me. I'm about to send a patch out. As basically the
whole patch and title changed it is back to V1.

Thanks,

Alistair

>
> thanks
> -- PMM
>
