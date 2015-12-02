Received: by 10.182.158.201 with SMTP id ww9csp2936363obb;
        Wed, 2 Dec 2015 01:39:48 -0800 (PST)
X-Received: by 10.141.4.67 with SMTP id g64mr2844849qhd.34.1449049185360;
        Wed, 02 Dec 2015 01:39:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si2476343qgl.97.2015.12.02.01.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 01:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a43t2-0001qe-UG
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 04:39:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a43t1-0001qW-5u
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 04:39:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a43sw-0008Ro-6R
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 04:39:43 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>)
	id 1a43sv-0008Qo-Vt; Wed, 02 Dec 2015 04:39:38 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout2.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0NYQ00AGU5HXIU20@mailout2.w1.samsung.com>; Wed,
	02 Dec 2015 09:39:33 +0000 (GMT)
X-AuditID: cbfec7f4-f79026d00000418a-4a-565ebc5588e5
Received: from eusync3.samsung.com ( [203.254.199.213])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id 90.D2.16778.55CBE565;
	Wed, 2 Dec 2015 09:39:33 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
	by eusync3.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0NYQ003045HWMU60@eusync3.samsung.com>; Wed,
	02 Dec 2015 09:39:33 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: 'Wei Huang' <wei@redhat.com>, 'Peter Maydell' <peter.maydell@linaro.org>, 
	'Igor Mammedov' <imammedo@redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
	<20151201142146.2bcda69f@nial.brq.redhat.com>
	<CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
	<01d201d12c47$5a77dd00$0f679700$@samsung.com>
	<565DBCCF.7050404@redhat.com>
In-reply-to: <565DBCCF.7050404@redhat.com>
Date: Wed, 02 Dec 2015 12:39:32 +0300
Message-id: <00d201d12ce5$59ace110$0d06a330$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQGRnbBHb9r1uIChXxREa96rqs7PFgJwYBm3AlHwgbMBZIX8TQFZm5gsAdXIiiWe69z3IA==
Content-language: ru
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4Vd3QPXFhBocbFS2eTbvGaHH6aAez
	xf9fr1gt/k08xmox58wDFosF3QvZLI737mCxeLrsN6vFzPsKFvM2vGBy4PJoOfKW1ePOtT1s
	Hk+ubWbyeL/vKlsASxSXTUpqTmZZapG+XQJXxqTrd1kLelkrrm6aw9rAOJWli5GTQ0LARGLx
	rQusELaYxIV769m6GLk4hASWMkp8ebiCHcL5zihxtquFCaSKTUBd4vTXD2DdIgKlEtNOnwez
	mQW2MEm8XBcI0XCCSaLh12VGkASngJbE+7tTgZo5OIQFIiQ2TjMECbMIqErcujeDGcTmFbCU
	+HH/HSuELSjxY/I9qJnqEpPmLWKGsOUlNq95ywxxqYLEjrOvGSFuiJBYuXEXVL2IxLR/95gn
	MArNQjJqFpJRs5CMmoWkZQEjyypG0dTS5ILipPRcQ73ixNzi0rx0veT83E2MkBj6soNx8TGr
	Q4wCHIxKPLwreOLChFgTy4orcw8xSnAwK4nweskAhXhTEiurUovy44tKc1KLDzFKc7AoifPO
	3fU+REggPbEkNTs1tSC1CCbLxMEp1cCoVdpnWnJPYOVfuRc+Nz0W8E3c+eBF2YM4TbMLlrGM
	/U+6oyVfO08PbPHUVaiO5zuTHdTClHeF/5B/qGNxboHjga2HnWo7Np8q9xa99XGtwYS9alcZ
	7edYbDytNVlNQFdZL8qgULlFmWsXi/OmyVbz3daW75vx89ZzjjnVk17MXx+Yo/dC4o0SS3FG
	oqEWc1FxIgB84gbHnQIAAA==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.12
Cc: 'G Gregory' <graeme.gregory@linaro.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	'QEMU Developers' <qemu-devel@nongnu.org>,
	"'Huangpeng \(Peter\)'" <peter.huangpeng@huawei.com>,
	'qemu-arm' <qemu-arm@nongnu.org>, 'Shannon Zhao' <shannon.zhao@linaro.org>,
	'Shannon Zhao' <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a
	GPIO	controller
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
X-TUID: 5HPHJHHB6xVs

 Hello!

> PSCI handles the actions initiated from the inside of OS. Examples
> include system shutdown and hotplug (still inside OS). From this
> perspective PSCI works well. However this communication is
> one-direction: there isn't a way to communicate from the outside (e.g.
> libvirt) to the guest OS. For instance, "system_powerdown" qmp command
> won't work because guest OS can't receive the notification.

 Ah, so it is necessary for e.g. commanding a graceful shutdown using virt-manager's "shutdown" command? Good then, i've missed that.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


