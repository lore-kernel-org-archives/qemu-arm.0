Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp8646865lfq;
        Fri, 25 Dec 2020 23:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+dl4m9g8l7oYGUwwr6VDPLTOQMRlVrhyoTNRX6pm8WN+SzEp3MNJf1CvhrzRhuj1KAhUe
X-Received: by 2002:a25:37d7:: with SMTP id e206mr35485725yba.77.1608966759827;
        Fri, 25 Dec 2020 23:12:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608966759; cv=none;
        d=google.com; s=arc-20160816;
        b=XmPL+T9dV13dQG/AplTav311+bkjFoPQVfcJbvvB21/5KO+MJwW3hKc2t4jnoiMyYF
         brvYHhmswPGSU2k9jmIi85hOsF36rLypeLF693awz+gxxGcqj+6l+QhZ2JWOUcfCFmpE
         hFaOVKYkK2Gym7hgc2Y7puUkVwAs7bhkZ6/wDyoMd0ArTYJ/H7iPLvc0q9UmSttL1ygH
         2p6BGNtkv/P1mI+cvxbYQ/CW914BIpT7DYQ39oNmq5FZJNSMum0ruLJbzdaklR2yHJLF
         lIT7iWxYT5AMR7SkAEy5OyJXKTChnmxeLaxN8d0CVybCD0vYOxkn7L/PKcK6ayZcMONS
         gbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=2AUZJPpS98Jeen3O6jKQn+WeHREEfqZBzHS9zcWnKmo=;
        b=SNnFcvY05bM62YfxzrywFhjRE+G3VAnusnb+kS9o5fQQPrklvszzvIH8BMJ+MK98VD
         XJCVTEQBzdgvJaRMNSBfSM4tp0FXVABZG1/9ggWfrc7CISPb7fjs1ychibAwv+9H4Bd/
         t7OSX3Npos3GWzLg8md5ewIR2aEBZ6yU7gMxVMZGDTBjNhWvaIghfVz2M1+ZPer7eE3w
         x9DBxKuqp0JEcM7OVhntJ78WQoKcfN3fY1Bkf+VLLIuI6NS9ND9wnNAR9lMZn/DwOLtp
         kwyNBcA3LEkB41V6ugWkuWwluovB3LQMTe9yHK+9PYO3bWosxqfV5ii8t6F/POSXBNVm
         lIWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n124si32610283ybc.139.2020.12.25.23.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Dec 2020 23:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kt3kh-000287-6s
	for alex.bennee@linaro.org; Sat, 26 Dec 2020 02:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kt3kT-00027w-Em; Sat, 26 Dec 2020 02:12:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kt3kQ-0007aL-I7; Sat, 26 Dec 2020 02:12:21 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D2w3132c3zhwKn;
 Sat, 26 Dec 2020 15:11:25 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 15:11:53 +0800
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
To: Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
 <20201217100501.GE4338@stefanha-x1.localdomain>
 <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <bbfc0b13-0917-6851-e10f-c7001ff9fd22@huawei.com>
Date: Sat, 26 Dec 2020 15:11:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.561,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1y1koXC/CyZ


[...]

>>> -        for (j = old_num_blocks; j < new_num_blocks; j++) {
>>> -            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>>> +        if (extend) {
>>> +            for (j = cpy_num_blocks; j < new_num_blocks; j++) {
>>> +                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>>> +            }
>>> +        } else {
>>> +            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
>>> +                /* We are safe to free it, for that it is out-of-use */
>>> +                g_free(old_blocks->blocks[j]);
>>
>> This looks unsafe because this code uses Read Copy Update (RCU):
>>
>>   old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
>>
>> Other threads may still be accessing old_blocks so we cannot modify it
>> immediately. Changes need to be deferred until the next RCU period.
>> g_free_rcu() needs to be used to do this.
>>
> Hi Stefan,
> 
> You are right. I was thinking about the VM life cycle before. We shrink the dirty_memory
> when we are removing unused ramblock. However we can not rely on this.
> 
> I also notice that "Organization into blocks allows dirty memory to grow (but not shrink)
> under RCU". Why "but not shrink"? Any thoughts?
Hi,

After my analysis, it's both unsafe to grow or shrink under RCU.

ram_list.blocks and ram_list.dirty_memory[X] are closely related and
both protected by RCU. For the lockless RCU readers, we can't promise they
always see consistent version of the two structures.

For grow, a reader may see un-growed @dirty_memory and growed @blocks, causing out-of-bound access.
For shrink, a reader may see shrinked @dirty_memory and un-shrinked @blocks, causing out-of-bound access too.

I think it's a design problem, RCU can just protect one structure, not two.

Thanks,
Keqian.
> 
> [...]
>  * Organization into blocks allows dirty memory to grow (but not shrink) under
>  * RCU.  When adding new RAMBlocks requires the dirty memory to grow, a new
>  * DirtyMemoryBlocks array is allocated with pointers to existing blocks kept
>  * the same.  Other threads can safely access existing blocks while dirty
>  * memory is being grown.  When no threads are using the old DirtyMemoryBlocks
>  * anymore it is freed by RCU (but the underlying blocks stay because they are
>  * pointed to from the new DirtyMemoryBlocks).
>  */
> #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
> typedef struct {
>     struct rcu_head rcu;
>     unsigned long *blocks[];
> } DirtyMemoryBlocks;
> [...]
> 
> Thanks,
> Keqian
> 
> 
> .
> 
