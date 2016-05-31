Received: by 10.25.27.66 with SMTP id b63csp1937199lfb;
        Tue, 31 May 2016 02:20:53 -0700 (PDT)
X-Received: by 10.140.94.173 with SMTP id g42mr29539506qge.39.1464686453087;
        Tue, 31 May 2016 02:20:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p21si30406827qka.202.2016.05.31.02.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 02:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7fr2-0001zZ-Ar
	for alex.bennee@linaro.org; Tue, 31 May 2016 05:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1b7fqi-0001mh-T7
	for qemu-arm@nongnu.org; Tue, 31 May 2016 05:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1b7fqW-0006HU-Dw
	for qemu-arm@nongnu.org; Tue, 31 May 2016 05:20:32 -0400
Received: from 16.mo6.mail-out.ovh.net ([87.98.139.208]:60829)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1b7fqW-0006Gx-4C
	for qemu-arm@nongnu.org; Tue, 31 May 2016 05:20:20 -0400
Received: from player756.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3D326FFCCE0
	for <qemu-arm@nongnu.org>; Tue, 31 May 2016 11:20:17 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player756.ha.ovh.net (Postfix) with ESMTPSA id 2121242009B;
	Tue, 31 May 2016 11:20:04 +0200 (CEST)
To: Greg Kurz <gkurz@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <574D5731.800@kaod.org>
Date: Tue, 31 May 2016 11:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 6291810157219253056
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrheehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.139.208
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] virtio: move bi-endian target
 support to a single location
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYUwqMbbylZ/

On 05/31/2016 10:09 AM, Greg Kurz wrote:
> Paolo's recent cpu.h cleanups broke legacy virtio for ppc64 LE guests (=
and
> arm BE guests as well, even if I have not verified that). Especially, c=
ommit
> "33c11879fd42 qemu-common: push cpu.h inclusion out of qemu-common.h" h=
as
> the side-effect of silently hiding the TARGET_IS_BIENDIAN macro from th=
e
> virtio memory accessors, and thus fully disabling support of endian cha=
nging
> targets.
>=20
> To be sure this cannot happen again, let's gather all the bi-endian bit=
s
> where they belong in include/hw/virtio/virtio-access.h.
>=20
> The changes in hw/virtio/vhost.c are safe because vhost_needs_vring_end=
ian()
> is not called on a hot path and non bi-endian targets will return false
> anyway.
>=20
> While here, also rename TARGET_IS_BIENDIAN to be more precise: it is on=
ly for
> legacy virtio and bi-endian guests.
>=20
> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>

biendian-ness being only used by virtio devices, I think this is a good p=
lace=20
where to put it.

Acked-by: C=E9dric Le Goater <clg@kaod.org>

> ---
>  hw/virtio/vhost.c                 |    4 ----
>  include/hw/virtio/virtio-access.h |    6 +++++-
>  target-arm/cpu.h                  |    2 --
>  target-ppc/cpu.h                  |    2 --
>  4 files changed, 5 insertions(+), 9 deletions(-)
>=20
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
>  }
>=20
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
>=20
> +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> +#endif
> +
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
>=20
> -#define TARGET_IS_BIENDIAN 1
> -
>  #define CPUArchState struct CPUARMState
>=20
>  #include "qemu-common.h"
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index cd33539d1ce9..556d66c39d11 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -28,8 +28,6 @@
>  #define TARGET_LONG_BITS 64
>  #define TARGET_PAGE_BITS 12
>=20
> -#define TARGET_IS_BIENDIAN 1
> -
>  /* Note that the official physical address space bits is 62-M where M
>     is implementation dependent.  I've not looked up M for the set of
>     cpus we emulate at the system level.  */
>=20
>=20

