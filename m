Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4203947lfg;
        Mon, 1 Mar 2021 22:06:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7vSSnoussXBgzcZ5s4YMI1XFBt+oIxqEPWT4lEivYzkQIH4IWFYRrRABnACfV8jprDRHu
X-Received: by 2002:a6b:7501:: with SMTP id l1mr16526621ioh.92.1614665190669;
        Mon, 01 Mar 2021 22:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614665190; cv=none;
        d=google.com; s=arc-20160816;
        b=PN2+b7yrKiUSEDz54xIla4U49AYDXq+V8tlpPnLfVKyUoinddzSx9HPIJ/Z7PoPSYb
         OqewVrZRsxpBKn0ek4d1PSRJoVM9Kv/ivdyIVtojPjeToy74D6d0FT/F/lJAQE9kPsZp
         qETtQ9EE1rm6CRS5Vw9Cbe0mpV2AbmgR28/8Vb0MCZzWteEzP2CaYuJCWpBP2QsI6DgN
         JDXP3zT+yrwFZb2nz/qWz+wVpvsMlRTVTOTBZMVxeDmDNg1sN3Z0OaGHxc4YGpEz2Pia
         M4J01b8OrlyO7+1jmlX97numEcldapk23PhTuYFRZuONrvGKjse1mE9J8GjX2UPEY7C4
         Vf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=jVPyF+rptL5LA4PA3DKU9LUzkV2GQMXqJssPPB1ci+4=;
        b=gnRxj+ez1/iD/N60msMUjQjr2uCFCJRVXrx/PnjknWtNAvdNljLW6A9md2ecvC4IQL
         OLF07o1PZ+6fYDjzoEsUnhnATB073sXyObbnjqE4F3qtwDwOZoc66v3E2HfmPGJYkMy8
         Ip8RnRpPKZ20WXRV00IIzkTDxWhY3ef6OOffhDROmU7uLgzBNKPQgpuK42Kt+nOxOW18
         kPfd3F/iTWv4jXZtQ1ICsaVKMAuHFlbIxXROGY9plXfRK+4zY8foguNxKbbYPw8mRvuG
         PW7AZiiYHLBJxdkva9V4PRt97gwo+pwxcyeQMjFDlG7AXQEdKO79wx/8ilHxiG26GjIF
         yN/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si17996869ilo.43.2021.03.01.22.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 22:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGyAv-0007Od-VD
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 01:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lGy3u-0007dg-Cy; Tue, 02 Mar 2021 00:59:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lGy3q-00041G-SU; Tue, 02 Mar 2021 00:59:13 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DqRH33sjgz16DkT;
 Tue,  2 Mar 2021 13:57:19 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 13:58:50 +0800
Subject: Re: [PATCH v3 0/3] vfio: Some fixes and optimizations for VFIO
 migration
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210223022225.50-1-lushenming@huawei.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <ec7d48cc-d3b1-efd6-a483-cf6e151bf9a7@huawei.com>
Date: Tue, 2 Mar 2021 13:58:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210223022225.50-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 38WYoFBZ/zXF

Hi Alex,

Does this series need any further modification? Wish you can pick it up. :-)

On 2021/2/23 10:22, Shenming Lu wrote:
> This patch set includes two fixes and one optimization for VFIO migration
> as blew:
> 
> Patch 1-2:
> - Fix two ordering problems in migration.
> 
> Patch 3:
> - Optimize the enabling process of the MSI-X vectors in migration.
> 
> History:
> 
> v2 -> v3:
> - Nit fixes.
> - Set error in migration stream for migration to fail in Patch 1.
> - Tested Patch 3 with a Windows guest.
> 
> Thanks,
> Shenming
> 
> 
> Shenming Lu (3):
>   vfio: Move the saving of the config space to the right place in VFIO
>     migration
>   vfio: Set the priority of the VFIO VM state change handler explicitly
>   vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration
> 
>  hw/pci/msix.c         |  2 +-
>  hw/vfio/migration.c   | 28 +++++++++++++++++-----------
>  hw/vfio/pci.c         | 20 +++++++++++++++++---
>  include/hw/pci/msix.h |  1 +
>  4 files changed, 36 insertions(+), 15 deletions(-)
> 
