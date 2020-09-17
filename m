Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp624976lfq;
        Thu, 17 Sep 2020 07:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcsyIi02fqaxm8Fq9tTs2DSiUnEL/JcZqu64knbuloxtsGjRDkQitpzV66JfgSEtDYQn7J
X-Received: by 2002:a25:a482:: with SMTP id g2mr12144269ybi.371.1600352430388;
        Thu, 17 Sep 2020 07:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600352430; cv=none;
        d=google.com; s=arc-20160816;
        b=ig03vX5Wc07rfOWE7Ulwk7X2tQF4mb1eW2qdCQoTg9hsE8zcW2DNyVqfsOCNjF8f6V
         S6WDVbmBUDvpUJ5grTPLSMKJR+hKaBo+45XEPVCBIXMF/h3sQtAk7yuuc2RJzbZCvW56
         N2qwpAmAt10ClT5Tvv59cOoEYZknbECCoYXIKw6iaiHPcalL26KCOnzK6NvwkZT4wGGN
         ueLEIBzhVuyqSB7f3ZxWUBvKfHTPLQabQqdSMmklEAJBFgeNPEaOw3j/vPngsdAc8FRB
         JUDa8Ge7bnij/9Tigt9DNw4fheKmDH6Y//+wkbF+Agh0UsIh0RVvm6Oy7NTQgYR9LaHo
         fMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0b1zyzqFrBiC7bAzZHLbkJVbfBRGxFEJ3gnC6WR8h0g=;
        b=em7d3OQB+xJFVEnPeHUhuOu+l/zKXhCXC/b+G6wB++arNM3J90Pf8M1XFIdseM79yZ
         mwryYP+uCVPLqG83aI9AJKDAnfg1jcldYAQh5O0GylR49MfzPBjySGP3NVmuxRNV6tFO
         1V06Jy1TiiRLy+U0ZEtW4R7CvLl7Cf71eNhuTVFYJ+hF/g/3fQnBJAgEpOGq1ZXsP3Hi
         eyTUncF4Ib/7/gFwP+P9j5q17j+M0VLL2IRyjVpj6MXG4aRu0+tqRBFF9dGQ8q29U2ug
         VrmCqen8J8wHGEsJcc8Ze2Cz2x6HVAJ6kJYk4dLUJj+7IgKhvLTlLe1mTnrRKrW5S5Iz
         IaWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si18651934ybm.264.2020.09.17.07.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 07:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIulx-0001Bi-GV
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 10:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIudE-0005iO-7V; Thu, 17 Sep 2020 10:11:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41306 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIudB-0001on-IA; Thu, 17 Sep 2020 10:11:27 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4A5032FBC6CE97CD6C11;
 Thu, 17 Sep 2020 22:11:14 +0800 (CST)
Received: from [10.174.185.104] (10.174.185.104) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 22:11:07 +0800
Subject: Re: [RFC PATCH 09/12] target/arm/cpu: Add CPU cache description for
 arm
To: Andrew Jones <drjones@redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-10-fangying1@huawei.com>
 <20200917083929.uv2oukokqmiykfs5@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <4e2f68a2-5726-9dc3-70b8-9ce02f5f642f@huawei.com>
Date: Thu, 17 Sep 2020 22:11:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200917083929.uv2oukokqmiykfs5@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e2Ju3kPzb2+q



On 9/17/2020 4:39 PM, Andrew Jones wrote:
> On Thu, Sep 17, 2020 at 11:20:30AM +0800, Ying Fang wrote:
>> Add the CPUCacheInfo structure to hold CPU cache information for ARM cpus.
>> A classic three level cache topology is used here. The default cache
>> capacity is given and userspace can overwrite these values.
> 
> Doesn't TCG already have some sort of fake cache hierarchy? If so, then

TCG may have some sort of fake cache hierarchy via CCSIDR.

> we shouldn't be adding another one, we should be simply describing the
> one we already have. For KVM, we shouldn't describe anything other than
> what is actually on the host.

Yes, I agreed. Cache capacity should be the with host otherwise it may
have bad impact on guest performance, we can do that by query from the
host and make cache capacity configurable from userspace.

Dario Faggioli is going to give a talk about it in KVM forum [1].

[1] 
https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse?iframe=no&w=100%&sidebar=yes&bg=no

Thanks.

> 
> drew
> 
> .
> 
