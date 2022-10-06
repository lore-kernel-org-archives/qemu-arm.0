Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp698135ocb;
        Thu, 6 Oct 2022 11:58:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZfiGrvD9dwPUCzniW+yKEOFq3HUkdCZrX6NfZWr+AxLqn7AkkjFVy2YOkXFkzJkB2WMWG
X-Received: by 2002:a05:620a:1404:b0:6ce:1602:d46d with SMTP id d4-20020a05620a140400b006ce1602d46dmr1250711qkj.409.1665082731747;
        Thu, 06 Oct 2022 11:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665082731; cv=none;
        d=google.com; s=arc-20160816;
        b=kr32+X8cq6r238dssqsOOBmboKmCUvOucVQRTdfmRBFB+nsodzw7Ln77M1KBhhrR76
         zZACvTbarpJUcC9tmxFdQWwqtrG7Fx3xniRf6Q9IZ0eu8UNhMlcIJ5P0stikHATfVhyr
         bJmQ3H97kDOuZmgNu9VgzD/ytMnjgbPqMsFCCPZW908LBPAsHbdfU7rm32GcPql645m/
         c3WROM9IVL+oGSkhcRi+Vg6zbEhafjhNilSIrMw/2Jp4muz25DDN1AFex25cIeMfBW96
         Ox9Z8xi35XpJCay2LM/+oc5aUj2x8FDi9WS3SpDIfdtoePvBpnh8k9eUlv0shI7v8Rfw
         XDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+dPuwhOH1yoJY8fkVSnyed714ZhRTh3NCFjinHaVSFE=;
        b=eNaWyimAbO8m6wszjSGE0firlZ8Zv1cPQEC3rd2p99+FPW3uf15flu2G9cG7mw0jZT
         t9jzXf68ZgzXJP1Y5yh1XnnWuZUCrQIVlshlODs+IlesqAKAk4ZLXoh7fQZidtCCAKk3
         eqXoPWGZc5xq5m1xwND2vX/BUxVZOHl0AH9vJ227tfOSoETeVIZvrGd4o7InjyK9klgW
         N6jejJmjMdkHesob8WeIuguTE8MURx1SsKDp+PMGOUAC7ibtUHr6NfcXBcIHUf9Bp48d
         Sirj1YzZeyFoDdc2yJihVj7hFbfCOtbiRudTnnuWKKT9je1h1Yo+CMdbTd7G3mL25/XX
         tWGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQZSfEE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b004738ba79f81si4087060qvh.300.2022.10.06.11.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 11:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQZSfEE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogW55-00068v-CQ
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 14:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogW0E-0006wy-6l
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 14:53:50 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogW0C-0006lN-4l
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 14:53:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id r18so2586628pgr.12
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+dPuwhOH1yoJY8fkVSnyed714ZhRTh3NCFjinHaVSFE=;
 b=GQZSfEE3ahsCnZOnZsIUNU3zojVamZHCWDT/Hewg8QnGAMgbwFP2gAEIlRPcFXVWLe
 2OSY/LtdLoMuP+RRK5q67zbgj247p7p/FCmG3QjJwVRKs+ogxy4vgXlpXxie0He6eQJO
 Y3pIaEU7xLnkdfHNLxnMRwxuLoo2/YzHduyPKV876Q68cO4b9OkORA97MrddWiO85ktz
 Dayj8qH0kfNeWsFSsLWcUxVcNGMp39if2UjOhdSKQOoRbABZHYlQ+ST1QU8G0rq9lW9j
 PLA+TL+VUx8YBPOLmM4Wryjg1+gvHKc/gJ/xzTfSS9Otibx2EJM1eUviv6JqIuVuV6VS
 FP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+dPuwhOH1yoJY8fkVSnyed714ZhRTh3NCFjinHaVSFE=;
 b=JAFS36rYV43P4LKgO5Aoz72amXfIdDF/VjCDBFToIm96QnDrrdMlij4ASjbYt1cAiB
 CnF8q9fBxNFhfu6VjK6g29/5GPRls/Mb9AGwblfWe707AutxxkWTBSQ/PFTSYTFiXh1n
 AgCZaKkxzv8zRbv4e8lC9eZRzFpNrL3at9YE+t4Nx6rEKUJRXUjLC2IlUGqtuRn20egv
 aNIihLjw4nzjoGDw8Hu3XWB3Q7qPSgytQtbl57BGIN9uRkMwxdZ3kae5cub0e7jdWrWo
 5+jcVX8fRxjBfXQyE7lFU8b8PNfQ9OCk7KueIHkmGDpiNQ9XoW/0NzGUmcPOj/+dWOyA
 n4bg==
X-Gm-Message-State: ACrzQf2s/b1Mabn9wHnYilr9JaV4r8BF9JuznrWRpEOZKCvi4gqY6dPB
 LErQ/DenHyZpmB1s2bC/VIHAWA==
X-Received: by 2002:a63:f358:0:b0:43c:5e1:985 with SMTP id
 t24-20020a63f358000000b0043c05e10985mr1074072pgj.5.1665082426097; 
 Thu, 06 Oct 2022 11:53:46 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b005360da6b26bsm13224618pfe.159.2022.10.06.11.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 11:53:45 -0700 (PDT)
Message-ID: <5d3984c4-54c3-463b-4595-361c5e65e43d@linaro.org>
Date: Thu, 6 Oct 2022 11:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 23/42] target/arm: Use probe_access_full for BTI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-24-richard.henderson@linaro.org>
 <CAFEAcA8L7BBHZ0Gfi7fm4pbZvYBd=Shu9bV6M5rQqcU-EU-p6Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8L7BBHZ0Gfi7fm4pbZvYBd=Shu9bV6M5rQqcU-EU-p6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HUR1BfCUvDZ2

On 10/6/22 07:57, Peter Maydell wrote:
> On Sat, 1 Oct 2022 at 17:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
>> In is_guarded_page, use probe_access_full instead of just guessing
>> that the tlb entry is still present.  Also handles the FIXME about
>> executing from device memory.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-param.h     |  8 ++++----
>>   target/arm/cpu.h           | 13 -------------
>>   target/arm/internals.h     |  1 +
>>   target/arm/ptw.c           |  7 ++++---
>>   target/arm/translate-a64.c | 22 ++++++++--------------
>>   5 files changed, 17 insertions(+), 34 deletions(-)
>>
>> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
>> index 118ca0e5c0..689a9645dc 100644
>> --- a/target/arm/cpu-param.h
>> +++ b/target/arm/cpu-param.h
>> @@ -32,12 +32,12 @@
>>   # define TARGET_PAGE_BITS_MIN  10
>>
>>   /*
>> - * Cache the attrs and sharability fields from the page table entry.
>> + * Cache the attrs, sharability, and gp fields from the page table entry.
>>    */
>>   # define TARGET_PAGE_ENTRY_EXTRA  \
>> -     uint8_t pte_attrs;           \
>> -     uint8_t shareability;
>> -
>> +    uint8_t pte_attrs;            \
>> +    uint8_t shareability;         \
>> +    bool guarded;
> 
> I notice this now brings this very close to just having an ARMCacheAttrs
> struct in it (in fact it's going to be one byte bigger than the ARMCachettrs).
> But it's probably better to keep them separate since we care a lot more
> about keeping the TLB entry small I suppose.

I kept them as separate fields like this for simplicity.  Since CPUTLBEntryFull is 4 or 
8-byte aligned (depending on the host), the structure still has 1 or 5 bytes of padding 
after the addition of this bool.

>> -    /*
>> -     * We test this immediately after reading an insn, which means
>> -     * that any normal page must be in the TLB.  The only exception
>> -     * would be for executing from flash or device memory, which
>> -     * does not retain the TLB entry.
>> -     *
>> -     * FIXME: Assume false for those, for now.  We could use
>> -     * arm_cpu_get_phys_page_attrs_debug to re-read the page
>> -     * table entry even for that case.
>> -     */
> 
> I think we should keep at least some of this comment: the part
> about the reason we can assert that probe_access_full() doesn't
> return TLB_INVALID being that we tested immediately after the
> insn read is still true, right?

Yes.


r~
