Received: by 10.182.158.201 with SMTP id ww9csp3255159obb;
        Wed, 16 Dec 2015 07:51:29 -0800 (PST)
X-Received: by 10.141.28.80 with SMTP id f77mr53824900qhe.66.1450281089655;
        Wed, 16 Dec 2015 07:51:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si7002287qhc.114.2015.12.16.07.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 07:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9EMT-0003oW-7C
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 10:51:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a9EMQ-0003oM-UU
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 10:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a9EMO-0006no-4y
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 10:51:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a9EMN-0006nd-VE; Wed, 16 Dec 2015 10:51:24 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 78F228E931;
	Wed, 16 Dec 2015 15:51:22 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-58.brq.redhat.com
	[10.40.204.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBGFpIRk001669; Wed, 16 Dec 2015 10:51:19 -0500
Date: Wed, 16 Dec 2015 16:51:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151216165115.09fa7939@igors-macbook-pro.local>
In-Reply-To: <1449804086-3464-9-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-9-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
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
X-TUID: T2h2F514DSVu

On Fri, 11 Dec 2015 11:21:24 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e5dc2d5..1ffff62 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -339,6 +339,20 @@ static void acpi_dsdt_add_gpio(Aml *scope, const
> MemMapEntry *gpio_memmap, aml_append(crs, aml_interrupt(AML_CONSUMER,
> AML_LEVEL, AML_ACTIVE_HIGH, AML_EXCLUSIVE, &gpio_irq, 1));
>      aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *aei = aml_resource_template();
> +    /* Pin 3 for power button */
> +    const uint32_t pin_list[1] = {3};
Sorry, just noticed,
do we allow declarations in the middle of the block?
The same applies to 'Aml *method' below.

> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE,
> AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0,
> pin_list, 1,
> +                                 "GPO0", NULL, 0));
> +    aml_append(dev, aml_name_decl("_AEI", aei));
> +
> +    /* _E03 is handle for power button */
> +    Aml *method = aml_method("_E03", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> +                                  aml_int(0x80)));
> +    aml_append(dev, method);
>      aml_append(scope, dev);
>  }
>  

