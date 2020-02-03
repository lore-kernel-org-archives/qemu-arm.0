Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3559078lfp;
        Sun, 2 Feb 2020 22:11:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1VuttYWNBSw8fAs2vdTQzXXr+Jz5smJu93nkuGkiY7J8sCPf5M7QlWPuG+weXiQuJXgWg
X-Received: by 2002:a05:620a:112c:: with SMTP id p12mr22117857qkk.287.1580710281173;
        Sun, 02 Feb 2020 22:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580710281; cv=none;
        d=google.com; s=arc-20160816;
        b=x5XRPM12n5vJltsP5h4z0/NzxijsKXuYP1kqvpYORJETsaZm+aWCLnJmi4/iBc98D9
         VP8gr278kZxxbtQJdqXlKP9pWn/zX6Wx2KgGn//u3K6bdrmEOztf6a818JE5kiIL6KCz
         eCsQLbJTLyINBXWjtj2jF0P/5v3n13lgRr3SArGj7H6c+vTIR8D3x03uuY0Rjq3x13to
         EFa/ACHbkeCLYN9hmRTKLRy2QDiuUcltDa00h0G3LtCGJBM80LHzZ5M3yQjlC5zQ/Hf8
         MMu0bUTcciQm64i06qU6oG7wey8mVe4nhw5DZs6yUOR9rwXfu5MHgmZipY4LsXwZ1XVB
         4l5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=TGYi4iQGyypKkwl5HdBcxH1o1c16rSX8imA3vtobyKo=;
        b=LQUTEI2nOWAj1AEkfdLQa1HWYU0pdJVPXtfCDtYhiloKEs3xvFHTkEr/RadwmAlClF
         8UnlCcqoe7Ly4d7lCkhDgD+ZIbm6RkT7ffBqkHDCDpDAy2EGWkFta6Ny1uYn2Hiy8gm6
         U5420kDRIBPf32lIM3kN4CHX4GBds/vVgB3peZDnDL/Jrg5xZXdajES/QMzaa7w5yV4d
         t8uoAB7ND3n5p9sfCjPQbt1UF0QJSbMVALDXeTQ1MzFqb9o/fp79QE8Tg2RJTE2i50tI
         tl4x/YhvvYebCTCzMK7NspTjWSPaHzOF3sOSljGGZqeGsGlHQbdfE5Pe8Oy2joKNSEfK
         N2mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IfOn09YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si11675889qkj.292.2020.02.02.22.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 22:11:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IfOn09YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyUx6-0001x5-Lw
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 01:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyUwy-0001un-Oh
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:11:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyUwx-0001l9-MK
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:11:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55850
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyUwx-0001kJ-It
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580710270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGYi4iQGyypKkwl5HdBcxH1o1c16rSX8imA3vtobyKo=;
 b=IfOn09YJaYAoEuiDJorG6HHQS5kkoPGQaKVrk14rCR+B6EdkVhvc7eZgRcWG+U/yKh8XWy
 dLiWd2S7rS4gRkV1JgAo01QOxhyk+CyM3/gCvb5IfOs/WIeC93LWFSu/Cpu1Jom/EAFd5N
 aKNuqyEwHhq5r8yw36/mx4VGoI8J3Pw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-BG3Gf-W9PNiNfrdP-ESG8g-1; Mon, 03 Feb 2020 01:11:07 -0500
Received: by mail-wr1-f71.google.com with SMTP id m15so3446112wrs.22
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 22:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lw8zZl6P+1/bHZa82Tc/oS8E16nZxIUU26KAs8LQ3vc=;
 b=NR5B6emot32u/QWyo+3CKbO+zaEBbsNRnAHVrVXbwp2rHwxJ2Uasa140zVCRzJffhQ
 Ef4llSXz/qSME0z1VzwgE3EwqIRx6Ftdkh2eqvUTbm7CNTvxLy5OFLZFLgrXJNdi+JyC
 Bsi0jgEncZMpfxPOonfiUaN2VNnxUNiMiuqFxJOLxiZK4vy8ci8jf7cs/UnhUXHDr28Q
 qeSkwfssDd2nnUC2YN0yuwWcPme1RljPX7+keOyrccBCcGmkOagnGCVttbFNpd5VxSGq
 hc71/HdZEr81QAGA88WkxP6xFBjYw8Q8STh7AaTAesP/MmakcQ9QHtwyRikGp3EZXNPl
 60tg==
X-Gm-Message-State: APjAAAUgEuRthbNz3Eo8QlEyS1VLx3wcahzv+je2GefnxYAhtNuji28I
 N3ZmupwCEDqtOcw9X+KA1sg6tLTwrIZUI0nmf3Wpp+sPV30eC2URnLdKurmY7g1Oh11BYWUZBUO
 hEdz6+cuP4ZI8
X-Received: by 2002:a1c:b4d7:: with SMTP id
 d206mr26783662wmf.188.1580710266014; 
 Sun, 02 Feb 2020 22:11:06 -0800 (PST)
X-Received: by 2002:a1c:b4d7:: with SMTP id
 d206mr26783634wmf.188.1580710265780; 
 Sun, 02 Feb 2020 22:11:05 -0800 (PST)
Received: from redhat.com (ip-82-36-244-173.west.us.northamericancoax.com.
 [173.244.36.82])
 by smtp.gmail.com with ESMTPSA id o4sm9112696wrw.15.2020.02.02.22.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 22:11:05 -0800 (PST)
Date: Mon, 3 Feb 2020 01:10:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v2 4/7] arm/acpi: fix PCI _PRT definition
Message-ID: <20200203010249-mutt-send-email-mst@kernel.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203001505.52573-5-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203001505.52573-5-guoheyi@huawei.com>
X-MC-Unique: BG3Gf-W9PNiNfrdP-ESG8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hfTY+Mva0thD

On Mon, Feb 03, 2020 at 08:15:02AM +0800, Heyi Guo wrote:
> The address field in each _PRT mapping package should be constructed
> with high word for device# and low word for function#, so it is wrong
> to use bus_no as the high word. Enumerate all possible slots
> (i.e. PCI_SLOT_MAX) instead.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>


Absolutely matches the spec so

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

To add to the commit message:
The existing code adds a bunch useless entries with device #s above 31.


> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index be752c0ad8..5d157a9dd5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -151,7 +151,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
>  {
>      int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
>      Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
> -    int i, bus_no;
> +    int i, slot_no;
>      hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
>      hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
>      hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
> @@ -170,12 +170,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> =20
>      /* Declare the PCI Routing Table. */
> -    Aml *rt_pkg =3D aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
> -    for (bus_no =3D 0; bus_no < nr_pcie_buses; bus_no++) {
> +    Aml *rt_pkg =3D aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
> +    for (slot_no =3D 0; slot_no < PCI_SLOT_MAX; slot_no++) {
>          for (i =3D 0; i < PCI_NUM_PINS; i++) {
> -            int gsi =3D (i + bus_no) % PCI_NUM_PINS;
> +            int gsi =3D (i + slot_no) % PCI_NUM_PINS;
>              Aml *pkg =3D aml_package(4);
> -            aml_append(pkg, aml_int((bus_no << 16) | 0xFFFF));
> +            aml_append(pkg, aml_int((slot_no << 16) | 0xFFFF));
>              aml_append(pkg, aml_int(i));
>              aml_append(pkg, aml_name("GSI%d", gsi));
>              aml_append(pkg, aml_int(0));
> --=20
> 2.19.1

