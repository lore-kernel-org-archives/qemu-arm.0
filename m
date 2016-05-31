Received: by 10.25.27.66 with SMTP id b63csp2048367lfb;
        Tue, 31 May 2016 06:10:56 -0700 (PDT)
X-Received: by 10.55.136.197 with SMTP id k188mr31958938qkd.33.1464700256772;
        Tue, 31 May 2016 06:10:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30si10853311qta.98.2016.05.31.06.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 06:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7jRg-0000Bk-5h
	for alex.bennee@linaro.org; Tue, 31 May 2016 09:10:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7jRX-0000BO-N6
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7jRU-0004Ud-EE
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:10:47 -0400
Received: from e06smtp09.uk.ibm.com ([195.75.94.105]:60280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7jRU-0004UT-2T
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:10:44 -0400
Received: from localhost
	by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Tue, 31 May 2016 14:10:42 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp09.uk.ibm.com (192.168.101.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 May 2016 14:10:34 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id AAFE61B0805F; 
	Tue, 31 May 2016 14:11:35 +0100 (BST)
Received: from d06av06.portsmouth.uk.ibm.com (d06av06.portsmouth.uk.ibm.com
	[9.149.37.217])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4VDAXs242795198; Tue, 31 May 2016 13:10:33 GMT
Received: from d06av06.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4VDAWoR009241; Tue, 31 May 2016 09:10:33 -0400
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4VDAWuG009214; Tue, 31 May 2016 09:10:32 -0400
Received: from bahia.lab.toulouse-stg.fr.ibm.com
	(icon-9-164-153-182.megacenter.de.ibm.com [9.164.153.182])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 7990E22032C;
	Tue, 31 May 2016 15:10:31 +0200 (CEST)
Date: Tue, 31 May 2016 15:10:29 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16053113-0037-0000-0000-00001129E039
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.105
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zvkVOuRCZ1r

On Tue, 31 May 2016 13:54:11 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 31/05/2016 10:09, Greg Kurz wrote:
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 440071815408..81cc5b0ae35c 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -767,15 +767,11 @@ static inline bool vhost_needs_vring_endian(VirtIODevice *vdev)
> >      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> >          return false;
> >      }
> > -#ifdef TARGET_IS_BIENDIAN
> >  #ifdef HOST_WORDS_BIGENDIAN
> >      return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_LITTLE;
> >  #else
> >      return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_BIG;
> >  #endif
> > -#else
> > -    return false;
> > -#endif  
> 
> This should be okay.
> 
> >  }
> >  
> >  static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *dev,
> > diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
> > index 8dc84f520316..4b2803814642 100644
> > --- a/include/hw/virtio/virtio-access.h
> > +++ b/include/hw/virtio/virtio-access.h
> > @@ -17,9 +17,13 @@
> >  #include "hw/virtio/virtio.h"
> >  #include "exec/address-spaces.h"
> >  
> > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> > +#endif  
> 
> These will only be correct if something else includes cpu.h.  Instead of

Unless I missed something, the TARGET_* macros come from the generated
config-target.h header, which is in turn included by qemu/osdep.h and
thus included by most of the code.

> defining this, you should add
> 
> #include "cpu.h"
> 
> at the top of include/hw/virtio-access.h and leave the definitions in
> target-*/cpu.h.
> 

All this bi-endian stuff is really an old-virtio-only thing... it is
only to be used by virtio_access_is_big_endian(). The fact that it
broke silently with your cleanup series is yet another proof that
this workaround is fragile.

Hence my tentative to put all the details in one place... would it
be ok if I include "config-target.h" to ensure we have the TARGET macros ?


> Thanks,
> 
> Paolo
> 
> >  static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> >  {
> > -#if defined(TARGET_IS_BIENDIAN)
> > +#if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> >      return virtio_is_big_endian(vdev);
> >  #elif defined(TARGET_WORDS_BIGENDIAN)
> >      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> > index c741b53ad45f..60971e16f7a4 100644~/Work/qemu/qemu-gkurz/.mbuild/bin/qemu-system-ppc64 -snapshot -machine pseries,accel=kvm -nodefaults -no-shutdown -nographic -serial mon:stdio -m 8G -device virtio-net,netdev=netdev0,mac=C0:FF:EE:00:00:66,id=net0 -netdev tap,id=netdev0,vhost=off,helper='/usr/libexec/qemu-bridge-helper --br=br0' -drive file=/home/greg/images/fedora23-ppc64-ppc64le.qcow2,id=drive0,if=virtio -fsdev local,security_model=none,id=fsdev1,path=/home/greg -device virtio-9p-pci,id=fs1,fsdev=fsdev1,mount_tag=host
> > --- a/target-arm/cpu.h
> > +++ b/target-arm/cpu.h
> > @@ -29,8 +29,6 @@
> >  #  define TARGET_LONG_BITS 32
> >  #endif
> >  
> > -#define TARGET_IS_BIENDIAN 1
> > -
> >  #define CPUArchState struct CPUARMState
> >  
> >  #include "qemu-common.h"
> > diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> > index cd33539d1ce9..556d66c39d11 100644
> > --- a/target-ppc/cpu.h
> > +++ b/target-ppc/cpu.h
> > @@ -28,8 +28,6 @@
> >  #define TARGET_LONG_BITS 64
> >  #define TARGET_PAGE_BITS 12
> >  
> > -#define TARGET_IS_BIENDIAN 1
> > -
> >  /* Note that the official physical address space bits is 62-M where M
> >     is implementation dependent.  I've not looked up M for the set of
> >     cpus we emulate at the system level.  */
> >   
> 

