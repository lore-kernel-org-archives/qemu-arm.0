Received: by 10.223.159.82 with SMTP id f18csp3497284wrg;
        Sat, 25 Nov 2017 10:05:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ/ttCf5Q56uuEAYlnXfiNFndkkizP6hG+SrLaN1835FTyFR9AT5BFp9Jjl7mfM/TPmS2+y
X-Received: by 10.129.137.69 with SMTP id z66mr1692119ywf.495.1511633144879;
        Sat, 25 Nov 2017 10:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511633144; cv=none;
        d=google.com; s=arc-20160816;
        b=i4pTeXFXy00tiQ2R1y6az61+mYSh2O6GSz1Cf1hNNLICgA8mVsVIpWXfv6cG9kSoqp
         tfbMMVqtwAliTLBHYRceHPWEq/8cRtExXrWaDKVsRIK1rdLJe4Kp23Fniq3JNtEB0i6h
         /6R5ch1p3hH4Z3zcZ5jiB3yKsT2cF5GtE0jP1xWbp7WwufEAc9YOsjOFJJwwdj7ujQcc
         Y1jzYWi0L4I4xo6TDaFNLBL6XC+NQ7hV5H2xxDfY6BePrKpIhV6TSLxZWC93WYuXS0U9
         Wvp2O2AGYphHdfZylePLhjMEZhN0iQgySju+vYcN0vg/g+jN4cI4yMzX8IFf0AvVJHU5
         95oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PvYn+TpY0OE1YUiJhBSBMcVUATAvK7WhbAa3y1tPEb4=;
        b=y723FG9UbD8LsRYCtHbma/lauOCojePZan4lfqVF4Lgf+8SulDfhmkzZWbN90KKred
         JDGObwbaanq6+zEslwA6mI0P6nZnfi63Agm+QW+HKpa5D+Wp75kuI12v2B4CohSg3yIG
         3X/OVjbT7nf6IA85nqw013mA1U9yXT7kSE8Df2YoT4cUd4dlguLTulkyIQchXX4dLb0f
         5HAQqWHQrW9b+BLFALjGmuN2a8iUVQzVCQPAOJhFdc7gZM+eNIV40t2H0EXv89+5xoj3
         xbmsiFIxGC/vdlRlAGNaW3SZtJ718Vt89lG3LzQiNBD8c9YaOfqeYryoMg9hg/sVnDVJ
         J+hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SByNKww8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si5045365ybc.422.2017.11.25.10.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Nov 2017 10:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SByNKww8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIepk-0008Uc-DX
	for alex.bennee@linaro.org; Sat, 25 Nov 2017 13:05:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIep2-00088L-PV
	for qemu-arm@nongnu.org; Sat, 25 Nov 2017 13:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIep1-0008Ne-Iq
	for qemu-arm@nongnu.org; Sat, 25 Nov 2017 13:05:00 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:39239)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIep1-0008NL-DK
	for qemu-arm@nongnu.org; Sat, 25 Nov 2017 13:04:59 -0500
Received: by mail-oi0-x235.google.com with SMTP id r190so16902508oie.6
	for <qemu-arm@nongnu.org>; Sat, 25 Nov 2017 10:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PvYn+TpY0OE1YUiJhBSBMcVUATAvK7WhbAa3y1tPEb4=;
	b=SByNKww8fRosu81Byje9DqF4fq7cJznWtH43VlSN6oKmI3TGWrro6t5gK3/pbV4yhW
	eETHJdMfHtbf6jDscbxXG9DwtQkk4yMJP0LKqIK2YVwcLf1u4NTe1/s4BYppTNADgH7t
	rgpguJNJvKiFVFOy/cZOoczfWGQD6Uh91eIRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PvYn+TpY0OE1YUiJhBSBMcVUATAvK7WhbAa3y1tPEb4=;
	b=JO/V0yL2i6F6QJ3Rze8BhzBspEXhXdhgfDzyC3HHs7PjfUTtX4oxRbsXId0QnVy1kJ
	KZDPlj/3CUxxQMLtBnrz6n+uldehMkGVO+L4I7gFpc4ZbcvevllxpCV46joMEgWBtHUP
	V44j5bMEtayV2X1WbtnvHBZU1A5uuhBn9fTT1WjuQALnJDE4e5Yw15IRloVflClrQf2C
	5qM7zxenfZ5czlRyZP3W0c5lTqZsWjSXPc9K34YKGviUknJfhPzS0cloPJnxuuBnNwmS
	RUF0btupJ1e3a8smwfnwP6vaywNE3CIyqexVbs79VSQtGitu4gTnzSuV5Uz+y34y2CY3
	tnOA==
X-Gm-Message-State: AJaThX6DgYtXYdcHjo4CYcBxOIC/uHRfdCEjIiAZ+aW0jUZ2rGj6SzJx
	eIJS6mpv4m/BJr88ucYFNf3i1qEMBaYS+VnRupC3PA==
X-Received: by 10.202.180.132 with SMTP id d126mr9092650oif.299.1511633098308; 
	Sat, 25 Nov 2017 10:04:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Sat, 25 Nov 2017 10:04:37 -0800 (PST)
In-Reply-To: <CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Nov 2017 18:04:37 +0000
Message-ID: <CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
To: bzt bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPU60LUmomnc

On 25 November 2017 at 16:43, bzt bzt <bztemail@gmail.com> wrote:
> Dear Andrew,
>
> A month passed, and the maintainers didn't gave a damn about raspi3 support
> in qemu. Any ideas?

Sorry this patch fell through the cracks, but it looked to me
to be in the state "patch got code review comments, waiting for
submitter to resend a new version" (from about the point Konrad
said "split this up, it's too big", which I agree with.)
QEMU gets a lot of patches every day, so our code process relies
on the submitter to prod things if what they're interested in
seems to have been accidentally ignored:
https://wiki.qemu.org/Contribute/SubmitAPatch#If_your_patch_seems_to_have_been_ignored

FWIW, as far as I'm concerned Andrew pretty much is the maintainer
as far as the raspi boards are concerned, so as far as those
bits of code goes I'm happy to take his opinion on it.

PS: if you send a new patch, send it as a new top level
thread -- if you send it as a reply/followup to the
first patch it's liable to not be noticed.

thanks
-- PMM
