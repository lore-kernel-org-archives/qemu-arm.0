Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3583600lfp;
        Sun, 2 Feb 2020 22:43:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9ZJHhf0nF7P7AZYCMkEFGyUSx6MVxI20raChPR0NsJwcXfmUtgpcNnUCV46UtxBTnxzM+
X-Received: by 2002:a05:620a:21c3:: with SMTP id h3mr22190649qka.318.1580712216160;
        Sun, 02 Feb 2020 22:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580712216; cv=none;
        d=google.com; s=arc-20160816;
        b=I8ucMxrV+xfkKrKPSUYNn4k+J/hAB+sEGT0EwkI13ZXTHCGBq4287tYxHerVV9Ei+/
         9mVW+AINUjjwyyeAYOJRZiIQgkTR87HHXXI9S+ojXQ0Y+JVqDKjOY0eNY/BDiIFMMV9R
         gKgKgiZ6RIspNRQ1ZruX+3qW3mIkjmeqpxvsBBWZ5vg2tH5KEViMqduDKzf+z+I3+Ixl
         Q/+hFb0RUjP+IC8KwYSTvFqcSNGcQIdimOtwSVWF2KwdXFgKOcVx54k3ECsd3Hk+Exmz
         DfPxxKFeAoOgbdciEvJD6jhX5jY58nG7XzeeEUlFNf5AIKhu9hQmzdZRlnoouNnIPA2N
         8big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Mxht/KLWEDwGIXr9MQR6xjOTEWdbCtU1Uk3cSWbKMHk=;
        b=f2lKr2XI4bIXdf0tkQTrx/mpoGaqodz1g14cGNRVrERQuL6f8hH7duyAxTKCaxjtc7
         mHoWXIYTVxGHHoSLmJ405YfvVz1TcCfA7PDG2laTQy17MtMTRZABBpiaeXzPnYbIpE3J
         OfnWatwgmIgcGoeXuqX4BTSHV48acIgRL+KufptshwLqAB9dZ5Pumq2Ab9SDwoiB/ZhF
         6UVfc8+UNe4ANDCMgNoQw8XdfAdOSHwSzPToJ6HxegeO48TAAJGJLAcD8BkzsGNqM9oL
         7so2h7JZ6O5e/gmb2owmHJcmSOCOYmCByVB6ARa5AZBXFbyxz6Jv1Iujp7Bf+7pvrWci
         UCdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aGLyGX0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si10724675qtm.272.2020.02.02.22.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 22:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aGLyGX0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyVSJ-000433-LB
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 01:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyVS7-00042k-4H
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyVS6-0002Db-45
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:43:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51165
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyVS5-0002Bi-VT
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 01:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580712199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mxht/KLWEDwGIXr9MQR6xjOTEWdbCtU1Uk3cSWbKMHk=;
 b=aGLyGX0LxmTJHrWmC5YrMN3cd/+1W3RS8W1lQm9k1bQVml9Zktu9yGVe9lCP4SieDseb+L
 +C37F9MkGZdymL1hhwJsgS8g0Xr4mdI4NN3th442AIy9sL+qgWRZytJz9KRg10V6b3UVVd
 SU2VDS4v8G5FHVPGXtCWIQRr8nfrOU4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-RrdTDzJmM6mfQcBj1KjIgw-1; Mon, 03 Feb 2020 01:43:17 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so7730971wrm.16
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 22:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=11YEzOH4JqxoCO8A8NB9nQ9MAE9iM+etG54GJmx13Jc=;
 b=gtW6u4LAnqhrU4ofUDrO1sj8/QpPwod7MXgd8ElN5xw502o/T2urh5taq2Cbhjat42
 gO7hu4i1t2q602eyf8PoDSnorp5KL6RKMykUs61XqAjubAEySDPozmZ9bmuDKoLz2JZV
 1ITrdXbyx15nAfZUNRLEa40HTo5v79Y9LYbJHch/iZA016VyQDAs/ejLSsAr76xfQQXF
 XZPMwgdyMG8GGON+ZH15shoQaoTVTEmPpOLJuvpDVAUXA8dYlC3EUVKzxobzevB4HNSz
 vCQG+8wk7FbNOf9bcX9+VYzU6TzWSgx/7H5MjG7vHbrzYNf0cePGZebkZ/rMvV1eDyIV
 bjZQ==
X-Gm-Message-State: APjAAAV11lXhAEAMQB+q3s2XA4KBz38J/o+TBgAq5vuorsKGoJv+w1+C
 8TG9GZdC1GPzLykxLJKTr9KH28NOcPQIvp7kLZ7MrS+Y3V4Y3Z/XcVqIPXdOhCvugFyiZUfKt3W
 /3QmAlDJe3GPD
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr12940376wro.209.1580712196171; 
 Sun, 02 Feb 2020 22:43:16 -0800 (PST)
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr12940351wro.209.1580712195914; 
 Sun, 02 Feb 2020 22:43:15 -0800 (PST)
Received: from redhat.com (ip-82-36-244-173.west.us.northamericancoax.com.
 [173.244.36.82])
 by smtp.gmail.com with ESMTPSA id r14sm21083307wrj.26.2020.02.02.22.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 22:43:15 -0800 (PST)
Date: Mon, 3 Feb 2020 01:43:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v2 0/7] Some cleanup in arm/virt/acpi
Message-ID: <20200203014246-mutt-send-email-mst@kernel.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
X-MC-Unique: RrdTDzJmM6mfQcBj1KjIgw-1
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
X-TUID: f8EO+qyx7w0d

On Mon, Feb 03, 2020 at 08:14:58AM +0800, Heyi Guo wrote:
> Remove conflict _ADR objects, and fix and refine PCI device definition in
> ACPI/DSDT.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org


Series

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

merge through ARM tree pls.

> v1 -> v2:
> - flow the work flow in tests/qtest/bios-table-test.c to post ACPI relate=
d
>   patches.
> - update commit messages for removing "RP0" and "_ADR".
> - add 3 more cleanup patches.
>=20
> Heyi Guo (7):
>   bios-tables-test: prepare to change ARM virt ACPI DSDT
>   arm/virt/acpi: remove meaningless sub device "PR0" from PCI0
>   arm/virt/acpi: remove _ADR from devices identified by _HID
>   arm/acpi: fix PCI _PRT definition
>   arm/acpi: fix duplicated _UID of PCI interrupt link devices
>   arm/acpi: simplify the description of PCI _CRS
>   virt/acpi: update golden masters for DSDT update
>=20
>  hw/arm/virt-acpi-build.c          |  25 ++++++-------------------
>  tests/data/acpi/virt/DSDT         | Bin 18462 -> 5307 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 6644 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 5307 bytes
>  4 files changed, 6 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.19.1

