Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2480907lfc;
        Sat, 17 Jul 2021 13:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzepByLOq7HpOp/X6dc7gY+cUNQerzRike3osS1hbNFE0hOZVQ+EfOcKX434H8KbOscWl2c
X-Received: by 2002:aed:206b:: with SMTP id 98mr15637672qta.47.1626554573276;
        Sat, 17 Jul 2021 13:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626554573; cv=none;
        d=google.com; s=arc-20160816;
        b=wdpIIOoSbtYaWaL30KLIKugOGWv4vZxaQFxk38WKcl2JVXVA2ZdtzUJO3B96jk87FA
         7a0D3yi+QveAkZHvGi9ZOHBQ31i0/ZM3eWo3zTmIjJ3fGNdMoFvBl3Vdigi4PVT4Zg/+
         m2M8MxU8qHqsFKR8EnnyWYK0FYvXsqWCIN95+C7MAhpBK7EDQ2vFszFWnJ/FT09k8zr+
         d2szZXamdZ4HhqDTUqOrOnbHAvTyORfdgHEmr86OLnanUlAVNanAhDUIpTCTTqL7iLR+
         bdP9l4jBtFpSqcJ2t1LL6zZ8pPZX7omj4+kqnieLSsBgq75YVux7iWSjtBC+sGu+otCq
         MHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=du3BHy4GoaFfRDa0a75MYpYXgtvWS6Nz4XuInx7R+aM=;
        b=cwKu+KvX9M9jXGNDSuMGJjZpr1cTtxvIEZdK3gahOHjqwdQV8fbCbKmdkodpZ8Q1R6
         mRq40jzgqpSW8fktgLlO3PMvRDkzvWzWg8Mjjl35mCCuau2fVRK7E456Kvjf/AeEAwB7
         +T2hNobdVHjGAxmH7A15FVTZ9/KowK1OG2/QXRTj1llC8/SHki+pdjAf9exptQ6yJPO+
         BCPQmbdpNh0CA7zmDZFFlyiwhyTXZ/C3j7yLQaHkqOv7Kva1bzDIIYc7l5FqLeKlxE+C
         NflZJP/jDId4ITzVAWphHRxc1fIHFiQnZep6RS8TjPtjrCuGnpwqJiXEiKNKoUQag6Gq
         9Qlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnbJkoR8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si10940077qtr.309.2021.07.17.13.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 13:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnbJkoR8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4r9A-00066Q-L6
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 16:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4r7C-00046Q-2T
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:40:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4r7A-0003HJ-H8
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:40:49 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p36so12424623pfw.11
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=du3BHy4GoaFfRDa0a75MYpYXgtvWS6Nz4XuInx7R+aM=;
 b=TnbJkoR8WW4g4SUHhS+Wbsq9jJBmMmuflDngs5fEEsRZx0JTaRFs9wpdR3RVn1FLTW
 LzK6OSIjxkkZyT43NDbX0cEcZGZuTGhpJdk7/WTZFZ8GoD46JG9vnOSx7E9ULYYeMxf2
 aRMah5uG+bui+wZaE5UPGbJambODj2tASvYn3Fy1vpSaHlhSQkXjKEa3KQ93KnAP/Kft
 Q4tJeW63OR83VQlEvPzOywG1OkNc+IWICqJeJRiDCKgN1WCh1f5b+MmWrzkRXiDFQiWZ
 b1uQv+9DNA/8AttkKTIgBLmBhQID3Z0eZp9DWo5+B1CSd1zdXkW15mov0b2yMPqrL2MA
 WH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=du3BHy4GoaFfRDa0a75MYpYXgtvWS6Nz4XuInx7R+aM=;
 b=QYuUNz9Y1I3vFLzYDlwy3LG7Ap+RJ3dzI9uIK8tObNtbdvigNLrFjhskHfWvcbu+ok
 sZVa3f9Dbxv9djsdKJ7GloeWGOOFpa8IX5iB4uK2d+UKUfn6Rw1Jx5dqvy4y1nhMi3dH
 b7XZOyK0kl4ObgEy0YZVxvOLzp04GpklfrYfMsP4BntlstAAF2Ci77T/LveDcUB0LAgC
 FW5f8p/wCOyuZJ2aZCTiTlNWZsQgngwwABA05k6WmpU83Z6ADE3PW2inWegINp1WgNdh
 pQnI9sVVQGaJ3I2/SD5mcAxMEi5Gc25CtJlc6+nVCA4nWUd0pTBvDuVHwxRLX515BKF2
 /QXA==
X-Gm-Message-State: AOAM532xIU0Kmkm71xZVU3rRJmANb+nnwmCB2ybfZ8f5UlInNdnsLSbQ
 7OFN4rc78ZEq0VdEYtqiAIaJq8Dpw8Zsbw==
X-Received: by 2002:a63:5244:: with SMTP id s4mr9404132pgl.267.1626554447031; 
 Sat, 17 Jul 2021 13:40:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n56sm13586216pfv.65.2021.07.17.13.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:40:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
 <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
 <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e31e5da-b4c8-4555-7a70-7d9b4a6e55b1@linaro.org>
Date: Sat, 17 Jul 2021 13:40:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: reYrtKdw3uJ1

On 7/17/21 3:06 AM, Peter Maydell wrote:
> On Fri, 16 Jul 2021 at 23:12, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/13/21 6:37 AM, Peter Maydell wrote:
>>> Implement the MVE VMLAS insn, which multiplies a vector by a vector
>>> and adds a scalar.
>>>
>>> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
>>> ---
>>>    target/arm/helper-mve.h    |  8 ++++++++
>>>    target/arm/mve.decode      |  3 +++
>>>    target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
>>>    target/arm/translate-mve.c |  2 ++
>>>    4 files changed, 44 insertions(+)
>> ...
>>
>>> +/* Vector by vector plus scalar */
>>> +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
>>> +
>>> +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
>>> +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
>>
>> This is confusing.  The ARM says
>>
>> # Operations that do not perform
>> # widening are always unsigned (encoded with U=1),
> 
> I have noticed that that text often appears for insns where it doesn't
> really apply. I mostly ignore the text in favour of looking at
> the pseudocode for working out what is supposed to be done.

Yes, but in this case there's nothing about the pseudocode that suggests that sign matters 
at all.  Neither the multiply nor the addition are widening.  So is there really a signed 
VMLAS instruction?


r~

