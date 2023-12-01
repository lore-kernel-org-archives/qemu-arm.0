Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp974503ejb;
        Fri, 1 Dec 2023 05:22:56 -0800 (PST)
X-Received: by 2002:a17:906:1c0b:b0:a01:8ef2:849 with SMTP id k11-20020a1709061c0b00b00a018ef20849mr792836ejg.4.1701436976008;
        Fri, 01 Dec 2023 05:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701436975; cv=none;
        d=google.com; s=arc-20160816;
        b=gocg5iwtfhh+ENvs0933U+/DmoAbNukHaZpI/C3EBg9ZMg6InK9B2/DYFb8LI9PCp5
         3qrJgUAuQnopXAS5h7p614WZrnh9/ZplpDwdFDGzwXrRjNdxW8sKRx4inI4DWX83AMb7
         i4LPoKEcBNiNdakpMuyDl3nU9EZs3ax/3Dw8+S+/r5jJAPJWYCnF9vi0gpDpufYY5IH6
         OiZ/zhdKFxwkd38229um3lsVl+Y436BnklKjNDxEe7BBQKLY5czAyGumIEvIOh1b5UxI
         oNhvuIwoIjCEjRHI0dtTyh1auKilEsb93JISbBpkWCJmWckkvOaR3sOHvwZeCaDvONyU
         j4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pDzgw0j2ieqF7WeN0XsF3Hhb7PjtVQk/oV1FS05l49E=;
        fh=6mJtVEYroea8+yI7Mq2gRaq81KFzNVmPmkVOfL/lxpE=;
        b=bs5eY0+MMNTp3cG+DfhXc1ADZ0/aHIhN7oe1GZtnCVI6l0wTMCWnV5gFy9nxDljEh2
         nVRlBbGkvHzfE6SXNEAkC3koFUSWEYakMewLSuvvfKSPiWP15FJ/HLfM3DefJDaGuZlP
         +p8ViQ8ZXmlx/d10PbhF9avZa4vinzJZUT/LI0eSVW3NhazoQQ4hiAlxtg/WVET4o/+q
         8bxrUkVwW2mBQBKyXCZjfCJCz5lcIaZBisVNRfY+twQEd+1KCLzLCfqGdy4bEnCC7OPc
         /ozLmvf+DD9gJQ3yABSR6ApBwqvF/3YKG/VmVB62y4qnXU35z1cqaaFFa1aszYd1pfIp
         yBww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+AOXIyG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3-20020a170906224300b009cd938511e2sor1435135ejr.19.2023.12.01.05.22.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 05:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+AOXIyG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436975; x=1702041775; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDzgw0j2ieqF7WeN0XsF3Hhb7PjtVQk/oV1FS05l49E=;
        b=Z+AOXIyGzcD5K14PWpxwwrP+bVra+etTzQPYpIxBQABXgKDDqr8QKrvhP67sXXrIG5
         LI7rd9pxt5VTq/kA0fxBuVY8lCvIyZEsGV2RdUGsLVt/CZa6PLDFKvF3rfrgHOB3W0Tf
         LcqVeeX5w7H58MM/k8VRDARye1yPthStF/gM1j0BhsNbSi3lW82IAlvV14Kf5kMAGt/y
         yD66px2JTNadYR+8kwQyjaYXFl1u5iweu5bST9vFY0/kEfkaXGONoDPc3C2qtSWrF+Do
         wtoxjCqgIg2PvLPpXBZR/NoHKq1fQLRAkAa2Vpag47jsYOfMZZ4LTLtTfkmjEHCanEJP
         /SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436975; x=1702041775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDzgw0j2ieqF7WeN0XsF3Hhb7PjtVQk/oV1FS05l49E=;
        b=P1gZXCD2BlOQwqmEbOH7jouUwxAJTn8+iKHBc8Sbz/r2q68C4T7v8JxPxbrBLsa/tP
         D9sHDJdppHxTiD0jgJh1JK+5ExDEYdnyqOz+kplfUZ3IfsqijjO7Qn8R5kOxzyFe40DX
         FLXg39EquAgYfKs4dLJ747qKXvE/z2V/apE30tVyzq5C68cHa2VJUotltUg1+6GQLwOW
         QafUORTQJSzpmERKi8vmnywzIIeRf9mdTVwAFZEd3opU2BNC38fFfPZ6NQ3EasPkuSSL
         MbHt/yRf3TWzsPVUb0L8G9QdB4eEYK+PBfF1ESJfE9CxDg81JoF3g9GPSWE6dqT0n8gb
         f5Fw==
X-Gm-Message-State: AOJu0YxMI+wIOH9/8CIzi2Qk03dj89TKWCDci1RX8zVLHt0K+YZAllEf
	VBHYPepkxhNYH+aVdfl9ktYawKKQE7C1o2Oqec/o4A==
X-Google-Smtp-Source: AGHT+IHVI7JYrojw9sIMg+Tp6pTuaLL9Wy+ZTtntBTDr8IlR3PdphG53O4TSPsayIps7CVPcEw1WtA==
X-Received: by 2002:a17:907:5095:b0:9f3:18f8:475b with SMTP id fv21-20020a170907509500b009f318f8475bmr682651ejc.62.1701436975267;
        Fri, 01 Dec 2023 05:22:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id cf6-20020a170906b2c600b00a1937153bddsm1360721ejb.20.2023.12.01.05.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:22:54 -0800 (PST)
Message-ID: <72ae8131-9cd3-4180-bcbb-d69f113211ac@linaro.org>
Date: Fri, 1 Dec 2023 14:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-5-alex.bennee@linaro.org>
 <45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org>
 <87ttp25bqh.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87ttp25bqh.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zaWi+/QDpLOH

Hi Alex,

On 1/12/23 13:49, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Alex,
>>
>> On 1/12/23 10:36, Alex Bennée wrote:
>>> The assets are no longer available on the website so these are
>>> blocking CI.
>>>
>>
>> How are these "blocking CI"? Missing artifact wasn't be fatal,
>> is it now? Also, did the artifact cache got flushed? These tests
>> pass locally, I disagree with removing them.
>>
>> I can send a patch using YAMON_PATH like we have with RESCUE_YL_PATH,
>> but I still consider missing artifact shouldn't be an issue. We are
>> missing the point of the Avocado cache and the possibility to manually
>> add artifacts.
> 
> Sure but in this case the binaries are gone, you can't share them and no
> one else can ever run the test. At that point it just becomes dead
> weight in the repository. This doesn't stop you keeping your own branch
> where old tests live on while close to a warm cache but it does somewhat
> limit the use of the test to the wider community.

No, I still disagree. The tests/avocado/ directory started as a place
to share tests, not to add CI gating tests. That was discussed again
2 or 3 years ago, we even recommended to change from the "opt-out on CI"
policy to the "opt-in for Gating CI". Daniel suggested the Tiers
approach, having only Tier-1 gating.

I think the mistake is to consider all tests as gating.

Why don't you want to share QEMU tests in the QEMU repository?

We might have some misunderstanding on what tests/ is for, so let's
discuss...

Regards,

Phil.
