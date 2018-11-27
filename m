Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1368538wrt;
        Tue, 27 Nov 2018 06:50:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5f+f45/UazY239DZX6IAkffYzTXAslECuIeqcVBga8kDAfKAc8w34iWT2SHzJI6tPo8fFJf
X-Received: by 2002:a81:4bc1:: with SMTP id y184mr34247232ywa.365.1543330239759;
        Tue, 27 Nov 2018 06:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543330239; cv=none;
        d=google.com; s=arc-20160816;
        b=fNc8SMiFUehasJvWBfm/fvU/K1SfGgetYmR6052rq3sRoIT4Vt+GRkfl5Ox73y1ZWM
         j52qwPr3VUc/Yb80UGEcEzguAGUSSNQyw3OxjeRv22dYF3PI3nJ+Ce12VqLUmwzz/Rxh
         C1nQUUXIElbQ2XNy1W7dMC6kLrxeYvXIOQ5tN4SLpHr8sO1e66b6pNeVvMzEn+ZZVQ+Z
         0kedg8D5rhmMsKAiKUYXSPV+MQH2p7modGpCrYdqmXTLXZMonvTFYfNpcw2nwxyrARV0
         NFzwK6JkLmAFQ/JgfrqZOpjS4pT1ci/BVfHTw9t6QgiSJ3w7UVUflO1gPtobsgj0/20A
         uoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=pyZib4flJKo59bCdhCfLChHG1Nn2uCPfjnk5FLO83+4=;
        b=QiDhVX/JFhUVgA00JoUD7FcKUPadPJgP/Wly44q6DWRj+zqmPthP/ljDBe7Qqn94u5
         8j6wqxzv2jzG0LCcOJj1kcp+5NdJ5dNPP5n2rOR7B2VpWoozw5Qq5MfK2rDhOo8cMVeW
         +glvhtxjLAoS2M6b50YlkWtmC56LT0tEc48x1S1FN0XH/QotdGC5fj5c/jflIVWh2rwF
         SjFD+RZKDpx7c2kY5kYGFxHXjBJHyJkIajz/pOPA67yp1X8YIHs3zKh9FXBuC03P9YrM
         HOD6LOHaozsY/kJaVVC8jIs6BhQu+xtE5P7IynG6sJxBWPOr/acn7Un6tHkf4ls8Zklo
         4sOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i30-v6si2874708ybj.7.2018.11.27.06.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 06:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRehD-0000Gu-39
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 09:50:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gReh2-0000ER-7W
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRegy-0000XX-7W
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:50:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRegw-0000OL-7M; Tue, 27 Nov 2018 09:50:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6D1753DD;
	Tue, 27 Nov 2018 14:50:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C4E6608C1;
	Tue, 27 Nov 2018 14:50:17 +0000 (UTC)
Date: Tue, 27 Nov 2018 15:50:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127155016.168e2a97@redhat.com>
In-Reply-To: <20181126162942.21258-3-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-3-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 27 Nov 2018 14:50:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/8] hw: arm: acpi: Fix incorrect checksums
 in RSDP
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DyWaorX8QJzb

On Mon, 26 Nov 2018 17:29:35 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> From: Igor Mammedov <imammedo@redhat.com>
> 
> When RSDP table was introduced (d4bec5d87), we calculated only legacy
> checksum, and that was incorrect as it
>  - specified rev=2 and forgot about extended checksum.
>  - legacy checksum calculated on full table instead of the 1st 20 bytes
> 
> Fix it by adding extended checksum calculation and using correct
> size for legacy checksum.
> 
> While at it use explicit constants to specify sub/full tables
> sizes instead of relying on AcpiRsdpDescriptor size and fields offsets.
> The follow up commits will convert this table to build_append_int_noprefix() API,
> will use constants anyway and remove unused AcpiRsdpDescriptor structure.
> 
> Based on "[PATCH v5 05/24] hw: acpi: Implement XSDT support for  RSDP"
> by Samuel Ortiz, who did it right in his impl.
> 
> Fixes: d4bec5d87 (hw/arm/virt-acpi-build: Generate RSDP table)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> CC: Shannon Zhao <shannon.zhaosl@gmail.com>
> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>

For future reference, if one re-sends someone else patch, one is supposed to
add his/her own SoB as the last one.

> ---
>  hw/arm/virt-acpi-build.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fcaa350892..0835900052 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -390,8 +390,13 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>  
>      /* Checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> +        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
>          (char *)&rsdp->checksum - rsdp_table->data);
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
> +        (char *)&rsdp->extended_checksum - rsdp_table->data);
>  }
>  
>  static void

