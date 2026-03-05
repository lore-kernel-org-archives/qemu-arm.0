Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B53EEEF30A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 06:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy227-0000A7-DS; Thu, 05 Mar 2026 01:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy220-0008NJ-9b
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:17:56 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy21y-0002XA-L6
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:17:56 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-56af6737b4fso82384e0c.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 22:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772691472; x=1773296272; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2d+lVRo3jnLc5KXsPIxuNusCiOjhsGQ40yhe6sdH2TU=;
 b=B1hUW8BcUYwwhBYX2JMYjStX1XlA0Rwi0kXgWt9hLYkpBUBKRO5dzkV4DuAc1kNS4f
 4VwIddtO6fn6FVmKq0U4EO4WFmWX6gGSy7mWSuh2S+ncfzSnFBp+HZyI1S+I6fxUAPRJ
 sXgUmqA3kfwJC8bHHXPJrZOZhIbuz3v05494c16PE+f6kwWeK6k6+YzTV1TRMOjHqX+O
 fC1M57di1ezjFQpYxf8aQ6ul/1vvUdQdzskjUeMpVzPoh7/2XjPAQTUsqSM7j10pe8TM
 ipyhHMlr54pxjiSeWJdUkoxQoV1ViEzh6IAGqXwPFNMG9IpXqye84QTU6sjRcDFPj3LV
 higA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772691472; x=1773296272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2d+lVRo3jnLc5KXsPIxuNusCiOjhsGQ40yhe6sdH2TU=;
 b=jUZnXs8GlbVyUaf+p2givQ1N3JSNTxoSheeswJR8Z593kvh+b64WUEJoGCrQBe6dpC
 AfZvLGwoWVTDIRK27LDDSnntdoZHhtncGw4cVwdVlG8wNMZ+MaRrSAHKJotHTS3r59r7
 B8A11OjDGxog0AQieg6mSH3e1xYu5HoOYreaMiSgwYGSdlNNP6zrGpjXcSHI9yR1ZuA+
 LGUXF1KIY/ruBuhsvhm7RmyENelP6Gm9PLvKt6PDSt7j4rpCmzZyj93oGbLsDSywYL6a
 8OHzAgk7W+j9snldFW4AKVtP4u1MgXB1gfUP/Rz+R5GKs9ZPCTKK3pmxrG2e94Qcx/cS
 MAXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9iRAIPpqkhRWPcdc8OZ8Q2EJUazIcu7y5qMM3LKa/lfQKJpnyq4Axy9noz3R5mGki1cnniJARPA==@nongnu.org
X-Gm-Message-State: AOJu0YxuKRtN0LwXVCBqR8SBLrnMAGQ8M078Df6dEQy8a7Fb3RBDSekj
 faqnmrWPr1hdnfRYD2RmmmicsEolc1L+NF4Uy08jT3XTPOiQVjfZanviocKjxa+rggU=
X-Gm-Gg: ATEYQzy/7esSHCIeA+ZT4Qz5wysLhiDZCNdZ2Sh+2Dxf/gSAC3VXW68Nl+8Qdg+k0X+
 BYGX8taNoYM/6GAaDROCY/fiei1QAy9HkW2jtXfu119Kt1AGa1IkYCcO1lwa9+Dl3XqYab1+ANq
 36T0y7+pBFTYMfkY+YXVDlkj3ksKFdUuUAlvneE4OuKPT/b5LV/Avo6ot6LlqmUEEajWNn970eu
 jDowh9R5h9dSpzfPJIYycQX32ANdKzBCsmNZYastkUUqDnSVKWCJ9iip5clzeub/gnvMgyJOdaD
 1nE3V5uDNKqrFN3m6HCvUPiWZxp9T3vML5MLxwIErGn4T81EgNxw8g0n28BtOTgS1jwxSAJMe1y
 BIQdoPC6/hGNFDlIV+RkVSzlOCO7yUV9gl9lVl25IBINPpEL2tCLVnUvwGApidBQ5yafiehA06G
 6j/tgSy9BX48rIa0nYxoQtFDaJFFBq8pz7bxvJzPpw4vQ=
X-Received: by 2002:a05:6122:e272:b0:559:6e78:a43a with SMTP id
 71dfb90a1353d-56ae7797cffmr2024587e0c.9.1772691472085; 
 Wed, 04 Mar 2026 22:17:52 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56ae35d455fsm5822304e0c.4.2026.03.04.22.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 22:17:51 -0800 (PST)
Message-ID: <fe364bfb-92bf-48f7-b1f5-505310038804@linaro.org>
Date: Thu, 5 Mar 2026 03:17:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/8] acpi: Add parameters to pass cache descriptions
 to ACPI build_pptt()
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-6-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-6-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alireza,

On 2/20/26 11:11, Alireza Sanaee wrote:
> Add optional parameters to pass cache descriptions to build_pptt().
> Update ARM and Loongarch callers to pass none for now.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   hw/acpi/aml-build.c            | 3 ++-
>   hw/arm/virt-acpi-build.c       | 2 +-
>   hw/loongarch/virt-acpi-build.c | 4 ++--
>   include/hw/acpi/aml-build.h    | 4 +++-
>   4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea1c415b21..b75aa2336e 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2153,7 +2153,8 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>    * 5.2.29 Processor Properties Topology Table (PPTT)
>    */
>   void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id)
> +                const char *oem_id, const char *oem_table_id,
> +                int num_caches, CPUCoreCaches *caches)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>       CPUArchIdList *cpus = ms->possible_cpus;
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 544004615d..a655d1e42b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1277,7 +1277,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       if (!vmc->no_cpu_topology) {
>           acpi_add_table(table_offsets, tables_blob);
>           build_pptt(tables_blob, tables->linker, ms,
> -                   vms->oem_id, vms->oem_table_id);
> +                   vms->oem_id, vms->oem_table_id, 0, NULL);
>       }
>   
>       acpi_add_table(table_offsets, tables_blob);
> diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
> index 3e34bedcd6..a0b445f297 100644
> --- a/hw/loongarch/virt-acpi-build.c
> +++ b/hw/loongarch/virt-acpi-build.c
> @@ -538,8 +538,8 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       build_madt(tables_blob, tables->linker, lvms);
>   
>       acpi_add_table(table_offsets, tables_blob);
> -    build_pptt(tables_blob, tables->linker, machine,
> -               lvms->oem_id, lvms->oem_table_id);
> +    build_pptt(tables_blob, tables->linker, machine, lvms->oem_id,
> +               lvms->oem_table_id, 0, NULL);
>   
>       acpi_add_table(table_offsets, tables_blob);
>       build_srat(tables_blob, tables->linker, machine);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index f38e129719..e70e0643b1 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>   
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/core/cpu.h"
>   
>   #define ACPI_BUILD_APPNAME6 "BOCHS "
>   #define ACPI_BUILD_APPNAME8 "BXPC    "
> @@ -499,7 +500,8 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   const char *oem_id, const char *oem_table_id);
>   
>   void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id);
> +                const char *oem_id, const char *oem_table_id,
> +                int num_caches, CPUCoreCaches *caches);
>   
>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                   const char *oem_id, const char *oem_table_id);

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

