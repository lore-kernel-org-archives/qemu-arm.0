Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4527150lfg;
        Tue, 11 May 2021 18:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKiOnxaPsVKosD82UzA0FoSFknVt+6aXJ0FNOzRtI3kJs2obLcahEvqzYHoVtCiAQ/wTUT
X-Received: by 2002:a5e:a704:: with SMTP id b4mr25234100iod.35.1620783878783;
        Tue, 11 May 2021 18:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620783878; cv=none;
        d=google.com; s=arc-20160816;
        b=OpKy+0gCmg01gnFvuU9PSVYiDGHGWk0AhaTkurgufvgwyRDEVLH7kWsjFRTCLwQAhZ
         Ke4LBunJoLkiGALgZ9JygChhEvyDqOYd6mmbCrKEZHUcwPHb+7XeKD8mzAMtkAbzBEbx
         6hASF+nuIFcfq/bBU+fFBsBRHHPjQwQ7AbEfikN6dJz/kBjlR021ly/o4GZC6J8KdArU
         +JYk0D73vp1kD6jVO5wttC8DF0pE/k6RQJOy2v+gqw6BRHBb3lXVbADv4Cp9mySM+mb2
         VXhKhaoVVzgeBowQexjzyarq1nfpwYkWAxqkINWL52BEW+a3OO+P4XBsRLHTnhpcw26Z
         gHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=pR0qdDUhawCB28zxQkJhOGac/ZPzzb8BO3NuvaNrF58=;
        b=IGOmruEPQ+k8uMcqlizYZjqMASOt8jRKuhiTAliccsIzF7cUM2DzMEiHtRdifH922W
         lcPTNYciO4zpDcR/IMNfy+sViWVmdCKjPRwDR6vfat5VylBVbzxYSB5XtsS7yIpFl3aH
         N+MDFKs7cLjU+QGlvje04k34IQXuACopgftNYgZV6TN6SZw8Q8MOLT2hrFLXcFiv+Ip8
         VyBYXmKehDtqZmRKC4Nk1NFfLb4dyXyhnlRWZDZiRnS9O5IdkmIeHrHi8ldhpySoOSXq
         e0V1ReRoyYaVxuaBcQHSpUmX8m0uI4xmsXhm8MvU8PXO3KAJd8GzdpPas4rWKMksM6WT
         fM9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si19575190ioh.105.2021.05.11.18.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 18:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgdvS-0007hC-41
	for alex.bennee@linaro.org; Tue, 11 May 2021 21:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lgdvJ-0007gy-GS; Tue, 11 May 2021 21:44:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lgdvF-0007FB-9g; Tue, 11 May 2021 21:44:29 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfyF66mxRz1BHvl;
 Wed, 12 May 2021 09:41:30 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 09:44:03 +0800
Subject: Re: GICv3 for MTTCG
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4aa792d6-96d5-45db-39eb-08885323a80e@huawei.com>
Date: Wed, 12 May 2021 09:44:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1f157423cc544731beb743287a4be5cb@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, shashi.mallela@linaro.org,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sZ+b6kVVLEWY

[+Shashi]

On 2021/5/12 1:51, Andrey Shinkevich wrote:
> Dear colleagues,
> 
> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 host.
> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
> 
> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
> 
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me. It would allow to
> increase the limit of CPUs and accelerate the MTTCG performance on a
> multiple core hypervisor.
> I have got an idea to implement the Interrupt Translation Service (ITS)
> for using by MTTCG for ARM architecture.
> 
> Do you find that idea useful and feasible?
> If yes, how much time do you estimate for such a project to complete by
> one developer?
> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?

Are you looking for something like that [*]? I think it has been on the
list for a while.

[*] https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html


Zenghui
