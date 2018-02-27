Received: by 10.28.71.27 with SMTP id u27csp4865163wma;
        Tue, 27 Feb 2018 06:10:52 -0800 (PST)
X-Google-Smtp-Source: AG47ELteUHLamkmDmE6NQXWlTMs0Gx+3pU3/tQsEALQBvmX1OiTxNH+RUsVttAD887jHoG/5VQ1h
X-Received: by 10.129.141.73 with SMTP id w9mr4680146ywj.361.1519740652222;
        Tue, 27 Feb 2018 06:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519740652; cv=none;
        d=google.com; s=arc-20160816;
        b=DUgSBAyAwXnmduJ5VyRKYAgHADvBYzqoBLrtFgySiYGtqCofw+OJMkliNfUvDzNN5o
         s4kT6PJ16ko0giQ1vDp+7mirrxvXfA+D/D2fgqk2RvXCQK1hLUAaNp7E4vtPtSvXSJgt
         yb6cC+gcofd16wxpf0FPvusghMQD3Du1VSgRjUtwY01NdyfGz0jyPt+UepEtWb2yzqrj
         XYwly9llWkqG+gae7YfJgcw77hbrhAgehFp0drh80pCHxVFLK4asFGXfy8zRdKA+Rfnf
         hwvRHOQhmUE7llA1Gq/XuJ609UAk2t6hFA4+oE9EiKrpCvE6ZCp64O5FQo8oyK9kSRt0
         5NWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=BQia3DfQB205EAU4v5viLCE7UaEakPoO6xiSldUgwBk=;
        b=PsNuKxCZsWm7rtM17SExIiyTLURPP6tWEJ6d81CA9o5JIcXGphNQw/4N36o9tooojl
         GBTts7BQUPbW+9VPiDSdKaCFL5k8cUOqmf+nrGd+90860s3v7/mPHQk/Go6hdqczpDdS
         2LVaFv/Lc7dFDL8yFJscRAK7cTpd24D1OA/Ju1cx4iyNkq2OlCOCE++R7fmbmh12vEqY
         JuMcSU6R0T3AgcFCitCZAyamjaKMGr7difpQvSpdk0kcj4fkI+KDA/OlD3of5U6rjnh1
         pn7DzfuTbVQri6f6L01ocStAxHVgmwMmHZ2XsyQEz1Nm+GeZpTNyF53Wn6peurTR31ED
         pF6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5-v6si1952218ybi.251.2018.02.27.06.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfxz-00080x-Lg
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:10:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqfxq-0007zM-B5
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:10:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqfxm-0003BR-8X
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:10:42 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46454 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqfxm-0003BN-2U; Tue, 27 Feb 2018 09:10:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83C154040073;
	Tue, 27 Feb 2018 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FAC1202699A;
	Tue, 27 Feb 2018 14:10:20 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-7-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a23cf958-d16e-3604-696b-bc77a0e1400a@redhat.com>
Date: Tue, 27 Feb 2018 15:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-7-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 27 Feb 2018 14:10:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 27 Feb 2018 14:10:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] pc: acpi: use
 build_append_foo() API to construct FADT
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
X-TUID: FVjYgdJwN53L

Hi Igor,

On 22/02/18 13:42, Igor Mammedov wrote:
> build_append_foo() API doesn't need explicit endianness
> conversions which eliminates a source of errors and
> it makes build_fadt() look like declarative definition of
> FADT table in ACPI spec, which makes it easy to review.
> Also it allows easily extending FADT to support other
> revisions which will be used by follow up patches
> where build_fadt() will be reused for ARM target.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/i386/acpi-build.c | 147 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 85 insertions(+), 62 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 706ba35..544a4bc 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -299,87 +299,110 @@ build_facs(GArray *table_data, BIOSLinker *linker)
>      facs->length = cpu_to_le32(sizeof(*facs));
>  }
>  
> -/* Load chipset information in FADT */
> -static void fadt_setup(AcpiFadtDescriptorRev3 *fadt, AcpiFadtData f)
> -{
> -    fadt->model = f.int_model;
> -    fadt->reserved1 = 0;
> -    fadt->sci_int = cpu_to_le16(f.sci_int);
> -    fadt->smi_cmd = cpu_to_le32(f.smi_cmd);
> -    fadt->acpi_enable = f.acpi_enable_cmd;
> -    fadt->acpi_disable = f.acpi_disable_cmd;
> -    /* EVT, CNT, TMR offset matches hw/acpi/core.c */
> -    fadt->pm1a_evt_blk = cpu_to_le32(f.pm1_evt.address);
> -    fadt->pm1a_cnt_blk = cpu_to_le32(f.pm1_cnt.address);
> -    fadt->pm_tmr_blk = cpu_to_le32(f.pm_tmr.address);
> -    fadt->gpe0_blk = cpu_to_le32(f.gpe0_blk.address);
> -    /* EVT, CNT, TMR length matches hw/acpi/core.c */
> -    fadt->pm1_evt_len = f.pm1_evt.bit_width / 8;
> -    fadt->pm1_cnt_len = f.pm1_cnt.bit_width / 8;
> -    fadt->pm_tmr_len = f.pm_tmr.bit_width / 8;
> -    fadt->gpe0_blk_len = f.gpe0_blk.bit_width / 8;
> -    fadt->plvl2_lat = cpu_to_le16(f.c2_latency);
> -    fadt->plvl3_lat = cpu_to_le16(f.c3_latency);
> -    fadt->flags = cpu_to_le32(f.flags);
> -    fadt->century = f.rtc_century;
> -    if (f.rev == 1) {
> -        return;
> -    }
> -
> -    fadt->reset_value = f.reset_val;
> -    fadt->reset_register = f.reset_reg;
> -    fadt->reset_register.address = cpu_to_le64(f.reset_reg.address);
> -
> -    fadt->xpm1a_event_block = f.pm1_evt;
> -    fadt->xpm1a_event_block.address = cpu_to_le64(f.pm1_evt.address);
> -
> -    fadt->xpm1a_control_block = f.pm1_cnt;
> -    fadt->xpm1a_control_block.address = cpu_to_le64(f.pm1_cnt.address);
> -
> -    fadt->xpm_timer_block = f.pm_tmr;
> -    fadt->xpm_timer_block.address = cpu_to_le64(f.pm_tmr.address);
> -
> -    fadt->xgpe0_block = f.gpe0_blk;
> -    fadt->xgpe0_block.address = cpu_to_le64(f.gpe0_blk.address);
> -}
> -
> -
>  /* FADT */
>  static void
> -build_fadt(GArray *table_data, BIOSLinker *linker, AcpiFadtData *f,
> +build_fadt(GArray *tbl, BIOSLinker *linker, AcpiFadtData *f,
>             const char *oem_id, const char *oem_table_id)
>  {
> -    AcpiFadtDescriptorRev3 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> -    unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
> -    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
> -    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
> -    int fadt_size = sizeof(*fadt);
> +    int off;
> +    int fadt_start = tbl->len;
> +
> +    acpi_data_push(tbl, sizeof(AcpiTableHeader));
>  
> -    /* FACS address to be filled by Guest linker */
> +    /* FACS address to be filled by Guest linker at runtime */
> +    off = tbl->len;
> +    build_append_int_noprefix(tbl, 0, 4); /* FIRMWARE_CTRL */
>      if (f->facs_tbl_offset) {
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->firmware_ctrl),
> +            ACPI_BUILD_TABLE_FILE, off, 4,
>              ACPI_BUILD_TABLE_FILE, *f->facs_tbl_offset);
>      }
>  
> -    /* DSDT address to be filled by Guest linker */
> -    fadt_setup(fadt, *f);
> +    /* DSDT address to be filled by Guest linker at runtime */
> +    off = tbl->len;
> +    build_append_int_noprefix(tbl, 0, 4); /* DSDT */
>      if (f->dsdt_tbl_offset) {
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
> +            ACPI_BUILD_TABLE_FILE, off, 4,
>              ACPI_BUILD_TABLE_FILE, *f->dsdt_tbl_offset);
>      }
> +
> +    /* ACPI1.0: INT_MODEL, ACPI2.0+: Reserved */
> +    build_append_int_noprefix(tbl, f->int_model /* Multiple APIC */, 1);
> +    /* Preferred_PM_Profile */
> +    build_append_int_noprefix(tbl, 0 /* Unspecified */, 1);
> +    build_append_int_noprefix(tbl, f->sci_int, 2); /* SCI_INT */
> +    build_append_int_noprefix(tbl, f->smi_cmd, 4); /* SMI_CMD */
> +    build_append_int_noprefix(tbl, f->acpi_enable_cmd, 1); /* ACPI_ENABLE */
> +    build_append_int_noprefix(tbl, f->acpi_disable_cmd, 1); /* ACPI_DISABLE */
> +    build_append_int_noprefix(tbl, 0 /* not supported */, 1); /* S4BIOS_REQ */
> +    /* ACPI1.0: Reserved, ACPI2.0+: PSTATE_CNT */
> +    build_append_int_noprefix(tbl, 0, 1);
> +    build_append_int_noprefix(tbl, f->pm1_evt.address, 4); /* PM1a_EVT_BLK */
> +    build_append_int_noprefix(tbl, 0, 4); /* PM1b_EVT_BLK */
> +    build_append_int_noprefix(tbl, f->pm1_cnt.address, 4); /* PM1a_CNT_BLK */
> +    build_append_int_noprefix(tbl, 0, 4); /* PM1b_CNT_BLK */
> +    build_append_int_noprefix(tbl, 0, 4); /* PM2_CNT_BLK */
> +    build_append_int_noprefix(tbl, f->pm_tmr.address, 4); /* PM_TMR_BLK */
> +    build_append_int_noprefix(tbl, f->gpe0_blk.address, 4); /* GPE0_BLK */
> +    build_append_int_noprefix(tbl, 0, 4); /* GPE1_BLK */
> +    /* PM1_EVT_LEN */
> +    build_append_int_noprefix(tbl, f->pm1_evt.bit_width / 8, 1);
> +    /* PM1_CNT_LEN */
> +    build_append_int_noprefix(tbl, f->pm1_cnt.bit_width / 8, 1);
> +    build_append_int_noprefix(tbl, 0, 1); /* PM2_CNT_LEN */
> +    build_append_int_noprefix(tbl, f->pm_tmr.bit_width / 8, 1); /* PM_TMR_LEN */
> +    /* GPE0_BLK_LEN */
> +    build_append_int_noprefix(tbl, f->gpe0_blk.bit_width / 8, 1);
> +    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BLK_LEN */
> +    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BASE */
> +    build_append_int_noprefix(tbl, 0, 1); /* CST_CNT */
> +    build_append_int_noprefix(tbl, f->c2_latency, 2); /* P_LVL2_LAT */
> +    build_append_int_noprefix(tbl, f->c3_latency, 2); /* P_LVL3_LAT */
> +    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_SIZE */
> +    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_STRIDE */
> +    build_append_int_noprefix(tbl, 0, 1); /* DUTY_OFFSET */
> +    build_append_int_noprefix(tbl, 0, 1); /* DUTY_WIDTH */
> +    build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> +    build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> +    build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> +    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> +    build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> +
>      if (f->rev == 1) {
> -        fadt_size = offsetof(typeof(*fadt), reset_register);
> -    } else if (f->xdsdt_tbl_offset) {
> +        goto build_hdr;
> +    }
> +
> +    build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
> +    build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
> +    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
> +    build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
> +
> +    /* XDSDT address to be filled by Guest linker at runtime */
> +    off = tbl->len;
> +    build_append_int_noprefix(tbl, 0, 8); /* X_DSDT */
> +    if (f->xdsdt_tbl_offset) {
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
> +            ACPI_BUILD_TABLE_FILE, off, 8,
>              ACPI_BUILD_TABLE_FILE, *f->xdsdt_tbl_offset);
>      }
>  
> -    build_header(linker, table_data,
> -                (void *)fadt, "FACP", fadt_size, f->rev,
> -                oem_id, oem_table_id);
> +    build_append_gas_from_struct(tbl, &f->pm1_evt); /* X_PM1a_EVT_BLK */
> +    /* X_PM1b_EVT_BLK */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> +    build_append_gas_from_struct(tbl, &f->pm1_cnt); /* X_PM1a_CNT_BLK */
> +    /* X_PM1b_CNT_BLK */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> +    /* X_PM2_CNT_BLK */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> +    build_append_gas_from_struct(tbl, &f->pm_tmr); /* X_PM_TMR_BLK */
> +    build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
> +
> +build_hdr:
> +    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> +                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>  }
>  
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> 
