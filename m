Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp490866lfc;
        Wed, 11 Mar 2020 01:46:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvO6Vu9y641nKtwLrusZN9zWlQ68Ex8z+eR/yaF0iYhWPIKHvhniPobyIRspID1I1w5kRNP
X-Received: by 2002:aca:57cd:: with SMTP id l196mr142927oib.1.1583916406652;
        Wed, 11 Mar 2020 01:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583916406; cv=none;
        d=google.com; s=arc-20160816;
        b=v4O9t2G6nviJvXZlIBVvSxUM6ijK9khFbZjQJYvLvqHZEwSPN79ZycKB9A6rVUYMbg
         8SuGpOUX17xgUbvYF7PV+N6otO/J4bM3TKYotNbYzyMm6hMSS8mR6xA5VIPOb/vppXOY
         ooUPdRy9dtVrO4bPvLQtVRgW0acUZfqUWqCQrOxOai+zt1VRrs7rUcxc7xm/+QOfciXk
         CGbwB5vBYBFQi+NHJyBT/itfn9GBoQqbxhvSuxft6sXE2gfkJfLoNlP4BVwy21hS3l2w
         PYCRVc0epwrJRqCspvIGK8wOavjMg4wKzJ8lQKUIXSdUX+5VXACH899dXY5cVdaY2UmC
         vbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=NZNKlYpkkHtqjJa65T7x6/2NM9EbUeR6Og9RK6XVT88=;
        b=R0ecWQDoOagfUpG0a4dO80v9AxRJ6/0TB7IgRAaQSz0y4HZeWGTw9w/WRlroSaVeQZ
         sud43aFpkZQ9zzGT+vXIiY7089E333RMZf+ym/S+Qi2o947kzyQPCOZON3m3tGaSb6wR
         yVAzqbsjTY5crG+IU3zdN5BBxI6k7L32nZigPGzO0Fw98StOPuefIeZj+rfMpx2E6A8W
         rBbCfRvOX+KFeKy/6rTWHgPifyV6/Ymyxq5kfhetNEDP5quOn+ErECpvyR8SF/LcVaqg
         QY7ML9o3cN7tFuK7j4gGf8+0TK9K7ntSw04z2ORo/0TUVDGcG8FdcK4we+5esY12be4k
         PTxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b21si871780otp.79.2020.03.11.01.46.45;
        Wed, 11 Mar 2020 01:46:46 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgCKIqn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 11 Mar 2020 04:46:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:11659 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728122AbgCKIqn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 11 Mar 2020 04:46:43 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BA91D104182C4D7121A1;
        Wed, 11 Mar 2020 16:46:34 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Mar 2020
 16:46:25 +0800
Subject: Re: [kvm-unit-tests PATCH v5 07/13] arm/arm64: ITS:
 its_enable_defaults
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
 <20200310145410.26308-8-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <59c072ae-c779-8e6e-7c22-427e087b4b64@huawei.com>
Date:   Wed, 11 Mar 2020 16:46:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200310145410.26308-8-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: B7uT/RO4hJ+6

On 2020/3/10 22:54, Eric Auger wrote:
> its_enable_defaults() enable LPIs at distributor level

redistributor level

> and ITS level.
> 
> gicv3_enable_defaults must be called before.
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>


Thanks
