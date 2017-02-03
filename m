Received: by 10.25.77.65 with SMTP id a62csp598311lfb;
        Fri, 3 Feb 2017 04:50:06 -0800 (PST)
X-Received: by 10.55.124.7 with SMTP id x7mr13177181qkc.149.1486126206665;
        Fri, 03 Feb 2017 04:50:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f53si19140677qtc.286.2017.02.03.04.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 04:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdJW-0005y0-4Z
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 07:50:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdIt-0005bG-Lc
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 07:49:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdIt-0007C9-19
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 07:49:27 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdIs-0007B4-R8
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 07:49:26 -0500
Received: by mail-wm0-x22c.google.com with SMTP id r141so26154325wmg.1
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 04:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2qaUoeSM30kynxbOrfLfC9Jr33bGcn1f+kR/SPSOfeA=;
	b=cCNPueVV5DCHgED6DojFMWpQusMqh3MauU00qj8SP5Ab9d+fX0OnwwDY5KA8/1+iE2
	929ZZfH6MN8SPoLjQh/gHmSmEJF7kYRmcVDHfpb35bFJ9+nWykw+87nC2OuCot9Q8JG3
	yuZTUrh0SYbHs2Qo1hUTJW9qDpuNQDneN4Tq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2qaUoeSM30kynxbOrfLfC9Jr33bGcn1f+kR/SPSOfeA=;
	b=tZQnG5avqTL+6WR8xJhFbITps1BjlyyykToSoXPwHzcwou1InZ4K3t6KUEMlMBk01r
	bkFuBEPW2d8mWRuwfs3w9jgNuf8yOa5J8gFNz58VyOF2d2iqiN4pLN1BM9g8ZvUhGhHD
	BbA/0jRTQ/BRCoXX+rebmhHZhfx03ilyNb45a/nqm9lo0bwr3ia8Kh1LqEtHoPXdaeqE
	xOhKYSHnh0CgZqRqlTPqYKW4ABJXu6qrxlz5VkhkurYoyFkGn+1H+7tcCGfkN8oxNwtO
	VtCiooUf3qamPiMXI4ExOn5h4kWrZNVERuQ4q8YxUCwtk1arTe/pShwqrBKFjEhjFlXA
	PcyQ==
X-Gm-Message-State: AIkVDXKKD+YGnt+fdw59V6S2srB5ycRuXxnK/mvIat2Il7/No4Fg7LnLKtdUdzyfQb/qEaFAYb4rd25b3bl5DmaU
X-Received: by 10.223.152.175 with SMTP id w44mr14219974wrb.151.1486126165467; 
	Fri, 03 Feb 2017 04:49:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 04:49:05 -0800 (PST)
In-Reply-To: <1485452251-1593-1-git-send-email-clg@kaod.org>
References: <1485452251-1593-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 12:49:05 +0000
Message-ID: <CAFEAcA_41U=7UnFdeh-drFJXYFGc3VScPKzwE9qm2O91fKep_w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Aspeed watchdog controller model
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NoMuNihMxEXL

On 26 January 2017 at 17:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The Aspeed SoC includes a set of watchdog timers using 32-bit
> decrement counters. This patchset provides a model for this controller
> and adds the first watchdog to the Aspeed SoC model. A second watchdog
> exists and is used on real HW to boot from a second flash module
> containing a golden image of the firmware. This is not supported yet
> in qemu.
>
> The main benefit today of this model is to enables reboot/reset of a
> guest from U-Boot and Linux.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (2):
>   wdt: Add Aspeed watchdog device model
>   aspeed: add a watchdog controller



Applied to target-arm.next, thanks.

-- PMM
