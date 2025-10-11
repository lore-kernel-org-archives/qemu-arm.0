Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FE7CCD184
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 12:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7ZAN-0000Vg-Cc; Sat, 11 Oct 2025 08:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1v7Ubg-0005iY-9o
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1v7UbW-0003S3-Ha
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760169921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2LjMu1SmBW0Il/Ad5mkR+kmEwLtrYj43T8cQppTZxI=;
 b=FFck6Wz8uBu1X/d9FUXHjt8/zkPhD5Ccfmtv/2aFcT2MhzH7SnfBK4NP5wAB7Cor9iff3u
 WYtZpKY5bWjfsYdwr1Q+St+GMS7FxuT1r7I4NYDROLimHTZJY8oescyTr6z4af2EFrdK9l
 unVH5Ll62gDPO6dAsT0ejPNbMzWL3Ss=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-_CELid_cMKy94M2gnXj6Tw-1; Sat, 11 Oct 2025 04:05:19 -0400
X-MC-Unique: _CELid_cMKy94M2gnXj6Tw-1
X-Mimecast-MFC-AGG-ID: _CELid_cMKy94M2gnXj6Tw_1760169918
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b3d525fb67eso309449066b.0
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760169918; x=1760774718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2LjMu1SmBW0Il/Ad5mkR+kmEwLtrYj43T8cQppTZxI=;
 b=gTbuDFUtBgT+IV2stT0PAUCog0fVWQeZ6CX7A+iiC8P8Fit9Ax+UbLiKDRr89CtxSv
 kjBhFV9iTSCeWmHCTAneGPvgScFsI8ulKua8gayQ9NcxWikguoX30oNXKFWBj9qrf+ty
 pj0Ko40ORg+9Zch3+n0120fNMUcQKTJ8L6/L5WXY2EWp9vhTyASkqA88n2UFDlJcyyhf
 PHNckG5cnmSQIiR0jVkgnomRKxwt0dkQCtD0NJBwqBNqsT0lKi/NVaZRO4M0qbuMLE0u
 2CJPOqOefj33msL2RyMQC5iFGXpVR44/Oxrgcralo9cL3GpxyCxWMflHzxxVxxncHdpv
 B37Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPtVzfRrhs7PzK//jI/JtMZJr+H71wWlWGDj5BjTnWYH+K/FssH3zAledfMzpxeQKAI0+yPIPvQg==@nongnu.org
X-Gm-Message-State: AOJu0YxdF0HxUETAjubR8LqVJ+9yxUizzdAEE/8kemHYLqzk5o9cpXCI
 Q85vbjuwgJPmucHULkfcEJ08mCMB1UxVN3J7iiGqwBFat7zX8tgqYpS3rzFEKFSWTFCy9Xqj8ht
 C6T17f8EGzJmSHDy/gfLGdfs39QKS+R479YFXF2Aj3anAAnUs81N3soLpkVYx+A/XmK1hW0Z2vG
 jRXyoZ6nowp/dqpEA0TG2wf/CsORCF
X-Gm-Gg: ASbGncvLuQ1hk6Rl7c/EbDhjApugLxfEUErxnZpNgVAtNEI5EXz8P7nGa1Gul5tHg+L
 cmojlz65wxIpx3mRz9aD/MfTo859G4A9Yl0StP686bTL9viqQyOUcZNl9n8p9Iae58nLjkzV/B/
 rjs4GLC0IAWxSxNevdQRuxLA==
X-Received: by 2002:a17:907:7ea6:b0:b3f:a16d:da7b with SMTP id
 a640c23a62f3a-b50aa393bf8mr1491208566b.8.1760169918177; 
 Sat, 11 Oct 2025 01:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE3DyyiMDaaMTBg3JoQbRijruVINFfLcc173mHEsJip29dDI1C5WEjLBpdu++FotS9yq9T+mFf4vy6pyxKH1c=
X-Received: by 2002:a17:907:7ea6:b0:b3f:a16d:da7b with SMTP id
 a640c23a62f3a-b50aa393bf8mr1491206166b.8.1760169917752; Sat, 11 Oct 2025
 01:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251010134226.72221-1-philmd@linaro.org>
 <20251010134226.72221-9-philmd@linaro.org>
 <781a3494-453e-47ea-ab10-48d0f5315f4f@linux.ibm.com>
In-Reply-To: <781a3494-453e-47ea-ab10-48d0f5315f4f@linux.ibm.com>
From: Lei Yang <leiyang@redhat.com>
Date: Sat, 11 Oct 2025 16:04:41 +0800
X-Gm-Features: AS18NWCycbECoPyr2kFT74R6nWLh2fUh6yKnVk1kvhSdqRWs7AAghWVGIfWo-wI
Message-ID: <CAPpAL=zqm5NqdC7Zeb0x5W-exK2TkeNJ_Qd0RWAAwFb4RZVA2g@mail.gmail.com>
Subject: Re: [PATCH 08/16] hw/virtio: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Farhan Ali <alifm@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uuerZNAZ6QUtP0dXky5Nf6LZoNj1g9JvHr8HIzSHQVw_1760169918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Oct 2025 08:57:40 -0400
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

Hi Philippe Mathieu-Daud=C3=A9

According to my test result this change introduced a minor bug, qemu
output error messages "qemu-system-x86_64: virtio-blk missing headers"
reproduced command:
/usr/local/bin/qemu-system-x86_64 -M q35 -m 8G -smp 8 -cpu host
-enable-kvm -device VGA,bus=3Dpcie.0,addr=3D0x2 -drive
file=3D///home/fedora-40.qcow2,media=3Ddisk,if=3Dvirtio -device
virtio-net-pci,mac=3D00:11:22:33:44:00,netdev=3Dnetdev1,id=3Dnet1,bus=3Dpci=
e.0,addr=3D0x7
 -netdev tap,id=3Dnetdev1,script=3D/etc/qemu-ifup,downscript=3D/etc/qemu-if=
down
-vnc :0  -monitor stdio
QEMU 10.1.50 monitor - type 'help' for more information
(qemu) qemu-system-x86_64: virtio-blk missing headers

Thanks
Lei

On Sat, Oct 11, 2025 at 3:25=E2=80=AFAM Farhan Ali <alifm@linux.ibm.com> wr=
ote:
>
>
> On 10/10/2025 6:42 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Replace compile-time #ifdef with a runtime check to ensure all code
> > paths are built and tested. This reduces build-time configuration
> > complexity and improves maintainability.
> >
> > No functional change intended.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   include/hw/virtio/virtio-access.h | 6 +-----
> >   hw/virtio/vhost.c                 | 7 +++----
> >   2 files changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virt=
io-access.h
> > index 07aae69042a..80328912ad3 100644
> > --- a/include/hw/virtio/virtio-access.h
> > +++ b/include/hw/virtio/virtio-access.h
> > @@ -149,11 +149,7 @@ static inline uint64_t virtio_ldq_p(VirtIODevice *=
vdev, const void *ptr)
> >
> >   static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
> >   {
> > -#if HOST_BIG_ENDIAN
> > -    return virtio_access_is_big_endian(vdev) ? s : bswap16(s);
> > -#else
> > -    return virtio_access_is_big_endian(vdev) ? bswap16(s) : s;
> > -#endif
> > +    return HOST_BIG_ENDIAN ^ virtio_access_is_big_endian(vdev) ? s : b=
swap16(s);
>
> This patch breaks virtio devices(at least input/net devices) on s390x. I
> am not sure if ^ is the right check here? Changing the logic back to how
> it was fixes it for me.
>
> Thanks
>
> Farhan
>
> >   }
> >
> >   static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 266a11514a1..6343477b42f 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1168,11 +1168,10 @@ static inline bool vhost_needs_vring_endian(Vir=
tIODevice *vdev)
> >       if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> >           return false;
> >       }
> > -#if HOST_BIG_ENDIAN
> > -    return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_LITTLE;
> > -#else
> > +    if (HOST_BIG_ENDIAN) {
> > +        return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_LITTLE;
> > +    }
> >       return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_BIG;
> > -#endif
> >   }
> >
> >   static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *=
dev,
>


