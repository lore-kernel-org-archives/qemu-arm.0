Received: by 10.182.158.201 with SMTP id ww9csp870650obb;
        Thu, 10 Dec 2015 17:53:52 -0800 (PST)
X-Received: by 10.55.197.195 with SMTP id k64mr20741180qkl.25.1449798832142;
        Thu, 10 Dec 2015 17:53:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a13si17874381qkb.114.2015.12.10.17.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 17:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Cu7-0005T5-PI
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 20:53:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7Cu5-0005Sz-Vf
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 20:53:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7Cu2-0005Kg-Ql
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 20:53:49 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:40626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a7Cu2-0005KA-1u; Thu, 10 Dec 2015 20:53:46 -0500
Received: from 172.24.1.50 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAQ81048; Fri, 11 Dec 2015 09:52:13 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 11 Dec 2015 09:52:04 +0800
Message-ID: <566A2C42.1020308@huawei.com>
Date: Fri, 11 Dec 2015 09:52:02 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>	<1449473992-11560-7-git-send-email-zhaoshenglong@huawei.com>
	<20151210210929.6120156b@igors-macbook-pro.local>
In-Reply-To: <20151210210929.6120156b@igors-macbook-pro.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.566A2C4E.0100, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: daaf81133bf333d472d9bb438efecea1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 6/8] ARM: ACPI: Add _E03 for Power Button
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
X-TUID: HYYCL6q1zL+c



On 2015/12/11 4:09, Igor Mammedov wrote:
> On Mon, 7 Dec 2015 15:39:50 +0800
> Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> 
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.
>> > 
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > Tested-by: Wei Huang <wei@redhat.com>
>> > ---
>> >  hw/arm/virt-acpi-build.c | 14 ++++++++++++++
>> >  1 file changed, 14 insertions(+)
>> > 
>> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> > index 1424672..d693135 100644
>> > --- a/hw/arm/virt-acpi-build.c
>> > +++ b/hw/arm/virt-acpi-build.c
>> > @@ -338,6 +338,20 @@ static void acpi_dsdt_add_gpio(Aml *scope, const
>> > MemMapEntry *gpio_memmap, aml_append(crs, aml_interrupt(AML_CONSUMER,
>> > AML_LEVEL, AML_ACTIVE_HIGH, AML_EXCLUSIVE, gpio_irq));
>> >      aml_append(dev, aml_name_decl("_CRS", crs));
>> > +
>> > +    Aml *aei = aml_resource_template();
>> > +    /* Pin 3 for power button */
>> > +    const uint32_t pin_list[1] = {3};
>> > +    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
> looks like AML_CONSUMER_PRODUCER is wrong, ACPI6 spec says:
> "ResourceUsage is an optional argument and is assumed to be
> ResourceConsumer for this revision."
> 
Oh, yes. Will fix this later.
> 
>> > +                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE,
>> > AML_PULL_UP, 0,
>> > +                                 pin_list, 1, "GPO0", NULL, 0));
>> > +    aml_append(dev, aml_name_decl("_AEI", aei));
>> > +
>> > +    /* _E03 is handle for power button */
>> > +    Aml *method = aml_method("_E03", 0);
>> > +    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>> > +                                  aml_int(0x80)));
> could you include commit
> https://github.com/imammedo/qemu/commit/1b647d5534e8c8c8434574d1c0fe4c442b66c6b0
> in your series and rebase this patch to use a new am_method() signature.
> 
Sure
>> > +    aml_append(dev, method);
>> >      aml_append(scope, dev);
>> >  }
>> >  

-- 
Shannon

