Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1319969ejb;
        Mon, 22 May 2023 09:24:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FKsiPQOzkrDalCNmHN8oIeosYlt2FsUA1nNltZOocbXqiUSoQv95JqcqxdLUwyVOHjQFP
X-Received: by 2002:a37:405:0:b0:75b:23a1:362a with SMTP id 5-20020a370405000000b0075b23a1362amr1270690qke.59.1684772685329;
        Mon, 22 May 2023 09:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684772685; cv=none;
        d=google.com; s=arc-20160816;
        b=cHPGMnrnQUnFls3wwKHfpWKWTv9mKrjJL76NTXxgAZQoWaNRv2r55gjuG7c09wv9N8
         OxANCUK5VmUgfyakndzz7ciX8Ft+hECvHSw+Izgthdl/MhiaTbNnS7Ocpg+N8IS3RCw2
         mB0uR0O+8EiAh8bERQCY9hgMeXi8NQmJDtibs5A7Xmc5luFM7qau3V85gLf1FOD3Lfrg
         S6TFuFb0Q9J6yuuGq5GeA3hoQ3/2YeCmRg/idILum7FkflOQfb1fOXoIdd6+IucGt+G7
         Vtdwqwoow4I0QBNm5ylIkaie0sI3x36GbK8dqdfP1oqifvQaaGlku7Jx+5DitLfwINgN
         uSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RbbqGfzEsOqlIrhpkyoVznWK6opmGYHtG0SlEsH5+4U=;
        b=uW+OQ/uMxvN5cp50BqcsuRwL2wNWSLxaKIXKWxBvyRM9TXiwf1rOKP7qxcmQUbggd8
         yQuu8nEO0E2XdMNayp5yY80HhNogGF0ef0STfRbeAUsYMlAYrzD/vjipRmeWwi29Gpv8
         iOwmmayNP6QUzeqtkYwgAAoqY7amFmAEXXDIycGOSF4VIFqZyg36o3gfeWExw53rZwgm
         jfXtQaB40nFo8OXZGDQpCw3GC2tWnZTp6UYKHL0qWye8gSQMcqZD1HdtXHPo1HY/eg1T
         Xwdrk3PfTdP0elEIg4toaHYIrQBzQIb3xF7G93vPJL5dsjWUsdQgfEQGdIsqWK3iU6gN
         NDYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsMlBUa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05620a164a00b0075b0769c728si2113833qko.212.2023.05.22.09.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 09:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsMlBUa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q18Kq-0004Bm-Vl; Mon, 22 May 2023 12:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q18Ko-0004BS-HM
 for qemu-arm@nongnu.org; Mon, 22 May 2023 12:24:34 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q18Km-0005Dt-Se
 for qemu-arm@nongnu.org; Mon, 22 May 2023 12:24:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-253e0f1e514so1924207a91.1
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684772671; x=1687364671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RbbqGfzEsOqlIrhpkyoVznWK6opmGYHtG0SlEsH5+4U=;
 b=SsMlBUa0cpWApru52YhsJmxniz04zSFrJDyVh4bCaggJFiwUvaq426lcwvqTpn9SJ9
 GMw/kjXdvTRE/+oYH00Wiy5fXEK4EpwCfusCUn9uiSegKuPvlavOTtXjSGkp/eVZm6BC
 FFdDrUGv4lIbI042MpyjggKHHwDysB5ZLD9fpD3xDtzCXoHLUJR+xTgiKUnKnK5BKyb5
 IbirREKSpdnLVxQvpdCy6VJRaWcDlmio6oVUHXw0EJsytwhGXNPqMIPJPWmpkjsX+0Gc
 WoiBsmhjpQUsCJ/buIkSavxIUoBTX6smwUxqt0sAt003oNHOc0FdtAKELRS9v5gtt9Fl
 0l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684772671; x=1687364671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RbbqGfzEsOqlIrhpkyoVznWK6opmGYHtG0SlEsH5+4U=;
 b=Iikn820xy1fSrjElZa/3hofrTL/voS+YJ4fpCgChJUe0hNwpF1x0WaVCeP8GXsDpJ1
 Am67IvyXlIZfBYHWODGBoFHlokS+Tvrh3wxM8/xQ9pOZr/fpEXGkV49aRVw0ZsnTAZZ2
 xgYyIEB43rKHipIQVDOHlAxX7lSZMF00kK8v8XGKS6AobEU9n1SvUcStjMX4Nz24R4cx
 8qwR/3UzcbMjkXc7fVYBkvDoOlITfJpZabJ7Yi57RWa8/nA9nlO8Bl4sRAagzsnGaPvm
 j6Mran15w/LLyLk0w1EsHku3LjRw8N29XsrokKoCLrYIw8QTgJKhVG/dirniYPRMK7Rg
 qx8w==
X-Gm-Message-State: AC+VfDxSlG7R+lJ2VRID/HC39eBJjibHJwnI8pMLB2Ik6+QuOdRoeI3M
 F7FC1XY808du+4ER7d1maai/Iw==
X-Received: by 2002:a17:90a:6b84:b0:250:8f09:75f2 with SMTP id
 w4-20020a17090a6b8400b002508f0975f2mr9786671pjj.22.1684772671252; 
 Mon, 22 May 2023 09:24:31 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8063:704:7944:82ed:f254:5737?
 ([2607:fb90:8063:704:7944:82ed:f254:5737])
 by smtp.gmail.com with ESMTPSA id
 cq5-20020a17090af98500b002508d73f4e8sm6042893pjb.57.2023.05.22.09.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 09:24:30 -0700 (PDT)
Message-ID: <224a43d9-0ded-0b6d-03eb-65e27535e297@linaro.org>
Date: Mon, 22 May 2023 09:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/27] accel/tcg: Unify cpu_{ld,st}*_{be,le}_mmu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-17-richard.henderson@linaro.org>
 <8d6e67d7-52c0-aa60-76cb-bf70d586cf7a@linaro.org>
 <015fb09b-6f34-dec4-d241-8fc5c9a44d7e@linaro.org>
 <5a8ef696-5833-5a6d-7b60-e946f0bdcdb7@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5a8ef696-5833-5a6d-7b60-e946f0bdcdb7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: SGKx2O6pW6xt

On 5/21/23 23:39, Philippe Mathieu-Daudé wrote:
> On 21/5/23 17:00, Richard Henderson wrote:
>> On 5/21/23 04:15, Philippe Mathieu-Daudé wrote:
>>> Hi Richard,
>>>
>>> On 20/5/23 18:26, Richard Henderson wrote:
>>>> With the current structure of cputlb.c, there is no difference
>>>> between the little-endian and big-endian entry points, aside
>>>> from the assert.  Unify the pairs of functions.
>>>>
>>>> The only use of the functions with explicit endianness was in
>>>> target/sparc64, and that was only to satisfy the assert.
>>>
>>> I'm having hard time to follow all the handling of the various
>>> ASI definitions from target/sparc/asi.h. ...
>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>   include/exec/cpu_ldst.h     |  58 ++-----
>>>>   accel/tcg/cputlb.c          | 122 +++-----------
>>>>   accel/tcg/user-exec.c       | 322 ++++++++++--------------------------
>>>>   target/arm/tcg/m_helper.c   |   4 +-
>>>>   target/sparc/ldst_helper.c  |  18 +-
>>>>   accel/tcg/ldst_common.c.inc |  24 +--
>>>>   6 files changed, 137 insertions(+), 411 deletions(-)
>>>
>>>
>>>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>>>> index 7972d56a72..981a47d8bb 100644
>>>> --- a/target/sparc/ldst_helper.c
>>>> +++ b/target/sparc/ldst_helper.c
>>>> @@ -1334,25 +1334,13 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
>>>
>>>
>>> Shouldn't we propagate the ASI endianness?
>>
>> Already done in translate, get_asi():
>>
>>          /* The little-endian asis all have bit 3 set.  */
>>          if (asi & 8) {
>>              memop ^= MO_BSWAP;
>>          }
> 
> Just in front of my eyes 🤦‍♂️ So:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Maybe amend the commit description "The ASI endianness is
> already taken care of in get_asi() ..."?

That's what I was trying to say with "only there to satisfy the assert". I have expanded 
on that a bit.


> While looking at get_asi(), ASI_FL16_* cases overwrite
> 'memop', possibly discarding MO_ALIGN bit. Maybe this can't
> happen.

Ah, that does look like a bug in one of my recent conversions.


r~
