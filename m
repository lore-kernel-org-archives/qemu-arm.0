Received: by 10.28.71.27 with SMTP id u27csp4784318wma;
        Tue, 27 Feb 2018 04:49:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELtNMr2hNw2CGcmq7TW7In451F3F9u++YbT+upzfPbNgjXLv7KkiSAeH3enm+KFnThJac+ya
X-Received: by 10.129.154.200 with SMTP id r191mr9157516ywg.311.1519735758561;
        Tue, 27 Feb 2018 04:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519735758; cv=none;
        d=google.com; s=arc-20160816;
        b=1Fuwov20eyCJ8dXBnEn3lAUOseKQROOkvBIwRebqMDI36XW7Z0FWU7FdvXu5xC5OYH
         Bl9571jrR7gUKx6CzuzrvbO4EM0vwxIi/dt27At0Cxv2Tp78OvWcL7o52CHynYzw8g39
         xpXxWRsMGjZla5UgeJayN1OUzL7iYvxVpnxrBgeDy9MFTEfP2vjLgV8LtDk4/icn8MLH
         YFthqVfwA698Xm/h+apM0KJi8+SAyegbcFJArJFa2iETY790K4Z571jOO8BXnuqzWbof
         6tpD40wBo5J8BZQRpGOugJrH4LTuvOssqfV7Ses3v/Gw9YBwOuNJ7uCyoKXuldEnOBng
         g5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ugy2jmzvMQBxVlbw2r5IU8PHBhaHob9/HBhnyFuHayU=;
        b=ieAwGG+4VcYiy7bxojoYcI0kMwqI59K77rUdNsWZcZ10uK4AL/RcX6lg/tjgCiyPjh
         wT+NAkeANvDnSAjwQNlrahbpLVXMe1lJIUzPdgWYIpx20Ep7p4rEW5FG1CcA3Duqid9m
         7EiUa367N+jhmmz8IlkyuQuiqt3K42BCqfXxmE+wvXvHz8A0sbDDQvCpxUVzCKYFjdZN
         xXOniocYY/yyDrMVz1qpHJdcoHvWaqYry+jXrJ192qeH9K6zGWuS/LGz/xNVbmPatiRT
         8R/zMkMOl3gT6WK3EmpgG6kpE4VEQhb8QEVBBPGSzwAKOou3ChDgfDS5ha335nagVGes
         FXYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r197si1831979ywg.660.2018.02.27.04.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 04:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqeh4-0006Mo-2R
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 07:49:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqegu-0006MO-Ce
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqegp-000584-Fo
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:49:08 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51004 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqegp-00057r-9v; Tue, 27 Feb 2018 07:49:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B991340201A5;
	Tue, 27 Feb 2018 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9802B2166BAE;
	Tue, 27 Feb 2018 12:48:46 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-5-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4c3fb706-41e8-0b2f-f2b9-25f0ef60b90d@redhat.com>
Date: Tue, 27 Feb 2018 13:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-5-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 12:48:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 12:48:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/9] acpi: add
 build_append_gas() helper for Generic Address Structure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ocriI6hmX0Do

Hi,

On 22/02/18 13:42, Igor Mammedov wrote:
> it will help to add Generic Address Structure to ACPI tables
> without using packed C structures and avoid endianness
> issues as API doesn't need an explicit conversion.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  include/hw/acpi/aml-build.h | 20 ++++++++++++++++++++
>  hw/acpi/aml-build.c         | 16 ++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 88d0738..8692ccc 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -78,6 +78,15 @@ typedef enum {
>  } AmlUpdateRule;
>  
>  typedef enum {
> +    AML_AS_SYSTEM_MEMORY = 0X00,
> +    AML_AS_SYSTEM_IO = 0X01,
> +    AML_AS_PCI_CONFIG = 0X02,
> +    AML_AS_EMBEDDED_CTRL = 0X03,
> +    AML_AS_SMBUS = 0X04,
> +    AML_AS_FFH = 0X7F,
> +} AmlAddressSpace;
> +
> +typedef enum {
>      AML_SYSTEM_MEMORY = 0X00,
>      AML_SYSTEM_IO = 0X01,
>      AML_PCI_CONFIG = 0X02,
> @@ -389,6 +398,17 @@ int
>  build_append_named_dword(GArray *array, const char *name_format, ...)
>  GCC_FMT_ATTR(2, 3);
>  
> +void build_append_gas(GArray *table, AmlAddressSpace as,
> +                      uint8_t bit_width, uint8_t bit_offset,
> +                      uint8_t access_width, uint64_t address);
> +
> +static inline void
> +build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
> +{
> +    build_append_gas(table, s->space_id, s->bit_width, s->bit_offset,
> +                     s->access_width, s->address);
> +}
> +
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
>  
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 36a6cc4..3fef5f6 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -258,6 +258,22 @@ static void build_append_int(GArray *table, uint64_t value)
>      }
>  }
>  
> +/* Generic Address Structure (GAS)
> + * ACPI 2.0/3.0: 5.2.3.1 Generic Address Structure
> + * 2.0 compat note:
> + *    @access_width must be 0, see ACPI 2.0:Table 5-1
> + */
> +void build_append_gas(GArray *table, AmlAddressSpace as,
> +                      uint8_t bit_width, uint8_t bit_offset,
> +                      uint8_t access_width, uint64_t address)
> +{
> +    build_append_int_noprefix(table, as, 1);
> +    build_append_int_noprefix(table, bit_width, 1);
> +    build_append_int_noprefix(table, bit_offset, 1);
> +    build_append_int_noprefix(table, access_width, 1);
> +    build_append_int_noprefix(table, address, 8);
> +}
> +
>  /*
>   * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
>   * and return the offset to 0x00000000 for runtime patching.
> 
