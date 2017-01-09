Received: by 10.25.205.13 with SMTP id d13csp11558978lfg;
        Mon, 9 Jan 2017 07:58:53 -0800 (PST)
X-Received: by 10.237.41.99 with SMTP id s90mr3404729qtd.4.1483977533378;
        Mon, 09 Jan 2017 07:58:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si46749388qkh.335.2017.01.09.07.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 07:58:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcLS-0003YR-NN
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 10:58:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQcKb-0003Wq-BF
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 10:57:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQcKa-0008Nv-Ah
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 10:57:57 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cQcKa-0008Nk-4Y
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 10:57:56 -0500
Received: by mail-vk0-x22b.google.com with SMTP id 137so343971125vkl.0
	for <qemu-devel@nongnu.org>; Mon, 09 Jan 2017 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wnAYnqTvExpeC44ZUr5bsrUxQYBgLDb6FbrNeRLCKOk=;
	b=ArjI2pvh6kGKxd9/Elk9Tn6s/Wej0rLB4x/dTDU5DL0jEo0XnCr4c4RFdYi6ZNMuUn
	4fQ114YtBeJTdo4L8ZyrAL7zppIEEs8npXwr0pLL5HpTurN6x/3+4dV9wlr+ZBmZ1zAO
	ACGfdSSUmHek5lYnbZhBZPvfyCK0cbBtJPBls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wnAYnqTvExpeC44ZUr5bsrUxQYBgLDb6FbrNeRLCKOk=;
	b=PCgwCd9Puq/W5EEARggbq3ikxaKZEyHdPToQ/uf1P4dDWhehyqqTWleFiX4QKjI0+d
	x4nLjnmpfCnGEqjAEjYzDlGRLD5czFgpv1jBLXgkkJa9rvv9DCsyzQRW/ZfYULN2J+jO
	enlWL+dOO4F01xsOfU235HCtn5EuWg5l/tLfbxPrL53ahlfFOCZlPbxo091jua0gAHrn
	yqc2uRu5EG+8dfJEKkwUiTMUbWiG1N13KdTH15z1U/E1g8K3k29nwgCUaI+ocHp/gHuB
	EwfTHJfbq7z+5LMX8CUGnvb/p6xk1hqK0N3W07RrVUhTMzLQ8RviXxMWRX/cQIUg3wpH
	LQkA==
X-Gm-Message-State: AIkVDXKg12mi5QW2/T5FkVAA28pMGAhQSUFE4FjY4WpXqjFWxPepFU106ps14/Re7w8LCazXQm+K+MJsKomfoQE4
X-Received: by 10.31.7.204 with SMTP id 195mr32834730vkh.175.1483977475480;
	Mon, 09 Jan 2017 07:57:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 9 Jan 2017 07:57:35 -0800 (PST)
In-Reply-To: <CAKmqyKNy=NeOPJs7C+3LgyCGMoy6W9gAhz5M5BgJ7t9YwTLA4g@mail.gmail.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKNy=NeOPJs7C+3LgyCGMoy6W9gAhz5M5BgJ7t9YwTLA4g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2017 15:57:35 +0000
Message-ID: <CAFEAcA9S+tsneJsi1Q+andFK=w_W3=ApXJNXJkbFThfPRL_30Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-devel] [PATCH 00/23] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y8AOvPS/KqqN

On 19 December 2016 at 22:20, Alistair Francis <alistair23@gmail.com> wrote:
> If I manually enable EL2 and EL3 for the Xilinx EP108 board I can
> replicate a full hardware flow from ATF -> u-boot -> Linux.
>
> Unfortunately Linux doesn't get too far as I get the error below. This
> is further then it was getting before though, so I'm still including
> this:
>
> Tested-by: Alistair Francis <alistair.francis@xilinx.com>
>
> [       24547.770] Detected VIPT I-cache on CPU1
> [       24667.370] CPU features: SANITY CHECK: Unexpected variation in
> SYS_CNTFRQ_EL0. Boot CPU: 0x00000005f5e100, CPU1: 0x00000003b9aca0
> [       24769.210] Unsupported CPU feature variation.

I'm not sure what's going on here -- in a full-EL3 setup then
we should be using the ATF PSCI implementation and it's the
firmware's job to ensure that SYS_CNTFRQ_EL0 is the same on
the booted up CPU (by pulling it out of the memory mapped system
timer, usually). On reset the CPUs will all have the same
CNTFRQ_EL0 value so unless EL3 firmware is writing dodgy values
to it they shouldn't end up out of sync. Might also be worth
checking we're not accidentally trying to use QEMU's PSCI
implementation.

I suspect this will be easier for you to investigate than me --
is this related to the system timer implementation you sent
patches for?

thanks
-- PMM
