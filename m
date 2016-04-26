Received: by 10.25.208.194 with SMTP id h185csp1436338lfg;
        Tue, 26 Apr 2016 04:08:58 -0700 (PDT)
X-Received: by 10.140.233.135 with SMTP id e129mr1493844qhc.86.1461668938087;
        Tue, 26 Apr 2016 04:08:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q205si13382315qhq.67.2016.04.26.04.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 04:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av0rR-0002T5-DF
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 07:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1av0rJ-0002Hu-3C
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 07:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1av0rF-0004MW-Qy
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 07:08:49 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:25947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1av0rF-0004LQ-8c; Tue, 26 Apr 2016 07:08:45 -0400
Received: from 172.24.1.60 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAP04502; Tue, 26 Apr 2016 19:08:35 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 26 Apr 2016 19:08:26 +0800
Message-ID: <571F4C29.8030503@huawei.com>
Date: Tue, 26 Apr 2016 19:08:25 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Shannon Zhao <shannon.zhao@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-4-git-send-email-zhaoshenglong@huawei.com>
	<20160425124232.zdjgvmwrykkrouas@hawk.localdomain>
	<571E205E.3040508@linaro.org>
In-Reply-To: <571E205E.3040508@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.571F4C35.000E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2463ea3284f6ee441dee37030b06b352
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/3] hw/arm/virt-acpi-build:
 Add PMU IRQ number in ACPI table
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGNaowGk+tGA



On 2016/4/25 21:49, Shannon Zhao wrote:
> On 2016年04月25日 20:42, Andrew Jones wrote:
>> > On Mon, Apr 25, 2016 at 03:11:46PM +0800, Shannon Zhao wrote:
>>>> >> > From: Shannon Zhao <shannon.zhao@linaro.org>
>>>> >> > 
>>>> >> > Add PMU IRQ number in ACPI table, then we can use PMU in guest through
>>>> >> > ACPI.
>>>> >> > 
>>>> >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>>>> >> > Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> >> > ---
>>>> >> >  hw/arm/virt-acpi-build.c | 3 +++
>>>> >> >  1 file changed, 3 insertions(+)
>> > Question: for testing of this, did you use
>> > https://lkml.org/lkml/2016/4/12/755 ?
> Actually I didn't test PMU with ACPI since I didn't notice the patch
> series you point out and it's very obvious for QEMU changes(adding irq
> flag and irq number in GICC). I will have a test later.

I have test this patch series using ACPI and guest with the patches you
point out. Guest prints below logs and perf works well in guest.

[    0.000000] ACPI-PMU: Assign CPU 0 girq 23 level 0
[    0.000000] ACPI-PMU: Assign CPU 1 girq 23 level 0
[    0.000000] ACPI-PMU: Assign CPU 2 girq 23 level 0
[    0.000000] ACPI-PMU: Assign CPU 3 girq 23 level 0
[...]
[    0.094782] ACPI-PMU: Setting up 4 PMUs for CPU type D07

Thanks,
-- 
Shannon

