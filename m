Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3123891wrt;
        Mon, 22 Oct 2018 07:39:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d/wMY079STHOlvHd77OnhARKD1lwAI1WDymXt5+frur0aEopHd8Ia3/qIri+8noccDwETB
X-Received: by 2002:a0c:c288:: with SMTP id b8mr9165741qvi.241.1540219196576;
        Mon, 22 Oct 2018 07:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540219196; cv=none;
        d=google.com; s=arc-20160816;
        b=x24Iy1xwSLGshDTg0icsorpeSPkFxE5bm4ProWmxDJxVP5tPcmiTxlFkGi9T/+AxJl
         6sruYEpkAXjsbtJTrji+l64Ja8u4fY67F/NA+fs4kAiedoKccVMThl6jDIo2qyoMJbJr
         PwMlM4b/vwDz8J9go5YG7xVgE6SBeSpX2b25uWYfo8sOjQXt2Tdnx46Aj7jVEY8zakrQ
         Qfcm4cZyMKsB62/2hYahzRKTGm2afQINhcXl1DiHen08vhOMtecL602bxwBx4kxLaTIZ
         d6+qxondWNt0pP4JI6vuLV5v/bugcn5Xfm+kxy2yKaq0UFrWHGirOcOQITjn9AQTdgz3
         lmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=VXxn65LYpvfpmpp+dZEYG4D9mxOhPoEx65e28vSL1kc=;
        b=sTGANq4GjlQHXc7sF/tA3nMM2Lhe8TgcyswdOW+lNGLWA+l/gWDLK7F4zV+acQNe0G
         sqqs3MnRDRB3WgAUlHXeHRuE71GctpTfwQWNh80bKa/PfGYXFe7IIB9B6yEU37axNOwZ
         ULRbTz1A381Qz4dOGhAn0FaEeAUGYyYcIzDdlE+uyrJ9jdn6GE0s9S/IyxyJgNi380Pi
         xzXDXZx0STWYkcMGSCfsm7XXPCvje5EX2m9dDzAKbGT0IdfWtsnhAGgl5m7gnfoCCM0a
         c54YR94TafgDmVHPTydXZe3bft2WFV9l/iGz2chCNYN3YD1Q36rZY4wc0jI2Cj5FUAyD
         IKGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si549928qte.344.2018.10.22.07.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 07:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEbN6-0001CO-2v
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 10:39:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gEbMx-0001B5-SB
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 10:39:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gEbMt-0005Hi-Pb
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 10:39:47 -0400
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:39438)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1gEbMt-00054o-HR
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 10:39:43 -0400
Received: from player711.ha.ovh.net (unknown [10.109.160.12])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 0F8151FEEB1
	for <qemu-arm@nongnu.org>; Mon, 22 Oct 2018 16:39:35 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player711.ha.ovh.net (Postfix) with ESMTPSA id 2AC0E2007C;
	Mon, 22 Oct 2018 16:39:24 +0200 (CEST)
Date: Mon, 22 Oct 2018 16:39:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181022163923.35ad7a4e@bahia.lan>
In-Reply-To: <20180921081819.9203-8-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
	<20180921081819.9203-8-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16223936185361733994
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrgedvgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.108
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 07/28] hw/vfio/common: Refactor
 container initialization
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
Cc: peter.maydell@linaro.org, yi.l.liu@intel.com, cdall@kernel.org,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ShzoJQps2uG9

On Fri, 21 Sep 2018 10:17:58 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> To prepare for testing yet another extension, let's
> refactor the code. We introduce vfio_iommu_get_type()
> helper which selects the richest API (v2 first). Then
> vfio_init_container() does the SET_CONTAINER and
> SET_IOMMU ioctl calls. So we end up with a switch/case
> on the iommu_type which should be a little bit more readable
> when introducing the NESTING extension check. Also ioctl's
> get called once per iommu_type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c | 102 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 65 insertions(+), 37 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 7c185e5a2e..53b8f773cc 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1036,12 +1036,58 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
>      }
>  }
>  
> +/*
> + * vfio_iommu_get_type - selects the richest iommu_type (v2 first)
> + * nested only is selected if requested by @force_nested

It seems the second line belongs to patch 8.

Appart from that, this definitely makes the code more readable.

Reviewed-by: Greg Kurz <groug@kaod.org>

> + */
> +static int vfio_iommu_get_type(VFIOContainer *container,
> +                               Error **errp)
> +{
> +    int fd = container->fd;
> +
> +    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
> +        return VFIO_TYPE1v2_IOMMU;
> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU)) {
> +        return VFIO_TYPE1_IOMMU;
> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
> +        return VFIO_SPAPR_TCE_v2_IOMMU;
> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU)) {
> +        return VFIO_SPAPR_TCE_IOMMU;
> +    } else {
> +        error_setg(errp, "No available IOMMU models");
> +        return -EINVAL;
> +    }
> +}
> +
> +static int vfio_init_container(VFIOContainer *container, int group_fd,
> +                               int iommu_type, Error **errp)
> +{
> +    int ret;
> +
> +    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "failed to set group container");
> +        return -errno;
> +    }
> +
> +    ret = ioctl(container->fd, VFIO_SET_IOMMU, iommu_type);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "failed to set iommu for container");
> +        return -errno;
> +    }
> +    container->iommu_type = iommu_type;
> +    return 0;
> +}
> +
>  static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                    Error **errp)
>  {
>      VFIOContainer *container;
>      int ret, fd;
>      VFIOAddressSpace *space;
> +    int iommu_type;
> +    bool v2 = false;
> +
>  
>      space = vfio_get_address_space(as);
>  
> @@ -1101,23 +1147,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container->fd = fd;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
> -    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
> -        ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
> -        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
> +
> +    iommu_type = vfio_iommu_get_type(container, errp);
> +    if (iommu_type < 0) {
> +            goto free_container_exit;
> +    }
> +
> +    switch (iommu_type) {
> +    case VFIO_TYPE1v2_IOMMU:
> +    case VFIO_TYPE1_IOMMU:
> +    {
>          struct vfio_iommu_type1_info info;
>  
> -        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
> +        ret = vfio_init_container(container, group->fd, iommu_type, errp);
>          if (ret) {
> -            error_setg_errno(errp, errno, "failed to set group container");
> -            ret = -errno;
> -            goto free_container_exit;
> -        }
> -
> -        container->iommu_type = v2 ? VFIO_TYPE1v2_IOMMU : VFIO_TYPE1_IOMMU;
> -        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
> -        if (ret) {
> -            error_setg_errno(errp, errno, "failed to set iommu for container");
> -            ret = -errno;
>              goto free_container_exit;
>          }
>  
> @@ -1137,28 +1180,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>          }
>          vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
>          container->pgsizes = info.iova_pgsizes;
> -    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
> -               ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
> +        break;
> +    }
> +    case VFIO_SPAPR_TCE_v2_IOMMU:
> +        v2 = true;
> +    case VFIO_SPAPR_TCE_IOMMU:
> +    {
>          struct vfio_iommu_spapr_tce_info info;
> -        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU);
>  
> -        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
> +        ret = vfio_init_container(container, group->fd, iommu_type, errp);
>          if (ret) {
> -            error_setg_errno(errp, errno, "failed to set group container");
> -            ret = -errno;
> -            goto free_container_exit;
> -        }
> -        container->iommu_type =
> -            v2 ? VFIO_SPAPR_TCE_v2_IOMMU : VFIO_SPAPR_TCE_IOMMU;
> -        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
> -        if (ret) {
> -            container->iommu_type = VFIO_SPAPR_TCE_IOMMU;
> -            v2 = false;
> -            ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
> -        }
> -        if (ret) {
> -            error_setg_errno(errp, errno, "failed to set iommu for container");
> -            ret = -errno;
>              goto free_container_exit;
>          }
>  
> @@ -1222,10 +1253,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                info.dma32_window_size - 1,
>                                0x1000);
>          }
> -    } else {
> -        error_setg(errp, "No available IOMMU models");
> -        ret = -EINVAL;
> -        goto free_container_exit;
> +    }
>      }
>  
>      vfio_kvm_device_add_group(group);

