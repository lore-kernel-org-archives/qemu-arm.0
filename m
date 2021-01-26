Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1091141lfd;
        Mon, 25 Jan 2021 22:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+bG1Mw+EfDe7AhKXMQypJ/uLljPx1RnKQSc8ylfhT4X3EaYHORoCWU4890QsSfydvXOmo
X-Received: by 2002:a25:c142:: with SMTP id r63mr6135687ybf.468.1611641614597;
        Mon, 25 Jan 2021 22:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611641614; cv=none;
        d=google.com; s=arc-20160816;
        b=blH3TFLIGZOUuN2eNGm9fi0ro/D0GcF/ODJx1/mBBFZh2gotz+X9vbZtN8BQs8vWMS
         P6E+ZPjXB1CwchrQPvpqT2/5vNvmDzi5aqYmmBoMmhbae1qxKIwWZgyBe07KWnYQKAZv
         G6+LBVSOdb2z/9pgxTg3Y36m9CEsN6uQAM2qyA6QVu4GywuDorvbCNKfJwOigfGfKq7Y
         OdLd3Qa7pZ6tmx0uo4ogQ9COXhl49sUUCn3TqHdAjQ3QtU60Rh4d+OQ2hMq6ED4T+mo+
         I4U7IW6WYWbawcZbQuF0iLU8MWArCWO6HTx9dOr5E+Sth4yHq5nGVZ0cwfRRJP6XPgC8
         5ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=CsvfrXpT9lFrXbb5iKxguc7MjT66Qndg/dGdb8vXonA=;
        b=NMBYaHFVF8A3P2blfflhnt932gC+iMwJoGq/1b/QrL9eM7rG2gmuCNZ/0drztbdZES
         1zSay1GRTYPwa7O4pCc1uB3XV9qLDdIWJn2fiklGT/n4c3cjh8/i6xdKOkFa7EIdiGQf
         k/SZc8k++zSgpb2yXjNyj+spnChak19+nr3frBc5W5KWAxdOC5eX75ooWm6+ft/FTSJs
         huqJI21MnidD/34SQm2iuj/Fh/4PwKwhwoQ30KHbbxWosfS09VMDvrjVUgwWotf13sds
         +mKYvbxq/hh0CzK9sCiuWe6Jl/YKF6fmCNwoRQi1vi75+NQrlYNLQ6WcVdHCfS6res1v
         Ve7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si22616797ybi.151.2021.01.25.22.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 22:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4Hba-00067W-1f
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 01:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4HSc-0005gO-BA; Tue, 26 Jan 2021 01:04:18 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4HSZ-0002fl-PW; Tue, 26 Jan 2021 01:04:17 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DPx3t1fYbzjCLX;
 Tue, 26 Jan 2021 14:03:06 +0800 (CST)
Received: from [10.174.186.182] (10.174.186.182) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 14:03:55 +0800
Subject: Re: [RFC PATCH v2 0/3] vfio: Some fixes and optimizations for VFIO
 migration
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <76b14984-3574-6093-238a-9b9eb4b2ef2d@huawei.com>
Date: Tue, 26 Jan 2021 14:03:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201209080919.156-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.182]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lushenming@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8NEpHTfU4FU/

On 2020/12/9 16:09, Shenming Lu wrote:
> This patch set includes two fixes and one optimization for VFIO migration
> as blew:
> Patch 1-2:
> - Fix two ordering problems in migration.
> 
> Patch 3:
> - Optimize the enabling process of the MSI-X vectors in migration.
> 

Hi,

Friendly ping, is there any further comments on this series (especially
for patch 1 and 3)?  :-)

Thanks,
Shenming

> 
> Shenming Lu (3):
>   vfio: Move the saving of the config space to the right place in VFIO
>     migration
>   vfio: Set the priority of the VFIO VM state change handler explicitly
>   vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration
> 
>  hw/pci/msix.c         | 17 +++++++++++++++++
>  hw/vfio/migration.c   | 28 +++++++++++++++++-----------
>  hw/vfio/pci.c         | 10 ++++++++--
>  include/hw/pci/msix.h |  2 ++
>  4 files changed, 44 insertions(+), 13 deletions(-)
> 
