Received: by 10.182.158.201 with SMTP id ww9csp2134205obb;
        Sun, 6 Dec 2015 23:18:21 -0800 (PST)
X-Received: by 10.140.220.136 with SMTP id q130mr36469834qhb.24.1449472701701;
        Sun, 06 Dec 2015 23:18:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si19914197qhr.90.2015.12.06.23.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5q3x-0003Mi-Aj
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:18:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5q3u-0003MP-EJ
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:18:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5q3r-0007iU-7x
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:18:18 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:43665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5q3q-0007hq-0S; Mon, 07 Dec 2015 02:18:15 -0500
Received: from 172.24.1.47 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSG28859; Mon, 07 Dec 2015 15:10:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1; Mon, 7 Dec 2015
	15:10:12 +0800
Message-ID: <566530D2.8030507@huawei.com>
Date: Mon, 7 Dec 2015 15:10:10 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, <shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>	<1447680189-2128-7-git-send-email-shannon.zhao@linaro.org>
	<20151204151004.7be15b36@nial.brq.redhat.com>
In-Reply-To: <20151204151004.7be15b36@nial.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090201.566530DF.0098, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2e54c8e657a70a6e4de76c17a2976d77
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/8] hw/arm/virt-acpi-build:
 Add _E03 for Power Button
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
X-TUID: aJZGs4WmVOev



On 2015/12/4 22:10, Igor Mammedov wrote:
> On Mon, 16 Nov 2015 21:23:07 +0800
> shannon.zhao@linaro.org wrote:
> 
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> Tested-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index b25c90b..12c9e8b 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -337,6 +337,19 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>>      aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
>>                                    AML_EXCLUSIVE, gpio_irq));
>>      aml_append(dev, aml_name_decl("_CRS", crs));
>> +
>> +    Aml *aei = aml_resource_template();
>> +    /* Pin 3 for power button */
>> +    int32_t pin_num[1] = {3};
>> +    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
>> +                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE, AML_PULL_UP, 0,
>> +                                 pin_num, 1, "GPO0", NULL));
>> +    aml_append(dev, aml_name_decl("_AEI", aei));
>> +
>> +    /* _E03 is handle for power button */
>> +    Aml *method = aml_method("_E03", 0);
>> +    aml_append(method, aml_notify(aml_name("PWRB"), aml_int(0x80)));
> you use "PWRB" here the second time, perhaps it would be better to use macro
> #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> 
Sure, thanks!

-- 
Shannon

