Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1015677wrm;
        Fri, 18 Oct 2019 07:47:15 -0700 (PDT)
X-Received: by 2002:aa7:98c9:: with SMTP id e9mr6953491pfm.109.1571410035373;
        Fri, 18 Oct 2019 07:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571410035; cv=none;
        d=google.com; s=arc-20160816;
        b=Ey7jfwdVjCqrXRgLhG3PhhoSxvVNnDR/AA4u4LWDbuYhju8QS5fMPbYAd1S81IT0qV
         VLBeMy4Vtk2+KwoYcxDY/2Dw8ixeMStf/jaDsmmA/tosSS0Ky/LnAg7fsvJmIUCsKja5
         wh7wEWGBVVTklzd3iAqC58xJwSOtAFhYQ7oMgu6SEocMMBfy7i+3pS5RxoXMmxAAfqBw
         2rmraTixdsgVZYHLxHV6X4edDVJErotMy2dwyvO8fWwks87mYGY6A6RkkiNmjw/QvnZM
         0Xy8LYgm2ROZpAIy6clhc7E+2Qbw9SxY66D0vSBk0klkC29AohzDhnbswimT4hpCgeRD
         q03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=K2Vvc+S/UnKmPbfZ3+bzxYzKb19mODDOoIc/zGxqYmw=;
        b=a/XjLgBBcK/NT+gFQP2g66eYoxPYQ4MinraS9Gr8HQR2ykubQ5P+h1fMBvLLgSzA5N
         rsHfzDng6z7hND3YOGxsPqQG1gE5qqczqO8FIIfaAkOQ8pZCvworZqCfEgl91AoMn1nV
         qrpiBU++RbFNQpyWZwVvNi79sU8Fis1OW+/+mXC/2St2jG/TeEXxkODcqJhjpAUfXqje
         Wid5UvjTLcG9e2Y9lUgU0dYjMGCBCTO8nxIW7mKNKJ1CWl/7BlpoqEfbuCpJNBBMfNQh
         FiMu8IXMMD80SNIBfZBLJHJyyF0aEd/D+5q+KH+lzHeCSbuQxvyn+biUXZOneYTSX7VT
         pHcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPPRIdXP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 65sor5700057pgj.39.2019.10.18.07.47.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Oct 2019 07:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPPRIdXP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K2Vvc+S/UnKmPbfZ3+bzxYzKb19mODDOoIc/zGxqYmw=;
        b=BPPRIdXP9t5jUJONY5qgh6FBuvSNeWsySFNVhI9POJ5lj/Ew/RXPBCvB/tzCpNB9JA
         Hobn7WscmqY9Ogf5IRzOKaaN6QnL/YLAq1S5F0ogGPLAR3EOddeoWB/3OqelNhv3mCwN
         uxfpdcSVonkC0b+yrhEs5GcaObFtEFiayLl27KvOhN7ap3h9pQDRz7SuEHQ0DUFb3YeZ
         7NrmqpP4WjeJ4cFVC/8RNuwrHPYtNmtxSwRIx6/bgSZUfbFAXf55sw6NfuGRvGxDxD7k
         1yXsvZ3iyBz5ZdLPLiVG2COacmoBiC9lYE1tlG9+Fa7/B6arim5YNqtue6nFN++hTGqV
         81JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K2Vvc+S/UnKmPbfZ3+bzxYzKb19mODDOoIc/zGxqYmw=;
        b=sqKQS/4w2WbjiVrNLHYqEVcwmy2IrpT/FM73PWsiyNyQZlGqsHRTEG+pWnZ6li3fDl
         enZO1ePS4n/HBD0Yi4e70CD2dVo2NN8yVIklhXjHihuX9vVWU2FEYO/1boaREdw7o3Ii
         6QdpNkPLCPzHiWbBPaioY+I2TIe+Scm/FmUZNkuyqY5wpvz+9XSNzdD2HdbO9tZMVn9v
         nrrn+u9bhuw3rMOvUja9/EFJLYaxptZLJk0QAQHMBBxC4MthmmV8IYJYwJBm1PjRdcjq
         Gfp4C9Z6s4SBah0az/L44Nxqt1i3AFQoHVB3gvUveU+hHSrbCLzMqrwuWWDba8RTTDss
         0R2w==
X-Gm-Message-State: APjAAAXluEc0NdbbrDpBErWPNrDbc+heetaqmjF/2yacSF2Jd2iY7MmV
	mKROoJUH/rS1Cqp5kcPptIVkXYXPMHlIqw==
X-Google-Smtp-Source: APXvYqwUfEEeafUMCgKyuQfNVxR1okDHWt8hcMXGfP8AF6han0JNmiTIsK8l86N1ITduvGNRKvlXDQ==
X-Received: by 2002:a63:165b:: with SMTP id 27mr10505348pgw.420.1571410034759;
        Fri, 18 Oct 2019 07:47:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id 16sm6765304pfi.55.2019.10.18.07.47.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 07:47:13 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Vectorize USHL and SSHL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20191017044232.27601-1-richard.henderson@linaro.org>
 <20191017044232.27601-2-richard.henderson@linaro.org>
 <874l07pdio.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <754b51c2-fa2b-bb30-6395-411e7668bb64@linaro.org>
Date: Fri, 18 Oct 2019 07:47:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <874l07pdio.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7zopbp2aaZB/

On 10/17/19 9:01 AM, Alex Bennée wrote:
>> +    /*
>> +     * Rely on the TCG guarantee that out of range shifts produce
>> +     * unspecified results, not undefined behaviour (i.e. no trap).
>> +     * Discard out-of-range results after the fact.
>> +     */
>> +    tcg_gen_ext8s_i32(lsh, b);
>> +    tcg_gen_neg_i32(rsh, lsh);
>> +    tcg_gen_shl_i32(lval, a, lsh);
>> +    tcg_gen_shr_i32(rval, a, rsh);
>> +    tcg_gen_movcond_i32(TCG_COND_LTU, d, lsh, max, lval, zero);
>> +    tcg_gen_movcond_i32(TCG_COND_LTU, d, rsh, max, rval, d);
> 
> Do these get dead coded away if the shift is a const?

They would, although because of the form of the instruction, as a variable
shift from a vector element, I don't expect it to ever be const.  We will have
just read the value from env memory.


r~
