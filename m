Received: by 10.223.159.74 with SMTP id f10csp3868658wrg;
        Tue, 12 Dec 2017 06:14:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBotQBShXagkI6qETAbdA/2dWlReg3oCmJJMdkvfHefSP0+BBcNSzuPGEJY8JaNKc/bF9uCgJ
X-Received: by 10.129.105.196 with SMTP id e187mr2811130ywc.217.1513088053114;
        Tue, 12 Dec 2017 06:14:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088053; cv=none;
        d=google.com; s=arc-20160816;
        b=BB4RvHk59zEyD48xwzIFBez/t+pP38GeIGNI1y4x540NQmCE3J6Y5IxX0MuQxkfHuK
         OMLE8MzQve9/Fg04u/rcSaz5XwM7cj+LMhmKwxTTCK/KrQDjWOEXa4O7vCHhald4/Pbo
         K+4Nyi6eGqUcIUHxspM2UYMK5ExuU5p0KLftzCy3099wWo7hbrhdOlR9oyLcJPPPCR3N
         zeIVaaHLQ66dXzjKwgSkDYJ1seI1ZqGaWpRf+XJ8/ko1ozJ+00IrBqbiVvGrosxKQLkp
         J8n9/uPJlRDC/Yb/4Wxx7yn04UaWLCcXy3lA36mSjF1PBIXhYD7KYESDcoru4snDtxMQ
         HZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8gKVfMf02VhOaHW2S3Oyn1UgAyJiNiGDsrU50Ndf1kI=;
        b=IAO5Jc5jVgKCN+xjsrKzWIDIE5BuTzmtyXTsdhr5rOogAvXc07A3J18IvHkgs8s8ya
         i3B6bwmIucvCHABkmP6IZYf45oKzF3omwopR/dxMKvEJaZW7VCd9GIG8aUXYfak/tGl+
         Bf5M7odh1VKDdpQvPMDRR8lfROLbF1d16UAMQ9uggKoo8hlyWmIuwg1VxYTCqng+H59H
         +ydh2h61r2POFiuW/0qWISQEgS3HT/IsklzbbkrOfu2HC0uBOW+xBJDDlKPSK2HRsvSB
         F9rhDGaQ6neMMC7Wl5/CRUxAZn6QY6YcGlAxjFsoX/sHl2HVJKzJ6mZH6/Y5ia+uE0hI
         xCRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKxRvh9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si3117607ybn.130.2017.12.12.06.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:14:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKxRvh9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlK0-0006hk-FF
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:14:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlGv-0002iv-Ow
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:11:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlGq-0001J4-4L
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:11:01 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36539)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOlGp-0001Ha-Tj
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:10:56 -0500
Received: by mail-oi0-x244.google.com with SMTP id j17so14077167oih.3
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8gKVfMf02VhOaHW2S3Oyn1UgAyJiNiGDsrU50Ndf1kI=;
	b=kKxRvh9xoZLMYOtPyq73ShzqYv7kbsnEX76XY+lfUWryUgZqw9DyhIiunLCDN5kf9S
	b1bd/O2ehGDltJMwNb+hV8pGQWu15EiHTXbgx5ci/xCvLAdc2TqeKZimqBCDal02q01u
	D4qxI2f+jVEjqcqE+KZnTA8FVn9BslcXZQ9r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8gKVfMf02VhOaHW2S3Oyn1UgAyJiNiGDsrU50Ndf1kI=;
	b=W3PyEwDFpYI+OdEwSvxCQRLojk3S+fPAldbkT0eDlyiBoR9OjRKQ2ijmPgAHEdQuLt
	STxmS7CLGDjM6YMmY9ExWcx9Q2Me+4pGyNwTcbbqX9LsWAA3aCyQrgv5n9L7Ymr9GGlG
	UaUbBZpiOhSw9wly5HJw/xLY1zYPXxnjemKvBLBiZ1tRnmtil08W1lQv3lGUMsjKoEW7
	CfrUQYs/ypwiPjlulV1Kq5owDcnM+YBBnqmF14G7fZK+LbQPsrcXMoX3EoklQjhnUOEJ
	qe9Qec99x0v2Fuy8HU1YeMcemY+heioqOkTpwj49UZr+s/Jpp7y1cXIpUnWnnzsCLxoy
	EFsA==
X-Gm-Message-State: AKGB3mLk40ph6TpHpOyk+AoUFEMelBQ48S666EKRD6GSRDA1+hFQ490o
	JkNIaMm7/CXYvuIqhOf3/QBI27QmwPc1CLmTnYOEog==
X-Received: by 10.202.114.22 with SMTP id p22mr3159347oic.327.1513087855156;
	Tue, 12 Dec 2017 06:10:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 06:10:34 -0800 (PST)
In-Reply-To: <CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 14:10:34 +0000
Message-ID: <CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r2LUT0Ixc9jE

On 12 December 2017 at 13:56, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> Given that the DEBUG output is only produced on DEBUG builds, couldn't
> we simply stipulate that DEBUG output appears on the PL011 with the
> lowest physical address? That keeps the current status quo, and is
> probably sufficient for 99% of the use cases of people using the DEBUG
> builds.
>
> Then, we can introduce some code to decode stdout-path in FdtClientDxe
> (a higher level DT parsing driver) so that the actual serial console
> gets installed onto whichever UART is described as the system console.
> Also, given that ArmVirtQemu is tightly coupled to QEMU/mach-virt, we
> could decide to only use node names in stdout-path (as we do
> currently) to simplify the parsing logic.

That doesn't actually usefully separate debug output from the
console, though, because stdout-path is also going to point
to the UART with the lowest physical address...

-- PMM
