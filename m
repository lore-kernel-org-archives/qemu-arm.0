Received: by 10.25.21.156 with SMTP id 28csp904575lfv;
        Thu, 28 Jul 2016 09:49:20 -0700 (PDT)
X-Received: by 10.37.223.19 with SMTP id w19mr22160340ybg.167.1469724560751;
        Thu, 28 Jul 2016 09:49:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si8538640qkc.285.2016.07.28.09.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoUq-0001cE-8Y
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoUn-0001bx-94
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoUl-0007f4-EB
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:49:16 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bSoUl-0007d9-A0; Thu, 28 Jul 2016 12:49:15 -0400
Received: by mail-oi0-x241.google.com with SMTP id w143so5049867oiw.2;
	Thu, 28 Jul 2016 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=kAmVBhGg1JqDaO9fbHaIPBWQveJ/jm9AEUxQQDFhd5Y=;
	b=gqUsPf8Qocrq4uNA5TX61QAdNHy7qF0ufK/qx8h/ZWp10OCJibMroTjJIOAGyie6LF
	J/RFcf9nsK0tEMuDjPB05Lu5jMUkOajAXGOkiu2t2Ot17xg9HHnhYW6QF3Y825NT0tVt
	OJOX1YuWMHmDhjIzSQSFjBCAIqvqeGQleKcxjAVki0PS+rMUH7xS+2tZS0y3USql6AW4
	lEsUYC09IQEoITjebzxEWePAthmcTYGRe2TJycm4IL8jdJR8jrdMH2Xpcnan1PXs1zev
	+nu6aCQsPn2ZbQk3Xjt8Bv1xoKk8DhPOZzZ870xzCFiCK6qOmFrVULKSXuIu+mFuic4J
	Tfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=kAmVBhGg1JqDaO9fbHaIPBWQveJ/jm9AEUxQQDFhd5Y=;
	b=H1Y2cQV3e8Vhzeaqip4ARxEi8gc7G6PLxQYzpt3KLs6woqTinNW6uxHTPMhrajFY7G
	cFszLlwwwUUBaz9xvc4Lu+krT823fPckTPLIXLOGW5n+oQ+uefCKop8XoS3zqnoTkm//
	/FOO/39WjTp3Lm11jQwcWpmvXkyD0Rix83AQTxDIKvk+0MCqlrfY3dAdh9CbPQ+ZXmZV
	/2FCa4KBfd3P6NDcT4m3hNFYxwn2qYlpdaCMa06gQqW7YhSdMXp9tFgDNSniYbUwJnzM
	FY32YBImoUSqfrSqaSsCOOyCzXeV8Qt+gXXGTTx+rQwTRQZYJ0a7Va41VvEcZJc4RH51
	We9Q==
X-Gm-Message-State: AEkoousywgJdlL5+gnL12z2wHQy+SbFUSsGkOuctevajApdgYcItAsADo2bU7bJd4MI7bj9TwmkdmkIQcKCjaA==
X-Received: by 10.202.221.131 with SMTP id u125mr19440000oig.161.1469724553354;
	Thu, 28 Jul 2016 09:49:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Thu, 28 Jul 2016 09:48:43 -0700 (PDT)
In-Reply-To: <CAFEAcA_RcBW2m7xWVB0j4CBY4HDtJTz6o9k32X9bpyXAfDinKw@mail.gmail.com>
References: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
	<CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
	<CAFEAcA-2JYdTaBbxUB+D=6OyVHOQE=QC6CGO=vJFc5BC4CLEYQ@mail.gmail.com>
	<CAKmqyKPv11rO-za=VJqS4scg0-vUFUKkSKbo6Wbmt3PiEJfN3g@mail.gmail.com>
	<CAFEAcA_RcBW2m7xWVB0j4CBY4HDtJTz6o9k32X9bpyXAfDinKw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 28 Jul 2016 09:48:43 -0700
X-Google-Sender-Auth: 9HOiDqVeBsSF4vOdCKYhOlOwPJs
Message-ID: <CAKmqyKM2Gpv6KAos0BB3iyfp0_YhvSj_m27sqcd=j8Lm234xbA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/6] cadence_gem: Add queue
 support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kf4dDHXkWeRW

On Thu, Jul 28, 2016 at 9:43 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 July 2016 at 17:41, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Also, I have a MAINTAINERS patch on the list, that should be fine for 2.7.
>
> Could you give me a URL for that, please?

I can't find it... I'll send it again.

Thanks,

Alistair

>
> thanks
> -- PMM
>
