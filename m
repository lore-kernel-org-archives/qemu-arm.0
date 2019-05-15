Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp26733wrg;
        Tue, 14 May 2019 18:11:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweaZR40Lm7BeO+q4pS7j+ZavSUTCVa4wZIvTVS8rWn33s29Ne4S2iCiRYOrYmipF8qfkqp
X-Received: by 2002:a17:906:2acf:: with SMTP id m15mr15570632eje.31.1557882660951;
        Tue, 14 May 2019 18:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557882660; cv=none;
        d=google.com; s=arc-20160816;
        b=SodeDw10YPLJb1yVE/OLJTbzd5T8akUhO3B/JMymfvC7E6KImFWEgR5wtV6CFQC6zZ
         M9bChoRKeJ5XAeft4kqqMEvpF8dkdNJlbFYU5TrBsoLocclJW+xNXc9y5D1370ihVr9J
         rPAaGdZyYZBi47Rv7ueP2RCiZXPSlDQqoE20YmpLb5duiAd2Hrv3kQXLNm7+vbc68Bn6
         e6nkiK2gorUg2F0tCzNKyHobc7nVCYzDVXqKpXgU6ojmR4JRLRrzOvMzC52hX4L2GNs4
         zmZv7PbVn4ZpG4JpGEj6AqUz1zfW0EqfALCgZTPrKNrPZPPypK8GPwIapJQZVkZrSG7F
         llbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=PU0ahnnz2Yw+Drru1xrR3apQ5vSXutrP8LiQj6IFiPg=;
        b=lIDJtpgOW68XRuMIjIC+JCacc7jG/d+FFHwGY8zpI5PGtE9Ku4/yi2C+azcbF9tRP6
         AultwNMLlIK5TJeuJJD5/JuyIhmtEZ5lBhBfOXCehdaj3C0LBfkWGpn1O92aZL3ZlaY5
         2ypkBc5xLbRKiDstibX6lK3WFvbzXh5epA49A29Qzd8iDqv4/arOw+01Urj5PhyUgVhE
         JdVeY7bVZAs0mo8vUXvPXS4+ts3NWC6sccetv56PsU0gb8qNNvz/9xVmKCpXJrQCuC0t
         62FINqoujJpwulxCY4If7HfDVb0YuQgtmel8yXSj/fOoXK4mctZiEAHA3LvhKhFoSo6/
         vuEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si261616edd.227.2019.05.14.18.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 18:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQiRg-0003SZ-17
	for alex.bennee@linaro.org; Tue, 14 May 2019 21:11:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hQiRP-0003Rf-IM
	for qemu-arm@nongnu.org; Tue, 14 May 2019 21:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hQiRO-0006lX-GN
	for qemu-arm@nongnu.org; Tue, 14 May 2019 21:10:43 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hQiRO-0006it-Am
	for qemu-arm@nongnu.org; Tue, 14 May 2019 21:10:42 -0400
Received: by mail-qt1-f195.google.com with SMTP id k24so1394832qtq.7
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 18:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=PU0ahnnz2Yw+Drru1xrR3apQ5vSXutrP8LiQj6IFiPg=;
	b=Y0bHvq+bc9zEUKoSx4f3Q154oq0wI7x1vYU0WEIEVXeJ5G60I29mCJFRAPew5VRo57
	1Ii0Vd2snSpbzocZUMZl2K85IJhk/PBRVNO1C4L6JWiNSBbmIAEYcircRQDexc5kQg5L
	recNcCJAcP//EenD4YAxFjFoNRCbYNFPBQrEV6lrwYoSgzR3nTV4CiV27FjdXucSAk6y
	WSU4VMzhKGMQp7AQgN3jRxp67ohqf2MV0C8yb8LGqy0C5akHmKpAAqafVaCIMdNUKjKy
	OZ6iGNuhl0FsrhTezSep2KzK+SBvGWjShuqSEmQWS0DOrG5UKQBpk4S/qNk59n36Gne4
	v9yg==
X-Gm-Message-State: APjAAAVAR3R193LsDiqTqGuiryGvr8U2EwvpVF/LAeTF2I3nTl4Nmbs+
	JTRLz+8tvUMiRxxIfmufPdjOaA==
X-Received: by 2002:ac8:2af4:: with SMTP id c49mr14230189qta.83.1557882640602; 
	Tue, 14 May 2019 18:10:40 -0700 (PDT)
Received: from redhat.com ([185.54.206.10])
	by smtp.gmail.com with ESMTPSA id v22sm551377qtj.29.2019.05.14.18.10.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 18:10:39 -0700 (PDT)
Date: Tue, 14 May 2019 21:10:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514211015-mutt-send-email-mst@kernel.org>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190419003053.8260-7-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
Subject: Re: [Qemu-arm] [PATCH v4 6/6] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ugvYOCZg/pM7

On Fri, Apr 19, 2019 at 08:30:53AM +0800, Wei Yang wrote:
> build_append_foo() API doesn't need explicit endianness conversions
> which eliminates a source of errors and it makes build_mcfg() look like
> declarative definition of MCFG table in ACPI spec, which makes it easy
> to review.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Causes a regression with an invalid MCFG produced.
Dropped.

> ---
>  hw/acpi/pci.c               | 33 +++++++++++++++++++++------------
>  include/hw/acpi/acpi-defs.h | 18 ------------------
>  2 files changed, 21 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index fa0fa30bb9..341805e786 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -30,17 +30,26 @@
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
> -    AcpiTableMcfg *mcfg;
> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -
> -    mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> -
> -    /* Only a single allocation so no need to play with segments */
> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> -    mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> -
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> +    int mcfg_start = table_data->len;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    /*
> +     * PCI Firmware Specification, Revision 3.0
> +     * 4.1.2 MCFG Table Description.
> +     */
> +    /* Base address, processor-relative */
> +    build_append_int_noprefix(table_data, info->base, 8);
> +    /* PCI segment group number */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Starting PCI Bus number */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Final PCI Bus number */
> +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>  }
>  
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index f9aa4bd398..57a3f58b0c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
>  
>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>  
> -/* PCI fw r3.0 MCFG table. */
> -/* Subtable */
> -struct AcpiMcfgAllocation {
> -    uint64_t address;                /* Base address, processor-relative */
> -    uint16_t pci_segment;            /* PCI segment group number */
> -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> -    uint8_t end_bus_number;         /* Final PCI Bus number */
> -    uint32_t reserved;
> -} QEMU_PACKED;
> -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> -
> -struct AcpiTableMcfg {
> -    ACPI_TABLE_HEADER_DEF;
> -    uint8_t reserved[8];
> -    AcpiMcfgAllocation allocation[0];
> -} QEMU_PACKED;
> -typedef struct AcpiTableMcfg AcpiTableMcfg;
> -
>  /*
>   * TCPA Description Table
>   *
> -- 
> 2.19.1
