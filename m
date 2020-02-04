Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4946641lfp;
        Mon, 3 Feb 2020 22:35:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRr2rMQiX7p2D94MB7x83ehRmRKkAE1SUwueHt1PySHhjv/EHqr4yMwq4v+eSmbWKC930M
X-Received: by 2002:a0c:bf0b:: with SMTP id m11mr26581059qvi.63.1580798159184;
        Mon, 03 Feb 2020 22:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580798159; cv=none;
        d=google.com; s=arc-20160816;
        b=pbkTYS5Ogk+UNJSVCHm/JsPe0qKPx3TOocmmxq2RPXYxqfAsXSYmtg1mGfUn5A+ShR
         UWT0E4QSymHIjZwhGALINWeG8dnnGEGtxBjSEY82RmKC7ksuPL3A2209Kgk6v0Mnj+5T
         jSQ/bhoxVYxTjllZHOBzm4nx8X9l2a8PRVBwl6JM6B00FWK3+8REz0HbYxPBupW8MgZw
         2E0hkh2U7BXC2XQNqI0U8Mvm/SNirLudP98M+pU3B7IJgASmRSt6s7t+HWLoLoJBnWE/
         CNscl2A5q55UNCQLCg4LPjBluv3pyfPbf9dN88nV4zZOCGq2TGrfMyjv8+H55bI2KQ/B
         jiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=wVqf0acbo6uek2evnAMsQCoUgPVt9B9GWsSlHwXLCUo=;
        b=IDbwv1nDFB+KRiLA/E6XWob465W7r8KwUs/PrASPg2Rw6up1kVUr4R2ypSQ4MxbdID
         uEgEHAs6igLUYE2+VoE5jloTym4rY2hIDi1VTjYxTSuVea4WS4G4m4zstp+kcHjSm6XV
         zRx8MZ2tTTzjLUc3MSWXZtWpuQvWb15OPghWXjLEDVnRKvwqo3Kjnu85OyB3OC4CVmsh
         WUQjyZu49rt3wYq3+fFvW14JRmNOpbFoL8bnkl023qhEUbbDVfQtqD/Ilg7bJsUL2IGm
         utk5ZkO5t1nE8eAe+F8Rzawn50niiOY4X284IxS8+tEJVW9hvgcUp5XNMCDaem/0XEy1
         O7qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZXvgCXEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si13362190qkg.277.2020.02.03.22.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 22:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZXvgCXEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyroU-00017R-DE
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 01:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyroL-00014h-JM
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyroK-00061m-Ez
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44029
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyroK-00061A-AW
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 01:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580798148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVqf0acbo6uek2evnAMsQCoUgPVt9B9GWsSlHwXLCUo=;
 b=ZXvgCXEeTrPjgyw41paFy6neb9s8DecbXin5JwvbrQ334yd69wH+gnZQbwBYght8U77rWl
 R7IyEFDwlEGfIJUm4qJ47zj6AIw3JwFauteWTePjY0xry2fObSaRY15btld3SSzz8iX2Eh
 5qXvJRF3kasHRSu3YccoeV2pTIpoPZY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-jaNNK7JgO3-luauLZdZWPA-1; Tue, 04 Feb 2020 01:35:46 -0500
Received: by mail-qk1-f198.google.com with SMTP id y6so11211774qki.13
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 22:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hNAbxjmT3EJKtjyG7rQniLNeqzdU/9mrDavT+lFPQ6o=;
 b=ATQ1BwINLncJoQxgmh2c4WDfFue+OIjOjbrWlzxQEdT5tnBw0kQX1x9yhLBfe0XsMW
 mgIjIQVxcsB0/r0haP6UKaRL/7mviNfw+NBxDZBGjPBdGdumWbKHXbjzAnkhwi0EwJk4
 ze9OWSQYtwCjriB0MRpZX58RyCIzPOHr6BdpWuIiebjGWtUNVXq4zcqeahKAk22S9mzD
 BrgeSzVmnF8rnQE5m7FZjsYIiLHwyKczy1AfN8/3X65m0M7w1LEDKjOnZY+AQF67Pp9r
 eyZRwTB/9nA4+/wDHdHiYvTFQsBMzigb/MYde7jrO/rlfGDYFZC8zCn69bbynPycMAmx
 sjPA==
X-Gm-Message-State: APjAAAWm6g3taRWldo3M1NmBDwiQxjlKJu/2z6YDE4BSR6arpLMDBcBh
 vkyhQHOh6YCycVgQD2t3Orory0u7aAsMkKTwn3qw+xxNG7fy/L8r5by1/zxBIUqfIZDM0LNT1f4
 j6zxCBnzIR4sX
X-Received: by 2002:ac8:754e:: with SMTP id b14mr27501062qtr.220.1580798145512; 
 Mon, 03 Feb 2020 22:35:45 -0800 (PST)
X-Received: by 2002:ac8:754e:: with SMTP id b14mr27501046qtr.220.1580798145302; 
 Mon, 03 Feb 2020 22:35:45 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id t2sm10394260qkc.31.2020.02.03.22.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 22:35:44 -0800 (PST)
Date: Tue, 4 Feb 2020 01:35:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v3 2/7] arm/virt/acpi: remove meaningless sub device
 "RP0" from PCI0
Message-ID: <20200204013535-mutt-send-email-mst@kernel.org>
References: <20200204014325.16279-1-guoheyi@huawei.com>
 <20200204014325.16279-3-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200204014325.16279-3-guoheyi@huawei.com>
X-MC-Unique: jaNNK7JgO3-luauLZdZWPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YH2ceEdPdTVd

On Tue, Feb 04, 2020 at 09:43:20AM +0800, Heyi Guo wrote:
> The sub device "RP0" under PCI0 in ACPI/DSDT does not contain any
> method or property other than "_ADR", so it is safe to remove it.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Acked-by: "Michael S. Tsirkin" <mst@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd5f771e9b..9f4c7d1889 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
>      aml_append(method, aml_return(buf));
>      aml_append(dev, method);
> =20
> -    Aml *dev_rp0 =3D aml_device("%s", "RP0");
> -    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
> -    aml_append(dev, dev_rp0);
> -
>      Aml *dev_res0 =3D aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>      crs =3D aml_resource_template();
> --=20
> 2.19.1

