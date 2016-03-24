Received: by 10.25.208.211 with SMTP id h202csp328059lfg;
        Wed, 23 Mar 2016 17:59:15 -0700 (PDT)
X-Received: by 10.140.100.246 with SMTP id s109mr7327529qge.35.1458781155012;
        Wed, 23 Mar 2016 17:59:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189si4493649qhl.13.2016.03.23.17.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 17:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aitcI-0005Fv-MM
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 20:59:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aitcF-0005F9-Tl
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 20:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aitcB-0007Kg-NJ
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 20:59:11 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:43821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aitc2-0007Hw-3s; Wed, 23 Mar 2016 20:59:07 -0400
Received: from 172.24.1.36 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DHN64770; Thu, 24 Mar 2016 08:58:36 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Mar 2016 08:58:25 +0800
Message-ID: <56F33BAC.4070607@huawei.com>
Date: Thu, 24 Mar 2016 08:58:20 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
	<56F2CEE2.7060903@redhat.com>
In-Reply-To: <56F2CEE2.7060903@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0B0203.56F33BBE.0073, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 592a092ee519e8fc4f843f8c329c85a1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: "Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/2] Add gpio_key and use it for ARM virt
	power button
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
X-TUID: jTocmvq2BrYG



On 2016/3/24 1:14, Wei Huang wrote:
> 
> On 03/23/2016 11:12 AM, Peter Maydell wrote:
>> > On 17 March 2016 at 13:25, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> >> From: Shannon Zhao <shannon.zhao@linaro.org>
>>> >>
>>> >> There is a problem for power button that it will not work if an early
>>> >> system_powerdown request happens before guest gpio driver loads.
>>> >>
>>> >> Here we add the emulation of gpio_key and use it for ARM virt power
>>> >> button.
>> > 
>> > I tweaked the type names to be 'gpio-key' rather than 'gpio_key',
>> > and added a comment to briefly describe what the device does:
>> > 
>> > + * Emulate a (human) keypress -- when the key is triggered by
>> > + * setting the incoming gpio line, the outbound irq line is
>> > + * raised for 100ms before being dropped again.
>> > 
Great. Thanks a lot!

>> > Applied to target-arm.next, thanks.
> I didn't see the patch series until yesterday. So just to make it
> complete, I did test it with both DT and ACPI modes. The patch seemed to
> work as intended.
> 
> Tested-by: Wei Huang <wei@redhat.com>
Thanks, Wei!

-- 
Shannon

