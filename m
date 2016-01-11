Received: by 10.25.134.130 with SMTP id i124csp1822239lfd;
        Mon, 11 Jan 2016 00:08:07 -0800 (PST)
X-Received: by 10.55.71.146 with SMTP id u140mr156207738qka.14.1452499687788;
        Mon, 11 Jan 2016 00:08:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c92si63292801qgc.107.2016.01.11.00.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 00:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIXWJ-0006m8-Af
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 03:08:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1aIXVu-0006Ho-UZ
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 03:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1aIXVq-0000xX-Tq
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 03:07:42 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1aIXVq-0000we-O1
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 03:07:38 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout2.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O0S003NV3WMUC50@mailout2.w1.samsung.com> for
	qemu-arm@nongnu.org; Mon, 11 Jan 2016 08:07:34 +0000 (GMT)
X-AuditID: cbfec7f5-f79b16d000005389-a2-569362c64fe4
Received: from eusync2.samsung.com ( [203.254.199.212])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id F9.86.21385.6C263965;
	Mon, 11 Jan 2016 08:07:34 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
	by eusync2.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0O0S00HGI3WL3O20@eusync2.samsung.com>; Mon,
	11 Jan 2016 08:07:34 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: 'Meng Xu' <xumeng1901@gmail.com>, qemu-arm@nongnu.org
References: <8536B0ED-6417-4F65-99F7-1D49F950E24B@gmail.com>
In-reply-to: <8536B0ED-6417-4F65-99F7-1D49F950E24B@gmail.com>
Date: Mon, 11 Jan 2016 11:07:33 +0300
Message-id: <052c01d14c47$20860ca0$619225e0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQFtcz45Xjs37VGpf8wWQ7dYjXG0Np+9pi6g
Content-language: ru
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsVy+t/xK7rHkiaHGUx/IWaxoHshm8W7xY9Y
	HZg8ds66y+7x5NpmpgCmKC6blNSczLLUIn27BK6MeSfvMxXcYa9Y8X8VewPjBLYuRk4OCQET
	ifMPv7NC2GISF+6tB4pzcQgJLGWUWHN+OjuE851RYsOyxewgVWwC6hKnv35gAbFFBCwlvi3f
	yARiCwnYSKzbdxVsKqeArcSLexsZQWxhAT2Jq42fwWpYBFQlXu5ZB1bDC9T7eNEOVghbUOLH
	5HtAMzk4mIHmT5mSCxJmFtCWePLuAtRxChI7zr5mhFhrJHHs+HVmiBoRiWn/7jFPYBSchWTS
	LIRJs5BMmoWkYwEjyypG0dTS5ILipPRcI73ixNzi0rx0veT83E2MkCD+uoNx6TGrQ4wCHIxK
	PLwzdk0KE2JNLCuuzD3EKMHBrCTC28oxOUyINyWxsiq1KD++qDQntfgQozQHi5I478xd70OE
	BNITS1KzU1MLUotgskwcnFINjBw82krxugpfljJ/m7Ip44y4lfu26oXVH/wNtvXvst0t82PH
	3987owOdlxR8d5jve9J2i2ShVtvfKzNVjm9eK27+ZKfuepc5l0X5tzkXNrM7hom6X6urPmpz
	quXR6/QmrYZbC3Z5L+XizTWebnY0+ILka3F+8QeejztUt7GeNP/NLXe77l24lhJLcUaioRZz
	UXEiACyId4ReAgAA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.12
Subject: Re: [Qemu-arm] aarch64 ivshmem issues
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
X-TUID: i4BQv0WCy2I5

 Hello!

> I am using the ivshmem device to create shared memory between an =
x86_64 host and aarch64
> guest. The guest has ubuntu server 14.04 installed with kernel version =
3.13.0. I wrote a kernel
> driver to drive the ivshmem device (as a pci driver) however, the =
driver was never registered:

 There should be no problem with ivshmem itself on ARM64. Last year we =
did some tests with it, and it worked fine out of the box.
 Since you are saying that "the driver was never registered", then, =
perhaps, something is wrong with your guest kernel config. For the =
start, check whether PCI subsystem and PCI generic host is enabled. =
Mainline kernels older than 4.3 do not support generic PCI host =
controller on ARM64, therefore you have no PCI bus. If your distro has =
older kernel, it is likely to suffer from this problem. Check 'lspci' =
output on your guest.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


