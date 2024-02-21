Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2119073ejb;
        Wed, 21 Feb 2024 11:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9zHJF2WkmIc2vCcA4lT5X8jocs4p3c1bw9v6LMDUOkjKgpU6Z2mKXFgZR/3NcNA9remxVQnU5bw5QqLSWpDhJMBMUi1dZ
X-Google-Smtp-Source: AGHT+IFoucWAVSURmHXAAERJ5ruC2lrW8GBfJScmjtLeYYFN6vC4fpjZ5zgUUDIxa/BKgfHwjv/v
X-Received: by 2002:a25:86cf:0:b0:dc2:3fbd:82fe with SMTP id y15-20020a2586cf000000b00dc23fbd82femr230705ybm.46.1708543072520;
        Wed, 21 Feb 2024 11:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708543072; cv=none;
        d=google.com; s=arc-20160816;
        b=YkJGgrF8VCjBby355oPMthCLJYTj+0fZav36uSbM4RiMxYlgDjBMPhQdfRv1vENk+n
         0pEy0A49rDSfYirsvoO3d0xHqrlHEIGtZhbcyXgYIlShB2cffje2Uf1nKesh6SCLcYh1
         LXQ21xxLrtlz3daWU+cfUDe5IeD9swuVIsu+CZ9KOQdK1gL+qKZw1u2MUC/CFoG2c3Qy
         rquCgCLfyO7Iscqq7rO99crUiVK3zdN5Epa1Q0ePlb6H8gtfDZIZvrmg39GaHPbV8hKZ
         /mDhci81c1yDsAzRa66Lwn114hcZ9eLEaCNQMNPKnqQ1kr6bTsMQ2/4F4WFoXTtjiqlL
         4zUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kFkemPujgYDfktlWToqz/MPXG+VXUeeeCntqfklmV+s=;
        fh=CnlnzAA7//16EwpymYqVB1FoKEk0xIunJL8l7E854M0=;
        b=J8rAvPxvBWdmaRUu2Wj7MrP/JZVG1MJl7x8P/Y6z8l323Bw7MRKmlOJV4t+aRrI6Tz
         +RypWCsGFOI94PM8YdsEvvYsDp8IjJvXK1hPKcluRRyz0fcGVaMH/1RimzSeiWHdMtCQ
         5YX0exDxZDRBrU6/unRttBmXw/J9GKr2areXYQmK/XRGg/F714VEKwJbWC9K0nitGX/Y
         zovOH79I3xkU33Ufz/9boSwr58NQgqqKx1GAfoshdKi+53xDg9N/tipHceN1UhWiVxTF
         Vm3FOkaBgjwbbb2pwBBX4Yw3yRkUhB4s5zt8TlaWkAIlM0Bv3f4p9btJxOL/OrGjccAQ
         NiLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T32HmIKH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19-20020ae9c113000000b007872c5d8e74si11009621qki.708.2024.02.21.11.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 11:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T32HmIKH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcs5t-0007gG-Vn; Wed, 21 Feb 2024 14:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcs5r-0007YR-0A
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 14:17:23 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcs5p-0004up-9A
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 14:17:22 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dba94f9201so47920515ad.0
 for <qemu-devel@nongnu.org>; Wed, 21 Feb 2024 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708543039; x=1709147839; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFkemPujgYDfktlWToqz/MPXG+VXUeeeCntqfklmV+s=;
 b=T32HmIKHdrgRbhXhq6R9O6JEQKKXiqNJML/1hHnwvy/DZf2P4GJz15Hi8uoPnIB4yr
 2yvBzkzW6N5qWbyfDZsqMyFuZh5bcB9QVfF1WNQ0nBFvrxeXvW9BDCaE9xu/BVWuZusw
 EHfTHU2awMuXcB6uB8IFsnn1ErjVW+R3j3KtEayaAV9m5SPusQgJoTsEFSNsfyzSBJsC
 5wSnQwXx3UYs0zGJZuW3Ygq5qe2WL6vG+OohGHxamfX9jexQ5p8OXrQlnMZ0rpL6BGAY
 HpQ0S71Wxu40azJrG50qyknwq7SQiyR5YzqTbCioFOHOKaEeKH+pjvutwpShbfwNLSME
 WIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708543039; x=1709147839;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFkemPujgYDfktlWToqz/MPXG+VXUeeeCntqfklmV+s=;
 b=xI77K6gNyLyoUVq0BZ59ikRV9VrO55TP9FARKHHLBdi9QigM+VsR9aPnnB7uzkn3vk
 2qH1UonKIgnbkbzpRVg2stzGADqt8YBDVzq73mqRtyu/12mxdI62+JqjOp2Zy0LZnHg3
 DA6rS6VLpsOvlf7GfKlAfMEKc2fpfQ7Aw0jK2nhjreSpo8FVEHNuvgZXu+cZkUOgGj50
 gCihQaNBySMrmP2w63FUWaUAhZU7F/RgyM6SsHelLNkCGOAERl/FcwZLkjWKo1o6kWya
 uXXAxF1AuzEwgSzKrHNL8NOW7YyrSuWBenGJb+D8wXivKxq0mr5bD1psuqMfJVouBI1f
 bE9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo6oQocaHkK+8LXfBarnWbXFSJgbq3Aq+hFhUDfwfpNE0W4C0VJV1cOPqJ27PZ/x8+xhaBLuTzOctWyFm2EJ9mRI8JPXk=
X-Gm-Message-State: AOJu0Yxe8JWt8s3guPYhpuXx36/4rCU3+74MMI7UitUfvHO2GNFLy9SS
 82Dfd9AG+P5R0sf4znSezMkvC+qJnq5+1mJlANOcx4OY/l0OglBc6NXAT5bDhtU=
X-Received: by 2002:a17:902:f609:b0:1dc:3ab7:cc68 with SMTP id
 n9-20020a170902f60900b001dc3ab7cc68mr2181115plg.21.1708543039588; 
 Wed, 21 Feb 2024 11:17:19 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902d08300b001db88946f81sm8442772plv.230.2024.02.21.11.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 11:17:19 -0800 (PST)
Message-ID: <aeeeb927-c445-4a3b-b22c-6861f130c6c5@linaro.org>
Date: Wed, 21 Feb 2024 09:17:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/22] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-5-ruanjinjie@huawei.com>
 <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
In-Reply-To: <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wcylCz0A7IL

On 2/21/24 09:09, Richard Henderson wrote:
>> +static bool trans_MSR_i_ALLINT(DisasContext *s, arg_i *a)
>> +{
>> +    if (!dc_isar_feature(aa64_nmi, s) || s->current_el == 0) {
>> +        return false;
>> +    }
>> +    gen_helper_msr_i_allint(tcg_env, tcg_constant_i32(a->imm));
> 
> You're passing all of #imm4, not #imm1, which meant the test in your msr_i_allint helper 
> was wrong.
> 
> To work with the generalized helper above, this would be
> 
>      tcg_constant_tl((a->imm & 1) * PSTATE_ALLINT);

Actually, I should have read further in the pseudocode -- (imm & 0xe) != 0 is undefined.


r~
