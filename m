Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2300243lfa;
        Sat, 5 Jun 2021 15:26:15 -0700 (PDT)
X-Received: by 2002:a63:4b5b:: with SMTP id k27mr11568716pgl.368.1622931975574;
        Sat, 05 Jun 2021 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622931975; cv=none;
        d=google.com; s=arc-20160816;
        b=wLxyloRczwVnF3gAqTJIVRR12OyH4U0VwHK0gt1iXqcM2KJTdSifOmm/Jwkah1Bq5e
         9rFHCZbK0r3ZfVxIAWE30Vdlpz/EbhCo0DEgmVRTZXUoCukPRGRPLxt9u+4JGCtWRRgE
         sbAhQJYs16PFLwu9qXWp649xSozfz5TShVMtjuOF4QxNLE1r/o7zjhIA/HugY89KvCco
         d6y6SvnMjdEvG+r1Qe8Z224gjivN3Iwzg3hI93UoNNXpg1p9yZX7c6lY2mj9uv1NIpKk
         bCxixWPwvqeFiwDXRJA1zVajTebW4F2hRr8cReuPzm3BGC0dUX3vFhg7z1TrklH7IbW8
         YaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Egth3OGXf/16cX2HUKNGGRN6jIhhddoXpEcJRP+eRq4=;
        b=XQraPcZRYlSTFLAR9F/35K8zDm3ChQ5NHAXnW0e2LVDEyuGxqZfQ5Zjv0zdqbPoo7Q
         2SlzEVqUDfxO8aEhOH2AsH83II/rfCKN6cCBu5emotLQmGBSHbTxcuuCBjlx9UeD3W7B
         3BGpCbX0dEJ1F9BJfHxBO2klO0NrprG6DSbVkEMy2tgLbBeDtieo7FMVE5RWx3g/qXxX
         s9o3VT2raeT/jSZbavbgMiSlVAYrxNqa3fXpb7LDVMYYl13cfn3g7KPeQmrgJvw8Mspv
         aSch6mPwSsDiK7d0cBCEivuwgVXEUO9jr2XjrHel4/kLx4HnQShiE5yn60a7AKRE0IsF
         +4dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IgPoInN0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s24sor3187367pgh.82.2021.06.05.15.26.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IgPoInN0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Egth3OGXf/16cX2HUKNGGRN6jIhhddoXpEcJRP+eRq4=;
        b=IgPoInN0mN3Q38UXo+sKz86l2WIR2y0mkcvSXBX1uK+cqsn4IvbXL9OZ88qZcKc1xD
         UJGKsuWbHtkYnfkkZrVDZpQUoxnovdcgXHC/HP1tbWWU2Rpre8iz5HTk39v9dz5qvXqf
         TOEV3vWNBXHg1l/V34WnqKGsEEcpEvKuDOAnNqTQbdwdrrwRUHytXagxau7ZItRlkCL2
         obgI/QTZm4z4Bh6DtxdhMAZwvGIbL5O5JcWnv07bTAowYPFwz0OVWDPxkfUmW1UiR7UI
         kEmWU3juvQ7WyYxnXQ+PkVhIflW10696Ra0D3PALu/T78c72gx9QwAbwn4KHDOe6sqoL
         PjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Egth3OGXf/16cX2HUKNGGRN6jIhhddoXpEcJRP+eRq4=;
        b=fDdnica2vXc9tixBPmQk70w/41KXLYdVty+cn4bKUc22kuB0kIZvacyoJNkusS3wnz
         jjsjSSdv5odx/RPciMIxf05zAGLwjc50TipQeO+r/eyZKldsK1C8RCaUTWc8HYkE9FAH
         ZwpT5gjG65qtPVdndSsG1EBEjr1XHIsImJXByWcr9r0yEfEvQYXC8lT7+k3hi/UO0pT7
         53i2adCDKzNnIY5uSuOwgb4eE70vlr6zMzcvpDWAwniE10FDBsqR6Q3AbHjNmVIF18Za
         6XT3O+Y5lAgPlDUdiGU6ywBhyrZbal+zLpDTtIdRkqcEWFn6JixpP2Srz5AZW8VBVMay
         RAcQ==
X-Gm-Message-State: AOAM532K39s1UZRG0sWyWPnuVaR2I58jMRImBuy+nzAD39HjUgbBFJkY
	KKQpwT4GJ8BxSmyqUMhnCDkq+Udy
X-Google-Smtp-Source: ABdhPJyO3TPVlDhKJKik8qKOWqtgS4IhYcNQ0eUk73cOFvaXpJdx50CHzxT+nBrdzZuQzhVXmTzARw==
X-Received: by 2002:a63:e114:: with SMTP id z20mr11356780pgh.207.1622931975112;
        Sat, 05 Jun 2021 15:26:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id a9sm4512098pfo.69.2021.06.05.15.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:26:14 -0700 (PDT)
Subject: Re: [PATCH v16 92/99] target/arm: remove v7m stub function for
 !CONFIG_TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-93-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1777966e-7c8c-c1ad-5674-8ff2ae967535@linaro.org>
Date: Sat, 5 Jun 2021 15:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-93-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CO6782Tuj9Yq

On 6/4/21 8:53 AM, Alex Bennée wrote:
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
> +    if (tcg_enabled()) {
> +        if (arm_feature(env, ARM_FEATURE_M)) {

Merge the two if with &&?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
