Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6822697ejc;
        Wed, 1 Mar 2023 03:12:15 -0800 (PST)
X-Received: by 2002:a05:600c:4b1e:b0:3e7:cee4:f8a with SMTP id i30-20020a05600c4b1e00b003e7cee40f8amr4704855wmp.29.1677669134851;
        Wed, 01 Mar 2023 03:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677669134; cv=none;
        d=google.com; s=arc-20160816;
        b=p4QFPBIIOxHXbMgNIOOdeFDaxZnMb9KWNAjW5NfYzuMQl6RiS0opwr9FOeLiaZ4cDr
         iGVoqpDR+cxhVnW4PF5D2TMXK50GkSD9P+Q0pI/Qj+Ya6EJC0QemWGGGDXgEfV+RgZJe
         ByZyw2kSvwbzNVdbTiFU5haCCd9sb82u8gHiYrnFxruy2VZxVX5iCkPe0wFt4oON+5Uk
         rLIilRfAS53mMSv6oltiV/jhWdbWuq5yn1QTLXwLQhTiBaPv1XdXOVs7L/kiTG4mdlS+
         j8GdGYiTljj0oGY1VopN7LSFZcN7smtQcYBA30GuYu95uzu4qfC0dET58YS8Xm3wU3Tb
         d3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rT6IJCO3G307IPuUraDVeTgC8PNfnzvDlRI9ACh49Fo=;
        b=Vto/94FxX59wMVPZagxgIFajxzxnPRqACC3xQmJZm2H0xgC1FvCvAuIn1fggaCj4gH
         +nE0/uY2dHb/eTrVvS1KgKdvW1SlqTJxn5aw4GHIFk7tDVZqgR+Qh6qsF/ppga3Jop5v
         yBJHwm5ejJQjCzH/XiHMHqVSV5Ti1krBJGJravBWMH9jfMDePa89gbJHyo2gq7s2CElI
         Zhqhz6j6VPcHAW/0M9k4UvWYv2JqP+9myVq97PF7QjrHIoDyntXHnDUpySzF9CEAF675
         q3rUkOUuzA0zCSXsEaPXndStM31/kuR6lZsI1RJBMt/tx1sp3by7C9z3FmYTDOpyxnB9
         pWuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez3drqod;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i9-20020a5d55c9000000b002c7280c4efbsor4536496wrw.26.2023.03.01.03.12.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 03:12:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez3drqod;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677669134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rT6IJCO3G307IPuUraDVeTgC8PNfnzvDlRI9ACh49Fo=;
        b=ez3drqodTX/aFYqZUm56pCCX7E/3YzIBibsJXxPjIdyJmM0tMjuaFcCpynM6pPYzc7
         L2ARxsd0ZNp9R+OtKJ/X1vNiO++/aQc3nJ9h7DWUvY08M37+eEDykAsCt4YCz4jBt/La
         2jXdK3DPC59FnIeE7lwc6wiYM3m7b1v9UhhYYrAN50kYgTbaKvyShRgFo1HCeuWLBWg4
         7+POwxU4SC1+kFPNF+XdPuYfF5gn2RgzIKFYXuaiZsMxFmgyqU/Dwhkrw7jM3HSUx4oT
         uPW/2mVKnB7auPXOPCEoYZC6pcjqnlXWG9iV91VpjaT4he1ozIfD3kvFPFCuCGP2rXvj
         5iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677669134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rT6IJCO3G307IPuUraDVeTgC8PNfnzvDlRI9ACh49Fo=;
        b=4HPHJONaERg8PLMpfYaWQkQhqDQqEnZpGqhqS5RlrEIin2gGUOJXs7D4avSYruMhB2
         5mZCifPKa9e4I13AfDrekVWy70kUnOJJWlIDrqW5TNk+VX/x5HGGe3NgCpnqP+b0ULfq
         ihAHB8+2YMzMi9fz2jkFUEFq2SwyRgah938VYYDF98hMU7T6lBOKvDJ4Mk9AtOal2hVy
         Ev2LzrIU6foDyvMZGO5P6Tj0wN1ZVosAmn8P4mSNOGCspFcPnfriScN3bwumL/t6jmmF
         TDtXHThFtmrn1gYPWKp+nIKfUFfAu4f2hww+U76vK7sTCcIKc2BpsT4F2qxtnjNOYMip
         Fnzw==
X-Gm-Message-State: AO0yUKUN/e2hYLHj3jPBi88Wv6kFzJs7LoZdTbxaW/0wvzbBnirPIIiz
	yWPTdxlZWFZP/Z4rSZEiqnKCjJH7yqOmOdVonUo=
X-Google-Smtp-Source: AK7set+uHsjBX3Q1JVkiWf2Dob+iKQ0YFlTixrP4GUZQSpzVKQ8GGmw08SEHmQbvaf9RMxj5DWZGmA==
X-Received: by 2002:a5d:4842:0:b0:2c7:1c4e:1d11 with SMTP id n2-20020a5d4842000000b002c71c4e1d11mr4161150wrs.63.1677669134285;
        Wed, 01 Mar 2023 03:12:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f12-20020adfe90c000000b002c3f9404c45sm12303097wrm.7.2023.03.01.03.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 03:12:13 -0800 (PST)
Message-ID: <5cf7b03b-d297-de3f-9787-f9f7905b6a9f@linaro.org>
Date: Wed, 1 Mar 2023 12:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
 <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com> <871qm8eqt0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qm8eqt0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CsFQsTn6o+hy

On 1/3/23 10:57, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 28/02/2023 20.06, Alex Bennée wrote:
>>> This test is exceptionally heavyweight (nearly 330s) compared to the
>>> two (both endians) TuxRun baseline tests which complete in under 160s.
>>> The coverage is slightly reduced but a more directed test could make
>>> up the difference.
>>> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
>>> Overall coverage rate:
>>>     lines......: 9.6% (44110 of 458817 lines)
>>>     functions..: 16.5% (6767 of 41054 functions)
>>>     branches...: 6.0% (13395 of 222634 branches)
>>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
>>> Overall coverage rate:
>>>     lines......: 11.6% (53408 of 458817 lines)
>>>     functions..: 18.7% (7691 of 41054 functions)
>>>     branches...: 7.9% (17692 of 224218 branches)
>>> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED
>>> is
>>> specified by the user.
>>
>> The explanation sounds somewhat implausible to me.
>> AVOCADO_TIMEOUT_EXPECTED should be for jobs where we are not sure
>> whether the job really finishes in time, e.g. when compiling QEMU with
>> debug flags enabled, and not for jobs that simply run a little bit
>> longer (in the latter case, it would be enough to simply bump the
>> timeout setting a little bit if necessary). So did you check whether
>> you really run into timeout issues here when compiling QEMU with debug
>> flags?
> 
> Ahh I realise now that I was running into the timeout because it was a
> gcov build. I'll drop the AVOACADO_TIMEOUT_EXPECTED bit for now.
> 
>>
>> Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't
>> need GITLAB_CI anymore, since we certainly don't set
>> AVOCADO_TIMEOUT_EXPECTED in the gitlab CI.

Correct we won't run AVOCADO_TIMEOUT_EXPECTED on GitLab CI.
Note however GITLAB_CI and AVOCADO_TIMEOUT_EXPECTED are not orthogonal.
See docs/devel/testing.rst:

AVOCADO_TIMEOUT_EXPECTED
...
   Even though the timeout can be set by the test developer, there
   are some tests that may not have a well-defined limit of time
   to finish under certain conditions. For example, tests that take
   longer to execute when QEMU is compiled with debug flags.
   Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` variable has been
   used to determine whether those tests should run or not.

GITLAB_CI
   A number of tests are flagged to not run on the GitLab CI.
   Usually because they proved to the flaky or there are constraints
   on the CI environment which would make them fail.

Personally I run the Avocado tests on a daily basis without
AVOCADO_TIMEOUT_EXPECTED, but certainly set it before posting
a pull request.
