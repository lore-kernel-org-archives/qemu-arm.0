Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp37127wrt;
        Mon, 26 Nov 2018 09:20:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VSw240IqCOLTdiAhmnlDsDqPnz3jLjVIKSxDiAuKi26FjQFVmwu/XhJa23UrSZiqRWXBXD
X-Received: by 2002:a81:b548:: with SMTP id c8mr24818145ywk.414.1543252855662;
        Mon, 26 Nov 2018 09:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543252855; cv=none;
        d=google.com; s=arc-20160816;
        b=lvdRcvBJGCGBgHO+yjEu3+PfQTdotRX0gTnywlGF9X4iS85RrJzy5HqPPiKgfs41GQ
         5yhEjXfNHNETgIetjdai0h6k+ojqG7HFzMyJAUiXrdiI152rwogcvLNo8w5iEIulRUdK
         jRazgxQGNJzBjnXxeVRIhcvBIi7gD6NLDTQyUiOpZZHybNh3QmBo59hmNqQdfuHT49Hh
         7ipdJ78qfLek7aGW5x04E46io/WaocJoyurcS1CJ4ZQr5qApNgOC9f2ojupTKMHQqZRw
         SjwKWd9RlswGCIXBwGfS9FtGOC18JHZtQn1kIM3Yk14RIAOLTby/wR2eAELiLXpyG61b
         JB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=CONLzY9ZtHcmZDvEhNepNXh4TG54Rf9OU+LZEV9qRG0=;
        b=n0k0golhzn84l9R51uFIpfEkJy84kXMKUd4CBIdATy9r1T0712frkaVKzZ8s4TemmH
         QkevB6ww3jVTwJFYK0KRIKWSvLjx3gBz4qmPpynK8iRtPwY8Z34VhOzucKiEeOTvBZV3
         ufJWq76q54iOL44zLmVXGE4/D4MCOsgpw07l33ZNMOJA6yqJDt+QDLh246Jl5pzxLERS
         meaqWIGQBHqW3rUt5Su32kndXA/0O0wtHSX9vS9rUhWje9eCoqNFzBVFTmgbfWV6q+Wx
         VYt1AMW/YHkOoguILQYWezfXDUXHiUYHm6+yhKJFxvL5JExhNUbQv/77eOmTvga8yfNl
         O9lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u130si693500ywu.26.2018.11.26.09.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 09:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRKZ5-0000bt-2C
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 12:20:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKYI-0000Vq-Ea
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 12:20:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKYD-0005AL-Ic
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 12:20:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRKYD-00059u-9B
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 12:20:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id g67so5905116wmd.2
	for <qemu-devel@nongnu.org>; Mon, 26 Nov 2018 09:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CONLzY9ZtHcmZDvEhNepNXh4TG54Rf9OU+LZEV9qRG0=;
	b=DrTa38W/VEvJvv47iugf20oKFQ1N+wbOw51aVUjo91dW7SoUmKi5UEBc2XzYdLIPea
	snfQWklxj7v6N8CZIhSirPaehuiZWhgSauVvMl+8ftXXacLDrXZDLKqONmgeWTKKYUja
	Ry8TEytd3UiEycVHTpbxIMwA77aqFgjhEd+bk6djriMT+8EA8db+E2AKPa1RjMG4oWqi
	y+WKW/za20e1ua0XfixnET6I+mFrMI4Vi6bk173aGCm9ax6FNeXFu5X71s6MQpvdW7nF
	CwkchJ/iuT1Ta7yRag1hAUlccit6KWyFpjdiKihnnNCwlNd97/To5m1pv3uV5wdg/358
	fZEw==
X-Gm-Message-State: AGRZ1gK2rOfsdFxXJvP3hO/oiiCAwC6uYFvIq4VG6GSS0OagJJupyJvm
	dvOLhMCqS0/yp+eA2Kal7Ll58Q==
X-Received: by 2002:a1c:dc83:: with SMTP id
	t125-v6mr23809350wmg.78.1543252800010; 
	Mon, 26 Nov 2018 09:20:00 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	v19sm1221535wrd.46.2018.11.26.09.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:19:58 -0800 (PST)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-8-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d6759592-ab06-ef5a-bb17-d94097a6cb6f@redhat.com>
Date: Mon, 26 Nov 2018 18:19:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181126162942.21258-8-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH 7/8] hw: acpi: Export and share the ARM
 RSDP build
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTFzO8FlygQT

Hi Samuel,

On 26/11/18 17:29, Samuel Ortiz wrote:
> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/aml-build.h |  5 +++
>  hw/acpi/aml-build.c         | 81 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 81 -------------------------------------
>  hw/i386/acpi-build.c        | 34 ++--------------
>  4 files changed, 90 insertions(+), 111 deletions(-)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6c36903c0a..1bbe496e32 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -388,6 +388,11 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
>  void acpi_build_tables_init(AcpiBuildTables *tables);
>  void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
>  void
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
> +void
> +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> +               unsigned *rsdt_offset, unsigned *xsdt_offset);
> +void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id);
>  void
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 1e43cd736d..d4e15980f1 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1589,6 +1589,87 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>      g_array_free(tables->vmgenid, mfre);
>  }
>  
> +/* RSDP */
> +void
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> +{
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
> +                             true /* fseg memory */);
> +
> +    /* RSDP signature */
> +    g_array_append_vals(tbl, ACPI_RSDP_SIGNATURE, ACPI_RSDP_SIG_LEN);
> +
> +    /* Space for the checksum */
> +    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
> +
> +    /* OEM ID */
> +    g_array_append_vals(tbl, rsdp_data->oem_id, ACPI_RSDP_OEMID_LEN);
> +
> +    /* Revision */
> +    build_append_int_noprefix(tbl, rsdp_data->revision,
> +                              ACPI_RSDP_REVISION_LEN);
> +
> +    /* Space for the RSDT address (32 bit) */
> +    build_append_int_noprefix(tbl, 0, 4);
> +
> +    if (rsdp_data->rsdt_tbl_offset) {
> +        /* RSDT address to be filled by guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
> +
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> +                                    ACPI_RSDP_REV_1_LEN,
> +                                    ACPI_RSDP_CHECKSUM_OFFSET);
> +
> +    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
> +        /* Legacy RSDP, we're done */
> +        return;
> +    }
> +
> +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> +
> +    /* Length */
> +    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
> +
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
> +    bios_linker_loader_add_pointer(linker,
> +                                   ACPI_BUILD_RSDP_FILE,
> +                                   ACPI_RSDP_XSDT_OFFSET, 8,
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   *rsdp_data->xsdt_tbl_offset);
> +
> +    /* Space for the extended checksum */
> +    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
> +
> +    /* Space for the reserved bytes */
> +    build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> +                                    ACPI_RSDP_REV_2_LEN,
> +                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
> +}
> +
> +void
> +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> +{
> +    /* Caller must provide an OEM ID */
> +    g_assert(oem_id);
> +    g_assert(strlen(oem_id) >= 6);
> +
> +    memcpy(data->oem_id, oem_id, 6);
> +    data->revision = revision;
> +    data->rsdt_tbl_offset = rsdt_offset;
> +    data->xsdt_tbl_offset = xsdt_offset;
> +}
> +
>  /* Build rsdt table */
>  void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 10f8388b63..3fe86fd33e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -366,87 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
>  
> -/* RSDP */
> -static void
> -build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> -{
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
> -                             true /* fseg memory */);
> -
> -    /* RSDP signature */
> -    g_array_append_vals(tbl, ACPI_RSDP_SIGNATURE, ACPI_RSDP_SIG_LEN);
> -
> -    /* Space for the checksum */
> -    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
> -
> -    /* OEM ID */
> -    g_array_append_vals(tbl, rsdp_data->oem_id, ACPI_RSDP_OEMID_LEN);
> -
> -    /* Revision */
> -    build_append_int_noprefix(tbl, rsdp_data->revision,
> -                              ACPI_RSDP_REVISION_LEN);
> -
> -    /* Space for the RSDT address (32 bit) */
> -    build_append_int_noprefix(tbl, 0, 4);
> -
> -    if (rsdp_data->rsdt_tbl_offset) {
> -        /* RSDT address to be filled by guest linker */
> -        bios_linker_loader_add_pointer(linker,
> -                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> -                                       ACPI_BUILD_TABLE_FILE,
> -                                       *rsdp_data->rsdt_tbl_offset);
> -    }
> -
> -    /* Checksum to be filled by guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> -                                    ACPI_RSDP_REV_1_LEN,
> -                                    ACPI_RSDP_CHECKSUM_OFFSET);
> -
> -    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
> -        /* Legacy RSDP, we're done */
> -        return;
> -    }
> -
> -    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> -    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> -
> -    /* Length */
> -    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
> -
> -    /* XSDT address to be filled by guest linker */
> -    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
> -    bios_linker_loader_add_pointer(linker,
> -                                   ACPI_BUILD_RSDP_FILE,
> -                                   ACPI_RSDP_XSDT_OFFSET, 8,
> -                                   ACPI_BUILD_TABLE_FILE,
> -                                   *rsdp_data->xsdt_tbl_offset);
> -
> -    /* Space for the extended checksum */
> -    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
> -
> -    /* Space for the reserved bytes */
> -    build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
> -
> -    /* Extended checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> -                                    ACPI_RSDP_REV_2_LEN,
> -                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
> -}
> -
> -static void
> -init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> -               unsigned *rsdt_offset, unsigned *xsdt_offset)
> -{
> -    /* Caller must provide an OEM ID */
> -    g_assert(oem_id);
> -    g_assert(strlen(oem_id) >= 6);
> -
> -    memcpy(data->oem_id, oem_id, 6);
> -    data->revision = revision;
> -    data->rsdt_tbl_offset = rsdt_offset;
> -    data->xsdt_tbl_offset = xsdt_offset;
> -}
> -
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fb877648ac..f7ab112599 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
>  
> -static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
> -{
> -    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as result we
> -     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep extra 16 bytes
> -     * wasted to make sure we won't breake migration for machine types older
> -     * than 2.3 due to size mismatch.
> -     */
> -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> -    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
> -    unsigned rsdt_pa_offset =
> -        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> -
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> -                             true /* fseg memory */);
> -
> -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> -    /* Address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> -
> -    /* Checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> -}
> -
>  typedef
>  struct AcpiBuildState {
>      /* Copy of table in RAM (for patching). */
> @@ -2625,6 +2596,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      GArray *tables_blob = tables->table_data;
>      AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>      Object *vmgenid_dev;
> +    AcpiRsdpData rsdp;
>  
>      acpi_get_pm_info(&pm);
>      acpi_get_misc_info(&misc);
> @@ -2732,7 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                 slic_oem.id, slic_oem.table_id);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
> -    build_rsdp(tables->rsdp, tables->linker, rsdt);
> +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_1,
> +                   &rsdt, NULL);

If you ever respin this series, please consider split this patch in 2:
- Export/use init_rsdp_data()
- current patch
This will ease review. The patch is fine regardless :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    build_rsdp(tables->rsdp, tables->linker, &rsdp);
>  
>      /* We'll expose it all to Guest so we want to reduce
>       * chance of size changes.
> 
