Received: by 10.182.158.201 with SMTP id ww9csp3265911obb;
        Wed, 16 Dec 2015 08:08:08 -0800 (PST)
X-Received: by 10.140.29.7 with SMTP id a7mr60568856qga.6.1450282088068;
        Wed, 16 Dec 2015 08:08:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v83si7054941qhv.85.2015.12.16.08.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 08:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:48069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9EcZ-0002lP-LD
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 11:08:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9EcX-0002k4-Oi
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 11:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9EcW-0003NN-Fl
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 11:08:05 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9EcV-0003NC-V2
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 11:08:04 -0500
Received: by mail-vk0-x22b.google.com with SMTP id j66so28837813vkg.1
	for <qemu-arm@nongnu.org>; Wed, 16 Dec 2015 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S6NqqybtI0lN0h649jxj66rscyhMjSCRBZQU2dsMTog=;
	b=U1N13UHvz7O+5BVXjUknWZ9RqwpCVR6sD7N29/V6ywm1sb3BQMeXt1MIoPtfiAVB0q
	roH7LUzcQzON8/ECvGF5CgoWYU9NiVuTHgAZKDpNRGbrrBdF4/wIFlMtS/pd92GjskCp
	DwNAE9P7rHcbOLguT5rZ3eDlxw7NAJHL2zPis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=S6NqqybtI0lN0h649jxj66rscyhMjSCRBZQU2dsMTog=;
	b=jF/CIJhml1Wra/1+smrCS8or1M+liNy/fdyCsxzhdOiOEwqS6/e+9blB39DA9rUKfD
	C2MRH3MkW2GfbZDOODast2RFvVCYhbTs44nlbdbiINbo58PZB3G1QrnVeZ9f/0h568JD
	BgjW8GJlWuHP01V4hvz9FmAR3upl6Wa9X4XAD775cXnFOoIopBHjrm40d5M1H3xAvZcj
	r7KP6AoMZkTYX5N6DTgJsRRDZon3YV8s+9koUWV0WeUg1GqMAsBQVk4xqVVhBFAtSl9q
	CVm3xklJvozzru0PfZpjDWuPeaJZZFCmnwVzjtOFYXt0ak3XHaovyiDPEE9H8hbfeJPp
	DW7w==
X-Gm-Message-State: ALoCoQk5B5C2tqFQGjoATOwEeb9OTO34Jlwcv0VdtzBdQ9FnIAe605VAYLHlw3CqqPDZttoVGs6ye0fPiS435dGca12kY4e7+CYLoyk7m2s+/yurCMSAAlI=
X-Received: by 10.31.52.211 with SMTP id b202mr34988750vka.82.1450282083531;
	Wed, 16 Dec 2015 08:08:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 16 Dec 2015 08:07:44 -0800 (PST)
In-Reply-To: <20151216165115.09fa7939@igors-macbook-pro.local>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-9-git-send-email-zhaoshenglong@huawei.com>
	<20151216165115.09fa7939@igors-macbook-pro.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2015 16:07:44 +0000
Message-ID: <CAFEAcA-eSBGLU-hOUFQXFu8YeUEhBd7T9oZGZgKo6fUFv3_U7g@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH v5 08/10] ARM: ACPI: Add _E03 for Power Button
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
X-TUID: cTROZWqe5vbp

On 16 December 2015 at 15:51, Igor Mammedov <imammedo@redhat.com> wrote:
> On Fri, 11 Dec 2015 11:21:24 +0800
> Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> Tested-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index e5dc2d5..1ffff62 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -339,6 +339,20 @@ static void acpi_dsdt_add_gpio(Aml *scope, const
>> MemMapEntry *gpio_memmap, aml_append(crs, aml_interrupt(AML_CONSUMER,
>> AML_LEVEL, AML_ACTIVE_HIGH, AML_EXCLUSIVE, &gpio_irq, 1));
>>      aml_append(dev, aml_name_decl("_CRS", crs));
>> +
>> +    Aml *aei = aml_resource_template();
>> +    /* Pin 3 for power button */
>> +    const uint32_t pin_list[1] = {3};
> Sorry, just noticed,
> do we allow declarations in the middle of the block?
> The same applies to 'Aml *method' below.

No, we prefer not to, but the file is full of them already...

thanks
-- PMM
