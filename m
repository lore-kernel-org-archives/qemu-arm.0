Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4840790ejb;
        Tue, 20 Dec 2022 19:29:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3S6qQkJLjCzEO+t0FgQD31y4YtcyjGI8KjtKGK4HRriiGXMV1IIiDLbFF/+5BFjlhkB9g
X-Received: by 2002:a05:622a:909:b0:3a7:ffe0:7a59 with SMTP id bx9-20020a05622a090900b003a7ffe07a59mr259442qtb.54.1671593342177;
        Tue, 20 Dec 2022 19:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671593342; cv=none;
        d=google.com; s=arc-20160816;
        b=FNFeVhV1IEJtFbpezyEIgLfEysAVwYz0KxOgQwY1s3RTDed6fAohMth0Y0AFGxHaVO
         ZGk32t9PIi4Dw2c0S1ckzBfUtB4hc/REp8fT2PhTQM3FlOT6jtQx4Iu6UTRm6FSfJPka
         7yh5dz5bht7xCknfAKAn19FaDR/SO8F1eToAklevoxmIvXVXnPuN9p1voAnf7fEBOrHA
         5tqYZN93HE7Rmsfy47ZjxscBHpof9okMaquy2blDgd7Xn7AgIE6fFHsdrhJNiXsIWy3M
         kVmFx1TnAI+gfwQhnOUZTjW5bB8/XIo9y5sY1Kbxq709IczCBY8QLMe0V2hKrYjvq2CT
         cleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=12EKnBFgw7nvk1S/BQcZxavjWSufMYFEQMF3MdQMeas=;
        b=gByrhOrsU9vPB2sxR4osRA4K4aasFw+L3nGh8ZCEZZ41fQf0AwAShCOS84WlfqdMYA
         EG1mA9Z0gINCUSwZCXUhGkRXyxkgpcWwbbDdI/beWBx3GeKuibOBshXFxqQuAbklw030
         cNI0OIM4cWYBXs4fYWaDRYW606zBnYS72J1bEkhQaCv4uJgsxtGcebLRndgNK+8RLHCZ
         Vuc7OesIC5DHJl4gm5S10MUzkoL4FtdlDqubGFB2OBIQTv7LVAFjRYkdmaOWBmyYOfVJ
         DUSzRinfFn7SeyMR5csztiQ7N1McrraAyKiGdjLJReBlLHpdmLF5Km5wJZtWMImeLFHs
         7dgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020ac873cc000000b0039c721f7fcasi5736823qtp.624.2022.12.20.19.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 19:29:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7pmT-0001xa-Qj; Tue, 20 Dec 2022 22:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7pmR-0001xB-Ds; Tue, 20 Dec 2022 22:28:31 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7pmO-0004yA-V9; Tue, 20 Dec 2022 22:28:31 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NcJlh01YlzmWTH;
 Wed, 21 Dec 2022 11:27:11 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 21 Dec 2022 11:28:19 +0800
Subject: Re: [PATCH 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, Eric Auger <eric.auger@redhat.com>
References: <20221220230414.47876-1-agraf@csgraf.de>
Message-ID: <8d1dd672-ad60-7095-0d4e-7513cedf1a87@huawei.com>
Date: Wed, 21 Dec 2022 11:28:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221220230414.47876-1-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PSGIM5MjZCZ0

[ +Eric who wrote finalize_gic_version() ]

On 2022/12/21 7:04, Alexander Graf wrote:
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
> 
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
> 
> Alex
> 
> Alexander Graf (2):
>   hw/arm/virt: Consolidate GIC finalize logic
>   hw/arm/virt: Make accels in GIC finalize logic explicit
> 
>  hw/arm/virt.c         | 199 ++++++++++++++++++++++--------------------
>  include/hw/arm/virt.h |  12 +--
>  2 files changed, 110 insertions(+), 101 deletions(-)
> 
