Received: by 10.182.158.201 with SMTP id ww9csp2299777obb;
        Tue, 1 Dec 2015 05:13:26 -0800 (PST)
X-Received: by 10.140.93.52 with SMTP id c49mr80614415qge.101.1448975606881;
        Tue, 01 Dec 2015 05:13:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w200si29881334qhb.78.2015.12.01.05.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 05:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3kkI-00064G-MY
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 08:13:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a3kkC-00062R-Is
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 08:13:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a3kk9-0007Yo-91
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 08:13:20 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:19900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a3kk8-0007Xr-FE; Tue, 01 Dec 2015 08:13:17 -0500
Received: from 172.24.1.51 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BRX66166; Tue, 01 Dec 2015 21:13:08 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Dec 2015
	21:12:58 +0800
Message-ID: <565D9CD8.1090605@huawei.com>
Date: Tue, 1 Dec 2015 21:12:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>	<1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>	<20151201124127.1045c90c@nial.brq.redhat.com>	<565D95F8.5040805@huawei.com>
	<20151201140532.340805f8@nial.brq.redhat.com>
In-Reply-To: <20151201140532.340805f8@nial.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.565D9CE8.008B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e7e0551c15d51bef6c84060e26f01bde
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
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
X-TUID: cMWfT8YOOimZ

Hi Igor,

On 2015/12/1 21:05, Igor Mammedov wrote:
>>>>> +static void acpi_dsdt_add_power_button(Aml *scope)
>>>>> > >> > +{
>>>>> > >> > +    Aml *dev = aml_device("PWRB");
>>>>> > >> > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
>>>>> > >> > +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>>> > >> > +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>>> > >> > +    Aml *method = aml_method("_STA", 0);
>>>>> > >> > +    aml_append(method, aml_return(aml_int(0x0F)));
>>>>> > >> > +    aml_append(dev, method);
>>> > > since _STA always returns 0xF you can just drop it altogether,
>>> > > as _STA == 0xF is implied if it's not present.
>>> > > 
>> > 
>> > Yes, but I think adding this is harmless and make the return value explicit.
> It's useless and consumes several bytes, it's better to drop it unless you have to have it.
> 
Sure, will drop it. :)

BTW, could you have a look at other ACPI patches in this series? Thanks
in advance!

-- 
Shannon

