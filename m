Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2343418lfc;
        Sat, 29 Aug 2020 08:32:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVsm0UCHqNeJr5fAxMNwXlWmK4BQdE2XAI7CGhZEXzQra8l3+/K4wu/3xHety5ytUgGSGf
X-Received: by 2002:a25:1f44:: with SMTP id f65mr9746257ybf.438.1598715139716;
        Sat, 29 Aug 2020 08:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598715139; cv=none;
        d=google.com; s=arc-20160816;
        b=aG8KHahZRdpcoYh+UAi03mHNxgSUatHxP4bNQQ8gU+8kbbvNCRLIjgGFKDuFLwex+m
         uCZZ5P/7Z5QQconYnXioLTWCVzw1vDruiufzOVNO9A6z7Jbr5B94BtQR0CVNnsGFJl3R
         xOGSuTtNRWwWK9z9tvXkEjNnHXZ5XC9cDCageptIR0orzAXFZWdCg1K14gwqEta8NlAo
         8rHWUxPRm6R40VNSRqPVnPRWw1/5b+P8ov15OLOQFz0HkK7gk4+Lto5nk3PUaCbwpDwt
         yQzFxpousjQOPyGWlFN0KnDa+8SlDpU7x5ds/rDDEYK+xEpeUDstSZRxMdLQV9VxdYrf
         cMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LoXLQrNGyodtKsVDD9sShhB0cDIIOHi66BBk8i6u1N4=;
        b=GaHer1fn+iwpmDILBOrl9wDFySuGdccgSVSMphYC+3e1xzm6wa2iW+jtJrxfg1JPH+
         SNBlBaodfdp/MV0HzoRx9Qqphy6YigTMI/RrFfp5njX7RudZ9nI1WvRrG2QmlFrPoNfC
         lmmlsm+GYBFIvtE+xivmKBmD7/NsvMqsVE37TcP8WwdBdTF9CyLIGw3D4GoxHCdoyJ0R
         Ymxp63TL3DuhmpCQW52icqsnYJ6dvyK6P62miZlqinoO/U5RSX8yX1yx+OQQdGK14imX
         Q5VLTC1L9y5Z01nAja/RVhEf7+A8lFXpOvL5S8UOJ0Sa+GbHZnfMCT18j/I3vGlglj0o
         fAQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzG+lKYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e65si707542ybf.322.2020.08.29.08.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 08:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzG+lKYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kC2q3-0001Ss-3I
	for alex.bennee@linaro.org; Sat, 29 Aug 2020 11:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC2oJ-0000XI-HI
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 11:30:31 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC2oG-0006gC-TJ
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 11:30:31 -0400
Received: by mail-pf1-x444.google.com with SMTP id u128so2192767pfb.6
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LoXLQrNGyodtKsVDD9sShhB0cDIIOHi66BBk8i6u1N4=;
 b=YzG+lKYT1ukFvHNqylk4mn1N3gFu1uM3y0KOgLJ0Hg5NHEVj9LctuXp96y4NNZcVX1
 oDKZNwxiRHo9T5LE+CAgROQUWp5lGSxrhPRucz2LWfKRqDU4OVP+MDTtq6S1NNy5x7bx
 ymZ2LaZYgdgCKh122iUxnMQhXWRNeV0s0Z1UfJEENs6JPqr3hz0YtIJR4hu12IGaIu5g
 C4xdI9ShicdMXfapWg6FJibCJJw5DPatW2ks6XcOU41CVGQzRewzk1VxO9Jeq/6Kg1lv
 KYhmx9eUikae/5dEDZqgU7qMMo+Ker2rC7HaTTezWhfVB0yjssvRaLtXpkfUm0XkciSD
 0Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LoXLQrNGyodtKsVDD9sShhB0cDIIOHi66BBk8i6u1N4=;
 b=O/1M0rzRq/5g+VwhgLpNK+pX6AZgQCzUej7UEby1HRkpeqPAmDpDV9SLucOWIyadMh
 PM6DjKcJmiHaWTYBAXksng0GaV3B54hMC/TtniAA6bcICfTvfZPlQduw1Wj2XoPgxerE
 I/3UwwE+YDDSZw/ZMJsa6HsedWEAg2+RNQ012X1CHGhvpfcdA93uW7guxfK1Zpn9mMvp
 KbaBApI3CMitp1DByfLslDKwHxsnQh1gcKBSisOG1oZga7nw4J4Tuw6/kLWwp3UcIBxZ
 gL8gwdnm73KW0sn6LpEMe8xN208KTGhMkY7HNMOfIVZYhL+uN64ZWCSYfOqxBYkQ8kPV
 zZOA==
X-Gm-Message-State: AOAM531Ky9pK0CqWERR/L4De80IuGoWTH/BrdjK/5hQo+Hm2gzgsIyBS
 VyFnVfbnLaVcLCqo8LuE6VAzBqSS/nIdXQ==
X-Received: by 2002:a63:4746:: with SMTP id w6mr711576pgk.412.1598715026961;
 Sat, 29 Aug 2020 08:30:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id go12sm2321768pjb.2.2020.08.29.08.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:30:26 -0700 (PDT)
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
 <55675521-a61c-186c-599f-7373e9165184@linaro.org>
 <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
 <2007993d-9f64-dca5-5fd9-510c87cd8e86@linaro.org>
 <CAFEAcA8cEF4s8E5k=eKs8u3hRqWKDgSwe5yA+c+uVXnCt4ixBg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01264b55-59d0-f03e-e675-7edad0988ab6@linaro.org>
Date: Sat, 29 Aug 2020 08:30:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8cEF4s8E5k=eKs8u3hRqWKDgSwe5yA+c+uVXnCt4ixBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6kXqtFidCiNW

On 8/29/20 6:53 AM, Peter Maydell wrote:
> On Fri, 28 Aug 2020 at 23:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/28/20 2:40 PM, Peter Maydell wrote:
>>> The other approach would be to standardize on "the decodetree pattern
>>> always converts the size to the data-type size, regardless of how
>>> it's encoded in the insn fields", and then you could check against
>>> MO_16 here. Would that be better ?
>>
>> That might be clearer, yes.  Otherwise it's hard to tell what "size" means
>> without looking at the manual for each instance.
> 
> Do you mind if I do that as a separate patchset after this one?
> I feel that will be easier than trying to weave the change into
> this series...

Yes, certainly.


r~
