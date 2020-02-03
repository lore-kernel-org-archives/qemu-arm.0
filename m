Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3549719lfp;
        Sun, 2 Feb 2020 21:59:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRNQRHxRqbjpd9RPQowjl1pLTkaus2z1/T0gUnw7JKfC4Qh3YCG4GHDFO0VFX8x2HpBKeS
X-Received: by 2002:ac8:7159:: with SMTP id h25mr22314901qtp.380.1580709566551;
        Sun, 02 Feb 2020 21:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580709566; cv=none;
        d=google.com; s=arc-20160816;
        b=c8/5Kk4Wqo1Tw//dHDA1aUzu60PUS7hYQK9+YuIoqyXK38lGwRgYk61xbwncX05YAm
         mVGXrL7MK7qLK/K6cqY7voNnUGQC8YQ5Tsu005A2PJTNzfWhYu67JwM/P9wJWt50z2mm
         jfeS7j2+Ym9GytcNoW+c/bKnmcSUxfCm+kd9CXCLcWxsCSkpSEHLf77gjMEW19zwVfbk
         wziCzY25wV4xSXs+JNQLMvTvCRUUpSYrKLB2fg3B10dlAJuPCumrmU7p3BR6pR6q84eC
         wMKE3O/1/H7gN+KBNM7Vgltj/9EnW0y/H5+0R7LWpNpvFp83wmXj8gy1LRRT+NJtNhq7
         bqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=JilRq2G0wITt587+JPxieXy/FJ6wJ4ro9ibefJPSTao=;
        b=T1fzvnEkTDDIu9OUJiGhL5l6ap23sVvG7f488Fve1OYfi1MQ1JDkEpQsFpVR07BCJy
         QCwXZKMG5sztJ/K5id8VSZ7jGu1NHDBdwxhw7peLn763sD9xDozJ7RE8WsTJNraynAPp
         JxpO3/N9Nc+ZKUYD51Z1Lw8oGjoVJTJhGkaLKuHX0vXqiyua8eMQ2R3ax+QaXuyRcCbs
         noJDKXaMGfVNegYHNAKGYA/iZ9r4QGo79nSnjA04g+YejgEzhwHxSK948/w3sKimUa9k
         dJ8iUu6hPXJqwvZmq+lRAo1+S3pvxLR66Yvb9IPGPBkP8tORDYi4h1/jfJM8jAxbZE67
         aBCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GebbII9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si8129339qki.141.2020.02.02.21.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 21:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GebbII9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyUlZ-0006Sq-G5
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 00:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyUlR-0006S7-An
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyUlP-0004Tm-L6
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:59:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55008
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyUlP-0004SU-DG
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580709554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JilRq2G0wITt587+JPxieXy/FJ6wJ4ro9ibefJPSTao=;
 b=GebbII9VJ08NQtj6FwWqrmRY5q6RRPgiBJCujgNWxZx5u6IKbrMQUiQO5Fmu2o+94raycr
 CTtOHe4ktyhoHIN7E+kCUoI5OJWhq5iqV5whusOXoeMmgJrl8TnkFapzEgfXDo5OeDUrsQ
 3qyvrjS25e2ti+96ICmy9opCd6/f/Bk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-cc-xZTswNhyLjnEZ57jO5g-1; Mon, 03 Feb 2020 00:59:10 -0500
Received: by mail-wm1-f72.google.com with SMTP id p26so4359845wmg.5
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 21:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CCq6igyFtUFryHiJc1GtZp0OM7WgPr9yBIGGvwacZQY=;
 b=MeLT3zZxNtN5rYzQF6UHPAVEFD2aGpYJm+admxPL90ZnDZI9sB03m3hKqIPb432hHw
 ObK8t7XmGH6v4RqhIofN6ZZacK1+NOab2iIKZ7/pL4Y3W6WwIIFBHKuBMyoCwOqCDkKF
 TLrMUeQFVryd+nfGnAt19UzzAgaVCUr9NotLYAE9pXtRbCS3KnKENe1BXqYlBIP2ZKeT
 qJz4x+gFTBVQgpd7MgGIahTqMGDuteDVDq7LupNiezukwtb6zvVYzROGjsBeNWCY9ECu
 gO84+7d2vzcwNfEaqHRlER7BxdWXIg+HNkn/ewR3dpnvyx2v3I89SdhP6nEKWnYXcJm2
 3tOg==
X-Gm-Message-State: APjAAAXYat8FQj0Pj4oPUcDNh/N63fGL+mtHqiiRjrHxbnYrAK+CCeIG
 fIl2Xvz5bKPNUqTFEbzNW45k8Ro0ygmbueaGY+ZNTlOwaQ3y9uqUVNUCtkex5dL/aPV9WdSJ3Qb
 Yd2IEl3CfV5G5
X-Received: by 2002:a1c:7717:: with SMTP id t23mr27988161wmi.17.1580709549681; 
 Sun, 02 Feb 2020 21:59:09 -0800 (PST)
X-Received: by 2002:a1c:7717:: with SMTP id t23mr27988133wmi.17.1580709549404; 
 Sun, 02 Feb 2020 21:59:09 -0800 (PST)
Received: from redhat.com (ip-82-36-244-173.west.us.northamericancoax.com.
 [173.244.36.82])
 by smtp.gmail.com with ESMTPSA id h10sm21912241wre.3.2020.02.02.21.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 21:59:08 -0800 (PST)
Date: Mon, 3 Feb 2020 00:59:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v2 5/7] arm/acpi: fix duplicated _UID of PCI interrupt
 link devices
Message-ID: <20200203005841-mutt-send-email-mst@kernel.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203001505.52573-6-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203001505.52573-6-guoheyi@huawei.com>
X-MC-Unique: cc-xZTswNhyLjnEZ57jO5g-1
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
X-TUID: URQbbL+z6T2i

On Mon, Feb 03, 2020 at 08:15:03AM +0800, Heyi Guo wrote:
> Using _UID of 0 for all PCI interrupt link devices absolutely violates
> the spec. Simply increase one by one.
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
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5d157a9dd5..f3e340b172 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -189,7 +189,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
>          uint32_t irqs =3D  irq + i;
>          Aml *dev_gsi =3D aml_device("GSI%d", i);
>          aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F"))=
);
> -        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
> +        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
>          crs =3D aml_resource_template();
>          aml_append(crs,
>                     aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
> --=20
> 2.19.1

