Received: by 10.182.158.201 with SMTP id ww9csp643741obb;
        Fri, 4 Dec 2015 06:10:16 -0800 (PST)
X-Received: by 10.140.25.145 with SMTP id 17mr19084567qgt.96.1449238216799;
        Fri, 04 Dec 2015 06:10:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si13579499qgy.36.2015.12.04.06.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Dec 2015 06:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4r3w-0007ry-Iy
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 09:10:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4r3r-0007r4-Vz
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 09:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4r3o-0006uw-JM
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 09:10:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a4r3o-0006uk-Dl; Fri, 04 Dec 2015 09:10:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id C36A75D;
	Fri,  4 Dec 2015 14:10:07 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB4EA5OK001160; Fri, 4 Dec 2015 09:10:05 -0500
Date: Fri, 4 Dec 2015 15:10:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org
Message-ID: <20151204151004.7be15b36@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-7-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-7-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
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
X-TUID: u2N0LWszb0dm

On Mon, 16 Nov 2015 21:23:07 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b25c90b..12c9e8b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -337,6 +337,19 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
>                                    AML_EXCLUSIVE, gpio_irq));
>      aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *aei = aml_resource_template();
> +    /* Pin 3 for power button */
> +    int32_t pin_num[1] = {3};
> +    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
> +                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE, AML_PULL_UP, 0,
> +                                 pin_num, 1, "GPO0", NULL));
> +    aml_append(dev, aml_name_decl("_AEI", aei));
> +
> +    /* _E03 is handle for power button */
> +    Aml *method = aml_method("_E03", 0);
> +    aml_append(method, aml_notify(aml_name("PWRB"), aml_int(0x80)));
you use "PWRB" here the second time, perhaps it would be better to use macro
#define ACPI_POWER_BUTTON_DEVICE "PWRB"

> +    aml_append(dev, method);
>      aml_append(scope, dev);
>  }
>  

