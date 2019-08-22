Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1053934wrs;
        Thu, 22 Aug 2019 10:22:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGTRTqNBbyWtvgZ3NC+55QKD5n5zWugRMPONAserf1ajbH0OpCpCSyrcOOusCMsq7iaAe+
X-Received: by 2002:a17:906:358e:: with SMTP id o14mr340266ejb.73.1566494532536;
        Thu, 22 Aug 2019 10:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494532; cv=none;
        d=google.com; s=arc-20160816;
        b=fo6IK4qbE2SUGkdpFNvTmhu37jX/sEBPi7iAxu9hAJjrL3cMQRJG/oKbHpgk+Mu+SL
         FOeio5P8WUU9m8eBpejBHsH26cYXP03udme3ZIAZ4uvFD6yNRc6PGsxneQsHh/mWRiQd
         ahzIylSMcOkavc1Vb1eARWes5G9uBBtEvkYfQ2MUB2I5kxprl6L01qiRWowCKL8LzU+i
         +sHZEfuGz/R8CgGjiWFWWxbXN5s/uCEYRJCBK0U2V2LnkxA2nqZZkNJgb9W1dlYQTgdA
         tRLG+N6rjSgx/y60+GIJ3FuSmVQFDTLpqp0xvtUZiSvkCuXXVfpQLn5l3h/hixPgI+Hw
         eMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=U+h11xSdzMrGrqS1io0flecvYnccMNHcrfEYrykolK4=;
        b=QboVTYJstTxp/vqsKszfMEIVZI117ucdXHPOxkZxJPHRcY1fShhHz2aO4DK6OtP4m0
         1y+ZJWC0One5Py53jDLZ72MdwmFAv21GN80x1hhLahVZqZHRHJdm5OgH6y2JAp84YhsB
         +ScQc503mvAcw+QS/yPjGbKy3Wqwu1mUib3PtHX0T90TTeol92LOQNF2Cbmh6Bye0ZbF
         2q6Xzj6MGucfjMdY9KzLM6N1LuQ5OkzpwBJ9z819WRZD06vT2pObnHThgr26u03IOag6
         1Y6q0ifLWNKi6eiymNaC46rqIAN5bLyLU0lL/0WSqFHdpoqhKcdoWPpaDSk7aga9Wg6r
         TpZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JB0y47A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si229684ede.369.2019.08.22.10.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JB0y47A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qmp-0003SH-Eu
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0qmg-0003RS-6u
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0qme-0001ux-Nr
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:22:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0qme-0001uR-FG
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:22:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id w26so4374688pfq.12
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2019 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U+h11xSdzMrGrqS1io0flecvYnccMNHcrfEYrykolK4=;
 b=JB0y47A+0unA2+UW5rzSDdDs5nuZVcUcWXqbypCgkmlvP1daIbF4tftGQKEJYUGzyU
 6QxYg/jNDzS2FQZOzdmwfWYhZGEUPHOVZJv7qXYfIXBhYH4qckqZbnT0by5vhwVdahH5
 1BtZhVM9rmVTS91Nr0XxJ5PUWAgFZn4FCc3bK+Tjgqci1BTyXJBUg/pztJdOU/O81F5J
 kJSefAqEAoeiUhCzAIKUxqvnVBoN2dFV9FNS5L1L+aR9WS5Bw4tjkNGTQPaArPaRlqP+
 hu34mwe2qWIMXkVuoEhrYtoAnz0IatYG5SeUcD6JlkARTFyEjQAhHLSqpZs/8zdlPwe2
 4fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+h11xSdzMrGrqS1io0flecvYnccMNHcrfEYrykolK4=;
 b=rFlUwgckIjSd8SdYwVOIOnpa538MMRQ07YcRFb2MKCimswfJrFMVzf7+vgdwTraQek
 ZrPT+vBX/7+SjiCGDPhMVVL4DCoN9eWaHOh6CzF4431Qccnd9b6gIKommziz+elX+MBn
 cHUQX+v7bSL7TLucFemMyYVUGsAAzTL1fmyP8zplQTPvmg4dQObJCKbEGO2McOdBEt1c
 by2AOzST6VGEXb1Qhm3XO64yX68VwDQLhyySCOdvMaZNPnjQIVdh7722xOXtjUqt48o+
 nIjcyo4ibz0zcvo41/hZ8iC5h0ucIvde7KJYljY1X54hl0BMOlOxfq5hKf5+ENI/NOKH
 jr4g==
X-Gm-Message-State: APjAAAXsVlC2pMhha0fTC4PftyBsuRTg39s7qiLoSr9UrhuyDk/IyLDs
 nX+ByUggUN0OeuW85YOoeK7SFdkA/zI=
X-Received: by 2002:a17:90a:e983:: with SMTP id v3mr739997pjy.81.1566494518721; 
 Thu, 22 Aug 2019 10:21:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p189sm28886044pfb.112.2019.08.22.10.21.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 10:21:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-4-richard.henderson@linaro.org>
 <CAFEAcA9abuRJXTXkEE+2M4tHQuKc+VwsqfJqEmw-w_+Fcwh0rw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b06858c3-68c1-62e4-f4fc-df61941c29e1@linaro.org>
Date: Thu, 22 Aug 2019 10:21:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9abuRJXTXkEE+2M4tHQuKc+VwsqfJqEmw-w_+Fcwh0rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v2 03/68] target/arm: Convert Data Processing
 (register)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EomR4Ydb1wjW

On 8/22/19 9:00 AM, Peter Maydell wrote:
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Convert the register shifted by immediate form of the data
>> processing insns.  For A32, we cannot yet remove any code
>> because the legacy decoder intertwines the reg-shifted-reg
>> and immediate forms.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 229 ++++++++++++++++++++++++++++++++++-------
>>  target/arm/a32.decode  |  28 +++++
>>  target/arm/t32.decode  |  43 ++++++++
>>  3 files changed, 264 insertions(+), 36 deletions(-)
> 
> 
>> +#define DO_ANY3(NAME, OP, L, K)                                         \
>> +    static bool trans_##NAME##_rrri(DisasContext *s, arg_s_rrr_shi *a)  \
>> +    { StoreRegKind k = (K); return op_s_rrr_shi(s, a, OP, L, k); }
> 
> It's a bit non-obvious that we can return early via the expression K
> here (for the "trying to do an old-style exception return in usermode"
> case for SUB and MOV), but it does put the check early where we need it.

Yes, I know.  I tried several different alternatives, but the macro expands 3
different functions with 3 different structures, and I couldn't find a way to
work around that.  Especially...

>> +DO_ANY3(SUB, a->s ? gen_sub_CC : tcg_gen_sub_i32, false,
>> +        ({
>> +            StoreRegKind ret = STREG_NORMAL;
>> +            if (a->rd == 15 && a->s) {
>> +                /*
>> +                 * See ALUExceptionReturn:
>> +                 * In User mode, UNPREDICTABLE; we choose UNDEF.
>> +                 * In Hyp mode, UNDEFINED.
>> +                 */
>> +                if (IS_USER(s) || s->current_el == 2) {
>> +                    return false;
>> +                }
>> +                /* There is no writeback of nzcv to PSTATE.  */
>> +                a->s = 0;

... with this modification.  I suppose I could expand the comment above.


r~
