Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2757466wri;
        Fri, 8 Nov 2019 08:18:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwv4GUlik19tlk0341mQrOc8gTdABbQhojkJmALNKun1lWqySc6cqD5++WPL/rEFg5Aj7m+
X-Received: by 2002:a37:98c6:: with SMTP id a189mr9678678qke.230.1573229903308;
        Fri, 08 Nov 2019 08:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573229903; cv=none;
        d=google.com; s=arc-20160816;
        b=ikjShztAzeJ0Hj0gye+dnlY7qaW4MW7Bn01EMH6+32SQ/gZHJJL6YsvXVVnluRUlfQ
         3XqRgLKeJYvr+kLhjXzIbfb2M/jTodUPk+gOrPaVs699h7KdKlfKQpcwzv/BtTyrW4wi
         finyq1TCcFGMzTiR8U/VXv73iHrBKZoNhKV88hhubNxZFRMgP/AMu7AkNoCPTj3x9bBQ
         8Tcf89TT4+s5v7BRYoOSQ+ZIJexW8f99m+SOSMHlrEkRhlwuFBbLgyvaC2rrrBnNxU7V
         mb/QBgNAQD0g1PDNpAuGcxuZmmHVH/TDqW5Mb7pvjYg8hP+Q1qNLH0McX1K6+TCBRmi0
         AFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=b4Jix9NabG0otXDbqUQ6itxjepo67TQzsB7CUbH+vJw=;
        b=AiRY7jofwT0eK9VqFeMlrJPmWHwtl5UmsQIVcCAGEw8eogDGzBsEFek4TyDMsdMsLr
         dpXZRzKyJLZG7xYv+A/Bb2VIOFqVWlY+6oJqf2Rn2mFgCD46+N9cwqsYyQq1JZF92k9R
         6L2Z+l50q/3EPrMjZn2S6cyZ+Vxp1S7ChO7+OrjTSz62RoagFKdYdVl5F9XG4+Z/nHtc
         9Rcl6dL8h49wkaeRDah20MrmPs7GDlrzY4wnzhQpf9rDgvqoaAGEP2xtsT8uPaRtWctj
         FdtbA7IHnP0SGMgrXULDai9/+yKqGfG+Mkq7ztsQeLip2hV1zfakjjXHy88bB6ZxWB4Z
         Bf5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E9DnldRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 46si3902608qte.107.2019.11.08.08.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2019 08:18:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E9DnldRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iT6xq-0006Sy-FA
	for alex.bennee@linaro.org; Fri, 08 Nov 2019 11:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iT6xY-0006Pz-9j
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 11:18:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iT6xW-0002Hp-0K
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 11:18:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47873
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iT6xV-0002H9-44
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 11:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573229880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4Jix9NabG0otXDbqUQ6itxjepo67TQzsB7CUbH+vJw=;
 b=E9DnldRXsAOyCiY5BUO78RYATb2XBv2jrBw/Vf12xCEG9to4GXDcqrr2db2y1JkKHvSOTO
 CUBz30zq/hql375wEeHmJCo0jMKGMYsqJmqX8KvDEejBqusH0rZdYKsPFOkFNLZs2pgHBX
 hdF5yPdW3x7RUQ3ceYDIBmr7m0GPewg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-mdUmDLnVPaiJWgUvaJ-k6A-1; Fri, 08 Nov 2019 11:17:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 618028017DD;
 Fri,  8 Nov 2019 16:17:55 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D3D5D6B7;
 Fri,  8 Nov 2019 16:17:47 +0000 (UTC)
Date: Fri, 8 Nov 2019 17:17:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 1/5] hw/arm: Align ACPI blob len to PAGE size
Message-ID: <20191108171745.1465295b@redhat.com>
In-Reply-To: <20191004155302.4632-2-shameerali.kolothum.thodi@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
 <20191004155302.4632-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mdUmDLnVPaiJWgUvaJ-k6A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ElKjVLfbme5T

On Fri, 4 Oct 2019 16:52:58 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> If ACPI blob length modifications happens after the initial
> virt_acpi_build() call, and the changed blob length is within
> the PAGE size boundary, then the revised size is not seen by
> the firmware on Guest reboot. The is because in the
> virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize()
> path, qemu_ram_resize() uses ram_block size which is aligned
> to PAGE size and the "resize callback" to update the size seen
> by firmware is not getting invoked. Hence align ACPI blob sizes
> to PAGE boundary.
>=20
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> More details on this issue can be found here,
> https://patchwork.kernel.org/patch/11154757/
re-read it again and it seems to me that this patch is workaround
rather than a solution to the problem.
CCing Michael as an author this code.

on x86 we have crazy history of manually aligning acpi blobs, see code unde=
r comment

  /* We'll expose it all to Guest so we want to reduce

so used_length endups with over-sized value which includes table and paddin=
g
and it happens that ACPI_BUILD_TABLE_SIZE is much bigger than host page siz=
e
so if on reboot we happen to exceed ACPI_BUILD_TABLE_SIZE, the next padded =
table
size (used_length) would be  2 x ACPI_BUILD_TABLE_SIZE which doesn't trigge=
r
  block->used_length =3D=3D HOST_PAGE_ALIGN(newsize)
condition so fwcfg gets updated value.


> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4cd50175e0..074e0c858e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -790,6 +790,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
>      GArray *tables_blob =3D tables->table_data;
> +    GArray *cmd_blob =3D tables->linker->cmd_blob;
>      MachineState *ms =3D MACHINE(vms);
> =20
>      table_offsets =3D g_array_new(false, true /* clear */,
> @@ -854,6 +855,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuil=
dTables *tables)
>          build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>      }
> =20
> +    /*
> +     * Align the ACPI blob lengths to PAGE size so that on ACPI table
> +     * regeneration, the length that firmware sees really gets updated
> +     * through 'resize' callback in qemu_ram_resize() in the
> +     * virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize(=
)
> +     * path.
> +     */
> +    g_array_set_size(tables_blob,
> +                     TARGET_PAGE_ALIGN(acpi_data_len(tables_blob)));
here it would depend on TARGET_PAGE_ALIGN vs HOST_PAGE_ALIGN relation
so depending on host it could flip it's behavior to opposite.

one thing we could do is dropping (block->used_length =3D=3D newsize) condi=
tion
another is to use value of block->used_length for s->files->f[index].size.

Michael,
what's your take in this?

> +    g_array_set_size(tables->rsdp,
> +                     TARGET_PAGE_ALIGN(acpi_data_len(tables->rsdp)));
> +    g_array_set_size(cmd_blob,
> +                     TARGET_PAGE_ALIGN(acpi_data_len(cmd_blob)));
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
>  }

