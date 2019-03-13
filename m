Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1122864wrs;
        Tue, 12 Mar 2019 18:57:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+PdQEweGhho5ueZjAjpkvzcKSKFlzs/a0Ih1HvbB/rfAw5fC9Boz02PjKf3qESsVak4Id
X-Received: by 2002:a0d:f344:: with SMTP id c65mr31923335ywf.77.1552442255428;
        Tue, 12 Mar 2019 18:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552442255; cv=none;
        d=google.com; s=arc-20160816;
        b=yf1HHFRb9XuTtRbhcMRlQWPFl9mKRHfWaSJm4OM0htVqpYuWHh1U58y3GckjtlXKIt
         Gd+bnQyZXZsefpN2i7MnaYhhYfAfO6LwbKp7a33Wnxpg0MFCA+bN/DEEasSW3G8CGVtn
         jfrczztLMg8id+MUsDyPeBw6+4lCCygCXMQOtGjTkyywvT7Mk9tqaMrcgWDSkZdIZS3t
         7AN7KCcI4KuEx7tnHRH2U/fFCjMFwu/Kqfp65yslkm9JzNx8SUsMCHwv0DwWwNVEzQRj
         K8eyiEVxQObsol/H0lwmE3BRgySDeQEgfv6G8nuMbPST5frCOPloa9cRFv3dgDYnY1rI
         7y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=2/8UgvjiDUexfDglP5gPKKFKloWgkaURNTvWGlsigWY=;
        b=Y8ALl6/tJcwx+UKpFZfShZhNq55CYpNCKvvB46Hxh0dm0ZFeBEUmbPaV0XWbA+FTwm
         8YBHwevsB7bHU0Nl/AjrixH0F2dKH2m5e0FBrnloA3OGO0Jp1bqSFg9aDC+AJq/KrgUZ
         6ngAnUUEximLiOuPoE60904THDalq82SelkNuLN64uZV1klrrSy1KMTsiPfE0g8LHWfW
         3WWz9oMmgupF5vssteVSBEyQAkC9SPtmCIlM8x5zv8SqSNE/z9bkbXh8+4z3Ud2orYCq
         r1ZIY2OCl77MYYgW8SUsJqrrc4Y1Jxumyf5aOn2G/lV4A7PxjFcbQMFgzockhGTKdvjJ
         ufOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w84si5683047ywb.344.2019.03.12.18.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 18:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3t9C-0008J2-VK
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 21:57:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3t91-0008HC-9N
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 21:57:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3t90-0001FG-AG
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 21:57:23 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:38526 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h3t8z-00014p-Qp; Tue, 12 Mar 2019 21:57:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3364D9ED4F0E31619167;
	Wed, 13 Mar 2019 09:57:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.408.0; Wed, 13 Mar 2019
	09:57:08 +0800
To: Marc Zyngier <marc.zyngier@arm.com>, Peter Maydell
	<peter.maydell@linaro.org>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
	<CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
	<136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <f528c40f-7b31-3bd2-ca93-1c579961581d@huawei.com>
Date: Wed, 13 Mar 2019 09:57:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [RFC] arm/cpu: fix soft lockup panic after resuming
 from stop
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Christoffer
	Dall <christoffer.dall@arm.com>, Steven Price <Steven.Price@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
	kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0+xaFDoSah2

Dear all,

Really appreciate your comments and information. For "Live Physical Time", is there any document to tell the whole story? And may I know the timeline to make it happen?

Thanks,

Heyi


On 2019/3/12 22:12, Marc Zyngier wrote:
> Hi Peter,
>
> On 12/03/2019 10:08, Peter Maydell wrote:
>> On Tue, 12 Mar 2019 at 06:10, Heyi Guo <guoheyi@huawei.com> wrote:
>>> When we stop a VM for more than 30 seconds and then resume it, by qemu
>>> monitor command "stop" and "cont", Linux on VM will complain of "soft
>>> lockup - CPU#x stuck for xxs!" as below:
>>>
>>> [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
>>> [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
>>> [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
>>> [ 2783.809563] Modules linked in...
>>>
>>> This is because Guest Linux uses generic timer virtual counter as
>>> a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
>>> by qemu.
>>>
>>> This patch is to fix this issue by saving the value of CNTVCT_EL0 when
>>> stopping and restoring it when resuming.
>> Hi -- I know we have issues with the passage of time in Arm VMs
>> running under KVM when the VM is suspended, but the topic is
>> a tricky one, and it's not clear to me that this is the correct
>> way to fix it. I would prefer to see us start with a discussion
>> on the kvm-arm mailing list about the best approach to the problem.
>>
>> I've cc'd that list and a couple of the Arm KVM maintainers
>> for their opinion.
>>
>> QEMU patch left below for context -- the brief summary is that
>> it uses KVM_GET_ONE_REG/KVM_SET_ONE_REG on the timer CNT register
>> to save it on VM pause and write that value back on VM resume.
> That's probably good enough for this particular use case, but I think
> there is more. I can get into similar trouble if I suspend my laptop, or
> suspend QEMU. It also has the slightly bizarre effect of skewing time,
> and this will affect timekeeping in the guest in ways that are much more
> subtle than just shouty CPUs.
>
> Christoffer and Steve had some stuff regarding Live Physical Time, which
> should cover that, and other cases such as host system suspend, and QEMU
> being suspended.
>
> Thanks,
>
> 	M.


