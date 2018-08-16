Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1921607wru;
        Thu, 16 Aug 2018 07:30:42 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxqrBNo7ltiFPWDt65ktOh71VNo4qgxsryf4gkzWGx+WDk4sD1LMENJAeg9132n7WzIArbt
X-Received: by 2002:a37:5f03:: with SMTP id t3-v6mr28868846qkb.193.1534429842854;
        Thu, 16 Aug 2018 07:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429842; cv=none;
        d=google.com; s=arc-20160816;
        b=TU700qZGDwsub1IpMEdLzaddB9fae/H329MPLlivTNCR5ch81+UyQ8SwzajTUjyvbu
         GSBzAh9WGia08N6i9GwDLHmYw3UTN3xRNCZSBwcwriiXNS32Uh43LpZzYo338I3NJ1xg
         t9B/RvCjS5SiPV3tH+jF/fKCrFJRTOpJmwJFFro3RB5nnIyXpQaXRhBjJA/Q9i0dUbnx
         OOFlh1pESHTlWC1BG9MGY/BVMzzXtqk69A6hBIkEcE/FOU0xOICNFer5PgCq8VAtm8Vk
         HeKe7ogCHE/b++W+/t6kzdVOAAOfZ8sOoFU49IqOx+8nEd+MvpYNUppfe8o2EiDRWbNi
         n04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=C/yP4Lm+L4W6wVXo9OmorKwtdXt+namI2+5Wq4Lg8GU=;
        b=hCN+bhWgoXYzF1y7f2DURKREFDAJEgEIFLuL4uSLUhD41xKmGRHWEQ4eDsaJQVX/vl
         VSDFvzOJnWsh3eyY73R42Y5gto+NWIS+HxMiyT6hqzOiRZQ0Qg7aDrcxfz8B6vvmXpuO
         uElVSRkjznZYja3JHfvY3lskbne97ltm4PNH/h9uYUH0gm2VvDZ4FhhgFMsoxOgtpD+X
         pXhpbJ6jubOIZG3z37mEEuDnEa+fOFTn0v+iIRlZ9VUlirJzh+gZgQCpp4aSlmsTYLED
         HdHxo9Gks6kkCdJ0Y2O17MUBAsSMWLZYKU1q1cWb02hcQsvYUy3r+EAohqL0AYP13Ejp
         oqwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3r6talR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e188-v6si6748057qkf.131.2018.08.16.07.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3r6talR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJIQ-0007qL-Cd
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:30:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJGE-0005pb-4S
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJGD-00075G-EO
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:28:26 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJGC-00074D-2r
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:28:25 -0400
Received: by mail-oi0-x244.google.com with SMTP id j205-v6so8350936oib.4
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C/yP4Lm+L4W6wVXo9OmorKwtdXt+namI2+5Wq4Lg8GU=;
	b=b3r6talRTEI+c7M/qhEL6iM1eWTD/apM6UWKcPqd4q9bnqq6UyZZNyMcugPscUAbqc
	uFygcjSufgJjNhLCmav1kidK6psrpVxKGIj90IaSm05ZjlEzzfysTkKAEs6QkSj7xHzl
	xWGtwDamYMAaVB+D2i0hIbNeJOEpi95JljweY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C/yP4Lm+L4W6wVXo9OmorKwtdXt+namI2+5Wq4Lg8GU=;
	b=BcW0efyTIqLo7ZR6jbopyKZbT+jsiWBJ6tRx7VN7v0cTfx1zftQl+j6DY0zkK4vjPb
	qhFjKZCQcvJjnxgv7XPAnxBB4yy9HSnvLHLQ/mnKmIDeBxqX+R5joT+GZXEs4FmQKDI0
	taDTvSh/ChlXcHawHZofvOk5xZpFnJ+egsV8y0nDeRruyKFnExppTn/0Ux5iXthMTJVi
	ead3dwTkBFpFsNbBprb5XdrmCIiZZCmWt8Ew+rGo6XZUNAcgMljlZlwTv8Nn/5lvSlJJ
	hPUsOmBFkCy9dp237mASUCmxSerRF7wN10+Y1T07G+0XNRnxoMJALUwmDnE6kcKM2gRA
	0VIw==
X-Gm-Message-State: AOUpUlGcNm6mzYITTErNWyeKPLH64ndKDzJwc+HA8FmCds1y4k2xQkMK
	IYPs4KuNbt6brwJr/pr5MxUmlOrHSmGC4SsAOQPjjA==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr29944942oif.212.1534429702662; 
	Thu, 16 Aug 2018 07:28:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:28:02
	-0700 (PDT)
In-Reply-To: <20180816141303.20518-1-joel@jms.id.au>
References: <20180816141303.20518-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:28:02 +0100
Message-ID: <CAFEAcA_u+P7SfuvEMOi-+3brahDnq66ACfyRWJU5QSvQ4Fjo_w@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v5 0/3] arm: Add nRF51 SoC and micro:bit
 machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w1Kv1sPNsPUA

On 16 August 2018 at 15:13, Joel Stanley <joel@jms.id.au> wrote:
> v5: Change back to ARMv7M from ARMMProfile
> v4: Fix number of IRQs
> v3: Rebase on Stefan's cortex-m0 series
> v2: Addresses review from Peter and Stefan
>
> Based-on: 20180814162739.11814-1-stefanha@redhat.com
>
> This short series implements a minimal definition of the Nordic
> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
> machine that will use this SoC.

Hi Joel; it looks like my review of v4 crossed in the mail
with your sending out v5. I think that my comments on
the v4 patch 3 still applies to v5, though (as does my
reviwed-by tag on patch 1).

thanks
-- PMM
