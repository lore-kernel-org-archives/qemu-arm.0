Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1075255lfc;
        Wed, 10 Feb 2021 00:19:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxailORKWXcq0w4Jil6n5a6CIFb0lOoClM4Xi7O+Q9RmCil1c9fDOiValk2/AQ1iZ7MT5Xp
X-Received: by 2002:a25:aa6d:: with SMTP id s100mr2882521ybi.523.1612945169673;
        Wed, 10 Feb 2021 00:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612945169; cv=none;
        d=google.com; s=arc-20160816;
        b=KSBWFcJtHpMq0i/mZvN6agSx3fjh0c/OD7QrGHvCrHKcSGzryNaU5stKkwV6kgt5px
         1UzLDOLGVNwxrM+HHcKM1EOGEZgvFqLpl2nJq5C2Xa9Mc4XzgDB4QO80T0zYyCzrDsEc
         +lCuz4AeD2NnhJTxg8Se9WF1Jdn/9YT1y68SUVci5g2DaNGvzNi8oSqtmRQvNmuFrNjF
         WuSR/3Z/TgFXZsTdNetpaSo5u/zNmtFOHx5t7ZysHIU6YGerdgmfCSFyhPyO2WXiVMFv
         zhmc70l8xvSIHw4K+nceHd2ul5760bennA/vXECxdrGJ8KrovnxG/Rp5naNX09C05MIP
         ZbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=HXwZYNuiLcuplBdQMLTVU5vXdxJ+odNddL8BW8oPskc=;
        b=SsOs/0gGSV8Oua7/CEjvlj3HN5R/6LzCddl/qNlDS0Jo8Ftj5WhLutGo4jYSbmBi7J
         MBHjcvWUg+I2QE7Y5phSGVa9eU4dIzcp17ErxmDPIGKldqncZBarNOYVGttpJP6ItTbg
         Zc7xTDj23B0bTlU/pi4E0HfSlj0R4yOAP7M4UAP4JOk9BS0IZQZTpm2oocCERRsR5wTx
         XReWzOBmlCJLvsh5vrKuCEwAqvEuFL7sZskCn7dbunbBYZgloBoPAf9TtGFTHU4jGOPV
         6IRsArgLxNBCnzSc/46QdxLTLv5OtWon8ea8YKXiABlG7Ch16fcWzJx1Z9CwUKI1Gawm
         x5tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si1291817ybk.425.2021.02.10.00.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9kif-0004vm-3v
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 03:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l9kiX-0004vQ-Tn
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:19:21 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:43016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l9kiV-0001br-Vx
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:19:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D25F323D715;
 Wed, 10 Feb 2021 09:19:14 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Feb
 2021 09:19:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063e77de5e-0d06-48db-922a-fabcd627fd6a,
 CA44D9D1C99DDC6070F74A114A21469C6A1097AD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 10 Feb 2021 09:19:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
Message-ID: <20210210091912.3ea5159d@bahia.lan>
In-Reply-To: <20210209213233.40985-3-eric.auger@redhat.com>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: bdeef48c-a0f2-48d1-a996-25cc4f54da2f
X-Ovh-Tracer-Id: 10881259653352692216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrheeigdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhigsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: olxgpur31xum

On Tue,  9 Feb 2021 22:32:33 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Previous work on dev-iotlb message broke spapr_iommu/vhost integration
> as it did for SMMU and virtio-iommu. The spapr_iommu currently
> only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
> VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
> and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
> spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> registration.
> 
> Reported-by: Peter Xu <peterx@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 30352df00e..24537ffcbd 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      struct SpaprTceTable *tbl = container_of(iommu, SpaprTceTable, iommu);
>  
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "spart_tce does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>      if (old == IOMMU_NOTIFIER_NONE && new != IOMMU_NOTIFIER_NONE) {
>          spapr_tce_set_need_vfio(tbl, true);
>      } else if (old != IOMMU_NOTIFIER_NONE && new == IOMMU_NOTIFIER_NONE) {

