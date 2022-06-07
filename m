Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2170132lfb;
        Tue, 7 Jun 2022 07:53:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvC/p9amcAfBJoSX6IQfb1egqPeWkq3CxuSYJzRYPynITaYWCLSMCmoTHdvvHwn4scSCVo
X-Received: by 2002:a05:6214:18c6:b0:466:d2b5:772d with SMTP id cy6-20020a05621418c600b00466d2b5772dmr21095312qvb.1.1654613621735;
        Tue, 07 Jun 2022 07:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654613621; cv=none;
        d=google.com; s=arc-20160816;
        b=dxXnYIvraMrdFoindVXdL0vZEvAXmhD3p5WyT52jezROA1PhhiEYOvqAzDFlu0zPFA
         jDHVmVrrQtHf/6b26ialysO3blFlUyPZl+QdU/afe2oJY03CGVGEQmG4kcDJs4aoH4IW
         f+MBVd0yfVIJQJ/9aqfCJXNib7pI7PIPfGTAbA/VJg+u/NbPqBnZOpbFs4EnzD+Yzxdw
         2M68nhGrYcATbbYFv2j2llHNkFIjbQwIzc4mICTdVIo/HhSGlQlv5JkdsXvLP+A+hYG0
         b2V6590uY/vrbz9LK91KzUXm14IcaljB3W0t6+HwmJ4Hd3nDG2xLasoKIa7HOAzD4feW
         rTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9lew3Vab93rATq9CB9iMw4gJdt0bjCsmFQH31nXWRRI=;
        b=il9YuwiZ7gxUuS9qq8HkjTOgdZPzZiMhr2/1Ue8YFJ1X3NwYGlp0HrWEZkQf14zcU2
         PwxqfvUdkvlFyQnWH15kkBjPrA1wOtQTmvOhP4sOIFpHhd8csQ6XGn09IBRRMM8mx9SO
         oRaR1B+/8YKVEHor5FQdQIqYiwDKQXPclZfwETKElbFiHQ4P9opHtsNwxow2IHyU/7yJ
         hvqY/I/XMh4sc5gLIk4g28VVThKrv3c3LHlFaMatioKDwr7Qk6pzj0u2MW3t2L3WduyM
         ch5ioZ6aZSK3A+AhiACT3dV+B0Evu8d+8UfiNtOT4mEn5xX7ksOChaSLvS2B1dpvBkRs
         pjiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNC9Es6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u190-20020a3760c7000000b006a6a86ef669si6075948qkb.419.2022.06.07.07.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 07:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNC9Es6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyaaP-00059R-4p
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 10:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaZV-0004CK-DF
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:52:42 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaZT-0008Io-Rd
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:52:41 -0400
Received: by mail-pg1-x529.google.com with SMTP id h192so9289274pgc.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9lew3Vab93rATq9CB9iMw4gJdt0bjCsmFQH31nXWRRI=;
 b=mNC9Es6hEOll3dLCiA28pYnkXWK3EuYMXsB83X6QJ7UWTAuPSacBp0lXVuva7oaveg
 wsrFrOzrjoyJBHT23JRodPrIoWrjNEevnN+rsaUdSwBP6pSFO2s9D/N1s+Ee2UComdXj
 K0WvrnX4Zlt6x20h10j+X6Xi796Fi1xv7RgKf8Dy+rZg02gCQKkoLgAZ6LXTH1Bt5xPL
 nT6D+P42tcaxoZy6ogOdvxsjwvnfobjNyRAX2Gcq7BVyDootgb5Y9RvYlq+TOmLBTYbv
 Hm+xv4ISUgr7s+tKcLi3J1Nk+96n+jIjBX1ZlUoOd1uakPuVzVFQ2gjEQUGJGEqozvsN
 yUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9lew3Vab93rATq9CB9iMw4gJdt0bjCsmFQH31nXWRRI=;
 b=IT3FpSjOKkbxHSzbmrsz8lslw9G08Tdc2Ku4QQotPP6zeYohclCrap6NBu29ilBpTj
 gNeAWQ084RW9ymFEG3zgPjpikhOmXZnecYnnRDarbpgWHG2Zxng2j7/4GNooUhBcN53f
 texN0ZaQnWbJDXHXIovQhxlk2m9x+RaRj3K35o2pETb2ByW4/obdAMESCVPAp6AKwgF6
 5VGE8sisB0LILgJkSFcNHw6RAp4iHbh5+gkWgH1wK6oSpOUyBI0pcW0km/Sq+8Aqt1OO
 xjf2dgGkdM30HfKaMHjhoJY5SRZenmPncxD2Qrm/xbqdCZzF4lkTOfHQmNZLOiy7L4IB
 AZkg==
X-Gm-Message-State: AOAM530b8R6pxfGbKrV0Ydo7CVdDW0QEYVshUpX+SV6tA7LkAgLAi4DQ
 /eaaJztyCbk8vol8S0baQ32E6Q==
X-Received: by 2002:a63:594c:0:b0:3fd:9b8b:863d with SMTP id
 j12-20020a63594c000000b003fd9b8b863dmr12058114pgm.250.1654613558357; 
 Tue, 07 Jun 2022 07:52:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902710600b00163a6e1416dsm12701059pll.32.2022.06.07.07.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:52:37 -0700 (PDT)
Message-ID: <c2d17836-bc74-6c55-251b-0aabe223ac27@linaro.org>
Date: Tue, 7 Jun 2022 07:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 41/71] target/arm: Add infrastructure for disas_sme
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-42-richard.henderson@linaro.org>
 <CAFEAcA8fKsmQLqeNOJYiJ+dDTLWLnfTXiVO+wMt4OR2+ixzodw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8fKsmQLqeNOJYiJ+dDTLWLnfTXiVO+wMt4OR2+ixzodw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ThSyjYIdKIhj

On 6/7/22 03:03, Peter Maydell wrote:
> On Thu, 2 Jun 2022 at 23:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes the build rules for the decoder, and the
>> new file for translation, but excludes any instructions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -14814,7 +14814,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>       }
>>
>>       switch (extract32(insn, 25, 4)) {
>> -    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
>> +    case 0x0:
>> +        if (!disas_sme(s, insn)) {
>> +            unallocated_encoding(s);
>> +        }
>> +        break;
>> +    case 0x1: case 0x3: /* UNALLOCATED */
>>           unallocated_encoding(s);
>>           break;
>>       case 0x2:
> 
> This is grabbing slightly more of the encoding space than it should
> according to the Arm ARM Table C4-1 "Main encoding table": SME
> encodings require bit 31 == 1 (unlike SVE where bit 31 is not decoded
> at this level).

Yeah, well, full and proper decode is done in the generated decoder.
I don't feel the need to distinguish that bit here.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

