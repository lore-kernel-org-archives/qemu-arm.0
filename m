Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1882381wro;
        Fri, 2 Nov 2018 02:35:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cAOhFGD7gm2ANEJCVMbZHbdS6DM6bqP6u1iSkL51yggJ0ckc7nr2VTHA2F+xbF2n0iDLeF
X-Received: by 2002:a0c:cc8c:: with SMTP id f12mr10235012qvl.102.1541151326680;
        Fri, 02 Nov 2018 02:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541151326; cv=none;
        d=google.com; s=arc-20160816;
        b=ttHWVPfk8UN666lUB6BPO7pJPTIUktM6xI3hRc8qYFMQEb9uWXNSTSX7KLpvH0pcc6
         58rpvDFf/WVv8bOr0YUfs9GrWp42CX6rTQxmMMjwgj1YzLZMb/E/AYcRr60vC8HSZFiQ
         lYiqm6iCrnghvomnEC4DTXfS6HIzVJDytWncIp/acf1CZgk4O/KwhO7b9LlREme56Le9
         7cjCNfB29onT/Oe60Tx8lED4M8e9dgpUb7Cz3NhrktGZefbAYfW7jFvz0yhIEj9rXLy1
         KCDYBGtc92z6OT4hG+apjRyOcxHgi76LllFEqh3qQNHlX459kyYDHa947SsEA/b44JzT
         FMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=6YqFW2Ud2ecePfs/kUhj7qHKiGRwQ4jVl7N/R1GQz5Q=;
        b=BmM/HcsbVVqcDIP6WWAHUcbpVwLN6EpgbRHxKqMouxlmQ+iFBU9jMinNKRFbbiVfK/
         h+5nuTr9eg5pcR8pfkWmYXFuWFIrHbqzOKZx3eSSnZQ9bMmGZoSKylU8b+i30f57AhWk
         rraPaU8o+cz/6ChGpyezFhPkojK0T2WbWNOB9364IkC9ywoqRd8PGQ8dR61zEg2du8EM
         5luc+JAsVrRUQZ6epQkg1DmXdexI5iAiKb7BvauYmx03oSYbDQAHd7oRmLLquQ+9eONE
         zmbeO60RVks3gHfbJGcVU157u1M2omLIyyTk8sCbD3aza5ZwUU/3JqgoWK0G3orC5XdM
         R+fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FmdGUywv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si2858578qvj.152.2018.11.02.02.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 02:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FmdGUywv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIVrS-0004hc-7G
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 05:35:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVrL-0004hW-O7
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:35:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVrG-0007US-Dh
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:35:19 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gIVrG-0007Tm-6X; Fri, 02 Nov 2018 05:35:14 -0400
Received: by mail-oi1-x244.google.com with SMTP id k64-v6so1049553oia.13;
	Fri, 02 Nov 2018 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6YqFW2Ud2ecePfs/kUhj7qHKiGRwQ4jVl7N/R1GQz5Q=;
	b=FmdGUywvzOFJs5Ch6Q4zudWRxh2UKqG9AIlLI46dOUf94w/Vv8emkHabnjulg0zhA9
	VMqm5KfytgOvzQszGQ7wK4/XUupWxVCx23vy2dT1vw3NCPEwheHUgbDz0J2U2hX0DncP
	mNxn8wqSp2K+Vl6giU5IIw6gdnmYbT4ivNU6KoGo7X0HhofliekY+PUmnzXwvQ7ZxH7t
	voPPLg28H0eSPgQtFSWKxuNf+g1Xr2Ll/X7vh27Ka9Bx8AhdeaMeMdMs/+NYOziq+egI
	JDZKWdLwLCSurYCofmUUhiSR6kBWkhghJ7GC4xG8Qf4IpKdbPfBm9epyHz/ShcrqUqMv
	7KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6YqFW2Ud2ecePfs/kUhj7qHKiGRwQ4jVl7N/R1GQz5Q=;
	b=cikDtvEBFuCutoD446fWeU63eVYUrhEXL9qqkLSs8y0YeN6EOphBWbYypbvYVSNUDo
	yVcORDHT0dxrw0BaADiPdyHhXXmMrKurgtF4yjPm/ePd1RM+78kAsT5lPrCS8OlOq0Q6
	cXpwGJHutz0L+B3ts4c33ErTYq8XFCD8lDQIIvAetTlFy7duRxnE2jLMYUoCGl/RB9u4
	dMY8zzPIqPpHcIpdzryVuZkFUXVt34ZjVUjwXE44CEcbJls4M1uZU2WJCl4JT8hsNv+X
	3zvNji4P2kutr+vdjH3HMoX3PuMAwPezjaHdnddWgrLpbzJ05AH31vCgcDWvMkVWtWAl
	nWRA==
X-Gm-Message-State: AGRZ1gLozSAKkmncxpWvb6qpnAnbSBYXBPaWsuk19dJluLxA2xy3VXTm
	tzoj3QbrosLlN28tYOPpjLQ=
X-Received: by 2002:aca:b357:: with SMTP id
	c84-v6mr6687261oif.266.1541151313507; 
	Fri, 02 Nov 2018 02:35:13 -0700 (PDT)
Received: from [30.43.112.38] ([47.89.83.58]) by smtp.gmail.com with ESMTPSA id
	r10-v6sm13626669oif.57.2018.11.02.02.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 02:35:12 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-6-sameo@linux.intel.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <c88b4769-a517-36da-b181-e59a4380bcea@gmail.com>
Date: Fri, 2 Nov 2018 17:35:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181101102303.16439-6-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/23] hw: arm: Switch to the
 AML build RSDP building routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ihcefVYuooDX



On 2018/11/1 18:22, Samuel Ortiz wrote:
> We make the ARM virt ACPI code use the now shared build_rsdp() API from
> aml-build.c. By doing so we fix a bug where the ARM implementation was
> missing adding both the legacy and extended checksums, which was
> building an invalid RSDP table.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>   hw/arm/virt-acpi-build.c | 31 +------------------------------
>   1 file changed, 1 insertion(+), 30 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0ed132b79b..0a6a88380a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,6 +35,7 @@
>   #include "target/arm/cpu.h"
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
>   #include "hw/nvram/fw_cfg.h"
>   #include "hw/acpi/bios-linker-loader.h"
>   #include "hw/loader.h"
> @@ -366,36 +367,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>       aml_append(scope, dev);
>   }
>   
> -/* RSDP */
> -static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
Note: here we use xsdt table not rsdt for ARM. After your change which 
assigns xsdt table address to rsdt_physical_address, it doesn't work.

IIRC, we discussed this before that ARM virt uses xsdt while pc/q35 uses 
rsdt. So this patch is not necessary I think.

Thanks,
Shannon
> -{
> -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> -    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> -    unsigned xsdt_pa_offset =
> -        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> -
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> -                             true /* fseg memory */);
> -
> -    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> -    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> -    rsdp->revision = 0x02;
> -
> -    /* Address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> -
> -    /* Checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
> -}
> -
>   static void
>   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
> 
