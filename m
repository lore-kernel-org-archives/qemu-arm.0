Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3007111ejc;
        Mon, 23 Jan 2023 07:29:40 -0800 (PST)
X-Received: by 2002:adf:d084:0:b0:2be:1eb:1f82 with SMTP id y4-20020adfd084000000b002be01eb1f82mr20465437wrh.6.1674487780059;
        Mon, 23 Jan 2023 07:29:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674487780; cv=none;
        d=google.com; s=arc-20160816;
        b=iHNyYi39curlzxuIaTtWYn0Az1U2C6lmelw0fLSUEXexr2UVY1z/klu0hpvxJHx7dO
         yMboh1148tvI2MgNQvhBtzk+LHwRth6wn3iYOYLjGvwhgbQ2OcrVLunvYqtA6D48W6MA
         paWWE4QgSs5wkhT+5t1Wo6ZdUQQoa8nvGMGtBU3qHVJathM0yl6MZO3vYDGk4zEFwcJp
         sav416dKPNNyv8lsTTk0HcqyK2athstGpZjXwLBrc6C5VzTpaXOVcRlafM3+9W/pmn5z
         kwajdTXDDWNj4bI4k4ypoXD9cR8TyxlmskEjk2v4DYj/xVLXNtI9tDkkmqzKPk6GD4gD
         ArWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ag7ITHTYVgJVxAJpVhIXSpT7l89y1QU2TY+2UBhcQLg=;
        b=CY1Z76RNY1ORhBU+FaP+NWLEZNcbd3R/epbDpjWUCGrsFJRFpBkzAf/4EBX4bbk1fI
         WR9ZTP3Rp4MxjAOOdVf2iUf/9FNSzG+rnX+0mPKNXWeeLC4IVRLXZxFvS35BpmHKWBhM
         8eNAUEZwKLnXl/7ujpMZC8tZXgThnOWnk+4JeTOBOV0834QiJvNgUfIk5I/h+gyFoRQA
         MEPcjZXsFxePJvipBUgCZm1wwlr3XI9XVZbxYrqfxE/NYatiWACd7S3mJmjguf8j/d5T
         8gzKlvEduTlhM0Nu/s3wizGqrN4tv7xCMN55yqn/vBLBS0MlN5mGm9lo4Hc5Eq5WX3uc
         liAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/hfbLkw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h5-20020a05600016c500b0022ccbedc1b7sor1955347wrf.4.2023.01.23.07.29.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jan 2023 07:29:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/hfbLkw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ag7ITHTYVgJVxAJpVhIXSpT7l89y1QU2TY+2UBhcQLg=;
        b=N/hfbLkwtIiOnnUCwe+6G0R0yH1OISVvccHsBfNnM9+68oB3frKpUvCyE+/GbmFbKI
         3mclV9s6eEUxxgvbKrrx3vCnsw2q3IX20e4hWfoHOo/zPyhDonsM1dFPNt0/8pUNDsZ+
         66nab0+RBgTUGeSRNXW8EEIYROXbY6yRfBgO7YPHRithOCVIMNhvmAVxfygm00BPMliP
         xYKgS4I+vJ2gesohg928DrIer2QRUPkASRMugw/tnLJ6vv5GBkOkQb8dTRkaMeedFGUf
         8vpNLRhNTZMqb1WHyGxoBH+Pp3pmh+UNGmZItMgE8L9bC/V3UBVZS9BUlWfO4rFJqpTs
         1Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag7ITHTYVgJVxAJpVhIXSpT7l89y1QU2TY+2UBhcQLg=;
        b=LeeN1pQPC8r7Mopu3OxogjRGwkuj2oJBH/KqV5QfhE2+OhnVIuvCCO8ZFeX3d64meg
         ZuM+6BQ94KejC4qF1IzEDYkGN25BDdZCeyTCqQhtRUaZExNIXbxozYupL6Y4aOUjzoPK
         EG8FMbbrslgj3YtN7GfQghWDRB2btztm9A1+HOTLdURVbuywcfnEt7lJKygZoTFweUbt
         Wo0ZN3J9iae2Jwl1+nS/7+W5Fpu9ycbTZC9QGWqWfqYWPq9VMYpkqIweMSg4SrWgMUxu
         3VubJVTlFVhDoKka9dwULofW92UuzWeZmytgvOcT5Gb9k5ah4K7EX2fnh87tquYaozIb
         eAHA==
X-Gm-Message-State: AFqh2krIDJd8r+nyhrYI4bG9DkPUauJTIV/unonFCy2HFUG+tsI50HDd
	s8oACO9f1WDSWOGij0UnrsaOnTnb
X-Google-Smtp-Source: AMrXdXu/0iu5bjJowzEZ4SCeKLJW3JFz/tPzrJX44rLswL/IRKsiW6tKvM1395eMYe2aH0KuiMSz2Q==
X-Received: by 2002:adf:f852:0:b0:29f:4e42:33c3 with SMTP id d18-20020adff852000000b0029f4e4233c3mr21866250wrq.56.1674487779750;
        Mon, 23 Jan 2023 07:29:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id b9-20020adff909000000b002be5401ef5fsm8310826wrr.39.2023.01.23.07.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:29:39 -0800 (PST)
Message-ID: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
Date: Mon, 23 Jan 2023 16:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org> <874jshco5h.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <874jshco5h.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8+2ULSwjtXQd

On 23/1/23 15:37, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 20/1/23 19:48, Fabiano Rosas wrote:
>>> The migration tests are currently broken for an aarch64 host because
>>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>>> line. Most other architectures define a default value in QEMU for
>>> these options, but arm does not.
>>
>> There was some discussions around that in the past:
>> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat.com/
>> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12PT6PmLjdZ5h_YA@mail.gmail.com/
> 
> There's more than one topic being discussed, specially in this last
> thread, but here's my two cents.
> 
> About defaults: It's probably best to be explicit in tests. And if we
> wanted, have a separate test to make sure the lack of an option still
> does what it's expected, either outputting a message or behaving the
> same as the explicit version.
> 
> About host architecture-specific tests: Unless we're talking about KVM,
> I see no point. Having to change hosts to test agnostic features makes
> no sense (the migration test is one example).
> 
> About generic tests: If a feature is required to behave the same for all
> architectures/machines/cpus then sure. But most low level stuff would be
> quite dependent on specifics.
> 
>>> Add these options to the test class in case the test is being executed
>>> in an aarch64 host.
>>
>> I'm not sure what we are aiming to test here.
>>
>> Migration in general? If so, any random machine should work.
>> By hardcoding the 'virt' machine, at least this test is reproducible.
> 
> Yeah, I cannot say for sure there isn't some machine property that gets
> transferred during migration. It seemed more conservative to define a
> specific one.

Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?

What does this test require? Any machine running KVM?

Adding Juan and David for migration since I'm still confused trying
to understand what we are trying to test here...

>> I'd rather fix that generically as "if a test requires a default
>> machine and the target doesn't provide any default, then SKIP the
>> test". Then adding machine-specific tests. Can be done on top, so
> 
> I agree, but the only tests that should *require* a default are the ones
> that test the command line parsing or adjacent features. We could always
> test "-machine foo" and then separately test that the lack of a machine
> option still gives the Foo machine.
> 
> The fact that we sometimes use defaults to be able to have the same-ish
> command line for every case is more of a limitation of our testing
> infrastructure in my opinion.
