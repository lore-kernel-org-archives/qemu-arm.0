Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4946410lfp;
        Mon, 3 Feb 2020 22:35:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqgRCqX5FIwO/5uoE4byx51y9VwF5uVlV0rU/X1kjJkWGJX0bHM8lFx+ocWZ+0fLh2mDLV
X-Received: by 2002:ae9:f711:: with SMTP id s17mr26823954qkg.238.1580798144440;
        Mon, 03 Feb 2020 22:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580798144; cv=none;
        d=google.com; s=arc-20160816;
        b=cZpeKISTfBlSjGtqDlbisCCIKFtyPoZEoWQBuNCwS2VU8VuaPmiclGDD95Hd72k/zp
         VXab0hEwHMgf5wpzh9m7Hx6efGvmr2oj+j5EmK7/Ts9mFiaESdPImpOAWSZ9CaykWYUn
         3BMNAEN5KxDuWYXq4471pGMjceiVKaloua9d+kQc0INaARgMFYO8X/pyQ80n4sjmiaN3
         NHpnYS2HmrGNfnzmuZd+aZCMB7dkrfDuv+wGQnQ0qZXplTlNHC0C2XEaGhu8HosinyYt
         Gyb2vRti6rRvWwDU1FPY2NjovB495hpBQ32rwdOi3f+Sy4tWHyp9TBqgRYZdicRk0Y+2
         v3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=XHFBdP4vsGft36CQ0GuQBDcAbUK0/4qbdY8aCuH2oHA=;
        b=ESfiYDrCS7l3vbVQuFQI+NKF+qh+jTxuSWgi8MuqD92XDlqi2B+8ZG781OwIt3Wwyx
         bjAtLRNJ32MkeRMEroNqq+GAZUZOHcpuFVhsAV+FVt28IlpI4ToZruWNz8a7VlVsKi4I
         txbEQWNezCwur/657c4kdE8PaXsodIxeugFjv8MmmFftA+v7J0O1s5s2U12dCNOJZFI0
         B7p9mFmuP1xfs7ZG9ZZJL5uV3DDVnMjTSeLKbWZsHSBrUOZ/Gwo1OVtEwjnnpSNpfdag
         s5tRSyZDCvWapUyeTZRD3U657e541IwzUrnrF8uJFw1ed6Q7cqIZWjTawWGGd2NVipL/
         UV6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NglquxgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si12541153qtb.244.2020.02.03.22.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 22:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NglquxgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyroF-0000mh-Fm
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 01:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyro7-0000mX-KU
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyro4-0005jQ-Ro
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49436
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyro4-0005i8-Gt
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580798131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHFBdP4vsGft36CQ0GuQBDcAbUK0/4qbdY8aCuH2oHA=;
 b=NglquxgMep++gih1AZtxHGdC5T5VS4QyTAiIqvq9GTLuIm6kU5phxKEtEijLWzQDug8Nom
 7+7AOVB+YpKvxvXUAsmwuZVqDvGRXk0JNnNyvXCfzClyJeTfdGEc+3FjUKvQQq/W+ewRW1
 gaWJ1OXrDA1jT6sV9cvdbtWSA5yfXCA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-iH3V7P8zNSml7y_wzTfO1Q-1; Tue, 04 Feb 2020 01:35:21 -0500
Received: by mail-qk1-f197.google.com with SMTP id k10so11246701qki.2
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 22:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kN9e3boAdrYe1NQoFTzohP/11uCgTvpjemqgsNre2A8=;
 b=oDW5njmHoipqPHmMrqXvZ1Wf3z2LdkSmY/f5hL54vGqSBiOALulkjn53Kke3WMIosO
 9ltv9KO3npLOT+PJMt4NctZ6E+p/9WMzkvodmKrxEck01y54uhbXv3cp0K3ECG/3h+Yq
 BVspWJXrwHkByNk7Jlh4zQDvNp0ZvGxEs7Px6zDBTeN/yy9oBFbfMd53xbin9tPBUyqI
 frVmNr3AL8jCcbjCyXzEJAGSkh0wovfS12fiPsfLmd4kVq5QEDrwwY6PgfxEXJFpyw+S
 2xJMdp43DhMau3y6x4L9+OCEnEtVuX4wzR7uHmPOsEKK+R36IrBwFQ3GO08tjaYg4TVB
 ulcA==
X-Gm-Message-State: APjAAAWyOIhNRsY7YECXS4ljtzlPpq4AW12m9aI8n/s1bw3lKNDFU3rd
 6K7ulWsDsHnvwokmYfwWetsks7qVO36WZ9ZQ53yUNIwpK4JJ2UB9aDMC6o1QIdVEd9/BcMs/szs
 2NvCMcV26s7vD
X-Received: by 2002:ac8:3fd7:: with SMTP id v23mr26851885qtk.293.1580798120916; 
 Mon, 03 Feb 2020 22:35:20 -0800 (PST)
X-Received: by 2002:ac8:3fd7:: with SMTP id v23mr26851877qtk.293.1580798120676; 
 Mon, 03 Feb 2020 22:35:20 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id c79sm4687636qkg.12.2020.02.03.22.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 22:35:19 -0800 (PST)
Date: Tue, 4 Feb 2020 01:35:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v3 3/7] arm/virt/acpi: remove _ADR from devices
 identified by _HID
Message-ID: <20200204013508-mutt-send-email-mst@kernel.org>
References: <20200204014325.16279-1-guoheyi@huawei.com>
 <20200204014325.16279-4-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200204014325.16279-4-guoheyi@huawei.com>
X-MC-Unique: iH3V7P8zNSml7y_wzTfO1Q-1
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
X-TUID: TWPeEUwN1om3

On Tue, Feb 04, 2020 at 09:43:21AM +0800, Heyi Guo wrote:
> According to ACPI spec, _ADR should be used for device on a bus that
> has a standard enumeration algorithm, but not for device which is on
> system bus and must be enumerated by OSPM. And it is not recommended
> to contain both _HID and _ADR in a single device.
>=20
> See ACPI 6.3, section 6.1, top of page 343:
>=20
> A device object must contain either an _HID object or an _ADR object,
> but should not contain both.
>=20
> (https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf)
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 8 --------
>  1 file changed, 8 deletions(-)
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
> --=20
> 2.19.1

