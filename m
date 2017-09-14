Received: by 10.223.172.38 with SMTP id v35csp635203wrc;
        Thu, 14 Sep 2017 02:28:32 -0700 (PDT)
X-Received: by 10.200.57.6 with SMTP id s6mr28803488qtb.176.1505381312240;
        Thu, 14 Sep 2017 02:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505381312; cv=none;
        d=google.com; s=arc-20160816;
        b=S8Qwy+eb8qxUYe1snRH43Of8gGGdW1+PU4PjlKaHcPMX7A4/i8yoKeAkr1DaIDVsdu
         DJ3dW8AXuwqtuFuA0YTdpM2IXbVg/77AMH3BpmsePXyqsNVFwpJtxBu6kG2wlKVx3GOa
         xRbUNNUwXjpNTyIjDGFtEhWIMy0VM+JZoyHEuVTO6hp8QqUwnnk1Erdpl9w68J+sv7hk
         cd7/s20yJFNXDRzQhTktAUD47V5ahGRq4qzmCMN1kKs2z2bKhiGG1jYY6r26TOK4rmPW
         xt84Qqv5HlzS53iqj/kfCjtvKN26NGioJE8Ejl6waM2Cd0UnPcq6DiFOG8si3sdq/3rH
         SxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=o6jPFwc9u+F2UTXyKF+rRaUk/ZcLeVsy2bgeyK1jLuE=;
        b=ofziQ0EyHdyvvOESIK9eme7IMTnC5/uo8sZKXhoioBf+YZacEkQ6CnKWucHLZKf060
         uDuLJUTATfjtSvyKI61IVLOYew02scZUOSdzCsd1CAALOSnFNcdzJplDx4Phm1oJM+or
         +BIsszlMZBsyBw/783C3yajFFvKxfg0ebqO9vSb5rjKFxda+6rnlbAkaiPL0sGC2Vr6a
         pZq9lzwbWV5u5jGOwlFYFoHo4TCnHEV6rEmfOOVuZBSV15p2iOzhJYbfJeuSN4wFmTAA
         n72j+T28r4VnM0YBD6k+GduL15ENZjUzSIeLL2Ta3cl/LhuM8RZ+0Fiy4csbhAnxF84f
         OXkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlcJ7c8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14si16954460qtc.102.2017.09.14.02.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 02:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlcJ7c8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsQRi-0005Cf-0S
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 05:28:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dsQRX-0005B9-5L
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dsQRT-0000Ev-2i
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:28:19 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:32961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dsQRS-0000D8-Rn; Thu, 14 Sep 2017 05:28:15 -0400
Received: by mail-pf0-x241.google.com with SMTP id h4so1272667pfk.0;
	Thu, 14 Sep 2017 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=o6jPFwc9u+F2UTXyKF+rRaUk/ZcLeVsy2bgeyK1jLuE=;
	b=TlcJ7c8Z/ZE6JN4Ofn6F3hxGb7mqEDNOjU5eFu0Ggc/eXQhBLZJttA6zpF8bc3b9TI
	mvvN6sX9hkClQD1s7N0iUuir4GzLEUCcaP454+u5LO7PIbycEZ2rSakyIEStN6Fpe8tc
	QEUhgb06X92Sv6+kILTXZg7XQ0JVB7vVjdSgjR4cHrYo4A7qNkuC26E8nE1qIqQJt900
	dTf2SlCAZuJfTQ6Lt45cFwZYVEO2TiM0ZJFhtbBnW4Vb13cahrXbWWhYE+kf8NNuKwhl
	3pPtt5iuEovi67vDbFnPVRY4a6i4xqrqg5TY7WgosO4OrnDkcRCc9tlRTi1H2Yn4NRVK
	VlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=o6jPFwc9u+F2UTXyKF+rRaUk/ZcLeVsy2bgeyK1jLuE=;
	b=I/IeWcXM0tSOurS6zBddgBhnKS0V6ANXChy2aqmzle4jF3mlhd+WIBo9QMKcb3JwcZ
	s1GVj8LOmy3nw4QuAZ05BtdE40c4nlMNuMtbqhj+TY1OTZeocWxxRdntuVN4YTBDc3Q5
	+4dK85qOn3HaBquqUUQjW+5B+UfYhcGuwklgwmmBlvUy0nloTW3E9AtHQUGDklVhbsEj
	4Phx0k81fLvTOMG7Bua3ACRY/OhRpLWq/j53g6cFDQtRGYim2gsZ0N2U59MA01mytpBE
	r9vaBeXlVUt2OvtkRG/+gfJOltuUmHpWeJgsgs19eKxEDdMjoWGzJXgtmJ6ojMVl02FB
	qHWw==
X-Gm-Message-State: AHPjjUg7VbU9icEcrQJPcYRV5FqVMIFH5lSzx9pqa0zZiyxKzlwyIqZv
	ztNFwX+89gC78A==
X-Google-Smtp-Source: ADKCNb79JOUmwLg17GJLHPaDl69eSjXXYiUoXNMIm4AYEDqZHWscBp64Zb4oPIql9YJuFTJ9lw+egg==
X-Received: by 10.98.102.149 with SMTP id s21mr20556275pfj.294.1505381292461; 
	Thu, 14 Sep 2017 02:28:12 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	184sm26062178pfg.18.2017.09.14.02.28.06
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 14 Sep 2017 02:28:11 -0700 (PDT)
Date: Thu, 14 Sep 2017 14:57:52 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170914092751.GA3336@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504286483-23327-14-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v7 13/20] hw/arm/smmuv3: Implement IOMMU
 memory region replay callback
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fGDwL/wMqTYF

Hi Eric,

On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
> memory_region_iommu_replay() is used for VFIO integration.
> 
> However its default implementation is not adapted to SMMUv3
> IOMMU memory region. Indeed the input address range is too
> huge and its execution is too slow as it calls the translate()
> callback on each granule.
> 
> Let's implement the replay callback which hierarchically walk
> over the page table structure and notify only the segments
> that are populated with valid entries.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8e7d10d..c43bd93 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry *entry, void *private)
>      return 0;
>  }
>  
> +/* Unmap the whole notifier's range */
> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
> +{
> +    IOMMUTLBEntry entry;
> +    hwaddr size = n->end - n->start + 1;
> +
> +    entry.target_as = &address_space_memory;
> +    entry.iova = n->start & ~(size - 1);
> +    entry.perm = IOMMU_NONE;
> +    entry.addr_mask = size - 1;
> +
> +    memory_region_notify_one(n, &entry);
> +}
> +
> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
> +{
> +    SMMUTransCfg cfg = {};
> +    int ret;
> +
> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
> +    smmuv3_unmap_notifier_range(n);
> +
> +    ret = smmuv3_decode_config(mr, &cfg);
> +    if (ret) {
> +        error_report("%s error decoding the configuration for iommu mr=%s",
> +                     __func__, mr->parent_obj.name);
> +    }
> 

On an invalid config being found, shouldnt we return rather than proceeding with
page table walk. For example on an invalid Stream table entry.

+
> +    if (cfg.disabled || cfg.bypassed) {
> +        return;
> +    }
> +    /* walk the page tables and replay valid entries */
> +    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
> +                   smmuv3_notify_entry, n);
> +}
>  static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
>                                       uint64_t iova, size_t size)
>  {
> @@ -1095,6 +1130,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>  
>      imrc->translate = smmuv3_translate;
>      imrc->notify_flag_changed = smmuv3_notify_flag_changed;
> +    imrc->replay = smmuv3_replay;
>  }
>  
>  static const TypeInfo smmuv3_type_info = {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 4ac264d..15f84d6 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, ui
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_replay_mr(const char *name) "iommu mr=%s"
> +smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end) "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
>  smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
>  smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
> -- 
> 2.5.5
> 
> 

-- 
Linu cherian
