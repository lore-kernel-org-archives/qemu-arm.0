Received: by 10.25.159.19 with SMTP id i19csp842811lfe;
        Tue, 12 Jan 2016 17:54:08 -0800 (PST)
X-Received: by 10.140.140.80 with SMTP id 77mr112980679qhm.61.1452650048176;
        Tue, 12 Jan 2016 17:54:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u108si94166783qge.50.2016.01.12.17.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 17:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJAdT-0005SO-Q4
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 20:54:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aJAdR-0005SH-Qa
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 20:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aJAdO-0007Ag-Kv
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 20:54:05 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:12357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aJAdO-00072p-2F; Tue, 12 Jan 2016 20:54:02 -0500
Received: from 172.24.1.49 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BUL83680; Wed, 13 Jan 2016 09:50:24 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 13 Jan 2016 09:50:16 +0800
Message-ID: <5695AD56.2040402@huawei.com>
Date: Wed, 13 Jan 2016 09:50:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
	<shannon.zhao@linaro.org>
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
	<CAFEAcA-=9h11a2AvJYBNzfeDsW7-KS7x_7N-T0udr6NZ9Gu9bg@mail.gmail.com>
In-Reply-To: <CAFEAcA-=9h11a2AvJYBNzfeDsW7-KS7x_7N-T0udr6NZ9Gu9bg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.5695AD61.0032, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ae750a625276ec937a1786e43dd5bca3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: edk2-devel@ml01.01.org, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] ARM: Virt: Don't generate RTC ACPI node when
	using UEFI
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
X-TUID: QAfZrsr4J347



On 2016/1/12 23:30, Peter Maydell wrote:
> On 12 January 2016 at 15:24, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> > When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
>> > To DTB UEFI could call libfdt api to disable the RTC device node, but to
>> > ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
>> > device in QEMU when using UEFI.
> I don't really understand this. I thought that if we were
> using ACPI then we would always be doing it via UEFI?
> 
Currently this is true and maybe for a long time this is also true.

> Also I think if UEFI wants to take command of some of the
> hardware it ought to be UEFI's job to adjust the tables
> accordingly before it passes them on to the guest OS.
Yes, the ideal method is adjusting the DSDT table in UEFI. But there is
almost no way to parse the DSDT table in UEFI. If we want to support
that it will introduce ACPI interpreter. This makes it more complex.

There is a discussion [1] about this on the edk2 list.

[1]https://www.mail-archive.com/edk2-devel@lists.01.org/msg06301.html

Thanks,
-- 
Shannon

