Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4041689lff;
        Mon, 13 Jan 2020 04:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLgQGTEvUwtcdKiCTsqpmX45YXNd9nud9dF6T8JWlDuu535P5i6ddYzEX93dRunuoHHSbT
X-Received: by 2002:a05:620a:4db:: with SMTP id 27mr16320413qks.146.1578917306134;
        Mon, 13 Jan 2020 04:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578917306; cv=none;
        d=google.com; s=arc-20160816;
        b=T7+3NYnUcoZCabMnOPezUgwBcmR7xjP7p+702IXiSo34s0aNOASDHa+GeLznxZyE7M
         rfCApoy5uKkyzp5lYx5I0PeY2V8L/d7cAqPXNdagDDGK43FpQ1QwjeQTnzz5KscQ6CCk
         QWtnzOwFsOaDbMDnQXLvpLShAAzZDWUfHeALb87enHgnuIZ5vIwJL7g+I2qEZV51hXvc
         sZlQjlWR266tgOsBxXsYvzuNCX+3H7VTChIG7lrd8jJXrDZA1bgiVyixHx2s/sAsRJ4L
         8L9vUbCMTzGoo62g+m73J9P6P0D2LNkC3YTTaZ3a5ZVMQmqSJCoQ+mDO+vSmqkqlJg/t
         pkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=UKlU2Oxt8JFxqyMjgLRmRmHTlQgBRPYVwgu0ZD5vOjw=;
        b=YhIGmyJqInTd5lCBWp5UipXP2imGzj+CQKdU/XRnl+iTUteB2pBsR89qHH061UCYHH
         JssnBhTfGH5uNP1teov603oNWSsufg3LFAoif15KlFKZU9C8DYOn/MdB4CLPSQoeUZNq
         PpHerdgVJQzE5wtgZjh5Pwih4sk7NkC+z+yhUyrGomZefERBZAg15MBqgcN81qGiScwb
         DTPBSXs7b8+ZPzgTcf9IYnyGtPM8pyAfonMFiyW00h5+zNidDYPOrgPd9W7qW17CkszY
         kocO40m7Af/DD1gc4TPuw7U0yReKa2S1QDdsto8/+eNgW1PMIp81aLpsgdTgf5x/2YBy
         qfww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FVqrZkow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si6341393qvt.63.2020.01.13.04.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 04:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FVqrZkow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqyW9-0006J9-FQ
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 07:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iqyW0-0006Hx-ET
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:08:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iqyVy-000281-84
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:08:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iqyVy-00025w-3q
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578917292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKlU2Oxt8JFxqyMjgLRmRmHTlQgBRPYVwgu0ZD5vOjw=;
 b=FVqrZkowPc/V5E5CqOj1Tf9soL5XojH5oeXl07PjG4AkUmACM7yg7ZXShgMkV0BgeAdEN0
 fuBDzEZPQ4NJqi+H8P0+acrc2Lkpz2NMA2PypVKxPk0ieJcFVT+ZdzFP5tuRtyFfWRYUe5
 A2EYHiENtlQoiA/bYm2s4HBedZ8wioI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-tJ-yTSCPOZmqYKT6d2EH-Q-1; Mon, 13 Jan 2020 07:08:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DA24DB20;
 Mon, 13 Jan 2020 12:08:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE39019C6A;
 Mon, 13 Jan 2020 12:08:03 +0000 (UTC)
Date: Mon, 13 Jan 2020 13:08:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200113130802.5a961482@redhat.com>
In-Reply-To: <20191219064759.35053-3-guoheyi@huawei.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tJ-yTSCPOZmqYKT6d2EH-Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: asukAv0Jg+3s

On Thu, 19 Dec 2019 14:47:59 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> According to ACPI spec, _ADR should be used for device which is on a
> bus that has a standard enumeration algorithm. It does not make sense
> to have a _ADR object for devices which already have _HID and will be
> enumerated by OSPM.
> 
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

Are you sure it's does not make sense?
Have you checked commit f264d51d8, that added _ADR?

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
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9f4c7d1889..be752c0ad8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>                               AML_EXCLUSIVE, &uart_irq, 1));
>      aml_append(dev, aml_name_decl("_CRS", crs));
>  
> -    /* The _ADR entry is used to link this device to the UART described
> -     * in the SPCR table, i.e. SPCR.base_address.address == _ADR.
> -     */
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
> -
>      aml_append(scope, dev);
>  }
>  
> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>  {
>      Aml *dev = aml_device("GPO0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();
> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  {
>      Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
>      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>      aml_append(scope, dev);
>  }
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf50519a6aea296e5e0f1e0c 100644
> GIT binary patch
> delta 72
> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=gU!!5x$Pt+
> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8  
> 
> delta 94
> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao  
> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
> 
> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
> index 69ad844f65d047973a3e55198beecd45a35b8fce..6e5cc61977e4cd24f765fec0693f75a528c144c1 100644
> GIT binary patch
> delta 72
> zcmX>#i*fTTMlP3Nmk?uL1_q|eiCof5eHSLGt1wzk^tIeLL4lL8ZSqD=gU!!5U7RH)
> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>03)CjmjD0&  
> 
> delta 94
> zcmdlyi}BPfMlP3Nmk=*s1_q}3iCof5t(PXMt1!8;O!Tqj;)r*23F2X3VBp-?s=&$E
> tGkF=O0W(l&^JPwVXL<R6@E|9Scn?n(-T=P<17`zg2CxPo8S3f6006qZ7#siq
> 
> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf50519a6aea296e5e0f1e0c 100644
> GIT binary patch
> delta 72
> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=gU!!5x$Pt+
> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8  
> 
> delta 94
> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao  
> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
> 

