Received: by 10.25.205.13 with SMTP id d13csp10264403lfg;
        Fri, 6 Jan 2017 04:08:07 -0800 (PST)
X-Received: by 10.55.209.90 with SMTP id s87mr69961570qki.99.1483704486991;
        Fri, 06 Jan 2017 04:08:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d24si33625329qta.144.2017.01.06.04.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 04:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPTJU-0005jX-Ip
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 07:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTJ9-0005XY-7K
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTJ8-0005SE-Ag
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:07:43 -0500
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:35470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPTJ8-0005S4-6m
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:07:42 -0500
Received: by mail-ua0-x233.google.com with SMTP id y9so73971350uae.2
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 04:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sCTJXRctDlW2V27c7lq9bMggBg025yadOCbwphJloig=;
	b=jn5JjDjfkpvNfwmT27KKs5LDg0lDvLBQlERbWEtK+PJ8neJEtGS/v83D07hrdokaql
	Ebhr2gyEgneTOfF4u+EzGtyUiw18AA4s4Egpdo4jP0KC4/PmTFccwg6/CUrXz5hPnMI2
	WdGP+mvJLyF7j4bCHuyYkLiDIXO7W3k650u9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sCTJXRctDlW2V27c7lq9bMggBg025yadOCbwphJloig=;
	b=rqhzY1nN91OrGFLiIhNiAezvuSwZEFE0l2KVea3AgAADXn42MUG6DuUBQ2WDxcPzWd
	Z0kX6tgVPtfnjuS/lz0pszaSXUiFRYJbzurkYz6sx8+jlEphZs9Fy69rZmlpW7FF5QAK
	HlquZXQG46v3bVcZz1b3fWGMwDupmGqSfyLktW/vj1Qnx6MSjQR3dTlm5QPkf0Bps2cv
	guSb127x/mfOgeNEp5UwxvVfLtRAE40o357j2l17LPOMC3ahWFaygzMgTU/5UG62qIa0
	tIwXijrLZUfhknIBuIRCTgDHYqRF6ZVQdY1ZT6mP0sKSzmfCBkj0XEv8b6tErk7jLnLw
	KX2A==
X-Gm-Message-State: AIkVDXJkbAue61CrqL56fYUBsq1PAP+rD9LRZ+JvxZOILmGNFr4mzw4TXcacO2OZ8BZ67KrFflUltZcBfwPmfQQS
X-Received: by 10.176.91.222 with SMTP id z30mr58135675uae.140.1483704461733; 
	Fri, 06 Jan 2017 04:07:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 04:07:21 -0800 (PST)
In-Reply-To: <cover.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 12:07:21 +0000
Message-ID: <CAFEAcA9nCymOQCB1gmmnoVFCsW0vmke5FKHhs7JqF6BQ9xR-tA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Add the generic ARM timer
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXwmFupyS6FX

On 20 December 2016 at 22:41, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> These three patches and and connect the Generic ARM Timer. This includes
> support for dropping insecure writes and includes the ReadBase memory
> map.

Now reviewed. The really sticky bit I suspect is going to be
how we model the required connections between this and the
CPUs so that adjustments to the counter here update the
views the CPUs have of the counter value.

The other mandatory part of the system-level generic timer is
the CNTCTLBase frame (timer control), but I guess we can
leave that for later.

thanks
-- PMM
