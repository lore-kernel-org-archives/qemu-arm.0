Received: by 10.25.205.13 with SMTP id d13csp713433lfg;
        Fri, 16 Dec 2016 06:20:18 -0800 (PST)
X-Received: by 10.55.4.134 with SMTP id 128mr2862793qke.281.1481898018734;
        Fri, 16 Dec 2016 06:20:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7si3258370qtf.245.2016.12.16.06.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 06:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHtMt-00009U-Vw
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 09:20:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHtLw-0004v5-Sq
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:19:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHtLv-0005mR-Io
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:19:16 -0500
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:33217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHtLv-0005m6-EJ
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:19:15 -0500
Received: by mail-ua0-x22f.google.com with SMTP id b35so11532745uaa.0
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pW+5rgGxIZiF0WTfTJEtrOv5TlczImbVTOXtzQmi1QI=;
	b=Cev5+/U8Hs58droJdZ0RFsd+gBq6BA5O1vhKGChmBLyKnOwRH52EsolOV8ONdc/eHC
	CJubPNUhnlhhyfUO9S/T1o0Q35ReUL9q2bdYd46an4kaQtc8ltY7O0pAYR/7lYPtG8JB
	kdp4NbbCPPI3DnEjNqYGLOq8feGVoX2tiO5wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pW+5rgGxIZiF0WTfTJEtrOv5TlczImbVTOXtzQmi1QI=;
	b=peGHVrrzekMrPGRPDYEC0CiTf7NU4s/LHtEuUdQ5iBRL2/11HOcYLzZR0hX8WmSGE3
	1GtJZj5/Tts4QhRNfSgAL9pqGNG1F6RjQxE09WXKqAtU9Z88c2W1mTJfnY5I3nbtLgy8
	yzOJk2b/vVT80cZOQYK3w5sMi1+I+z71yHCwx36kzXY2Z6cNGoXBA8pI7I8YsjtFjz2Z
	UGbiuO5cKR3BklgAe6QM/PNevAZQE0Lg4IeU6OUPalyI7wo3gzKwsplEhZNJ2FHmj0hu
	9BcO8gOUr6MXGjpwsMrkhWKU9gjdVf8KMGyjW1or0F08Ior0Au9mnGA4IIJq1kJ/+aSx
	7dxg==
X-Gm-Message-State: AKaTC00sZcoQRWbnOfTY5oSHzwYSdV7rIQA0obPu1INKs80lia+jU/tHYFb3Egb2lazW5dr+gAOTqBD+c+hNoSrC
X-Received: by 10.176.3.137 with SMTP id 9mr2275299uau.120.1481897954853; Fri,
	16 Dec 2016 06:19:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 06:18:54 -0800 (PST)
In-Reply-To: <1481894559-13974-2-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894559-13974-2-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 14:18:54 +0000
Message-ID: <CAFEAcA-ODRCg1t=6iFBE5oue8X5GSHDXYWV2uy6sFttE8_tG6Q@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [RFC 1/3] nvic: Add CPU numebr property
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
Cc: rfsw-patches@mlist.nokia.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qdmslr3xN86q

On 16 December 2016 at 13:22,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> In case of MultiCPU SoC M3 is not always CPU0.
> This commit add cpu_id property to allow set CPU
> number for NVIC model. Also address space that this used
> by NVIC is updated to mach CPU's one.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>

The right fix for this I think is probably for the NVIC to
have an actual pointer to its CPU object, which the armv7m_init
code sets up (perhaps with QOM links?) when it creates the CPU
and the NVIC. The two really do need to be closely coupled,
and the CPU already has a pointer to its NVIC. There's
no need for the NVIC to get the CPU pointer by looking it up
by CPU ID.

Once I've got the GICv3 virtualization out of the way, the
next thing on my todo list is to pick up the NVIC refactoring
that Michael Davidsaver posted last year:
 https://lists.nongnu.org/archive/html/qemu-devel/2015-12/msg00504.html
which makes some moves in that direction (though it doesn't
init the NVIC's CPU pointer with a link, it just assumes
first_cpu).

thanks
-- PMM
