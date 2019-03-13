Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1119396wrs;
        Tue, 12 Mar 2019 18:51:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYgGnutgDxt3mlZU/YkhIS/INb+ZKMrGzEdFMi7p2NrpxOmcEOkGLEhM4IdeV45sCDSDbM
X-Received: by 2002:a0d:e80c:: with SMTP id r12mr33186073ywe.394.1552441876084;
        Tue, 12 Mar 2019 18:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552441876; cv=none;
        d=google.com; s=arc-20160816;
        b=uYCaN9cqpdf87nl47EcvR6NvnWF86VDudWMFNfjC0WiU+RNIuDPVjD7ZV3rY6mV6WM
         Zpk8s/JHu9oi0coU5jetnOcM5JZ5ZcHAZK42BNTs0pMQJYRcBFDIhmRGsPPjJKaOZyIq
         +fVwjptGqcUPbbow0+RtV/VlkFtA54u0gOd+n9jUfR2bu/m7+t3UlgxbX/kqD2dRzXXw
         NQZVCs0yv1mIkdA0dl6+bXmroTr1gaySeK3ZGOpDk6Zjq8aGCyxXY8MJEjcRavTICASG
         IKc8EwzZMdtnWAwwbZr4tls3Mws/WtllZuaZ77+5BNa/uwfeyP2o/6OObZDyRjMF6sKj
         kiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=gB7I09mu/tPW7FejE3TCD1NTxlm0/uaWsHlE8zizwAY=;
        b=xQBiKER76RjvBkv31klVF4FpIV/gdoP12ffugDgGa5b2fZJnyiNLiV9oB1dBRJuHCM
         9oclIhncE2w3B4zeD1SyUg9AdGDhIV+MIRVRQBy9s3NouRHar4+AYjK7/JU8V4FLV33h
         M8EZBhlBIZFhl+4J6y7ucUEQXQET2VG58QR1uvdY2KgiTWhcSw9UhLxw0FdDchEbbr7U
         byW0aOryKmdEdNG7RFEZXbmZzDQWHdr62m9yD5BDTKVH+8WmGQdgc6ogPojGlvmnFaAQ
         XfeAAi6Wk/m4PkI9AJ6rgh5fJQ6z1uTKFO/02cVfryNEbp0MVcLpQ97U/+a1WJ7SnowG
         RNRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d206si6273623ybd.436.2019.03.12.18.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 18:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3t35-0004NN-He
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 21:51:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3t2v-0004Lk-MI
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 21:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3t2k-00053H-8c
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 21:50:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2192 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h3t2j-0004w0-Pa; Tue, 12 Mar 2019 21:50:54 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 542475BEBAFFC2644FBF;
	Wed, 13 Mar 2019 09:50:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.408.0; Wed, 13 Mar 2019
	09:50:39 +0800
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1552377439-24640-1-git-send-email-guoheyi@huawei.com>
	<f0ac8cee-dd04-f15f-9073-d076a3d8b567@linaro.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <14022a49-b7c0-a853-1d4b-f2c60a1b9c9b@huawei.com>
Date: Wed, 13 Mar 2019 09:50:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <f0ac8cee-dd04-f15f-9073-d076a3d8b567@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] arm/cpu: fix soft lockup panic
 after resuming from stop
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
Cc: wanghaibin.wang@huawei.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f0DvI4Sj2YWw

Hi Richard,



On 2019/3/12 22:59, Richard Henderson wrote:
> On 3/12/19 12:57 AM, Heyi Guo wrote:
>>   int kvm_arm_vcpu_init(CPUState *cs)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       struct kvm_vcpu_init init;
>>   
>> +    /*
>> +     * Only add change state handler for arch timer once, for KVM will help to
>> +     * synchronize virtual timer of all VCPUs.
>> +     */
>> +    static bool arch_timer_change_state_handler_added;
>> +
>> +
>> +    if (!arch_timer_change_state_handler_added) {
>> +        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
>> +        arch_timer_change_state_handler_added = true;
>> +    }
> Which means that this will not trigger for the second time that you pause the
> vm.  You need to key this off of something else, like cpu id 0.
I don't quite understand. Do you mean the handler will be deactivated after one trigger? Or something else?

I suppose the state change handler will take effect for the whole VM life time, so I believed one handler for one VM is enough, in whichever vCPU initialization it is created. I also tested several times for one VM, and fortunately the rough code worked.

Thanks,

Heyi

>
>
> r~
>
>


