Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2491713dyb;
        Mon, 23 Jun 2025 04:49:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVISkQnBPO6Lv3uweJGtYhG0LfJrr3B41JIY+l5Yhn5NDniMLPM76fUYZ675svFYPbQrwabPmaE4PFt8g==@linaro.org
X-Google-Smtp-Source: AGHT+IEhGOhx0iiV1OcU0lS5OAOuLILnG7sFQuEP9QUvlMrnc+/qPhToATekOdxXNWAP6blvw0Lh
X-Received: by 2002:a05:620a:bc1:b0:7d1:fc53:c6b2 with SMTP id af79cd13be357-7d3f9939f14mr1781345085a.41.1750679383548;
        Mon, 23 Jun 2025 04:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679383; cv=none;
        d=google.com; s=arc-20240605;
        b=GOVyedIVYLFlLOjHOA/Vmja6feOCc3PDPeTtg4egOhJWkYO9Z8Zc+YZHgPALmTaMYz
         +6eHU3f1r97qW6cgcu0/eUYYgh+2uArI5877c3zCptxV3WdlluNwfdBS6Wsr//Zsxzs5
         bGGeeJs+OOrIT5TDvUrZlxBXCRMW18QYJARpjBRAaSiM+NB6roQgVvSG2uR+NmShKJUq
         0H/yKtHcZVvyQk+QwaSRTpl6/nurNE0NDIQY0uckHmLWoybV/aK7sUBYZ7u1VcJp1E3M
         bm+lkhQQvr91BoNB25UZdjDM8uttLQGwDV/FetK5PHo5Rjc0zgVncNASq1C57le96JwC
         aWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=I8M6VHgIpkKKEd4z+LKhkuzXH+9SLp7ACrf83RFSVEg=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=OVX3OW55e25/JxaRDtvkwCzr1yVrsa+1LL+6gYiCtbxm2Z139BorBo7U7ffFrHb7K7
         kJAnXcdzAiHz7dj+/Jg4gPwWOgdAXL3P3n4SZCFjUS+h8EfKrWYvBboeODvVEP44TYOD
         2FRj9969CnGfztfXvvsPLzm5gfCu2EVI/qPGxVMKOPRnLW9QKDX+rrBrHkuZd+pfq3ek
         pxfodcljuZBoX//+fCJiHiWDyd4QZioIJ2hjjl9f/vDSJQHz9kYa/MQXpKANXZErvvEb
         p9S/jdhRZqNj/cBhqBAt64T6Y3ggQA4toTrz1PONSAFyeAEpfDcv2i78f5nT2C+GmJNz
         Xz2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a2572asi719301385a.625.2025.06.23.04.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uTfg1-00087n-BM; Mon, 23 Jun 2025 07:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTffz-00086q-0j; Mon, 23 Jun 2025 07:49:27 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTffx-0004df-3t; Mon, 23 Jun 2025 07:49:26 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQmT604f6z6L5h2;
 Mon, 23 Jun 2025 19:44:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 09EB21402EF;
 Mon, 23 Jun 2025 19:49:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 13:49:21 +0200
Date: Mon, 23 Jun 2025 12:49:19 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 09/11] bios-tables-test: Allow for smmuv3 test data.
Message-ID: <20250623124807.00002bb6@huawei.com>
In-Reply-To: <20250623094230.76084-10-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p3qWPAS+aQ6n

On Mon, 23 Jun 2025 10:42:28 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> The tests to be added exercises both legacy(iommu=smmuv3) and new
> -device arm-smmuv3,.. cases.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
