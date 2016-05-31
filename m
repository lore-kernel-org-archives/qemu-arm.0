Received: by 10.25.27.66 with SMTP id b63csp2007407lfb;
        Tue, 31 May 2016 04:55:14 -0700 (PDT)
X-Received: by 10.140.159.20 with SMTP id f20mr31343032qhf.61.1464695714045;
        Tue, 31 May 2016 04:55:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u80si10308957qke.89.2016.05.31.04.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 04:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7iGP-0002SK-F5
	for alex.bennee@linaro.org; Tue, 31 May 2016 07:55:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b7iFa-0001vJ-2k
	for qemu-arm@nongnu.org; Tue, 31 May 2016 07:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b7iFV-0004cB-3v
	for qemu-arm@nongnu.org; Tue, 31 May 2016 07:54:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b7iFU-0004by-SU; Tue, 31 May 2016 07:54:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 387EEC00C8FF;
	Tue, 31 May 2016 11:54:16 +0000 (UTC)
Received: from [10.36.112.62] (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VBsB0L001785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 May 2016 07:54:13 -0400
To: Greg Kurz <gkurz@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
Date: Tue, 31 May 2016 13:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 31 May 2016 11:54:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N+cgieebZRTE



On 31/05/2016 10:09, Greg Kurz wrote:
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 440071815408..81cc5b0ae35c 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -767,15 +767,11 @@ static inline bool vhost_needs_vring_endian(VirtI=
ODevice *vdev)
>      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>          return false;
>      }
> -#ifdef TARGET_IS_BIENDIAN
>  #ifdef HOST_WORDS_BIGENDIAN
>      return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_LITTLE;
>  #else
>      return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_BIG;
>  #endif
> -#else
> -    return false;
> -#endif

This should be okay.

>  }
> =20
>  static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *d=
ev,
> diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virt=
io-access.h
> index 8dc84f520316..4b2803814642 100644
> --- a/include/hw/virtio/virtio-access.h
> +++ b/include/hw/virtio/virtio-access.h
> @@ -17,9 +17,13 @@
>  #include "hw/virtio/virtio.h"
>  #include "exec/address-spaces.h"
> =20
> +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> +#endif

These will only be correct if something else includes cpu.h.  Instead of
defining this, you should add

#include "cpu.h"

at the top of include/hw/virtio-access.h and leave the definitions in
target-*/cpu.h.

Thanks,

Paolo

>  static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
>  {
> -#if defined(TARGET_IS_BIENDIAN)
> +#if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>      return virtio_is_big_endian(vdev);
>  #elif defined(TARGET_WORDS_BIGENDIAN)
>      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index c741b53ad45f..60971e16f7a4 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -29,8 +29,6 @@
>  #  define TARGET_LONG_BITS 32
>  #endif
> =20
> -#define TARGET_IS_BIENDIAN 1
> -
>  #define CPUArchState struct CPUARMState
> =20
>  #include "qemu-common.h"
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index cd33539d1ce9..556d66c39d11 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -28,8 +28,6 @@
>  #define TARGET_LONG_BITS 64
>  #define TARGET_PAGE_BITS 12
> =20
> -#define TARGET_IS_BIENDIAN 1
> -
>  /* Note that the official physical address space bits is 62-M where M
>     is implementation dependent.  I've not looked up M for the set of
>     cpus we emulate at the system level.  */
>=20
