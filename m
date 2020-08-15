Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1494579lfy;
        Sat, 15 Aug 2020 11:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbNifmHxm0mJfzPAiGsOcoZdVjfumBLgQV5/tjNjg5hpD63W5jQRABmVphJeTJgjCj5qjS
X-Received: by 2002:a5b:b4d:: with SMTP id b13mr11208206ybr.238.1597514939361;
        Sat, 15 Aug 2020 11:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597514939; cv=none;
        d=google.com; s=arc-20160816;
        b=FTRyUeXREqUlHxBah2dLvw+RovY+Xlg6mDE4E3HJT5foHq+VfgcnNazIf2Rncg5rkC
         e6vwBsCcgAnzOKg/J4JTSz/Cl2WbbbDfjgoZbt50KJ959K8b3EbIgOA6jyp/T1cCVsxn
         hXRy+cmT86669cxO7BFD797YfvdSu54Bq84AchOI8hOwXtVLzDVbpMg6kqzzNv6qKw8h
         aZNfm5eMefmL6jMq06EiEx3ioIY3zraAI5+3X/QfVHP3bL26W1/Q5jIDpXUr1LMCkzor
         qQ26+W2d+ARlsxSYGZplOQxq9HyrCMPv8Bgd+YmoyjEuL1fmkocI12HiEADrP+eljlnB
         gUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=oHZQFRZL9P0QFqSSk4DB9AW+vLWTB3ko1B8N/z6FXjs=;
        b=NfGPsCs8QT5CaBKzuuraNTFD6E9/NTHWAgUbKcYN8QNw9X7CvVLRdhI7jmqrywkfnE
         X0+q0jJ9IUcT0ptdcbf9H+BIJMA2J0QCpXFKQKL8T1eGXiasQxaL1XjVRA6KgH5p7HSu
         Epj8W9x0LjHMc+0KhhbUQm2RqBFSUBjR1EmyRJtzU/Hzf20Y5RaGmfMl53+Fa9wBlXmk
         6ilqNu/t+XeSh4JtYT0TeihDIZJhEtjze8PH0KBhbJqVn8kebGwVLwvzXGO1m2+AsKyS
         ic/SLFWI5bufm0AkDgvDGBhAbkgaL/jf6IxDJSDzR+eCfD92oaRjaH3foxBQuKbpIUmF
         gyzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w140si12150929ybg.198.2020.08.15.11.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 11:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k70by-0001b2-O0
	for alex.bennee@linaro.org; Sat, 15 Aug 2020 14:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70bp-0001Y2-FZ; Sat, 15 Aug 2020 14:08:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2922 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70bm-0007xN-BZ; Sat, 15 Aug 2020 14:08:49 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 2EA122B87205449634F7;
 Sat, 15 Aug 2020 10:19:10 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 15 Aug 2020 10:19:09 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 15 Aug 2020 10:19:09 +0800
Subject: Re: [RFC 6/9] target/arm: introduce KVM_CAP_ARM_CPU_FEATURE
To: Cornelia Huck <cohuck@redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-7-liangpeng10@huawei.com>
 <20200813130034.421b3368.cohuck@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <a63e0509-0df7-ee9f-6f6d-2438dad4369e@huawei.com>
Date: Sat, 15 Aug 2020 10:19:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200813130034.421b3368.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 14:08:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, zhukeqian 00502301 <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c2gYo56afRYj

On 8/13/2020 7:00 PM, Cornelia Huck wrote:
> On Thu, 13 Aug 2020 18:26:54 +0800
> Peng Liang <liangpeng10@huawei.com> wrote:
> 
>> Introduce KVM_CAP_ARM_CPU_FEATURE to check whether KVM supports to set
>> CPU features in ARM.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
>> ---
>>  linux-headers/linux/kvm.h |  1 +
>>  target/arm/cpu.c          |  5 +++++
>>  target/arm/kvm64.c        | 14 ++++++++++++++
>>  target/arm/kvm_arm.h      |  7 +++++++
>>  4 files changed, 27 insertions(+)
>>
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index a28c366737..0b83d2b4bb 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_PPC_SECURE_GUEST 181
>>  #define KVM_CAP_HALT_POLL 182
>>  #define KVM_CAP_ASYNC_PF_INT 183
>> +#define KVM_CAP_ARM_CPU_FEATURE 187
>>  
>>  #ifdef KVM_CAP_IRQ_ROUTING
> 
> Please split out this header update into a separate patch so that it
> can be replaced by a proper headers update once the kernel code has been
> included.
> 
> .
> 
Sorry, I'll split out it.
