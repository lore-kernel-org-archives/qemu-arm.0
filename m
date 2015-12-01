Received: by 10.182.158.201 with SMTP id ww9csp2282879obb;
        Tue, 1 Dec 2015 04:44:01 -0800 (PST)
X-Received: by 10.140.106.201 with SMTP id e67mr71055496qgf.80.1448973841578;
        Tue, 01 Dec 2015 04:44:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si50030313qkz.107.2015.12.01.04.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 04:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3kHp-0005Hp-9A
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 07:44:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a3kHm-0005He-UD
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 07:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a3kHi-0006TR-PI
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 07:43:58 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:20938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a3kHi-0006Sf-4q; Tue, 01 Dec 2015 07:43:54 -0500
Received: from 172.24.1.47 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAA53215; Tue, 01 Dec 2015 20:43:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Dec 2015
	20:43:39 +0800
Message-ID: <565D95F8.5040805@huawei.com>
Date: Tue, 1 Dec 2015 20:43:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, <shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>	<1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>
	<20151201124127.1045c90c@nial.brq.redhat.com>
In-Reply-To: <20151201124127.1045c90c@nial.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.565D9602.01BE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 82fcd04ff75aba19a12b477817290475
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/8] hw/arm/virt-acpi-build:
 Add power button device in ACPI DSDT table
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
X-TUID: o4Gr7Dxoc8iW

Hi Igor,

On 2015/12/1 19:41, Igor Mammedov wrote:
> On Mon, 16 Nov 2015 21:23:04 +0800
> shannon.zhao@linaro.org wrote:
> 
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add power button device in ACPI DSDT table.
>> > 
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > Reviewed-by: Wei Huang <wei@redhat.com>
>> > Tested-by: Wei Huang <wei@redhat.com>
>> > ---
>> >  hw/arm/virt-acpi-build.c | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> > 
>> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> > index bf6b934..b25c90b 100644
>> > --- a/hw/arm/virt-acpi-build.c
>> > +++ b/hw/arm/virt-acpi-build.c
>> > @@ -340,6 +340,18 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>> >      aml_append(scope, dev);
>> >  }
>> >  
>> > +static void acpi_dsdt_add_power_button(Aml *scope)
>> > +{
>> > +    Aml *dev = aml_device("PWRB");
>> > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
>> > +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>> > +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>> > +    Aml *method = aml_method("_STA", 0);
>> > +    aml_append(method, aml_return(aml_int(0x0F)));
>> > +    aml_append(dev, method);
> since _STA always returns 0xF you can just drop it altogether,
> as _STA == 0xF is implied if it's not present.
> 

Yes, but I think adding this is harmless and make the return value explicit.

Thanks,
-- 
Shannon

