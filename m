Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp748904wrw;
        Fri, 9 Nov 2018 06:27:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5d3Qs+bXsVnNrP3REdav31M1jfdbDd4yZh8VljKkGmzcYs/i2cSudC6+p+vOcQ5JNfIL/mm
X-Received: by 2002:a0c:bb82:: with SMTP id i2mr8817089qvg.159.1541773672258;
        Fri, 09 Nov 2018 06:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541773672; cv=none;
        d=google.com; s=arc-20160816;
        b=tbTfQWsqEpPY7C2cKK3thGsLGLf8OeUyVU3ieVU4zwqCW2Xf87QNxntm1wQ+0AfZhF
         xwioBjDQ7NSOf7fiS2xwRmGWJEbn7tXZZxMyn7OhDsXsdA+O8+uu0xfAWtX9Of+vA4J1
         xlEYDs1JgCn/zNKjnVY9MUnPsw7e5HAGoPcUWNYtaUVYWpLvejWobDGJR/N51j+GCvEd
         jSBQpOyxSRKbYPhYfF7mBADX4VgI8TRk4jfvny+7Fi7cCpUzkm3UoLXo1R0c52aSzTpU
         w346D8W/vrO/Uk3xKDKukZjEnCr5mxZ5X891xR+JcoBohEhOPZI4JsZA9iVeluNqRKnG
         KJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=hNMjJkbuNY23hO4lqqsoNxmH4FhzrVgAGA8RwkDTHvE=;
        b=L5yJsPRWqXBZoSFKxtrQfU2ya+hDJ5vVByi9CM/Ta1kDu/QtKtrweaV7VyxJ4m3m3H
         mnyPESHDtOZ0K2AJEcDqqgLkeK2qtPf75l1HwdSJjtNdgQWssuAuhw1iWMS/U/S2RnGJ
         ZrLwlEC6jy4FpjxrjdNNEtLGaZF+m9w2lJgLAz3eL/JEBFtTSvDH8HzBlPUnFymye2pp
         NKCiIL24/stl8p0d9o/XAAV9u76idkKzKcg+AyGDbSN4fvyW3FV8Op0rTkYiNTASCjH5
         +/G91DJYQR6lRzExeT8UoXzyilug15YgjK+vxIuivCFdXugSlcP31W0w5pPD3t4On5Z1
         6Q9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v40si935502qtv.322.2018.11.09.06.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 06:27:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL7lH-0001X4-Q3
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 09:27:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7l8-0001VB-0C
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 09:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7ky-0003Nc-C9
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 09:27:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gL7kx-0003K9-Lu; Fri, 09 Nov 2018 09:27:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAFC5C050DEE;
	Fri,  9 Nov 2018 14:27:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE615D717;
	Fri,  9 Nov 2018 14:27:18 +0000 (UTC)
Date: Fri, 9 Nov 2018 15:27:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181109152716.236d3c6e@redhat.com>
In-Reply-To: <20181105014047.26447-3-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-3-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Nov 2018 14:27:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 02/24] hw: acpi: Export ACPI build
 alignment API
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
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gio9/FjbZ3at

On Mon,  5 Nov 2018 02:40:25 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> This is going to be needed by the Hardware-reduced ACPI routines.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
the patch is probably misplaced withing series,
if there is an external user within this series then this patch should
be squashed there, otherwise it doesn't belong to this series.

> ---
>  include/hw/acpi/aml-build.h | 2 ++
>  hw/acpi/aml-build.c         | 8 ++++++++
>  hw/i386/acpi-build.c        | 8 --------
>  3 files changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6c36903c0a..73fc6659f2 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -384,6 +384,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
>               const char *oem_id, const char *oem_table_id);
>  void *acpi_data_push(GArray *table_data, unsigned size);
>  unsigned acpi_data_len(GArray *table);
> +/* Align AML blob size to a multiple of 'align' */
> +void acpi_align_size(GArray *blob, unsigned align);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
>  void acpi_build_tables_init(AcpiBuildTables *tables);
>  void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 1e43cd736d..51b608432f 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1565,6 +1565,14 @@ unsigned acpi_data_len(GArray *table)
>      return table->len;
>  }
> =20
> +void acpi_align_size(GArray *blob, unsigned align)
> +{
> +    /* Align size to multiple of given size. This reduces the chance
> +     * we need to change size in the future (breaking cross version migr=
ation).
> +     */
> +    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> +}
> +
>  void acpi_add_table(GArray *table_offsets, GArray *table_data)
>  {
>      uint32_t offset =3D table_data->len;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d0362e1382..81d98fa34f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -282,14 +282,6 @@ static void acpi_get_pci_holes(Range *hole, Range *h=
ole64)
>                                                 NULL));
>  }
> =20
> -static void acpi_align_size(GArray *blob, unsigned align)
> -{
> -    /* Align size to multiple of given size. This reduces the chance
> -     * we need to change size in the future (breaking cross version migr=
ation).
> -     */
> -    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> -}
> -
>  /* FACS */
>  static void
>  build_facs(GArray *table_data, BIOSLinker *linker)

