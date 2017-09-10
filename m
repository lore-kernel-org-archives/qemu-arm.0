Received: by 10.223.172.38 with SMTP id v35csp3552031wrc;
        Sat, 9 Sep 2017 18:43:14 -0700 (PDT)
X-Received: by 10.99.3.216 with SMTP id 207mr7342795pgd.15.1505007794152;
        Sat, 09 Sep 2017 18:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505007794; cv=none;
        d=google.com; s=arc-20160816;
        b=oCm9ZoZvi8pm2jjRAKEsJds8D19Doy3DOU3SFx8UFeHy3lxVKRGSo6m68XWFfcLObx
         owAD3mUKbNJ+V8/gKf2YBPnYXCwwcky0tRmrsjsKghXTikvTHV5QMWQkvIGT66o+b4uq
         FvnU9+Gkk5mJQGi/jiI30Lh2mtHfS9ecDyDPp+OrVdirwuRxHska0kp6Qx3TEvfEr+k/
         gr9os/uV3AeJOAwP4mZVOd7jWs9qPrFl6anqJ9MrMfmVkiPMaSuMTqsmi7n3bm6I8jAm
         CDatMTIyTkefA8J12nJves5vjai65mD3GsYDMT5vbVg6LbuzyIoG3mSlEJa4osiAIsvt
         gafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=0NG7Y1PKt0qPmW6LwuYdQ1pDY02CnA7mfg5KVnSmC3M=;
        b=Q0Y61xYos7LOmUrtPOI/AoloHWxftcmWEngUwbEzeMcFsQBW0MCztgwAHEZx6kyXPL
         gHlCZucdDk2U6rPNwtP1+oHVqZyYPiHfV6QDnFqcnDDp4T4Lbk7CHGDfSA2A9/8cBTYU
         MF9zq1f8Ra31WuAGBWoNLfULhHTvWQBeYvdZ97Oz1oqa18eJ2qlEXb+fzWDFgUkeREId
         d89CnU8uN+lS3vkh15j4NXMso6j3eC4iRZaTTiVcgicHcdmnIoQIYFAZE4t8SM+kZJMP
         yOtH2nkge0cwGqxl4X5UcZwYwBs5TGTLUaK8CHwy/sVSfRSzDf5XCMy8GgBxBAscag4f
         FnNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxpyKYr0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x14sor404049pgc.375.2017.09.09.18.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 09 Sep 2017 18:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxpyKYr0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0NG7Y1PKt0qPmW6LwuYdQ1pDY02CnA7mfg5KVnSmC3M=;
        b=hxpyKYr0IzvOPJlh4+tpFTUvZoK0WKr3nyRyV9s0v7uTt80bls8AQly5HhUHU7Nt4Q
         JSckk6Vxdt00uW2DYsgftFT5JKO7z35za/b3ucQBIOLaxxb7ognzYhmcRXCLbsbTD+i2
         1oCX341ojcpQMA3/jZ4ei6QFg+kHOV7NQ1Tc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0NG7Y1PKt0qPmW6LwuYdQ1pDY02CnA7mfg5KVnSmC3M=;
        b=K1mPxSOYOQfCJtZE56aIWsn3wl6fwIhngOwu9ZUWCtIfUB42GpoVqkbF1c4W8OBF5S
         mDHQ3AZZEG5x29IqoaMN+l581TJj2p1AKUFHSmaC+wfkQQPEW9yFYrse4wuzfl7hdL6y
         vPf92fTbs8dNmh8N7t+oceSCBxH2wYluseQh6YiRpgxlhD0se+Cv1O7bGq59l5oVPERe
         5HbH7ZcReq8rMuxhN+qN0fMU9xWVy1nNPB9z4n042mVfK+aYyJc3+07GOGNbzubrpO9F
         WVdM28kgd8Do+KcM8jYEfy75Mk0KVWw9O5751sZRfc22CwI0lZFSl6XXbYAvtc0o6Ach
         z3ZQ==
X-Gm-Message-State: AHPjjUgdsNrQwcukL35o0lpTOQPSgYgIhaE6yJOx0mlBCGEzlcOTU6lz
	C4TwSOMGjOmuUiM3i183rWPH
X-Google-Smtp-Source: ADKCNb63v0u69F/lMfOkvGjts0a0y/zHMA3BI0qpG41LJRNkwnw8krNjTSA2bep7VazQkxRX8lyLJg==
X-Received: by 10.99.160.100 with SMTP id u36mr7573433pgn.22.1505007793676;
        Sat, 09 Sep 2017 18:43:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net. [97.126.103.167])
        by smtp.gmail.com with ESMTPSA id l85sm10613877pfb.176.2017.09.09.18.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Sep 2017 18:43:12 -0700 (PDT)
Subject: Re: [PATCH 2/8] target/arm: Use generic vector infrastructure for
 aa64 add/sub/logic
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-3-richard.henderson@linaro.org>
 <877examon2.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05363152-8a66-af3f-7c66-9627cbdc290b@linaro.org>
Date: Sat, 9 Sep 2017 18:43:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <877examon2.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LvGaZdVHWaWT

On 09/07/2017 09:58 AM, Alex Bennée wrote:
>> +    switch (size + 4 * is_u) {
> 
> Hmm I find this switch a little too magical. I mean I can see that the
> encoding abuses size for the final opcode when I look at the manual but
> it reads badly.
> 
>> +    case 0: /* AND */
>> +        gvec_op = tcg_gen_gvec_and8;
>> +        goto do_gvec;
>> +    case 1: /* BIC */
>> +        gvec_op = tcg_gen_gvec_andc8;
>> +        goto do_gvec;
>> +    case 2: /* ORR */
>> +        gvec_op = tcg_gen_gvec_or8;
>> +        goto do_gvec;
>> +    case 3: /* ORN */
>> +        gvec_op = tcg_gen_gvec_orc8;
>> +        goto do_gvec;
>> +    case 4: /* EOR */
>> +        gvec_op = tcg_gen_gvec_xor8;
>> +        goto do_gvec;
>> +    do_gvec:
>> +        gvec_op(vec_full_reg_offset(s, rd),
>> +                vec_full_reg_offset(s, rn),
>> +                vec_full_reg_offset(s, rm),
>> +                is_q ? 16 : 8, vec_full_reg_size(s));
>> +        return;
> 
> No default case (although I guess we just fall through). What's wrong
> with just having a !is_u test with gvec_op = tbl[size] and skipping all
> the goto stuff?

Because that would still leave EOR out in the woods.
I do think this is the cleanest way to filter out these 5 operations.


r~
