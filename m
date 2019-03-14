Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp803709wro;
        Thu, 14 Mar 2019 05:47:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyeW8P3UkzU5phoH2yMgdxhoCWmm44CNIHcTHXexJ/lAL2gLctXdZ28hf8j+M/Tr/n/0c4
X-Received: by 2002:a25:9cc6:: with SMTP id z6mr37860614ybo.521.1552567666595;
        Thu, 14 Mar 2019 05:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552567666; cv=none;
        d=google.com; s=arc-20160816;
        b=hcfDiQSKudIGJ9rn4tSfCmxbTwyL6f2fUM8ouJ0IFn1dhHXKgcMuH4p2Lcym6xhmSR
         ddy4p6cLOpu8uFznAJRaCe2Imzb27NoZ2lSsw6Hrar3Gniv6bEo4fwc3x/UeRleqvNYZ
         SkQITLpw/GXshJ/kRWxIZPkibokypQ3aXniKdgu6ZWDdtr32XaS0H7kLBUrnU8LMESmp
         APHRuMpQKZJmhBd0pQ9rqpY5KyBjBanK35lY+GsdPJbJcNwfKOGJcrpnetonsBA5vrbc
         V78pSmuENdtVZ2300QEib9aJvwMoDBWeH0XV9PefC63jOwjAPdAXI7KbK4vM6uHWgr7V
         XpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=282Vji3vlhLtxbOsf6KSYzikqMgEaLJmoRKWZDZ1YuY=;
        b=uEz+5TX+JdNdRgfTpU0iPX76OxuwEmqrTvle+V/DSwdK3k9+KP0m+R04Hea2fcWgrb
         TpSj5de6wTMju0fodzUcA41bG9YIYd4t4dfi1oaFTbqt5E1kT2zlgbOllq6VBTY8S5Wm
         bB/tL1FWmbJKyKcjyDfQ6DHpxtthdrvQvcuQ4cO4nNILij2EymZ6ZMyWhQa8AYMOWLDu
         pIu8qz89UXSI/p5tZgmqzkkCvZ21F5pUD7x2A2skCPHv10/K3U7G4Pm93lv/eGVJDG0n
         F13fJhpXcoeEkUhMQqKCld0eFRMJ0y/CLqa1BnTEnXeO3mDoCtmYoHPjDf5mJyfSa+80
         4zmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si5871319ybp.402.2019.03.14.05.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Ply-0001O6-3a
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:47:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4Pll-0001Nx-DD
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4Plk-0001lY-O9
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:47:33 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51760 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h4Plk-0001ig-6g; Thu, 14 Mar 2019 08:47:32 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 62658F01EEDFA953B163;
	Thu, 14 Mar 2019 20:47:23 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Thu, 14 Mar 2019
	20:47:21 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
	<6d9dee31-6072-8d90-0fce-b4966d5f76c9@huawei.com>
	<CAFEAcA_+aJfC4LvMM339TO19kcMTH-Dwy2uRNow+sxFkStJPBQ@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c5b3bfb3-c3a1-b804-3b16-cc907ad03b5e@huawei.com>
Date: Thu, 14 Mar 2019 20:47:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+aJfC4LvMM339TO19kcMTH-Dwy2uRNow+sxFkStJPBQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] About Revert this patch: arm: Allow system registers
 for KVM guests to be changed by QEMU code
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZ8vd8zPMDky

On 2019/3/14 20:43, Peter Maydell wrote:
>> If you think this patch will introduce some issue, we can add one function write_part_cpustate_to_list()[2] to change the specified
>> register instead of all the registers[1].
> It definitely does introduce an issue, but we need to address
> it by working out why it breaks something that I wasn't
> expecting to break. Then we can fix it properly. Looking
> it this is on my todo list for this week.
Got it, great, thanks very much to Peter.

