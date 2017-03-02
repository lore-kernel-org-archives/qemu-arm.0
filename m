Received: by 10.25.0.147 with SMTP id 141csp364815lfa;
        Thu, 2 Mar 2017 08:40:13 -0800 (PST)
X-Received: by 10.200.45.57 with SMTP id n54mr18926670qta.212.1488472813666;
        Thu, 02 Mar 2017 08:40:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r88si7304030qkh.133.2017.03.02.08.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:40:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTlz-00012o-5C
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:40:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTlt-00011M-BN
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:40:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTlp-0007zS-M1
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:40:05 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:34532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTlp-0007yy-GL
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:40:01 -0500
Received: by mail-wr0-x22d.google.com with SMTP id l37so56575842wrc.1
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F+e5Fo4RJBSURJKIKCinw4RBIQcylagZZ3ezNipS0Xo=;
	b=XhtQ+KdCX3OqorUiB4e5oZZ6YXh73f/JmczlTgfxa192rqz1h3Y8tPsXuZVn6L4DbK
	E/teLO/I2h4/jOwiVFchrf5Zo7ydxzkSTXzlgM0E33wEPecDOWUi6r4rRxg8/d9/2ak2
	iNovr/s2QTTQIp1rUmSw+LGAn7ejAKdS4WYKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F+e5Fo4RJBSURJKIKCinw4RBIQcylagZZ3ezNipS0Xo=;
	b=YxdOwRszwPtvdZgWmXYMev/6u9lIm3ew+u3G0h/k6uloAZw3AnqbBwZJsU8dcNGQG8
	7X1oTkUkF9dDYGOZIeUHwN9cTsQkHTzlnx7nHBWsxiBWDJzjKPJbPV1eiYDuXJz0yWIj
	UC0J/0TquEhNxsvekx7UyXd4z/MFuxen0RgGebdU2wBL7yGcgPSJ+VL2XFrSFCEIzmue
	LI1zY4JADHYTQMAJJCTcbHGGRzQcXjXmmLZ73u5+rH2YodRR5JonRj0yPS3+bV8Rf1ED
	vPCS2rgJATLrHkh1JGGkv7+bVrYlVSBFVLf8A3Ke24NaizmbVOsSkCe9mERgXY0GzsFN
	ZAOw==
X-Gm-Message-State: AMke39k00Hi8Ds28KyJFywC6ZG8clHAHdm6bcQVRK3dGnLpVNZ5MoPLnnAkEpJlwaWoiG2yKjb9p5UhJ0ueYfWo1
X-Received: by 10.223.150.205 with SMTP id u71mr13178257wrb.195.1488472800361; 
	Thu, 02 Mar 2017 08:40:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:39:39 -0800 (PST)
In-Reply-To: <20170301182618.22395-4-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-4-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:39:39 +0000
Message-ID: <CAFEAcA_1iyE34aSc4SG5cCXG7s8Esr6ZQ6qdj7-OY4N-ufNcHg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH 3/5] hw/timer/exynos4210_mct: Cleanup
 indentation and empty new lines
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: shkVLW3YCCL8

On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Statements under 'case' were in some places wrongly indented bringing
> confusion and making the code less readable.  Remove also few unneeded
> blank lines.  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
