Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5757097ejc;
        Tue, 28 Feb 2023 05:29:17 -0800 (PST)
X-Received: by 2002:a5d:6805:0:b0:2c7:1483:88d6 with SMTP id w5-20020a5d6805000000b002c7148388d6mr2421937wru.23.1677590957612;
        Tue, 28 Feb 2023 05:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677590957; cv=none;
        d=google.com; s=arc-20160816;
        b=b9qWecPpwhCDasUYnRW36VyGlLlNFVZnRQh1tHxNeYu5z99J4/0FDcV+7VC/KI/I8z
         MGWTvbdAQ6/GHvwUjjsw0j9xT/oMdamrtUFQxw+qkrWsQ+HC18d28ypu7XFE+riX9EGo
         PPGi0tcVPChaIjLOcpHC8S9M0z5KCSMf234/lsiwmtv8fua8i7rUMF/L7ssnevJBiW+9
         utI0sQiMPIsvpTAoCjePk5h9KtSA4b86T6WJdhg2wfikMWioQwZrINUhgXOu9JKl/DXs
         /CopRb3aYfgyB4OxnUS3W6rqwEGXrOJUdRDmYjX9YrL87nUurPFgu4JnMw/srRyAc88O
         ef7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y/hTQ7wRjVwyL9mjDzAcMVZjoOrcDwc8c0a8ezZTmwM=;
        b=YLtNZbKxHMfJShUZLF70zNkKSzKfqr8GDxoAYqsyHjlqFifqmX5w07y6jzf2Foc5o5
         heLcx+IxbvwtYLuMEAvesuDTy+wMAVfYWMZOw7w5bPMLqtC56ZQsIlLyu1uvp0J+2D90
         r1w3+vzL5zAbiEoyBfUuTLvpuFdGQmT+Dr3g6dEWwdS9sbQCdagbUv/jp0N8mBulK8zB
         5SP+3v43TZL1pqImyVg2lDO+u0uleqNNyIz4W3zxyYgB6xMhI4plkgnULDmuo+lsi9WP
         XeQk52/6aq+g8r1IYX7ng9OnVuGpPxKv9mPTdLSv3Fu2tBKNq839Q919s6PHsXufBcUp
         5J2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfouDk3D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c26-20020a7bc01a000000b003e21f010fb0sor2534812wmb.13.2023.02.28.05.29.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 05:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfouDk3D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/hTQ7wRjVwyL9mjDzAcMVZjoOrcDwc8c0a8ezZTmwM=;
        b=yfouDk3DMwNHrUnCCOSNXgBoxe/y2CNcQ0egp2ip+22nav5gwG7w9C0ntTq9WCA5qk
         TyPTRfl0YNTp142xlhG3kDT9eLG+Ej8QDiwpjM7SJyY1qcfmUMdhboxPsGLGkJyP7svs
         NWv8ZNHXb1rLS0p5eeIW9lAK6G0Dd4JeJDXLv5jx8V9tgp+Qd8aHGK81Y8+AKUjKjOqX
         H6T2m+pqw514KRh8KFWEM6M68C9HjfUH3da4cjts74noBXzVEWIARiXMicE0MRnVPzSk
         aB7tKtEf7A3S6cuDNyR1vGrjB4UtHi4YtgjCqnrqt6D5YIBf11JKRnoJIYrHUAwPhgCk
         LdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/hTQ7wRjVwyL9mjDzAcMVZjoOrcDwc8c0a8ezZTmwM=;
        b=MyskjnrxMb/2lf/CUiN/4au0h1jx7lDLB2SdArdgnKXQKDjcL96do/b/fV0r2A4uxQ
         HBb+o2aOANT2IIOEhKedd1r4j4QBIfQ6nyGzKmlEMCIqK5jTlRn5HiY6Y2Cy3Svr4lom
         98afMiSUnomjm34LKcBdZzVoRYCmi/GKT6LXVuoIOWiIRrkHlYuuqdMwWh0XMuBfZI6J
         zjUyjm0JgbNykv8+fE20ui80E0p7URlg1RuT6bo+/vJ5PgNo9Uz8I+JXyBompdyQAzo5
         RJLPRu4c619SIHdL61Es6ljHXRTWBO8DS0YKdJLM8zgN/G7Adwav3mp0zXBdwxNOQXKz
         THCw==
X-Gm-Message-State: AO0yUKUVsUsYN4vm2YSFqoaAFCCsdC2nGegGwGOmBwu6DTFyyVTP9Swz
	zzFmrQNVDZfXsUr6EcTLStR6eZ16
X-Google-Smtp-Source: AK7set9Cqm+gKTVi426+ObMuTYkf6kql2cPngXlfi2BoyWilV9pOlSZR2m/azE8wTCWxdBUpL5gbxQ==
X-Received: by 2002:a05:600c:4f01:b0:3eb:39e7:3604 with SMTP id l1-20020a05600c4f0100b003eb39e73604mr2532284wmq.5.1677590957280;
        Tue, 28 Feb 2023 05:29:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t23-20020a05600c2f9700b003e2232d0960sm12424526wmn.23.2023.02.28.05.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 05:29:16 -0800 (PST)
Message-ID: <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
Date: Tue, 28 Feb 2023 14:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/36fmORLIjpldXn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UlJztEHo4mBR

On 28/2/23 13:58, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
>> On 24/2/23 19:08, Alex Bennée wrote:
>>> This series attempts to remove our dependence on the docker.py script
>>> and build things directly with the appropriate tool. I've been
>>> noodling around with how we build images on gitlab to see if they can
>>> cache better because the normal case should be we don't need to
>>> rebuild everything if the upstream distro hasn't updated its package
>>> list.
>>>
>>> Anyway what do people think?
>>
>> Removing dind limitation is interesting.
>>
>> Unrelated, can we tag registry.gitlab.com/qemu-project's
>> docker images along with releases?
> 
> Can you elaborate on this ?
> 
> We're only using the images for CI purposes and they must always reflect
> the current state of git master. We're using a fixed docker tag 'latest',
> as that avoids the container registry growing arbitrarily large.
> 
> Our CI rules should prevent the pipelines running on stable branches,
> so we shouldn't need container tags for stable.

I'm not suggesting keeping jobs to build, but doing a snapshot of the
released containers.

I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
it again. This is useful when bisecting pre-v8, but also to build pre-v8
and do performance comparison. One shouldn't have to upgrade such
container (in particular when package mirror disappear), since it
already contains all we need.

Personally I'd like to keep generic and problematic ones:
- qemu/fedora
- qemu/fedora-win64-cross
- qemu/debian-xtensa-cross
