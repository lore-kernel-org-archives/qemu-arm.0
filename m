Received: by 10.25.134.130 with SMTP id i124csp1556581lfd;
        Sun, 10 Jan 2016 10:06:07 -0800 (PST)
X-Received: by 10.55.76.18 with SMTP id z18mr156370968qka.105.1452449167522;
        Sun, 10 Jan 2016 10:06:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c191si105781958qhc.74.2016.01.10.10.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jan 2016 10:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIKNT-0002nl-4j
	for alex.bennee@linaro.org; Sun, 10 Jan 2016 13:06:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIKNQ-0002kV-MH
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 13:06:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIKNN-0007G4-FB
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 13:06:04 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aIKNN-0007F8-7U; Sun, 10 Jan 2016 13:06:01 -0500
Received: by mail-lf0-x242.google.com with SMTP id z62so2978128lfd.0;
	Sun, 10 Jan 2016 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=794TBJ1wgVDMiFKl5cK4w8Q0D1ggQb9F0Y0PRrTb1Bo=;
	b=syUwXzMi2eGlat3xzyr7o/bg3e6t3hauV3lh75gGbXEnxOkXOIXP00na/5dqBxi/Hc
	b1ocTQ7M4j22FORPhrI7zPkA7IwG1Y5AfJsmYs0YRwAn+4XbXD9XdVjDewi8sapx7Fe1
	eqbjruxQx/VbVZnRt2lXP3V2NHV6qrSz9SyvQJp7UtequB3pHimjKjWkznXu95U+aWH7
	0wsbvOVbGBExNAKU9XgV9Pp3DPQbZUbIi5GQdz0aHWZaqfVAj6N69w/+y2Vw40wKhtx8
	gY8m6UjJ6SREVZckF5W6tB3llZCgwOPKur44HGMk9PpikXllxuSK0nq+OtrFe/RosVEc
	8g6w==
X-Received: by 10.25.21.106 with SMTP id l103mr44733376lfi.92.1452449160284;
	Sun, 10 Jan 2016 10:06:00 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	h187sm13438280lfg.18.2016.01.10.10.05.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jan 2016 10:05:59 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1452359845.git.digetx@gmail.com>
	<c0c346dfae4cc4d823a4bb10000af2af97e44b4d.1452359845.git.digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56929D6F.7010301@gmail.com>
Date: Sun, 10 Jan 2016 21:05:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <c0c346dfae4cc4d823a4bb10000af2af97e44b4d.1452359845.git.digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
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
X-TUID: 3lY6cWRJ2PCj

I missed case where periodic timer should stop in the following case:

load = 0, counter != 0 -> run -> set counter = 0 -> should stop

Test added. Will fix it in V11.

-- 
Dmitry
