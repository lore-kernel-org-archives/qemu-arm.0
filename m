Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp295237wri;
        Wed, 6 Nov 2019 17:41:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHCcpIhlgVaSQ1uzbWALoigLEU40N7FLaQPfxO5pz08ETyt1r1fwKjSyYq52FGfl2nsFWi
X-Received: by 2002:aa7:d888:: with SMTP id u8mr927632edq.144.1573090888101;
        Wed, 06 Nov 2019 17:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573090888; cv=none;
        d=google.com; s=arc-20160816;
        b=evOsInG3hO7+allkAJ/GoaLSmRT5Faig/G4Eghiow/jjnRW8HTlc2qLXqNBq/q3GSr
         LKan/IWIXjwMX4aAXGoERTjbxhwW/QX5Osd9WrM3OTsrde1NpJ3l0Nq/2F+JF9UreTA1
         Pk5yL7AKiXHTPi1/ARveZJ30m63d2MkSc4fDAhH8OjLMk/2QUvcy5gKa0362U0LGqggR
         vAOK8WhBj7nceusR2D0oo3ya8R9k43lz2AugGygUCLYw05306sEk/85tDIVUxCzUzOeV
         wFmn79YXXUsCQnXfqk1bWcXpG0BjOpQTAZ1rbCC9skIBHcip8Az49LwORIb/F7xZMfn+
         G2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=CPfWizRw/iwfBIyImmItlDche4TWePR3n3YGQwjkpaI=;
        b=ozMcC4C2SHjU6sZzj56x3KlREKIoSArH5phM2dwmr8FR/7xB8ygTTB6yoJYY412SV3
         31OVeNBBcCfJMAxwbxLSdrmjdgHKTbuC1VrR3VXeX5LjMRT5H/PAXgVy5THxtpsZEF5Q
         f2w+FzpM74pLmQEq2r6560QcT+dkNH0xLGt/lJl54DICYeagOsuSHEm7FKGl4G+h4DYe
         H43hYGBfci94YCSDCZmBNZlGhq/kHUmnTEtvxKJMJ+A98TA6Rbmp3aMGn7uLGTpbd3uR
         2voJGvDpkgputNlnVl4jl0ICVdoM+WmN0koiXwZ09vsJ0MMKLRqOKwwzkvRkwfaGFKi3
         /i7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br3si458479ejb.436.2019.11.06.17.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 17:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSWnf-0005as-4I
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 20:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iSWnW-0005ab-0d
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 20:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iSWnU-0003LH-OO
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 20:41:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2262 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iSWnU-0003JA-Cj; Wed, 06 Nov 2019 20:41:16 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F013C599A94ECF9C075C;
 Thu,  7 Nov 2019 09:41:07 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 7 Nov 2019
 09:40:58 +0800
Subject: Re: [RFC v2 02/14] standard-headers: import arm_sdei.h
To: Cornelia Huck <cohuck@redhat.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-3-guoheyi@huawei.com>
 <20191106185240.3f5e2c2a.cohuck@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <059c6396-bbfb-2dd3-f7cc-7c64bc2d3ccb@huawei.com>
Date: Thu, 7 Nov 2019 09:40:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191106185240.3f5e2c2a.cohuck@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YXLbaZBX/q6s



On 2019/11/7 1:52, Cornelia Huck wrote:
> On Tue, 5 Nov 2019 17:10:44 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> Import Linux header file include/uapi/linux/arm_sdei.h from kernel v5.4-rc5.
>>
>> This is to prepare for qemu SDEI emulation.
>>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>
>> Notes:
>>      v2:
>>      - Import arm_sdei.h by running update-linux-headers.sh
>>
>>   include/standard-headers/linux/arm_sdei.h | 73 +++++++++++++++++++++++
>>   1 file changed, 73 insertions(+)
>>   create mode 100644 include/standard-headers/linux/arm_sdei.h
> Just a remark that I find it a bit odd that that a header that looks
> arm-specific is in the generic linux/ directory (already in the kernel,
> I know.) Is this for sharing between arm and arm64, maybe?
I don't think arm platforms will use this header. In section 4.1 of SDEI 
spec, it says " Both the client and dispatcher of SDEI must execute in 
AArch64 state."
So shall we move it to include/standard-headers/asm-arm64/?

Thanks,
HG

>
>
> .
>


