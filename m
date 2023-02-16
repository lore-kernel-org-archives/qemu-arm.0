Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp263190ejb;
        Thu, 16 Feb 2023 00:15:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/oL9+IiS3QU4jPp81+TcKWQN7k09rk4wt4vGX0pQyyzscyzfcxVMLATlvjKvNYDCA04fF/
X-Received: by 2002:aa7:da95:0:b0:4aa:c77d:fa0a with SMTP id q21-20020aa7da95000000b004aac77dfa0amr4830521eds.22.1676535356609;
        Thu, 16 Feb 2023 00:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676535356; cv=none;
        d=google.com; s=arc-20160816;
        b=KV6kgj/55ZnuFL8kG3thTAezQjSPcCiTuOU8fXxkVEXjvVUPbv0mxX8i4uHu3GJeH2
         GxyjFty69Fipi76f12H6cXlkoEHFH6vtoPeecJ4KZg3eKzgwsT2DCDHsYT/0udyN9iV2
         jC0+b8PO+WiJ/rASGMWmVFU8h3THDUoHDHCMOsfLSbT6f4bx/bQ6eU2DYgJu7kew1k0C
         wXiLuZ/xph+qWZVfKnnVH6p5P3h3x39dnh3PbM8QZbite+/xYhG5vKQ8kiU07Gj+dWUO
         TCsws3jNzqOEzifhPv0Usj6aiw0+UWTpVs4iJLU/F390Ix7uKXlqoix8GJTi3m3NkBgZ
         Kdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7yj86WCyOwEULoySJQ17fpwniZYtn7FDCwVmQ8BM7oY=;
        b=anNe/9NEx83Jbkj2FQXgHbALxeO9RGzr/Jf5zymeu8eswzL6eshz1OYFAgg2SHqETm
         9xb1LgXd3iL2KXAogYH/Md+Dd4RVtBZ7yT8CaSx3u7D/9BlyirbE06vbXfo+NVqBHJxc
         8azHeT+T5EcdDNWPAJ+5L8iThqUEsB3WvHcw0KuRB1LMt282/ljl7iC1Hu+R3gMc42nR
         jFjEErlk6lk1eeGN3nnHEcPh1bqRrMkO+uNfH3XADe9s+rw5KfA3779VsYT31nUY+DoK
         F2yxbbGJ7OtXKBZcgm7qB+2hrJlg1B10uC0iXUD203IN/IHtqJlP7s7ZYQNRMEAQHpqk
         70fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl7C9we1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n7-20020aa7c687000000b004ad4c4b5ab2si1146162edq.392.2023.02.16.00.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl7C9we1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676535355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yj86WCyOwEULoySJQ17fpwniZYtn7FDCwVmQ8BM7oY=;
	b=Cl7C9we1yL9JiYbCGYGsSZtRWgQpMr1F7chziJSsVL0XyC1rPjQzm2joJaz5iK0to6dK06
	iBcpAlENLvx71OKNXzLCYIfw/8dT/vz/wOjwQnpoubdTbhww15sIK49RoS01ZFvd9hlfC5
	bnrvozbdHGMiV8+j5E01l6pWPQe2vR0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-AhR4eKFlNNOv0o0382g9AA-1; Thu, 16 Feb 2023 03:15:52 -0500
X-MC-Unique: AhR4eKFlNNOv0o0382g9AA-1
Received: by mail-qt1-f198.google.com with SMTP id bz17-20020a05622a1e9100b003b9c1013018so805758qtb.18
        for <alex.bennee@linaro.org>; Thu, 16 Feb 2023 00:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yj86WCyOwEULoySJQ17fpwniZYtn7FDCwVmQ8BM7oY=;
        b=b356Y/owbGXZJHaYO0c49SCbvr8W8DF2j2yQzRLttEW0rpbzG+2jlgHkSrtOMNmv27
         Ru6WD8yle4tFTecs/WJF1JJQL/hiXsO+3DIREUtYJJMfKi1tWy7h6+ZqUhM/nCPf2BXJ
         lR6kBXZ7+1LZ2eg6QAw2+w/2PkGRP8JkCNK732ksmYEbhxXmFkvF/KovEOh97Ke5k6ZC
         RiIO4hGjb3cSuW1r8YdD2NIl0/Ac7+A3cg1u4fzmgDt3k1kx9X/ZXQ17IpnfhtG2gOck
         j8anto0gNz018X4jCZuoRQJzJKmIImjCSFsS9Gj8KxF9S07JbOXUNNxRQXJUr+uIDMsL
         zkKg==
X-Gm-Message-State: AO0yUKWqpvos/VXYUbrhfSoavfV3Q1rrHf7P7Xn7ihnIifh7QawmpFgg
	1hhoFbfWNQuugmrKtorMlszyEEDm18Afise2SipRDx8+5fUgyB+O293S35zufPY0Z9pHmdfTzq/
	8Y8Pz6hBiSAwUtRVxlGuWHq5hEUg0+mz+D/xV1TUWgY5kT1rlMpdfiakT5slPkJMIV9QyvA+u
X-Received: by 2002:a05:622a:3c9:b0:3af:b6bd:aba7 with SMTP id k9-20020a05622a03c900b003afb6bdaba7mr8600701qtx.43.1676535352296;
        Thu, 16 Feb 2023 00:15:52 -0800 (PST)
X-Received: by 2002:a05:622a:3c9:b0:3af:b6bd:aba7 with SMTP id k9-20020a05622a03c900b003afb6bdaba7mr8600646qtx.43.1676535351846;
        Thu, 16 Feb 2023 00:15:51 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id o62-20020a374141000000b0073b676274e7sm715427qka.94.2023.02.16.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:15:51 -0800 (PST)
Message-ID: <67c50099-ed3f-0062-17eb-3cc5806ce320@redhat.com>
Date: Thu, 16 Feb 2023 09:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-6-alex.bennee@linaro.org>
 <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com> <87k00i82a8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87k00i82a8.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hWOYHYXoYyxt

On 16/02/2023 09.02, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 15/02/2023 20.25, Alex Bennée wrote:
>>> We also truncate the echoing of the test log if we fail. Ideally we
>>> would want the build aretefact to be available to gitlab but so far
>>> how to do this eludes me.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    .gitlab-ci.d/cirrus/build.yml | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>> diff --git a/.gitlab-ci.d/cirrus/build.yml
>>> b/.gitlab-ci.d/cirrus/build.yml
>>> index 7ef6af8d33..6563ff3c7a 100644
>>> --- a/.gitlab-ci.d/cirrus/build.yml
>>> +++ b/.gitlab-ci.d/cirrus/build.yml
>>> @@ -32,6 +32,6 @@ build_task:
>>>        - $MAKE -j$(sysctl -n hw.ncpu)
>>>        - for TARGET in $TEST_TARGETS ;
>>>          do
>>> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
>>> -        || { cat meson-logs/testlog.txt; exit 1; } ;
>>> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
>>> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>>>          done
>>
>> I think it should be OK to publish the artifacts on cirrus-ci.com
>> instead - you have to click a little bit more often, but you can still
>> get the artifacts there, see:
>>
>>   https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.com/
> 
> But dropping the V=1 also helps by reducing those chatty softfloat
> tests. If we could merge that with yours. Are you sending a PR soon or
> should I pull your patch into this series?

I'm not planning a new pull request in the next few days, so feel free to 
pick my patch up or simply ignore it.

Anyway, the V=1 has just been added a little bit more than 2 years ago to 
address a different problem:

  https://gitlab.com/qemu-project/qemu/-/commit/2a5a79d1b57280edd

I'm fine with dropping the V=1 again, but it still feels like we're going 
around in circles here.

  Thomas
