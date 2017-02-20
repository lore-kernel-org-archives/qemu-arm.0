Received: by 10.25.0.147 with SMTP id 141csp418560lfa;
        Mon, 20 Feb 2017 02:01:05 -0800 (PST)
X-Received: by 10.55.212.24 with SMTP id l24mr21195917qki.189.1487584864547;
        Mon, 20 Feb 2017 02:01:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si12587162qtf.306.2017.02.20.02.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 02:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfkmF-0006Vt-WA
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 05:01:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfkdj-0006SL-K8
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 04:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfkdi-0004Kt-Kx
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 04:52:15 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cfkdi-0004KJ-EY
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 04:52:14 -0500
Received: by mail-wm0-x22d.google.com with SMTP id v186so73567525wmd.0
	for <qemu-arm@nongnu.org>; Mon, 20 Feb 2017 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x1XE85Bb1PJzo2TceMR+coIRzInVENIcxVCfZyxTQ1Q=;
	b=Q4i8apLGkVUc0ATzEhneDR6ARTQNVkwtFrnsZTZgA26JmWe4X72VzIMum3wPvowt9h
	NguRMah2i4HNWBug/ZzCZZqOHF7f4UehklE6vex0f/KO06036mAz19xE+NP41kQLI/75
	s/qixg+rAU4foI9S57xB1v5IOPbHTfbHICs9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x1XE85Bb1PJzo2TceMR+coIRzInVENIcxVCfZyxTQ1Q=;
	b=oVYs4KXOx+wu8GlBErBdUWeaUFymeKoswWjujxV9DgL0LfrMB9H0u4+cAaJGmPsdQR
	nWGCFrQn9iJ49F6i258Mkh3mAIvqDaXkqYhNrg4lCWZAteZ07HyMFZQfo8v7Xr1mvsds
	+rfIPp4Brt79FSnqIlS+3wUYK8ceI5uH9cA7CA1zPeGefmlF+px38HFERrujCAYORQwx
	9CVwf2io7pEwiDLtSRBn1FFTJjCyHyc83kA3nPugIFoM1tAHIFnczWoxpU3hImHrK3R/
	sbXouRSECheZLau6bsZ+BnF8D6h5TDr4WfnSKKwjxUdi9tDbfWzn886ycnbrwE9KjYoP
	J1Ag==
X-Gm-Message-State: AMke39lNOi5ktI/7AQwYEwUE5o259QZsJrR+/b05ddzGDnCGxZ6FvMnzueUTmWml1BxbtRm/U7Th3poBZwVGWZ/P
X-Received: by 10.28.16.70 with SMTP id 67mr10546543wmq.142.1487584331711;
	Mon, 20 Feb 2017 01:52:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 01:51:51 -0800 (PST)
In-Reply-To: <CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
	<CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 09:51:51 +0000
Message-ID: <CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SzIs5kc9uo1V

On 20 February 2017 at 06:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> Hi Peter,
>
> On Fri, Feb 17, 2017 at 7:25 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
[on the guest-visible ICC_SRE_EL1 value]
>> Is there a situation where KVM might allow a value other
>> than 0x7?
>
> In KVM, the SRE_EL1 value is 0x1. During save, value
> read from KVM is 0x1 though we reset to 0x7.

0x1 meanss "System Register Interface enabled, IRQ
bypass enabled, FIQ bypass enabled". This seems
rather a weird setting, because it means "the GICv3
CPU interface functionality is disabled and the GICv3
should signal interrupts via legacy IRQ and FIQ".
Does KVM really support IRQ/FIQ bypass and does Linux
really leave it enabled rather than turning it off
by writing the value to 1?

My expectation was that the KVM GICv3 emulation would
make these bits RAO/WI like the TCG implementation.
Is there maybe a bug in the kernel side where it
doesn't implement bypass but has made these bits be
RAZ/WI rather than RAO/WI ?

thanks
-- PMM
