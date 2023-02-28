Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5818579ejc;
        Tue, 28 Feb 2023 06:33:54 -0800 (PST)
X-Received: by 2002:adf:d08c:0:b0:2c7:1210:feaa with SMTP id y12-20020adfd08c000000b002c71210feaamr2105088wrh.26.1677594834288;
        Tue, 28 Feb 2023 06:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677594834; cv=none;
        d=google.com; s=arc-20160816;
        b=SPs6bwAICndS2K5yq41ZTKBMZULM1VRrB263bC2GXpIsQ4xbtwcukrZ8VddfbwyAZm
         9opdy6ftmBvyNk9nRz3EyLKqfxvZs9XuHtcQ9z6EciQmC8qY0gPfTa4S7MpCT0hedZIm
         zLEWih2bBNGmNuzvj9etCeDAM3+jdcTCdqq/J8JePPZL+VJp9C+Av1ayvBW2wmQJbj/2
         vchtAme8voOy8+pqZ9f5X5tZKiXeNPu9nfQH4EjkwfFhZoC8jbynRFpv4XNa4ktsQZcm
         0vZ+tkVCbTge9UhnuKcNiUA9GM2ic2o4vPtIcgqDm30ED+2Ug8wYU2nPwcF+iYyupgrg
         kUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gsTTVd8ms2cWlOoEtqbNNXxVnVJUKiJh8ITbyk1+Ivc=;
        b=i9KhgErjqdP/WPC1miLFinrG/OFcX5WmHrsmBA1IPPJIGKDdBf9kGfzNh3lLC7+csu
         L7+1NSJZV8XkTh0Rgc9BlAnCN00/1sKl+xS0nkiET49mxn7NwQJAfAEGV0YwCSqJkQFl
         delcd/HureSeD/ycNmS0sfYVco4KHmonj3Jc9I+J+O+WeIQuRAULeVWnW47vUDcTjEOh
         7JBnxls3VTTwSJSdnuX3QYwxKl+JDwE+jlMOM5wecQiilJqONjydDOY/ZkP3L/ouA2ZY
         ZpBaOpXELZuDxd0Npf1NjsCkpMvWIuWQSkQYFzt435Qh55OHqyPQrLgwe5l6wbrMXst8
         YMGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8fJOUn+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a1c750a000000b003eb3ed86a80sor1996387wmc.45.2023.02.28.06.33.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 06:33:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8fJOUn+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsTTVd8ms2cWlOoEtqbNNXxVnVJUKiJh8ITbyk1+Ivc=;
        b=v8fJOUn+TqjAQKsvxDPdoX8A7jlIMbb5HgxMJow87asaQpUqHq7cKOqFAelCO8oGoa
         SoHcjL6RMFkIIiBeVrSLFwTSnax0vJCrD6hmRqc0XZ3TZZP/d5+RrYYRAaqcROYZk075
         HpnAS89w3kywJ42H2Xmn6/+P3MbhaEpQMc87cuTMNOX7z+f2vyL8QhDeII1tpKWSBh3h
         rBfF5RcZfqp7sHGYndaa3mZMsmye4PgROtS+g9itg9vSjzZqCKl1qZlTnfrGkK5Mi6bW
         yfHAbLV8dblkj/0LycC7OzNqNNMgoM0JZfgBsM+O665UjKfR6mQgPTIAasWeBTNiTQWF
         hDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gsTTVd8ms2cWlOoEtqbNNXxVnVJUKiJh8ITbyk1+Ivc=;
        b=UFXgV4SS8+IYa1PJCA6TVO2Z7EH3hlFmy+m4gbt3e7XqaDH0Q+DAxXYKpz1gW9LR+D
         o+ce6FHrqH+3bTibbhr9Btbk9L3h5VEbKJxdl5rf8zJXzoDEO8KH0y8qxT1KzJxT7eK9
         aHQsYoFTew6BQvlP6yV39ZW65cKNkD7un/7zMbL/wGZt8+PtfKqoXw6YjHaNd7mlAZsP
         UAgp44o2MPgfGl1blIrOz0ChOQ3cFCZEnxuCCJse+jkhNXSHRWtEZDySjHQ6XAt11woM
         VusntM2HmdORDcQs07YcczBJt3aw8eT4zbGhFu7s/eWRSCg5KX4jQdKBOGxCAJMXhxs5
         kj2g==
X-Gm-Message-State: AO0yUKXArRfDak+IO1Wo2P1x0P4TvzImacPReReK9x2c1OulMV4aol5I
	BalMOaxRPtPhI2395VBvhx+7yscG1NKx+j7zjTI=
X-Google-Smtp-Source: AK7set8WHAYZ2V4LZowaKMbZLo5DBUh17llCp/Zk8rAc5/StHXKqLk/DUlY/kOXjtZ7zJCMqEJnepQ==
X-Received: by 2002:a05:600c:4586:b0:3eb:376e:2ba5 with SMTP id r6-20020a05600c458600b003eb376e2ba5mr2314569wmo.3.1677594831455;
        Tue, 28 Feb 2023 06:33:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l21-20020a1c7915000000b003e21ba8684dsm12305343wme.26.2023.02.28.06.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 06:33:50 -0800 (PST)
Message-ID: <134c78e8-8daf-0f8d-5a87-5c5ac4d73fce@linaro.org>
Date: Tue, 28 Feb 2023 15:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
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
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
 <Y/4C74k7QTuIwz7v@redhat.com> <87cz5tgaaj.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87cz5tgaaj.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Almx+lGbAGkF

On 28/2/23 14:57, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 28/2/23 13:58, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 24/2/23 19:08, Alex Bennée wrote:
>>>>>> This series attempts to remove our dependence on the docker.py script
>>>>>> and build things directly with the appropriate tool. I've been
>>>>>> noodling around with how we build images on gitlab to see if they can
>>>>>> cache better because the normal case should be we don't need to
>>>>>> rebuild everything if the upstream distro hasn't updated its package
>>>>>> list.
>>>>>>
>>>>>> Anyway what do people think?
>>>>>
>>>>> Removing dind limitation is interesting.
>>>>>
>>>>> Unrelated, can we tag registry.gitlab.com/qemu-project's
>>>>> docker images along with releases?
>>>>
>>>> Can you elaborate on this ?
>>>>
>>>> We're only using the images for CI purposes and they must always reflect
>>>> the current state of git master. We're using a fixed docker tag 'latest',
>>>> as that avoids the container registry growing arbitrarily large.
>>>>
>>>> Our CI rules should prevent the pipelines running on stable branches,
>>>> so we shouldn't need container tags for stable.
>>>
>>> I'm not suggesting keeping jobs to build, but doing a snapshot of the
>>> released containers.
>>>
>>> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
>>> it again. This is useful when bisecting pre-v8, but also to build pre-v8
>>> and do performance comparison. One shouldn't have to upgrade such
>>> container (in particular when package mirror disappear), since it
>>> already contains all we need.
>>
>> The main risk with this is the impact on our storage quota. With the
>> OSS Program membership IIUC we get Ultimate level features which
>> is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
>> container registry.
>>
>> Currently they have no way to enforce that since their accounting of
>> usage is not accurate enough. They're working on fixing that so at
>> somepoint we'll be subject to the 250 GB limit.
>>
>> What I don't know is how much storage we're currently using across
>> the /qemu-project namespace, and what extra is implied by taking
>> a snapshot of our container registry 3 times a year. I'm expecting
>> it to probably be in the high 10's of GB though for the container
>> registry.

Maybe we can keep (a subset of) the stable release container images
and store them on a registry outside of gitlab. That would be nice,
but if I'm the only one interested and nobody felt this was useful
before, no need to spend more energy on this topic.

> Currently we are using:
> 
> 86.6 Gb of artefacts

^ transient

> 28.5 Gb of containers

^ constant

> 220 Mb of file uploads
> 24.8Mb of git repo
> 
> We could probably cut down a lot of usage of artefacts by either not
> building full fat ones with debug symbols and passing between layers or
> tweaking the build system to prevent re-building of object files if the
> final binary is present in the file system.
> 
