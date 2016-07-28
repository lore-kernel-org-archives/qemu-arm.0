Received: by 10.25.21.156 with SMTP id 28csp701327lfv;
        Thu, 28 Jul 2016 02:37:13 -0700 (PDT)
X-Received: by 10.55.39.142 with SMTP id n136mr43577177qkn.149.1469698633232;
        Thu, 28 Jul 2016 02:37:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m184si7382879qkd.202.2016.07.28.02.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 02:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bShke-0006WI-Oz
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 05:37:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShk8-0006Gj-Ap
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShk6-0000Q9-Dw
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:36:39 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:34950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bShk5-0000PS-6P
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 05:36:38 -0400
Received: by mail-ua0-x232.google.com with SMTP id l32so35807646ual.2
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gZSWNW7YM0DAcR+PDO/zIdFdu3BwqjQujGE4WesG+4A=;
	b=REuun5OBkZubLq6JIkNZ7Tet9jHIqFzxV1nD2QheOP60p4YhzkSfliNp+QodgPPb9Y
	aqdgiWMAU+j9/tkkPnsmX+1/VVyYX9S/CcT7rRDVzM7GTFwZQ2JsRSvSm8ZIJV8FP1qS
	h+wcVvV5zT0prYNZoNgw24w7Irzs5fX/iZ6I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gZSWNW7YM0DAcR+PDO/zIdFdu3BwqjQujGE4WesG+4A=;
	b=RXhhk+WSYt9LwrYGZZSvYxVZmMf9JBv//ZsL/CCv8pcy7ZgGuxAFRR1OkOitDdMZVW
	RdRAsAz/hFyjaAfB2gAdSNazY0o5y86NfTgXaX2Uc7AFTBfJ87Eyhy3v2DwihOa7/UsI
	68RFnlM8pVTWHCEKfWQ4guJWnCW7/qHOb+b4QFIPJ8zpwp5kWesBkpuh71EjpZDhTEEl
	eU8kSTBFc2RGmIX+YofiwX6Q2Z2H7D81wFdJOCtM8thKLQLPZhtk9+lYCzUK5rkhDcCU
	E5DADyYeq7PtGCsp1BwGz+B8s+x8kUyZurCb5fu50E/NTlLgqF/jqi2JsclchMgCNYeN
	ktRA==
X-Gm-Message-State: AEkoousl53lpFGfgocvm+9IUEC+jymXs2LTEyVTdRmw+prJenmYzDSBSp9sCbGtSYY6uHC3a6fupvJdxTv51muZN
X-Received: by 10.176.0.208 with SMTP id 74mr15522648uaj.64.1469698596653;
	Thu, 28 Jul 2016 02:36:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Thu, 28 Jul 2016 02:36:17 -0700 (PDT)
In-Reply-To: <63be0e09e7c97bea2f93480bf3b6e8c2e8031ca9.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
	<63be0e09e7c97bea2f93480bf3b6e8c2e8031ca9.1469556788.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 10:36:17 +0100
Message-ID: <CAFEAcA_dwojtkZM_ga+-x4w+mJH4emR9_muaevBqOjffOP3KKQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-arm] [PATCH v3 3/6] cadence_gem: Add support for screening
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0zNijFTZjZk

On 26 July 2016 at 19:25, Alistair Francis <alistair.francis@xilinx.com> wrote:
> The Cadence GEM hardware allows incoming data to be 'screened' based on some
> register values. Add support for these screens.
>
> We also need to increase the max regs to avoid compilation failures. These new
> registers are implemented in the next patch.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
