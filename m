Received: by 10.25.77.65 with SMTP id a62csp176993lfb;
        Fri, 17 Feb 2017 05:37:24 -0800 (PST)
X-Received: by 10.55.181.6 with SMTP id e6mr7019490qkf.298.1487338643839;
        Fri, 17 Feb 2017 05:37:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si7491148qki.108.2017.02.17.05.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 05:37:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceiix-0001Hn-9G
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 08:37:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceiir-0001G5-Fy
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceiiq-0002jD-Iw
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:37:17 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:36606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceiiq-0002hs-Cr
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:37:16 -0500
Received: by mail-wm0-x231.google.com with SMTP id c85so15248872wmi.1
	for <qemu-arm@nongnu.org>; Fri, 17 Feb 2017 05:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FYgGRUt/MHv1h+QaiVVO39/eX+86RTsuHxPP3wnmcAg=;
	b=JTayR7tRLvo7SU1tazUeXK5ZmONsPPBjrmJmhqVdEXTJm/W3uaZtoG9Amci6YiEnCN
	mtrh8J5F0c0VVl7rP5KeUHk3CTao74dtv+ZFfC8Zl7diOSTGKDN/DXPFQ3C/62ZVn4md
	m4+MDV6DcFImfjNv8mS88sumKB+qKNSSXba/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FYgGRUt/MHv1h+QaiVVO39/eX+86RTsuHxPP3wnmcAg=;
	b=G14kkcQLMlCosCbjkGzqwmkvTWV4Iv2dnFjJEjL4ZmGtazwbfzgW/YmocwOaeHBzOa
	WGeUk0lCnLlvXd1Zb19kjlUQ1Cc+f0nQvqtbrGrtrS06ZLQynn73tzp0vRmg3tEyg5xR
	2FqfkTZmNh7e4vYfp/PkYqPM5eTQFnbg5cTAg2iPfWwNa/vhfvoFF9vddGMvdMfx+MMP
	STItdXgQaWvB6jgIiWjclQOZqFg+LLcYRn/GvVu9+B76ga7w5QJyCMMRVWry/biy8bSS
	NvIEutJEqnzdkXI4/rU9vRuut6d0zohxKEibhXnpz1uIvXTiGhPuLHHTJHv51UpllGCy
	KZIg==
X-Gm-Message-State: AMke39k5lVnTIwlMh7fwryYqVkJInTg13dK1CisZSlA3/yLLND4P3rbVV40Vu5avt79W3jKwV2flZYDFpyWxVmB8
X-Received: by 10.28.157.70 with SMTP id g67mr3516429wme.111.1487338635328;
	Fri, 17 Feb 2017 05:37:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:36:54 -0800 (PST)
In-Reply-To: <1487313115-9510-5-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-5-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:36:54 +0000
Message-ID: <CAFEAcA8ZvmbbWPM70TxnPCrKCQjL4_O5_1=MW24EJacxigm7Sg@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v8 4/5] target-arm: Add GICv3CPUState in
 CPUARMState struct
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jAMFvw7LyuLC

On 17 February 2017 at 06:31,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Add gicv3state void pointer to CPUARMState struct
> to store GICv3CPUState.
>
> In case of usecase like CPU reset, we need to reset
> GICv3CPUState of the CPU. In such scenario, this pointer
> becomes handy.
>
> This patch take care of only GICv3.

I'm not sure what you mean to say with this sentence ?

>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
