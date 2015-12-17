Received: by 10.182.158.201 with SMTP id ww9csp397329obb;
        Thu, 17 Dec 2015 05:53:51 -0800 (PST)
X-Received: by 10.140.176.130 with SMTP id w124mr36776437qhw.59.1450360431348;
        Thu, 17 Dec 2015 05:53:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si11428813qge.77.2015.12.17.05.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 05:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9Z0B-0006Ld-4r
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 08:53:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a9Yvi-0000W5-8r
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a9Yvd-0002mx-VQ
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:49:14 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:4792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a9Yvd-0002ls-BV; Thu, 17 Dec 2015 08:49:09 -0500
Received: from 172.24.1.49 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CYF49013; Thu, 17 Dec 2015 21:43:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Dec 2015 21:43:35 +0800
Message-ID: <5672BC05.3080402@huawei.com>
Date: Thu, 17 Dec 2015 21:43:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-11-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA8mxByuG1tTWKpcUUXKCh7yAH=AbB2WvgeyC2=9+0GJpQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8mxByuG1tTWKpcUUXKCh7yAH=AbB2WvgeyC2=9+0GJpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5672BC13.01F3, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 311d3b1b3783c6ee02afd0d66d3e5cb5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, QEMU
	Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 10/10] ARM: Virt: Add gpio-keys node for
 Poweroff using DT
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
X-TUID: YAmWxX+RqUEf



On 2015/12/17 21:39, Peter Maydell wrote:
> On 11 December 2015 at 03:21, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> >
>> > Add a gpio-keys node. This is used for Poweroff for the systems which
>> > use DT not ACPI.
>> >
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > Tested-by: Wei Huang <wei@redhat.com>
>> > ---
>> >  hw/arm/virt.c | 16 ++++++++++++++++
>> >  1 file changed, 16 insertions(+)
>> >
>> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> > index cb1d45b..bd6781bd 100644
>> > --- a/hw/arm/virt.c
>> > +++ b/hw/arm/virt.c
>> > @@ -52,6 +52,7 @@
>> >  #include "kvm_arm.h"
>> >  #include "hw/smbios/smbios.h"
>> >  #include "qapi/visitor.h"
>> > +#include <linux/input.h>
> You can't include <linux/> headers -- this will cause the build to
> fail on non-Linux hosts. You need "standard-headers/linux/input.h"
> (which is what I suggested you use initially).
> 
Oh, sorry for this.

> I'll fix this up in my tree.
Thanks!

-- 
Shannon

