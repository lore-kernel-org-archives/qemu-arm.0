Received: by 10.25.134.130 with SMTP id i124csp1559266lfd;
        Sun, 10 Jan 2016 10:13:25 -0800 (PST)
X-Received: by 10.55.24.73 with SMTP id j70mr288091qkh.53.1452449605232;
        Sun, 10 Jan 2016 10:13:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si21134354qgc.0.2016.01.10.10.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jan 2016 10:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIKUW-0006SR-NG
	for alex.bennee@linaro.org; Sun, 10 Jan 2016 13:13:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIKUU-0006Oh-6M
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 13:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIKUR-0000qf-2G
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 13:13:22 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aIKUQ-0000qW-RJ; Sun, 10 Jan 2016 13:13:18 -0500
Received: by mail-lf0-x241.google.com with SMTP id t141so4262672lfd.3;
	Sun, 10 Jan 2016 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=cKZ5FGK+Ek2owjGQEkR512/PnsXjR047FQmiVVnQI3I=;
	b=NRGGaLtV2yWE+YIpSogJbPwAd2SYIpYDqRwnNz+ZgbOaQ3pigWJcrYu3HwQOeXslGH
	+9OFe5mTKTJ7N/iRq/G+4R//anZ3+q8wQU4TAvZTIzLN4NT5e6fqYhpseixtdm4ips9y
	AIbXlnr4cD59GUPNNot4GRqi2L4npxQiiTVWL8PYBTlN8Q6rgWJW1qgxaHrmiuZ7/xf7
	cWo9kvwjkvtguP1yGg/lqp2SlDmcZEYNsOOi8MXsT7jCjN03pCJphoDa2kGzIL1wjFOw
	UqaMC2C+JOnFGiu9x9E6cnMDhaaGuUe/8LBdfeNVTnTJ8UjEBivhAMUXZCTbABwizxtK
	0oxQ==
X-Received: by 10.25.18.89 with SMTP id h86mr35646582lfi.165.1452449598090;
	Sun, 10 Jan 2016 10:13:18 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	n185sm1427874lfd.27.2016.01.10.10.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jan 2016 10:13:17 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1452359845.git.digetx@gmail.com>
	<c0c346dfae4cc4d823a4bb10000af2af97e44b4d.1452359845.git.digetx@gmail.com>
	<56929D6F.7010301@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56929F24.7090309@gmail.com>
Date: Sun, 10 Jan 2016 21:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56929D6F.7010301@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v10 7/7] arm_mptimer: Convert to use ptimer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pt9XLzPZ7nAE

10.01.2016 21:05, Dmitry Osipenko пишет:
> I missed case where periodic timer should stop in the following case:
>
> load = 0, counter != 0 -> run -> set counter = 0 -> should stop
>
> Test added. Will fix it in V11.
>

Forgot to mention that prescaler must be 0 in that case. Prescaler != 0 would 
result in unclearable IRQ while periodic timer is enabled and counter = load = 0.

-- 
Dmitry
