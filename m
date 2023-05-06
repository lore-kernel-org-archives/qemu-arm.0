Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp786064ejq;
        Fri, 5 May 2023 19:03:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OLGhUvKNGxnvitJ35OlNlw/80Wo7Zn+eDnFuPBi2AoJAKiqnuqlRYtiUuLdJ4nxwuyIeu
X-Received: by 2002:ac8:5b8c:0:b0:3e7:ec0b:f63c with SMTP id a12-20020ac85b8c000000b003e7ec0bf63cmr4590905qta.33.1683338619643;
        Fri, 05 May 2023 19:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683338619; cv=none;
        d=google.com; s=arc-20160816;
        b=gbLk3xyqJIhG3PXxOYXEP3yefuhQY2TY5kJSTCf2jiXiZ271g4fwQxTTmIDA3P3bap
         FWjQoiW6Qa2kIddG0LlAQRLEWh2W82FDOiNuUj9Tgxkjp70ofwR8R5Bq0q5fcLgu0IC4
         illu1o9XjyBXSmYiSv/9AVDu3Km3udaSRYNoWM5/iztZlychlKMO+NClN7FjN2qHRmLT
         ZY4sxrJ4eoZVBzjPTjFn9hSBz43oGi16A0jHnCOhnUodCV+DOfXHLgd9rAux6Oqw+4RR
         QFX3EPdhqhIA0k1evtqV8qef5rpD/ei+k0A6X+eePjnT47y74Xad6zkX/ZyQ8DQVsREx
         L9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=O/g1ZLvTbKvyU9vCigW4S50kluDNTixJPEt70fmpLxo=;
        b=QjoqP3vgOv0gdjRxCq6SnJ+zliC+3EjdP/ie799ygLbywSrB8c+J0MqOwcw18BzwCX
         aBpUtyEDI8ppwGwjN37H6L/oSy1ggrssT7UrM0dbZCemdenlwNA4Dbc+b0FL71NMG7a4
         OWE1JmEQsXEwHIzCwND0fAkCThV/435m46945QzyWv06J5oYuHazgzw4rKkeaCo1vuaO
         VPGQmravZzeo79xoae2PVDMGxDDf4R/FhjgsQtP6rBBuKq7dG7lxh86FwYsLCsI/yH/g
         iIIFC3Zj09SQDhysWGubjPC1jrzLbjkCtNGHCgRjm5xcX9qIks8OhtBLorciw6r96Y+C
         Gk9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ae9e20e000000b0074e47213accsi1143405qkc.252.2023.05.05.19.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 19:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pv7Gm-0004WC-9c; Fri, 05 May 2023 22:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pv7Gh-0004VH-JD; Fri, 05 May 2023 22:03:27 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1pv7Ge-0007sR-Vo; Fri, 05 May 2023 22:03:27 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8AxGupjtVVk4oYFAA--.9058S3;
 Sat, 06 May 2023 10:03:15 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxMuVjtVVklMtMAA--.8766S3; 
 Sat, 06 May 2023 10:03:15 +0800 (CST)
Subject: Re: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports
 unaligned accesses
To: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-37-richard.henderson@linaro.org>
 <fc71437e-3507-8d29-7b99-e4ba4f0ed7b0@xen0n.name>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <052a2141-3c4c-c8ae-5b66-4231145f8a84@loongson.cn>
Date: Sat, 6 May 2023 10:03:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fc71437e-3507-8d29-7b99-e4ba4f0ed7b0@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxMuVjtVVklMtMAA--.8766S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJrW3Kr15ZrW5tFWxAw47Arb_yoW8XF1kpF
 s7CF43GF4rJFZ5JrZrX34Ygr98JrWru3Waqa1xtw18ZrZI934UXrsYgFZagF1Yq3ykWrW7
 ZFyvgw1fZFWjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mSPGYE9maAzH

Hi,

在 2023/5/5 下午9:24, WANG Xuerui 写道:
> Hi,
>
> On 2023/5/3 15:06, Richard Henderson wrote:
>> This should be true of all server class loongarch64.
> And desktop-class (i.e. all Loongson-3 series).
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-target.c.inc | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tcg/loongarch64/tcg-target.c.inc 
>> b/tcg/loongarch64/tcg-target.c.inc
>> index e651ec5c71..ccc13ffdb4 100644
>> --- a/tcg/loongarch64/tcg-target.c.inc
>> +++ b/tcg/loongarch64/tcg-target.c.inc
>> @@ -30,6 +30,7 @@
>>    */
>>     #include "../tcg-ldst.c.inc"
>> +#include <asm/hwcap.h>
>>     #ifdef CONFIG_DEBUG_TCG
>>   static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>> @@ -1674,6 +1675,11 @@ static void 
>> tcg_target_qemu_prologue(TCGContext *s)
>>     static void tcg_target_init(TCGContext *s)
>>   {
>> +    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
>> +
>> +    /* All server class loongarch have UAL; only embedded do not. */
>> +    assert(hwcap & HWCAP_LOONGARCH_UAL);
>> +
> It is a bit worrying that a future SoC (the octa-core Loongson 2K3000) 
> might get used for light desktop use cases (e.g. laptops) where QEMU 
> is arguably relevant, but it's currently unclear whether its LA364 
> micro-architecture will have UAL. The Loongson folks may have more to 
> share.
'LA364' support UAL.

Thanks.
Song Gao

