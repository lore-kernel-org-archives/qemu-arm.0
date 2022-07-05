Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3581901lft;
        Mon, 4 Jul 2022 18:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHE/oECTgl+6PFbG2lW+aO9kZ/imMn6/vBGNLiBFUaSj3lh7FU/QDbQt/BnSlYWZ03l1D3
X-Received: by 2002:a25:eb02:0:b0:66e:71d7:86f6 with SMTP id d2-20020a25eb02000000b0066e71d786f6mr116956ybs.468.1656982923149;
        Mon, 04 Jul 2022 18:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656982923; cv=none;
        d=google.com; s=arc-20160816;
        b=W97aS45vhWdRS56sAB/gvR8Vbn/SjpDkG61vmgOMBVRfZmTW/UCLLPaCT30ixeU5k7
         eUuWe2SqOTNP70KDJyQpzaQ3h5M30WijVS6k35l//nuuUqCeLpvnFCb2gNfjoxMHi7a7
         0fxixrIiwQc9zCAG3CDbI9Vr4ejlW0vHNV0ZnrDqJ3otKGUCgIzSDvGF1Zxu97dP7jCw
         vuzbXPzEvpyvVzybyPLyaLA9xFqbQWV6R6WX07C7OhxBQERrFzwst6vldj0OPEjOmDK8
         cIBQ62hdd/u1pgO2K/KRFKWahSj130zWCoPo6cuyBRDTg/7m0M0BZRh1gvwbrThmTknt
         QucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R7RBnlbUt5BFwqxWwuuiKxs9cnYoeQUZlz9hjSTyulA=;
        b=BxjQ7b5Xylkyk/nF6mECzgzI8fiAMf+gR4FHEpgEZHCKfkXJzPVjQCtxC67QBezI8U
         t5LLeTN32LWfIXF5g63gktVfjcH6t54IdYZ5X2IPq5hVcbPSZ6NnPizMEKrNS/nAT/cT
         B5jQthf9TYq3bBRwXhexEu1pzyV3LAUhEN1EzzXzgs8VYWqBdz69ICFaUMrZt0k65qbp
         OArylPB3O+DrXyCn8p+DBjRS6KOMTMlQlxJ4HkKrkptM1WIIZjTQa3EzFrOzhSv0bnGE
         h0gNkVQb2dGgd93ZmL+Y0lC7LYOk7XRSxLKi6n5X0JC7MTDT7JYohUFvwQ+bLhaGe9nI
         0JOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuLCZyHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a056902072500b0066e37004244si10692669ybt.671.2022.07.04.18.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 18:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuLCZyHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Wx0-0004UC-GB
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 21:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WwZ-0004Tt-4f
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 21:01:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WwW-00080j-RR
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 21:01:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so6967928pjo.3
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R7RBnlbUt5BFwqxWwuuiKxs9cnYoeQUZlz9hjSTyulA=;
 b=FuLCZyHXNzbG9IAJZ4z58zmETr8tQMCAELFckSMxaMxOlVvdYw/zIb7c8DnY2B5chn
 wgSB5Sm67RzWVZKA9NJ/LmQJv2vOu14E+v5/Bp3BwhPHIJDvEbCxdEdzH3laQbndFdpk
 otKZN5fn1ES5VfW3bXQ1cd+Mp35dBUw7t72G4e6qSpffu+1kSKg4JuqKoPyNAO/vmspt
 0bljE1k6vm3jMkv0qwYfomyNRxcPv8+CRjRDof8MrXE+gjMb2kYoCn6Z30g2Dds+F7Zf
 t3s/PX4Gc0pIGa1/XMHZtaAYWKEIKKmS9ESstcSXOMPZaODb5zpAY0wJ0SvZrNT6PTD9
 HlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R7RBnlbUt5BFwqxWwuuiKxs9cnYoeQUZlz9hjSTyulA=;
 b=Qf5M+VgoaounZ4fBZcN5BKdLFj/8ZaRmCnrhja7XDuopNvj6BjbJUrfMgeed3nnuo3
 szAcCcu66dBHKsoThrSx3NhUOxWUooTP5j72hAK/LtAkmXvIlR5E1XedWjSyPwJUCGy9
 db4wiN12Okw/tUoCRLrMawZVvMiGKz2HxH35e4k2D8o0+LDd8R9vOMHqQiyLraOhKmJb
 VilhmVabWJNQOprjxMZGkIREgDP3yltj2Ha4IuL8CVmFdipKzb1A91Ynhk9n/AgMh02+
 rPn2stvFmEiD9mtekhdpJTZAzZqpJ0AhH6hAZHeOrvY8nEQe4yzAxDHi92qd9twCaMXb
 +zbA==
X-Gm-Message-State: AJIora9A+rJlHs+nUhYpC4tx++NAkrhkNwSfGLbJhk4sj5Ic8n6/0Jr7
 RrVl0T4yA11YCPvwA7SAUYW0lw==
X-Received: by 2002:a17:903:245:b0:16b:9c49:6b1c with SMTP id
 j5-20020a170903024500b0016b9c496b1cmr32837674plh.153.1656982890955; 
 Mon, 04 Jul 2022 18:01:30 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s91-20020a17090a69e400b001ef831a2015sm4003626pjj.22.2022.07.04.18.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 18:01:30 -0700 (PDT)
Message-ID: <6006e1bd-722f-a0dc-0207-5bb36b29cda6@linaro.org>
Date: Tue, 5 Jul 2022 06:31:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/62] target/arm: Enable PageEntryExtra
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-3-richard.henderson@linaro.org>
 <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /LMHlJ3kT0OQ

On 7/4/22 20:52, Peter Maydell wrote:
> On Sun, 3 Jul 2022 at 09:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Copy attrs, sharability, and the NS bit into the TLB.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-param.h  |  8 ++++++++
>>   target/arm/internals.h  |  5 +++++
>>   target/arm/tlb_helper.c | 14 ++++++++++++--
>>   3 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
>> index 68ffb12427..a14f167d11 100644
>> --- a/target/arm/cpu-param.h
>> +++ b/target/arm/cpu-param.h
>> @@ -30,6 +30,14 @@
>>    */
>>   # define TARGET_PAGE_BITS_VARY
>>   # define TARGET_PAGE_BITS_MIN  10
>> +/*
>> + * Extra information stored in softmmu page tables.
>> + */
>> +# define TARGET_PAGE_ENTRY_EXTRA
>> +struct PageEntryExtra {
>> +    /* See PAGEENTRYEXTRA fields in cpu.h */
>> +    uint64_t x;
>> +};
>>   #endif
>>
>>   #define NB_MMU_MODES 15
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index c66f74a0db..2b38a83574 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
>>   FIELD(V7M_EXCRET, S, 6, 1)
>>   FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
>>
>> +/* Bit definitions for PageEntryExtra */
>> +FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
>> +FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
>> +FIELD(PAGEENTRYEXTRA, PA, 12, 52)
> 
> So why do we want these things in particular? It would be
> helpful to describe the intended uses in the commit message
> to save the reader having to read the next 60 patches to
> find out :-)

Heh, yes.  Basically, it's what S1_ptw_translate requires (pa, attrs), so that we can 
report a stage1 ptw failure, and what do_ats_write requires (pa, sh, attrs) for filling in 
PAR_EL1.  Although within these 62 patches I didn't came back to finish converting 
do_ats_write to use probe_access_flags_extra instead of using get_phys_addr directly, it 
was a goal.

> Is wanting to cache the physaddr an Arm-specific thing, or is it
> something we should consider having in the core softmmu code?

I'm not sure what other targets require for their 2-stage page table walks.  I guess I 
should have a look (riscv, i386, ?).

It *is* possible to recover the phys addr from the iommutlb, because I was doing that in 
mte_helper.c (see code removed in patch 5), but it's certainly not simple.

>>       if (likely(!ret)) {
>> +        PageEntryExtra extra = {};
>> +
>>           /*
>>            * Map a single [sub]page. Regions smaller than our declared
>>            * target page size are handled specially, so for those we
>> -         * pass in the exact addresses.
>> +         * pass in the exact addresses.  This only happens for M-profile,
>> +         * which does not use or require PageEntryExtra.
>>            */
> 
> Do we have to exclude M-profile here because the PageEntryExtra
> data is strictly-per-page, or because the way we've formatted
> our extra uint64_t requires the physaddr to be page-aligned, or both?

Because our extra uint64_t requires page alignment, and reuses those bits.


r~
