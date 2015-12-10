Received: by 10.182.158.201 with SMTP id ww9csp721700obb;
        Thu, 10 Dec 2015 12:16:54 -0800 (PST)
X-Received: by 10.55.77.134 with SMTP id a128mr18167036qkb.104.1449778614739;
        Thu, 10 Dec 2015 12:16:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i20si16420146qhc.34.2015.12.10.12.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 12:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a77e2-0000iy-Cw
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 15:16:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77e0-0000fl-4o
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:16:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77dx-0003qA-03
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:16:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a77dw-0003py-Ot; Thu, 10 Dec 2015 15:16:48 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 62728C0D2250;
	Thu, 10 Dec 2015 20:16:48 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAKGisb031219; Thu, 10 Dec 2015 15:16:45 -0500
Date: Thu, 10 Dec 2015 21:16:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151210211641.4b93b130@igors-macbook-pro.local>
In-Reply-To: <1449473992-11560-6-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-6-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 5/8] ACPI: Add aml_gpio_int() wrapper for
 GPIO Interrupt Connection
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
X-TUID: cRxS5MUtYV+q

On Mon, 7 Dec 2015 15:39:49 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/aml-build.c         | 20 ++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4e1469a..41ac5db 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -633,6 +633,26 @@ static Aml
> *aml_gpio_connection(AmlGpioConnectionType type, }
>  
>  /*
> + * ACPI 5.0: 19.5.53
> + * GpioInt(GPIO Interrupt Connection Resource Descriptor Macro)
> + */
> +Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
> +                  AmlLevelAndEdge edge_level,
> +                  AmlActiveHighAndLow active_level, AmlShared shared,
> +                  AmlPinConfig pin_config, uint16_t debounce_timeout,
> +                  const uint32_t pin_list[], uint32_t pin_count,
> +                  const char *resource_source_name,
> +                  const uint8_t *vendor_data, uint16_t
> vendor_data_len) +{
> +    uint8_t flags = edge_level | (active_level << 1) | (shared << 3);
> +
> +    return aml_gpio_connection(AML_INTERRUPT_CONNECTION,
> con_and_pro, flags,
> +                               pin_config, 0, debounce_timeout,
> pin_list,
> +                               pin_count, resource_source_name,
> vendor_data,
> +                               vendor_data_len);
> +}
> +
> +/*
>   * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
>   * (Type 1, Large Item Name 0x6)
>   */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index a8dba9e..41ffe29 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -232,6 +232,13 @@ Aml *aml_call1(const char *method, Aml *arg1);
>  Aml *aml_call2(const char *method, Aml *arg1, Aml *arg2);
>  Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
>  Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3,
> Aml *arg4); +Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
> +                  AmlLevelAndEdge edge_level,
> +                  AmlActiveHighAndLow active_level, AmlShared shared,
> +                  AmlPinConfig pin_config, uint16_t debounce_timeout,
> +                  const uint32_t pin_list[], uint32_t pin_count,
> +                  const char *resource_source_name,
> +                  const uint8_t *vendor_data, uint16_t
> vendor_data_len); Aml *aml_memory32_fixed(uint32_t addr, uint32_t
> size, AmlReadAndWrite read_and_write);
>  Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,

