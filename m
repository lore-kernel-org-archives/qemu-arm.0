Received: by 10.223.134.117 with SMTP id 50csp5620770wrw;
        Thu, 28 Dec 2017 06:58:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBousjizjwYw5T/lONjuwlIXP2EHm9efsfLiJGJzB5zGJkjmo6+6ny3rt1mwbxcBlWFB/SbgS
X-Received: by 10.159.231.24 with SMTP id w24mr31186292plq.272.1514473129113;
        Thu, 28 Dec 2017 06:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514473129; cv=none;
        d=google.com; s=arc-20160816;
        b=Smi+5JeHtOanaFPSw2WRcF52VvLwgz5TzVwcIrF9iFUGM6e7ktTFLU4Xllaa4sB4Zo
         PP+viIhlOVSkapvYZie1d+Q4dcYceRI3uCCAnb+1akDg8D4W/2jNaq1l8/koKdmYhZAu
         cvj6tZVZ/dnE2JiGbY4E7rNZyDygaiArjEpzLuuoyxkpjn7naX6VOZKEdl17gmU6hgdA
         +EG4XhH+gEF5Ny7nNueAYkKDCj6PauuLfct2KHBcWdIl4j1bwoTxBYEGOUMXXRd/zgyU
         WeNOVFC5ItgBCxNkc9K98reopEi3LhLnhm8mWdis39Ux/iNOjGGZkiUsAV6EaAfXY0Q3
         h7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=r7NUP2Dt5837FrNpQVH+zAuRru9f6WrPoRKo35YYH90=;
        b=gLxAWMXyO/nSYaFeLZvOAtPCi5Di7whYj/335wpnz4lhvcicJ0xQdKz/+JAUwgRBDr
         L4OidPUqtcnBWm/Hp2nNaRC9gzzRH5d+gz6sPupbRRdc7CKCH+E6CByNQA54PfykINZX
         Z4fAI6POTJy9pfWCbG8MCJv4lBDwN9hmqA0idbRjeFTmcRNpWKQehQq0Jai3HbSST3li
         58akr8m9gJ6SEQ8rQXsF3iNtTfw5s3ZLicc2HBbJYhi75lSVZoIJJscxQ8omM4OX//1U
         PMjChdgOXJ3XUlnz/CmOvTRg4WETz92iJ7x/NKN4T0tL3mgfhkp06u0umRT/DixMiZq2
         Bl9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b22si12979325pgn.458.2017.12.28.06.58.48;
        Thu, 28 Dec 2017 06:58:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753354AbdL1O6p (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 09:58:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46796 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753131AbdL1O6p (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 09:58:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AE69DC047B65;
        Thu, 28 Dec 2017 14:58:44 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50F2460BE0;
        Thu, 28 Dec 2017 14:58:36 +0000 (UTC)
Date:   Thu, 28 Dec 2017 15:58:32 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 8/9] hw/arm/virt: Add RAS platform version for
 migration
Message-ID: <20171228155832.05a9966b@igors-macbook-pro.local>
In-Reply-To: <1514440458-10515-9-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
        <1514440458-10515-9-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 28 Dec 2017 14:58:45 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: aHJEESuDR6d6

On Thu, 28 Dec 2017 13:54:17 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> Support this feature since version 2.10, disable it by
> default in the old version.
patch should go before acpi tables are actually added,
otherwise it might break bisectability.

> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address Shannon's comments to add platform version in [1].
> 
> [1]: https://lkml.org/lkml/2017/8/25/821
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>  hw/arm/virt.c            |  4 ++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 06c14b3..b6974ef 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -801,10 +801,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> -    acpi_add_table(table_offsets, tables_blob);
> -    build_hardware_error_table(tables->hardware_errors, tables->linker);
> -    build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
> -
> +    if (!vmc->no_ras) {

it's better to avoid no_foo, use something like

vmc->has_ras

instead

> +        acpi_add_table(table_offsets, tables_blob);
> +        build_hardware_error_table(tables->hardware_errors, tables->linker);
> +        build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
> +    }
>  
>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
> @@ -891,6 +892,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
>  
>  void virt_acpi_setup(VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
>  
> @@ -922,7 +924,9 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> -    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +    if (!vmc->no_ras) {
> +        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +    }
>  
>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>                                                ACPI_BUILD_RSDP_FILE, 0);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 68495c2..ab79988 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1732,8 +1732,12 @@ static void virt_2_9_instance_init(Object *obj)
>  
>  static void virt_machine_2_9_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_10_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
> +    /* memory recovery feature was introduced with 2.10 */
> +    vmc->no_ras = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 9)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 33b0ff3..8fbd664 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -84,6 +84,7 @@ typedef struct {
>      bool disallow_affinity_adjustment;
>      bool no_its;
>      bool no_pmu;
> +    bool no_ras;
>      bool claim_edge_triggered_timers;
>  } VirtMachineClass;
>  
