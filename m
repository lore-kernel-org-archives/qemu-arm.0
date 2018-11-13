Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4538665wrw;
        Tue, 13 Nov 2018 07:59:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5e91lURVbOPcXLA3jeJ8ythoCo90bqjNVD+BP8dJeWU51q5wA2aU24RKBaQdxGj/tJM1UbM
X-Received: by 2002:ac8:3618:: with SMTP id m24mr5421864qtb.210.1542124796175;
        Tue, 13 Nov 2018 07:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542124796; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqdbswO26GIz4xkY3wTVjOXaMUSyOIQGfyHp6dONpdBYLg1pLSSZnnYS+mdAV7WRvu
         1LW7kOBmszQvnVsf4MwgbY3+KBEdb3jtUKhKRpTI8qZm/de1MfRU34n+KI1WcQ/HWOd2
         j9r2Ah7gFpvMN/nlB5bhCy1PyrIGUTjGaDlWbjv1t3Av4Mr03u4EFNv6KYpbFFUvuE0l
         RpiK7a32G0AgcMe4PEsrO75q6sI+6ScSGrpWsuZhW36pT9L8NxaQ5p6lcUNxtFHl6GmJ
         JyRY2aYqhTEKUMQKCTgYH7ptJnkBhCiH5zyTxc3tgDe3YXmpo0pV4vf/b59pRc3xzPw6
         uxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=04JHERlXsCv8qC4ydZEv24Nq/H/962qZqZWaGEtdNVQ=;
        b=ErPrVK2dlCoON7jRKhchFcb0gvoCRZbopXPJFw+bkFI0M0Qb5gB4tHhAb6efiTBR4N
         7oPlblNclPbPSDsqoq0dV0CK8DObhNTgkj8rFJFutd3HvzHLjB5WplBlajopteFFAuY9
         +/sl18ZnYJZrxBv5tq4QzjOjNl+d4JE7HIMRVpIyJiHjAq1dczvDSa/nsOayruqgACXO
         BKiW5oIoWNsuiZQQQq6rVl7qOgJsK7FD36p7O5D1yceBCO3+1LVNzfmb4fmia2xuLXZq
         /P3rsZoO1nY2DR+4wSa+/rGHD1T8Cv9/x3Pp+kjPTBgoc/X80s1fdVbNFzahAI+wpsYF
         LTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si4376305qvj.53.2018.11.13.07.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMb6Z-0001n3-Jr
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:59:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gMb6Q-0001mx-CF
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:59:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gMb6J-00028c-Cw
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:59:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gMb6D-000267-1J; Tue, 13 Nov 2018 10:59:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD80137F41;
	Tue, 13 Nov 2018 15:59:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36751600D7;
	Tue, 13 Nov 2018 15:59:20 +0000 (UTC)
Date: Tue, 13 Nov 2018 16:59:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181113165918.5cc2b2b5@redhat.com>
In-Reply-To: <20181105014047.26447-11-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-11-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 13 Nov 2018 15:59:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 10/24] hw: acpi: Export the
 PCI host and holes getters
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bnc/NCafZ5v2

On Mon,  5 Nov 2018 02:40:33 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> This is going to be needed by the hardware reduced implementation, so
> let's export it.
> Once the ACPI builder methods and getters will be implemented, the
> acpi_get_pci_host() implementation will become hardware agnostic.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 43 +++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c        | 47 ++-----------------------------------
>  3 files changed, 47 insertions(+), 45 deletions(-)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index c27c0935ae..fde2785b9a 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -400,6 +400,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
>               const char *oem_id, const char *oem_table_id);
>  void *acpi_data_push(GArray *table_data, unsigned size);
>  unsigned acpi_data_len(GArray *table);
> +Object *acpi_get_pci_host(void);
> +void acpi_get_pci_holes(Range *hole, Range *hole64);
>  /* Align AML blob size to a multiple of 'align' */
>  void acpi_align_size(GArray *blob, unsigned align);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 2b9a636e75..b8e32f15f7 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1601,6 +1601,49 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>      g_array_free(tables->vmgenid, mfre);
>  }

> +/*
> + * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> + */
> +Object *acpi_get_pci_host(void)
> +{
> +    PCIHostState *host;
> +
> +    host = OBJECT_CHECK(PCIHostState,
> +                        object_resolve_path("/machine/i440fx", NULL),
> +                        TYPE_PCI_HOST_BRIDGE);
> +    if (!host) {
> +        host = OBJECT_CHECK(PCIHostState,
> +                            object_resolve_path("/machine/q35", NULL),
> +                            TYPE_PCI_HOST_BRIDGE);
> +    }
> +
> +    return OBJECT(host);
> +}
in general aml-build.c is a place to put ACPI spec primitives,
so I'd suggest to move it somewhere else.

Considering it's x86 code (so far), maybe move it to something like
hw/i386/acpi-pci.c

Also it might be good to get rid of acpi_get_pci_host() and pass
a pointer to pci_host as acpi_setup() an argument, since it's static
for life of boar we can keep it in AcpiBuildState, and reuse for
mfg/pci_hole/pci bus accesses.
That way we can simplify code a bit and avoid lookup cost of
object_resolve_path() that's called several times unnecessarily.

> +void acpi_get_pci_holes(Range *hole, Range *hole64)
> +{
> +    Object *pci_host;
> +
> +    pci_host = acpi_get_pci_host();
> +    g_assert(pci_host);
> +
> +    range_set_bounds1(hole,
> +                      object_property_get_uint(pci_host,
> +                                               PCI_HOST_PROP_PCI_HOLE_START,
> +                                               NULL),
> +                      object_property_get_uint(pci_host,
> +                                               PCI_HOST_PROP_PCI_HOLE_END,
> +                                               NULL));
> +    range_set_bounds1(hole64,
> +                      object_property_get_uint(pci_host,
> +                                               PCI_HOST_PROP_PCI_HOLE64_START,
> +                                               NULL),
> +                      object_property_get_uint(pci_host,
> +                                               PCI_HOST_PROP_PCI_HOLE64_END,
> +                                               NULL));
> +}
> +
>  static void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit)
>  {
>      CrsRangeEntry *entry;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index bd147a6bd2..a5f5f83500 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -232,49 +232,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>      info->applesmc_io_base = applesmc_port();
>  }
>  
> -/*
> - * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> - * On i386 arch we only have two pci hosts, so we can look only for them.
> - */
> -static Object *acpi_get_i386_pci_host(void)
> -{
> -    PCIHostState *host;
> -
> -    host = OBJECT_CHECK(PCIHostState,
> -                        object_resolve_path("/machine/i440fx", NULL),
> -                        TYPE_PCI_HOST_BRIDGE);
> -    if (!host) {
> -        host = OBJECT_CHECK(PCIHostState,
> -                            object_resolve_path("/machine/q35", NULL),
> -                            TYPE_PCI_HOST_BRIDGE);
> -    }
> -
> -    return OBJECT(host);
> -}
> -
> -static void acpi_get_pci_holes(Range *hole, Range *hole64)
> -{
> -    Object *pci_host;
> -
> -    pci_host = acpi_get_i386_pci_host();
> -    g_assert(pci_host);
> -
> -    range_set_bounds1(hole,
> -                      object_property_get_uint(pci_host,
> -                                               PCI_HOST_PROP_PCI_HOLE_START,
> -                                               NULL),
> -                      object_property_get_uint(pci_host,
> -                                               PCI_HOST_PROP_PCI_HOLE_END,
> -                                               NULL));
> -    range_set_bounds1(hole64,
> -                      object_property_get_uint(pci_host,
> -                                               PCI_HOST_PROP_PCI_HOLE64_START,
> -                                               NULL),
> -                      object_property_get_uint(pci_host,
> -                                               PCI_HOST_PROP_PCI_HOLE64_END,
> -                                               NULL));
> -}
> -
>  /* FACS */
>  static void
>  build_facs(GArray *table_data, BIOSLinker *linker)
> @@ -1634,7 +1591,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          Object *pci_host;
>          PCIBus *bus = NULL;
>  
> -        pci_host = acpi_get_i386_pci_host();
> +        pci_host = acpi_get_pci_host();
>          if (pci_host) {
>              bus = PCI_HOST_BRIDGE(pci_host)->bus;
>          }
> @@ -2008,7 +1965,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      Object *pci_host;
>      QObject *o;
>  
> -    pci_host = acpi_get_i386_pci_host();
> +    pci_host = acpi_get_pci_host();
>      g_assert(pci_host);
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);

