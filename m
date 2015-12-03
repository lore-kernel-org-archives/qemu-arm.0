Received: by 10.182.158.201 with SMTP id ww9csp17179obb;
        Thu, 3 Dec 2015 07:15:55 -0800 (PST)
X-Received: by 10.140.248.70 with SMTP id t67mr12337035qhc.97.1449155755082;
        Thu, 03 Dec 2015 07:15:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si2598210qga.87.2015.12.03.07.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Vbu-0003QO-OS
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4Vbr-0003OV-GW
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4Vbn-0003sT-DX
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:15:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a4Vbn-0003sP-6U; Thu, 03 Dec 2015 10:15:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E4E5E8F502;
	Thu,  3 Dec 2015 15:15:45 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB3FFhHt030116; Thu, 3 Dec 2015 10:15:43 -0500
Date: Thu, 3 Dec 2015 16:15:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org, mst@redhat.com
Message-ID: <20151203161541.60d53739@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-5-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-5-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-arm] [PATCH v3 4/8] hw/acpi/aml-build: Add GPIO
 Connection Descriptor
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
X-TUID: zia8uG5ppXNO

On Mon, 16 Nov 2015 21:23:05 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>

Subj can be shortened to:
 acpi: Add GPIO Connection Descriptor

> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 61 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h | 20 +++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index a00a0ab..60d4703 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -565,6 +565,67 @@ Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4)
>  }
>  
>  /*
> + * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
> + * Type 1, Large Item Name 0xC
> + */
> +
> +static Aml *aml_gpio_connection(AmlGpioConnectionType type,
> +                                AmlConsumerAndProducer con_and_pro,
> +                                uint8_t flags, AmlPinConfig pin_cfg,
> +                                int16_t output_drive, int16_t debounce_timeout,
> +                                int32_t pin_num[], int32_t pin_count,
Probably intFOO_t should be uintFOO_t.

s/pin_num/pin_list/
I've used a bit more complicated to make list of FOO integers, like this:
https://github.com/imammedo/qemu/commit/f6925e53aa2e0266a07dbb39ae17efbf13dba388

+    Aml *irqs = aml_interrupt_list();
+    aml_append_interrupt2list(irqs, uart_irq);
     aml_append(crs,
                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                             AML_EXCLUSIVE, uart_irq));
+                             AML_EXCLUSIVE, irqs));

but I like simpler array way you're using here,

Michael do you have any objection to passing IRQ/PIN lists as arrays
like this patch does?

> +                                const char *name, const char *vendor_data)
s/name/resource_src_name/
s/const char *vendor_data/const uint8_t *vendor_data/

> +{
> +    Aml *var = aml_alloc();
> +    uint16_t name_len = name ? (strlen(name) + 1) : 0;
name doesn't seem to optional so case 'name == NULL' should be invalid,
add assert(name) and drop condition

> +    uint16_t vendor_data_len = vendor_data ? (strlen(vendor_data) + 1) : 0;
vendor_data is binary blob so you can't use strlen() on it.

> +    uint16_t length = 0x16 + name_len + vendor_data_len;
s/0x16/const min_desc_len = 0x16/

> +    uint16_t name_offset = 0x17 + pin_count * 2;
and then use it here and below for calculating pin_table_offset

> +    uint16_t vendor_data_offset = name_offset + name_len;
> +    int i;
> +
> +    build_append_byte(var->buf, 0x8C);  /* GpioInt Resource Descriptor */
CpioInt is wrong, it should be "GPIO Connection Descriptor"

> +    build_append_int_noprefix(var->buf, length, 2); /* Length */
> +    build_append_byte(var->buf, 1);     /* Revision ID */
> +    build_append_byte(var->buf, type);  /* GPIO Connection Type */
> +    /* General Flags (2 bytes) */
> +    build_append_int_noprefix(var->buf, con_and_pro, 2);
> +    /* Interrupt and IO Flags (2 bytes) */
> +    build_append_int_noprefix(var->buf, flags, 2);
> +    /* Pin Configuration 0 = Default 1 = Pull-up 2 = Pull-down 3 = No Pull */
> +    build_append_byte(var->buf, pin_cfg);
> +    /* Output Drive Strength (2 bytes) */
> +    build_append_int_noprefix(var->buf, output_drive, 2);
> +    /* Debounce Timeout (2 bytes) */
> +    build_append_int_noprefix(var->buf, debounce_timeout, 2);
> +    /* Pin Table Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, 0x17, 2);
> +    build_append_byte(var->buf, 0);     /* Resource Source Index */
> +    /* Resource Source Name Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, name_offset, 2);
> +    /* Vendor Data Offset (2 bytes) */
> +    build_append_int_noprefix(var->buf, vendor_data_offset, 2);
> +    /* Vendor Data Length (2 bytes) */
> +    build_append_int_noprefix(var->buf, vendor_data_len, 2);
> +    /* Pin Number (2n bytes)*/
> +    for (i = 0; i < pin_count; i++) {
> +        build_append_int_noprefix(var->buf, pin_num[i], 2);
> +    }
> +    /* Resource Source Name */
> +    if (name != NULL) {
name shouldn't be NULL ever, so drop it

> +        build_append_namestring(var->buf, "%s", name);
> +        build_append_byte(var->buf, '\0');
> +    }
> +    /* Vendor-defined Data */
> +    if (vendor_data != NULL) {
> +        build_append_namestring(var->buf, "%s", vendor_data);
> +        build_append_byte(var->buf, '\0');
> +    }
that's wrong, vendor_data is RawDataBuffer and not NameString
following would do the right thing:
  g_array_append_vals(var->buf, vendor_data, vendor_data_len);

> +
> +    return var;
> +}
> +
> +/*
>   * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
>   * (Type 1, Large Item Name 0x6)
>   */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1b632dc..4e88882 100644
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
> +    AML_DEFAULT_CONFIG = 0,
I'd suggest to use AML_PULL_DEFAULT as it's mentioned in spec (see GpioInt/GpioIO)

> +    AML_PULL_UP = 1,
> +    AML_PULL_DOWN = 2,
> +    AML_NO_PULL = 3,
Likewise AML_PULL_NONE

> +} AmlPinConfig;
> +
>  typedef
>  struct AcpiBuildTables {
>      GArray *table_data;

