Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2188840ejc;
        Fri, 10 Mar 2023 10:08:02 -0800 (PST)
X-Received: by 2002:a17:903:11c9:b0:19e:e39b:6da2 with SMTP id q9-20020a17090311c900b0019ee39b6da2mr13171816plh.29.1678471682314;
        Fri, 10 Mar 2023 10:08:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678471682; cv=none;
        d=google.com; s=arc-20160816;
        b=oqefCSIoBLYtCM8rZ60zPYXh+7zoG7STdrEM2TSGkk7I/F5nldpmKZ7TEL5iT47oZC
         aitXGmNSToiNfCqZB0iggR7JbtU3ivdxFowoxytooEZu7U4O1bzwueY5eW9n4YmZPjiB
         G6QdUYd9KBFOflMUJ/HpyWPI+MtWb1Ciq3t7EUlOLGc5jXHgVi46IurLfoF5MDSWiK5T
         jm1kp8a4Kela/VOR74/+z3A31M3APBaY1GVuR4ejc0qVwnSmJmM86cbRemB+dIvaivue
         r3iioMhd3ayNlfXrCdAoqZ0BqA1ZlV1I2oTZ+n3kb4huh10K8198qOKiE9MpV6hYfNFt
         a+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zxYielysRLJRbxJ5LMkON7ZbhGQAVkDRfAKWweHtHNE=;
        b=A5xHZsgdWHqZ/m0dLn0hlL+RTq7aDOa0BMTsXeXMlEJcswtsjmM4/4f19J6Dv28d6f
         toYk4YGBmYkHdgS4Nn2I51k4758bJpXFGD3W4zUFSi1Onso4RLyb6vwzzHqcFJrrzm4n
         alk0vA6RzgeMVjuZmGM4EGajGP6igA2CI1i2Mst61+IrFBTPs9hrVJuyDEQLKxIYGMkP
         u67ppllt0s5TK1sBaq1e8Ok08CYOaohImkOENVPmNN/bsyFLBTD+PCeCMUZ43XWSJhNc
         o1zrPSWXO68jvHc52SvzR2a4DUfnPTSGygZ30gDRk/ltSXr6JxCOkpaBXf5xhN/x4/gv
         NDqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rqdQyOA6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kw3-20020a170902f90300b0019c92f56a12sor358195plb.1.2023.03.10.10.08.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 10:08:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rqdQyOA6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678471682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxYielysRLJRbxJ5LMkON7ZbhGQAVkDRfAKWweHtHNE=;
        b=rqdQyOA6VU0L+8O2s/jflEXgGZC6qpHrM3lojQ2b1BlXgPrni95my13T6KT3gjxyjG
         egsYSyf1nexmUu2vJWh8MC/+P2WokVdMeNZSjI5qGEXWbkHB6nH/BkdtT5LzjUqsQDpL
         fUL/MPZTJR/+hVmxLS8PyTWS4/lrx1+3SNnxYrmQn6dhxn7gY3nbAN9rT2b7KzJIpnha
         1BVklwiSAxFX0hvbhnwGlquvKCNz+RETrXJAyoD896se6ZHa3A++h+ukD5zKuFPV6GqS
         WHT9pyEBZU1MMEp8pUvy9h3ejP0jN3eK2kOvNVLIL8B8PNJuIlb6h2w7YdNKqDUPYITf
         4+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678471682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxYielysRLJRbxJ5LMkON7ZbhGQAVkDRfAKWweHtHNE=;
        b=Dg7stMZ/N5iw6bILORJIdsOm8XuiIWooyl9FPuwMZgo0XaiDKH//IqmOJMNTdnV1pO
         j0JNyoHtWFgVL6JJ7oNX6tl6luWLaebXxUXjLxfU4Ah2wtgJOYE7fQwyAl3uPwCD3Mx3
         9kIMrg1THJSs2D6OM9Zab25xijSCIQTwh+c3kTjmND/Y4Nv1Vvhu0WHMVcM7CqZRj2xq
         UG8sXDyheOYap5eXu2QMv5hJWX8IugJbXHeqN/tQDgLnYJsvCJbhQSsguRJTXez6CJrY
         oUm18XpU459S8iY2q12KYJjG0Ut8nEdxvzaVsMEQV3xiuPqh53DePzITly/8h7vudzRI
         3KAw==
X-Gm-Message-State: AO0yUKUEr+XtztnUnWe4mOudGUibBdRJN1Y9Z6veKyY8gq519aUKyb8X
	mLPPDzoV4HO8G5eff5rjWXfpWCh5
X-Google-Smtp-Source: AK7set9OmAUbGSEUyErYeqel5cpokO6Z64RkxRflyXnMCaWPevoGzmolZo+fIdohFAyV/9nQGVOUfQ==
X-Received: by 2002:a17:902:db11:b0:19d:7a4:4063 with SMTP id m17-20020a170902db1100b0019d07a44063mr30725423plx.46.1678471681708;
        Fri, 10 Mar 2023 10:08:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62? ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
        by smtp.gmail.com with ESMTPSA id kt7-20020a170903088700b00186a2274382sm320988plb.76.2023.03.10.10.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 10:08:01 -0800 (PST)
Message-ID: <7f4dcb6a-c954-34bf-a3c9-3e8cebd034bb@linaro.org>
Date: Fri, 10 Mar 2023 10:07:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 42OEMQmdDXyK

On 3/10/23 09:47, Peter Maydell wrote:
> On Fri, 10 Mar 2023 at 10:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> You need a very new gdb to be able to run with pauth support otherwise
>> your likely to hit asserts and aborts. Disable pauth for now until we
>> can properly probe support in gdb.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> If it makes gdb fall over, then shouldn't we be disabling
> the pauth gdbstub stuff entirely ? Otherwise even if our
> tests are fine our users will not be...

It is, annoyingly, a bug in gdb 12 alone.

Before gdb 12, the pauth extension isn't recognized and so it gets treated as non-special 
registers.  From gdb 13, whatever lead to the internal_error() is fixed and the extension 
works swimmingly.


r~
