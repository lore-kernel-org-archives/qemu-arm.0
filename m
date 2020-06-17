Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp522715lfm;
        Wed, 17 Jun 2020 04:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxVuVmuk2RU3iXOIoZBvg+3lR2a3OLyHnWKpO8l7gHQTNUjdiJRCYry0wzGOXsXkMSlvFJ
X-Received: by 2002:a25:b901:: with SMTP id x1mr12192283ybj.498.1592393249228;
        Wed, 17 Jun 2020 04:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592393249; cv=none;
        d=google.com; s=arc-20160816;
        b=VL2Q/JKCC+Orx/ie94zCCGt1/S9E6zbzCujtmzOkCuqoJ3ltv1G2T3P9QY2b3prA5v
         ZtGnosPdNyCMeLJnRmuIvoxl0jAZJqqpLDku/TajH0sWzXuSoiwEQavk9POqJbcJbT/l
         te7cYApTdrbO3tzbgL3+/yOwWuJfVLBaUMGMNwfyKxN3sqGb03lXCAy80hiM5kCI6WrL
         PnqKmozSNn6bwgbsVOP3s5N+NCpe/ZCz1t+LIsIEqofZllYX60jlg1ZLGQFLpLyKx2lA
         huOpZOZ8IdtTefemznR9FDPodm+QbKuxfmhrn97n+uSipdByZcvDNjd7w8uDpRqU+HK6
         IShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=YSsHg8SiGaP0mMqoKXZ/+aL5lseTF3tN2yVZ3uRjOSg=;
        b=IQYf2nLN+RXONf4lgJchrlMX7gI09ckbwV1sSjDv41B1HgpoFI/QGwtaLzJ4mBBeGM
         PbHOMoNoWIzyW38GME0+r7c8EVfZTNS7wSk4qIEtiMJQTVejYrDQFvtl57oaB8YPr6u1
         HBb8/qMRfW/tUNUS7bwoCI+V4bFFa/QihcXrXhd3Ud1iMU0DTOE4MTfbncbiqn3eVbyx
         CR7yKTaj+zuXRZbs0IvWjw3WhI2aAeuP6JEXch3g1pKKBWRMTgYhLLlFKwzGoWqQXuop
         YE2zuJtv4XEY98UIImNweyBVz2UyysNpU24jyGSVi84YtTNWIs2zuzMXQLj9N1gHQhcY
         hrxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141si19451687ybf.456.2020.06.17.04.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 04:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlWE4-00006q-J4
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 07:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jlWDw-00006R-La; Wed, 17 Jun 2020 07:27:20 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2112 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jlWDu-0000RU-8i; Wed, 17 Jun 2020 07:27:20 -0400
Received: from lhreml721-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 14B5281C6825EAEA97AE;
 Wed, 17 Jun 2020 12:27:08 +0100 (IST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml721-chm.china.huawei.com (10.201.108.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Jun 2020 12:27:07 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1913.007; Wed, 17 Jun 2020 12:27:07 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: RE: [PATCH v2] arm/virt: Add memory hot remove support
Thread-Topic: [PATCH v2] arm/virt: Add memory hot remove support
Thread-Index: AQHWLpa0X8e9yg3bs02lkc+XqzxBrKjc1fYQ
Date: Wed, 17 Jun 2020 11:27:07 +0000
Message-ID: <4c405e4219b44f9bb9f74baae20f3071@huawei.com>
References: <20200520110354.14352-1-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20200520110354.14352-1-shameerali.kolothum.thodi@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.87.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 07:27:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l0jC7ALNMs8Q

Hi,

A gentle ping on this one.=20

Thanks,
Shameer

> -----Original Message-----
> From: Linuxarm [mailto:linuxarm-bounces@huawei.com] On Behalf Of Shameer
> Kolothum
> Sent: 20 May 2020 12:04
> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: peter.maydell@linaro.org; mst@redhat.com; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; Zengtao (B)
> <prime.zeng@hisilicon.com>; imammedo@redhat.com
> Subject: [PATCH v2] arm/virt: Add memory hot remove support
>=20
> This adds support for memory hot remove on arm/virt that uses acpi ged
> device.
>=20
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> RFC v1 --> v2
>   -Rebased on top of latest Qemu master.
>   -Dropped "RFC" and tested with kernel 5.7-rc6
> ---
>  hw/acpi/generic_event_device.c | 28 +++++++++++++++++
>  hw/arm/virt.c                  | 56
> ++++++++++++++++++++++++++++++++--
>  2 files changed, 82 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_devic=
e.c
> index b1cbdd86b6..2b3bedcd2f 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -193,6 +193,32 @@ static void acpi_ged_device_plug_cb(HotplugHandler
> *hotplug_dev,
>      }
>  }
>=20
> +static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                       DeviceState *dev, Error
> **errp)
> +{
> +    AcpiGedState *s =3D ACPI_GED(hotplug_dev);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state,
> dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device unplug request for unsupported
> device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
> +                               DeviceState *dev, Error **errp) {
> +    AcpiGedState *s =3D ACPI_GED(hotplug_dev);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device unplug for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits =
ev)
> {
>      AcpiGedState *s =3D ACPI_GED(adev);
> @@ -318,6 +344,8 @@ static void acpi_ged_class_init(ObjectClass *class,
> void *data)
>      dc->vmsd =3D &vmstate_acpi_ged;
>=20
>      hc->plug =3D acpi_ged_device_plug_cb;
> +    hc->unplug_request =3D acpi_ged_unplug_request_cb;
> +    hc->unplug =3D acpi_ged_unplug_cb;
>=20
>      adevc->send_event =3D acpi_ged_send_event;  } diff --git a/hw/arm/vi=
rt.c
> b/hw/arm/virt.c index 37462a6f78..110fa73990 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2177,11 +2177,62 @@ static void
> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>=20
> +static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
> +                                     DeviceState *dev, Error **errp)
> {
> +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> +    Error *local_err =3D NULL;
> +
> +    if (!vms->acpi_dev) {
> +        error_setg(errp,
> +                   "memory hotplug is not enabled: missing acpi-ged
> device");
> +        goto out;
> +    }
> +
> +    hotplug_handler_unplug_request(HOTPLUG_HANDLER(vms->acpi_dev),
> dev,
> +                                   &local_err);
> +out:
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> +                             DeviceState *dev, Error **errp) {
> +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> +    Error *local_err =3D NULL;
> +
> +    hotplug_handler_unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev,
> &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    pc_dimm_unplug(PC_DIMM(dev), MACHINE(vms));
> +    object_property_set_bool(OBJECT(dev), false, "realized", NULL);
> +
> + out:
> +    error_propagate(errp, local_err);
> +}
> +
>  static void virt_machine_device_unplug_request_cb(HotplugHandler
> *hotplug_dev,
>                                            DeviceState *dev, Error
> **errp)  {
> -    error_setg(errp, "device unplug request for unsupported device"
> -               " type: %s", object_get_typename(OBJECT(dev)));
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug_request(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "device unplug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                          DeviceState *dev, Error
> +**errp) {
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "virt: device unplug for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
>  }
>=20
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState
> *machine, @@ -2262,6 +2313,7 @@ static void
> virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->pre_plug =3D virt_machine_device_pre_plug_cb;
>      hc->plug =3D virt_machine_device_plug_cb;
>      hc->unplug_request =3D virt_machine_device_unplug_request_cb;
> +    hc->unplug =3D virt_machine_device_unplug_cb;
>      mc->numa_mem_supported =3D true;
>      mc->nvdimm_supported =3D true;
>      mc->auto_enable_numa_with_memhp =3D true;
> --
> 2.17.1
>=20
>=20
> _______________________________________________
> Linuxarm mailing list
> Linuxarm@huawei.com
> http://hulk.huawei.com/mailman/listinfo/linuxarm
