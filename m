Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3087668njc;
        Wed, 18 Jun 2025 03:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYPsdV7hdYmSfU0kadfjYN4obizMFOM1z37D7hyzHpbthbNQlGs1pGUsCP4M30ij56qRpfSlh5+/qPow==@linaro.org
X-Google-Smtp-Source: AGHT+IEpbEnL2CW6Kjr+mKeDs93Gh43kzXbsSPi7HPEiB7wnQAmkuJnHaZgK4sHgeVHDhmC29GHv
X-Received: by 2002:ac8:5d09:0:b0:4a5:a7a8:fd83 with SMTP id d75a77b69052e-4a73c616f37mr264815251cf.44.1750243129455;
        Wed, 18 Jun 2025 03:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750243129; cv=none;
        d=google.com; s=arc-20240605;
        b=QHcs6U5ERVT4BpB+I8HpsAMHTJkAMay/lHfJ0umEyfYSetycOVEXNon2ywIWU1ecN8
         Xo04G5ALIpOr8EYSE9vMbBSlf7d6VUbDVsWip3NLIIy/SQKfqfmj1yNsmkYGSx4njhOK
         VrIxZ7tDo2DRWpaTbULqcVC2wFunN1QWvyRxVgk4+KfGn+RBZYuwm4kkp7L+/0cUsELb
         YZiet1FCdDwMSfbqXW34a7cjsyVGO3jtO7mgHXrurLF+aXb33ncJ9nKEvTU7B+CUdB17
         2HP6Pqln8wuE5RCHudRZCljmVxrK4+TkYIMNqYU+Ml7GmuGotp6TSsKP+WXUJXnStQ/d
         w6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=8r7BOO6LQtTJj0e3LGr1W05rvI+utiCDTHoKhi+1Hnw=;
        fh=n3GNNqGd4Pj4HPQoVPDFNwOHQEbjrUCJD74czssDJzA=;
        b=VcIJaseRbAMHMBHUxw4wDdddOx8ZRyZZcv0xcKbsQUeehyBhH0ghOgl70qmoyn5wpo
         73oiHdvmcV0ce3HGYUWkt9MKWmqhT4Y6v1onUdv60q8/StKIpuOoz/IfuTCAqVxKWeLr
         vqCsRQG2EFOfTpKnMbdHoZjdODyLUNM7XsCtlynyzgAHDh+eEC64aTlHHfJ0/As1rDYK
         bzhfRlQeYa8fUaeo7kPKW2mBNJyvmHkNzMapdZE7tCZHIisxCJvQY0/Y8urj7M6ZNEE3
         61fbcRIRzFPDnXttYC7KeF9kelWrpL77D0aCdwXLGbS2ASPf6TMDNvjWDjGoFg8XZs3N
         Vknw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a518bcasi140163351cf.534.2025.06.18.03.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 03:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRqBg-0006Eo-T6; Wed, 18 Jun 2025 06:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uRqBd-0006EZ-6P; Wed, 18 Jun 2025 06:38:33 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uRqBa-0001Xz-2v; Wed, 18 Jun 2025 06:38:32 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMgBd1f9wz6K7kc;
 Wed, 18 Jun 2025 18:36:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id DF06A140119;
 Wed, 18 Jun 2025 18:38:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 18 Jun
 2025 12:38:21 +0200
Date: Wed, 18 Jun 2025 11:38:19 +0100
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
CC: Eric Auger <eric.auger@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <20250618113819.0000054b@huawei.com>
In-Reply-To: <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
 <20250617175247.00007d43@huawei.com>
 <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VVo95X8AAuql

On Wed, 18 Jun 2025 09:35:35 +0100
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> > Sent: Tuesday, June 17, 2025 5:53 PM
> > To: Eric Auger <eric.auger@redhat.com>
> > Cc: Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> > <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
> > devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> > nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
> > Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe
> > Root Complex association
> >=20
> > On Tue, 17 Jun 2025 09:49:54 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  =20
> > > On 6/16/25 12:20 PM, Jonathan Cameron wrote: =20
> > > > On Fri, 13 Jun 2025 15:44:43 +0100
> > > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > > > =20
> > > >> Although this change does not affect functionality at present, it =
is =20
> > > > Patch title says PCIe.  This check is vs PCI host bridge.
> > > >
> > > > No idea which one you wanted, but if it is PCIe needs to be
> > > > TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> > > > I think. =20
> > > I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb
> > >
> > > pci-bridge/pci_expander_bridge.c:=A0=A0=A0 .parent=A0=A0=A0=A0=A0=A0=
=A0 =3D =20
> > TYPE_PCI_HOST_BRIDGE,
> >=20
> > Hmm. That's awkward and I'd forgotten that wrinkle.
> > Need a stronger test but which one?  The PXB root bus has a parent of
> > TYPE_PCIE_BUS.  Maybe we can check that? =20
>=20
> Ok. How about we do something like below?
>=20
>=20
> @@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev,
> Error **errp)
>  {
>      SMMUState *s =3D ARM_SMMU(dev);
>      SMMUBaseClass *sbc =3D ARM_SMMU_GET_CLASS(dev);
> +    PCIBus *pci_bus =3D s->primary_bus;
>      Error *local_err =3D NULL;
>=20
>      sbc->parent_realize(dev, &local_err);
> @@ -937,10 +939,31 @@ static void smmu_base_realize(DeviceState *dev,
> Error **errp)
>                                       g_free, g_free);
>      s->smmu_pcibus_by_busptr =3D g_hash_table_new(NULL, NULL);
>=20
> -    if (s->primary_bus) {
> -        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> -    } else {
> +    if (!pci_bus) {
>          error_setg(errp, "SMMU is not attached to any PCI bus!");
> +        return;
> +    }
> +
> +    /*
> +     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based=
 extra
> +     * root complexes to be associated with SMMU.
> +     */
> +    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
> +        object_dynamic_cast(OBJECT(pci_bus)->parent, TYPE_PCI_HOST_BRIDG=
E)) {
> +        /*
> +         * For pxb-pcie, parent_dev will be set. Make sure it is
> +         * pxb-pcie indeed.
> +         */
> +        if (pci_bus->parent_dev) {
> +            if (!object_dynamic_cast(OBJECT(pci_bus), "pxb-pcie-bus")) {
> +                error_setg(errp, "SMMU is not attached to pxb-pcie bus!"=
);
> +                return;
> +            }
> +        }
> +        pci_setup_iommu(pci_bus, &smmu_ops, s);
> +    } else {
> +       error_setg(errp, "SMMU should be attached to a default PCIe
> root complex"
> +                  "(pcie.0) or a pxb-pcie based root complex");
>      }
>  }
>=20
> Please let me know if this is good enough or not.
LGTM

>=20
> Thanks,
> Shameer

