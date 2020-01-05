Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22327139lff;
        Sun, 5 Jan 2020 04:34:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxFs7XibMrep/r4uHGb20/Cww9kYcCuOpTz8v7zb24R3tkYBBWB2OZYIggX7+UbI11u4Dz/
X-Received: by 2002:a05:6214:14a6:: with SMTP id bo6mr76272277qvb.8.1578227655079;
        Sun, 05 Jan 2020 04:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578227655; cv=none;
        d=google.com; s=arc-20160816;
        b=EGtEXmTYuOKnPfAH7fHA2Wr9CjO7O7xkh+XdLSsrJ6n+TiEH46ugISaK1sITG5C1kB
         tjo0a4tlsfjiUCZNeW7400qT6AG7MPCoPfEsoVOqQQO0Tnig5FOQXhOogaTBJmTU1uHc
         nWn8Ce1WANgLx8R3g8skqHXhb6EIH2a+hkErG87cPaJbUyAPTNAiTWLwkxPoVw2n24ee
         rT0akAztrDPL/5b7yNUsI6XgbVpXPjYGzoOm78ZmXGcAnkOkJm9Hrix6B9IjwMDcuNID
         Hxl46RUh5cV3kl/w9skrxK8yO8acZUNP5y9BqzLk4aHQDPmKYuIThsjL1/mhYeiwJ9XW
         17Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=f8Prri9WaGRO65yjl09PcbeCr+ZCjA9X+9asGScE0xU=;
        b=sFkjyN1ntK/swddKNa89RV/cjaOJYaUEkEACrLQYSGZIrds+4+c664NgtJnSeP4B3m
         Y/231o23LBDiJMBSt/gNTDdHsDqlqPu82OCLO6cmPq/YMgZnK5dfGN7ytt5GWHTKE0Y6
         RXAfs02olQKqjgDkWNCg32H9HRFOghYSouZfZ3hbkXN8HkpQUZ5ZAmZDqY4dm6pNvxoT
         8MUuDSLa7BCxBxYiSQtnrpb/g0VtTKGzCD/JEGTRNo361ZXRZz4Nya/7oFPA1L9GFHt8
         G0/r7AVKbNDE5zit+zoDMdfJd7yAVIjDQtfkfS5/fA21Hq7J5JxCyimQswrAiM0gn8lR
         gFVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C00yjHFp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si27304433qto.70.2020.01.05.04.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 04:34:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C00yjHFp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1io56k-0003J3-DI
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 07:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1io56b-0003Io-82
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1io56a-000781-07
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:34:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41091
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1io56Z-000778-Sx
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578227643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8Prri9WaGRO65yjl09PcbeCr+ZCjA9X+9asGScE0xU=;
 b=C00yjHFpu4M3ZlXCBCCnWRIz4AaQ0vhufKWVPiGaNEyl7VVIqj/++ZayNF3BoZA4t+seXk
 9Z7N/78JXrz3etB9+jjahb0Pfz7RX/yBlH/9na7QgZ4eIoRcZJ1RMQo+qA5euBMZNZJnbQ
 ROAklayroFHVlDDCKb0ahpoGLUc/K5w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-5KkKONQsPGia7amGWAzDPA-1; Sun, 05 Jan 2020 07:34:01 -0500
Received: by mail-qv1-f69.google.com with SMTP id v5so32874684qvn.21
 for <qemu-arm@nongnu.org>; Sun, 05 Jan 2020 04:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TR3cstnnK+QyGLvRLq/RdvlbvZb4gYytD8iSV5sXewE=;
 b=hS7qpyiTIY75AWkpigfQ0HjpOOYLXsyYzA6L2C0gYUyBKYay7ZGKgEhIqjjQQ8yWD/
 bd8SSSfrP8sFxYAYpS2Y/V5b5S7GmT4FFMqgMHymXv1S3zYRcGpIVuizPCXc5ukFTZwg
 GzuQUffubX0SK3SyVomCqX6S5yTQc36wccdYLw4F5OTa32fgNfKS+THw2v92QyUczHKJ
 LLK3cKUVuMMWKzLreYxUByoUnPMk2R2/p0y7uorq9SXXeByy1xrN6SVO0YhL6sK+chuv
 Dr2evjslN4SBklgYxFz53QiO4jlVRH2sgBNOAfGxUTxypgbaRgpz09W6R8nO1iLOB1FN
 oNqQ==
X-Gm-Message-State: APjAAAWgAURwNdm5C90RMmY1DBpjvSejBVW+dQe+c4eK2d4OMk1xdsTI
 HwJ8zHwd8CU2EM3K9eZgvb6s/g2wysVYTOwX6kYPAp8Y4buApJqf7gcb0f7plBvW5+0NA8U6wcH
 ogM1IhKGipXO3
X-Received: by 2002:a37:9245:: with SMTP id u66mr80446288qkd.102.1578227641148; 
 Sun, 05 Jan 2020 04:34:01 -0800 (PST)
X-Received: by 2002:a37:9245:: with SMTP id u66mr80446274qkd.102.1578227640900; 
 Sun, 05 Jan 2020 04:34:00 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id j194sm19260957qke.83.2020.01.05.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 04:34:00 -0800 (PST)
Date: Sun, 5 Jan 2020 07:33:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200105072504-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191219064759.35053-3-guoheyi@huawei.com>
X-MC-Unique: 5KkKONQsPGia7amGWAzDPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lb67QnvkXfEB

On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> According to ACPI spec, _ADR should be used for device which is on a
> bus that has a standard enumeration algorithm. It does not make sense
> to have a _ADR object for devices which already have _HID and will be
> enumerated by OSPM.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

Are you sure? I would think this depends on the ID and the device
really. E.g. PCI devices all are expected to have _ADR and some of them
have a _HID.

CC Corey who added a device with both HID and ADR to x86 recenly.

Apropos Corey, why was HID APP0005 chosen?

> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c          |   8 --------
>  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
>  4 files changed, 8 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9f4c7d1889..be752c0ad8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
>                               AML_EXCLUSIVE, &uart_irq, 1));
>      aml_append(dev, aml_name_decl("_CRS", crs));
> =20
> -    /* The _ADR entry is used to link this device to the UART described
> -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
> -     */
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
> -
>      aml_append(scope, dev);
>  }
> =20
> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
>      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")))=
;
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemM=
apEntry *gpio_memmap,
>  {
>      Aml *dev =3D aml_device("GPO0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> =20
>      Aml *crs =3D aml_resource_template();
> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  {
>      Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
>      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>      aml_append(scope, dev);
>  }
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT


Please do not include binary changes in acpi patches.

See comment at the top of tests/bios-tables-test.c for documentation
on how to update these.

--=20
MST

