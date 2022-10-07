Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp192799ocg;
        Thu, 6 Oct 2022 21:26:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hYWxvfKC4RmzY+DPw26+bj5+Iunt2SjuNy4ScdQ2Xl+oGr4PxmS8wisIZL8zHlK6FGwT7
X-Received: by 2002:a05:622a:1346:b0:390:c554:9fb6 with SMTP id w6-20020a05622a134600b00390c5549fb6mr2915977qtk.372.1665116771740;
        Thu, 06 Oct 2022 21:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665116771; cv=none;
        d=google.com; s=arc-20160816;
        b=UEucU6i2ktWBjoRIHMuR9IaH06dMSHyTWgq9GnuKTx4m0Nf+AHqpGiAhk1ZImZxLmy
         Ec/01hvbPOpuneEzN2yds8dByfGFRimYe5kOXX9Qz8CiOuGQx6nAisfOvQK3fQ7blrb/
         UpJELGmvZLRs5KriKHmUmNb8AA1ZpzyK+RsykR8NIjiwVO+27r7VmNGMPlEfGHqDNguv
         x4/4j62e8wx8oXp0aLtfyivL5c+9nLGKNkW+QijJU5eBaYsp45I0Tnx2zeJbjRTtOFA0
         54lS1aUioIKFV1pMDGOPDT60b01aFcUs+WTKee7Gcy5kXSITYQXYldFoPkL+bFQH5TRi
         7Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=EeQVZX+sj5rDGmxyvMlV3697jgna7jHM+w35ju21wGo=;
        b=H3XnfUOibAYSJt7djrEQMxQua7lQwYBMuKMJyh02S8yn/0s7yViInDviPX+CX1mG5E
         LPZ9Lb+ElQBNAo0muFMiAIGu9jJky4RBRPvArykFU9qiMQfc+XdLMqK4Z2WjDqlOX9nr
         yPGS+Ej3s4UIVXXz9nhkJ8xM5yiWQzROk2g6xXoWUYfM2rY3sXkaU73EXhxOFOpf78s/
         2rGHvLhSFIlavl6lls2Ipx9BD27uJbxLWCoBsnvdORkVWDwMKksLIRgcRoD1ji6J4+3J
         92CelKv7LTEoQ9HYb6SVsSEyX2avRG5mkoNb8xDi31/IBKhIyXDZ8VDtmRym/ou9tWOG
         mohQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=LRmQJWJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05620a0d8d00b006ced0d02b95si501590qkl.72.2022.10.06.21.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 21:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=LRmQJWJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogew7-0000Tv-Ae
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 00:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogevs-0000Tg-LY
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 00:25:56 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogevq-0001Be-Cb
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 00:25:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id b15so3450062pje.1
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 21:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EeQVZX+sj5rDGmxyvMlV3697jgna7jHM+w35ju21wGo=;
 b=LRmQJWJ6/FOoPGJA+6TZiufE68QRaBPtVo6QXMcgbM2OXg9YVKI/UaYactu2taGR3p
 Jqii604Dy45wc+wDZcreAia05CJzZTThGmxsOFDmvMXmPp1MvSm9Zalx0XhyAjUbZ46o
 zVoqCs3rMXrb4XT971986HUwfCKkK+8p5Mr6s8eJ8XQPZs8Q6ufr+UupqdmsuQDijqct
 e7ieUL4l7HBsrli5ofq1nCRWquXD3YZRQboD3Eo/9BPnwCKMbph9/YvP/NaVoK7KvLf0
 ppVJU+Qbdx37Gtdwwt1YXTmBpV4l/C/hse1xOPwnXFcXlrWKFSRqUQ4CuH5kPQovrUnB
 l8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EeQVZX+sj5rDGmxyvMlV3697jgna7jHM+w35ju21wGo=;
 b=aQpCOLTu5pwc9hRyMbDtfroq/DrT8jlJbafoJ+xjG3BHF6RgAszmWz3AOMHun4iPJK
 p9DnIwRho6PaQTj8YYAVTHtJbw3wnszlR/nYNPuSuxY3CwIQuI588vUKvsjFlFpXBUaF
 7Z7k34NYxLyxXPz77TS5DEqsSWEFwDkxSdXea8D+oYs/xLvGVwm3TG8+IcTiTK8faEDM
 BSWhNW/BBAUb19ynQ7Qvgr3rEEQJXovwiTmVULOKcEYdCVH3FFZkpNPkBWYm51FiXOfB
 /09fOqaJwinrZFhu/2BfqETvBF/5qITy+deSxqpo9GQv4wUhQ631V4fYbVXOBiBH5J1g
 nxwQ==
X-Gm-Message-State: ACrzQf0CJHl3Z37LiZy8GMd0IQ6isA68fnjbWTRmgabyW8N/EXSgbhOv
 xu3Q4KgBUP3OYmpdBSXlzGkamA==
X-Received: by 2002:a17:90b:3b90:b0:202:80ac:467c with SMTP id
 pc16-20020a17090b3b9000b0020280ac467cmr13619003pjb.17.1665116752546; 
 Thu, 06 Oct 2022 21:25:52 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.124.100])
 by smtp.googlemail.com with ESMTPSA id
 q10-20020a170902f34a00b001767f6f04efsm430206ple.242.2022.10.06.21.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 21:25:51 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 7 Oct 2022 09:55:45 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [RFC PATCH 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
In-Reply-To: <20221006161450.69912-3-miguel.luis@oracle.com>
Message-ID: <9ad43c7f-7b79-a397-9a4f-61abb3b7fa53@anisinha.ca>
References: <20221006161450.69912-1-miguel.luis@oracle.com>
 <20221006161450.69912-3-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q54WeUJXWZRp



On Thu, 6 Oct 2022, Miguel Luis wrote:

> Update the Fixed ACPI Description Table (FADT) to revision 6.0 of the ACPI
> specification adding the field "Hypervisor Vendor Identity" that was missing.
>
> This field's description states the following: "64-bit identifier of hypervisor
> vendor. All bytes in this field are considered part of the vendor identity.
> These identifiers are defined independently by the vendors themselves,
> usually following the name of the hypervisor product. Version information
> should NOT be included in this field - this shall simply denote the vendor's
> name or identifier. Version information can be communicated through a
> supplemental vendor-specific hypervisor API. Firmware implementers would
> place zero bytes into this field, denoting that no hypervisor is present in
> the actual firmware."
>
> Hereupon, what should a valid identifier of an Hypervisor Vendor ID be and
> where should QEMU provide that information?
>
> On this RFC there's the suggestion of having this information in sync by the
> current acceleration name. This also seems to imply that QEMU, which generates
> the FADT table, and the FADT consumer need to be in sync with the values of this
> field.
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  hw/acpi/aml-build.c      | 14 +++++++++++---
>  hw/arm/virt-acpi-build.c | 10 +++++-----
>  2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..5258c4ac64 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -31,6 +31,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "qemu/cutils.h"
> +#include "qemu/accel.h"
>
>  static GArray *build_alloc_array(void)
>  {
> @@ -2070,7 +2071,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      acpi_table_end(linker, &table);
>  }
>
> -/* build rev1/rev3/rev5.1 FADT */
> +/* build rev1/rev3/rev5.1/rev6.0 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
>  {
> @@ -2193,8 +2194,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      /* SLEEP_STATUS_REG */
>      build_append_gas_from_struct(tbl, &f->sleep_sts);
>
> -    /* TODO: extra fields need to be added to support revisions above rev5 */
> -    assert(f->rev == 5);
> +    if (f->rev <= 5) {

<= does not make sense. It should be f->rev == 5.
The previous code compares f->rev <= 4 since it needs to cover revisions
2, 3 and 4.

> +        goto done;
> +    }
> +
> +    /* Hypervisor Vendor Identity */
> +    build_append_padded_str(tbl, current_accel_name(), 8, '\0');

I do not think the vendor identity should change based on the accelerator.
The accelerator QEMU uses should be hidden from the guest OS as far as
possible. I would suggest a string like "QEMU" for vendor ID.

> +
> +    /* TODO: extra fields need to be added to support revisions above rev6 */
> +    assert(f->rev == 6);
>
>  done:
>      acpi_table_end(linker, &table);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9b3aee01bf..72bb6f61a5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -809,13 +809,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>
>  /* FADT */
> -static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
> +static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
>  {
> -    /* ACPI v5.1 */
> +    /* ACPI v6.0 */
>      AcpiFadtData fadt = {
> -        .rev = 5,
> -        .minor_ver = 1,
> +        .rev = 6,
> +        .minor_ver = 0,
>          .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
>          .xdsdt_tbl_offset = &dsdt_tbl_offset,
>      };
> @@ -945,7 +945,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>      /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> +    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
>
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
> --
> 2.37.3
>
>
