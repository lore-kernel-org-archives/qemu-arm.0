Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2D606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAmfb46A
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMk5R-0001GY-42; Fri, 30 Oct 2026 06:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMk5H-0001En-QV
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 06:43:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMk5F-0007Gz-Tg
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 06:43:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c445c95d553so67515466b.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 03:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357020; cv=none;
 d=google.com; s=arc-20260327;
 b=jUnmQYXfwSn3v37rpTX7N0dCkBieJarrA3FoohUVUz3An7WHaztTB2l3uiQC4+6DJP
 nUPt0ug8fbcYT4DVC75yFlta2GUz/wZfEbpT8nGhYnnNYpNyLr36OAuxe1714GDfQq0g
 uZMf63iJ+GhxTjW5n6zIM9jzMV2OY0K8Gseiglch5GFm/AnwG8FeOTLDTd+psEZSXM9W
 TRzGFLjexoSv7ht3asvs9AS1fxTBUS0tK2V01jd8G9ZecQGwH3s9DM/Yx5a7umpI2BLa
 yG8yk5wNlpUJKPBhuOQbQEf7EO4JhTXdq+X8RW+5Bn9SGSVIzWF6B1z13tgxVloxy3wF
 Y3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=f5rI0BWT3n0kBoLerRp5ox5Uq/BHcuPSAQy/GKv1oWc=;
 fh=8g9bs7yuWkOyGQJVg+nj5GF6pm2wi2hWqx7YS4EipKs=;
 b=HtTWDZCuwwUZSvygDwcDLPfNnl8eQm9+dOfKRs5xQZuY6Ec084j7LUJVapcXJLAoGA
 Duz+fr/tHu02KUk0fSxHlIED5mRKkaAJa2UQQ3LHbFPlFE2sosYphKYXz4z3Degyogde
 nuPoEJm6adKnKVK317lxmu1l5r5ekEle4PhoWZslN0FZi+o3r+jt/md9d0uIrmVyVezc
 k2JHDeW5lUiYzkEqhQHDiYjkgNbbXpo1nUsarVgfywwQwHZ2YlQaBurI6m1csw4owIWE
 prt4B1to9ZyyMAZK1frpUFouJ6zizSJE8RRKKx6SK374/cL/g4Hole9ZKwOPBCru9C6G
 ufGw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793357020; x=1793961820; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f5rI0BWT3n0kBoLerRp5ox5Uq/BHcuPSAQy/GKv1oWc=;
 b=aAmfb46Avo9Xv4LJuW+T9zxOPGacmkZWrnoprTQQUfHQaArV+PQH1pfkqucbUVCoi/
 eL1y/Y3FVWY8AhidUd15VP/t57EnvPpxMxgsL00oC2ZRdPzfnt9FuyjTfwUOtf1NLfiz
 ZFVLxFyz5LSk2z0K1egwR980j9YXSE3pTnrhu4XMrQ9JSMx6CALmulykmD9Mfv/gkErQ
 LuIwrdWsUEnkr1Rv4esiJ47roiK+s9hXSxPL1X8M3iKsXv83seFosjD+qEqb62bXEJdB
 NfkApm+0/A4sVLo6EVUV+c1ukfeafqQBsgI/ZNDMEQLTDhzLlpbxtJo2RAzsRq6bnrKM
 +3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793357020; x=1793961820;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f5rI0BWT3n0kBoLerRp5ox5Uq/BHcuPSAQy/GKv1oWc=;
 b=0d6sKnVwJKV+QIxVqxBeoqT10YaiNrFAtL0JqIJaoU14y14FRKInpXCN35qW66sUq0
 5m3SHd5oTMJCSnK+DX/onc473pmjv8pqLlWXFVPQ9RKnqyMWtLiSDSFMeF/LMq+QWlZ7
 tuGBbxRqHQcdFv+73EwJ0UiXbYd6T2+zz0C5QIdaqphCz2Cc7RZBSgv8pQV4ZhvYscZa
 CNzMXZjksruNSGSmq7TmHyjI1QXKGUV+9LIeO81sZ0Q+o5y2mUYG/TrKCJ+8JE88CQAy
 7ehksfNFyW1oNsXs+4Nt0zz4qguJeJF9CtpUwwLeMksrZhxLq3IMIzzyHlK+TgbFi9RN
 Slcw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxa97CxTuVuhTjSx2efMnyPBfOfPBE6fRD/Ok6oC7T7rhVFZ9F+0QMGImx5F6c1iVrvfMGEh5ljA==@nongnu.org
X-Gm-Message-State: AFq9FYL2I3XjNTiDs6eudroVgt7eu+qwkwZP2ZhyZljqtTGcjnlzcg9U
 o12pXZRJc1qEQsD7zy6zGMbw86q03Ye9RwluwxOZTp580wYrd3rUsAqwfVaWsErNcFLndjYSshW
 e0LccQivJOGHAoY4XXaKM9Hjg9SwK4No=
X-Gm-Gg: AYBFou3Ac8XW4nMttV8mOzMWwoQU4RZTqDnuL3WHoe/bm1Ahw//bnmuG5PIz/sCIipI
 QWy7vEiRZkxrs+zu4G3bLH0r5iNSMuntK3JsHFHeaBmsj5698BWi+9QGcIqoA1+grTqY7EBeZ/P
 6Jg/+luXeWNU0B2E0W5HL49JMOwc05tBsEAf5P8GP/YrFmOOxRB5hTHTMmsyEY4jkdbFgN+bDNk
 KV++S04EV+24KZPoHsttzzpYWul5JqtLhHHvaQlaMHykLBLa3HIz/AVyxEicPiFV6PNmADo9yW8
 ATePYA+m9ojAW26Iv9mL8O7jDT4HN+q//6jkctp8FXb24OaO63LoVl8MRWphXxZtxWYm2xKe++K
 pyyTgTxJj+m0C6GLqMGE3xzhY8NYX7lOYQ7Mb
X-Received: by 2002:a17:907:9c06:b0:c42:24ea:3220 with SMTP id
 a640c23a62f3a-c4ca7ab31cdmr162391166b.31.1793357019729; Fri, 30 Oct 2026
 03:43:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-12-luoyonggang@gmail.com>
 <18efc198-f211-4219-b6c9-9ff34dc94e3b@oss.qualcomm.com>
In-Reply-To: <18efc198-f211-4219-b6c9-9ff34dc94e3b@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 30 Oct 2026 18:43:27 +0800
X-Gm-Features: AclHuK8NPPc7G1Oyy6cxQR2ulef7CuHQzbqrz5yJ5GvRKpKZ610h41x4_9C0_Us
Message-ID: <CAE2XoE8iRfxXyTRb3X2Nmchw-RbnzrRf_megBhw1KqS9OxmujA@mail.gmail.com>
Subject: Re: [PATCH 11/12] hw/virtio/virtio-mem: register legacy-guest variant
 with is_available
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 4:57=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> > virtio-mem decided in class_init and realize whether x86 guests can
> > leave unplugged memory accessible. Register a second virtio-mem type
> > that adds virtio_mem_legacy_guests_properties and sets
> > VirtIOMEMClass.has_legacy_guests. Select the two with
> > target_base_i386() and target_not_base_i386().
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  hw/virtio/virtio-mem.c         | 47 +++++++++++++++++++---------------
> >  include/hw/virtio/virtio-mem.h |  2 ++
> >  2 files changed, 29 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index 7130ed852d9..bf241a3112b 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -15,6 +15,7 @@
> >  #include "qemu/cutils.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/units.h"
> > +#include "qemu/target-info.h"
> >  #include "qemu/target-info-qapi.h"
> >  #include "system/memory.h"
> >  #include "system/numa.h"
> > @@ -35,22 +36,6 @@
> >
> >  static const VMStateDescription vmstate_virtio_mem_device_early;
> >
> > -static bool virtio_mem_has_legacy_guests(void)
> > -{
> > -    /*
> > -     * We only had legacy x86 guests that did not support
> > -     * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have
> > -     * legacy guests.
> > -     */
> > -    switch (target_arch()) {
> > -    case SYS_EMU_TARGET_I386:
> > -    case SYS_EMU_TARGET_X86_64:
> > -        return true;
> > -    default:
> > -        return false;
> > -    }
> > -}
> > -
> >  /*
> >   * Let's not allow blocks smaller than 1 MiB, for example, to keep the=
 tracking
> >   * bitmap small.
> > @@ -859,7 +844,7 @@ static void virtio_mem_device_realize(DeviceState *=
dev, Error **errp)
> >      rb =3D vmem->memdev->mr.ram_block;
> >      page_size =3D qemu_ram_pagesize(rb);
> >
> > -    if (virtio_mem_has_legacy_guests()) {
> > +    if (VIRTIO_MEM_GET_CLASS(vmem)->has_legacy_guests) {
> >          switch (vmem->unplugged_inaccessible) {
> >          case ON_OFF_AUTO_AUTO:
> >              if (virtio_mem_has_shared_zeropage(rb)) {
> > @@ -1635,9 +1620,6 @@ static void virtio_mem_class_init(ObjectClass *kl=
ass, const void *data)
> >      RamDiscardSourceClass *rdsc =3D RAM_DISCARD_SOURCE_CLASS(klass);
> >
> >      device_class_set_props(dc, virtio_mem_properties);
> > -    if (virtio_mem_has_legacy_guests()) {
> > -        device_class_set_props(dc, virtio_mem_legacy_guests_properties=
);
> > -    }
> >      dc->vmsd =3D &vmstate_virtio_mem;
> >
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > @@ -1660,6 +1642,14 @@ static void virtio_mem_class_init(ObjectClass *k=
lass, const void *data)
> >      rdsc->is_populated =3D virtio_mem_rds_is_populated;
> >  }
> >
> > +static void virtio_mem_legacy_class_init(ObjectClass *klass, const voi=
d *data)
> > +{
> > +    virtio_mem_class_init(klass, data);
> > +    device_class_set_props(DEVICE_CLASS(klass),
> > +                           virtio_mem_legacy_guests_properties);
> > +    VIRTIO_MEM_CLASS(klass)->has_legacy_guests =3D true;
> > +}
> > +
> >  static const TypeInfo virtio_mem_info =3D {
> >      .name =3D TYPE_VIRTIO_MEM,
> >      .parent =3D TYPE_VIRTIO_DEVICE,
> > @@ -1668,6 +1658,22 @@ static const TypeInfo virtio_mem_info =3D {
> >      .instance_finalize =3D virtio_mem_instance_finalize,
> >      .class_init =3D virtio_mem_class_init,
> >      .class_size =3D sizeof(VirtIOMEMClass),
> > +    .is_available =3D target_not_base_i386,
> > +    .interfaces =3D (const InterfaceInfo[]) {
> > +        { TYPE_RAM_DISCARD_SOURCE },
> > +        { }
> > +    },
> > +};
> > +
> > +static const TypeInfo virtio_mem_legacy_info =3D {
> > +    .name =3D TYPE_VIRTIO_MEM,
> > +    .parent =3D TYPE_VIRTIO_DEVICE,
> > +    .instance_size =3D sizeof(VirtIOMEM),
> > +    .instance_init =3D virtio_mem_instance_init,
> > +    .instance_finalize =3D virtio_mem_instance_finalize,
> > +    .class_init =3D virtio_mem_legacy_class_init,
> > +    .class_size =3D sizeof(VirtIOMEMClass),
> > +    .is_available =3D target_base_i386,
> >      .interfaces =3D (const InterfaceInfo[]) {
> >          { TYPE_RAM_DISCARD_SOURCE },
> >          { }
> > @@ -1677,6 +1683,7 @@ static const TypeInfo virtio_mem_info =3D {
> >  static void virtio_register_types(void)
> >  {
> >      type_register_static(&virtio_mem_info);
> > +    type_register_static(&virtio_mem_legacy_info);
> >  }
> >
> >  type_init(virtio_register_types)
> > diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-=
mem.h
> > index 5d1d19c6bec..f367959ecb0 100644
> > --- a/include/hw/virtio/virtio-mem.h
> > +++ b/include/hw/virtio/virtio-mem.h
> > @@ -134,6 +134,8 @@ struct VirtIOMEMClass {
> >      VirtioDeviceClass parent_class;
> >
> >      /* public */
> > +    bool has_legacy_guests;
> > +
> >      void (*fill_device_info)(const VirtIOMEM *vmen, VirtioMEMDeviceInf=
o *vi);
> >      MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
> >      void (*decide_memslots)(VirtIOMEM *vmem, unsigned int limit);
>
> Fine for me, let's see what virtio maintainers think about it.

Ping it, also the V2 version is ready, may I send it now?

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

