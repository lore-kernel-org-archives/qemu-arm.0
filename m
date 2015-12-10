Received: by 10.182.158.201 with SMTP id ww9csp720512obb;
        Thu, 10 Dec 2015 12:14:39 -0800 (PST)
X-Received: by 10.140.22.212 with SMTP id 78mr17885380qgn.17.1449778479477;
        Thu, 10 Dec 2015 12:14:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a59si16453865qgf.42.2015.12.10.12.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 12:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a77bq-0007Ec-UL
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 15:14:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77bo-0007EJ-Gq
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:14:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77bl-0003Q9-AQ
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:14:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a77bl-0003Q4-2z; Thu, 10 Dec 2015 15:14:33 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B956335731B;
	Thu, 10 Dec 2015 20:14:32 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAKESKB009391; Thu, 10 Dec 2015 15:14:29 -0500
Date: Thu, 10 Dec 2015 21:14:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151210211423.6341846f@igors-macbook-pro.local>
In-Reply-To: <1449473992-11560-5-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 4/8] ACPI: Add GPIO Connection Descriptor
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
X-TUID: +Z1gWlfJPDDK

On Mon, 7 Dec 2015 15:39:48 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/aml-build.c         | 68
> +++++++++++++++++++++++++++++++++++++++++++++
> include/hw/acpi/aml-build.h | 20 +++++++++++++ 2 files changed, 88
> insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index a00a0ab..4e1469a 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -565,6 +565,74 @@ Aml *aml_call4(const char *method, Aml *arg1,
> Aml *arg2, Aml *arg3, Aml *arg4) }
>  
>  /*
> + * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
> + * Type 1, Large Item Name 0xC
> + */
> +
> +static Aml *aml_gpio_connection(AmlGpioConnectionType type,
> +                                AmlConsumerAndProducer con_and_pro,
> +                                uint8_t flags, AmlPinConfig
> pin_config,
> +                                uint16_t output_drive,
> +                                uint16_t debounce_timeout,
> +                                const uint32_t pin_list[], uint32_t
> pin_count,
> +                                const char *resource_source_name,
> +                                const uint8_t *vendor_data,
> +                                uint16_t vendor_data_len)
> +{
> +    Aml *var = aml_alloc();
> +    const uint16_t min_desc_len = 0x16;
> +    uint16_t resource_source_name_len, length;
> +    uint16_t pin_table_offset, resource_source_name_offset,
> vendor_data_offset;
> +    uint32_t i;
> +
> +    assert(resource_source_name);
> +    resource_source_name_len = strlen(resource_source_name) + 1;
> +    length = min_desc_len + resource_source_name_len +
> vendor_data_len;
> +    pin_table_offset = min_desc_len + 1;
> +    resource_source_name_offset = pin_table_offset + pin_count * 2;
> +    vendor_data_offset = resource_source_name_offset +
> resource_source_name_len; +
> +    build_append_byte(var->buf, 0x8C);  /* GPIO Connection
> Descriptor */
> +    build_append_int_noprefix(var->buf, length, 2); /* Length */
> +    build_append_byte(var->buf, 1);     /* Revision ID */
> +    build_append_byte(var->buf, type);  /* GPIO Connection Type */
> +    /* General Flags (2 bytes) */
> +    build_append_int_noprefix(var->buf, con_and_pro, 2);
> +    /* Interrupt and IO Flags (2 bytes) */
> +    build_append_int_noprefix(var->buf, flags, 2);
> +    /* Pin Configuration 0 = Default 1 = Pull-up 2 = Pull-down 3 =
> No Pull */
> +    build_append_byte(var->buf, pin_config);
> +    /* Output Drive Strength (2 bytes) */
> +    build_append_int_noprefix(var->buf, output_drive, 2);
> +    /* Debounce Timeout (2 bytes) */
> +    build_append_int_noprefix(var->buf, debounce_timeout, 2);
> +    /* Pin Table Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, pin_table_offset, 2);
> +    build_append_byte(var->buf, 0);     /* Resource Source Index */
> +    /* Resource Source Name Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, resource_source_name_offset,
> 2);
> +    /* Vendor Data Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, vendor_data_offset, 2);
> +    /* Vendor Data Length (2 bytes) */
> +    build_append_int_noprefix(var->buf, vendor_data_len, 2);
> +    /* Pin Number (2n bytes)*/
> +    for (i = 0; i < pin_count; i++) {
> +        build_append_int_noprefix(var->buf, pin_list[i], 2);
> +    }
> +
> +    /* Resource Source Name */
> +    build_append_namestring(var->buf, "%s", resource_source_name);
> +    build_append_byte(var->buf, '\0');
> +
> +    /* Vendor-defined Data */
> +    if (vendor_data != NULL) {
> +        g_array_append_vals(var->buf, vendor_data, vendor_data_len);
> +    }
> +
> +    return var;
> +}
> +
> +/*
>   * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
>   * (Type 1, Large Item Name 0x6)
>   */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1b632dc..a8dba9e 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -148,6 +148,26 @@ typedef enum {
>      AML_SHARED_AND_WAKE = 3,
>  } AmlShared;
>  
> +/*
> + * ACPI 5.0: Table 6-189 GPIO Connection Descriptor Definition
> + * GPIO Connection Type
> + */
> +typedef enum {
> +    AML_INTERRUPT_CONNECTION = 0,
> +    AML_IO_CONNECTION = 1,
> +} AmlGpioConnectionType;
> +
> +/*
> + * ACPI 5.0: Table 6-189 GPIO Connection Descriptor Definition
> + * _PPI field definition
> + */
> +typedef enum {
> +    AML_PULL_DEFAULT = 0,
> +    AML_PULL_UP = 1,
> +    AML_PULL_DOWN = 2,
> +    AML_PULL_NONE = 3,
> +} AmlPinConfig;
> +
>  typedef
>  struct AcpiBuildTables {
>      GArray *table_data;

