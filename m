Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3998295ejc;
        Wed, 11 Jan 2023 05:37:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXum1QjaAH/WlcMHwFJECvgNZdFnIKVLkjrbnmyVmkYchIAIHEG9lqJYixRbwyi4pGGybjpJ
X-Received: by 2002:a0c:f9c1:0:b0:531:8783:78dc with SMTP id j1-20020a0cf9c1000000b00531878378dcmr3752076qvo.10.1673444246608;
        Wed, 11 Jan 2023 05:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673444246; cv=none;
        d=google.com; s=arc-20160816;
        b=skkJ7PbSHIi3eIMREYnEiyI8Mj4DFcHbBF8fBOC8CQckkvUrbwkURd1DPAUCXFwNPH
         gMB+fa2t5Gd8B7rjB915S+jCYFYc8dlP+2PCD/kh4e8ugmXIEeQ2kxr8rlSY1qFv8A2j
         r86Mo0bv33BMlyW5WJpjIMkGD/6ZFsO42Gi8oKeDZ2RYEW+L3axHjbuzYdk34q0iZGS6
         Qi/6x1Xn5bWd6P35OslpekCvoQEqVvZoCM0lJSxoKUVjX4NgCR0D2JpbkMLQRoU/dv/+
         IMasnDGLYsisNpG692LJzuKCcMTTPh+B55s+FdpKIEauS3UNjFz5z6GOR6kS86B+mmN2
         O8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=sFSCrj1LKarEKJ3dX644Y8cdk8T6Y30CQpmJ87chH+M=;
        b=DNy2+WEzVhkiiwveW1a9bT5NgYj3FDIK8/+qbrUyBO4zJvkYu+5lO90/RG5y4pc2ou
         UoiTboeB8vMZM9lDOGB66t+vVIdFWpuxXZwNF1MVIjD8sw7Qn1vazGpvxczuBw/AFRau
         5hyhTBmg6M8kiUW4VsatTImXMG098k8LJsSYrcD0edRuznFnUS+o+GTj1lQxdpzC1+qU
         udxcX6mNbxK28XUAxz8SSa6kTUB1egC6nmLt0wUwoYOhfEcztQyIhHgKHStFZM29L1zC
         nuVQusA5Ze966sAmdkli8fvWm1Vy2hf2eqN1BSfZ7Ek7bYCFHUCx4YaoXezrCjUihfgv
         DWOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv6-20020ad45ce6000000b004c79462a125si7727190qvb.334.2023.01.11.05.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 05:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFbGi-0007s1-0g; Wed, 11 Jan 2023 08:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pFbGg-0007rY-Gd; Wed, 11 Jan 2023 08:35:50 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pFbGd-0003nU-KZ; Wed, 11 Jan 2023 08:35:49 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NsT8R6X13zqV6W;
 Wed, 11 Jan 2023 21:30:47 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 21:35:33 +0800
Subject: Re: [PATCH v3 1/2] hw/arm/virt: Consolidate GIC finalize logic
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cornelia Huck
 <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-2-agraf@csgraf.de>
Message-ID: <bcd01f67-ebe4-508d-18aa-94f6103c63b8@huawei.com>
Date: Wed, 11 Jan 2023 21:35:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221223090107.98888-2-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WAVbcnpihNWX

On 2022/12/23 17:01, Alexander Graf wrote:
> Up to now, the finalize_gic_version() code open coded what is essentially
> a support bitmap match between host/emulation environment and desired
> target GIC type.
> 
> This open coding leads to undesirable side effects. For example, a VM with
> KVM and -smp 10 will automatically choose GICv3 while the same command
> line with TCG will stay on GICv2 and fail the launch.
> 
> This patch combines the TCG and KVM matching code paths by making
> everything a 2 pass process. First, we determine which GIC versions the
> current environment is able to support, then we go through a single
> state machine to determine which target GIC mode that means for us.
> 
> After this patch, the only user noticable changes should be consolidated
> error messages as well as TCG -M virt supporting -smp > 8 automatically.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Looks good,

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
