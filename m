Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ABCD6D221
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:44:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWEIM-0006EW-0D; Thu, 18 Dec 2025 08:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWEIH-0006DD-I0
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWEIC-0006MX-SO
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766065424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hnm/Q5APpwGI4EN9d81xpwBKHIVDaJBAyxjHvreVfHU=;
 b=VMN3Bh1EfTN6oxaP87DbImkPfCWHyNANyAa5ijxn9xCIx1cBs6EmbLdqdjC/SijkRNY7pP
 iGU2nTChmMvq2quT+xvkwj2xUF48CE9LaUZaO0pkztcQULbCvOUUD5VlFZbhfs2WiuqtU2
 9We8iBqk57Upv0pMCJ6dCw1RzMGE4Sc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-4XOHIoFxPvaozGEkG5184A-1; Thu, 18 Dec 2025 08:43:41 -0500
X-MC-Unique: 4XOHIoFxPvaozGEkG5184A-1
X-Mimecast-MFC-AGG-ID: 4XOHIoFxPvaozGEkG5184A_1766065420
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477563a0c75so4170275e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766065420; x=1766670220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hnm/Q5APpwGI4EN9d81xpwBKHIVDaJBAyxjHvreVfHU=;
 b=reJzIOcJdY3iloKv/XAIkbSGBMOSd/aDcBuHZy/ys4r16XOrEK0pVDiCHSB/HUk82x
 6W3S/txsItorrlUasD6op22vielePGESJZ15I6Nyjm1hntiDhT9DfMxozZGHjEJPyN60
 CxAgYR6bZSnQ8wsZ/JP5UFFt08J22bddilzL2UJCWV+mb/lzvHdQDFz89eWAXcXOEY9c
 Jfn0/BUDDEGHEvj2BjD19qlG/SG+YpbvdCNcecK7f8hIJpRDgnP3PEEFA2Mdv0YbU2Ev
 vHBcA3i4J30XhKIiSBaAFPpN9Q6jow0KuHOa5Sdjyc3qmkYMOx+C5J8XZUR3foiYT1H2
 4G9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2sk3+xFtNfTvSMflh2wMAkljleYOcaKuhzbkIrygNa464LGO/ye97SP9ieGyeMSgTcRzV6HuqZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz9+1fhHGUUkqjHIPhUkMI+ltjgNuVwxV7ybEmtVOwEP8zkMoF4
 IvHMCojpHqr3FugdHlXfvj5QMzgW4Clspa4Y7J+YJtK3uqF+QVHyuB7fDCzguekuY//j9akXJgc
 kXh8gqAwbfEGieUk70VjzBG6H6tQsGO2x8BHmNaMEtfbdlZ9JcBbpxg==
X-Gm-Gg: AY/fxX4YEJ0IsB3NfJtQkbhnKBf2RClzhHdpueMOb2zqUrczdXfpe9N0DLQZoklYp4A
 VQy3IO/ofoTIAtvLTyrjK6YpnHh4rfivAJbMp4k4hSFjTJH1ICdM5Zjvss2I2ZvujHcR419pKqD
 vdAZLUXalIhrSXvPLlpkQ5dfWZNLY0t5Lo3fvtmma2+fi3Gg19xt7Lga5w1Q5b73/6tDsE/phkx
 rgJ3m6W+GH5XY/SiA1RwjOVmMqQOGoQ6UXNGjIRlg85q02UATpHjYWHcFA2KeWiTuAot/znnmM4
 aSHb+KHaLTalSr3MQnzK2FjOAoPBiSvqAmZtgsYA0cQHMKq1Yc9/sseed+t0cVkxr3fX4g==
X-Received: by 2002:a05:600c:34c3:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-47a8f8c47c2mr242773725e9.12.1766065420091; 
 Thu, 18 Dec 2025 05:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnuoYyOC7iv0lUxnK/Tn9C/mTvEX+0TSPaAZ1QvvRD1VwB+sDBVdYmFcJzvP15/PNtcrASqA==
X-Received: by 2002:a05:600c:34c3:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-47a8f8c47c2mr242773255e9.12.1766065419688; 
 Thu, 18 Dec 2025 05:43:39 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a9687dsm15060665e9.3.2025.12.18.05.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:43:39 -0800 (PST)
Date: Thu, 18 Dec 2025 14:43:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org, devel@lists.libvirt.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, Eduardo
 Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai
 Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>, Mark
 Cave-Ayland <mark.caveayland@nutanix.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>, Jiri Denemark
 <jdenemar@redhat.com>
Subject: Re: [PATCH v5 20/28] hw/virtio/virtio-mmio: Remove
 VirtIOMMIOProxy::format_transport_address field
Message-ID: <20251218144337.77dcf630@imammedo>
In-Reply-To: <20251202162835.3227894-21-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-21-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8b-VA--AFn51g5pomNFal22tHM73y-pR7V7Mgb5Oog0_1766065420
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed,  3 Dec 2025 00:28:27 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> The VirtIOMMIOProxy::format_transport_address boolean was only set
> in the hw_compat_2_6[] array, via the 'format_transport_address=3Doff'
> property. We removed all machines using that array, lets remove
> that property, simplifying virtio_mmio_bus_get_dev_path().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/virtio/virtio-mmio.c         | 15 ---------------
>  include/hw/virtio/virtio-mmio.h |  1 -
>  2 files changed, 16 deletions(-)
>=20
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index c05c00bcd4a7..c779836201d5 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -764,8 +764,6 @@ static void virtio_mmio_pre_plugged(DeviceState *d, E=
rror **errp)
>  /* virtio-mmio device */
> =20
>  static const Property virtio_mmio_properties[] =3D {
> -    DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
> -                     format_transport_address, true),
>      DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
>      DEFINE_PROP_BIT("ioeventfd", VirtIOMMIOProxy, flags,
>                      VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT, true),
> @@ -827,19 +825,6 @@ static char *virtio_mmio_bus_get_dev_path(DeviceStat=
e *dev)
>      virtio_mmio_proxy =3D VIRTIO_MMIO(virtio_mmio_bus->parent);
>      proxy_path =3D qdev_get_dev_path(DEVICE(virtio_mmio_proxy));
> =20
> -    /*
> -     * If @format_transport_address is false, then we just perform the s=
ame as
> -     * virtio_bus_get_dev_path(): we delegate the address formatting for=
 the
> -     * device on the virtio-mmio bus to the bus that the virtio-mmio pro=
xy
> -     * (i.e., the device that implements the virtio-mmio bus) resides on=
. In
> -     * this case the base address of the virtio-mmio transport will be
> -     * invisible.
> -     */
> -    if (!virtio_mmio_proxy->format_transport_address) {
> -        return proxy_path;
> -    }
> -
> -    /* Otherwise, we append the base address of the transport. */
>      section =3D memory_region_find(&virtio_mmio_proxy->iomem, 0, 0x200);
>      assert(section.mr);
> =20
> diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-m=
mio.h
> index aa492620228d..8b19ec2291ac 100644
> --- a/include/hw/virtio/virtio-mmio.h
> +++ b/include/hw/virtio/virtio-mmio.h
> @@ -66,7 +66,6 @@ struct VirtIOMMIOProxy {
>      uint32_t guest_page_shift;
>      /* virtio-bus */
>      VirtioBusState bus;
> -    bool format_transport_address;
>      /* Fields only used for non-legacy (v2) devices */
>      uint32_t guest_features[2];
>      VirtIOMMIOQueue vqs[VIRTIO_QUEUE_MAX];


