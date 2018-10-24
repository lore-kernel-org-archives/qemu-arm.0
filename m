Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp328189wrt;
        Wed, 24 Oct 2018 02:00:52 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ckTn9HZTvJuJiswpWS1+rav71IMEYcj+7L/jHZW0F3B9oMEobc46YuwetuoUlVc0NvtTR6
X-Received: by 2002:aed:21d7:: with SMTP id m23-v6mr1596253qtc.121.1540371652573;
        Wed, 24 Oct 2018 02:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540371652; cv=none;
        d=google.com; s=arc-20160816;
        b=GzOeW6yTUASYpckzs0ex+rb1c7mKDC9Av3a5XHBCJ7EB2sMf5T33dTQ6svAn0xHcEM
         3zORC61uiVWqJVNJk/jflnA9rMGdTmTO9ixzQgsH6Ldy+KZmFLgB199oePaQZul9mBep
         zAIlihJAaObtLystgiF5dFYPbusgrSGa+BfzmBUZrVwLPo5UG1gpuZuDIelUMtgZIwnq
         0n6ERocWhQX1fMALPg3HV4/ewzgtLS/spxf9a7pjzxBbP0GBbGR25d4/Ime92yoe2fjY
         +aX2ytKRR5VQkbKvO/emm95iy+gRhTZxErU7FTa8DY3yyNDJ89RwtvxsWsq12hrtuXQL
         /XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=JHlhi+9eTW2bwFwrqdox2PMapyp8Ip7269+EfAciyzc=;
        b=AzH0OhfENvqbVPBUFtJp4AM+2gf4OKyABpm08oLBHkKaCoA/YxViAJ8tzz6wxZJ30t
         LQrXV9n4ZbpjVcb9BOjgRYBjCQr0wmbklPZSyW/WPf1htF126ECX3J6nq02gEYXKE34R
         WNC8npGKV99IXHnmc1l1pwI/UEG9OGDIi4PPm38m6f4uS22zfODfX4koIil/mlx4ZxFW
         AUPhTbJhtZGIPy3fpnXlS0ycoz8kjbMO7bukKFNXYjjWMUJYKrnjMK8rOhQAF1xmSxcW
         9eb7q9MA82A9MH9QtLvKUtMrzULHPE+pneIyI+wvNE1uo/hssqwZpyLgcH5jM5BgnhTI
         yHug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si1573480qtq.205.2018.10.24.02.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Oct 2018 02:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFF24-0000eP-4q
	for alex.bennee@linaro.org; Wed, 24 Oct 2018 05:00:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gFF1v-0000eJ-Oo
	for qemu-arm@nongnu.org; Wed, 24 Oct 2018 05:00:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gFF1p-00054J-OH
	for qemu-arm@nongnu.org; Wed, 24 Oct 2018 05:00:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gFF1j-00050y-3d; Wed, 24 Oct 2018 05:00:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F9A33086252;
	Wed, 24 Oct 2018 09:00:27 +0000 (UTC)
Received: from [10.36.118.8] (unknown [10.36.118.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F6F765F4B;
	Wed, 24 Oct 2018 09:00:17 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>
References: <20180921081819.9203-1-eric.auger@redhat.com>
	<20180921081819.9203-8-eric.auger@redhat.com>
	<20181022163923.35ad7a4e@bahia.lan>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ff16761c-9524-4a3e-b000-6cb2ade91b8f@redhat.com>
Date: Wed, 24 Oct 2018 11:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181022163923.35ad7a4e@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 24 Oct 2018 09:00:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: UDMQ46FVu2cF

Hi Greg,
On 10/22/18 4:39 PM, Greg Kurz wrote:
> On Fri, 21 Sep 2018 10:17:58 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> To prepare for testing yet another extension, let's
>> refactor the code. We introduce vfio_iommu_get_type()
>> helper which selects the richest API (v2 first). Then
>> vfio_init_container() does the SET_CONTAINER and
>> SET_IOMMU ioctl calls. So we end up with a switch/case
>> on the iommu_type which should be a little bit more readable
>> when introducing the NESTING extension check. Also ioctl's
>> get called once per iommu_type.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/vfio/common.c | 102 ++++++++++++++++++++++++++++++-----------------
>>  1 file changed, 65 insertions(+), 37 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 7c185e5a2e..53b8f773cc 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1036,12 +1036,58 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
>>      }
>>  }
>>  
>> +/*
>> + * vfio_iommu_get_type - selects the richest iommu_type (v2 first)
>> + * nested only is selected if requested by @force_nested
> 
> It seems the second line belongs to patch 8.
Yes it does. thanks for spotting that.
> 
> Appart from that, this definitely makes the code more readable.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

I will send this patch separately.

Thanks

Eric
> 
>> + */
>> +static int vfio_iommu_get_type(VFIOContainer *container,
>> +                               Error **errp)
>> +{
>> +    int fd = container->fd;
>> +
>> +    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
>> +        return VFIO_TYPE1v2_IOMMU;
>> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU)) {
>> +        return VFIO_TYPE1_IOMMU;
>> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
>> +        return VFIO_SPAPR_TCE_v2_IOMMU;
>> +    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU)) {
>> +        return VFIO_SPAPR_TCE_IOMMU;
>> +    } else {
>> +        error_setg(errp, "No available IOMMU models");
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +static int vfio_init_container(VFIOContainer *container, int group_fd,
>> +                               int iommu_type, Error **errp)
>> +{
>> +    int ret;
>> +
>> +    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>> +    if (ret) {
>> +        error_setg_errno(errp, errno, "failed to set group container");
>> +        return -errno;
>> +    }
>> +
>> +    ret = ioctl(container->fd, VFIO_SET_IOMMU, iommu_type);
>> +    if (ret) {
>> +        error_setg_errno(errp, errno, "failed to set iommu for container");
>> +        return -errno;
>> +    }
>> +    container->iommu_type = iommu_type;
>> +    return 0;
>> +}
>> +
>>  static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                    Error **errp)
>>  {
>>      VFIOContainer *container;
>>      int ret, fd;
>>      VFIOAddressSpace *space;
>> +    int iommu_type;
>> +    bool v2 = false;
>> +
>>  
>>      space = vfio_get_address_space(as);
>>  
>> @@ -1101,23 +1147,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container->fd = fd;
>>      QLIST_INIT(&container->giommu_list);
>>      QLIST_INIT(&container->hostwin_list);
>> -    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
>> -        ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
>> -        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
>> +
>> +    iommu_type = vfio_iommu_get_type(container, errp);
>> +    if (iommu_type < 0) {
>> +            goto free_container_exit;
>> +    }
>> +
>> +    switch (iommu_type) {
>> +    case VFIO_TYPE1v2_IOMMU:
>> +    case VFIO_TYPE1_IOMMU:
>> +    {
>>          struct vfio_iommu_type1_info info;
>>  
>> -        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
>> +        ret = vfio_init_container(container, group->fd, iommu_type, errp);
>>          if (ret) {
>> -            error_setg_errno(errp, errno, "failed to set group container");
>> -            ret = -errno;
>> -            goto free_container_exit;
>> -        }
>> -
>> -        container->iommu_type = v2 ? VFIO_TYPE1v2_IOMMU : VFIO_TYPE1_IOMMU;
>> -        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
>> -        if (ret) {
>> -            error_setg_errno(errp, errno, "failed to set iommu for container");
>> -            ret = -errno;
>>              goto free_container_exit;
>>          }
>>  
>> @@ -1137,28 +1180,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>          }
>>          vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
>>          container->pgsizes = info.iova_pgsizes;
>> -    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
>> -               ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
>> +        break;
>> +    }
>> +    case VFIO_SPAPR_TCE_v2_IOMMU:
>> +        v2 = true;
>> +    case VFIO_SPAPR_TCE_IOMMU:
>> +    {
>>          struct vfio_iommu_spapr_tce_info info;
>> -        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU);
>>  
>> -        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
>> +        ret = vfio_init_container(container, group->fd, iommu_type, errp);
>>          if (ret) {
>> -            error_setg_errno(errp, errno, "failed to set group container");
>> -            ret = -errno;
>> -            goto free_container_exit;
>> -        }
>> -        container->iommu_type =
>> -            v2 ? VFIO_SPAPR_TCE_v2_IOMMU : VFIO_SPAPR_TCE_IOMMU;
>> -        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
>> -        if (ret) {
>> -            container->iommu_type = VFIO_SPAPR_TCE_IOMMU;
>> -            v2 = false;
>> -            ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
>> -        }
>> -        if (ret) {
>> -            error_setg_errno(errp, errno, "failed to set iommu for container");
>> -            ret = -errno;
>>              goto free_container_exit;
>>          }
>>  
>> @@ -1222,10 +1253,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                info.dma32_window_size - 1,
>>                                0x1000);
>>          }
>> -    } else {
>> -        error_setg(errp, "No available IOMMU models");
>> -        ret = -EINVAL;
>> -        goto free_container_exit;
>> +    }
>>      }
>>  
>>      vfio_kvm_device_add_group(group);
> 
> 
