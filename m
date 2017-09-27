Received: by 10.223.172.38 with SMTP id v35csp4386261wrc;
        Wed, 27 Sep 2017 00:02:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA4IsgVVnHI7ktLpjTJY+waBg7flhR2uMDr57pB9Og34LgJosrdqXnhMzkDV42TLpsWamCE
X-Received: by 10.200.26.40 with SMTP id v37mr454647qtj.93.1506495734807;
        Wed, 27 Sep 2017 00:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506495734; cv=none;
        d=google.com; s=arc-20160816;
        b=k0ItymoWCLR4vhiHm/vrEg0pOi4x9viut/u5stS0LpIijbiCsNrtRGgSYE75N5agmy
         UpWmSYqkOtepfekH8/9GayQ6cYYnmSlhe9wF7ql3Ms8WjblN6MI83WWoQnyx7pxJXLx5
         Mjgp/OlakE8Ua5pkRJmEiVOFAMSx0Ob60KiQING6Mwto1jZYUwbqkHRS0c9Gc2wdumpz
         8Yg5xtq+SAAMXuFBabqH8g5p8cpV6++fEh2t5ScJH3KIG1W7T+ImNzRlckxfn1Qzbt5d
         tqIdB2QolJ2ET/ZbA3nPy7l1AM8EGX2GSnTXNen/G0I/ZoJpthTObjYTcgcbZ/dE5S17
         QZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=3nFvTOZud6w6W7l+Hz3Ga0TTVdrK68nBRBNoFsVUc+w=;
        b=I4rS1ZP/1RmY4C4YM93v70C+b6y4rnGeVVES8zusSzVDEcnlT4DCobYyy7es11VclI
         eUF/GsGEz3eUh3eo6kmPIY4hj7JfS9Xz9MlTvBkR3d2CoarfaSfx/kFHYQr0wO8kIh1N
         icZo5XttxdIDg+W4UlzZ9NeeMg2/HIAJ8mVzapF7nEQlwroAXV0/x7wBoLjx0BXtx87Y
         Nka6z7gTkGCT3kTvz9h6FisMa14pZvUWHfDpPplwRV95pNMm5DMdaIKMIIcw2m0ewBnK
         2S+ZCnsVr8UVeCOmRQoG0y9mvNh0m8SACpRp46uWbtypOIj1l1T/QAbuqY480hCPV5z1
         O36Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si3692148qkb.247.2017.09.27.00.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 00:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx6MG-0002bN-HD
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 03:02:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dx6M1-0002WR-QI
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 03:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dx6Lw-0000KR-7G
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 03:01:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dx6Lw-0000Jv-1C; Wed, 27 Sep 2017 03:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2707F883CE;
	Wed, 27 Sep 2017 07:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2707F883CE
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=peterx@redhat.com
Received: from pxdev.xzpeter.org (ovpn-12-134.pek2.redhat.com [10.72.12.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E75617E672;
	Wed, 27 Sep 2017 07:01:35 +0000 (UTC)
Date: Wed, 27 Sep 2017 15:01:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>
Message-ID: <20170927070133.GB25011@pxdev.xzpeter.org>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<AM5PR0401MB25458FFED2D7D405A71F954C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM5PR0401MB25458FFED2D7D405A71F954C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 27 Sep 2017 07:01:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DertXcb+S+Ut

On Wed, Sep 27, 2017 at 06:46:18AM +0000, Bharat Bhushan wrote:
> Hi Peter,

Hi, Bharat!

> 
> While vfio with virtio-iommu I observed one issue,  When virtio-iommu device exists but guest kernel does not have virtio-iommu driver (not enabled in Config) then IOMMU faults are reported on host.
> 
> This is because no mapping is created in IOMMU, not even default
guest-physical to real-physical. While looking at vfio_listener_region_add(), it does not create initial mapping in IOMMU and relies on guest to create mapping. Is this something known or I am missing something?

For VT-d, the trick is played using dynamic IOMMU memory region.
Please refer to commit 558e0024a428 ("intel_iommu: allow dynamic
switch of IOMMU region") for more information.

The whole idea is that, the IOMMU region will not be enabled only if
the guest enables that explicitly for the device.  Otherwise (for your
case, when guest driver is not loaded at all), the IOMMU region is by
default off, then the default GPA region will be used to build up the
mapping (just like when we don't have vIOMMU at all).  Thanks,

-- 
Peter Xu
