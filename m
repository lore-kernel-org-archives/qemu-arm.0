Received: by 10.223.150.237 with SMTP id u100csp4701364wrb;
        Wed, 15 Nov 2017 03:58:22 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYCLxwQScjfKJ/slBwuk4Ha+vwVmDEGDI7GrdKSLuzP4t7BEbWqjhJ5Xh1hyRd62Dc0ZNVe
X-Received: by 10.37.11.19 with SMTP id 19mr2271854ybl.83.1510747102135;
        Wed, 15 Nov 2017 03:58:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510747102; cv=none;
        d=google.com; s=arc-20160816;
        b=VR2seSEzHsF8G49I37H6w3tggaUj9UmyqIst8SAB2V90N4hVdMgy65v8WXOcTaf4Su
         btv4jdMXpp1KMuKMerbwjGA8ZlmvLf2tDJcyOBUZg98/h610V8IAHehq7syKZjueV+zO
         oFwip/xzHduIHh/Gyg99PYOiG3REti3pk82/cQUEMjQcM+HN+6Xn/+7aBYp0IJ01XsjR
         EknFb29JysVAtUK88nr4usNP+jTWRxO815FQwSWZ5Kwyzfd+DsAtIRTHCm8pq7fjfKxR
         7uQ+p709Mdxav7DJmd2/6Nw7y8EOYO6LTsFvZdUypJMCxhVOAdoKLragmzUA5I4XX5eq
         86+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lOkNufgw1hkkYpZo8ZFujowUzZbVd9Mkn+QmClr/OQM=;
        b=nzbj1yScZ6QHwrJzwEYngfDQ7ZH1dLNbQIecJDn5bQSBiWggn7AVAjMr3EH7GfDJ8B
         J4oQLkQZUKTaSCATflJjdJw8OU04YPPRlmR9J61sBkiaLKW9x8lO3aRaILtAXHv0tnKG
         VuGdo7AhERx4iLDwgXF8FN7PsmKtGIo1DaWUzFFuC21NnTiEvUbQxrL5qp/P/bOb5xRJ
         uTo/58Cni6Ag+eMSqu1ZmsplrwjZcMI6VXEHt1xziRJyGJeSi4mKiFA9Pb1kyXey34qm
         YwZ/2Y+BQGAdGzqQAD3ZvJ9sH9PlNQgTHiNjPee+eqnNVLGMvyo6yy1DlE5IccXR2k5z
         lVeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRGib3St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si1818186ybj.110.2017.11.15.03.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Nov 2017 03:58:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRGib3St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEwKj-0006Sw-JO
	for alex.bennee@linaro.org; Wed, 15 Nov 2017 06:58:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEwKU-0006Os-N7
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 06:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEwKQ-0004EH-N2
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 06:58:06 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:51558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eEwKQ-0004DK-GK
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 06:58:02 -0500
Received: by mail-wr0-x243.google.com with SMTP id z14so1459103wrb.8
	for <qemu-arm@nongnu.org>; Wed, 15 Nov 2017 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lOkNufgw1hkkYpZo8ZFujowUzZbVd9Mkn+QmClr/OQM=;
	b=XRGib3StyNlmNv9njcuXNjDGbytL7qJLNfe0rlgMTkyY19k2nZIasKTsUKoBAgwQ/E
	WgoRQ+EOLvw4YpAVfkxiBK5xHnFZBVS8LGlo0Zav/RY5RbqKpMi4nlVpvE796Mqj4fhr
	ylET41eNjqmswhSuCDmxCBGD7t9Dh/QqZWcwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lOkNufgw1hkkYpZo8ZFujowUzZbVd9Mkn+QmClr/OQM=;
	b=pzhm+AW+BxbhwEBeoUY6N7ZmyXlj8vblzOA3csqDx/8l39AFBv6Pud9mTSNcJVxE3T
	A7cQLCNlXda8lh4NbdxsjtU118nbIJt9ZDaTWnb3LZ+KOuZjPSQ2a/ZqYjmxcy5g1X16
	2PURWWqut5vt8DUoCt/XDhIwbj+vhFRPzscxnN4orQdcHNwmNCKYZr0m31jexF/frw2q
	4dEY7HM1gk4u29FcOLuoCojL0SEOY4rUflHQUgf6EaUw81rHLT/A7XTsroS+RppuuiMP
	AiVxtjiIGrBI8eItsRJyaM+xDEWdQb9s96Ig3hlW9pgojkcxo9WcTJASMQXKEd+QU22U
	JdSQ==
X-Gm-Message-State: AJaThX5pb6TYMCpKvAD0ysnxW5XyQzyDW/DW4UK0wBqqoIxOYngfFVne
	YydvoFHWk5QWt73xTB8GsHGQpZhwIpsGJL/i/Y3qxw==
X-Received: by 10.223.169.80 with SMTP id u74mr12117470wrc.178.1510747081412; 
	Wed, 15 Nov 2017 03:58:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Wed, 15 Nov 2017 03:57:40 -0800 (PST)
In-Reply-To: <CAKmqyKORH2jwGP4ULZv6B8=262OhznHkwOzONd9HFQoJkKzD=A@mail.gmail.com>
References: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKORH2jwGP4ULZv6B8=262OhznHkwOzONd9HFQoJkKzD=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Nov 2017 11:57:40 +0000
Message-ID: <CAFEAcA-z_gfMr+=8c1kexo6iL--uxNVMzOnN0aox0FGAv3pHjQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.11] target/arm: Report
 GICv3 sysregs present in ID registers if needed
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHNf1dYka6Gm

On 15 November 2017 at 01:14, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Nov 7, 2017 at 7:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
>> have a field for reporting presence of GICv3 system registers.
>> We need to report this field correctly in order for Xen to
>> work as a guest inside QEMU emulation. We mustn't incorrectly
>> claim the sysregs exist when they don't, though, or Linux will
>> crash.
>>
>> Unfortunately the way we've designed the GICv3 emulation in QEMU
>> puts the system registers as part of the GICv3 device, which
>> may be created after the CPU proper has been realized. This
>> means that we don't know at the point when we define the ID
>> registers what the correct value is. Handle this by switching
>> them to calling a function at runtime to read the value, where
>> we can fill in the GIC field appropriately.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Is this going to make it into 2.11?

Yes, it's supposed to go into 2.11 -- I think I just forgot
to put it in the rc1 pullreq, but it'll go in rc2.

thanks
-- PMM
