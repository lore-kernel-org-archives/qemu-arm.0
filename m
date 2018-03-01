Received: by 10.28.91.67 with SMTP id p64csp1592719wmb;
        Thu, 1 Mar 2018 01:00:29 -0800 (PST)
X-Google-Smtp-Source: AG47ELuqvXv0350149jx0laNL+fHlQp234YxaWc11k5VQrKaMP8jGb6ZEhyFxuTYR227UO69PMA2
X-Received: by 2002:a25:9185:: with SMTP id w5-v6mr573637ybl.352.1519894829278;
        Thu, 01 Mar 2018 01:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519894829; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXcpFG8iHupF2Igh/OUXGnJnOPBJOqLlej7mhQeRi14nk88XLWKdaF4DXAEBCBPIJD
         nS/emiVprIIASTPR0Dcj2wyjtXV5fBYt51gDi232RcoWialxghoQ3I2HHHwfmqUVnDFD
         gJO2iD1USecp7k6684n8BAObyxH8G67FlB6HoMGCYAc9arU7mzcUFNXokFnfkt2PclRu
         inWDM96lshSpdU55SsuglPGntOj7eX/LHxcmkHwRO1yCrkw6zzR7Ftdrr1gqWF4HXSA8
         eyrfLLWvtVhGWCD3Aj4mkU3W/IbMqUo8dLZ7/dWrWehDikGtNMVMONklA4zWWfFIFqPe
         /U+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=OOok/Cv8CLDRpnZhdUVNI3gCOh+n7B6POo9Ahe1t26s=;
        b=O/rhSQXIYXDIRU3gbsVKjgobD2ouNUvUvulQoSLCXpNZxTWH1sS4XxYhifYSs7MRYk
         9xqypR1kKcTtr6GXn9vXQt9HkfeqcWCqCxqozHK210lLrFsvOyxwI4sifvLl7N14u66P
         8FBGG4a59PuTvX/onXvU2YjyzZHWpPrU8W7qgJU6ExqCmpBnjx0gBgq/e3ZrMaII8t9i
         HLX0E7UyjGhIptE3QBGq3LtWHvEhhKhX/Ghjz9sAwuDYIzvge5XWy/TNxj2CUVGPXEEz
         ZvgtFDSSxUNocBf0v6MzJmzBAO7U1RWEFZjVroIcfDPBXVMP8S5PblPpYWW8S84V+xyg
         6+wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16si564451ywa.770.2018.03.01.01.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 01:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erK4i-0003wI-IC
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 04:00:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erK3a-0002xs-RL
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erK3X-0004pc-8G
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:59:18 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1erK3X-0004pG-2T; Thu, 01 Mar 2018 03:59:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83E014026787;
	Thu,  1 Mar 2018 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B2E62144B26;
	Thu,  1 Mar 2018 08:59:08 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
	<1519827835-239519-11-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f73ea65f-dbab-b575-fd76-e772b576d865@redhat.com>
Date: Thu, 1 Mar 2018 09:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519827835-239519-11-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 08:59:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 08:59:14 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 10/10] tests: acpi: don't read all fields
 in test_acpi_fadt_table()
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TIobkYlfVhkn

Hi Igor,

On 28/02/18 15:23, Igor Mammedov wrote:
> there is no point to read fields here but not actually
> checking them so drop it and read only header + dsdt/facs
> addresses since it's needed later to fetch that tables.
> 
> With this cleanup we can get rid of AcpiFadtDescriptorRev3/
> ACPI_FADT_COMMON_DEF which have no users left.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
My only comment is you could have removed include/hw/acpi/acpi-defs.h
defs in a separate subsequent patch after updating the test stuff. Besides,

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/acpi-defs.h | 81 --------------------------------------------
>  tests/bios-tables-test.c    | 82 ++++++++++-----------------------------------
>  2 files changed, 18 insertions(+), 145 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index fe15e95..5955eb4 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -75,82 +75,6 @@ struct AcpiTableHeader {
>  } QEMU_PACKED;
>  typedef struct AcpiTableHeader AcpiTableHeader;
>  
> -/*
> - * ACPI Fixed ACPI Description Table (FADT)
> - */
> -#define ACPI_FADT_COMMON_DEF /* FADT common definition */ \
> -    ACPI_TABLE_HEADER_DEF    /* ACPI common table header */ \
> -    uint32_t firmware_ctrl;  /* Physical address of FACS */ \
> -    uint32_t dsdt;         /* Physical address of DSDT */ \
> -    uint8_t  model;        /* System Interrupt Model */ \
> -    uint8_t  reserved1;    /* Reserved */ \
> -    uint16_t sci_int;      /* System vector of SCI interrupt */ \
> -    uint32_t smi_cmd;      /* Port address of SMI command port */ \
> -    uint8_t  acpi_enable;  /* Value to write to smi_cmd to enable ACPI */ \
> -    uint8_t  acpi_disable; /* Value to write to smi_cmd to disable ACPI */ \
> -    /* Value to write to SMI CMD to enter S4BIOS state */ \
> -    uint8_t  S4bios_req; \
> -    uint8_t  reserved2;    /* Reserved - must be zero */ \
> -    /* Port address of Power Mgt 1a acpi_event Reg Blk */ \
> -    uint32_t pm1a_evt_blk; \
> -    /* Port address of Power Mgt 1b acpi_event Reg Blk */ \
> -    uint32_t pm1b_evt_blk; \
> -    uint32_t pm1a_cnt_blk; /* Port address of Power Mgt 1a Control Reg Blk */ \
> -    uint32_t pm1b_cnt_blk; /* Port address of Power Mgt 1b Control Reg Blk */ \
> -    uint32_t pm2_cnt_blk;  /* Port address of Power Mgt 2 Control Reg Blk */ \
> -    uint32_t pm_tmr_blk;   /* Port address of Power Mgt Timer Ctrl Reg Blk */ \
> -    /* Port addr of General Purpose acpi_event 0 Reg Blk */ \
> -    uint32_t gpe0_blk; \
> -    /* Port addr of General Purpose acpi_event 1 Reg Blk */ \
> -    uint32_t gpe1_blk; \
> -    uint8_t  pm1_evt_len;  /* Byte length of ports at pm1_x_evt_blk */ \
> -    uint8_t  pm1_cnt_len;  /* Byte length of ports at pm1_x_cnt_blk */ \
> -    uint8_t  pm2_cnt_len;  /* Byte Length of ports at pm2_cnt_blk */ \
> -    uint8_t  pm_tmr_len;   /* Byte Length of ports at pm_tm_blk */ \
> -    uint8_t  gpe0_blk_len; /* Byte Length of ports at gpe0_blk */ \
> -    uint8_t  gpe1_blk_len; /* Byte Length of ports at gpe1_blk */ \
> -    uint8_t  gpe1_base;    /* Offset in gpe model where gpe1 events start */ \
> -    uint8_t  reserved3;    /* Reserved */ \
> -    uint16_t plvl2_lat;    /* Worst case HW latency to enter/exit C2 state */ \
> -    uint16_t plvl3_lat;    /* Worst case HW latency to enter/exit C3 state */ \
> -    uint16_t flush_size;   /* Size of area read to flush caches */ \
> -    uint16_t flush_stride; /* Stride used in flushing caches */ \
> -    uint8_t  duty_offset;  /* Bit location of duty cycle field in p_cnt reg */ \
> -    uint8_t  duty_width;   /* Bit width of duty cycle field in p_cnt reg */ \
> -    uint8_t  day_alrm;     /* Index to day-of-month alarm in RTC CMOS RAM */ \
> -    uint8_t  mon_alrm;     /* Index to month-of-year alarm in RTC CMOS RAM */ \
> -    uint8_t  century;      /* Index to century in RTC CMOS RAM */ \
> -    /* IA-PC Boot Architecture Flags (see below for individual flags) */ \
> -    uint16_t boot_flags; \
> -    uint8_t reserved;    /* Reserved, must be zero */ \
> -    /* Miscellaneous flag bits (see below for individual flags) */ \
> -    uint32_t flags; \
> -    /* 64-bit address of the Reset register */ \
> -    struct AcpiGenericAddress reset_register; \
> -    /* Value to write to the reset_register port to reset the system */ \
> -    uint8_t reset_value; \
> -    /* ARM-Specific Boot Flags (see below for individual flags) (ACPI 5.1) */ \
> -    uint16_t arm_boot_flags; \
> -    uint8_t minor_revision;  /* FADT Minor Revision (ACPI 5.1) */ \
> -    uint64_t x_facs;          /* 64-bit physical address of FACS */ \
> -    uint64_t x_dsdt;          /* 64-bit physical address of DSDT */ \
> -    /* 64-bit Extended Power Mgt 1a Event Reg Blk address */ \
> -    struct AcpiGenericAddress xpm1a_event_block; \
> -    /* 64-bit Extended Power Mgt 1b Event Reg Blk address */ \
> -    struct AcpiGenericAddress xpm1b_event_block; \
> -    /* 64-bit Extended Power Mgt 1a Control Reg Blk address */ \
> -    struct AcpiGenericAddress xpm1a_control_block; \
> -    /* 64-bit Extended Power Mgt 1b Control Reg Blk address */ \
> -    struct AcpiGenericAddress xpm1b_control_block; \
> -    /* 64-bit Extended Power Mgt 2 Control Reg Blk address */ \
> -    struct AcpiGenericAddress xpm2_control_block; \
> -    /* 64-bit Extended Power Mgt Timer Ctrl Reg Blk address */ \
> -    struct AcpiGenericAddress xpm_timer_block; \
> -    /* 64-bit Extended General Purpose Event 0 Reg Blk address */ \
> -    struct AcpiGenericAddress xgpe0_block; \
> -    /* 64-bit Extended General Purpose Event 1 Reg Blk address */ \
> -    struct AcpiGenericAddress xgpe1_block; \
> -
>  struct AcpiGenericAddress {
>      uint8_t space_id;        /* Address space where struct or register exists */
>      uint8_t bit_width;       /* Size in bits of given register */
> @@ -160,11 +84,6 @@ struct AcpiGenericAddress {
>      uint64_t address;        /* 64-bit address of struct or register */
>  } QEMU_PACKED;
>  
> -struct AcpiFadtDescriptorRev3 {
> -    ACPI_FADT_COMMON_DEF
> -} QEMU_PACKED;
> -typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
> -
>  typedef struct AcpiFadtData {
>      struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
>      struct AcpiGenericAddress pm1a_evt;   /* PM1a_EVT_BLK */
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 65b271a..cd753ff 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -29,7 +29,8 @@ typedef struct {
>      uint32_t rsdp_addr;
>      AcpiRsdpDescriptor rsdp_table;
>      AcpiRsdtDescriptorRev1 rsdt_table;
> -    AcpiFadtDescriptorRev3 fadt_table;
> +    uint32_t dsdt_addr;
> +    uint32_t facs_addr;
>      AcpiFacsDescriptorRev1 facs_table;
>      uint32_t *rsdt_tables_addr;
>      int rsdt_tables_nr;
> @@ -127,71 +128,18 @@ static void test_acpi_rsdt_table(test_data *data)
>      data->rsdt_tables_nr = tables_nr;
>  }
>  
> -static void test_acpi_fadt_table(test_data *data)
> +static void fadt_fetch_facs_and_dsdt_ptrs(test_data *data)
>  {
> -    AcpiFadtDescriptorRev3 *fadt_table = &data->fadt_table;
>      uint32_t addr;
> +    AcpiTableHeader hdr;
>  
>      /* FADT table comes first */
>      addr = le32_to_cpu(data->rsdt_tables_addr[0]);
> -    ACPI_READ_TABLE_HEADER(fadt_table, addr);
> -
> -    ACPI_READ_FIELD(fadt_table->firmware_ctrl, addr);
> -    ACPI_READ_FIELD(fadt_table->dsdt, addr);
> -    ACPI_READ_FIELD(fadt_table->model, addr);
> -    ACPI_READ_FIELD(fadt_table->reserved1, addr);
> -    ACPI_READ_FIELD(fadt_table->sci_int, addr);
> -    ACPI_READ_FIELD(fadt_table->smi_cmd, addr);
> -    ACPI_READ_FIELD(fadt_table->acpi_enable, addr);
> -    ACPI_READ_FIELD(fadt_table->acpi_disable, addr);
> -    ACPI_READ_FIELD(fadt_table->S4bios_req, addr);
> -    ACPI_READ_FIELD(fadt_table->reserved2, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1a_evt_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1b_evt_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1a_cnt_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1b_cnt_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm2_cnt_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm_tmr_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->gpe0_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->gpe1_blk, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1_evt_len, addr);
> -    ACPI_READ_FIELD(fadt_table->pm1_cnt_len, addr);
> -    ACPI_READ_FIELD(fadt_table->pm2_cnt_len, addr);
> -    ACPI_READ_FIELD(fadt_table->pm_tmr_len, addr);
> -    ACPI_READ_FIELD(fadt_table->gpe0_blk_len, addr);
> -    ACPI_READ_FIELD(fadt_table->gpe1_blk_len, addr);
> -    ACPI_READ_FIELD(fadt_table->gpe1_base, addr);
> -    ACPI_READ_FIELD(fadt_table->reserved3, addr);
> -    ACPI_READ_FIELD(fadt_table->plvl2_lat, addr);
> -    ACPI_READ_FIELD(fadt_table->plvl3_lat, addr);
> -    ACPI_READ_FIELD(fadt_table->flush_size, addr);
> -    ACPI_READ_FIELD(fadt_table->flush_stride, addr);
> -    ACPI_READ_FIELD(fadt_table->duty_offset, addr);
> -    ACPI_READ_FIELD(fadt_table->duty_width, addr);
> -    ACPI_READ_FIELD(fadt_table->day_alrm, addr);
> -    ACPI_READ_FIELD(fadt_table->mon_alrm, addr);
> -    ACPI_READ_FIELD(fadt_table->century, addr);
> -    ACPI_READ_FIELD(fadt_table->boot_flags, addr);
> -    ACPI_READ_FIELD(fadt_table->reserved, addr);
> -    ACPI_READ_FIELD(fadt_table->flags, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->reset_register, addr);
> -    ACPI_READ_FIELD(fadt_table->reset_value, addr);
> -    ACPI_READ_FIELD(fadt_table->arm_boot_flags, addr);
> -    ACPI_READ_FIELD(fadt_table->minor_revision, addr);
> -    ACPI_READ_FIELD(fadt_table->x_facs, addr);
> -    ACPI_READ_FIELD(fadt_table->x_dsdt, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1a_event_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1b_event_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1a_control_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1b_control_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm2_control_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm_timer_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xgpe0_block, addr);
> -    ACPI_READ_GENERIC_ADDRESS(fadt_table->xgpe1_block, addr);
> -
> -    ACPI_ASSERT_CMP(fadt_table->signature, "FACP");
> -    g_assert(!acpi_calc_checksum((uint8_t *)fadt_table,
> -                                 le32_to_cpu(fadt_table->length)));
> +    ACPI_READ_TABLE_HEADER(&hdr, addr);
> +    ACPI_ASSERT_CMP(hdr.signature, "FACP");
> +
> +    ACPI_READ_FIELD(data->facs_addr, addr);
> +    ACPI_READ_FIELD(data->dsdt_addr, addr);
>  }
>  
>  static void sanitize_fadt_ptrs(test_data *data)
> @@ -206,6 +154,12 @@ static void sanitize_fadt_ptrs(test_data *data)
>              continue;
>          }
>  
> +        /* check original FADT checksum before sanitizing table */
> +        g_assert(!(uint8_t)(
> +            acpi_calc_checksum((uint8_t *)sdt, sizeof(AcpiTableHeader)) +
> +            acpi_calc_checksum((uint8_t *)sdt->aml, sdt->aml_len)
> +        ));
> +
>          /* sdt->aml field offset := spec offset - header size */
>          memset(sdt->aml + 0, 0, 4); /* sanitize FIRMWARE_CTRL(36) ptr */
>          memset(sdt->aml + 4, 0, 4); /* sanitize DSDT(40) ptr */
> @@ -226,7 +180,7 @@ static void sanitize_fadt_ptrs(test_data *data)
>  static void test_acpi_facs_table(test_data *data)
>  {
>      AcpiFacsDescriptorRev1 *facs_table = &data->facs_table;
> -    uint32_t addr = le32_to_cpu(data->fadt_table.firmware_ctrl);
> +    uint32_t addr = le32_to_cpu(data->facs_addr);
>  
>      ACPI_READ_FIELD(facs_table->signature, addr);
>      ACPI_READ_FIELD(facs_table->length, addr);
> @@ -265,7 +219,7 @@ static void fetch_table(AcpiSdtTable *sdt_table, uint32_t addr)
>  static void test_acpi_dsdt_table(test_data *data)
>  {
>      AcpiSdtTable dsdt_table;
> -    uint32_t addr = le32_to_cpu(data->fadt_table.dsdt);
> +    uint32_t addr = le32_to_cpu(data->dsdt_addr);
>  
>      fetch_table(&dsdt_table, addr);
>      ACPI_ASSERT_CMP(dsdt_table.header.signature, "DSDT");
> @@ -674,7 +628,7 @@ static void test_acpi_one(const char *params, test_data *data)
>      test_acpi_rsdp_address(data);
>      test_acpi_rsdp_table(data);
>      test_acpi_rsdt_table(data);
> -    test_acpi_fadt_table(data);
> +    fadt_fetch_facs_and_dsdt_ptrs(data);
>      test_acpi_facs_table(data);
>      test_acpi_dsdt_table(data);
>      fetch_rsdt_referenced_tables(data);
> 
