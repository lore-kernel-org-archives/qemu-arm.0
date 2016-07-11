Received: by 10.25.21.156 with SMTP id 28csp15367lfv;
        Mon, 11 Jul 2016 12:26:27 -0700 (PDT)
X-Received: by 10.55.68.81 with SMTP id r78mr27604006qka.129.1468265187220;
        Mon, 11 Jul 2016 12:26:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v185si1209187qkc.105.2016.07.11.12.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 12:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMgqY-0005yb-Nr
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 15:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMgqT-0005yD-57
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 15:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMgqR-00086O-62
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 15:26:20 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMgqQ-00086E-R8
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 15:26:19 -0400
Received: by mail-vk0-x22f.google.com with SMTP id v6so152824198vkb.2
	for <qemu-arm@nongnu.org>; Mon, 11 Jul 2016 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C2b3E9hwr1mDku+NMIZYyrUJrUaRT+8iAsvKQBX+m3w=;
	b=jdRyD7Vd6tOCwd2Cqr6tsMu8lMcWhkFNmsOH1vXRnx+HTRmR89u0Zndv90MyPuje0H
	14wOXvqqwZt1aqvF39eY2qbk+z1h/WLu/occ7RqQ/moec5kmLoYhPbNDucp7AWeyhn3U
	TgrXNelUewAEHmz/zA1W6RSZQNObmcQszSNWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C2b3E9hwr1mDku+NMIZYyrUJrUaRT+8iAsvKQBX+m3w=;
	b=KTIG7kelGTGUAa5JJcqAjP0iqpV86Z8GEJdgxwoPh4zgccYNlHzyk47VY3JV/qxp7u
	cREjY06anOT3kNX2vSgO3PFgW2dZEyTLSpiflfagP8ERtPdJwKsV/ErpsXEDl9hKgVNb
	pRsCsrb12r/uaz/W0vNjaRzrg3KctzcSMvaHqey5PNyVLyJIngXsraNrqdCzUcPsuLRI
	w3C11j+Lz823DVBB4tv5LAeJeIPbr23yqF52/083kV0+6yN4uYR8simRLIXReP8dcJMf
	FivzM/gOy8CoWIrspQJr3C7AfIvpq+q+uv39jS1LiNiZ3jgbrkYnbMaluaMIVAlnZ3az
	VNbA==
X-Gm-Message-State: ALyK8tKqKJeyBxmhZeuKzcqOmKeeKJrnWBlfgjnC3unQjztsTDHMvDdVBXkucBambmFw5V4ene5q3yBqEsh3JIba
X-Received: by 10.176.5.138 with SMTP id e10mr8342423uae.38.1468265177996;
	Mon, 11 Jul 2016 12:26:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Mon, 11 Jul 2016 12:25:58 -0700 (PDT)
In-Reply-To: <485821468262867@web26j.yandex.ru>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
	<458161468261386@web2h.yandex.ru>
	<CAFEAcA_Lq-8s7wx4bu+t6MJxXau5aoo6B2QJPGXJ=VWtztHNjw@mail.gmail.com>
	<485821468262867@web26j.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2016 20:25:58 +0100
Message-ID: <CAFEAcA-N5wF49QOgC1fwuQ+cNwD_RHgq-sTQ1Lucjeq-jVZz0w@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hj9+UsGTUQ7p

On 11 July 2016 at 19:47, Sergey Sorokin <afarallax@yandex.ru> wrote:
[re TLBIALLNSNH and TLBIALLNSNHIS]

> Table G4-25 Effect of the TLB maintenance instructions says:
> b. Available only in an implementation that includes EL2.
>
> So seems they should be in el2_cp_reginfo which is exist regardless EL3 enabled.
> And also I need to fix tlbiall_nsnh_[is_]write functions accordingly.

Ah, yes. I was looking at the register description, which doesn't
mention that it's an EL2-only operation. el2_cp_reginfo is the right
place, then.

thanks
-- PMM
