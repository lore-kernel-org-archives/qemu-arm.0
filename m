Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4432273lfq;
        Sun, 20 Dec 2020 23:38:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6thMqTx4CL7J+KwgmybDaNtpOp1aybGBem5Id3LMKo57S1rOSPtyI5cnHcWsJhAQoBs1V
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr21994811ybt.232.1608536320078;
        Sun, 20 Dec 2020 23:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608536320; cv=none;
        d=google.com; s=arc-20160816;
        b=EO9VvH78F5sP50tPssLDvwietm/qBI7aCscqYLrOHFZnZOoKhSFTjc+dYBgBqdQM4/
         05mNpcbg6RK6KATsT/WKWRPn6+NoFMeRmQB4811d7VNIo0BIcTD5q03rdcnh77v2aZqK
         GakV1XDgDL6O4zRvqg5vluUeoguX9dd0QIi9xetqTEPIJbpAZpv61ZdAEVSHRJisJOOP
         0UIwzMetCUNMLvPzID+A7WMZYGbK06Y+lEMHorXUhMGpte4guXKVi3e8g7y0CD5xq1Qc
         stsf7yDbGgdqsosrDjxRAAeWOUtXgUkLAtaM5f7IoEjGroEIUCkGZSQ6pm9gzXRj8ynB
         h0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=5+tEwvM3WV2TwFmlx5aEp8UH0+4eL3gL+vMYEDumrNY=;
        b=vQe8SIJQau7Gn3jxVAdr1+iTysHbW6sq605Kyd3WBvIBv06gV/xDbje1V2eEPCIqtO
         x9wQIrMIUCQQliSP6VRbd2QCjXJje52E6x+i+QbwXHCidiDgkZbDW+uk2oWw8UqaLPC3
         8nlO56g0ubcDpNwy/7+NkWCizKp3hS2wFaY20p/OO6SHUeQTklgZcLekv7QQaMqbI/o4
         NLNMqCkFSqaYfXZNmULZEm+/j9b6+cMVwX1iTNCJMBE3qz47M1e1R/KemUo8D3tDy6gh
         7Txl8iGCq/qiA4EVXZRwoBmhWqHa6ybfSbbvDbrBQPE7FgogbHaODw8k/kVBIoL3lY8Z
         q0Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i136si15222187yba.271.2020.12.20.23.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Dec 2020 23:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krFmB-00030P-Gk
	for alex.bennee@linaro.org; Mon, 21 Dec 2020 02:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krFlk-00030D-1M; Mon, 21 Dec 2020 02:38:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krFld-0000Dj-7W; Mon, 21 Dec 2020 02:38:11 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Czrrw5jl4z7J1m;
 Mon, 21 Dec 2020 15:37:04 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 15:37:36 +0800
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
 <20201217100501.GE4338@stefanha-x1.localdomain>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
Date: Mon, 21 Dec 2020 15:37:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201217100501.GE4338@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam
 Zheng <famz@redhat.com>, kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Y7Tm8Qvt11o



On 2020/12/17 18:05, Stefan Hajnoczi wrote:
> On Mon, Nov 30, 2020 at 09:11:03PM +0800, Keqian Zhu wrote:
>> @@ -1839,15 +1841,26 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>>          new_blocks = g_malloc(sizeof(*new_blocks) +
>>                                sizeof(new_blocks->blocks[0]) * new_num_blocks);
>>  
>> -        if (old_num_blocks) {
>> +        if (cpy_num_blocks) {
>>              memcpy(new_blocks->blocks, old_blocks->blocks,
>> -                   old_num_blocks * sizeof(old_blocks->blocks[0]));
>> +                   cpy_num_blocks * sizeof(old_blocks->blocks[0]));
>>          }
>>  
>> -        for (j = old_num_blocks; j < new_num_blocks; j++) {
>> -            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>> +        if (extend) {
>> +            for (j = cpy_num_blocks; j < new_num_blocks; j++) {
>> +                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>> +            }
>> +        } else {
>> +            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
>> +                /* We are safe to free it, for that it is out-of-use */
>> +                g_free(old_blocks->blocks[j]);
> 
> This looks unsafe because this code uses Read Copy Update (RCU):
> 
>   old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
> 
> Other threads may still be accessing old_blocks so we cannot modify it
> immediately. Changes need to be deferred until the next RCU period.
> g_free_rcu() needs to be used to do this.
> 
Hi Stefan,

You are right. I was thinking about the VM life cycle before. We shrink the dirty_memory
when we are removing unused ramblock. However we can not rely on this.

I also notice that "Organization into blocks allows dirty memory to grow (but not shrink)
under RCU". Why "but not shrink"? Any thoughts?

[...]
 * Organization into blocks allows dirty memory to grow (but not shrink) under
 * RCU.  When adding new RAMBlocks requires the dirty memory to grow, a new
 * DirtyMemoryBlocks array is allocated with pointers to existing blocks kept
 * the same.  Other threads can safely access existing blocks while dirty
 * memory is being grown.  When no threads are using the old DirtyMemoryBlocks
 * anymore it is freed by RCU (but the underlying blocks stay because they are
 * pointed to from the new DirtyMemoryBlocks).
 */
#define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
typedef struct {
    struct rcu_head rcu;
    unsigned long *blocks[];
} DirtyMemoryBlocks;
[...]

Thanks,
Keqian

