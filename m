Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4324558lfm;
        Mon, 13 Apr 2020 16:19:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIgoccMrfI0Q7qsTl8ZzYSwe0R/t9w39KJKtt/YHH9u3p1erXLFnS8JxiWtd3PqZo2LRQ11
X-Received: by 2002:a05:620a:64f:: with SMTP id a15mr18822772qka.228.1586819995290;
        Mon, 13 Apr 2020 16:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586819995; cv=none;
        d=google.com; s=arc-20160816;
        b=ynQR1wpv2+80H6Z6x3eOYFA3ikUWXRnWJA6G/TkeSOguaWNOMR02W/FFZao1qn0icb
         RVLrTGmjazVXu9weE4+BDAxqR3WXuonTrPHmAvNDQDD4xm7ulEPPeOfRdvIi+hbqu7+i
         PrvAbitKWsQLeZnzGysia9PYQsJc0voVl4Z86OSkPUwa1e6wjt5DWCKwNDpk+B6mBpsO
         UeO4ayx/3q1ncQvSD6cJRodgdz++0hb8oIAKvcpi7QcKvQFC+WZKN57EElGLyIUPkLLJ
         hVkFxTg9YRK7yEU3BMowHkmcbcnWkk4R91gf4XZ39wAeV0Or1T6/eAtVgNIXtQQqYBSu
         wV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jY4NloNnYN/xR1cqdj1lfHYLk3Wix42tT4AJJzqRYFc=;
        b=HKuqvbcabWI2e7IFFutx5fbfFFN2qjfwJ0gbd/zYlP1MGugCmpcWOndsTo/GR54Nzl
         cSFVXHeJrlp2m2pgH+HeBuF98050f1yyRrwRiULQCM70pqI1m1rOXNpqu50c5rr7Vi7e
         Uo6xIlP/pcwR2vXEEyqnczLofJtICqwM+3Ke5clf5qoe79ZNI4L/xbcazEPCR47kWlpq
         3wQA+rQtoq9Un98sUgLEmuzLtjpfTWw9MTAGQpy1XQzyd2gX8nINBpxDlzaWZprPfMsC
         YQ4jOlpyD8iLkNDQHZ9nSo6hv3jCO+CsCnUgZWD9K5CzjvkdZKV2kv8U9TXTHld8MKOO
         SR9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v0X5YBDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si486122qkn.364.2020.04.13.16.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 16:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v0X5YBDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO8Ms-0006bW-NA
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 19:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jO8Mj-0006Yz-Ob
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 19:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jO8Mi-0002eB-JR
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 19:19:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jO8Mi-0002db-8m
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 19:19:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id l1so5214987pff.10
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2020 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jY4NloNnYN/xR1cqdj1lfHYLk3Wix42tT4AJJzqRYFc=;
 b=v0X5YBDB3a5m8VUpe4oBCJo30jvsgxYEfohcstDUIHZJsRj3I5s2F9Ge/xXeYa4lfA
 vmgV8q64UNkCEl50KZr1j8XtJ/vqkkg41W7XPsjXGzgQsiha2yRSO9rnfgfJZidCNPze
 b3YR/WFJBeb/XYxNrpJ1Uvu8XrH7wrZ8RvXHvcW4BCeYmFkdTMEjqtvB2cGuQgdMUOv3
 H88KrKs6nnRun8s+FTn8bh7VnaUxpYj4L+k7MTcgIsHmMFS8Y7XinwYHC0IDMp2bsODL
 QMS4JlLu6bcj51vHlefb3KKg5AlXAUiwbWlCGqA7Xa+Oaqq5bgV4FRYIW2Alj8req7sk
 ZluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jY4NloNnYN/xR1cqdj1lfHYLk3Wix42tT4AJJzqRYFc=;
 b=rSxjlB5WF8ok3XtaJezCeWLrnfTdKFEZGV2db48f//F1Q8ZDEguVNkegRZtm3ufxqC
 h9/ykfy7ht9Dnj96rtZqg0sdLL8Ns06Cn8GHXn8ptCAPxaoNjf8ZZlefkijI9AHlFWnc
 C8xoZNjdedV6+gwkCVK0yOF6MkAQYuPUq7x8nHcKItcbl/7660j3N1uc5aDKt/9M+lXM
 51Rqhivz5MWjHyJ42EJHg8lRw0CsSUdtJh91sTDtC4udgRoOOQabJiZvWFiHSRTtLI7o
 xG+w49qak9PswI3LxFU8ur/p0WfGSFsxtOhfhZfPfSIc+ltuUq42aIIvccWNn7E2bX7s
 oBDw==
X-Gm-Message-State: AGi0PuYBIseoOc+jLZxAvXpg1zBm0sjJfy/MvU9jezBtg4y3WepG4y5w
 FA1QcA/oG4nGzI5zcMmJnOX/+A==
X-Received: by 2002:a65:6250:: with SMTP id q16mr19987284pgv.9.1586819982632; 
 Mon, 13 Apr 2020 16:19:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 9sm1647315pfn.204.2020.04.13.16.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 16:19:41 -0700 (PDT)
Subject: Re: [PATCH 21/31] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-22-richard.henderson@linaro.org>
 <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae2cb680-2200-e9cb-afa1-e55593ef6d6d@linaro.org>
Date: Mon, 13 Apr 2020 16:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lu3KI31H8zES

On 4/13/20 9:15 AM, Laurent Desnogues wrote:
> On Fri, Mar 27, 2020 at 12:18 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> [...]
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index a3653007ac..a0995d95c7 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
>>
>>  #undef DO_ZZZ_NTB
>>
>> +#define DO_ABAL(NAME, TYPE, TYPEN) \
>> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
>> +{                                                              \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
>> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
>> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
>> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
>> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
>> +        TYPE aa = *(TYPE *)(va + i);                           \
>> +        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
>> +    }                                                          \
>> +}
> 
> ABAL is either top or bottom not a mix of two.  So only sel1 is needed
> and its multiplicand should be the number of bits of TYPEN.

Yep.

> vd is both a source and a destination so a temporary should be used.

In what way am I not?  Both sources are read before the write.  The operands
are all in columns of the wide type (unlike the addp case you pointed out).


r~
