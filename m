Received: by 2002:a17:906:9388:b0:8d5:43b9:264f with SMTP id l8csp2302042ejx;
        Wed, 22 Feb 2023 12:41:32 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:19c:1455:d588 with SMTP id u13-20020a17090341cd00b0019c1455d588mr8416520ple.0.1677098492131;
        Wed, 22 Feb 2023 12:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677098492; cv=none;
        d=google.com; s=arc-20160816;
        b=bN5NU4L5Ei8shjBVy7Q9T6zUGt30flelR09jgUwmbxtNq8B1w4sEHIRnE4hzzNw9em
         bLqRLTFBYfmnQIQNX+iIydo6X3WO0UyvL3LapF4wuZLzbVfS7s5ReRuNBEop7okRWnPL
         1/EwQWtfWrqqNPIRD2moRtf7VkX0ZMNISndlneHzCsdfhr+pkwf3kkwQ8ADv92RvdP90
         rAAymvwnPBYby6tQkW1Df3mdnkVKl6NGXv+6uAzkiBf48w7k36+CtMQP8lhEqZI8jvjD
         kKiOBULYhS60qwxTDqRDz1lvEEDauSHiWvOBfFy4YxQSWr3n5xDaTNiZznSDGOzuvv0r
         hC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ydbUYRBnMYm5IWRPnkcQpdjCAm0TqrUtLjLUaCyVvNg=;
        b=VhhDjDF2jr5M4CuNL4NK4bBO74VlFWnm9lCffkHlj+wWlx/eBALaSYFw4+HtxDJPLS
         AHtBsbLdlVVaXqMwGzQEnfJ1VOnuJ+TgZnr/Zub8uBlTxGHqPamZB7RxPwqREGw7CqwK
         A9HIM+7aRTdXJS+88lT/Xk5T4mZ5kjQwE75cdwM0EWr924tCpJnIOjU8mBNrsyQcvdGn
         J16aKzruyWfPU5/Cw49tSvMalIGoylGEC9k6V7TVV1DqqjNOJv9Lr8hy12yPNvfHA5xO
         QMIOyK4RZ4+ZxonJcUtkgTVmNuP+2VpSk2HbnPdnXOjyiFKMXQrl5K5M8P+G+bNKqfXg
         eTXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bHFNQI67;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jb1-20020a170903258100b0019ca7f40c29sor1576817plb.29.2023.02.22.12.41.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bHFNQI67;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydbUYRBnMYm5IWRPnkcQpdjCAm0TqrUtLjLUaCyVvNg=;
        b=bHFNQI67/cDb5n6QtYMuRUHbTb/Ofhx3YfMp0zjNHVQZ9bBU8Cgze8ETKwXBLzUiiV
         dK95z/G4vCR87n/5OZsP8ozL6LbBlfu/gBcphw9lwSJDOw0IkXssVzCBeXCE14NOwWB9
         7J8/jBaJeM1Etwcg0VH/2j5f0vtRzDMiNkqRt9ZBYH4Dgev9wIY73SZh4JFgZlkcKQn+
         19ZxUlFAzE5kvR/cYJxzNDODS+qdpv169vaAhAY1Z+TmlUdmvixzsZhp8Qr+q3RgXWfh
         cg938Vo7ZHjh3TqvTqmO3eFCU8rESXmYiVRY0dzGoUPPzjoFyKEv0Dy6tzWIsJyN6wOH
         ULzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydbUYRBnMYm5IWRPnkcQpdjCAm0TqrUtLjLUaCyVvNg=;
        b=JKAJ6/Stp2OKQu9ANbORsaDco37C/ToF47wYOjCDEkzLgWOqF04sXqBInvsDYIiqVd
         GCzBh6JXWpcv+Raa+9cIZJ2TxjBCOH7WPUE8yupG0tq3x7/fnfiQkQqrxm2G3SIqu0Zn
         WaeS6p26KGOYYrhg1iJEpPALyUYmVxSOWcWbNK2PjSN8MJIZ1baXBaxE2wNE4j58v672
         fAK7lRzAjxjQC7Kb6d1PXvFsHXCECkEWxiQyNN7R8YLEtBH2MM++0AMwUcJuwzEdsKlt
         vVCUaJNH5QVbMOnrhjtAKd40nym9ml7ApdrOdoMrLsi/hgNKCW1ysdli/fKg8DBN0as7
         Scaw==
X-Gm-Message-State: AO0yUKWF2BOz7KjvoyWA88CRv/8MGxXSuFIox606CFaRr30OuhngQwWv
	BtuRwYuuc6pgA6iPcY5kyCwzZRW8
X-Google-Smtp-Source: AK7set/EqunxfFX1/dhOcLFK0/NEw+8kzF1I7xGnBw0jHPL0Py4gSpQErZlS5VyOeTGcekigwREY6Q==
X-Received: by 2002:a17:903:187:b0:19a:9984:5562 with SMTP id z7-20020a170903018700b0019a99845562mr10061771plg.33.1677098491629;
        Wed, 22 Feb 2023 12:41:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b00195f242d0a0sm2116537plp.194.2023.02.22.12.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:41:31 -0800 (PST)
Message-ID: <5a681b71-04a1-2b1a-c1bd-70c33f04a7fe@linaro.org>
Date: Wed, 22 Feb 2023 10:41:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] target/arm: Implement v8.3 EnhancedPAC
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-4-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-4-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PzHXR/8VPhzp

On 2/22/23 09:35, Aaron Lindsay wrote:
> +        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {

It might be cleaner, especially later, to have

     ARMCPU *cpu = env_archcpu(env);

at the top of the function.


r~
