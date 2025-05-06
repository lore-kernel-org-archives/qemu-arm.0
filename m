Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2967194njj;
        Tue, 6 May 2025 01:36:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCQ7akRISsdygMs5TCjmHMFs6B3AHkBhOPOVy+hCctQEqbow1yOrmeicDfTexIYeHPv7c4fPdW6ZsnMw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsGgOZDR2k4Gc3Qzpmre58+zWlg0jkiWl3eYXDGEpfP2aoQO3RHmWItE87XxIxv1d0QqaE
X-Received: by 2002:a05:620a:8519:b0:7ca:f4e8:9089 with SMTP id af79cd13be357-7caf4e890f2mr26684085a.11.1746520600145;
        Tue, 06 May 2025 01:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746520600; cv=none;
        d=google.com; s=arc-20240605;
        b=bewb3AHnRnwEERu+WZewtqDqQ0qGL/2nRGk1Mbw5dLTrbHpYZlxxHPBbguV803kXrG
         nTUR/fWPDU5Wsvn45cwve+eUZ4K+i3erFlEJZR68FFTmfUP7yELoPGWrnPnBxQcFO3va
         tI2TA0Tm49br9/GRygdzE9DqwGgzGHP/nf1yycj1dK+HEtQsPy3yQUaypFFb049ckRxh
         0Q7orozV0mx+uaQRuK2Ov+kfOhACjQdoWlyN8cBAr9YgIC+2xe4bT26qaIUs0Yvqu8xi
         QXqlvPlXzCJnvxYFJorRGP0PDYqBLu7AXGPRWvZldUHHP3HoU7IMoBwrnY5jMxwie6HN
         OCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=vzRxUUqSXVQUdnKiVXyaYhSafUHmT7dkVjZ/+WtaXQc=;
        fh=L5k2mRSqinh8rv+X+K9B0cKsw7VXHEq5HuwmzaH9KTE=;
        b=N+NcxET6SW3wOMQvFGM8nLJBVYvJy2xc6eJ/UUFG/cDSX9STMSUvb7ZoZxi8hUqeXU
         yDzfBrojX4e6us/IFREz74a01QYpSddhLctimCyRriZgJraqQMUpVf0JeS+Z801/knAh
         Geni31wHVUljwkPf0+UWkmziZXGJp24NhovdGoooSil9mEbZl5Bfy/3V6Yj4fPlxwr0n
         z9eONspsuFi3T78KghU3EYe9JjELC/cG6vdpO8DbxaOtrCHVd99pXSh5bFQbL1wlka6X
         iXGzOTi9V6bpUk/f1k6lR1XQ3p60t4a+z7CLQWZuaGXcQ4AXwwwYDB3bezPyvJr9u9ro
         LWpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad2435c9csi1123248985a.422.2025.05.06.01.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 01:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCDmh-0008Ll-HB; Tue, 06 May 2025 04:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uCDme-0008Kv-AK; Tue, 06 May 2025 04:36:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uCDmb-0005IK-6R; Tue, 06 May 2025 04:36:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsBSm1nv3z6M569;
 Tue,  6 May 2025 16:31:36 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
 by mail.maildlp.com (Postfix) with ESMTPS id 879851400E3;
 Tue,  6 May 2025 16:36:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 May 2025 10:36:05 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 6 May 2025 10:36:05 +0200
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v2 5/6] hw/arm/virt: Add support for smmuv3 device
Thread-Topic: [PATCH v2 5/6] hw/arm/virt: Add support for smmuv3 device
Thread-Index: AQHbu1jqYTsFj39vKkuQIG4UcJc6+bO/flOAgAXNP5A=
Date: Tue, 6 May 2025 08:36:05 +0000
Message-ID: <66d11898b79448b9876ac4d7b9e2ecf9@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-6-shameerali.kolothum.thodi@huawei.com>
 <aBUG34ZMbv+AspsR@Asurada-Nvidia>
In-Reply-To: <aBUG34ZMbv+AspsR@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lYYdcR1/MH6g



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, May 2, 2025 6:55 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
> mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v2 5/6] hw/arm/virt: Add support for smmuv3 device
>=20
> On Fri, May 02, 2025 at 11:27:06AM +0100, Shameer Kolothum wrote:
> > @@ -2972,6 +3004,21 @@ static void
> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >          virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
> errp);
> >      }
> >
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
>=20
> This seems to be on the path of a hotplug function? Mind elaborating
> why, while PATCH-1 sets hotpluggable to false?

Not really. Qemu has this path for both cold plug case(which is before the =
Guest
is booted, ie, -device arm-smmuv3, case) and for hot plug case (where we tr=
y to
add the device after Guest is booted, ie,  device_add arm-smmuv3, case).

We are preventing only the hot plug case.

>=20
> > +        if (!vms->legacy_smmuv3_present && vms->platform_bus_dev) {
> > +            VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
> > +
> > +            create_smmuv3_dev_dtb(vms, dev);
> > +            if (vms->iommu !=3D VIRT_IOMMU_SMMUV3) {
>=20
> Should this be VIRT_IOMMU_NONE only as the other cases are rejected?

The check is basically to handle cases where we will have multiple SMMUv3 d=
evices
and to set this only once.

Thanks,
Shameer
