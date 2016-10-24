Received: by 10.80.166.35 with SMTP id d32csp2708007edc;
        Mon, 24 Oct 2016 08:38:02 -0700 (PDT)
X-Received: by 10.31.217.196 with SMTP id q187mr5457941vkg.84.1477323482489;
        Mon, 24 Oct 2016 08:38:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si5377841vke.134.2016.10.24.08.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 08:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byhK5-0004Pe-8Q
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 11:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byge4-0001Ye-Gk
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byge3-0001QN-9G
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:54:36 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:34849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byge3-0001Ps-2E
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:54:35 -0400
Received: by mail-ua0-x232.google.com with SMTP id 90so15749292uan.2
	for <qemu-devel@nongnu.org>; Mon, 24 Oct 2016 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0gcrQNKpQrEL/duOJ/LkyiozpHxHvUJsJ5WNqPyQE2g=;
	b=cNl0HnAun/UcOcyby6dpXFLV/sKs2MUyXV7tSitN3gr/SVZWz9eM8VSzD9pzS+kpqL
	Ht/FWsyo4ZFpVcRMwZPuKkBiHA858VtfP91C8315agMRn+0HpNBl4mKB7168ls1AlXPq
	xmkvYMsC5S31n9NdEBlhFopjaO151oAcMel/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0gcrQNKpQrEL/duOJ/LkyiozpHxHvUJsJ5WNqPyQE2g=;
	b=F6BuLFhbJxRWaU3abb1khic+pQnzGRzExq08D2EMsTz0Mr6YJmHQJ5/K28Ik9qphJe
	nK4RoSSsd8ZxXKeG9RB/su2mNMeP3Yt51hSqBXr3HVQeBLBts4rx8rl3ROpfA05R3joj
	K1nEPOid1869toVvHHCzstQoU9RQux+zLKsIbYZEzK+/GtqQ/kl0G99d1m0x5cPi3r1k
	H3wvQopRFWXCgHwn2WNtu9Vt4x7ZleiwT40mWQQmbSeZTRPSKrv82UrynWA/PaHLzCXV
	K8IRKruOudp525kAyBJ9log0v2F7toBSQDmdetZZuhTUs5G1ttQtwICCyY2JlRw2KHow
	Lvug==
X-Gm-Message-State: ABUngveoUaCA9lJT4H7N/a9pGDuGDqDrWeOKOVhmGkhyD0HTvUAbGYtG1zsVA+eSxip3v0D/kTYZydPMrBBwTv+J
X-Received: by 10.31.165.74 with SMTP id o71mr9549581vke.95.1477320873617;
	Mon, 24 Oct 2016 07:54:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 07:54:13 -0700 (PDT)
In-Reply-To: <20161023091816.3839-1-zxq_yx_007@163.com>
References: <20161023091816.3839-1-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 15:54:13 +0100
Message-ID: <CAFEAcA-HoG4SscJVQXXve7k-yP-H-zDbZk9VWDVm2YJ+TcLEmA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-devel] [PATCH 0/4] QOM'ify work for arm
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwR+kG+FHzI5

On 23 October 2016 at 10:18, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Here is my QOM'ify work relate with arm.
> See each commit for details.
>
> xiaoqiang zhao (4):
>   hw/arm: QOM'ify musicpal.c
>   hw/arm: QOM'ify pxa2xx_gpio.c
>   hw/arm: QOM'ify strongarm.c
>   hw/display: QOM'ify pl110.c



Applied to target-arm.next, thanks.

-- PMM
