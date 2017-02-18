Received: by 10.25.77.65 with SMTP id a62csp642492lfb;
        Sat, 18 Feb 2017 07:46:44 -0800 (PST)
X-Received: by 10.200.39.77 with SMTP id h13mr13233187qth.62.1487432804020;
        Sat, 18 Feb 2017 07:46:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si9683847qkb.26.2017.02.18.07.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Feb 2017 07:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cf7Df-0003PP-GV
	for alex.bennee@linaro.org; Sat, 18 Feb 2017 10:46:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cf7DZ-0003M7-D6
	for qemu-arm@nongnu.org; Sat, 18 Feb 2017 10:46:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cf7DY-0004Mp-Lk
	for qemu-arm@nongnu.org; Sat, 18 Feb 2017 10:46:37 -0500
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:35948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cf7DY-0004Lv-Em
	for qemu-arm@nongnu.org; Sat, 18 Feb 2017 10:46:36 -0500
Received: by mail-wr0-x230.google.com with SMTP id 89so39349547wrr.3
	for <qemu-arm@nongnu.org>; Sat, 18 Feb 2017 07:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7XlmDn7ae2VVEj4sc7yGdM+wdLW1N/kITBz7U41XpQ8=;
	b=HOKr571CLMm11KZmDtMcPS4a8tbhJp3BJBXOhHDwBcJesXprOKEMrN/n97YDOFqoE9
	eK34rxLpur8I2Jf3vEZhxhApj+Q1VxsO5On806DYQpNkZt+YGPtB+gv8ZfY40eVBNpap
	VriWCEccdcoUWDritQUwQ9RX7Gh0aS0VnIZ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7XlmDn7ae2VVEj4sc7yGdM+wdLW1N/kITBz7U41XpQ8=;
	b=JYGXaFGQzuItdxN0eFcnH2Lt+3n4/sa3yYhSssFvabyEN81mQVhuiacOVLZ64/P0EF
	JtiYljd400kg6hH4C10QUUdkCLcR6GIdW7G6xro+o9SeWjrlf3PR+7fo11pOPu2meshT
	lFhmv66PlZECz5P6Oh5xseX8ZVfICstgB1GZiNChsiq63M1wSs0yYe6YskfCwE7ISKDe
	5SdZlZampNHCi26RYCY6t+OwwtjcG9vrwf7DBJ5vxb21clnQXCaFNvtFJcUPkNYrRRxt
	xk39l+yGS34+EJIwZNkKfTIi7HhmtLKKBtix/JhYIa8YHK71dzU6GG4/WOkT1gwHzY1Y
	GKQA==
X-Gm-Message-State: AMke39lOYEbVrho9RgzrfgL1cWp+zBJNpCubfMjD6drPkk54+VeE+oqemM4DLJtiuUo7ZtoLVN/g6mvXER0hKbKZ
X-Received: by 10.223.152.175 with SMTP id w44mr11367448wrb.151.1487432794834; 
	Sat, 18 Feb 2017 07:46:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 18 Feb 2017 07:46:14 -0800 (PST)
In-Reply-To: <076b0d94-738e-252c-1ed8-4640a864ac34@ispras.ru>
References: <076b0d94-738e-252c-1ed8-4640a864ac34@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Feb 2017 15:46:14 +0000
Message-ID: <CAFEAcA-zURkUb28wVA347AFJX5Wa4GyXbFSVmUDH1BSXRMA+rQ@mail.gmail.com>
To: Kurban Mallachiev <mallachiev@ispras.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [PATCH] ARM i.MX timers: fix software reset
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0lGNe4UNhY58

On 17 February 2017 at 18:18, Kurban Mallachiev <mallachiev@ispras.ru> wrote:
> Hello!
>
> i.MX6 RM says that setting software reset bit in CR register of GPT (general
> purpose timers) should resets all of the registers of GPT to their default
> reset values, except for the CLKSRC, EN, ENMOD, STOPEN, WAITEN, and DBGEN
> bits in CR. But current implementation does the opposite for CR register (it
> clears CLKSRC and friends bits and preserves the others).
>
> Most importantly this leads to that software reset bit doesn't clears
> automatically.
>
> I have a look at git history and found that software reset bit was being
> cleared before 462566fc5e3 commit.
>
> I have doubts about the correct fixing of this problem. I don't really
> understand the nature of the "Soft reset doesn't touch some bits; hard reset
> clears them" comment in imx_gpt_reset function, does it mean that
> imx_gpt_reset performs a hard reset or soft reset? I see two possible
> fixings:
>
> 1. If imx_gpt_reset purpose is to do a software reset of device, then we
> should fix this function. My patch at the end of email fixes this function.
>
> 2. If imx_gpt_reset purpose is to do a hard reset of device? then there
> should be another function to software reset of device. If so I can create a
> new patch.

As the function registered via the DeviceState's dc->reset
pointer, imx_gpt_reset() has to behave as a "device was
powercycled" level reset. It looks like we also call it
from imx_gpt_write() when the guest does a write to a
particular register. If that guest-requested reset has
to have different behaviour from "device was powered off
and on again" then it needs to use a different function
and can't just call imx_gpt_reset().

thanks
-- PMM
