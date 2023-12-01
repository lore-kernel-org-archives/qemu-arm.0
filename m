Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp996883ejb;
        Fri, 1 Dec 2023 05:59:37 -0800 (PST)
X-Received: by 2002:a05:6512:3092:b0:503:36cb:5436 with SMTP id z18-20020a056512309200b0050336cb5436mr1159458lfd.9.1701439177722;
        Fri, 01 Dec 2023 05:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701439177; cv=none;
        d=google.com; s=arc-20160816;
        b=hf6DoyFxPRVjJgmlfRr/FA2E6TR9zOd6pIs4dPbdV67L/WcvV/QnxN5iBCPM48DIct
         N276F5GY7Z1sP8YxlmcqEyYvtteedm/JSi/AwIeI4U62SfEFB4HY08uDidGh1Sa9anjD
         dfbjs60IREcj4DuBuSzNjdiDBOF5iPoZwidEMfIuuUezrMam3kHeh+cKnOrl6XcIoXwS
         p6jwf8WexyBY3lpO+VWjIzPuL/o9ZqQ7/xFgg62AXJ6bA4Mxzb+TZD0CYZePhekUc+CP
         lAxcX9tcQISaJhwGMrhHwWQShozAM1grJLjC+TfVLRCYh3sJ94FoLJeT1W07egUsv7sD
         unaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZoDrotQ/U2UikiecDBIyj1zFrN2+3Zyl5wDgz7ChxoE=;
        fh=feiTKzSpHcQIpfSkMp7f08dYU4STWKGFGE1yDbQW2B0=;
        b=MrlRe7mvum+A+B1Oln7iRKTSzXSTX624tA9p9h8Di3D++8J4j0po4WvntnIPnnzSyz
         O6DsYKbh8e1gTueeLk6/Lzv3TtzHOqQzqgLEsWjNFBXeP4aACG5Xm3JHEuzEKTkiSoLr
         Yn2bFyDijgcxZtK1PzCrcmdj06+AOhSDwh4MHh7pNA8D2Oh8A7xlIu3v1NJ0YIuXdaM4
         XrV5O8tu+NnJQKl023J/GBgGwGgnoepaklwXZUiJFLXsgmqbLhu8CNUnessIo93FnYUA
         DE0e2SMWfDURhQ5WdmENtut23Bd+glqRbWCnDKss4lC9+hdbD4QAyvkGaSIlMwvbMfIr
         aMqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBOUXRoz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q25-20020a194319000000b005079a663572sor722810lfa.25.2023.12.01.05.59.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 05:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBOUXRoz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701439177; x=1702043977; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZoDrotQ/U2UikiecDBIyj1zFrN2+3Zyl5wDgz7ChxoE=;
        b=RBOUXRozN1jWEqy257ReGF6komDBgVa+mr79GJdTlRdYZwULOnGKuxH1iaU7BmKbcx
         bjMQx7kBeDLh6Un43BX7tiWeneZv1aqDHbfF1ZTu1eIPbnPCYyGMgmleWQWopJybbE0X
         G9uOZTX4xk80KJbkqnolp0J+VPbMhdQA0eEfKTdPjbKn83e/NyHgeFpo5vDAS2g6cOUV
         U3ANRuOeF9/Km8DYY8HYl6/0acIfnGu7K9czxOuAhu3CRI5udi4jeHswJKZ9x1SMmAk/
         /lkGOD0KcUSieGpw2agkGpt+j5jSrPX3vlqPDfngiUmCWAZFPgfhP5OEgbX1rXUA74r4
         690g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439177; x=1702043977;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoDrotQ/U2UikiecDBIyj1zFrN2+3Zyl5wDgz7ChxoE=;
        b=oBogmipli5lCix6QAwveHyOrUj3RKJDf7pC2oPO2d4AmEUQpgxdxka6EwEn5sD4dQk
         ma06cx2Mkfg0D4ZMnjSur9fI2XKppiVa1MmIkF/7C+7hdKGMsp28s5JG9W9mR++OAw+G
         v9jhIfWxjTqhJ8OveLoUYrrAETT7/3pMRhKJgknWMuTYxD3xPgB//clcYSgW6yrhNsc2
         Wu6WvxPkt8bZuoaCWph4VXDWS8cOUmHruyHjxG6TawuhjK5pXnG54VgFDquB6GDHfnhZ
         APwMtBWN9ryTi7FBZ5DB3KIaXHCX313G9VZZTfkXs2ge+aD/ia6gKySZ6JQvZvAxukG3
         44kA==
X-Gm-Message-State: AOJu0YwCZEJHjAABT9/sSYOK7BCezyoJ7hyIRkmggqnRZ5qRPLCGbFfd
	dXytXm4M+GHg72XHTVZCnRWxDuz3OajAbJgAFn2/2w==
X-Google-Smtp-Source: AGHT+IELHviIikteIdX912jWo9Ef6/9CSx0lzTWd+9Y+d/9hZdu/KrhuBHx14nxOG9/UZezMeNHQAQ==
X-Received: by 2002:ac2:555e:0:b0:50b:e06a:f23b with SMTP id l30-20020ac2555e000000b0050be06af23bmr32287lfk.71.1701439176959;
        Fri, 01 Dec 2023 05:59:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id fb13-20020a05600c520d00b0040b3e7569fcsm9108015wmb.11.2023.12.01.05.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:59:36 -0800 (PST)
Message-ID: <5a3a91d7-7e0f-4bea-b8e2-ccfab0bbd283@linaro.org>
Date: Fri, 1 Dec 2023 14:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] tests/avocado: drop
 BootLinuxConsole.test_mips_malta_cpio test
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
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
 Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-4-alex.bennee@linaro.org>
 <cbcdea98-4fc2-4952-9f7b-b3db242ad8b6@linaro.org>
 <1f9eb253-0346-4264-8817-11cf079e8f07@linaro.org>
In-Reply-To: <1f9eb253-0346-4264-8817-11cf079e8f07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: f7stGN9vuvkr

On 1/12/23 14:57, Philippe Mathieu-Daudé wrote:
> On 1/12/23 14:45, Philippe Mathieu-Daudé wrote:
>> On 1/12/23 10:36, Alex Bennée wrote:
>>> The assets are no longer archived by Debian so we can't run this on
>>> CI. While some people may still have the test in their cache we do
>>> have more recent images from tuxrun so this isn't a great loss.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/avocado/boot_linux_console.py | 22 ----------------------
>>>   1 file changed, 22 deletions(-)
>>>
>>> diff --git a/tests/avocado/boot_linux_console.py 
>>> b/tests/avocado/boot_linux_console.py
>>> index 231b4f68e5..5d978f6dd0 100644
>>> --- a/tests/avocado/boot_linux_console.py
>>> +++ b/tests/avocado/boot_linux_console.py
>>> @@ -116,28 +116,6 @@ def test_x86_64_pc(self):
>>>           console_pattern = 'Kernel command line: %s' % 
>>> kernel_command_line
>>>           self.wait_for_console_pattern(console_pattern)
>>> -    def test_mips_malta(self):
>>> -        """
>>> -        :avocado: tags=arch:mips
>>> -        :avocado: tags=machine:malta
>>> -        :avocado: tags=endian:big
>>> -        """
>>> -        deb_url = ('http://snapshot.debian.org/archive/debian/'
>>> -                   '20130217T032700Z/pool/main/l/linux-2.6/'
>>> -                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
> 
> This link still works for me, what am I missing?
> 
> $ wget 
> http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> --2023-12-01 14:55:31-- 
> http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> Resolving snapshot.debian.org (snapshot.debian.org)... 185.17.185.185, 
> 193.62.202.27
> Connecting to snapshot.debian.org 
> (snapshot.debian.org)|185.17.185.185|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 30231730 (29M)
> Saving to: ‘linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb’
> 
>     linux-image-2.6.32-5-4kc-ma  12%[=>    ]   3,71M  1,23MB/s    eta 20s

Sharing HTTP headers:

$ curl -v 
http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
*   Trying 193.62.202.27:80...
* Connected to snapshot.debian.org (193.62.202.27) port 80 (#0)
 > GET 
/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb 
HTTP/1.1
 > Host: snapshot.debian.org
 > User-Agent: curl/8.1.2
 > Accept: */*
 >
< HTTP/1.1 200 OK
< Date: Fri, 01 Dec 2023 13:54:55 GMT
< Server: Apache
< X-Content-Type-Options: nosniff
< X-Frame-Options: sameorigin
< Referrer-Policy: no-referrer
< X-Xss-Protection: 1
< Permissions-Policy: interest-cohort=()
< Last-Modified: Sun, 17 Feb 2013 03:34:37 GMT
< ETag: "1cd4cb2-4d5e349b3403e"
< Accept-Ranges: bytes
< Content-Length: 30231730
< X-Clacks-Overhead: GNU Terry Pratchett
< Cache-Control: max-age=31536000, public
< X-Varnish: 383440315
< Age: 0
< Via: 1.1 varnish (Varnish/6.5)
< connection: close

>> Anyway, the lesson is we can't rely on Debian snapshot mirror
>> anymore, so more need to be cleaned:
>>
>> $ git grep url.*snapshot.debian.org
>> tests/avocado/boot_linux_console.py:127:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/boot_linux_console.py:160:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/boot_linux_console.py:203:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/boot_linux_console.py:513:        deb_url = 
>> ('https://snapshot.debian.org/archive/debian/'
>> tests/avocado/boot_linux_console.py:1129:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/boot_linux_console.py:1255:        deb_url = 
>> ('https://snapshot.debian.org/archive/debian-ports'
>> tests/avocado/boot_linux_console.py:1299:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/machine_s390_ccw_virtio.py:50:        kernel_url = 
>> ('https://snapshot.debian.org/archive/debian/'
>> tests/avocado/machine_s390_ccw_virtio.py:56:        initrd_url = 
>> ('https://snapshot.debian.org/archive/debian/'
>> tests/avocado/replay_kernel.py:110:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/replay_kernel.py:139:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
>> tests/avocado/replay_kernel.py:287:        deb_url = 
>> ('https://snapshot.debian.org/archive/debian-ports'
>> tests/avocado/replay_kernel.py:445:        deb_url = 
>> ('http://snapshot.debian.org/archive/debian/'
> 
