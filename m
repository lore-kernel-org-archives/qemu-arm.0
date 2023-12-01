Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp988589ejb;
        Fri, 1 Dec 2023 05:46:00 -0800 (PST)
X-Received: by 2002:a2e:be8d:0:b0:2c9:c1e5:f1e7 with SMTP id a13-20020a2ebe8d000000b002c9c1e5f1e7mr988881ljr.20.1701438359804;
        Fri, 01 Dec 2023 05:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701438359; cv=none;
        d=google.com; s=arc-20160816;
        b=yr2tj65FifWFmVMkdTQc9JFwhS9CGCI7LXC5oA5iOXwKL77ipBpu4zkGr3JHVeKwBw
         SFkr7r9nVo/dUvA8ylWdu+5A2IAQDGmFiwPUc7hmczz264+h2CLU6eMjM+WEsD8KwsY/
         PFKbaHElmN6HJC0NTvqxayE7PAft7OvwoQ5q7qho81h14kf1nhYXcvILoGzhwwWmZAeh
         CDkNjMCOTBjhNEPgF2X8Rd+eVE6blk4nEPF3jTFgFq6SzqwhM4dWWjdzGkmONJXWr/UV
         C+atk49aGJn35UYaNAyJpibXHG2+HQLMkrlToZ24KXOUSPNvJcIxhpoX56wt+MjEsMMQ
         XzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+8FQNEvKVuFkOWSlTmUrLptwTjryOPUHWpWwITiZVdQ=;
        fh=feiTKzSpHcQIpfSkMp7f08dYU4STWKGFGE1yDbQW2B0=;
        b=GHft8I7bUtF6moTh7cVNUJi8n4ILNo2Df4uRC5yRPZk9grV4AJ1Mnlfu9FYFTYhmWx
         1n2zfMc4gJCNWcTfmyiYci/hezeZKWbb53i76JdwrXwnPgtFHzyaXG3NycpU5KwpcyJY
         m+hE64CMwQxmwAIVJuyYPceyX+Bg98bCuA9zgxKOEpKnHU3lSkMN1ufxErLGF3AD8k79
         O6nNP1d2xqC8rhBoo6COsfvAObJZy+rX/0koFtJ4Blbtj+yTs6vI/NTuqqkbG2ayp3LX
         DVreaQn7wlJhu0dIB+rYISd6tm5p5O574AxQOGx9RnDtB2OHlWq9dclfqhglmoFiLPgF
         xV3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jFLZSgAO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b25-20020a2e5159000000b002c5056e943fsor616618lje.9.2023.12.01.05.45.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 05:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jFLZSgAO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438359; x=1702043159; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+8FQNEvKVuFkOWSlTmUrLptwTjryOPUHWpWwITiZVdQ=;
        b=jFLZSgAO+SlPe2ydecTHAUX9isELsnXbn6Us3OE4UmueqqgCi9O5v7wHfcK9nMZbTe
         URwlknkgwwDt4kZYN9Ps+r2Wzd0wRsAxEK7iPhG7Lls4XhvZkmzInDC88qzCs1EYmuyc
         UwVH5yjsT3ejMEJ7bJFVV3uOZwJeKRV6+WguQHRscJa69pg6qWhejqzdUzT1Lu5bCS35
         ywBMvezbwUOS2HzVLYOi4BaZpLqy0fEDfGW7JRP5mEZOhS/a1hukC2lRBgXaPs79lcAt
         gXE85aSkNOJhlaFJAb0WCo6UFeTAeoisU0OkWdZhu6ilhmsYRd1XwKeQ3G2GTcsJpk35
         S4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438359; x=1702043159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8FQNEvKVuFkOWSlTmUrLptwTjryOPUHWpWwITiZVdQ=;
        b=b5RBMWaToO0NjkejoW5JQgWZ7E1GXWzBzqH+6x78Doy/hz5VDlF0YSAbHowwB3DNdk
         fyMtBlGeHNowNsBysVQJSaos6F8i91QQGpwD5FLBN87zYmjvLVVK6VOEeNGzhKCmQSHv
         h4TU3P7arR+3EFhY3swQ5Cv8uMckZQOmZw8iQDwMkeWzz0Pwme2mOhm9iYGq7uejErIl
         Sv7IxOIpA93PCk6hToehWuZvpBtLvCyzDF+fEZq+/PIukTBvnAF83d/YDUJsBQTZAmqt
         T3GpKl79ljovi8gm5MBcA7sij+w7kU8mpkokBu8RCOn54qj88g5TqRRYijGa/tJb8BPZ
         FwBQ==
X-Gm-Message-State: AOJu0YxX02BBDu0AGDRr/qzL3iIGQ42xBc8wjkXMc6Wc5xX4Sm0oEQiH
	T8+vrg6X0Z22rREHzofFrUCqWYk7hfF+bV3DcgnCbQ==
X-Google-Smtp-Source: AGHT+IH5rSOqoFY6tENoGmly+YEBnEf2aD72A00kIEgYHhwWRaWQsNVIzk8Ii7y7qnxqT8gXL5gjEQ==
X-Received: by 2002:a2e:3518:0:b0:2c9:954b:7249 with SMTP id z24-20020a2e3518000000b002c9954b7249mr823527ljz.4.1701438358975;
        Fri, 01 Dec 2023 05:45:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id pj20-20020a170906d79400b009fd2028e62csm1914408ejb.71.2023.12.01.05.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:45:58 -0800 (PST)
Message-ID: <cbcdea98-4fc2-4952-9f7b-b3db242ad8b6@linaro.org>
Date: Fri, 1 Dec 2023 14:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] tests/avocado: drop
 BootLinuxConsole.test_mips_malta_cpio test
Content-Language: en-US
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231201093633.2551497-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1U61eE46kKyL

On 1/12/23 10:36, Alex Bennée wrote:
> The assets are no longer archived by Debian so we can't run this on
> CI. While some people may still have the test in their cache we do
> have more recent images from tuxrun so this isn't a great loss.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 22 ----------------------
>   1 file changed, 22 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 231b4f68e5..5d978f6dd0 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -116,28 +116,6 @@ def test_x86_64_pc(self):
>           console_pattern = 'Kernel command line: %s' % kernel_command_line
>           self.wait_for_console_pattern(console_pattern)
>   
> -    def test_mips_malta(self):
> -        """
> -        :avocado: tags=arch:mips
> -        :avocado: tags=machine:malta
> -        :avocado: tags=endian:big
> -        """
> -        deb_url = ('http://snapshot.debian.org/archive/debian/'
> -                   '20130217T032700Z/pool/main/l/linux-2.6/'
> -                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')

You are dropping test_mips_malta() while the subject says
"test_mips_malta_cpio" which uses:

         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20160601T041800Z/pool/main/l/linux/'
                    'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')

Anyway, the lesson is we can't rely on Debian snapshot mirror
anymore, so more need to be cleaned:

$ git grep url.*snapshot.debian.org
tests/avocado/boot_linux_console.py:127:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/boot_linux_console.py:160:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/boot_linux_console.py:203:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/boot_linux_console.py:513:        deb_url = 
('https://snapshot.debian.org/archive/debian/'
tests/avocado/boot_linux_console.py:1129:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/boot_linux_console.py:1255:        deb_url = 
('https://snapshot.debian.org/archive/debian-ports'
tests/avocado/boot_linux_console.py:1299:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/machine_s390_ccw_virtio.py:50:        kernel_url = 
('https://snapshot.debian.org/archive/debian/'
tests/avocado/machine_s390_ccw_virtio.py:56:        initrd_url = 
('https://snapshot.debian.org/archive/debian/'
tests/avocado/replay_kernel.py:110:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/replay_kernel.py:139:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
tests/avocado/replay_kernel.py:287:        deb_url = 
('https://snapshot.debian.org/archive/debian-ports'
tests/avocado/replay_kernel.py:445:        deb_url = 
('http://snapshot.debian.org/archive/debian/'
