Received: by 10.223.159.74 with SMTP id f10csp4151300wrg;
        Wed, 6 Dec 2017 07:00:03 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZr0VCi3hfFa0877eRGDx+QHeNAYUXIzX1K8vPJsZKPSKKnNNMF/bEErhWhP8eDcM0RJfWX
X-Received: by 10.37.233.10 with SMTP id n10mr3323314ybd.255.1512572403820;
        Wed, 06 Dec 2017 07:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512572403; cv=none;
        d=google.com; s=arc-20160816;
        b=yLFehamiAuVs9S7NC0x8O01b+TZGZSmrV3tVOf1smxAcpAhrPRuXIBWWzNCbgAshRq
         PJG0K9jGpuajDXEy6qAOPljtytrQivRp83HpweaLgWjtMEfxMccdZqbIMJw+3ZpK1ZGa
         JFX+OggSZkd9BduSKylKU1vAJbErqoU1UT8Ze+8Ev/Z2hxXrYaeK+h0why0CAqYmES6M
         MWFUiKwr+WhzQlEkrsRd/4xi4CsKMOSkR/aowM3Hp6kEO+qH/qzJg1O84BdRmqAXIwx8
         eniDYf+o2sAQ3Sk94QXvRRuImnWizAK/4BU7eStCTHfixWtVgB6BRCejYU3g2wvnLQq8
         dTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=1fgDtXJoodwoEnA77IDggO718S/scow3Petl8+MQ10Y=;
        b=UPz3SZlA3N7SkvzyW8144pvcRgEsLeaNpJ0wdjM2hHesNHAtscMBxSudklCpWYSPcX
         UotR35PWIZtOtdNdCYcQQquO+pLhuGGGG5CyuCGkGY41Mj5KHWq8YxVDGRQFiwVwmAdh
         nUbc8g5XtNq8KmkXdl0OYofJm5/QD6GH4ZkF5J/K/OBvk9AUO6YgS4iWjqw1KVCquECA
         s7ujRVU3fGXaOg7MJzjOzskHxHjarlq5LuUadGPUsB/foTT/IxQH5KKQDxGKbODQ3YAH
         Ac7xWwsXxtgSQew8madoe2QCyqBDpBweAezeEFkuJUeohjUwC0wBIwCcErUxPlJuWmaS
         EvrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si639105ybn.179.2017.12.06.07.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 07:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMbB5-00030X-AC
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 10:00:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eMbAy-00030P-62
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eMbAt-0006Pf-Jh
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:59:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eMbAt-0006PF-Ab; Wed, 06 Dec 2017 09:59:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43AD8624DA;
	Wed,  6 Dec 2017 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-23.ams2.redhat.com
	[10.36.116.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ADF76062E;
	Wed,  6 Dec 2017 14:59:46 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
	<e500dd54-04b6-5f19-316f-0598655751ea@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA838622A1D@FRAEML521-MBX.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3fcae1c1-6195-59ce-68f2-1a0b13a130c2@redhat.com>
Date: Wed, 6 Dec 2017 15:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA838622A1D@FRAEML521-MBX.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Dec 2017 14:59:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 1/5] hw/vfio: Add function for
 getting reserved_region of device iommu group
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8f5zMk/HscS

Hi Shameer,

On 06/12/17 15:38, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: Wednesday, December 06, 2017 2:01 PM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> Alex Williamson <alex.williamson@redhat.com>
>> Cc: peter.maydell@linaro.org; qemu-devel@nongnu.org; Linuxarm
>> <linuxarm@huawei.com>; qemu-arm@nongnu.org; Zhaoshenglong
>> <zhaoshenglong@huawei.com>; Zhuyijun <zhuyijun@huawei.com>
>> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
>> reserved_region of device iommu group
>>
>> Hi Shameer,
>>
>> On 06/12/17 11:30, Shameerali Kolothum Thodi wrote:
>>> Hi Alex,
>>>
>>>> -----Original Message-----
>>>> From: Shameerali Kolothum Thodi
>>>> Sent: Monday, November 20, 2017 4:31 PM
>>>> To: 'Alex Williamson' <alex.williamson@redhat.com>
>>>> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
>>>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>>>> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
>>>> <linuxarm@huawei.com>
>>>> Subject: RE: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
>>>> reserved_region of device iommu group
>>> [...]
>>>>>>> And sysfs is a good interface if the user wants to use it to
>>>>>>> configure the VM in a way that's compatible with a device.  For
>>>>>>> instance, in your case, a user could evaluate these reserved
>>>>>>> regions across all devices in a system, or even across an entire
>>>>>>> cluster, and instantiate the VM with a memory map compatible with
>>>>>>> hotplugging any of those evaluated devices (QEMU implementation of
>>>> allowing the user to do this TBD).
>>>>>>> Having the vfio device evaluate these reserved regions only helps
>>>>>>> in the cold-plug case.  So the proposed solution is limited in
>>>>>>> scope and doesn't address similar needs on other platforms.  There
>>>>>>> is value to verifying that a device's IOVA space is compatible
>>>>>>> with a VM memory map and modifying the memory map on cold-plug or
>>>>>>> rejecting the device on hot-plug, but isn't that why we have an
>>>>>>> ioctl within vfio to expose information about the IOMMU?  Why take
>>>>>>> the path of allowing QEMU to rummage through sysfs files outside
>>>>>>> of vfio, implying additional security and access concerns, rather
>>>>>>> than filling the gap within the vifo API?
>>>>>>
>>>>>> Thanks Alex for the explanation.
>>>>>>
>>>>>> I came across this patch[1] from Eric where he introduced the IOCTL
>>>>> interface to
>>>>>> retrieve the reserved regions. It looks like this can be reworked to
>>>>> accommodate
>>>>>> the above requirement.
>>>>>
>>>>> I don't think we need a new ioctl for this, nor do I think that
>>>>> describing the holes is the correct approach.  The existing
>>>>> VFIO_IOMMU_GET_INFO ioctl can be extended to support capability
>>>>> chains, as we've done for VFIO_DEVICE_GET_REGION_INFO.
>>>>
>>>> Right, as far as I can see the above mentioned patch is doing exactly the
>> same,
>>>> extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.
>>>>
>>>>> IMO, we should try to
>>>>> describe the available fixed IOVA regions which are available for
>>>>> mapping rather than describing various holes within the address space
>>>>> which are unavailable.  The latter method always fails to describe the
>>>>> end of the mappable IOVA space and gets bogged down in trying to
>>>>> classify the types of holes that might exist.  Thanks,
>>>>
>>>
>>> I was going through this and noticed that it is possible to have multiple
>>> iommu domains associated with a container. If that's true, is it safe to
>>> make the assumption that all the domains will have the same iova
>>> geometry or not?
>> To me the answer is no.
>>
>> There are several iommu domains "underneath" a single container. You
>> attach vfio groups to a container. Each of them is associated to an
>> iommu group and an iommu domain. See vfio_iommu_type1_attach_group().
>>
>> Besides, the reserved regions are per iommu group.
>>
> 
> Thanks for your reply. Yes, container can have multiple groups(hence multiple 
> iommu domains) and reserved regions are per group. Hence while deciding
> the default supported iova geometry we have to go through all the domains
> in the container and select smallest aperture as the supported default iova
> range.
> 
> Please find below snippet from a patch I am working on. Please
> let me know your thoughts on this.
> 
> Thanks,
> Shameer
> 
> -- >8 --
> +static int vfio_build_iommu_iova_caps(struct vfio_iommu *iommu,
> +                               struct vfio_info_cap *caps) {
> +       struct iommu_resv_region *resv, *resv_next;
> +       struct vfio_iommu_iova *iova, *iova_next;
> +       struct list_head group_resv_regions, vfio_iova_regions;
> +       struct vfio_domain *domain;
> +       struct vfio_group *g;
> +       phys_addr_t start, end;
> +       int ret = 0;
> +
> +       domain = list_first_entry(&iommu->domain_list,
> +                                 struct vfio_domain, next);
> +       /* Get the default iova range supported */
> +       start = domain->domain->geometry.aperture_start;
> +       end = domain->domain->geometry.aperture_end;
> 
> This is where I am confused. I think instead I should go over
> the domain_list and select the smallest aperture as default
> iova range.
yes that's correct. I Just want to warn you Pierre is working on the
same topic. May be worth to sync together.

[PATCH] vfio/iommu_type1: report the IOMMU aperture info
(https://patchwork.kernel.org/patch/10084655/)

I think he plans to rework his series with capability chain too.

Thanks

Eric


> 
> +       INIT_LIST_HEAD(&vfio_iova_regions);
> +       vfio_insert_iova(start, end, &vfio_iova_regions);
> +
> +       /* Get reserved regions if any */
> +       INIT_LIST_HEAD(&group_resv_regions);
> +       list_for_each_entry(g, &domain->group_list, next)
> +               iommu_get_group_resv_regions(g->iommu_group,
> +                                               &group_resv_regions);
> +       list_sort(NULL, &group_resv_regions, vfio_resv_cmp);
> +
> +       /* Update iova range excluding reserved regions */
>  ...
> -- >8 --
> 
> 
