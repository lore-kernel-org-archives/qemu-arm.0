Received: by 10.25.208.211 with SMTP id h202csp441062lfg;
        Thu, 17 Mar 2016 06:26:33 -0700 (PDT)
X-Received: by 10.141.5.137 with SMTP id h131mr14750978qhd.47.1458221193321;
        Thu, 17 Mar 2016 06:26:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u92si7869437qge.31.2016.03.17.06.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agXwe-0004YU-P5
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwb-0004YE-Rb
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 09:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwX-0000Ek-Qz
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 09:26:29 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:50195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1agXwX-0000B9-67; Thu, 17 Mar 2016 09:26:25 -0400
Received: from 172.24.1.50 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BYG75008; Thu, 17 Mar 2016 21:26:02 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 17 Mar 2016 21:25:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <wei@redhat.com>
Date: Thu, 17 Mar 2016 21:25:38 +0800
Message-ID: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56EAB06B.0174, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c52b05bb08edf47a716ced9efc03db26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH 0/2] Add gpio_key and use it for ARM virt power
	button
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
X-TUID: 0AvzKOw8CV4L

From: Shannon Zhao <shannon.zhao@linaro.org>

There is a problem for power button that it will not work if an early
system_powerdown request happens before guest gpio driver loads.

Here we add the emulation of gpio_key and use it for ARM virt power
button.

Shannon Zhao (2):
  hw/gpio: Add the emulation of gpio_key
  ARM: Virt: Use gpio_key for power button

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/virt.c                   |   7 ++-
 hw/gpio/Makefile.objs           |   1 +
 hw/gpio/gpio_key.c              | 100 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/gpio_key.c

-- 
2.0.4


