Received: by 10.25.0.144 with SMTP id 138csp794817lfa;
        Sat, 22 Apr 2017 12:06:13 -0700 (PDT)
X-Received: by 10.55.188.70 with SMTP id m67mr18415369qkf.128.1492887973180;
        Sat, 22 Apr 2017 12:06:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y40si13607120qtb.323.2017.04.22.12.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 22 Apr 2017 12:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d20MG-0007Od-KM
	for alex.bennee@linaro.org; Sat, 22 Apr 2017 15:06:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d20M9-0007OO-IN
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d20M8-0006M8-CP
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:06:05 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:38306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d20M8-0006K2-10
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:06:04 -0400
Received: by mail-wm0-x22b.google.com with SMTP id r190so39364138wme.1
	for <qemu-arm@nongnu.org>; Sat, 22 Apr 2017 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZPTkLE+hwMVKOGh3e8/ecFEsqnIS6bdJhkNy37MxbfM=;
	b=ECda4qVRSJdJCUCZaElccRLudoaP1PgoQvMRrS1Yac7fSuWNY3j4Sdivil2ymEvneN
	UDtNBor5QlOzVjukOR3JsKHBfHpO277CA3FC7PVHY3CifZh27VN+bI1riUmztPn8Zo6l
	xzu3iJnWyKENnlXy1EQd1qD9e2lMqjfiiy23E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZPTkLE+hwMVKOGh3e8/ecFEsqnIS6bdJhkNy37MxbfM=;
	b=aCYcCpdcQSBYCruc/rgzid3gnMz0C6hC0fqADa7hG1s/lGCHLpzEBiC5+YUZrEfI2A
	6m7s5EeQKxvg9PcjWfKYHuVz3+ujSXSmxLmKXIeP2J2/jeWTk6yFszMcIXUAKfjBPkdL
	z8ZoB4sE3lXT5ktFI35+rjpYII5ZHuEzQ+y3a7KY7lkvSw2Sa/FEuRoWH8B2FXUF0YBP
	pAy2MIjBfkCrdlWdTRbodecyY7cik88eAI2bo2mC4/zcWLnEltYCGUumsbceHu/Ug9kM
	Xj6JH0pD54OEIZzT/JHnMHEgyKAyaiKsbOMmop2Le9/pTKMMN++cW0mxJIP6MD7H4dpY
	vMAw==
X-Gm-Message-State: AN3rC/5L/+h2W2fd4eFEwr1G1dTm5+2JQeiATjfUklYXAHdARx1n+2zv
	XzZ79RmEiLLjaypyLzbTQIy4xOU/FJjm
X-Received: by 10.28.214.211 with SMTP id n202mr3893277wmg.142.1492887962600; 
	Sat, 22 Apr 2017 12:06:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Sat, 22 Apr 2017 12:05:41 -0700 (PDT)
In-Reply-To: <20170422184632.nm2s7shuo34ukswd@kozik-lap>
References: <20170416151604.22506-1-krzk@kernel.org>
	<CAFEAcA915o-MYNYwPQXpAs7sWS=4ft_iXG41uZx=S27JuutH7Q@mail.gmail.com>
	<20170422184632.nm2s7shuo34ukswd@kozik-lap>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Apr 2017 20:05:41 +0100
Message-ID: <CAFEAcA-8JJtYjAzq=gXJsRHTnO2xiu_EdFEsMR174jh=G0zW8A@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [RFC] hw/arm/exynos: Add generic SDHCI devices
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPlemt6D5E4v

On 22 April 2017 at 19:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Apr 20, 2017 at 02:51:00PM +0100, Peter Maydell wrote:
>> Incidentally someday maybe we should convert this Exynos4210 code
>> to a proper QOM SoC container object, but that would be a lot of
>> work.
>
> Any existing platforms which I could take as an good example? Maybe I'll
> have some time to do it.

The Xilinx ones, or stm32f205_soc, maybe. Basically the idea
is that instead of having a random function which is doing
a lot of instantiation of SoC devices, you have a QoM device
which encapsulates all this, and the board level code just
creates and configures that device.

thanks
-- PMM
