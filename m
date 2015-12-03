Received: by 10.182.158.201 with SMTP id ww9csp29164obb;
        Thu, 3 Dec 2015 07:35:07 -0800 (PST)
X-Received: by 10.140.101.51 with SMTP id t48mr12152214qge.71.1449156907092;
        Thu, 03 Dec 2015 07:35:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n36si2954805qgn.11.2015.12.03.07.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4VuU-0000ro-Q2
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:35:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4VuS-0000qY-Jt
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:35:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4VuO-0005B0-ID
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:35:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a4VuO-0005AZ-BH; Thu, 03 Dec 2015 10:35:00 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D9BDC8F305;
	Thu,  3 Dec 2015 15:34:59 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB3FYvom032381; Thu, 3 Dec 2015 10:34:57 -0500
Date: Thu, 3 Dec 2015 16:34:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org
Message-ID: <20151203163456.6f014ee5@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-6-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-6-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-arm] [PATCH v3 5/8] hw/acpi/aml-build: Add a wrapper for
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
X-TUID: kjniPbuAMR+s

On Mon, 16 Nov 2015 21:23:06 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>

s/
hw/acpi/aml-build: Add a wrapper for GPIO Interrupt Connection
/
acpi: add aml_gpio_int() wrapper
/

> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 18 ++++++++++++++++++
>  include/hw/acpi/aml-build.h |  6 ++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 60d4703..8e18b22 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -626,6 +626,24 @@ static Aml *aml_gpio_connection(AmlGpioConnectionType type,
>  }
>  
>  /*
> + * ACPI 5.0: 19.5.53
> + * GpioInt(GPIO Interrupt Connection Resource Descriptor Macro)
> + */
> +Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
> +                  AmlLevelAndEdge level_and_edge,
to be closer to GpioInt descrition in spec:

s/level_and_edge/edge_level/

> +                  AmlActiveHighAndLow high_and_low, AmlShared shared,
s/high_and_low/active_level/
> +                  AmlPinConfig pin_cfg, int16_t debounce_timeout,
s/pin_cfg/pin_config/

> +                  int32_t pin_num[], int32_t pin_count, const char *name,
s/pin_num/pin_list/
s/name/resource_source{_name}/

> +                  const char *vendor_data)
> +{
> +    uint8_t flags = level_and_edge | (high_and_low << 1) | (shared << 3);
> +
> +    return aml_gpio_connection(AML_INTERRUPT_CONNECTION, con_and_pro, flags,
> +                               pin_cfg, 0, debounce_timeout, pin_num, pin_count,
> +                               name, vendor_data);
> +}
> +
> +/*
>   * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
>   * (Type 1, Large Item Name 0x6)
>   */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 4e88882..bce813b 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -232,6 +232,12 @@ Aml *aml_call1(const char *method, Aml *arg1);
>  Aml *aml_call2(const char *method, Aml *arg1, Aml *arg2);
>  Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
>  Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4);
> +Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
> +                  AmlLevelAndEdge level_and_edge,
> +                  AmlActiveHighAndLow high_and_low, AmlShared shared,
> +                  AmlPinConfig pin_cfg, int16_t debounce_timeout,
> +                  int32_t pin_num[], int32_t pin_count, const char *name,
> +                  const char *vendor_data);
>  Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
>                          AmlReadAndWrite read_and_write);
>  Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,

