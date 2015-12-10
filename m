Received: by 10.182.158.201 with SMTP id ww9csp717741obb;
        Thu, 10 Dec 2015 12:09:45 -0800 (PST)
X-Received: by 10.55.76.22 with SMTP id z22mr17934928qka.89.1449778185100;
        Thu, 10 Dec 2015 12:09:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j64si16356009qgj.115.2015.12.10.12.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 12:09:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a77X6-0004W6-MQ
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 15:09:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77X4-0004Ut-6h
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:09:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77X1-0002Ht-01
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:09:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a77X0-0002Hh-R7; Thu, 10 Dec 2015 15:09:38 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id BE8BE42E5D6;
	Thu, 10 Dec 2015 20:09:37 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAK9XiK018028; Thu, 10 Dec 2015 15:09:34 -0500
Date: Thu, 10 Dec 2015 21:09:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151210210929.6120156b@igors-macbook-pro.local>
In-Reply-To: <1449473992-11560-7-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-7-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-TUID: p9zdfjiG3z/q

On Mon, 7 Dec 2015 15:39:50 +0800
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
> index 1424672..d693135 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -338,6 +338,20 @@ static void acpi_dsdt_add_gpio(Aml *scope, const
> MemMapEntry *gpio_memmap, aml_append(crs, aml_interrupt(AML_CONSUMER,
> AML_LEVEL, AML_ACTIVE_HIGH, AML_EXCLUSIVE, gpio_irq));
>      aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *aei = aml_resource_template();
> +    /* Pin 3 for power button */
> +    const uint32_t pin_list[1] = {3};
> +    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
looks like AML_CONSUMER_PRODUCER is wrong, ACPI6 spec says:
"ResourceUsage is an optional argument and is assumed to be
ResourceConsumer for this revision."


> +                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE,
> AML_PULL_UP, 0,
> +                                 pin_list, 1, "GPO0", NULL, 0));
> +    aml_append(dev, aml_name_decl("_AEI", aei));
> +
> +    /* _E03 is handle for power button */
> +    Aml *method = aml_method("_E03", 0);
> +    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> +                                  aml_int(0x80)));
could you include commit
https://github.com/imammedo/qemu/commit/1b647d5534e8c8c8434574d1c0fe4c442b66c6b0
in your series and rebase this patch to use a new am_method() signature.

> +    aml_append(dev, method);
>      aml_append(scope, dev);
>  }
>  

