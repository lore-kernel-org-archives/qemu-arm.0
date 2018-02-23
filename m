Received: by 10.28.71.27 with SMTP id u27csp1110747wma;
        Fri, 23 Feb 2018 14:10:31 -0800 (PST)
X-Received: by 2002:a17:902:28e3:: with SMTP id f90-v6mr3000418plb.355.1519423831874;
        Fri, 23 Feb 2018 14:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519423831; cv=none;
        d=google.com; s=arc-20160816;
        b=G+cVMDHZuqtMmEcC9q26ybWTyTUOm1SKr42645rsj6mBUt8k/4EJ2knDuRFg9P6ADf
         WXCfB2Nchf3DTodNaZfyoOA1CQxP2cOwq33oqy5dCc3t7KH8lEsnzg9606RbHU3bD2k8
         orfrqCufSy/cUQWFOyJduqS+zfKWCMIu/g/D28X/BL16SvMNnfaLOm4QyLI3yR1emOP9
         1e02AbOaLaJYaHSSNdKM3+NN2ogC+zBAvcLQoDOEZ0aPj8hzEoxBkf4zVLiz9xpkW1DU
         4190rLnG9ukekPihUryjfkSi6j5DgSGH/JcFc5vAxhX06pe1BtyeeJb1IRDs86wflmr7
         GXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xNFnu2evCxfcnqb/0sLL+3DPidnU/A78wAgMPhITO0c=;
        b=ZQ8wxYcdDDmSOO2N2Aky2ID45ZwYjv5Jql2LLy0bFVpG95fdJNv4LpaXP+/gEh9RbM
         1Eq0FbvzRQTTnX/TrKha7EVvt8ijSZMMu8b4J2zTeqeqGI1KoYQZHWNIalOqx7FibHNa
         hXERgSIj1Csrky6gEr5rPr2z5wINI4WEUwmfPkjmJNx5TUyCmjEIGMudwa8YEVeIltEl
         QV40e4xqFwxeE3llpBO195QK+PyqiIOR2suFNhmTvXjTL6sUS8wCzLC9WGS45Gh13kts
         vHTj/DUl6dgtQWZHmD7496miEtmOIh5GZqglisx0yp4dUia3Ewt5F3o8Gp5hwsS+JB9F
         tyLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBeZh67Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z7sor846693pgp.418.2018.02.23.14.10.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 14:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBeZh67Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xNFnu2evCxfcnqb/0sLL+3DPidnU/A78wAgMPhITO0c=;
        b=VBeZh67Qt21Lz0fmZI2z904P9NhoCuY4F0my4ppAEMqLjYHfhJZviVXYyzUWfUz5ID
         I2FWF8sJ1XlYSZ9+nK+ikNXKTknP9hSbihYeeVXGpPi2s4O1IBt6QxUvhXRXz9nnw0Ye
         XR7w2TyWmsjVZKn0bfMLEDK3F4J8mvsu39JYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xNFnu2evCxfcnqb/0sLL+3DPidnU/A78wAgMPhITO0c=;
        b=nHb2z9VKKjfLf2kNzog3n19zFG6XQxTEOAio1J4b4GVnweorixBWRb3cCGKeBZgEXU
         cziZvskMtp2JqqhNMJR/6+cOWuNcOHtTpVmxvoQCQXGJ6eT6uePTPVOj1myj4+JOq6cC
         L4lVnfwiafMnTLThaPUglOZb7iJzeQZqQFjfsf0gT+MpIDYzUU9MhJHOqLiMBFZcxQ0T
         kuV0ACBJqU4BhrFhoosqBjfmAC6hfWzQHryT/OUUlBKvYuyJttcB71n+LcA2Mmevv9QF
         Hh8pdOaG4ygpThoczIodYMKBgNJw8XLojSPFNapK+DtxyaihsWPNQBIOjqBZGAJa1JJg
         c7YQ==
X-Gm-Message-State: APf1xPAVHPhMiCRbsQuvySpquhVmUZSioCLQQMiT9p+IyrT+lFf2gm9P
	NBjE9L4wM8vnGUBUxv+KK78J5Yiv
X-Google-Smtp-Source: AH8x2258zWB6FpahCHcv6JR3fmdYcG8XJtipWteTOyXKe7/cTM7E8+dR1eYqjqFBo9AWPf7l/fFNhg==
X-Received: by 10.99.39.131 with SMTP id n125mr2508735pgn.292.1519423831384;
        Fri, 23 Feb 2018 14:10:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id f4sm8111405pfn.82.2018.02.23.14.10.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 14:10:30 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 11/32] arm/translate-a64: add FP16
 F[A]C[EQ/GE/GT] to simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-12-alex.bennee@linaro.org>
 <da2bc012-1693-3335-eb5a-921d94e6015e@linaro.org> <87d10vapc1.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9fc0a96-ce22-47db-1c8d-05a2f05c6c32@linaro.org>
Date: Fri, 23 Feb 2018 14:10:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87d10vapc1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AtgezyrFpd82

On 02/23/2018 03:59 AM, Alex Bennée wrote:
>> Not using float16_eq etc?
> 
> These don't actually exist.

Ah.

> But I guess we could make stubs for them
> based on the generic float_compare support. But would it buy us much?
...
>>> +    return ADVSIMD_CMPRES(compare == float_relation_greater ||
>>> +                          compare == float_relation_equal);
>>
>> Especially float16_le(b, a, fpst).

It buys us knowledge of the float_relation_* values, such that instead of the
two comparisons above you can use <= 0 (note that this only works for le not
ge, because of float_relation_unordered == 2).

I'll grant you that two compares vs one isn't much, but it is simpler...


r~
