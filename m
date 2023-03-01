Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6817021ejc;
        Wed, 1 Mar 2023 03:06:20 -0800 (PST)
X-Received: by 2002:a05:6000:1f10:b0:2c7:e48:8c87 with SMTP id bv16-20020a0560001f1000b002c70e488c87mr9429810wrb.25.1677668780301;
        Wed, 01 Mar 2023 03:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677668780; cv=none;
        d=google.com; s=arc-20160816;
        b=qjVINcRZqiMrIRkYcLGofYMSxy7tGe9ULTKzkH1YkxxQmWYh4d2SKtvcPCNe4vU0Xg
         whOrY64A6B9yBbhRhCRwP9mti5f1RO6Qb6mrhpASJPpzbt2YCi1Hf1Hy1IGNq9O0xPR5
         jbR0P5R1P5YYFQcg+JPmGhnVlyubOnzjPOOQvLJKzY83JUqkc+ym5OzVCvyZE502xKb6
         2zZNtR47pK6zjoookGzBOq4wddiCfTwE3KfarzkgPqnNNz4pYbQq6wHZ9ty6UT8oJTR0
         t/7WZbAkGrMhSr8cnp5m/i26y3qN/7t9x5+eQhDin1GpgNv5Y6pDB4EDcnMWkOF7NrUv
         aM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=364KJQYv/7hi7ZK8tozy54IqNYC0gki7whXXPw86DUY=;
        b=QDjTA0ZE9MKVPUA2JrqCT+abG9BPaZ4uqWx7gV0SEWhPc7AuxADWtw42gLefiKjQTf
         lfmcUxwfLPAWFNxhmkH2gLaQiDFaMQKUfqBCV687t0sD/BSk2tlyjJjYlgPBtTdWFpJQ
         Y8ckTnSnt/bK6NcCia41x7C5yUkXwnKrVIGxKavxuTiBiVdyI6EhSq5w27AJ46BYF99m
         UVhggBNs4/VmEE8gZ4WdXF7BanhNL3li3vv7YZbw9sC8Akygt0BIR1M+zKMY2LTxd5Wl
         E/yf6CB+loQH1Ltt2AT3bd2IlkSWMA+8EooelgJB1OORl/veAceJHM/noAI1Kpx2hPL3
         Y4LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cjyZIhD2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x18-20020a5d4912000000b002c57f887180sor4368629wrq.21.2023.03.01.03.06.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 03:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cjyZIhD2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677668779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=364KJQYv/7hi7ZK8tozy54IqNYC0gki7whXXPw86DUY=;
        b=cjyZIhD2Lr7aK85ZJwvMsPzXFxp5WtlBBqPs6iPqVgN6aTNjURZFQYE2QzYHRoemu9
         m4wfy6bXLxbz31VPAGyApZCHXRa9Bb2/FCjCLjPux21dEs/Pvd+REYH2ZvW81YAq023k
         Wkq9Q4WstbuPPajTu3Drx2DLjG4ZN1xI4Zz/OAURW2x55iaRS7olmBu7Ea7ggATMElyf
         psfUZAMsSOjbRD3QBeHSvmTjhCt6qJ7iQfvVLw+HtJoVRoIj658G4ZcgZicI8Lg3iHTn
         t5pgTMwKQ5yH2zLD5SNsOikYtibpE5z1VdiQct3g/vcb++n2DVozm1WUhTUMEAux/xO6
         jUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677668779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=364KJQYv/7hi7ZK8tozy54IqNYC0gki7whXXPw86DUY=;
        b=PHF+8rx+WPZu1QGXxiTudfmb3EMvxhLKu7Lzk9M9utc63tcxc04lvkoZNKoV+NNaET
         fUNHcdNMIetbnhTgjBMBWvp25balinB73fcJ1mMu4A+Ex87UP7nDjkpByapwuW+Gg4sT
         VVvMADvhmxlnfRmcLLaRakgB4Gu5F1slXkXge5gCzMakzeced6xqaTkw5g9Ts4jzYO6o
         ByP/7ML162zwroCj/948lRtrFgQ3TMIta7Spb7/KT8glJbBHUt0k0S1zQTvh8oUle1l3
         r6BlOCuylqe5neD5YS8UrUe0ArbXsGBwcXNCSEcEtxQ4dDfDPRMeLO/+dTIpq2ZJ778Q
         om/Q==
X-Gm-Message-State: AO0yUKV7xctJdRTtehXaQG9Ih9mxqip0bskd+HVv4lEqLNfBZbDtJ3n3
	ARbEE6TK8EYYptpUpPMydpxaDO4xsSTwJ61k6vE=
X-Google-Smtp-Source: AK7set8LI3J60CsMUCHjTk5tbWOP4h6DAFeJlayIzwnzM9djnmC+DCMe1I566amiWy90xS7xAcu0Hw==
X-Received: by 2002:adf:d1c2:0:b0:2c5:483f:1580 with SMTP id b2-20020adfd1c2000000b002c5483f1580mr11454881wrd.12.1677668779710;
        Wed, 01 Mar 2023 03:06:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id s17-20020adff811000000b002c758fe9689sm12291431wrp.52.2023.03.01.03.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 03:06:19 -0800 (PST)
Message-ID: <c2b12748-9e2d-2aa5-2789-9f2a9224fd45@linaro.org>
Date: Wed, 1 Mar 2023 12:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
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
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-24-alex.bennee@linaro.org>
 <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org> <87k000d9f0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87k000d9f0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aHJ2seVw6FuT

On 1/3/23 11:59, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> We need this to be able to run the tuxrun_baseline tests in CI which
>>> in turn helps us reduce overhead running other tests.
>>> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/dockerfiles/alpine.docker                | 1 +
>>>    tests/docker/dockerfiles/centos8.docker               | 3 ++-
>>>    tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>>>    tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>>>    tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>>>    tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>>>    tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora.docker                | 3 ++-
>>>    tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>>>    tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>>>    tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>>>    tests/lcitool/projects/qemu.yml                       | 1 +
>>>    18 files changed, 34 insertions(+), 16 deletions(-)
>>
>> You simply ran 'lcitool-refresh', right? (not obvious from the
>> commit desc).
>>
>> If #361 got merged, this patch should also change the
>> tests/lcitool/libvirt-ci submodule to include it, isn't it?
> 
> Yes - I've already done that in my PR branch.

Then:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

If you don't mind, please amend:
"refresh the generated files by running 'make lcitool-refresh'"
to the description.
