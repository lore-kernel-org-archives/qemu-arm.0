Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3766278wrq;
        Mon, 11 Jun 2018 01:33:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLafriwqkMFZPAHwA4Gvy3Yf7m24C5+i/mLdESwac/HjnJU4bDYu7wh9U6r6UiHUXLTz9yh
X-Received: by 2002:aed:359d:: with SMTP id c29-v6mr14700240qte.240.1528706026377;
        Mon, 11 Jun 2018 01:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528706026; cv=none;
        d=google.com; s=arc-20160816;
        b=zmIEveVtlxk95VUNmcB0JUdyjxM4Sh5aOpuHhqI0yYTQQWwahJkahpRosjfJ7xkuLN
         wYwpWBCr5e+zUcGInzzXq+1RVf99xbaz64Bqs/w4SEEMzrJBxeKReFGFzJU+9prNhr5S
         +LWE0QYlLDjFH1neyrYmikn2igp5d9NI/xtLwj48k0AvS2OOsQPibvUxn3ODwZKte9b0
         wbPjDuG6JHEIAdJggNNu7L2QrEqBlJCrlvCi3l2lsb8TQ2f/7gbG63jBkkW5oM9fxVn+
         huq1QB4YaaUjyDhmgkdTf33kXYnNB+68Mhe+1L9Nab18qX3tDJuKCPPB30ZhnyC8EJ6F
         o5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=U144jSCAEsnmOMi633y3/L6Hc9WecyfjXzRL28Bbcv0=;
        b=SKlVxFeBfin7bFsiNT8cm/PF4OmXoCc+hWdXF0Qm4Lb8mQ8m9LEJNGDqJeIKJFvo9a
         JUo06FxipzGfqfxZYzoxbYTj58sI40Lqm7FMhLqFeMlSUqoxhijLLnOaMl41i5U0jUBW
         dRL7tMs5xfrHh67yH9uWPuBHYx2EFYewpvZ+x+jssSSGbens3MnCaBBx8rJABCgSUbbF
         r35cttZovtcDw72AM0TJDwL0yIOCAtxy3YEWuj/Ylt7zWsEsNEb1Nv1XbPwUp9r7fRFC
         fKbIqvbc+V+EtO5rPoPA1bSMQ3GQQbdAGpO/rbxzcCcNSK3w2K4emf+gFUo1kKMwbIaU
         Jrlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67-v6si7031355qkh.201.2018.06.11.01.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 01:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSIGn-0006p2-Rs
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 04:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fSIGd-0006oa-IB
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 04:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fSIGa-0004Jd-Do
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 04:33:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2547 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fSIGZ-0004I7-Mi; Mon, 11 Jun 2018 04:33:32 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 145696FBE259A;
	Mon, 11 Jun 2018 16:33:11 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.382.0; Mon, 11 Jun 2018
	16:33:05 +0800
Message-ID: <5B1E33A4.7070509@huawei.com>
Date: Mon, 11 Jun 2018 16:32:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, <qemu-arm@nongnu.org>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-2-git-send-email-zhaoshenglong@huawei.com>
	<e7bb1cbd-7fad-5bd2-641c-885f0f473680@redhat.com>
In-Reply-To: <e7bb1cbd-7fad-5bd2-641c-885f0f473680@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH v5 1/2] arm_gicv3_kvm:
 kvm_dist_get/put_priority: skip the registers banked by GICR_IPRIORITYR
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z763eBR2sbXY



On 2018/5/31 19:01, Auger Eric wrote:
> Hi,
> 
> On 05/31/2018 05:15 AM, Shannon Zhao wrote:
>> While for_each_dist_irq_reg loop starts from GIC_INTERNAL, it forgot to
>> offset the date array and index. This will overlap the GICR registers
>> value and leave the last GIC_INTERNAL irq's registers out of update.
>>
>> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
>> Cc: qemu-stable@nongnu.org
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
Hi Peter,

Looks like we missed picking up this patch. I didn't include this in v6
since you and Eric both reviewed it.

Could you please pick it up?

Thanks,
-- 
Shannon

