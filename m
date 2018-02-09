Received: by 10.28.71.27 with SMTP id u27csp1083135wma;
        Fri, 9 Feb 2018 07:51:37 -0800 (PST)
X-Google-Smtp-Source: AH8x224LCUe9pYugIaS8D79K1KScs0gXIjULje9PEcKGAWUjdZXadvnez8iLVV2O9lPszgJVoqXK
X-Received: by 10.129.240.16 with SMTP id p16mr2218609ywm.210.1518191497001;
        Fri, 09 Feb 2018 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518191496; cv=none;
        d=google.com; s=arc-20160816;
        b=prmAjYReyTZjQ8N1Wq2GQrRYrbpVqVBITF7HU8/kHCN7BoJhVzr67eY9VuUsBNHq+i
         z0w96ccygRoy3Ztp897V6kjT83mbJubSjE9th2G9q2J8A0at1QpMxj8HQYnjvdNge02T
         qNqhH6MxL054T+1ZdHV0dRVqW/x0OqFO7PmvFVHsaCRnF2+AntBUovPEdyFhcyOZ0+mA
         FhMUGfLpsKFnFbECW90z4CRWHpxT8nxV2rDAL2NY+xLWBc0xcRFz7lzXFBT/+j4LIHTz
         wad2Wpp5uPZdyH7hSwrU5Y8i/7J+dfxgaGApMeAduICirOSPMIGabMQUJdd3RLG2IuKG
         lkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=HbQi3A38j8yu5fnGh1RnRGPUpUShRRPZ9rBq5lL4bxw=;
        b=cV6dSjNG5IZEfRh2dLH03Lt+6/6qzuZ/MI22S2IQj1bHv7mUaaBsz7P6XNceT9cmBM
         FwUJ57ywC6Ndyii/CJ9N4lVtU+PQWaF5wAOQ7+AK+o8fLMGXguTN2hcPoaZ6BWF1/Dod
         2nMwxS5Fa95AVUV0nrubIMt79O6imOtMRkF6ihbxvXYtvbLyjAlog27/yEXNP2EL/qp2
         Rda9rudSy/VHIy1GTLd89137Lnp9Iw1UGApo6uAZ/7sq2C4pai8AoWMLsGpaEYyucJzW
         oz+V5xnJRoR9bRERrz9WbMY4Rxim2tpVMYEUA8zKVAdOMFrnDFzL+WdS3NqRs/Av3teT
         hITw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w188si452320ywe.231.2018.02.09.07.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAxc-0000H9-CS
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ekAwi-00005t-CI
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:50:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ekAwh-00076s-8i
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:50:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1ekAwa-00074G-HO; Fri, 09 Feb 2018 10:50:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A4F4695E4;
	Fri,  9 Feb 2018 15:50:31 +0000 (UTC)
Received: from w520.home (ovpn-117-203.phx2.redhat.com [10.3.117.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97EE95D965;
	Fri,  9 Feb 2018 15:50:24 +0000 (UTC)
Date: Fri, 9 Feb 2018 08:50:24 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20180209085024.004b6f9e@w520.home>
In-Reply-To: <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Feb 2018 15:50:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wfeGZ1WV8bhp

On Fri,  9 Feb 2018 16:17:35 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
> 
> Add qemu support for the newly introduced VFIO No-IOMMU driver.
> 
> We need to add special handling for:
> - Group character device is /dev/vfio/noiommu-$GROUP.
> - No-IOMMU does not rely on a memory listener.
> - No IOMMU will be set for its group, so no need to call
>   vfio_kvm_device_add_group.
> 
> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
> [geert: Rebase]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
>  include/hw/vfio/vfio-common.h |  2 ++
>  2 files changed, 50 insertions(+), 13 deletions(-)

NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
vfio devices with no-iommu (which provide no DMA translation!!!)
transparently as if they might actually work like a regular vfio device
is absolutely unacceptable.  Without DMA translation and isolation, you
might want to think about another interface, I'm not keen on the idea
of corrupting vfio support in order to blink some LEDs.  Thanks,

Alex

> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index f895e3c3359af779..2ee94a3304202a74 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1019,6 +1019,33 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container->fd = fd;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
> +    container->noiommu = group->noiommu;
> +
> +    if (container->noiommu) {
> +        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
> +        if (ret) {
> +            error_report("vfio: failed to set group container: %m");
> +            ret = -errno;
> +            goto free_container_exit;
> +        }
> +
> +        ret = ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_NOIOMMU_IOMMU);
> +        if (!ret) {
> +            error_report("vfio: No available IOMMU models");
> +            ret = -EINVAL;
> +            goto free_container_exit;
> +        }
> +
> +        ret = ioctl(fd, VFIO_SET_IOMMU, VFIO_NOIOMMU_IOMMU);
> +        if (ret) {
> +            error_report("vfio: failed to set iommu for container: %m");
> +            ret = -errno;
> +            goto free_container_exit;
> +        }
> +
> +        goto listener_register;
> +    }
> +
>      if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
>          ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
>          bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
> @@ -1151,15 +1178,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      group->container = container;
>      QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>  
> -    container->listener = vfio_memory_listener;
> -
> -    memory_listener_register(&container->listener, container->space->as);
> -
> -    if (container->error) {
> -        ret = container->error;
> -        error_setg_errno(errp, -ret,
> -                         "memory listener initialization failed for container");
> -        goto listener_release_exit;
> +listener_register:
> +    if (!container->noiommu) {
> +        container->listener = vfio_memory_listener;
> +        memory_listener_register(&container->listener, container->space->as);
> +        if (container->error) {
> +            ret = container->error;
> +            error_setg_errno(errp, -ret,
> +                    "memory listener initialization failed for container");
> +            goto listener_release_exit;
> +        }
>      }
>  
>      container->initialized = true;
> @@ -1169,7 +1197,9 @@ listener_release_exit:
>      QLIST_REMOVE(group, container_next);
>      QLIST_REMOVE(container, next);
>      vfio_kvm_device_del_group(group);
> -    vfio_listener_release(container);
> +    if (!container->noiommu) {
> +        vfio_listener_release(container);
> +    }
>  
>  free_container_exit:
>      g_free(container);
> @@ -1195,7 +1225,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>       * since unset may destroy the backend container if it's the last
>       * group.
>       */
> -    if (QLIST_EMPTY(&container->group_list)) {
> +    if (QLIST_EMPTY(&container->group_list) && !container->noiommu) {
>          vfio_listener_release(container);
>      }
>  
> @@ -1249,8 +1279,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
>      group->fd = qemu_open(path, O_RDWR);
>      if (group->fd < 0) {
> -        error_setg_errno(errp, errno, "failed to open %s", path);
> -        goto free_group_exit;
> +        snprintf(path, sizeof(path), "/dev/vfio/noiommu-%d", groupid);
> +        group->fd = qemu_open(path, O_RDWR);
> +        if (group->fd < 0) {
> +            error_setg_errno(errp, errno, "failed to open %s", path);
> +            goto free_group_exit;
> +        }
> +        group->noiommu = 1;
>      }
>  
>      if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index f3a2ac9fee02066f..aca2e33efb9b118c 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -77,6 +77,7 @@ struct VFIOGroup;
>  typedef struct VFIOContainer {
>      VFIOAddressSpace *space;
>      int fd; /* /dev/vfio/vfio, empowered by the attached groups */
> +    bool noiommu;
>      MemoryListener listener;
>      MemoryListener prereg_listener;
>      unsigned iommu_type;
> @@ -136,6 +137,7 @@ struct VFIODeviceOps {
>  typedef struct VFIOGroup {
>      int fd;
>      int groupid;
> +    bool noiommu;
>      VFIOContainer *container;
>      QLIST_HEAD(, VFIODevice) device_list;
>      QLIST_ENTRY(VFIOGroup) next;

