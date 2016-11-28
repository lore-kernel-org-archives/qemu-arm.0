Received: by 10.25.150.194 with SMTP id y185csp1740164lfd;
        Mon, 28 Nov 2016 05:02:19 -0800 (PST)
X-Received: by 10.237.53.8 with SMTP id a8mr17644788qte.223.1480338139096;
        Mon, 28 Nov 2016 05:02:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h63si31928479qkc.102.2016.11.28.05.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 05:02:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBLZZ-0006OA-UD
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 08:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBLZW-0006O4-4a
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 08:02:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBLZS-0004OQ-AW
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 08:02:14 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBLZS-0004Nr-0d
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 08:02:10 -0500
Received: by mail-vk0-x22c.google.com with SMTP id p9so72705026vkd.3
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 05:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DQ0XUMBXRNpbfJREo9Eoc1QXxkIApB1QaRnwns1RNbc=;
	b=L0o8Oo4p52BXARNWWub4gbniHZuISvrQ7+s2MZX8GOr3E9/9NH9z9ehDwzNdo6Jll3
	WRB9xNtt9dUvRk3Ki4S3+ulqf2X+wZ1TngYlvYvynvfKa00Ye2Us6PNpu1eGhOv5Sy4e
	GDkWs220IZLJwFecXM5tvhXm6NeNpCDmPy00k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DQ0XUMBXRNpbfJREo9Eoc1QXxkIApB1QaRnwns1RNbc=;
	b=JXztzg8XA+CceTtMULIFB6vRwa2zEvHutmX7+jjOKsqKFw4o/tqIMEvtEwfmGrl+Yi
	VtxsndLcEAlO3cFEB8mUBixc4B0d7EP7nLImtxMgYGpEOBNEAwjDD+Iy+MqDVoaLPbsg
	9CxuSoU+Ryb5HkwC8eY8l8FoA/lcixxRBaKXsUE4SCDnM26MEIVxqCdzVdnViubIf6Vb
	UJpPaCoA5AFg+bhSIN1oJY8KStpMNTOI3lYzhyBVUx56jdETqzFm3yEItSc+Tea4ura9
	QqMEkp9FVK+9uVp4OlX8+Z1JP382aNNtDwcyxJ4jTARidPuJxhNPQylaUEbw9u5QU3fX
	n9eg==
X-Gm-Message-State: AKaTC0015Zqaq8W0C3AE2b/dNAQ6Yy5K2KfDDKRSNTaGbGRK/Dlaho82Y0j1bpe1/0edX5kkWoRRiinev4SZJwon
X-Received: by 10.31.7.204 with SMTP id 195mr7746843vkh.175.1480338128550;
	Mon, 28 Nov 2016 05:02:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 05:01:48 -0800 (PST)
In-Reply-To: <1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 13:01:48 +0000
Message-ID: <CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_kvm: Reset GICv3
 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m/BL8QR2yYvI

On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Reset CPU interface registers of GICv3 when CPU is reset.
> For this, object interface is used, which is called from
> arm_cpu_reset function.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This approach doesn't handle the SMP case correctly --
when a CPU is reset then the CPU interface for that CPU
(and only that CPU) should be reset. Your code will
reset every CPU interface every time any CPU is reset.

I think it would be better to use the same approach that
the arm_gicv3_cpuif.c code uses to arrange for cpu i/f
registers to be reset, perhaps by moving the appropriate
parts of that code into the common source file.

Having the reset state depend implicitly on the kernel's
internal state (as you have here for the ICC_CTLR_EL1
state) is something I'm a bit unsure about -- what goes
wrong if you don't do that?

thanks
-- PMM
