Received: by 10.25.208.137 with SMTP id h131csp92945lfg;
        Tue, 10 May 2016 23:52:21 -0700 (PDT)
X-Received: by 10.140.107.225 with SMTP id h88mr1593832qgf.33.1462949541107;
        Tue, 10 May 2016 23:52:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a190si4072855qke.76.2016.05.10.23.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 23:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0O0K-0005aC-Ma
	for alex.bennee@linaro.org; Wed, 11 May 2016 02:52:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b0O0H-0005T3-7z
	for qemu-arm@nongnu.org; Wed, 11 May 2016 02:52:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b0O0F-00083B-1E
	for qemu-arm@nongnu.org; Wed, 11 May 2016 02:52:16 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:2951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1b0O07-0007xX-JH; Wed, 11 May 2016 02:52:08 -0400
Received: from 172.24.1.137 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DKJ06341; Wed, 11 May 2016 14:51:30 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml422-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 11 May 2016 14:51:21 +0800
Message-ID: <5732D667.3040105@huawei.com>
Date: Wed, 11 May 2016 14:51:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5732D674.01A0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fbbbef7a54f3ca64313057d111f73139
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] GICv3 emulation
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nkd5KgYUtHMP

Hi Peter,

On 2016/5/10 1:29, Peter Maydell wrote:

> Code review, testing, attempts to run guests other than Linux
> welcome (UEFI, anybody?)
I run a guest with UEFI firmware. It gets stuck when kernel boots:

[    0.186331] Brought up 1 CPUs
[    0.186613] SMP: Total of 1 processors activated.
[    0.187976] CPU: All CPU(s) started at EL1
[    0.191060] alternatives: patching kernel code
[    0.234352] devtmpfs: initialized
[    0.273918] SMBIOS 3.0.0 present.
[    0.280438] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.289983] pinctrl core: initialized pinctrl subsystem
[    0.347558] NET: Registered protocol family 16

Thanks,
-- 
Shannon

