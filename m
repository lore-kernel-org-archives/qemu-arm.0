Received: by 10.182.158.201 with SMTP id ww9csp282103obb;
        Fri, 27 Nov 2015 19:07:04 -0800 (PST)
X-Received: by 10.140.224.207 with SMTP id u198mr9971436qhb.67.1448680024787;
        Fri, 27 Nov 2015 19:07:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si34299466qge.70.2015.11.27.19.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 19:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2Vqq-0004kJ-Gj
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 22:07:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2Vqo-0004je-JR
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 22:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2Vql-0006Su-EE
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 22:07:02 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:37389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a2Vqk-0006Rl-LX; Fri, 27 Nov 2015 22:06:59 -0500
Received: from 172.24.1.51 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BRT31156; Sat, 28 Nov 2015 11:06:50 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml422-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 28 Nov 2015 11:06:40 +0800
Message-ID: <56591A3E.5080808@huawei.com>
Date: Sat, 28 Nov 2015 11:06:38 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
	<shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-9-git-send-email-shannon.zhao@linaro.org>
	<CAFEAcA9YFWMb6B5qzuBpgmjn3b1f_JtEa+atUSiSkz-tyPF1TQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9YFWMb6B5qzuBpgmjn3b1f_JtEa+atUSiSkz-tyPF1TQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.56591A4B.0032, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f43e5368486ba2c5f07ab78d15aa24ac
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, "Huangpeng
	\(Peter\)" <peter.huangpeng@huawei.com>, qemu-arm@nongnu.org, Igor
	Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 8/8] hw/arm/virt: Add gpio-keys node for
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
X-TUID: OyR0gIis8JZd



On 2015/11/28 1:16, Peter Maydell wrote:
> On 16 November 2015 at 13:23,  <shannon.zhao@linaro.org> wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Add a gpio-keys node. This is used for Poweroff for the systems which
>> use DT not ACPI.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> Tested-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index cb1d45b..3394262 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -561,6 +561,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
>>
>>      pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
>>
>> +    uint32_t phandle = qemu_fdt_alloc_phandle(vbi->fdt);
>>      nodename = g_strdup_printf("/pl061@%" PRIx64, base);
>>      qemu_fdt_add_subnode(vbi->fdt, nodename);
>>      qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
>> @@ -573,6 +574,20 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
>>                             GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>>      qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
>>      qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
>> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "phandle", phandle);
>> +
>> +    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys");
>> +    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys", "compatible", "gpio-keys");
>> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#size-cells", 0);
>> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#address-cells", 1);
>> +    qemu_fdt_setprop(vbi->fdt, "/gpio-keys", "autorepeat", NULL, 0);
> 
> Why would we want the power button to autorepeat ?
> 
Oh, it doesn't need. Will remove it.

>> +
>> +    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys/poweroff");
>> +    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys/poweroff",
>> +                            "label", "GPIO Key Poweroff");
>> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys/poweroff", "linux,code", 116);
> 
> This could use a comment /* KEY_POWER */ to indicate what 116 is.
> (Alternatively, see whether we can #include "standard-headers/linux/input.h"
> which #defines KEY_POWER.)
> 
Ok, it could include the linux/input.h here.

Thanks,
-- 
Shannon

