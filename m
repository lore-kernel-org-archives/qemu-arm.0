Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4502463lfa;
        Tue, 8 Jun 2021 07:57:23 -0700 (PDT)
X-Received: by 2002:a17:902:6a87:b029:ef:2942:89fc with SMTP id n7-20020a1709026a87b02900ef294289fcmr420887plk.36.1623164243157;
        Tue, 08 Jun 2021 07:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623164243; cv=none;
        d=google.com; s=arc-20160816;
        b=LODRJ5JScu9EU0njCR3kGRS3U1hDqoGCEkH2r5gqfSHMagaxDHIPD1Emdokva5atFN
         WhqmPGon8P8FDmH1lGDfT23OEOjmDdXxVJYqeFpBYvYQ0CQ9JeL1/TbFYQ+bvMhNNbQc
         AHsKURTaChqDw/QpPJNJp6MKLIgfyN8dYbHg24yBch4i1gY5Xfg3XzCZf2u5L1V7ZQUO
         +fgnpSHZFEKNwg/ucQO74nL1KiORvYRqYGolT7KAUQZDVo8phDViJgi/83TD8wgD3LSX
         ReXTpuSCL59IldXshD3ShNRfvIETonaBWSUmetEt99neLLkXR29IKDOkp9dHs5seCfgm
         JYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qstUPoEjJqICFY5E1oneumgeSfIsY3ZIdIiFxxDmJBs=;
        b=Ldas9abzOXPddLfCy4b2ZTQARA5sXIb0wIqSxsBFhVz7oBTvVr4BKQNRiw2F4CHXAD
         iLoR7owcuZ5zi/UbR8yqgz4C0ajOPmC6lQmmv58IsUlpaXuJlzrRaWJgsaNIh6aqm5yh
         bYGWYYiqjVW/ndyn1EWRKDjoN7eu/tgtZOrNoXpOeI7bkOIyMk52YLZD0uAadwMDU8IE
         kF0Kha8YCqLKumJzKFmENtosa/THQhtOFaItI/vkQbD3SaEg9YSneGtfCToCal7c/WJ+
         plauM2MPbvhUZ+aueWBJUaY1mFsgtz+On8NttOs6OQmItqTY1aMbiKDYH5ssiB1+M6Tv
         eXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPs9E+de;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v1sor10493824plo.39.2021.06.08.07.57.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Jun 2021 07:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPs9E+de;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qstUPoEjJqICFY5E1oneumgeSfIsY3ZIdIiFxxDmJBs=;
        b=mPs9E+deXnxkpG2PWvwmelVZEhcH/1DAuUE0oPVv+5tzTUtYK9JOLDzYsZ9yE9NjYb
         q5IaxK4uMfZw4bORrcLzyXYMMkVYIA2P2nMLgjIRlyw+mdAScV5An7WpO+q1HK6UAgOT
         H7RHF9QxzsFplyIjG8usKH/3mj9exNwfccJlQ4LbtwLDa0nmSi/YAG5Ae1DSUzLr66nA
         xax+VHmCM3lyz34c15AUe3emoqihZpfBX0NeqN4a//TJPFf0scSw9LeTOqDwmwQYHh+C
         046t1N7x65NSpV/0FwOp0LIERpY3LU3LOE2S2athwIpJ55FUez1b97RVeofhg5KpLJ7P
         ZVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qstUPoEjJqICFY5E1oneumgeSfIsY3ZIdIiFxxDmJBs=;
        b=Z8Vsgvj1E19ZxWtsajkQxL43mh6sUPUkPxm/RkOMeYb6UDlPJ+YyldmWz/R5MIi+M/
         2qVUIsIWT+Xi+f4K66Cce88zNWR3jF1GchdGuQcJ3JiQMoZpaIyGYXHG/u0wH7Q9eyFj
         u8WOboKaFhHQvg+qeTDKZ2PI92fs3cUICLHcr22VvzrXFKBQtZqDlxKeSa6loflffVRj
         IWM7AngDN+6yM3jeffDNEVCy3KA5X6m/x9+RcwrS09xMhcKyaRvWnnf03VFaLIcrzb8y
         2L7vJdAoVU7frXQLPtT6KR2xZv3VYYfbkVUsZVdEZoqhgp6y4hZql4Af47TjIV1EWV1s
         wtYA==
X-Gm-Message-State: AOAM5304N4HhCzDmMkZYTY+aaWAhY9iW/cN6SJtyRjHm+qQJodrjj/jT
	p5GNHlXV0ByTGIB4dlvoRmgal2cT
X-Google-Smtp-Source: ABdhPJzwA1GSBKg3ehhLdWaKhK8UqzzR07L8wXbXYKpSshN5jPOztyz/pqsjwObiiY9rL9KNmrurvw==
X-Received: by 2002:a17:902:7c03:b029:f0:bbde:fc1e with SMTP id x3-20020a1709027c03b02900f0bbdefc1emr381927pll.57.1623164242613;
        Tue, 08 Jun 2021 07:57:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id g63sm10950405pfb.55.2021.06.08.07.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:57:22 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17efdd43-6ee6-eb9d-df3a-f53f3eefc892@linaro.org>
Date: Tue, 8 Jun 2021 07:57:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pbwZP7DZ0cgb

On 6/8/21 7:27 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.
> 
>> r~
>>
>>
>>
>>   and besides it's not likely this is
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
> 
> I think this point still stands though, I don't think we get much from
> running the cdrom test with realview et all on qemu-system-aarch64.

That is commentary I can get behind.  The former has connotations of doom and 
gloom and the opposite of where I think we should go.


r~
