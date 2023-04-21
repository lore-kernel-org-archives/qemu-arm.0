Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1047563ejm;
        Fri, 21 Apr 2023 03:27:14 -0700 (PDT)
X-Received: by 2002:a7b:c442:0:b0:3f0:3368:5f7f with SMTP id l2-20020a7bc442000000b003f033685f7fmr1437169wmi.31.1682072833994;
        Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682072833; cv=none;
        d=google.com; s=arc-20160816;
        b=LWShOvEM6l4ZpIulCQOA7DXsFdUWy1JSdVy1Wq05eJHYqMfwTLHmdSpBaSg03J+tsA
         h5OAClogM4A6zYz8NuBvsE20nFwg7dbIm7O5ryEPiBpDRe8ZS3Uscp/ZlE2EEAzPN+Xl
         LYexyY4ScgfRy7sKeM3+H4ftybhSq628T/TgfiTw6t0yfTNDJsarOLx0Mtrfm+kcvX82
         KYqnb0m51TaCDoumI4K1YPNZsmcDmwAsNvhHXaqwwSPW3qeZ82ElLhPDgh3HNbkNPtnT
         tNSD/+O08LN+7jxd7cwe5UYJycbho8W1xOVkZL8adWeZaHEZTZ+nN11cKy4t7ivLKwLA
         z/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UxnQBgNCCYRpnenL/0UOFpdbFbKWLhKfc2XyN0EBS9c=;
        b=BDaOz23p4RXBL71WUzexmdpblXnk9miahZtGLzrS7wJO2tkSuL08rBgAHpR1EccgRy
         QnYcFqMog5RmB5AJUtLWOdwhTj3m9hYMO3nK31DYXLNHF56etF9DNopDR6JLID6P1okX
         zCRlz0WSuSOnZipmFU2Ueoc4TXKWHC13whtr6sypuomXX7Zv5pbdSE4cfhFm2Ma2HPeZ
         udBtRHtWhw4JM6dR05nieluyJGMdXnkNm8JA/ZMBvVnu6YfLlSp0P4UZ/ote3Ll2iEXi
         PeSmI0i707tP70SdS4IWZN5N819D3dIPzcl9fNiQGRg2teYF4HT5vq2L9sUu/m1DhfUR
         +3oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XSZWaEOs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2-20020a05600c020200b003f18308d3a1sor1209618wmi.36.2023.04.21.03.27.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XSZWaEOs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682072833; x=1684664833;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxnQBgNCCYRpnenL/0UOFpdbFbKWLhKfc2XyN0EBS9c=;
        b=XSZWaEOsLOSoR1KLZhRN2t6QRgZKZm5pNBjY6Pd7VCc4rk7WXF8wNScN8Fj1tWhFE6
         mKUjtDtSb7vPBAPcL+J720bf9TuvuYD8HUamjZg9jHD4bIKYRGqrhQZWA+pU4CSHfWuk
         jvF1KjO/1Mlm6/CytQO3bMHl7X9LWCj1q2oU8AArBrHpBFwLnREidWYev5d+v86G/nkx
         5ZGHfzSOmZN8A0eTnJXJsrNVXzk0zDIDYvePmbjOpo/9YQIF0hTQyGcfFDR3aVDz+2LY
         bl0B6Qj/0FYrYRwPsstEnld6fYFet1zdIpJ4j2c7oZHF34sUZWD9BjQBw26tgE8PA6uG
         xSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682072833; x=1684664833;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxnQBgNCCYRpnenL/0UOFpdbFbKWLhKfc2XyN0EBS9c=;
        b=fIheBkIr7ZqiHJeY69mIhTkyfoiWuRNMQLA4r+h7k/VytrjUrtc/y0wKhuR+s1mPCm
         LNE4Uo9q/168kPTmrVtVXm/ytSefIJFgvJAke7T7pDeiKq3NYatRDdIB9xUAoihvjjgA
         Pkd6W0EjO7JiI+8tNG2RgVbr5NfDlHVK6SpCqlt+4L2/XtE6mGlZ1pOg+soWQqwuXc2i
         bmYYxZA6hEkfr1h+iTySuGVwrPYD5HxercjWj7GmkHarIJ8ME8XaoxHcZfXWBjm9E5Bu
         x//pTzYG0oZ/vhF1/qd21ydzd+OgmcKAGSoa6v4hj4ZZh91ApEATqzJlAkSDnLrG31oQ
         d+wQ==
X-Gm-Message-State: AAQBX9eiVyWDUkvaV81pMOh/QmZkuyCkuS3aSbUbRNViWlskHSivUbK6
	KO9Fn81dsa3WocadDGpMkTaYUDXK
X-Google-Smtp-Source: AKy350ZYi6yBL04z/ftE8mDwQbQPTMUCSAkTux3Ys5YyfzrURSYbw8hJLpOf9yvg/mI7k7lcxhCfWA==
X-Received: by 2002:a05:600c:228a:b0:3f0:46d4:b391 with SMTP id 10-20020a05600c228a00b003f046d4b391mr1333185wmf.6.1682072833603;
        Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id b5-20020a056000054500b002e5ff05765esm4097740wrf.73.2023.04.21.03.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
Message-ID: <03d111a2-183b-1226-6097-58966325a47b@linaro.org>
Date: Fri, 21 Apr 2023 12:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
 <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
 <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
In-Reply-To: <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T08L2wFRMrHC

On 21/4/23 12:07, Philippe Mathieu-Daudé wrote:
> On 21/4/23 06:09, Cleber Rosa wrote:

> Manually using "avocado run --test-runner=nrunner" helps running the
> tests but the console output is never displayed (see [*]) and once
> finished Avocado lets various QEMU processes running in detached
> mode, wasting resources.=

Using this patch:

$ ./tests/venv/bin/avocado --show=console -V run -t arch:aarch64 
tests/avocado/boot_*
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_xlnx_versal_virt: 
ERROR

Not asking for the console output at least show the test being
processed (similar to old runner):

$ ./tests/venv/bin/avocado run -t machine:raspi3b tests/avocado/boot_*
Fetching asset from 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
JOB ID     : 1c963c12f7f07e109ef8480ddf204f02e61f8b8d
JOB LOG    : 
/Users/philmd/avocado/job-results/job-2023-04-21T12.24-1c963c1/job.log
  (1/1) 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
STARTED
  (1/1) 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR: ConnectError: Failed to establish session: EOFError\n	Exit code: 
1\n	Command: ./qemu-system-aarch64 -display none -vga none -chardev 
socket,id=mon,fd=11 -mon chardev=mon,mode=control -machine raspi3b 
-serial null -chardev socket,id=console,path=/var/folders... (0.31 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 2.20 s

Test summary:
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR
