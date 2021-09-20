Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2078760lfp;
        Mon, 20 Sep 2021 06:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrhbHMu544qiqBSQkG6j1hOQGe/lvxqzgt03HLVDWuPw2kBLz8XBcJX+lGGS6djRWzMACj
X-Received: by 2002:a05:6512:158b:: with SMTP id bp11mr3605977lfb.188.1632144662680;
        Mon, 20 Sep 2021 06:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632144662; cv=none;
        d=google.com; s=arc-20160816;
        b=hBQ9Mtuh4sY4Q6DPbZeSl8mcEWMqeyXKLCEzOD7ttmkeFNwLJv2gP/w6T/KjSrH3lb
         u6MCkJQc7yCVGZm+vqn1iSSVyTw6NcNYVumtii1oDdy5OXmnfsRaaMS/izWq9vD5Hd/W
         TzDLmThkSKyfPvIVt3niJhnLFQmIGkbC6BTmmNvuvufOFwW26UptDACl4OVw0Dm+zuJx
         BMqu+J5BtTociQPSTR207227/ykzsEXDHoLOaG+7T3qTR9v0wwm7FqRLY4+euZ4eP/Qb
         rqhiwX+dc2AdcfFc7d18fjNIjUuwj5BxWNA/JFA3nHIPz8kEspJO/vmP7ni/kPHYRhQc
         Ljug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=D8pOEMc+aylnRz+FHkTZ45jwr2z/i/M898t/O6zkGJA=;
        b=rq5z8BBXPNpR5hpsE3sblPVpJ7tYH/FVSd/Fb7Ft90L0IO1j3bFhEnjT6301pQXvrp
         ZHuwGjzEyFFh3y2UjCirD8ng/Cgl/EB47IrahA9wwJtwaLJ4L7ZR/w8SVtq1mSMUgZJG
         BAn2PNcI0YJxrrRvajd4zXhfB7OkYRXRWe9snm3hdewL5XQTYaagV9z7pQSYXYg02dF3
         hifJGQqEMKXN9M5PkO0fAk1konkgKOQuDWNbtB1qty79phQn9RAvFOV8rGjix6R+BYbE
         bhYP2dDr7TIp1YPnSuMPKlMi6snNX3UI793ELCz59d4gvubjW2xUxVaIUqffAjdKGYh3
         BY7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rYAMkuHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si3880256lfh.352.2021.09.20.06.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 06:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rYAMkuHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSJNt-0006Gg-Le
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 09:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJMx-0006GI-CK
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 09:30:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJMv-0000fJ-6c
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 09:30:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id k24so17327241pgh.8
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8pOEMc+aylnRz+FHkTZ45jwr2z/i/M898t/O6zkGJA=;
 b=rYAMkuHQ3UvTHfcU+uvSjNn//fi4Zn/48TnrqQzw06+vUdXdAxluEfpu6cDWHO4GCu
 G4W3da+cCuos5+t54Shv85SBKlvYv3Jo4fRXGkdCHDNKozhPUWfL2mxUxHRrE96cJNyk
 py3x/LM0vGE4cT71MQGkE2IrcKzboX1A8SeTVBqE490ZjBqTMLecD1f665JUwi1yE8ML
 dRMmLFAWqx83FqeyGPbGTW5m0A7i6V2F00E69Ukbf58aL8V/hsVHGQcad8fD5pq9S9IB
 N3a057sEnDHBVnvdG+u53jCL1E3WnN6fyXcnxCsWkew3fTlkMGtbFQEf7ofIV3dvQbzg
 f08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8pOEMc+aylnRz+FHkTZ45jwr2z/i/M898t/O6zkGJA=;
 b=GhTzPvwYEcWrU9PPo6m6pS7FfAHL7BsKuSagAYL1jjA5NgRzYJojedIbWWGtNWJGQT
 F3D5pl5gJbezY+VhdjQ+s8umy9M9zDHoD2XjYDostlcZKEjKSRupVldyJIVUlxU50RE/
 nbwcBhevvCIOKkZg9vZy6+u+1g0IuZjIK92NiVdUDB3fNOnbJYqz19WAz/PXCvpm/dUw
 PyfsBKZf/WzKGRnaXZV8cesvfNBQ3LCzLTUZJzZdglWvV6nXWuzsztHTRVzSxqbQGNK9
 wJIwrtYmswAeMUDWqu4Bx2KIkF3A7kNuWKcNyU8QjPk5hfVP7bXMMKTgyqtNxDHMPXm3
 c3qQ==
X-Gm-Message-State: AOAM531utQtV3lQBBuWsdt/tiwflgAHxgxqWD6vxwPwnKH7kHs8x+iv0
 jJPJfno00lRlnkPp5qkjeJ4VL14365CutA==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr23389714pgs.233.1632144599383; 
 Mon, 20 Sep 2021 06:29:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x7sm14837580pfc.71.2021.09.20.06.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:29:59 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
 <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
 <af2e92e3-ef2d-50a8-bec4-6c1191f3ac27@linaro.org>
 <CAFEAcA8woYVpeKrUrqHBVu2mg25x7e8oh3kh1-1DukfOrLv_PQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c13cc671-709d-6734-7179-ebad949e7dff@linaro.org>
Date: Mon, 20 Sep 2021 06:29:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8woYVpeKrUrqHBVu2mg25x7e8oh3kh1-1DukfOrLv_PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 1aM3YvfRL3QL

On 9/20/21 1:08 AM, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 02:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/26/21 6:45 AM, Peter Maydell wrote:
>>> I don't think you should need to special case AArch64 vs AArch32 like this;
>>> you can do
>>>      env->exception.vaddress = pc;
>>>      env->exception.fsr = the_fsr;
>>>      raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
>>>
>>> for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
>>> and AArch32-not-Hyp entry will ignore exception.syndrome.
>>
>> Not true.  The latter case still requires syndrome with EC_INSNABORT, etc.
> 
> For AArch32-not-Hyp ? Syndrome doesn't matter at all in that case
> (only Hyp mode and AArch64 have syndrome registers); it just needs
> to take the prefetch abort exception, which you get by using
> EXCP_PREFETCH_ABORT.

In which case I have incorrect asserts over in cpu_loop.  Sigh.

r~
