Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp539130ejx;
        Wed, 16 Nov 2022 07:48:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Lv9rZBbcSxFdVI/2L7JUd9Rpq1jmT6kpvAIRoYXImNqqOLgWxgKYzaleODzU4ux2hiLtc
X-Received: by 2002:a0c:eb8f:0:b0:4bb:61d6:85bb with SMTP id x15-20020a0ceb8f000000b004bb61d685bbmr21299238qvo.86.1668613737816;
        Wed, 16 Nov 2022 07:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668613737; cv=none;
        d=google.com; s=arc-20160816;
        b=0e81NjNPHHVRkbbHtK69sHIljc+DJpBno3w2idFgI55HliafPUWNiF7PzqLTAfPG3h
         6lxhLT37q7n6twaiomBo4zeM2IAQIh3IZLS3IWn6HcSJJ3vYhHRV9NM0hQ0zHUGdXYVU
         SbO6mevUEj6241m/GB1NYm4uX+2FneGOPwtkC70tbnRM9zRd/GGMuqK/oN3h22chsnab
         kuXFyannPH11DmH4SH4pNvpndH8efcTZl6mPqLWBoxcuybfZ9KFcAYcGsY5ag6yfQssQ
         fZOYvaL0Gk6ypJjmb7y5aOnx58HL9bVfKS74mxVxktmIqIZIuALw+76BzAjagdP4CSkf
         JwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=dpszX8NAsdctKP7zqYiaMTdy749Jmnwnn12XCX7WItg=;
        b=u8CNGgXoOZuMO4jRB8t78ZStjEsCUMRngIQwj1xrWnR0NZH8xmrPCsqnkUkZOsKfSt
         GM9eMUmra6Mgev6W+xTDylj1mwFNAHsQcqbzYaim0KsWgx+BVBE2lc3h+gH/1TDE7pWt
         rkn6Da5q9ZlIev9HY7JLbuUtug8fm1XCu6+qPOYqLgiZs6/2XzKhJtRH/yPjG0gSYEl7
         JmlsDR89CUQU1bhqGRwlxaX+378r3IcFInHnPnjFSaTpV7CPXgRser/Rge0xgv7TdI1p
         5u/+lJho5O3T6bhToiti6Sc0F4HY4hg8jpi+ZdpH960xTL1PCQSGlX6wNPvAK9yF4lX7
         rfvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1WU2QRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cg11-20020a05622a408b00b003a500649da5si9352454qtb.489.2022.11.16.07.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 07:48:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1WU2QRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovKeY-0004X7-ND; Wed, 16 Nov 2022 10:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKeV-0004Tc-1Q
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKeT-0002K8-5k
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668613716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpszX8NAsdctKP7zqYiaMTdy749Jmnwnn12XCX7WItg=;
 b=f1WU2QRukCgdr0ZcMf0bDPy9/KOmCb+oQmCTfstCo0bY/0NAc7byVT9GSlzHNC74TNeqmS
 hWu3rmOErjhS2W8Kd2hjzO+MFuxKcMjU38uK4rHsUPywG3jvmPBdCFsJAoRz1NymE1sPko
 fpVF43eWnZJPyR6SXZILT3BD6obkiTM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-KmCROmYLOVa396mvDsZAow-1; Wed, 16 Nov 2022 10:48:34 -0500
X-MC-Unique: KmCROmYLOVa396mvDsZAow-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb4-20020a1709076d8400b007ae596eac08so10397541ejc.22
 for <qemu-arm@nongnu.org>; Wed, 16 Nov 2022 07:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpszX8NAsdctKP7zqYiaMTdy749Jmnwnn12XCX7WItg=;
 b=lPza9+YMJsexEUfHqWszsscMzHa605NBm+PEO0bCdxeaGzNsoiLgl5/SdfFisRlX8u
 VqOlAHBE/cZl0Q4E11htWbpgeBYYb2BNKjiMmEuR4vq7vasxlsulNE6iTTzrNMV8qk4N
 2G0h0BCi2LpYNhEOC0DOJLyBhK26rMGSxs/3hpAKJn07F8WRNFY0uQjCXtX/ZYKFHDva
 YoX6Gqq/hGi/9Vmfl8wu8NJ5ejTqDrd+L84EReD2BfRvY1f7bzcP+Eh6QNS6f12TJRcE
 XD47XS0vfT7nqFIKq0lfh6VK4b0m1sSaVSmwjypvHJiV01juwB4U3DVc+P9fCyQMRanC
 VyUw==
X-Gm-Message-State: ANoB5pkGyUzCTyzLj9XN4UtraDZ3FWsCaXdSJie/HgRjJcb0mKBYFrvh
 FO1ekDIQn8xVEFXN1NNvENDawpaTbYOtfdS6q8aOnnvOV3uzcJN5QZAQnFGL4eDObGxJQ0GqVqK
 5dalBCW87NbLp
X-Received: by 2002:a17:906:b181:b0:7ad:69eb:90c3 with SMTP id
 w1-20020a170906b18100b007ad69eb90c3mr18676142ejy.285.1668613712949; 
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
X-Received: by 2002:a17:906:b181:b0:7ad:69eb:90c3 with SMTP id
 w1-20020a170906b18100b007ad69eb90c3mr18676117ejy.285.1668613712737; 
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b0079800b81709sm6953778ejo.219.2022.11.16.07.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
Date: Wed, 16 Nov 2022 16:48:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 mark.cave-ayland@ilande.co.uk, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] pci: drop redundant PCIDeviceClass::is_bridge field
Message-ID: <20221116164831.4f4266cd@imammedo.users.ipa.redhat.com>
In-Reply-To: <894b767d-b071-a37a-db61-9538d63e00dc@linaro.org>
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-3-imammedo@redhat.com>
 <894b767d-b071-a37a-db61-9538d63e00dc@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wLdCSSAH0M6

On Wed, 16 Nov 2022 16:35:10 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 16/11/22 16:27, Igor Mammedov wrote:
> > and use cast to TYPE_PCI_BRIDGE instead.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >   include/hw/pci/pci.h               | 11 +----------
> >   include/hw/pci/pci_bridge.h        |  1 +
> >   hw/acpi/pcihp.c                    |  3 +--
> >   hw/i386/acpi-build.c               |  5 ++---
> >   hw/pci-bridge/cxl_downstream.c     |  1 -
> >   hw/pci-bridge/cxl_upstream.c       |  1 -
> >   hw/pci-bridge/i82801b11.c          |  1 -
> >   hw/pci-bridge/pci_bridge_dev.c     |  1 -
> >   hw/pci-bridge/pcie_pci_bridge.c    |  1 -
> >   hw/pci-bridge/pcie_root_port.c     |  1 -
> >   hw/pci-bridge/simba.c              |  1 -
> >   hw/pci-bridge/xio3130_downstream.c |  1 -
> >   hw/pci-bridge/xio3130_upstream.c   |  1 -
> >   hw/pci-host/designware.c           |  1 -
> >   hw/pci-host/xilinx-pcie.c          |  1 -
> >   hw/pci/pci.c                       | 20 +++++++++-----------
> >   hw/ppc/spapr_pci.c                 | 15 +++++----------
> >   17 files changed, 19 insertions(+), 47 deletions(-) =20
>=20
> > @@ -1090,9 +1088,10 @@ static PCIDevice *do_pci_register_device(PCIDevi=
ce *pci_dev,
> >       Error *local_err =3D NULL;
> >       DeviceState *dev =3D DEVICE(pci_dev);
> >       PCIBus *bus =3D pci_get_bus(pci_dev);
> > +    bool is_bridge =3D IS_PCI_BRIDGE(pci_dev);
> >  =20
> >       /* Only pci bridges can be attached to extra PCI root buses */
> > -    if (pci_bus_is_root(bus) && bus->parent_dev && !pc->is_bridge) {
> > +    if (pci_bus_is_root(bus) && bus->parent_dev && !IS_PCI_BRIDGE(pci_=
dev)) { =20
>=20
> Can we use the recently assigned 'is_bridge' variable?

yep, that was an intention behind the variable.
I'll fix it up on respin.

>=20
> Otherwise:
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20

