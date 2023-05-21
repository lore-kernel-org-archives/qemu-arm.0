Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp713152ejb;
        Sun, 21 May 2023 08:01:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6b9RUhJLRiblyddtmLcmENm0ZBg4T7Jpd0XGg5N3H3bOiYGCFVFb4fDdP31no7lVSUPF59
X-Received: by 2002:a67:ee57:0:b0:439:4261:d7ad with SMTP id g23-20020a67ee57000000b004394261d7admr414416vsp.5.1684681315797;
        Sun, 21 May 2023 08:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684681315; cv=none;
        d=google.com; s=arc-20160816;
        b=k2d+ZEdZNCPoaC1uYfF0pnO9x+1aF8AaAwv1Xo0jwiYrPfQbIjukknY0uT4kUKyy9X
         5guW1oYKxFe2Bxnz9Uus3ncxALUCMb32ylmWQYxn8LuWWjGyNaN4UHwUXKeNcfbP5Nf5
         L6IwfPDhnPOzOb1tT3Le08eeX3Tknf5aQJWjLk2Fu9whsDHL0ttr77zl4O5hG18+v8r2
         iTUUICxlSFRKOQyzKEP+VoBuIxLpBTh3VShPkb4px/GB9Fz6/eMc8RJu1TOe7hR5f6Di
         Ss5YaARqa0Az0/Mr1/hiJxpq0S36xV5Y3xHFLwWM+iZYkelr0Jm1n4xs5FuJLEr20Bsw
         hQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4YEc+QUwDN6om9t03jT9ecIttjXYI2GN3RYTmHjitcc=;
        b=p6rwnuqDzORdqXDWLIiPKf1+WGX0RiDx3rRpUVY4R99W4nUh1mq1IkccT5ooSUh0XT
         LxK1laColuiJP58pb4Q+Pld/BhcF9/vtfJ7sOPOlL3s7SP55S+45j3i3Wyo4Wq762+RS
         PF2oVB/BnaDH5kdXRAkX84ZZwxFWCIcc3eIs502Mzi5G8ZaRnLkCHM3Q69CrKH8RH5OT
         Ezx1ilS/44B9DiEaQTzJyT9CYEFavrarTFcloJw6/MU/+EpSKibSC4H/FBSix2rD3Kjo
         i0b3gA01WwgHJJNHmq8r84n6T6lseGzvfUVPj6gJjXX34EJW3oK9/iIWv3mYqSDbXDUN
         08JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcy+gC3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a05620a140e00b0075945a9785asi2105025qkj.393.2023.05.21.08.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 08:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcy+gC3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0kZ4-0002x7-Qb; Sun, 21 May 2023 11:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kZ2-0002wU-9o
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:01:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kZ0-0006AG-LQ
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:01:40 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64d1a0d640cso2662629b3a.1
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684681297; x=1687273297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YEc+QUwDN6om9t03jT9ecIttjXYI2GN3RYTmHjitcc=;
 b=rcy+gC3i4UeGieY3p1RjXc9fllK5ksA0RjYXn6TGUEAsjPZs1wz/6d+56nUXUEJtvD
 9hagoen+Mugp1SFkdb0Z8fFPIptoGjziipBVzVwcAkWba83EyiCXsLRVN+NyXYYb85e0
 xDktizS7bZ2ufOECYbfKJ+TtQWf0ixgSWCn9+yRgwbVB+NX1QuuL84Gz16ebxlZDaCQP
 i1fPw5tWHsZQ4TS1xkY3rBavY7kJT/OnJFWTOussY3EZasWH+JUEa5oglsTDpTHQbVd5
 MOnkAfcL8k7XMObopZiB4EcqBcMckzuYs+RKd8JYRty66lt1okTNQxuu/I8+GVLRTd6d
 epJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684681297; x=1687273297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4YEc+QUwDN6om9t03jT9ecIttjXYI2GN3RYTmHjitcc=;
 b=CtfpMlRUTD/1v6Yv/nhuPHLyCgIz3VsdabEZaWwWigvSpEOFTct6gPLJq7pQEE0R6M
 9WmhMR5Tsr2k0yjiZyNl35gCeyg2vAxFbuieKDLsg6VLDNEECkznCDDDWRi18Bdxovdd
 K1W/9/fiMsObwxqX+CuXcBBKmHcCdnagV9QLNuzmBVmmKvyz/GBJI/BkdTiIouto7Ix1
 f39hKl8M6p3a0ecun+PBsoOe5IBa6gk/HaR4NAQU3jyg8bBl0oPVmi5KWfvAYYiwCcsS
 6wCpR4HGQyyMySwcVmM2BsBt+KTAZidsXqTFy4uUzEyN/9wk1LqaNyeg8WnZm029QFH+
 xgfg==
X-Gm-Message-State: AC+VfDz2+GkWCnVzlLWsxNI3w+OGqmKSMWvNLEy+86XHNz26Cv5hd/Wc
 mBIjB6i179rY4QlKpGGuxLPK5g==
X-Received: by 2002:a05:6a20:748e:b0:10b:e0a:1319 with SMTP id
 p14-20020a056a20748e00b0010b0e0a1319mr3549226pzd.13.1684681297191; 
 Sun, 21 May 2023 08:01:37 -0700 (PDT)
Received: from [10.40.30.162] ([66.172.120.86])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa78705000000b006437c0edf9csm2744487pfo.16.2023.05.21.08.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 08:01:36 -0700 (PDT)
Message-ID: <37df70b4-5ae4-f36b-a349-303828545262@linaro.org>
Date: Sun, 21 May 2023 08:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/27] target/s390x: Use cpu_{ld,st}*_mmu in do_csst
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-18-richard.henderson@linaro.org>
 <a56f5acc-5716-8598-e49c-d1f6c19e144f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a56f5acc-5716-8598-e49c-d1f6c19e144f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: F2z8y7RjewwF

On 5/21/23 04:21, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 20/5/23 18:26, Richard Henderson wrote:
>> Use cpu_ld16_mmu and cpu_st16_mmu to eliminate the special case,
>> and change all of the *_data_ra functions to match.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Cc: qemu-s390x@nongnu.org
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
>>   target/s390x/tcg/mem_helper.c | 65 ++++++++++++++---------------------
>>   1 file changed, 26 insertions(+), 39 deletions(-)
>>
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index 0e0d66b3b6..b6cf24403c 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -1737,6 +1737,9 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>>                           uint64_t a2, bool parallel)
>>   {
>>       uint32_t mem_idx = cpu_mmu_index(env, false);
>> +    MemOpIdx oi16 = make_memop_idx(MO_TE | MO_128, mem_idx);
>> +    MemOpIdx oi8 = make_memop_idx(MO_TE | MO_64, mem_idx);
> 
> 
>>               if (parallel) {
>>   #ifdef CONFIG_ATOMIC64
>> -                MemOpIdx oi = make_memop_idx(MO_TEUQ | MO_ALIGN, mem_idx);
>> -                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
>> +                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi8, ra);
> 
> Why is it safe to remove MO_ALIGN here?

Alignment check already done at the start of the function:

     /* Sanity check the alignments.  */
     if (extract32(a1, 0, fc + 2) || extract32(a2, 0, sc)) {
         goto spec_exception;
     }


r~
