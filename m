Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3551055lfp;
        Sun, 2 Feb 2020 22:01:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXWSdbQmOs08D1OdxlbomeP3SpnYqWauCU57c20qJUtLQ+I9cSyxeDsN7wXHYmfn8ENuPz
X-Received: by 2002:ac8:538e:: with SMTP id x14mr22340492qtp.301.1580709664267;
        Sun, 02 Feb 2020 22:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580709664; cv=none;
        d=google.com; s=arc-20160816;
        b=k1FGkv7HenNfSGKJWH0w8tirnw1CLemjbr4OuqFbLD3phtsmIi8iDVBp0gECot9RjA
         LfTfuNwsZNUjEuDMdvQYoMuxEAZJLDSuDOUSRQNuXr0OGgCFV3uYjwPyMuaE1vmiqjMm
         x9EwfdubXjyCEx8StAp4H5eJ0lQ/Q9aJHdklIh44Z8VC97Wdb+7Jjq/bJw/IwBhi+pvX
         sqRvGjSZKOXxf6A8lcCoXQcicKUNKmfHL3Bvd8G3b9obPP4a34QASGuyXcJ1fSwfIe4g
         KMtFxPr+hbN3ChVxlGihqpEBth9BBJVfQzUAtkwKLXUtDrT+p/nk5Pwh5dfXYfAasEOG
         1H4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=RCDdPYJ4CJebkilqYHen5Ppk9focfoniFfnlmhfCCug=;
        b=UyAJqb0lY7CfF52sw+hkQRjBOipUVUtj5tikYIRZgcM1lLpCEZxSDqNFqNBtaECMa7
         JP6r9BczfYNQVzZ4EH1jZKH/qJoyKxKq1Td10dBZ0ppTRKMGCvxQ4+0oSUcacOzv+02F
         4qbXr+kHeuXnPqhLWgSRZ7OyoaZfTJkNV4wiH/cZ7HdKcXT2JwPGYIrcm+paxseUD0HY
         9Mz6uE0CGCPys7cAE7cnoffXCd4PFdRlQVABRFv/dq9LLrZ/3uLeObYa5RYPn+QO5BdQ
         UIxWK/QC1rNwBblJN+RaxoOvJ9VoHuablM3Ah7MDXPkz3AdOGoHY1r4auirMaeRK9opV
         Y1CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bae1YfG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si11956237qkj.115.2020.02.02.22.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 22:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bae1YfG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyUn9-0007e8-Os
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 01:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyUmu-0007bv-3m
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:00:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyUms-0007za-Tu
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:00:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53169
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyUms-0007vy-Nd
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580709645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCDdPYJ4CJebkilqYHen5Ppk9focfoniFfnlmhfCCug=;
 b=bae1YfG/iDPURJ3lkhnliAlCWkCwMxgLwb/TR8TnNNyHXs97oXWJzXh99d5ZbCmFJF4ean
 WkOCREXv4/uLxPB3q/kyVQwZYB7kjT8Jz0vEoGwmctyJIbpLr63ce7tgiQVIdsxJrmoc+p
 CuthPGqPDslvitNSGoRgfIuUwAbb8JQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-Q1q_BilxP9qK5J6mZZeXtQ-1; Mon, 03 Feb 2020 01:00:42 -0500
Received: by mail-wr1-f70.google.com with SMTP id s13so7685044wrb.21
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 22:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vuJRcWENNqLN0tXOKXzxUBajPmXPIC9NC0LDQfL3CHA=;
 b=ooZ7IEV33SgfEj6k51hUUpzbMuRZ7N1jkPiVeGaprdEnQ/95a4lItjdqvYtqkj7apH
 a3qPZlrRpyZUvNyzOSAXGH++ee8mOR0orBCLwBH2Ok8gV4Mui+9hl7FI9N4ULo5RbPqi
 1ekJl8ycI3AXOEX3De2A9ZLEn/CMlKaNfwEaAH+kLs1J8dS2+R+3mxo/728J0vxekK+A
 3XoM3IkXGwgSTrHdDwF1LLJIp1FQ+tO7Akec6n6cDKuo32vY0Zkha022KdAgmJj8VBwy
 BEQRIdEg29N7ciwQ69/RGB3aWw8BU2OG5Hy2kEk+M1rHWaR3KM8OHrKXm6TbMBYfy1tj
 SDGg==
X-Gm-Message-State: APjAAAU59rQQFlMb/9uIBSsU4R7JZzJmV9fV4+HU64kOd10w+8AYPmFb
 nurnFL5lXqBLQTbBK6y1jnGkr6xaqC/nz8/jTyCYyDRO+47aitcx7WUiNjmvsPOa4zxoTI55ntx
 jEaLHWVfHwTiO
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr28720704wmc.168.1580709640955; 
 Sun, 02 Feb 2020 22:00:40 -0800 (PST)
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr28720671wmc.168.1580709640737; 
 Sun, 02 Feb 2020 22:00:40 -0800 (PST)
Received: from redhat.com (ip-82-36-244-173.west.us.northamericancoax.com.
 [173.244.36.82])
 by smtp.gmail.com with ESMTPSA id x17sm23315758wrt.74.2020.02.02.22.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 22:00:40 -0800 (PST)
Date: Mon, 3 Feb 2020 01:00:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v2 6/7] arm/acpi: simplify the description of PCI _CRS
Message-ID: <20200203010023-mutt-send-email-mst@kernel.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203001505.52573-7-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203001505.52573-7-guoheyi@huawei.com>
X-MC-Unique: Q1q_BilxP9qK5J6mZZeXtQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: 49Pp0iv1IzGs

On Mon, Feb 03, 2020 at 08:15:04AM +0800, Heyi Guo wrote:
> The original code defines a named object for the resource template but
> then returns the resource template object itself; the resulted output
> is like below:
>=20
> Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> {
>     Name (RBUF, ResourceTemplate ()
>     {
>         WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
>             0x0000,             // Granularity
>             0x0000,             // Range Minimum
>             0x00FF,             // Range Maximum
>             0x0000,             // Translation Offset
>             0x0100,             // Length
>             ,, )
>         ......
>     })
>     Return (ResourceTemplate ()
>     {
>         WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
>             0x0000,             // Granularity
>             0x0000,             // Range Minimum
>             0x00FF,             // Range Maximum
>             0x0000,             // Translation Offset
>             0x0100,             // Length
>             ,, )
>         ......
>     })
> }
>=20
> So the named object "RBUF" is actually useless. The more natural way
> is to return RBUF instead, or simply drop RBUF definition.
>=20
> Choose the latter one to simplify the code.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f3e340b172..fb4b166f82 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -236,7 +236,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
>                               size_mmio_high));
>      }
> =20
> -    aml_append(method, aml_name_decl("RBUF", rbuf));
>      aml_append(method, aml_return(rbuf));
>      aml_append(dev, method);
> =20
> --=20
> 2.19.1

