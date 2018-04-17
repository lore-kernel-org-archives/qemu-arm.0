Received: by 10.28.4.212 with SMTP id 203csp3667392wme;
        Tue, 17 Apr 2018 03:52:28 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48CCPaY+6wH8gkQdqemvc7mjAppKkctPHoNvVvwmHqGoXq6nu0Q7FFbdRUCbxIItbGnE/ko
X-Received: by 10.233.239.151 with SMTP id d145mr1876847qkg.100.1523962348476;
        Tue, 17 Apr 2018 03:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523962348; cv=none;
        d=google.com; s=arc-20160816;
        b=IzMGO8PTekNCuj6DaD4RuvyznZp8JW6C/WQn44Ulnhgf7LnN83swNeNvkxvCkhCDMM
         ZHHT1jczolVOC6sv3VEY1qPUieZd0QRWkwJv97hfm+kE4iU/T0mYFXkHXSKf9H7tKFBT
         0fu+C3jxx8qFuZAArFqG8PpFkCI/0OIYGgkfws1cAY4TSeISnPK2xGgCsvsHrBAc6rFO
         sOcFwUp1DfPqsOFi8DHzJFfhOIgCWBh2/uWrtnTnd9m5TAjn/5OF9esNUhADp5grodnn
         LxNHwq87iFLcuiIg241+z+xpBe5l2YXrFHZ4W5OG/KiDR7ulSSf3Dd9jkuIIg9GTfyrS
         w1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G3x8EnWg67is2Vl3KFsNpYzzmwrDz6irAFx6DNp8BKI=;
        b=wHm0TiBI75LzDPQ5qtjRAkc8+MTUAnVloC9JkCfq+nkNDZcvE5Ou8+n/bw11DY3z18
         ISN/AMvsYXOrxv33d2izynDHuHLaNWzkH6/YPdsWRaXrplfFrueTymrVP1kSc9QphJxC
         JB2R2uV9HZpZdsSisEiSINdRjMkqcdnBV30kn2eUGWhrgSy1NMBR2OIQxoN+bmtp2NTO
         bux4N5Q+2ruFDNzA5+kd3ga/VgR3xkAbVall4eJxcWLGPIvG8T2iXWz4UV6SDqphFKv8
         Wk+VTFRkliouSgOsPQo9BwGFayStDau8n34TSoWvRI0nIOt0IGh5DODqPXSu+ZaoNboB
         OKvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvIx0eJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si693983qkc.84.2018.04.17.03.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 03:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvIx0eJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8ODr-00064k-Tn
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 06:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8ODb-00063H-C2
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:52:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8ODa-0007N6-Do
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:52:11 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8ODa-0007Jb-70
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:52:10 -0400
Received: by mail-oi0-x241.google.com with SMTP id 10-v6so5725666oix.2
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 03:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G3x8EnWg67is2Vl3KFsNpYzzmwrDz6irAFx6DNp8BKI=;
	b=VvIx0eJhdBMN9VTMjBqE8fosDog3EZfKKH91rdtSc1HIlGtg6Uf/jg66jY6GoXeNrU
	2cfX29hVHBP+g7Y0G6384tZl5EV0oCM4tAkBX5FIBNltBuZl2AHLhpnj5TZaUKFa4olS
	RMMeWPOYnBn4SCXnBb2DONNgv5R1k6C/HXKEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G3x8EnWg67is2Vl3KFsNpYzzmwrDz6irAFx6DNp8BKI=;
	b=ZncM5SjrE/yPmPYOLnmrKs3ywwMQcGm0D/4Eiadafoh/jGaJRCd3fcwxCBKhJMo4l7
	gKlfRPhS/5d60LAN8i99VS54LcuJnv7hisBcXe5HIxbcex+hgiEiRl7Eo5ebq0tILvjw
	NLmelHTSHVrZrxLTcDJ9fPuT0j+HapIbtwRUOyMQLEwHD7O8dg9K8pbD0TTBs/vDHtTD
	eeh9pFuxB3hQZUjMNuueKtaLduuckooZOoWuFhwg1FmCAxtUZUvsuwu92JH22V92JdOo
	XEX/GldSORbc9JweMveisTCdTy3yN1WHyGWvqNBbYuBX7aaMSAjlVIrXwJkBaFwpNvNN
	Zu/w==
X-Gm-Message-State: ALQs6tDukoYADb6MciG3iN4FtsNSGlNh9hgSVxjoyrxgfggHpY+VM3+5
	xjbAcuy14aEWUUN+rLAPvErErcx3pXGqOwGgJlQCUw==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr786584oig.164.1523962329420; 
	Tue, 17 Apr 2018 03:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 03:51:48
	-0700 (PDT)
In-Reply-To: <1523518688-26674-11-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-11-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 11:51:48 +0100
Message-ID: <CAFEAcA88j0HfbJUYfXY-EejjvA3asLE+qJ3aSsCebwZDkpytTQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v11 10/17] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmyMI4SgoLJK

On 12 April 2018 at 08:38, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment, the SMMUv3 does not support notification on
> TLB invalidation. So let's log an error as soon as such notifier
> gets enabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4be676b..6e0d7ad 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1147,12 +1147,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>      dc->realize = smmu_realize;
>  }
>
> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> +                                       IOMMUNotifierFlag old,
> +                                       IOMMUNotifierFlag new)
> +{
> +    if (old == IOMMU_NOTIFIER_NONE) {
> +        warn_report("SMMUV3 does not support vhost/vfio integration yet: "
> +                    "devices of those types will not function properly");
> +    }
> +}
> +
>  static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>                                                    void *data)
>  {
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
>
>      imrc->translate = smmuv3_translate;
> +    imrc->notify_flag_changed = smmuv3_notify_flag_changed;
>  }
>
>  static const TypeInfo smmuv3_type_info = {
> --
> 2.5.5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
