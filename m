Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6904431wrg;
        Mon, 27 May 2019 19:48:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwer6DYfzeBSJLii1sTCUUsZHN3KoTO7eamcjyk9AmPreh/z+xu+CGtfmxQ/gbV5r3QC65r
X-Received: by 2002:a67:fd93:: with SMTP id k19mr3489520vsq.45.1559011696526;
        Mon, 27 May 2019 19:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559011696; cv=none;
        d=google.com; s=arc-20160816;
        b=Dgm+RsH+BG9RlHJmYDxnrGW9rnBiTDaDJb67lovRymtprxme/DgQu9FEbhGNNmntM/
         zmkh2wn8wK4/qPrGpGMslfs8DFug7aywWPKABTOIlI2BtO7w3eBrRrb7qT6bWo47HrZT
         53vv2OhgaDlNlOGKqZsPaGaNUVseqxGEaSFBG+zUtMVxaIAvLY+37xxa3LE0cTSKTn/E
         5YCpgLlbdHloAIgX2Nsaxh+atSmkZwNvDZ0v+kFhQzEfOHSjdfUcEsFeLWVklusjVZhA
         Fp/wiHZiFntHTv1SApsDy51bUdfWhd2eiUQAfVVNSyjfRG0rsPeCBZgRRO6YTgUwPfOY
         tJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=sPlLI4qWxNpgLIX8cpV7dkMaKbO+3LkO5hcMkOKCBkg=;
        b=QqXnkaCiSmfK6xFHRURSld/p3z573//3aQrTH9zqN22BVI2v+IyDCIlxEtIf/T1o2S
         sICj77riaMSnGM76tD4mpoMVSK9iqXKPB3R9q39m278u0fmvoBY7xWIDwI/h55bYIU0G
         Cuoe/nhtg4SR3we+aToD3PuoExNa9VGixpvOISA8p6HvOiNTsFndYs4MMu+iMOf9i+Xj
         DLzLbXFkSRz/cJhXEijlggtWrxX1FZDPQb8fBhiVtv0wuswZ+zbZ7bvgTwU7CagmugDa
         zXdxp4w4qNcRTVFEVc/IXl2FEpcdUusmB9/yePT8WuO8LyGdZjErzXj2Q6lSAkjNJ7iI
         ZeFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si4816075vsr.384.2019.05.27.19.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 19:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVS9v-0006YT-PG
	for alex.bennee@linaro.org; Mon, 27 May 2019 22:48:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVS9j-0006XR-Lv
	for qemu-arm@nongnu.org; Mon, 27 May 2019 22:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVS9i-00088H-L0
	for qemu-arm@nongnu.org; Mon, 27 May 2019 22:48:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1hVS9i-00087b-EP; Mon, 27 May 2019 22:48:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F1B981DF5;
	Tue, 28 May 2019 02:48:00 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78AFF60126;
	Tue, 28 May 2019 02:47:49 +0000 (UTC)
Date: Tue, 28 May 2019 10:47:47 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190528024747.GA23180@xz-x1>
References: <20190527114203.2762-1-eric.auger@redhat.com>
	<20190527114203.2762-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190527114203.2762-9-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 28 May 2019 02:48:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 08/27] hw/vfio/common: Force nested if iommu
 requires it
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, yi.l.liu@intel.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	zhangfei.gao@foxmail.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQvwHewAaQqm

On Mon, May 27, 2019 at 01:41:44PM +0200, Eric Auger wrote:
> In case we detect the address space is translated by
> a virtual IOMMU which requires nested stages, let's set up
> the container with the VFIO_TYPE1_NESTING_IOMMU iommu_type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - add "nested only is selected if requested by @force_nested"
>   comment in this patch
> ---
>  hw/vfio/common.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 1f1deff360..99ade21056 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1136,14 +1136,19 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
>   * vfio_get_iommu_type - selects the richest iommu_type (v2 first)
>   */
>  static int vfio_get_iommu_type(VFIOContainer *container,
> +                               bool force_nested,
>                                 Error **errp)
>  {
> -    int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
> +    int iommu_types[] = { VFIO_TYPE1_NESTING_IOMMU,
> +                          VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
>                            VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
>          if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
> +            if (iommu_types[i] == VFIO_TYPE1_NESTING_IOMMU && !force_nested) {

If force_nested==true and if the kernel does not support
VFIO_TYPE1_NESTING_IOMMU, we will still return other iommu types?
That seems to not match with what "force" mean here.

What I feel like is that we want an "iommu_nest_types[]" which only
contains VFIO_TYPE1_NESTING_IOMMU.  Then:

        if (nested) {
                target_types = iommu_nest_types;
        } else {
                target_types = iommu_types;
        }

        foreach (target_types)
                ...

        return -EINVAL;

Might be clearer?  Then we can drop [2] below since we'll fail earlier
at [1].

> +                continue;
> +            }
>              return iommu_types[i];
>          }
>      }
> @@ -1152,11 +1157,11 @@ static int vfio_get_iommu_type(VFIOContainer *container,
>  }
>  
>  static int vfio_init_container(VFIOContainer *container, int group_fd,
> -                               Error **errp)
> +                               bool force_nested, Error **errp)
>  {
>      int iommu_type, ret;
>  
> -    iommu_type = vfio_get_iommu_type(container, errp);
> +    iommu_type = vfio_get_iommu_type(container, force_nested, errp);
>      if (iommu_type < 0) {
>          return iommu_type;

[1]

>      }
> @@ -1192,6 +1197,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      VFIOContainer *container;
>      int ret, fd;
>      VFIOAddressSpace *space;
> +    IOMMUMemoryRegion *iommu_mr;
> +    bool force_nested = false;
> +
> +    if (as != &address_space_memory && memory_region_is_iommu(as->root)) {
> +        iommu_mr = IOMMU_MEMORY_REGION(as->root);
> +        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
> +                                     (void *)&force_nested);
> +    }
>  
>      space = vfio_get_address_space(as);
>  
> @@ -1252,12 +1265,18 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>  
> -    ret = vfio_init_container(container, group->fd, errp);
> +    ret = vfio_init_container(container, group->fd, force_nested, errp);
>      if (ret) {
>          goto free_container_exit;
>      }
>  
> +    if (force_nested && container->iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
> +            error_setg(errp, "nested mode requested by the virtual IOMMU "
> +                       "but not supported by the vfio iommu");
> +    }

[2]

> +
>      switch (container->iommu_type) {
> +    case VFIO_TYPE1_NESTING_IOMMU:
>      case VFIO_TYPE1v2_IOMMU:
>      case VFIO_TYPE1_IOMMU:
>      {
> -- 
> 2.20.1
> 

Regards,

-- 
Peter Xu
