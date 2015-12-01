Received: by 10.182.158.201 with SMTP id ww9csp2365476obb;
        Tue, 1 Dec 2015 06:49:23 -0800 (PST)
X-Received: by 10.55.52.142 with SMTP id b136mr82621231qka.100.1448981363819;
        Tue, 01 Dec 2015 06:49:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p53si30886065qge.106.2015.12.01.06.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 06:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3mF9-0007I8-Hj
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 09:49:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a3mEY-0006RJ-7Y
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 09:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a3mEX-0002VP-9Q
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 09:48:46 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>)
	id 1a3mEP-0002UY-R1; Tue, 01 Dec 2015 09:48:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout2.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0NYO008RHP4YJOC0@mailout2.w1.samsung.com>; Tue,
	01 Dec 2015 14:48:34 +0000 (GMT)
X-AuditID: cbfec7f5-f79b16d000005389-b7-565db342b885
Received: from eusync1.samsung.com ( [203.254.199.211])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id 4D.10.21385.243BD565;
	Tue, 1 Dec 2015 14:48:34 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
	by eusync1.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0NYO001BWP4XW550@eusync1.samsung.com>; Tue,
	01 Dec 2015 14:48:34 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>,
	'Igor Mammedov' <imammedo@redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
	<20151201142146.2bcda69f@nial.brq.redhat.com>
	<CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
In-reply-to: <CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
Date: Tue, 01 Dec 2015 17:48:33 +0300
Message-id: <01d201d12c47$5a77dd00$0f679700$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQGRnbBHb9r1uIChXxREa96rqs7PFgJwYBm3AlHwgbMBZIX8TZ8EGr6Q
Content-language: ru
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4ZV2nzbFhBt1rlS2eTbvGaHH6aAez
	xf9fr1gt/k08xmox58wDFosF3QvZLI737mCxeLrsN6vFzPsKFvM2vGBy4PJoOfKW1ePOtT1s
	Hk+ubWbyeL/vKlsASxSXTUpqTmZZapG+XQJXxsTe2awFbZwVzRd3MDcwLmbvYuTkkBAwkWg4
	/ZkVwhaTuHBvPVsXIxeHkMBSRom1dz+xQDjfGSVmfAFxODnYBNQlTn/9AGaLCIRLLLp7jh2k
	iFngEpPEqZ1/mSA6fjFKvO36AbaDUyBY4tznCWC2sIC3xMGH3xi7GDk4WARUJVZeZAcxeQUs
	JRZN1wGp4BUQlPgx+R7YfGagXZPmLWKGsLUlnry7AHWpgsSOs68ZIW5wk9jVfJoJokZEYtq/
	e8wTGIVmIRk1C8moWUhGzULSsoCRZRWjaGppckFxUnqukV5xYm5xaV66XnJ+7iZGSAx93cG4
	9JjVIUYBDkYlHl6JtTFhQqyJZcWVuYcYJTiYlUR4n66NDRPiTUmsrEotyo8vKs1JLT7EKM3B
	oiTOO3PX+xAhgfTEktTs1NSC1CKYLBMHp1QDY+BehaW91vo2p/OPcrkHTHxtd8jgzMRJsouX
	7pBct8AxKefbE1bLpx6KGQvfLNhpwLbpjHJTvs3NjKANupITueznRprfzrOt/bi50pX7iY9c
	v2Dtl+tHN6l03Xm6fPXWnKN6VSLbBE4eZPNez/Etot51f3Rt0NH1rGtXV1dPW98wiW9qHNuv
	N0osxRmJhlrMRcWJAMF1EZydAgAA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.12
Cc: 'Wei Huang' <wei@redhat.com>, 'G Gregory' <graeme.gregory@linaro.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	"'Huangpeng \(Peter\)'" <peter.huangpeng@huawei.com>,
	'QEMU Developers' <qemu-devel@nongnu.org>,
	'qemu-arm' <qemu-arm@nongnu.org>, 'Shannon Zhao' <shannon.zhao@linaro.org>,
	'Shannon Zhao' <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QyWdTfZc+CyX

 Hello!

> >> ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
> >> powerdown, hotplug evnets. Add a GPIO controller in machine virt,
> > s/evnets/events/
> >
> >> to support powerdown, maybe can be used for cpu hotplug. And
> >> here we use pl061.

 Sorry for late jumping in, but this was the first message Cc'ed to me.
 With these devices virt machine IMHO goes farther and farther away from =
its initial goal: be a minimalistic virtual box, which ensures maximum =
possible compatibility and portability.
 virt machine already supports poweroff using PSCI interface. Why we =
need to add more hardware? Can't ACPI deal with PSCI?
 To tell the truth, i dislike ACPI + EFI thing at all. It looks like =
cramming PC-oriented firmware into architecture for which it was never =
meant to be written. Too much overcomplications, we drop already =
established things and reinvent a (triangular) wheel, but what's the =
purpose? Is it being done only because vendors want obscure proprietary =
firmware instead of old good u-boot?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia

