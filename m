Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1121117ejx;
        Wed, 30 Nov 2022 03:20:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5yiPkp+DNvNjR61g8nC2NCsORrmwDrN3lK8TA9yUTEpVw6HZ5Negjy1ODtqYtWi6d+tK0U
X-Received: by 2002:a37:6d8:0:b0:6fa:ece6:7c5e with SMTP id 207-20020a3706d8000000b006faece67c5emr54971067qkg.466.1669807254504;
        Wed, 30 Nov 2022 03:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669807254; cv=none;
        d=google.com; s=arc-20160816;
        b=z0oe4VcorNr5jwD+CEvLEnCZsUEwOicT+qNoi2Zs/eY0v/hRyDdOdZevvUKBeaWbzg
         SUibQfeESKRyRFPgICyqbEt5wrc5Y/lqzpbp/19ml2Kd6+FhTU3mS087dz3LnrsB9/Tq
         or6qdkf/FtA0BFyxoJvOTz57jFaPmbvQzNm+ZtUnsqf7t3lv542oL0TPmMpvA2r7BdEq
         KVltB56vcvsTqreRMtlNjayJtJeic3I85lW1qXOWY67GdguMgvIXxKWEwtkqUpFtH1z3
         C9Ix30TM0XFdJnN4IB+n0zsaUnQCOgWuCyTqvb2HKvZ1dicOsy1lr0uIXP+MC1LtH9VP
         w1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=6wzFQS3gLuzhLRh2KPqs2eQdltgQ2yAJ5hiWbeHzlwU=;
        b=z1Ba0NRaP7WVpqo5iYZRNhK9y7D5m1yfFzkqTTySOKSROCOdU1FIa/+xAV3NEIJmDa
         pjuAdftviU5EayLo2HpCud5tjWV0mtuB1I/osickRGiM5Y9JJCSQnVC5hh7KW1p2eKvE
         4QOZeqfDfkr2i4VpJWtBiieuWxfgW+D4edjAql1bid9WrA2SBWeGTE3rlrBAVVz39rbt
         V1nVVUbVcL/BMVzOcMdpa8M41nEltp29fg3BEg5S+HpWf/Q9FhUFO6Yas59rEn3ZZGF0
         wlNjcuksvATUOdxtGRRgRfbVSdEoARMdkslb3eWUSWy8tPRtjQQtmO3m4LR7DkBjLvOj
         TkiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm14-20020a05622a250e00b003a575a9bc72si664007qtb.340.2022.11.30.03.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 03:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0L91-00038G-AV; Wed, 30 Nov 2022 06:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1p0L8y-00037q-EN
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 06:20:49 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1p0L8v-0003Hz-DR
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 06:20:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B5E0D33F1E;
 Wed, 30 Nov 2022 11:20:30 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 30 Nov
 2022 12:20:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00484e1f006-89d5-4851-a2b3-20ffab76a8d7,
 9433ACEAB4E44C6AFEC55264D2D2BE00F9EACC0D) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 30 Nov 2022 12:20:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Igor Mammedov <imammedo@redhat.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <ani@anisinha.ca>,
 <pbonzini@redhat.com>, <richard.henderson@linaro.org>,
 <mark.cave-ayland@ilande.co.uk>, <peter.maydell@linaro.org>,
 <andrew.smirnov@gmail.com>, <paulburton@kernel.org>,
 <aleksandar.rikalo@syrmia.com>, <danielhb413@gmail.com>, <clg@kaod.org>,
 <david@gibson.dropbear.id.au>, <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Subject: Re: [PATCH v2 for-8.0 2/2] pci: drop redundant
 PCIDeviceClass::is_bridge field
Message-ID: <20221130122028.7cf54ef3@bahia>
In-Reply-To: <20221129101341.185621-3-imammedo@redhat.com>
References: <20221129101341.185621-1-imammedo@redhat.com>
 <20221129101341.185621-3-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 11f0c816-3e71-473b-8fdb-485c62b78c0e
X-Ovh-Tracer-Id: 4358921491718904135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtdefgddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuueeijedtleeluedthfetjeffieetffeuvefffeeftedvieefueejgfdugeetueenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhmrghmmhgvughosehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdprghlvghkshgrnhgurghrrdhrihhkrghlohesshihrhhmihgrrdgtohhmpdhprghulhgsuhhrthhonheskhgvrhhnvghlrdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfidrshhmihhrnhhovhesghhmrghilhdrtghomh
 dpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgrnhhisegrnhhishhinhhhrgdrtggrpdhmshhtsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgtlhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=groug@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cFAVcpynxz+E

On Tue, 29 Nov 2022 11:13:41 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> and use cast to TYPE_PCI_BRIDGE instead.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> v2:
>    (Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>)
>       - replace leftover IS_PCI_BRIDGE cast with is_bridge variable
> ---
>  include/hw/pci/pci.h               | 11 +----------
>  include/hw/pci/pci_bridge.h        |  1 +
>  hw/acpi/pcihp.c                    |  3 +--
>  hw/i386/acpi-build.c               |  5 ++---
>  hw/pci-bridge/cxl_downstream.c     |  1 -
>  hw/pci-bridge/cxl_upstream.c       |  1 -
>  hw/pci-bridge/i82801b11.c          |  1 -
>  hw/pci-bridge/pci_bridge_dev.c     |  1 -
>  hw/pci-bridge/pcie_pci_bridge.c    |  1 -
>  hw/pci-bridge/pcie_root_port.c     |  1 -
>  hw/pci-bridge/simba.c              |  1 -
>  hw/pci-bridge/xio3130_downstream.c |  1 -
>  hw/pci-bridge/xio3130_upstream.c   |  1 -
>  hw/pci-host/designware.c           |  1 -
>  hw/pci-host/xilinx-pcie.c          |  1 -
>  hw/pci/pci.c                       | 20 +++++++++-----------
>  hw/ppc/spapr_pci.c                 | 15 +++++----------

For ppc changes :

Reviewed-by: Greg Kurz <groug@kaod.org>

>  17 files changed, 19 insertions(+), 47 deletions(-)
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6ccaaf5154..8b3a8571bf 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -250,16 +250,7 @@ struct PCIDeviceClass {
>      uint16_t class_id;
>      uint16_t subsystem_vendor_id;       /* only for header type =3D 0 */
>      uint16_t subsystem_id;              /* only for header type =3D 0 */
> -
> -    /*
> -     * pci-to-pci bridge or normal device.
> -     * This doesn't mean pci host switch.
> -     * When card bus bridge is supported, this would be enhanced.
> -     */
> -    bool is_bridge;
> -
> -    /* rom bar */
> -    const char *romfile;
> +    const char *romfile;                /* rom bar */
>  };
> =20
>  typedef void (*PCIINTxRoutingNotifier)(PCIDevice *dev);
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index ba4bafac7c..ca6caf487e 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -53,6 +53,7 @@ struct PCIBridgeWindows {
> =20
>  #define TYPE_PCI_BRIDGE "base-pci-bridge"
>  OBJECT_DECLARE_SIMPLE_TYPE(PCIBridge, PCI_BRIDGE)
> +#define IS_PCI_BRIDGE(dev) object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRI=
DGE)
> =20
>  struct PCIBridge {
>      /*< private >*/
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 84d75e6b84..99a898d9ae 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -186,7 +186,6 @@ static PCIBus *acpi_pcihp_find_hotplug_bus(AcpiPciHpS=
tate *s, int bsel)
> =20
>  static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
>  {
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
>      DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
>      /*
>       * ACPI doesn't allow hotplug of bridge devices.  Don't allow
> @@ -196,7 +195,7 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *=
s, PCIDevice *dev)
>       * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
>       * will be removed implicitly, when Physical Function is unplugged.
>       */
> -    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable=
 ||
> +    return (IS_PCI_BRIDGE(dev) && !dev->qdev.hotplugged) || !dc->hotplug=
gable ||
>             pci_is_vf(dev);
>  }
> =20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d9eaa5fc4d..aa15b11cde 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -403,7 +403,6 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,
> =20
>      for (devfn =3D 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>          DeviceClass *dc;
> -        PCIDeviceClass *pc;
>          PCIDevice *pdev =3D bus->devices[devfn];
>          int slot =3D PCI_SLOT(devfn);
>          int func =3D PCI_FUNC(devfn);
> @@ -414,14 +413,14 @@ static void build_append_pci_bus_devices(Aml *paren=
t_scope, PCIBus *bus,
>          bool cold_plugged_bridge =3D false;
> =20
>          if (pdev) {
> -            pc =3D PCI_DEVICE_GET_CLASS(pdev);
>              dc =3D DEVICE_GET_CLASS(pdev);
> =20
>              /*
>               * Cold plugged bridges aren't themselves hot-pluggable.
>               * Hotplugged bridges *are* hot-pluggable.
>               */
> -            cold_plugged_bridge =3D pc->is_bridge && !DEVICE(pdev)->hotp=
lugged;
> +            cold_plugged_bridge =3D IS_PCI_BRIDGE(pdev) &&
> +                                  !DEVICE(pdev)->hotplugged;
>              bridge_in_acpi =3D  cold_plugged_bridge && pcihp_bridge_en;
> =20
>              hotpluggbale_slot =3D bsel && dc->hotpluggable &&
> diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstrea=
m.c
> index a361e519d0..3d4e6b59cd 100644
> --- a/hw/pci-bridge/cxl_downstream.c
> +++ b/hw/pci-bridge/cxl_downstream.c
> @@ -217,7 +217,6 @@ static void cxl_dsp_class_init(ObjectClass *oc, void =
*data)
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(oc);
> =20
> -    k->is_bridge =3D true;
>      k->config_write =3D cxl_dsp_config_write;
>      k->realize =3D cxl_dsp_realize;
>      k->exit =3D cxl_dsp_exitfn;
> diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
> index 9b8b57df9d..9df436cb73 100644
> --- a/hw/pci-bridge/cxl_upstream.c
> +++ b/hw/pci-bridge/cxl_upstream.c
> @@ -375,7 +375,6 @@ static void cxl_upstream_class_init(ObjectClass *oc, =
void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(oc);
> =20
> -    k->is_bridge =3D true;
>      k->config_write =3D cxl_usp_write_config;
>      k->config_read =3D cxl_usp_read_config;
>      k->realize =3D cxl_usp_realize;
> diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
> index f28181e210..d9f224818b 100644
> --- a/hw/pci-bridge/i82801b11.c
> +++ b/hw/pci-bridge/i82801b11.c
> @@ -92,7 +92,6 @@ static void i82801b11_bridge_class_init(ObjectClass *kl=
ass, void *data)
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> -    k->is_bridge =3D true;
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
>      k->device_id =3D PCI_DEVICE_ID_INTEL_82801BA_11;
>      k->revision =3D ICH9_D2P_A2_REVISION;
> diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_de=
v.c
> index 657a06ddbe..3435df8d73 100644
> --- a/hw/pci-bridge/pci_bridge_dev.c
> +++ b/hw/pci-bridge/pci_bridge_dev.c
> @@ -254,7 +254,6 @@ static void pci_bridge_dev_class_init(ObjectClass *kl=
ass, void *data)
>      k->vendor_id =3D PCI_VENDOR_ID_REDHAT;
>      k->device_id =3D PCI_DEVICE_ID_REDHAT_BRIDGE;
>      k->class_id =3D PCI_CLASS_BRIDGE_PCI;
> -    k->is_bridge =3D true;
>      dc->desc =3D "Standard PCI Bridge";
>      dc->reset =3D qdev_pci_bridge_dev_reset;
>      device_class_set_props(dc, pci_bridge_dev_properties);
> diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bri=
dge.c
> index 1cd917a459..2301b2ca0b 100644
> --- a/hw/pci-bridge/pcie_pci_bridge.c
> +++ b/hw/pci-bridge/pcie_pci_bridge.c
> @@ -145,7 +145,6 @@ static void pcie_pci_bridge_class_init(ObjectClass *k=
lass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
> =20
> -    k->is_bridge =3D true;
>      k->vendor_id =3D PCI_VENDOR_ID_REDHAT;
>      k->device_id =3D PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE;
>      k->realize =3D pcie_pci_bridge_realize;
> diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_por=
t.c
> index 460e48269d..e0a7a036f5 100644
> --- a/hw/pci-bridge/pcie_root_port.c
> +++ b/hw/pci-bridge/pcie_root_port.c
> @@ -172,7 +172,6 @@ static void rp_class_init(ObjectClass *klass, void *d=
ata)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> =20
> -    k->is_bridge =3D true;
>      k->config_write =3D rp_write_config;
>      k->realize =3D rp_realize;
>      k->exit =3D rp_exit;
> diff --git a/hw/pci-bridge/simba.c b/hw/pci-bridge/simba.c
> index ba55ab1939..17aa0d7b21 100644
> --- a/hw/pci-bridge/simba.c
> +++ b/hw/pci-bridge/simba.c
> @@ -77,7 +77,6 @@ static void simba_pci_bridge_class_init(ObjectClass *kl=
ass, void *data)
>      k->device_id =3D PCI_DEVICE_ID_SUN_SIMBA;
>      k->revision =3D 0x11;
>      k->config_write =3D pci_bridge_write_config;
> -    k->is_bridge =3D true;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->reset =3D pci_bridge_reset;
>      dc->vmsd =3D &vmstate_pci_device;
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_d=
ownstream.c
> index 05e2b06c0c..38a2361fa2 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -159,7 +159,6 @@ static void xio3130_downstream_class_init(ObjectClass=
 *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> =20
> -    k->is_bridge =3D true;
>      k->config_write =3D xio3130_downstream_write_config;
>      k->realize =3D xio3130_downstream_realize;
>      k->exit =3D xio3130_downstream_exitfn;
> diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_ups=
tream.c
> index 5ff46ef050..a48bfe3bc5 100644
> --- a/hw/pci-bridge/xio3130_upstream.c
> +++ b/hw/pci-bridge/xio3130_upstream.c
> @@ -128,7 +128,6 @@ static void xio3130_upstream_class_init(ObjectClass *=
klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> =20
> -    k->is_bridge =3D true;
>      k->config_write =3D xio3130_upstream_write_config;
>      k->realize =3D xio3130_upstream_realize;
>      k->exit =3D xio3130_upstream_exitfn;
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index bde3a343a2..9e183caa48 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -600,7 +600,6 @@ static void designware_pcie_root_class_init(ObjectCla=
ss *klass, void *data)
>      k->device_id =3D 0xABCD;
>      k->revision =3D 0;
>      k->class_id =3D PCI_CLASS_BRIDGE_PCI;
> -    k->is_bridge =3D true;
>      k->exit =3D pci_bridge_exitfn;
>      k->realize =3D designware_pcie_root_realize;
>      k->config_read =3D designware_pcie_root_config_read;
> diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
> index 38d5901a45..c9ab7052f4 100644
> --- a/hw/pci-host/xilinx-pcie.c
> +++ b/hw/pci-host/xilinx-pcie.c
> @@ -298,7 +298,6 @@ static void xilinx_pcie_root_class_init(ObjectClass *=
klass, void *data)
>      k->device_id =3D 0x7021;
>      k->revision =3D 0;
>      k->class_id =3D PCI_CLASS_BRIDGE_HOST;
> -    k->is_bridge =3D true;
>      k->realize =3D xilinx_pcie_root_realize;
>      k->exit =3D pci_bridge_exitfn;
>      dc->reset =3D pci_bridge_reset;
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..fe05b868e1 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -576,7 +576,7 @@ void pci_bus_range(PCIBus *bus, int *min_bus, int *ma=
x_bus)
>      for (i =3D 0; i < ARRAY_SIZE(bus->devices); ++i) {
>          PCIDevice *dev =3D bus->devices[i];
> =20
> -        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
> +        if (dev && IS_PCI_BRIDGE(dev)) {
>              *min_bus =3D MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
>              *max_bus =3D MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
>          }
> @@ -592,7 +592,6 @@ static int get_pci_config_device(QEMUFile *f, void *p=
v, size_t size,
>                                   const VMStateField *field)
>  {
>      PCIDevice *s =3D container_of(pv, PCIDevice, config);
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(s);
>      uint8_t *config;
>      int i;
> =20
> @@ -614,9 +613,8 @@ static int get_pci_config_device(QEMUFile *f, void *p=
v, size_t size,
>      memcpy(s->config, config, size);
> =20
>      pci_update_mappings(s);
> -    if (pc->is_bridge) {
> -        PCIBridge *b =3D PCI_BRIDGE(s);
> -        pci_bridge_update_mappings(b);
> +    if (IS_PCI_BRIDGE(s)) {
> +        pci_bridge_update_mappings(PCI_BRIDGE(s));
>      }
> =20
>      memory_region_set_enabled(&s->bus_master_enable_region,
> @@ -1090,9 +1088,10 @@ static PCIDevice *do_pci_register_device(PCIDevice=
 *pci_dev,
>      Error *local_err =3D NULL;
>      DeviceState *dev =3D DEVICE(pci_dev);
>      PCIBus *bus =3D pci_get_bus(pci_dev);
> +    bool is_bridge =3D IS_PCI_BRIDGE(pci_dev);
> =20
>      /* Only pci bridges can be attached to extra PCI root buses */
> -    if (pci_bus_is_root(bus) && bus->parent_dev && !pc->is_bridge) {
> +    if (pci_bus_is_root(bus) && bus->parent_dev && !is_bridge) {
>          error_setg(errp,
>                     "PCI: Only PCI/PCIe bridges can be plugged into %s",
>                      bus->parent_dev->name);
> @@ -1154,7 +1153,7 @@ static PCIDevice *do_pci_register_device(PCIDevice =
*pci_dev,
>      pci_config_set_revision(pci_dev->config, pc->revision);
>      pci_config_set_class(pci_dev->config, pc->class_id);
> =20
> -    if (!pc->is_bridge) {
> +    if (!is_bridge) {
>          if (pc->subsystem_vendor_id || pc->subsystem_id) {
>              pci_set_word(pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID,
>                           pc->subsystem_vendor_id);
> @@ -1171,7 +1170,7 @@ static PCIDevice *do_pci_register_device(PCIDevice =
*pci_dev,
>      pci_init_cmask(pci_dev);
>      pci_init_wmask(pci_dev);
>      pci_init_w1cmask(pci_dev);
> -    if (pc->is_bridge) {
> +    if (is_bridge) {
>          pci_init_mask_bridge(pci_dev);
>      }
>      pci_init_multifunction(bus, pci_dev, &local_err);
> @@ -2096,7 +2095,7 @@ static bool pci_root_bus_in_range(PCIBus *bus, int =
bus_num)
>      for (i =3D 0; i < ARRAY_SIZE(bus->devices); ++i) {
>          PCIDevice *dev =3D bus->devices[i];
> =20
> -        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
> +        if (dev && IS_PCI_BRIDGE(dev)) {
>              if (pci_secondary_bus_in_range(dev, bus_num)) {
>                  return true;
>              }
> @@ -2841,7 +2840,6 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, =
void *opaque)
>  static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
>  {
>      Range *range =3D opaque;
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
>      uint16_t cmd =3D pci_get_word(dev->config + PCI_COMMAND);
>      int i;
> =20
> @@ -2849,7 +2847,7 @@ static void pci_dev_get_w64(PCIBus *b, PCIDevice *d=
ev, void *opaque)
>          return;
>      }
> =20
> -    if (pc->is_bridge) {
> +    if (IS_PCI_BRIDGE(dev)) {
>          pcibus_t base =3D pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_=
PREFETCH);
>          pcibus_t limit =3D pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_ME=
M_PREFETCH);
> =20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7b7618d5da..75aacda65a 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1361,7 +1361,6 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb,=
 PCIDevice *dev,
>  {
>      int offset;
>      g_autofree gchar *nodename =3D spapr_pci_fw_dev_name(dev);
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
>      ResourceProps rp;
>      SpaprDrc *drc =3D drc_from_dev(sphb, dev);
>      uint32_t vendor_id =3D pci_default_read_config(dev, PCI_VENDOR_ID, 2=
);
> @@ -1446,7 +1445,7 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb,=
 PCIDevice *dev,
> =20
>      spapr_phb_nvgpu_populate_pcidev_dt(dev, fdt, offset, sphb);
> =20
> -    if (!pc->is_bridge) {
> +    if (!IS_PCI_BRIDGE(dev)) {
>          /* Properties only for non-bridges */
>          uint32_t min_grant =3D pci_default_read_config(dev, PCI_MIN_GNT,=
 1);
>          uint32_t max_latency =3D pci_default_read_config(dev, PCI_MAX_LA=
T, 1);
> @@ -1544,7 +1543,6 @@ static void spapr_pci_pre_plug(HotplugHandler *plug=
_handler,
>  {
>      SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
>      PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
>      SpaprDrc *drc =3D drc_from_dev(phb, pdev);
>      PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
>      uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
> @@ -1560,7 +1558,7 @@ static void spapr_pci_pre_plug(HotplugHandler *plug=
_handler,
>          }
>      }
> =20
> -    if (pc->is_bridge) {
> +    if (IS_PCI_BRIDGE(plugged_dev)) {
>          if (!bridge_has_valid_chassis_nr(OBJECT(plugged_dev), errp)) {
>              return;
>          }
> @@ -1589,7 +1587,6 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
>  {
>      SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
>      PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
>      SpaprDrc *drc =3D drc_from_dev(phb, pdev);
>      uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
> =20
> @@ -1603,7 +1600,7 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
> =20
>      g_assert(drc);
> =20
> -    if (pc->is_bridge) {
> +    if (IS_PCI_BRIDGE(plugged_dev)) {
>          spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
>      }
> =20
> @@ -1646,7 +1643,6 @@ static void spapr_pci_bridge_unplug(SpaprPhbState *=
phb,
>  static void spapr_pci_unplug(HotplugHandler *plug_handler,
>                               DeviceState *plugged_dev, Error **errp)
>  {
> -    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
>      SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
> =20
>      /* some version guests do not wait for completion of a device
> @@ -1661,7 +1657,7 @@ static void spapr_pci_unplug(HotplugHandler *plug_h=
andler,
>       */
>      pci_device_reset(PCI_DEVICE(plugged_dev));
> =20
> -    if (pc->is_bridge) {
> +    if (IS_PCI_BRIDGE(plugged_dev)) {
>          spapr_pci_bridge_unplug(phb, PCI_BRIDGE(plugged_dev));
>          return;
>      }
> @@ -1686,7 +1682,6 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
>      g_assert(drc->dev =3D=3D plugged_dev);
> =20
>      if (!spapr_drc_unplug_requested(drc)) {
> -        PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
>          uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
>          SpaprDrc *func_drc;
>          SpaprDrcClass *func_drck;
> @@ -1694,7 +1689,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
>          int i;
>          uint8_t chassis =3D chassis_from_bus(pci_get_bus(pdev));
> =20
> -        if (pc->is_bridge) {
> +        if (IS_PCI_BRIDGE(plugged_dev)) {
>              error_setg(errp, "PCI: Hot unplug of PCI bridges not support=
ed");
>              return;
>          }

