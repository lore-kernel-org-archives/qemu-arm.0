Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp25210wrt;
        Mon, 26 Nov 2018 09:12:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5fVSZ7esGSPiSHvdQJ76jq9R4odNJL+MqNt0sciUkOKD+pIYvnWZteXXIaBdN4aOqWzVfCs
X-Received: by 2002:aed:3bb8:: with SMTP id r53mr26660116qte.77.1543252342096;
        Mon, 26 Nov 2018 09:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543252342; cv=none;
        d=google.com; s=arc-20160816;
        b=Ixc0c/aypQfew/+Q995hN+Nr18+pHpR/leHwLDfDUYP31H5rrX/D0FefGEZwhwNZj5
         tVE8dlL994JcxbXySUJXkugRZ/9fAYk3swhlN32ducpnfazrMQGo1IgtnaKjmHS1i8lN
         Rwz3D7iBpA0o+jEVe+po/+iAm6f7RyBEtORFO9RdBZBszI6Yj3RKAnJsKBf8LfZep7m9
         u97/z4++W8eSmEr8peOCoOi5Km/Zl+JYeH7bK42nbH6j9sL063Te2drIimTWblWzQ372
         xHZlFtunjbU+mplxebKvW5adDkqazO2ugARnV2ZBGJtzcuO6uLt5sRaMCj1XlbaBdVcN
         /pBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=//HANkILrfoRyB/pX1hfBGMhwb05YKH2Gp3zOV25rm4=;
        b=BGR2bm62uc5sqx1E59WT+1TqaoMY8t6PA+lyKuTLpKnJfkerKkvf4EZ4aRpHTtUPw0
         2YmvtbrGZXe+FBBFl3mb4mDjFD8M6ZzLR/EJczPKpuEPmCAAiJXhG6cBHht0MRbd4qEP
         SKpLBbtuBCmxwX2B2TrwLQpUixfEO1tXtujafUSB4qcs42+FcF39R8AeyzUe8H4ak6LB
         IWWYHr41n+9CA2Nr370ZE1rod6H6qNLzZvdEMtH7EqwRW28d0miReRfpVIrcbe95F1mY
         D+YWM6/L5s3ea+bxsRnPTTohIiRVYzYbmGuaWaBr9JRvF44yRYJuK6l9SwkO43kMdX2A
         EJjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n86si738407qkh.253.2018.11.26.09.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 09:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRKQn-0004w4-3N
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 12:12:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKMs-000147-BR
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:08:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKMp-0004OA-6v
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:08:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45440)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRKMp-0004N8-18
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:08:15 -0500
Received: by mail-wr1-f66.google.com with SMTP id v6so19737225wrr.12
	for <qemu-arm@nongnu.org>; Mon, 26 Nov 2018 09:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=//HANkILrfoRyB/pX1hfBGMhwb05YKH2Gp3zOV25rm4=;
	b=CeW31kRWt5b2EDlTTdPiCpDLkC9YY+Io5CZHXrGxE7mmlbJkSkR9605o7gK+mZvX6p
	0X19S4I+vaOJZqomJGtQWQEU3A37mxloiRdaJE7vRE6aksZ9RwGSAHK5jpsQvGTMNbb4
	1skQrqK3karBhdV2jyrYwD/JZWM94K3EIcNZOviwxXAEwyHuvfRUVxOpt1Cc6hTBuo9y
	wQ8om035go3F/9HfvwXg1SKA6yEf9QmMCenotuKL0l+E6PhhMKjei4kYA/tXVmEhmhlG
	S0h/hLTrk0moSNJhVPH3iu38z7rWO2BMv4VAp69PaIKur2KdAydHr4988taDl7Z84Uzz
	hoFA==
X-Gm-Message-State: AA+aEWatJzNlSKmvu4wVbyaL3NdGDAB1i01zbWCSHLFpla+yJ4pmHT9I
	5l4BkeJ4Y2mMdKjdBLtd34MUqw==
X-Received: by 2002:adf:82e4:: with SMTP id 91mr25197809wrc.131.1543252092378; 
	Mon, 26 Nov 2018 09:08:12 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id y19sm1368700wmj.2.2018.11.26.09.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:07:52 -0800 (PST)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-2-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1282f627-077e-975d-62ba-cf045fe86a20@redhat.com>
Date: Mon, 26 Nov 2018 18:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181126162942.21258-2-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/8] hw: acpi: The RSDP build
 API can return void
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
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tMoUERnzkm8V

On 26/11/18 17:29, Samuel Ortiz wrote:
> For both x86 and ARM architectures, the internal RSDP build API can
> return void as the current return value is unused.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 4 +---
>  hw/i386/acpi-build.c     | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..fcaa350892 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  }
>  
>  /* RSDP */
> -static GArray *
> +static void
>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> @@ -392,8 +392,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>          (char *)rsdp - rsdp_table->data, sizeof *rsdp,
>          (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
>  }
>  
>  static void
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 236a20eaa8..35f17d0d91 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2547,7 +2547,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
>  
> -static GArray *
> +static void
>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> @@ -2569,8 +2569,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>          (char *)rsdp - rsdp_table->data, sizeof *rsdp,
>          (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
>  }
>  
>  typedef
> 
