Received: by 10.25.0.144 with SMTP id 138csp770991lfa;
        Mon, 10 Apr 2017 01:58:23 -0700 (PDT)
X-Received: by 10.55.9.129 with SMTP id 123mr34711999qkj.183.1491814702865;
        Mon, 10 Apr 2017 01:58:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c36si8708513qtb.237.2017.04.10.01.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 01:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxV9Q-0006eH-6d
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 04:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxV9J-0006dO-CQ
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxV9I-00011J-MO
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:58:13 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:35553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxV9I-00010z-FV
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:58:12 -0400
Received: by mail-wr0-x229.google.com with SMTP id o21so115611007wrb.2
	for <qemu-arm@nongnu.org>; Mon, 10 Apr 2017 01:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tWoFqnnObbqXh/jbI08IjIX5OMfV0XvSW2yQduASfEg=;
	b=OxbH7dho2OfgR7VzdZnyV4iLaYi4cNp06+sMqta9BLl82ecQ3nTxB9vvYnEuvDEDgS
	ECAltFsP3hBgPIpRXi/AFV0zDiqdrYx6nPHSl353hAbjXjLO0Io2eUKd0n4lYzR/nty4
	124PKHALM+u1qTj6kxUIJzd9q5ZBAPTJS2/cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tWoFqnnObbqXh/jbI08IjIX5OMfV0XvSW2yQduASfEg=;
	b=tZ2Dx2Z4Fjqne97mJvPfZPfsE/F9sb74vxoOG3IeMoG6cn6PGE+MWoG4JKzhwidDhv
	53XnoymthPHK0WgNJShGiw3RadAvhP2yeNXonGapKpHhm8MEjDKxjsv1iPIV71kqdAvx
	A8iAdcUiaAjcXpyp41J0uUM/OWuzI+rd/7YhKs6G1EjLzU3tmh2xEoQMrROO98jmI/01
	OiKVvBXfLwLx5c7loQNbo3LI2edwGIxU0+2ko9EdtAaCj37TmW/gZyU8mwhbzqoMaiBp
	MnUvxKt4sH/uRN7IV3YoSinWwYa7lMMPmZG2KWq0MPhjrcFv4fQ9BU6uCvCu78Rl2rmk
	NZsg==
X-Gm-Message-State: AN3rC/4pc2wk04xBN9jVvxP5ajiuz96we8nwBzi2LoKIoTAt2AMufCwlvwB+1ghAloA/MZJ4V5valn9ZYPbvsFlu
X-Received: by 10.223.136.246 with SMTP id g51mr8869314wrg.187.1491814691316; 
	Mon, 10 Apr 2017 01:58:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 10 Apr 2017 01:57:50 -0700 (PDT)
In-Reply-To: <20170410084456.GB19103@toto>
References: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
	<20170410084456.GB19103@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2017 09:57:50 +0100
Message-ID: <CAFEAcA-W_OGF7zjzZmPDBT+t2CKziyW-01VJxStfcxjr3Rfnww@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Add assertion about
 FSC format for syndrome registers
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O4sz/iPDzVgq

On 10 April 2017 at 09:44, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> Have you seen something suspicous when running code or was
> this a theoretical issue?

No, I was looking at the code for a different reason and
was surprised that the syndrome-generation code wasn't doing
anything to handle short-format FSRs. I started out thinking
that this was just a corner case we'd forgotten since it
only affects AArch32 guests (and even wrote some code to do
short-to-long status code conversion), but after some thought
I realised that it's not possible to get to a point where
we would need the syndrome after such a fault. It's a
tricky enough point that it seems worth having an assert
and some comments to assure future readers that it isn't
just something we forgot to handle...

thanks
-- PMM
