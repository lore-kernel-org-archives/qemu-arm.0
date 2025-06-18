Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3035132njc;
        Wed, 18 Jun 2025 01:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbMMS2EK+g7fbYoecVVeNiUjf4AnBuD4M5HHkCZmJWfHNG3CvbwJvdNcoo+UJ7mopFrzBY08uwmFnPIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG8tS8mToR8gKk6c3ZPLwAfwjiS9ypIHktzbfM+J91/Na29OPSwXuf+asP5Fa9gK97FcNSm
X-Received: by 2002:a05:620a:198b:b0:7d3:e3bf:997a with SMTP id af79cd13be357-7d3e9323410mr224642485a.5.1750235778033;
        Wed, 18 Jun 2025 01:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750235778; cv=none;
        d=google.com; s=arc-20240605;
        b=clmnO8fXqcIUFSGI1AFY77eD7lEoyipnV9Eo3dMQ3p4mEixJwI8pAJ0SGaLm3JIvNg
         AfhSJNERwi3RCLsKRzgtyQah7nthSlWeZ6IUO2Pg40zLBAxJW2rZ8Ii96C2IdpHuZXJF
         Nw/UGV7ymzpO/XZmD9rMQ+diAGpiPIxjUtlUpmKBZyJg3b9cEVAAp3+tr5N/CPyDOlpS
         /Zng7XwvH5gVhZ9EziGDItL3och8/s8mxPygP9qkFZvC7CcoqnqH0h6eSgtlwMzBRrEq
         fdJgM1xvgSwfXK1FYwWg2vzcxKkyagkqSylRUDORD8mKb1jzEwAuRw7OeXYYs6vb2mcS
         xsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=gh9fsrjQlBdV9C2IcpaLcXhsBcn10pM5MIc2JNR5ryM=;
        fh=wMPHGTK104TEt+xQvk750MDhqGCDjcM2AYDBkx/TUX4=;
        b=ZMHnJ54R3s+gzO3gbQlIM/uTcEAj7YIWKt78aPW5O4ZZ5CNeiAewP2l9LyD6Kua3ZB
         8xdhcLvDHgY1nix4hFJRPBcpUGEc2B8F+5z02uS1gV6tBXtTIxWkz+uoihakydhmhn45
         MSm8lmWJZYBb5sk0FKqfOAE9wFVx9Sm2xWBh8aV5lwHMSfjXp+rzEngZtfwUZLDNdHsI
         lHoL+jfuHNF4Dn9pyDAETWSKznLayOhD5+zf8eOUWFye1vlntyqrqR5SsaIJCsya9K2v
         in4+SNpjqR3A9b8nZCQvBgQxQhIPCidXon3FxgbTSIGSKP8bf/JeVg8c5b9BmrnaLacF
         ExQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f4cf5bsi1351026285a.621.2025.06.18.01.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 01:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRoH3-0003Pi-Uc; Wed, 18 Jun 2025 04:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uRoH2-0003PU-5o; Wed, 18 Jun 2025 04:36:00 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uRoGz-0001eh-3E; Wed, 18 Jun 2025 04:35:59 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMcQ82917z6L5dV;
 Wed, 18 Jun 2025 16:30:56 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id C86291402F5;
 Wed, 18 Jun 2025 16:35:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Jun 2025 10:35:35 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 18 Jun 2025 10:35:35 +0200
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Eric Auger
 <eric.auger@redhat.com>
CC: Linuxarm <linuxarm@huawei.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, "Wangzhou
 (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Thread-Topic: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Thread-Index: AQHb3HJK5cxfqqKOvUqssRJx2PlFXrQFdhmAgAFoTgCAAJeugIABKGfw
Date: Wed, 18 Jun 2025 08:35:35 +0000
Message-ID: <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
 <20250617175247.00007d43@huawei.com>
In-Reply-To: <20250617175247.00007d43@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XHDff04ktvCN



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Tuesday, June 17, 2025 5:53 PM
> To: Eric Auger <eric.auger@redhat.com>
> Cc: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe
> Root Complex association
>=20
> On Tue, 17 Jun 2025 09:49:54 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>=20
> > On 6/16/25 12:20 PM, Jonathan Cameron wrote:
> > > On Fri, 13 Jun 2025 15:44:43 +0100
> > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > >
> > >> Although this change does not affect functionality at present, it is
> > > Patch title says PCIe.  This check is vs PCI host bridge.
> > >
> > > No idea which one you wanted, but if it is PCIe needs to be
> > > TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> > > I think.
> > I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb
> >
> > pci-bridge/pci_expander_bridge.c:=A0=A0=A0 .parent=A0=A0=A0=A0=A0=A0=A0=
 =3D
> TYPE_PCI_HOST_BRIDGE,
>=20
> Hmm. That's awkward and I'd forgotten that wrinkle.
> Need a stronger test but which one?  The PXB root bus has a parent of
> TYPE_PCIE_BUS.  Maybe we can check that?

Ok. How about we do something like below?


@@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev,
Error **errp)
 {
     SMMUState *s =3D ARM_SMMU(dev);
     SMMUBaseClass *sbc =3D ARM_SMMU_GET_CLASS(dev);
+    PCIBus *pci_bus =3D s->primary_bus;
     Error *local_err =3D NULL;

     sbc->parent_realize(dev, &local_err);
@@ -937,10 +939,31 @@ static void smmu_base_realize(DeviceState *dev,
Error **errp)
                                      g_free, g_free);
     s->smmu_pcibus_by_busptr =3D g_hash_table_new(NULL, NULL);

-    if (s->primary_bus) {
-        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
-    } else {
+    if (!pci_bus) {
         error_setg(errp, "SMMU is not attached to any PCI bus!");
+        return;
+    }
+
+    /*
+     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based e=
xtra
+     * root complexes to be associated with SMMU.
+     */
+    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
+        object_dynamic_cast(OBJECT(pci_bus)->parent, TYPE_PCI_HOST_BRIDGE)=
) {
+        /*
+         * For pxb-pcie, parent_dev will be set. Make sure it is
+         * pxb-pcie indeed.
+         */
+        if (pci_bus->parent_dev) {
+            if (!object_dynamic_cast(OBJECT(pci_bus), "pxb-pcie-bus")) {
+                error_setg(errp, "SMMU is not attached to pxb-pcie bus!");
+                return;
+            }
+        }
+        pci_setup_iommu(pci_bus, &smmu_ops, s);
+    } else {
+       error_setg(errp, "SMMU should be attached to a default PCIe
root complex"
+                  "(pcie.0) or a pxb-pcie based root complex");
     }
 }

Please let me know if this is good enough or not.

Thanks,
Shameer
