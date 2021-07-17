Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2530235lfc;
        Sat, 17 Jul 2021 15:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4deayrengTGXr1K7cdKhlTNPOPwBi0dIlNCdRMbVnNZI38O9jN1euHP5kmxTv780Uy4UD
X-Received: by 2002:a92:c24c:: with SMTP id k12mr11255845ilo.28.1626560319054;
        Sat, 17 Jul 2021 15:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626560319; cv=none;
        d=google.com; s=arc-20160816;
        b=Kv2BD1e1nLCNT2xPE9JO+Aw7ckhrSfDda+499rLb3P1X8rUJkUdrVR2yAmoBd4Qdod
         eji+tZpRcogPnyUaeM4VhA+2U9lFnee48rbQ96jt7j3qK1OTiNHpcYLtaF4yYI2wlljE
         BxB4SebaLkfaTEDq4rNEe4A9HLBujGrxnh/dZv19B+VxvfLbZMRYNe2xIXfpBwRtCENA
         vS4ymB1uGwM0DyvT9t1YlIWsTcNMw1NUtuA7wKVckkFgCJRnpUU/jzje+XgugeJk7vXx
         l/PjAWoJFrmSXE8vZzNnCH/pUhD/ohmZNS4yo5WYV0/0/1tEINnMt/hAnuYJqEjDaOYB
         SXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=q2zfI1kdXtWYKF44TJnsDDzOCpLtyTiCVP4mjS27wRk=;
        b=tiOURnrme3BzHKyGAXok0FGc7LxBOREXJ3JXbbyBzI9n6YAaeBkTPC3XskSfyp0i4a
         l/PbpAXrhv16z1clvrMQqzx/6vXdkiPB236iNGvseeAUi9pzJhocA8TXIbowaMH1Eg1V
         QwfSOVKIMW3Chwry00ORSMG8wRpLpbPeQ96oLRXSTzpMLOmQ49O+pG1g3HoU/5SRzUwk
         FWf94VH/9ZZDMDUwSUgeis/wRn4dlpITwpRrmjpuUVzlOgMlJ2Kc4Cayh06RoAIEXQzU
         8pPgMKc10pRGsCd9OAVkk2Bw1xAAu6pLLKVgxCgvLrXNphweFbg8HrxtSX3ZWgRckxFS
         vCnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfzPv0P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si14003019jat.114.2021.07.17.15.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 15:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfzPv0P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4sdq-00061a-Be
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 18:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4sdY-00061H-Ej
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 18:18:20 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4sdR-0001aZ-B8
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 18:18:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id 21so12635690pfp.3
 for <qemu-arm@nongnu.org>; Sat, 17 Jul 2021 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2zfI1kdXtWYKF44TJnsDDzOCpLtyTiCVP4mjS27wRk=;
 b=mfzPv0P2HNDpNJW85rJ0oVNDLU9nzd9QcUOynIXiRKbKsJbApUXvPXeNYIPSnKzNlA
 r7XTtplKtt3kSXuet5Vp5/k2xLcVPwJyvax4IC5H1hu8/PNlA3eeM6Y3CV8eGfwIcjW+
 fsFpkBhS5JHrvdfBRKau21hvpodlpVZENTHrCmNbqddjYiF+seguO6XMHNd5IOvZOb/V
 tNTBLcHm3CxXvQ2w5Y8iuEdQSHF+DNfKna7n5EKaxikVRcDq2z5vYuf0pQiFmH9/ioKu
 3cMJ1UVTp6CMvAo9SD+5oGlN59Q/00b8/IJn6DxizSGax/S4lzqqG9ETRymCM4nAwh9F
 Ehxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2zfI1kdXtWYKF44TJnsDDzOCpLtyTiCVP4mjS27wRk=;
 b=XL0jhgg3cvHXhwQtUUZyUHfwh45GSpFtEs2yrFbPUkfAGTgUe/b76zMsMK0KqlocM1
 d6/gRvUji1kT7VVl0+lep4gOWYXDAhy9IVp5D8crdDwH8XOYiXvDOCjhvzuX/6mOJy67
 7mt2LSr/lXYFelR5yEzhTJkEX6lsgWgzhF3DCHpa3Y0UYet9cWOCHwYrRw7b7cQmYKE7
 937mCKraB8OrvT2NKeSASK9cWQwrztgw8Sg84aBzeSnUiyT6C8iy6u/UMlVBRv8EX8S9
 MMTQ2/dG64oSRFHEP4RsBTaWRWd18Wb2qNCZZAqukaexZPzfk1l+Pt49/hiJrdX0/zhZ
 feCQ==
X-Gm-Message-State: AOAM531e+tLl5LBu1TAzE9yK8OUx2AIcacnLL3hqCKhkuZbSk5qsCVIS
 ys5c3k3GI5R9c+azyupa/wAy4Q==
X-Received: by 2002:a62:a516:0:b029:333:1995:5e75 with SMTP id
 v22-20020a62a5160000b029033319955e75mr15405754pfm.67.1626560291697; 
 Sat, 17 Jul 2021 15:18:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u15sm15717712pgf.77.2021.07.17.15.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 15:18:11 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
 <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
 <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <654a95b5-f626-a99e-98c3-215b7ea54c2d@linaro.org>
Date: Sat, 17 Jul 2021 15:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZXyE2jVbY+RP

On 7/17/21 3:13 PM, Peter Maydell wrote:
> On Sat, 17 Jul 2021 at 21:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/13/21 6:37 AM, Peter Maydell wrote:
>>> +#define DO_VABAV(OP, ESIZE, TYPE)                               \
>>> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
>>> +                                    void *vm, uint32_t ra)      \
>>> +    {                                                           \
>>> +        uint16_t mask = mve_element_mask(env);                  \
>>> +        unsigned e;                                             \
>>> +        TYPE *m = vm, *n = vn;                                  \
>>> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
>>> +            if (mask & 1) {                                     \
>>> +                int64_t n0 = n[H##ESIZE(e)];                    \
>>> +                int64_t m0 = m[H##ESIZE(e)];                    \
>>> +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \
>>
>> Any particular reason you're not using TYPE for n0 and m0?
> 
> I wanted to definitely be doing the subtraction with a signed
> type wider than the inputs, because that's the way the
> pseudocode effectively deals with it, and I didn't feel like
> thinking through whether using the smaller and possibly
> unsigned types would DTRT :-)

Fair enough.  Now that I think of it, I would expect the compiler to narrow the operation 
based on the result type.  So, unconditional r-b.

r~
