Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp493881njg;
        Tue, 25 Feb 2025 12:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCCE6wAlr/IGxwLoIgSBMM8Z7c+Nfus4+Od+EyJvLueQffRAVc3q1nLU/nVWPLTE5AdBnu/XDBl0nH4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGvRftY8fTvIowQy9/5s7yv4XPFd+mU0ayCeN4wWGVs3jG3cwLviHok3ht0hJnu1mimSI7O
X-Received: by 2002:a05:620a:370c:b0:7c0:8359:7130 with SMTP id af79cd13be357-7c247f2582cmr137221785a.18.1740517049369;
        Tue, 25 Feb 2025 12:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740517049; cv=none;
        d=google.com; s=arc-20240605;
        b=aIwzSBZEE/MUeG/1R6H1XULEwKDUjyMkzDcFBUjDN97Hjf5lX1d2yppKqiGkZZhD5h
         5Q7Rl5Re7ICl/+wUhY3yFbzzJ4zedzLUY+APX4DKGRV8HJyb5OR8BaoFmNbTBp+5ztGj
         2w9bJHNBD/+DYsQ6I9JDZfRNmwylq+FBJ2VWl7+bZScKZEEAjlLHrPHE3CkmbfYVOlgO
         zroLcT+TGjNdP3tLQ2bOh+B1XbtBwNUuQ4Rpbuste3Rrc7u+ngbabPNgG+kV1BX9k/t8
         WdZucFA8nsdbxfYJeHu3lNpNgg0eo3bDy+5whdyLa7N7o/8/UajtGt+uiFnB52hOEhcl
         ADdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IMNSqAp9thrhtD4StlLIG3Q7VY5zblai/MWKCabFFzM=;
        fh=izAab8Uq2rv0+b4ia8g4ttdSAjq2AbZaLkrWL8Clvus=;
        b=NF1Sde+9msIS8SBXQWHFWI41RevOQnDgMV+e3kO61cpC7rJFsQdaP86QLn1AJ9xsKI
         riMXtSD7HQ7Ft5Bu3Q8OMeMIFMEu6W4iFd08n4kaVYKX2Xq1XGGWo+U8PF+cojQvBZME
         vOC0TTJwizcC0Vw0mR0h6Pys7sS9mnos5N2qq+vAgdXoOWObZfCObsuTjqYJ+9W4YdHT
         cy4JhDYOS2D8vgZc27FcVjXAlHm9huUqAYbLE6IFfLFzwCJ2XWfF/wdtD+0XWpxtBdT3
         XA6TwOkroqNBAb6+E652URNIhRwie7B5vlNTfyV2Tldquscx0j+YpDVTICsZ3r+fwFL1
         l+nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsFXHogE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2c5128si245572185a.225.2025.02.25.12.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 12:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsFXHogE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tn1zM-0000SJ-Un; Tue, 25 Feb 2025 15:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tn1zL-0000Rr-Qh
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 15:57:11 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tn1zJ-0004Jq-Tm
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 15:57:11 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so22981355ad.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 12:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740517028; x=1741121828; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMNSqAp9thrhtD4StlLIG3Q7VY5zblai/MWKCabFFzM=;
 b=NsFXHogElIKgSxEnrecI8OyKjSpEYmLWeEGRxYI8XMD83MwrEYY/2pyT340zAw7vRs
 WNyQb+9pzRS7FoBD1mxVoyTcIRDfobCpnmiEEEFP77ujAS4WCFj2qbwqXChHmKPMUF5N
 Jgzc1z1y2CrhprfhTaoXUv18Pq4xhw2qYpzJk/s1BbWHhiye+Jl7OigEybG5kUN+y8ok
 G2Mz/yheDrFRYFB3+xIJOjC7zJhri2eBA9GFt9U3aGZr37eYfgTqXzFpH4v9JsCDlQU9
 rnQ4VvlchswW7Wczb7To1QgDk0ynuCO2muGRl43zdn9FqjsC4+CaF3wOOJ6zvo/3b8Pa
 2e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740517028; x=1741121828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMNSqAp9thrhtD4StlLIG3Q7VY5zblai/MWKCabFFzM=;
 b=b8g49nEM1fbfqPRHb5x9S2hvwMZPP4zY5alhPoIYg3Cp4E2T3XyDVasGgPiXF4PvK5
 36z5AVJ64EeJ0EO6++pDeu/hq4suoq6y5KOGgw+3YrPLGQ2iWqI4DYYeP2ehI9Oo0rhN
 VgzcCt/uUhm5KYUkkBl1HRsmtHgwGbJupOgpVC9bh7wqYClGQF205lE7pIIXsJ+AbnX7
 9vuk10pKAVb8LRyfp3EWqUSz0T2aqSDBH2Cqy+mVy/QQYiAXD3lM2TUIEhxO7dolmOZl
 2AEKUJM7RH6ZdBat7ZkbeTwSY3vxqupXSGGBrPioY7jObIpm1X1Cv54lcwz3VYRjpZ6i
 Gsow==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+J0HQsU3yLv/rihs0F3TXJtMxZER5Ik9/sly5MLZfcOk9db5ATTV7buBeXvrsoqL78Dsn9Gndsg==@nongnu.org
X-Gm-Message-State: AOJu0YxhyW0yheyH7rWsa4bhV+Bdn2H10h0OkEDz0KfsIOUf3aLjw7q0
 27DZECkHhnPKMAzLDXqQ2ycELyUcKapEuCC5/uCjDRp5cMspY2rrbJJfQHcCeKY=
X-Gm-Gg: ASbGncscck4WngT6A2ZKQGTAIm3T+/6zQsJzlm0simHoGy2FZjflDtgdAjrNGVFLuba
 N4CDP6e8LMBP/HT4K3WYywS0Gcw/43dUXuNxKYM6MLMEBT/EHgpOHGsOVL2jTE+HoIc6ksL3Sdb
 zxNfTunZ6zWwyYxkBlsN8pb8zhCblujP0D+68dXjYgopbaFPn6t2G/RbeWQNO6ZRLQC6dYLRsGO
 e574OPpOL57czABLSEM3Pfa9SkHzBu+rAKR8qCQj85WTIqAIgKE9SXHFFi41Z9pv/USB6sKOOL+
 g23Z7awbktkinwj80ho7gvzZUoG7eAAJbaZNNzc=
X-Received: by 2002:a17:902:ce8f:b0:220:d272:5348 with SMTP id
 d9443c01a7336-223200b2460mr12405825ad.29.1740517027764; 
 Tue, 25 Feb 2025 12:57:07 -0800 (PST)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a000536sm18664045ad.45.2025.02.25.12.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 12:57:07 -0800 (PST)
Message-ID: <829e9fd0-2d0f-45e6-ab89-d933d344cfe2@linaro.org>
Date: Tue, 25 Feb 2025 12:57:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, titusr@google.com, hskinnemoen@google.com,
 wuhaotsh@google.com, qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xcLRwtQfB6FL

On 2/25/25 05:41, Peter Maydell wrote:
> On Mon, 24 Feb 2025 at 20:51, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Regression introduced by cf76c4
>> (hw/misc: Add nr_regs and cold_reset_values to NPCM CLK)
>>
>> cold_reset_values has a different size, depending on device used
>> (NPCM7xx vs NPCM8xx). However, s->regs has a fixed size, which matches
>> NPCM8xx. Thus, when initializing a NPCM7xx, we go past cold_reset_values
>> ending.
> 
> 
>> diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
>> index d1f29759d59..0e85974cf96 100644
>> --- a/hw/misc/npcm_clk.c
>> +++ b/hw/misc/npcm_clk.c
>> @@ -964,8 +964,9 @@ static void npcm_clk_enter_reset(Object *obj, ResetType type)
>>       NPCMCLKState *s = NPCM_CLK(obj);
>>       NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
>>
>> -    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
>> -    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
>> +    size_t sizeof_regs = c->nr_regs * sizeof(uint32_t);
>> +    g_assert(sizeof(s->regs) >= sizeof_regs);
>> +    memcpy(s->regs, c->cold_reset_values, sizeof_regs);
>>       s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>       npcm7xx_clk_update_all_clocks(s);
>>       /*
> 
> Whoops, thanks for catching this. Applied to target-arm.next, thanks.
> 
> (Looking more closely at the cold_reset_values handling
> in npcm_gcr.c, that looks not quite right in a different
> way; I'll send a reply to that patch email about that.)
>

It may be a hole in our CI right now.
Would that be interesting for CI to run all tests (check-functional + 
check w/o functional) with both ubsan and asan?

> -- PMM
