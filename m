Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1443144wrt;
        Tue, 27 Nov 2018 07:51:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5ddooJLZvFttpMxNgaxHhhPPBlbVUBOxDpkojSEJid+6fysBFXgL1Qgg3zC5fUN9LaQKHlb
X-Received: by 2002:a25:c241:: with SMTP id s62-v6mr32643130ybf.515.1543333903569;
        Tue, 27 Nov 2018 07:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543333903; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/eY+jhpe6CRM1Q8jqul9UV/hxOoYmRJqoyv6Z9DBoXs9Z1TVSGF9nfGFyJoASZpD9
         h+AjVnp+eUSPoSOKcrCkNjj/Xc72vyfKoKVWQBmjOGZPp1vx1M47z8o/qZUoz0XROad5
         v3H5NJQaT5oTLaZernzig1IWUo+2wNmlOx+815AYqT++D90FgdqY62k47tuypXx2MHZP
         wWqaySSn1mpJLW6+n2xjgrNUErUUeuSZQSka8za2wUWK/jb8Yb8FJxX7kyAhVPFvNVtv
         F1PNMy3sSPZR8Ik705rsV7NxT2RrSh63HunRfXxPrTn5EBt95TaR7kcY4PaBUIsXzJHR
         ajxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=XQM2aX+6pYMoAIa3kaojJ/1YiAmJHQ/xF8bEGd2GT4c=;
        b=lkFSdJfsQwOU4FwHHtnrBtVESXq8ziaZ5UnPB/cw0O1YWiUVlE97FWLXYWpnpGvrrp
         ijfQCyw9UPk4mjKPQFwJsKiYueVonTwfmt7kaYbIaAThJNaH/kU9J1B9W33l6vxcxl7f
         ikuOCjrq0nWv6MOIwQkOUs610wNc8D1oe+5qR6HOPWJ5Y1jYWPWP1qbHCPbpjcjZfpfs
         nj+L6ICd0XfAW/vzPtNmLRakOhmrV6S1jgA+3sCPYzuq4/rSjPRe6yC2gRlz3f6MF9We
         L2qcuYIlWj5G2WsSH5FPph6n9KJopaX5LR1yk18IajS4l4gCFfAdWsv28lUqRZyD6ZVm
         NtQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i5-v6si2867550ybk.123.2018.11.27.07.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 07:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRfeJ-0002a0-32
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 10:51:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRfeC-0002Zv-2v
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRfe8-0005RA-Ex
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:51:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRfe8-0005Nm-5q; Tue, 27 Nov 2018 10:51:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3FC6307DABD;
	Tue, 27 Nov 2018 15:51:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64AE6608C3;
	Tue, 27 Nov 2018 15:51:27 +0000 (UTC)
Date: Tue, 27 Nov 2018 16:51:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127165125.08655409@redhat.com>
In-Reply-To: <20181126162942.21258-6-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-6-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 27 Nov 2018 15:51:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 5/8] hw: arm: Convert the RSDP build to the
 buid_append_foo() API
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRKr72zVVi3C

On Mon, 26 Nov 2018 17:29:38 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> build_rsdp() is now closely following the ACPI spec instead of filling a
> mapped and packed C structure.

> With this change we will eventually be able to get rid of the
> AcpiRsdpDescriptor structure as we're just appending values to the RSDP
> file directly and not mapping this structure in memory any more.
this is not a goal, it is just byproduct when conversion is complete.
So I'd mention it in the patch that switches pc variant to a generic one
and removes structure that it's no longer in use.

maybe slightly rephrase message:
"
Instead of filling a mapped and packed C structure field in random
order and being careful about endianness and sizes, just use
build_append_int_noprefix() to compose RSDP table.
As result we will have almost 1:1 code/spec match, that's easy
to review and maintain (endian-agnostic, no pointer/sizeof math
only explicit values from spec).
"

> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/acpi-defs.h | 22 ++++++++++++++
>  hw/arm/virt-acpi-build.c    | 60 ++++++++++++++++++++++++-------------
>  2 files changed, 61 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index e7fd24c6c5..9b2f6b8043 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -61,9 +61,31 @@ typedef struct AcpiRsdpData {
>      unsigned *xsdt_tbl_offset;
>  } AcpiRsdpData;
>  
> +/* RSDP signature */
> +#define ACPI_RSDP_SIGNATURE "RSD PTR "
> +
> +/* RSDP Revisions */
>  #define ACPI_RSDP_REV_1 0
>  #define ACPI_RSDP_REV_2 2

  
> +/* RSDP lengths */
> +#define ACPI_RSDP_REV_1_LEN    20
> +#define ACPI_RSDP_REV_2_LEN    36
> +#define ACPI_RSDP_SIG_LEN      8
> +#define ACPI_RSDP_OEMID_LEN    6
> +#define ACPI_RSDP_REVISION_LEN 1
> +#define ACPI_RSDP_LEN_LEN      4
> +#define ACPI_RSDP_CHECKSUM_LEN 1
> +#define ACPI_RSDP_RESERVED_LEN 3
> +
> +/* RSDP offsets */
> +#define ACPI_RSDP_CHECKSUM_OFFSET     8
> +#define ACPI_RSDP_REVISION_OFFSET     15
> +#define ACPI_RSDP_RSDT_OFFSET         16
> +#define ACPI_RSDP_XSDT_OFFSET         24
> +#define ACPI_RSDP_EXT_CHECKSUM_OFFSET 32
likewise in previous patch, these defines aren't reused elsewhere
so it's just an extra jumps for reader to verify spec compliance.
Use constants directly with a comment beside it on the same line
if space allows or above (comment must match spec's field name
so it would be easy to find field in the spec),
see build_fadt() as an example

Beside above notes patch looks good.

> +
> +
>  /* Table structure from Linux kernel (the ACPI tables are under the
>     BSD license) */
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 2dad465ecf..d47978a55e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -368,35 +368,53 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  
>  /* RSDP */
>  static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  {
> -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> -    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> -    unsigned xsdt_pa_offset =
> -        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> -
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
>                               true /* fseg memory */);
>  
> -    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> -    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> -    rsdp->revision = rsdp_data->revision;
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
>  
> -    /* Address to be filled by Guest linker */
> +    /* Space for the RSDT address (32 bit) */
> +    build_append_int_noprefix(tbl, 0, 4);
> +
> +    /* Length */
> +    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
> +
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
>      bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
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
>  
> -    /* Checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> +                                    ACPI_RSDP_REV_1_LEN,
> +                                    ACPI_RSDP_CHECKSUM_OFFSET);
>  
>      /* Extended checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
> -        (char *)&rsdp->extended_checksum - rsdp_table->data);
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> +                                    ACPI_RSDP_REV_2_LEN,
> +                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
>  }
>  
>  static void

