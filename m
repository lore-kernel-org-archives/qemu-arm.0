Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp282938lfg;
        Thu, 1 Apr 2021 01:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSqhCCVxhib5x/yv4hAHYmAorddm0xp0mWwelwKvQpdKvtnLxZQtQdHzCln2HcZ6wntu1M
X-Received: by 2002:a05:6602:2102:: with SMTP id x2mr5993428iox.83.1617266612374;
        Thu, 01 Apr 2021 01:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617266612; cv=none;
        d=google.com; s=arc-20160816;
        b=Az/VO7Rq0N5yjLNWoH5BRajGU5PU3qQTx+/t+yGd64jjo/0zJwjq1ffX1fG5mEVlZ1
         I3CFD/dqCS1ikaFv2lYzhlrMTVtvuCtJ/67TLiI1/+EIfy8eC8KHgc+ed8FXtbhi1ZWP
         IOL8OrH74FLs7kEwFjWUun5ccKzuNyyTJ099sq+OkljTn24Ba6MB3iR0egnLs1q/hDvG
         +jTge0x+5NgjGZsUw8EdNvuOJjawtGrVETXr/a+d5LxCAeqgbWgdWOruXuIj8FsAwHlD
         7h6i90SC2Zs28yXSp36vE0bZYsLmviBFj9pmCZZMVHeT+WzNMnVGNqX268eAmFpyVzPq
         Dpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ij0gWq0nYme4eo+ynSTjyBMPKvvXBSE9IbwRbxJohT0=;
        b=p9YC3ksZdVfOpP/HVSeYqCAJNsoRYQ+/G9YHVxCdPgXw3jIe1DjQ4ZxX/ymLPPUVn+
         /sIOxsA6GSSyqn3xah45Fj/BSxcgsCY3/c/8v9gVBnQAxM7Qua9jb3YHYl+hQ+CYfLDf
         Ach0PDTEN3NHCVURGYBFFTXzdf7hR89O4fJQjUTHQA1qs0nmhRMSEirxIYZp6A2obH4x
         bgnLtfC2yZr44kAOucnUqzVmgXcCFDqcGbCYmvEMEl0M8kWChpDfVLBP6KeDaiI6eW+9
         EGF+dl2OtuiCDC1kbCK6yRd9RWRhHp2GlqrWKVhyHbPmXe7Z/Mu0agza5W+vsDlpklpb
         BmXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si4508252ilm.112.2021.04.01.01.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 01:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRsvL-0007hR-G5
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 04:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRsvB-0007ew-LH; Thu, 01 Apr 2021 04:43:21 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRsv3-0008VL-Nq; Thu, 01 Apr 2021 04:43:20 -0400
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F9xV507Xwz5ktx;
 Thu,  1 Apr 2021 16:41:01 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 1 Apr 2021 16:43:06 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 1 Apr 2021 16:43:05 +0800
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
 <20162bd1-b31e-e180-8792-81934e0d005b@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1cddde6a-3338-70f0-1d4c-d6fd5d634bb3@huawei.com>
Date: Thu, 1 Apr 2021 16:43:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20162bd1-b31e-e180-8792-81934e0d005b@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fhbrabcsY0Dy

Hi Paolo,

On 2021/3/31 18:00, Paolo Bonzini wrote:
> On 31/03/21 11:53, Yanan Wang wrote:
>> A cluster means a group of cores that share some resources (e.g. cache)
>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>> share L3 cache data while cores within each cluster share the L2 cache.
>
> Is this different from what we already have with "-smp dies"?
As far as I know, yes. I think they are two architecture concepts of 
different levels.
A cpu socket/package can consist of multiple dies, and each die can 
consist of
multiple clusters, which means dies are parent for clusters. And this 
kind of cpu
hierarchy structure is normal in ARM64 platform.

Still take above ARM64 server chip Kunpeng 920 as an example, there 
totally are
2 sockets, 2 dies in each socket, 6 or 8 clusters in each die, and 4 
cores in each
cluster. Since it also supports NUMA architecture, then each NUMA actually
represents one die.

Although there is already "-smp dies=*" command line parameter for PC 
Machines,
a cluster level can be added for x86 architecture if meaningful and 
there will be more
work to do in qemu to make use of it. And I am sure that ARM needs this 
level.

If there is something wrong above, please correct me, thanks!

Thanks,
Yanan
>
> Paolo
>
> .
