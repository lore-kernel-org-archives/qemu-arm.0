Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00137C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 19:41:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEBo-0000yy-7z; Tue, 08 Jul 2025 15:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZBMA-0005sV-Lu
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 12:40:28 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZBLJ-0007b4-Be
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 12:39:24 -0400
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so42687235e9.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751992377; x=1752597177; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQg1U2+XoupD+/uBBR/2LcQOzOJ+N0JH7NogmEfGDEc=;
 b=v690ILRBBHF38CJq5hPB5ZJqVk9YY2RRtiJsxt+B5xXenIUUYSVboFR9gocnMqz4Sh
 QSuAuRehIM33YGy+pkpRlLlGdy4punh+wJdSDKwGexh62Grb+pN77MhsJQlIndC1Pxsv
 I1P8kQJxs6TWJ0tPJwuoERtHV7sTilgJnE317PpsabNq89efeRrazBP4Xzs/756ZQN9y
 AuIs1acyeYZibHhbXym0jk4YBL8cwhZ42tiWa0pwI4Zpg/tc3S5t7v0MMCnEpNFs4AEr
 MDKrHcZ9hvogVfgruuN86RQyd2+iJSsa26gCzxZKMgyqWvtgTnD486GujLeX+GtCQ56d
 2rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751992377; x=1752597177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQg1U2+XoupD+/uBBR/2LcQOzOJ+N0JH7NogmEfGDEc=;
 b=Y4befiSEzo6HshSD3sY63QnmW8iCevlcvhHSbszN/PPAvYrdSFzftuiGpPpgEJK6A3
 nTJJvL7ddDsdz5xgyVT7wVATmZuHIdX0LJtgNQMeYlUuLWG5ixnJpregs7pxAEjPkRnU
 2qjqLxZ/xJhp+ey3P+9ofW/1O/8L4yw89AqTC69xbEAhvNe7BzQp8e6tLFYbhhH4eIG7
 BLqiQSDP4pJYWVRn5YY+7VOcFeynApNEYMUPlIbBEARk/fOIyZz11qYWzqvKdyUT1b6P
 ek6WMI5jcox2lP+QMfvAii0jtaFn30x+jHV10CHLmQJFJQDqyRQzURKhSfUUxDug4jPl
 069g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoHpFeQ5RJgJugfRFJGScXTnjuA9M7rjALNQ3VUJDjuswIIB+cuQZQPmnnMfNp02v1ORvW3w+bwg==@nongnu.org
X-Gm-Message-State: AOJu0Yz+EtSA9aRWlPxt1y1h38WntRSLk6QTdakLEEuyBkVfT13SbKty
 221hnKU1aXm6uQVcZhaVTjUy0FrpwnNGK6bPfmD2GQnKg69l3CD1yltGQBvvxr2udW+PlhdGhvJ
 zEwOJ07qz5zpYPvE2DfUZfSezwjg8Fhou39O7je5fuZ+QiO2v4aw6i6qbVg==
X-Gm-Gg: ASbGncsayPUoGv8/c4J1tpUMFliwLEAWLPmdb3XJI9x1oy/R2qrWMqh0eLB8FBk4mUa
 8nMAIXL2/AB+7W/6lAp7y7AGLLh5Cuamot5P1h/TIxJOU5x+szJNcDPR2/UZZTladR7Rz1Gu5JO
 N6e1fyurt9LHeY6VLKMUOEt8viY9qWUiIqqaMBi19N8ps=
X-Google-Smtp-Source: AGHT+IFburVw1hizbvDQxzPtEKA3nIQ0IPJ+hY3ga2jm7Z6oOpeaBfxiuSgcvxj26gViSd07j+qiqF33I8IeE4IO2NU=
X-Received: by 2002:a05:6402:50ce:b0:607:f431:33f8 with SMTP id
 4fb4d7f45d1cf-60fd6d90e62mr13233911a12.24.1751978888019; Tue, 08 Jul 2025
 05:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707172009.3884-10-philmd@linaro.org>
 <64700490-e94b-405e-92cf-2ffc25537aea@linaro.org>
In-Reply-To: <64700490-e94b-405e-92cf-2ffc25537aea@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 8 Jul 2025 15:47:41 +0300
X-Gm-Features: Ac12FXw5KF01xgndAvFeGd4-CQpBdvD1kuXl_DZa5g30WQyZgUwgRlY7_b-Qf9k
Message-ID: <CAAjaMXZjFjDp6aSRVmJ4kZ_a13Hyg579nM743D0XatQoYR9cFg@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v6 09/14] hw/virtio: Build various files once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.46;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-f46.google.com
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

On Tue, Jul 8, 2025 at 1:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> (Forgot to Cc Manos)
>
> On 7/7/25 19:20, Philippe Mathieu-Daud=C3=A9 wrote:
> > Now than various VirtIO files don't use target specific
> > API anymore, we can move them to the system_ss[] source
> > set to build them once.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   hw/virtio/virtio-config-io.c |  1 -
> >   hw/block/meson.build         |  6 ++++--
> >   hw/virtio/meson.build        | 20 +++++++++++---------
> >   3 files changed, 15 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.=
c
> > index ad78e0b9bc5..f58d90b6e31 100644
> > --- a/hw/virtio/virtio-config-io.c
> > +++ b/hw/virtio/virtio-config-io.c
> > @@ -11,7 +11,6 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "hw/virtio/virtio.h"
> > -#include "cpu.h"
> >
> >   uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
> >   {
> > diff --git a/hw/block/meson.build b/hw/block/meson.build
> > index 655704471a5..43ed296cf47 100644
> > --- a/hw/block/meson.build
> > +++ b/hw/block/meson.build
> > @@ -13,7 +13,9 @@ system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: fil=
es('m25p80_sfdp.c'))
> >   system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
> >   system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> >
> > -specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.=
c', 'virtio-blk-common.c'))
> > -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-u=
ser-blk.c', 'virtio-blk-common.c'))
> > +specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.=
c'))
> > +system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk-co=
mmon.c'))
> > +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-u=
ser-blk.c'))
> > +system_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('virtio-bl=
k-common.c'))
> >
> >   subdir('dataplane')
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 164f6fd995a..3ea7b3cec83 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -1,6 +1,7 @@
> >   system_virtio_ss =3D ss.source_set()
> >   system_virtio_ss.add(files('virtio-bus.c'))
> >   system_virtio_ss.add(files('iothread-vq-mapping.c'))
> > +system_virtio_ss.add(files('virtio-config-io.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virti=
o-pci.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virt=
io-mmio.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('vi=
rtio-crypto.c'))
> > @@ -10,11 +11,11 @@ system_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV',=
 if_true: files('vdpa-dev.c')
> >
> >   specific_virtio_ss =3D ss.source_set()
> >   specific_virtio_ss.add(files('virtio.c'))
> > -specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
> > +specific_virtio_ss.add(files('virtio-qmp.c'))
> >
> >   if have_vhost
> >     system_virtio_ss.add(files('vhost.c'))
> > -  specific_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c')=
)
> > +  system_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
> >     if have_vhost_user
> >       # fixme - this really should be generic
> >       specific_virtio_ss.add(files('vhost-user.c'))
> > @@ -43,22 +44,22 @@ if have_vhost
> >     endif
> >     if have_vhost_vdpa
> >       system_virtio_ss.add(files('vhost-vdpa.c'))
> > -    specific_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
> > +    system_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
> >     endif
> >   else
> >     system_virtio_ss.add(files('vhost-stub.c'))
> >   endif
> > +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('=
vhost-user-vsock.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio=
-rng.c'))
> >
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files(=
'virtio-balloon.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('=
vhost-user-fs.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('vi=
rtio-pmem.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vh=
ost-vsock.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files=
('vhost-user-vsock.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virt=
io-rng.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('vir=
tio-nsm.c', 'cbor-helpers.c'), libcbor])
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('vir=
tio-mem.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files(=
'vhost-user-scmi.c'))
> > -specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_=
SCMI'], if_true: files('vhost-user-scmi-pci.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: files('virtio=
-nsm.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('cbor-=
helpers.c'), libcbor])
> > +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('v=
host-user-scmi.c'))
> >
> >   virtio_pci_ss =3D ss.source_set()
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-v=
sock-pci.c'))
> > @@ -67,6 +68,7 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_t=
rue: files('vhost-user-blk-
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vho=
st-user-scsi-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-sc=
si-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost=
-user-fs-pci.c'))
> > +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhos=
t-user-scmi-pci.c'))
> >
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virti=
o-crypto-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('v=
irtio-input-host-pci.c'))
> > @@ -85,7 +87,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true:=
 files('virtio-mem-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa=
-dev-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md=
-pci.c'))
> >
> > -specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_=
pci_ss)
> > +system_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pc=
i_ss)
> >
> >   system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: system_virtio_ss)
> >   system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
>

