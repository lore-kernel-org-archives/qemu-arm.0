Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp953321lfg;
        Thu, 25 Mar 2021 19:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyny34axZmZ9y0ZyQaYVbzae16VBJqOnjF41fwgKUfCwA+F90vxP2nA0iFLMrFhJw6zF90r
X-Received: by 2002:a25:bccb:: with SMTP id l11mr16977346ybm.306.1616725469615;
        Thu, 25 Mar 2021 19:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616725469; cv=none;
        d=google.com; s=arc-20160816;
        b=zvMUyOD6oSiACLq4Q5m8gPA58QQ3PEO0xFnQEjdy3W8qIewHCXVJg6T2sVUmrPU2rg
         h8ZeFzUYrk7Vq7Qqh8kCSC53tEBBE2222BM9gTeYWlF50oo+4esAI5B+f0bAlHIi3RkU
         RJvD4Z+n998yU11ojyC4K0fAmVbDEaTUGeBsIm9aSKymMjNgeymSDdLoEVlBbL5jssIh
         yJM9o5m9yX1ICjyBOrARC7ErtvGc5wiPzgqreUSMtzX/L/ynrg/MtgMYnf8Sl8L13aQy
         K1cwW/c1/K7cQbpiElV3xFP4fZjwWsFhI3ob5tiB6DNYK0o9ECMfm7ijtXtKeVDgn0Aj
         Y78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+iUGmMx/llvIUTjHCEmQ2weKgj2GEwiaKTzEHk2hdJw=;
        b=p8UfFxWDcJzkSw21JGgXqXTYQAHIMFJPnoIcXOZcsjvaAbDzOU5mejVu+pLPTRfMT0
         ++SLNwwDErb/ySA8hK+aLOucfPjoO4Qw1kRSmUHn0iK8buhrVnrX8lw3o2TCsLMNiiBX
         JaCAhhr6wcYveFoe8OZA0lAco3n9TRSDf3mTttsgSwhDT/8YCCjw+9qIE507FS0OeGZY
         K/ZGj3rujrzBHeqxEeRUYLFzIHUO3o9Dil0EeI6atC2g9tJnscWinoe5TqtA9LxAjq8E
         RZ1gud/0MT1sCF9gKppU/b3fwK7FmtTnApOACWuhnPP/irF6dh00/MwKPNAnjHEpJyt0
         qV1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b38si7300138ybi.194.2021.03.25.19.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 19:24:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPc9E-0004va-RT
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 22:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPc94-0004uF-8Z; Thu, 25 Mar 2021 22:24:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPc91-0007xu-9i; Thu, 25 Mar 2021 22:24:17 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F65Md1MwGz19JZG;
 Fri, 26 Mar 2021 10:22:05 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 10:23:59 +0800
Subject: Re: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <mst@redhat.com>, <jean-philippe@linaro.org>, <peterx@redhat.com>,
 <jasowang@redhat.com>, <pbonzini@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-7-eric.auger@redhat.com>
 <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
 <7a616c80-be1e-3c1d-2192-c8f4662760aa@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <ce3b5301-21ab-39af-db73-c0dffda9b386@huawei.com>
Date: Fri, 26 Mar 2021 10:23:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7a616c80-be1e-3c1d-2192-c8f4662760aa@redhat.com>
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSSJtCRpWjji

On 2021/3/25 23:09, Auger Eric wrote:
> Hi Zenghui,
> 
> On 3/25/21 3:18 PM, Zenghui Yu wrote:
>> which seems to be some bits that we had never taken into account. And
>> what I'm saying is roughly something like below (compile tested), any
>> thoughts?

[...]

> Thanks for spotting this discrepancy with the spec. This looks good to
> me, please feel free to then the patch.

Okay, I'll have a patch for that. Thanks Eric.


Zenghui
