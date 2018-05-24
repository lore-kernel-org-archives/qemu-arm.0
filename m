Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1517589wre;
        Wed, 23 May 2018 23:32:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo0F24Io6gf1XRBONC0adeYI4woQrD6NV9+W+3mypKSqNhKWendETXozndwzWhrgVxKsZf+
X-Received: by 2002:a37:5445:: with SMTP id i66-v6mr5107833qkb.392.1527143541273;
        Wed, 23 May 2018 23:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527143541; cv=none;
        d=google.com; s=arc-20160816;
        b=hohCNcd+k/reqZ1usKOdJNyG44bFJHEKMJH27XODJtj8UTFxrH9E7fefKb7qOjabpE
         0VRO2KU5FYVBwG7iYUG/B6XA4FSKOe0LBUjn/OeJGBvF+mTLChsBSCSK2GkpQJkCAsVR
         glgr4NULebOW4W0gKyjqozdkuaHGeLlbwK2ym8PEF53+voWUpC3UP18mUr+iOM3+d6IN
         S2zK8j6O1/B6CKwSVgwBIf5vxRSo1RNbrUeOi6f0mFUwIRR6vcaYyeaEau+0nKPqPfr5
         K5u9Po6H4ieCdr5jVFaOufKbk+L3FmFcSAwo15WclDiSDKjJqQOOa2z4Vd9poFDCtRp3
         kqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=o/Uo4nXp0Trn4XdIc5YnzXQRNts78tpC40o12uR1e8A=;
        b=mfXX/pWOyGwWh2hangf1n3RIDwpWXbysyypiPYcSPLX29yqEQcj/keAKbTMNfYDfr/
         6o36hrbRcah81hrQ0hTEYSGzKomvh1kiccBC+0YOcpzlQ88q/DkkFz+TWIn5JKDIVkKN
         fa63Twdk5dlre2pZZoLIOl0dddkXm0EodRFQ22tkYKi28CpRF1zU5ibwpYrWIgRhxvrg
         jyUR17IDPIzIqv0+r4HoXea+C4gmJjbGsgjigZbxF1pwYuHZyjDJl5tDZpwSPMY+3OpJ
         UXwRMXCGY5gEMR+Yj6VZlv97rjDz5Vs/AhZvZYg7iE3toz0f2zxpMT4j1FMphyw1cb3/
         ERVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1-v6si1658608qkl.139.2018.05.23.23.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 23:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLjnQ-0006Df-QW
	for alex.bennee@linaro.org; Thu, 24 May 2018 02:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLjnG-0006DE-Rg
	for qemu-arm@nongnu.org; Thu, 24 May 2018 02:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLjnD-00010i-MM
	for qemu-arm@nongnu.org; Thu, 24 May 2018 02:32:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2619 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fLjnD-000100-7h; Thu, 24 May 2018 02:32:07 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 97BFD8EA734E9;
	Thu, 24 May 2018 14:31:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.382.0; Thu, 24 May 2018
	14:31:40 +0800
Message-ID: <5B065BCA.6090607@huawei.com>
Date: Thu, 24 May 2018 14:29:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
	<CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
	<CAFEAcA_JYyHj6NGJahGPQ9p9XQz6rkmhWMfheW96DzkciModDA@mail.gmail.com>
	<CAFEAcA_GwG-80oNHHb1wcJxkzS5YcbH335JHBo48_ksFmgRB7A@mail.gmail.com>
	<5AC97568.2040502@huawei.com>
	<CAFEAcA8M4-2sAr84kA-1m-0ydw_Xy27A6qK4BEwEzRTdCNahgg@mail.gmail.com>
In-Reply-To: <CAFEAcA8M4-2sAr84kA-1m-0ydw_Xy27A6qK4BEwEzRTdCNahgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DihmLxqXSaV1



On 2018/5/22 17:13, Peter Maydell wrote:
> On 8 April 2018 at 02:50, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> On 2018/4/6 17:36, Peter Maydell wrote:
>>> On reflection, I think I'd aim for 2.13 for this, since:
>>>  * it's not a regression
>>>  * it doesn't actually affect any of our boards, because
>>>    none of them define enough interrupt lines that they
>>>    would actually be using the top 32 that we fail to migrate
>>>  * getting the migration compat right is a bit tricky and
>>>    will benefit from having the time for careful review and testing
>>>
>>> Let me know if I'm wrong with any of those assumptions.
>>
>> Yes, it's no need to merge this for 2.12. I'll respin this patch later.
> 
> Looking at another GIC related patch this morning reminded me
> about this one. Shannon, are you planning to respin this now we've
> reopened for 2.13 development?
> 
Yeah, I've sent new version yesterday. Please have a look.
http://patchwork.ozlabs.org/patch/918734/

Thanks,
-- 
Shannon

