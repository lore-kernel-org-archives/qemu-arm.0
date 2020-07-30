Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2459712lfy;
        Thu, 30 Jul 2020 04:19:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyiXowF/Tr5ZLBSy39PJ7jogIGW6PUnYfftx9RFWfniz6XKJzlUVNERIn/SJd1IVlRIehE
X-Received: by 2002:a25:d006:: with SMTP id h6mr3419628ybg.122.1596107947844;
        Thu, 30 Jul 2020 04:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596107947; cv=none;
        d=google.com; s=arc-20160816;
        b=p12sFp2VHUsTV3EyLZR1qQGmleD8SzMQbBPGBBARDwHZdEsYmEQrmyC9KBxrQYQSTP
         G0WIyR6vlS/ihBt3L1Cu54dEhUzifPOTdxEbMPKpadDfhiUSIxT9dnQ4gCGaK1qEI+CR
         Y6bsBFNyZPBLDua83LJPArNwQNsN0M27l9M9daS47uNHeX6qLXWRhijm6JRyh/kMMzp3
         7gyEAc2SByzIhwJWG52PrnotAnd5lBELlAxM5ExKKcoM0VbdjiuGAtkT5kXFOanbe4Sf
         E8CBZi8fF/MFCPiBg+7OiQMwF4zeisQwZvkAqZv8LvujvI4/9bAe4iyEnOCO3Qt7lFYu
         d9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=77Dn0Nf71WypwZikEdVgF2gZ5qCtGFXoGtcz7mNVp8E=;
        b=QAXQ+Bmo8Q03jZ/sM1QWWt2N+Tgc8wTJYi+Ike15J7N9LyN0vaD9vt7kqzLFOWzlK4
         I2l1TzQuyRW6mRSNKCWsoA4PCZoq7QTU4lOxWWsfEGqIRKhOiuKwJ/9UVvyvyoluehPY
         9JpfY+C49I1MmBw2G95j7+FmbhJflYwDgWWAfdCjf6EXRgLotk6alR+16re0y5IUb9XO
         iBKstE6hWhk/dUrW3ML2X449OCxboKHEq9lTUlPmgl50bMmS8tio1kLWwVfWHJxtuvTn
         HvPqoPXJA0Q2NWB3NIfINvx7gol/02sDZPty4sX5UYE7J1cZuA0+s7ZalNVF2CbOwdq6
         0JUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si4742099ybg.487.2020.07.30.04.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k16aZ-0000Sw-Ae
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 07:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k16aS-0000Sb-Mv; Thu, 30 Jul 2020 07:19:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38320 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k16aP-0003ey-RX; Thu, 30 Jul 2020 07:19:00 -0400
Received: from [10.130.0.69] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMWSrCJf1oICAA--.170S3;
 Thu, 30 Jul 2020 19:18:44 +0800 (CST)
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Peter Maydell <peter.maydell@linaro.org>
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
 <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
From: Kaige Li <likaige@loongson.cn>
Message-ID: <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
Date: Thu, 30 Jul 2020 19:18:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMWSrCJf1oICAA--.170S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5tFyUXFWxtr1UAr4fXwb_yoW8Cr4xpF
 4xGa92kr4Yqr95C3s2ka1kXw1UWw42kry0ya97trs3XrsrKr1FgrnrKr9IkF4jqF48Cw45
 WFyxZ345Wrs5ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
 uYvjxUI5l1DUUUU
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:18:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v0wlRWaJ9D8T

On 07/30/2020 04:44 PM, Peter Maydell wrote:

> On Thu, 30 Jul 2020 at 02:56, Kaige Li <likaige@loongson.cn> wrote:
>> When I compile qemu with such as:
>>
>> git clone https://git.qemu.org/git/qemu.git
>> cd qemu
>> git submodule init
>> git submodule update --recursive
>> ./configure
>> make
>>
>> There is error log:
>>
>> /home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
>> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>       fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>>       ^
>> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
>>       AtomicThreeOpFn *fn;
>>                        ^
>> cc1: all warnings being treated as errors
>>
>> So, add an initiallization value for fn to fix this.
>>
>> Signed-off-by: Kaige Li <likaige@loongson.cn>
> What compiler version is this ?
It's the latest version: v5.1.0-rc2, but VERSION shows that is 5.0.92.
Commit id is 5772f2b1fc5d00e7e04e01fa28e9081d6550440a
>
>> ---
>>   target/arm/translate-a64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 8c07649..910a91f 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -3315,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>>       bool r = extract32(insn, 22, 1);
>>       bool a = extract32(insn, 23, 1);
>>       TCGv_i64 tcg_rs, clean_addr;
>> -    AtomicThreeOpFn *fn;
>> +    AtomicThreeOpFn *fn = tcg_gen_atomic_fetch_add_i64;
> NULL would be a better choice for a "this is never actually used"
> initialiser.
Ok, I will have a try and submit it in v2.

Thank you.
Kaige.
>
> thanks
> -- PMM

