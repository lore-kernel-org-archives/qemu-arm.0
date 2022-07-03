Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2464104lft;
        Sun, 3 Jul 2022 02:44:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1sGJ6j/tKILR+z2Wle+WmfD4ZHdDvQ7DveeHHazY0xiR0CrqqTX+y2kPlphLy7kGiyNpT
X-Received: by 2002:a81:6f56:0:b0:31b:c2d1:3c96 with SMTP id k83-20020a816f56000000b0031bc2d13c96mr28137892ywc.87.1656841499513;
        Sun, 03 Jul 2022 02:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656841499; cv=none;
        d=google.com; s=arc-20160816;
        b=xqLABkX39xQgyULET1f6me+hODTkYIClro6GHJn2rj0EyR3/Xo0m6LDggbjbLkM04f
         RU1Cyd73cJbU7Bb6dnnfs1b88OHh26swQd2BohTGlOfhQauoCaTF5FjfQj9LedB24w64
         CozluyX0SuNDtLh7Mc55L3gcb8ul/I4er0lEY9qahjwXVGhzu1dwL0lHbi1mtgwljkjv
         pS1DqJPIjYBbUYLCz/zDa5cLYyiGjE4dSrcAFYRVd77nWduxdJhAIub9gYA6IJb7uKps
         dGf6rozsuyqmhG5ShZbUPMwWGBj6deKPc5ZB4rWCvEGPZaQIYF4iqwTAhOEylm0a9gud
         N9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DVd5MUeAhsdfpoBNc5KoTsNNUOPcfAc75/FL8B7y1nY=;
        b=KhOETD8nbm3vdYehDriNLyrXBA0xpuU/x/js6wLTTxstu7z3Y1hyOeyZs2km12Tyg5
         u7l7qPhBUEbikaXm2r75f91PuU0glwhUF/Gej2EXCk9mnK7ZxplxlWhFL5G6iqgbxom3
         4Sf7eg6UE3eMCnCh6/I2YE1sBV+kMVI0tRBS8rvHFh5roRSivcQcdp5jOtCptCn3MEBK
         5qGc3iSPTFq133Rq5OIJEjKV/35KtmiFAoejhdklkBCcIIa2xhHJwHv8Wf5O0m4SjHOQ
         dRi0L4AFp8I+dnHzc8WED3HGMx1f+lbieJ3lCdk3opA9xbGe1AQNUgQarjgwA0IJEaD4
         SkTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jwz1f/VR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i83-20020a256d56000000b0066e249d152bsi4872587ybc.447.2022.07.03.02.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jwz1f/VR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7w9y-0005jV-V8
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vU8-0005h6-1r
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 05:01:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vU6-0004du-HP
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 05:01:43 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso234133pjc.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DVd5MUeAhsdfpoBNc5KoTsNNUOPcfAc75/FL8B7y1nY=;
 b=Jwz1f/VRGmt8k6e7SPex3jpYru9TmkW0D+BnHWfzutFNczNflMC+P4y7L/12cAzDb2
 xkmWcYdtF/AGFu5vdtWWS89sa1qGupKnUMVCtPuugKJDuQiR0pdO+PUsPAKVmbhNJHlh
 g6mh6Y1YNk68YLEeP17iZM186bq7kMxOjmL2/e7qxrXapgNlC9sf/bLyk969EhDcdDh2
 UmaZx8vl4jO2KSGWAaIMuPFUssN9M9kvVuU/t/qeUAELQSYC2QXOK3qMoW97zoS5qgso
 i/lkqs1eDUykCgurE5rJg3RzdPTu2BJJ1Cfmo8T5IVTs6ll3aOoJEgwNgGp6veYUmXfd
 56Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DVd5MUeAhsdfpoBNc5KoTsNNUOPcfAc75/FL8B7y1nY=;
 b=PDVQvGYzGKIMvgwC72RW7yWY8BDM/QTw7Hunv2cGgSrMTMcyolXe761jM9fwrBTdyz
 MzB5t0ORWuzTznjyyoOexGe3hEVdOf+0bcgCiArq9OSIbf72UZ9PgVevIskkwsC95K1f
 sMd0WQD7r4KXYRHJ9/fP47uXQ7d+1T35l8y6GviV7HUYSiJZ3yll3tmmu5q5UZBptd/R
 g5hC1Xk1ca8T1zCDo3WqToZf+9kUtScwe9qytJMTFkuy5jS/WJCiIKyDYWJXERgmbtcn
 jg9vLQbt2jbZPplz4C/xlUXjfiAzbijAaHT4GhN3icdUbZOxci7EUp/1SM+BD+RXw5el
 2AuQ==
X-Gm-Message-State: AJIora8xkkq10AmITxpbil98bXRGmVzZl0yEgNS8/0YZNb/taVLt4D5u
 3WzYjmEiUdQzclGQ9DBKDWYBbg==
X-Received: by 2002:a17:903:283:b0:16a:6db9:3f02 with SMTP id
 j3-20020a170903028300b0016a6db93f02mr29374513plr.173.1656838901161; 
 Sun, 03 Jul 2022 02:01:41 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a170902db1100b0016a275623c1sm11101262plx.219.2022.07.03.02.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 02:01:40 -0700 (PDT)
Message-ID: <9e62944a-05de-7e33-9d58-59c1ecd79b1e@linaro.org>
Date: Sun, 3 Jul 2022 14:31:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
 <CAFEAcA_E1OWmuTpdqSUXc7kQs7ZkuiHNSWf6P0KQTquaovaVSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_E1OWmuTpdqSUXc7kQs7ZkuiHNSWf6P0KQTquaovaVSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZ7lwg5CCHaT

On 7/3/22 14:27, Peter Maydell wrote:
> On Sat, 2 Jul 2022 at 15:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/1/22 01:11, Peter Maydell wrote:
>>> +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
>>> +{
>>> +    /*
>>> +     * We can't just OR together the aa32 and aa64 checks, because
>>> +     * if there is no AArch64 support the aa64 function will default
>>> +     * to returning true for a zero id_aa64dfr0.
>>> +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
>>> +     * the AArch64 ID register values in id", because it's always the
>>> +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
>>> +     */
>>> +    if (id->id_aa64pfr0) {
>>> +        return isar_feature_aa64_doublelock(id);
>>> +    }
>>> +    return isar_feature_aa32_doublelock(id);
>>> +}
>>
>> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.
> 
> Why? The AArch32 version of the CPU is going to either implement or not
> implement DoubleLock the same as the AArch64 version: the answer
> will be the same in both ID registers. We only need to avoid looking
> at the AA64 ID value if we don't have it at all.

I suppose.  It looks weird, and isn't a proper replacement for "is aa64 mode supported".


r~
