Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp995418ejb;
        Fri, 1 Dec 2023 05:57:15 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:b0:40b:5e22:968 with SMTP id c12-20020a05600c0a4c00b0040b5e220968mr538337wmq.87.1701439035644;
        Fri, 01 Dec 2023 05:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701439035; cv=none;
        d=google.com; s=arc-20160816;
        b=VBUq3T5PwwRx1OSJBqAGtuYxTHtQw3Iono+lekVkpB9WmlS/qVEfIL9PDyMqdA6Tmj
         TENaqzSb5gl6bpTlRyHBA7U57LVKaVGaZr8dXtbW2Sa3670Cevrfb914eqCcdNb7E3UF
         QH7k1h5tyUBhMnAgcm53g3ta/++Z6HpvJkjIcZYHDB2Fi0Xs9isJ0L9m06hnVaDWMBTp
         53j/qvFTD087QFHchkE8sSiq5K9Cq5LBQUEhyiG8Gmc9BWx1gVNz2L5xbItBuAJsE5WH
         tpSp6wJ+iASmbgnK365dnFiT5fY/4HFcVnGvvMdfMAKq1Z++OovNpWrcdQCqiQqEmSc3
         4rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f/QxMVm4o2j4dhopPC991uYCLQP5eLcNQ/X7+p7GFFc=;
        fh=feiTKzSpHcQIpfSkMp7f08dYU4STWKGFGE1yDbQW2B0=;
        b=fide4k7wg6YmQzwtOo9QQQZclzohLyNQJujdqHE2hf0SjATCeHtTNt3gHtdBbQ+1Wg
         YuM197ZHcCpafzLY0t5h+lZLkZKnmONgfsBMYmSX0SCYmO4P3uv0RVUxcDXjihrw4Hla
         rYY5EBkrWXeJIF/5paXgOh/LDMghId+7T9cOQlcIIRYBBisys1au9x2VHcHyjEM/8OPK
         Oy0wVFUeMxnCGip/eR+OBF0vE82xDzoY15gd+xsGtoUU5Hf6E89DZhpRr0YhMGuryCU4
         OW4CdpO0qOpXD0McHc5FVJZw7DEzS9ltZPOV+1UW+HKvCtMXug9DlQBtLCJfENLuj549
         L/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScdKYrAo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020adffe91000000b00333329edf5asor298559wrr.5.2023.12.01.05.57.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 05:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScdKYrAo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701439035; x=1702043835; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/QxMVm4o2j4dhopPC991uYCLQP5eLcNQ/X7+p7GFFc=;
        b=ScdKYrAo37uhtozwqnjKufGbpp5gLLwnLA16VycDZhZmsZYWYRm3kdao6ty6hP+vuH
         EqOxRhEHuNz8KXrZ3PExuBQzo/bswQsUlkdDaFXny6K2UcHJmheoclS8HiFAmqKASmw8
         KoOwMLWHoWzOc9GoaVEEur0ubZKW059bwAX+We+2Zyyzbt1QWiTw1iU0nqHgZ7fdG8PS
         /zwmNSs09jEh6wLV6m5PdppB7ZK9/1zfoAQZ9m9HoOyaMfVXHE7ofkW7sSxmTW9zSpkd
         OCT9M2OUMduMDnhMq8NVfvD+RQEocQjin+5kE6usXYYqtxnAwwLcEmsQAu4nAtmRcnuF
         pC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439035; x=1702043835;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/QxMVm4o2j4dhopPC991uYCLQP5eLcNQ/X7+p7GFFc=;
        b=BHJtZbGmS8ygKVYCEp6eMOEeioR9CT9trc0z94PtmHIheZxyFUSKZqUPggCSa723ty
         egUe2EX7cUy6MCLg5j58NxTK/Fe6O5KyYMD21+EQdDfhg6a1SZc+/GM7FKivhmrvB1X1
         emAhfKDc4wsc97+e+vI71RaSqrBEDEezz5fEIaP51uQ2B7PTwoYvcm8/f3thNCwbDK+I
         YmIfKbm9QfeKYcDDkPgL73zrRSK/Vy5Oq/wQFtA8tp/vlNXApJaxtpLyxoQ/VQOF0V64
         fE3bNfXXpUX1eL3zgM58yxaO8AJ6hi6AIOG36oZ7ggY5xsdHrxIoNtsQAz5t6x5b7bAt
         GnYA==
X-Gm-Message-State: AOJu0YzB+o985An8fyQ4K1Bk4wJRKiux1xgG4QZ5fhyAW2BpJ9sm/xaw
	zkaiTuMLykQV/J49CY32kYK65dMnHcEivQ6eSLDuHQ==
X-Google-Smtp-Source: AGHT+IGD1dyNQhiZfV7lljq6rUo2qiOcN7epZR98A+8eq09mKg3ikwN2peolwz71pd0BkSmfTitwdg==
X-Received: by 2002:a05:6000:10ce:b0:32d:14c5:643d with SMTP id b14-20020a05600010ce00b0032d14c5643dmr844357wrx.5.1701439034129;
        Fri, 01 Dec 2023 05:57:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id j7-20020adff007000000b00332f02123d2sm4218403wro.54.2023.12.01.05.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:57:13 -0800 (PST)
Message-ID: <1f9eb253-0346-4264-8817-11cf079e8f07@linaro.org>
Date: Fri, 1 Dec 2023 14:57:11 +0100
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
In-Reply-To: <cbcdea98-4fc2-4952-9f7b-b3db242ad8b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4Pu6y2kt3j/n

On 1/12/23 14:45, Philippe Mathieu-Daudé wrote:
> On 1/12/23 10:36, Alex Bennée wrote:
>> The assets are no longer archived by Debian so we can't run this on
>> CI. While some people may still have the test in their cache we do
>> have more recent images from tuxrun so this isn't a great loss.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/avocado/boot_linux_console.py | 22 ----------------------
>>   1 file changed, 22 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py 
>> b/tests/avocado/boot_linux_console.py
>> index 231b4f68e5..5d978f6dd0 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -116,28 +116,6 @@ def test_x86_64_pc(self):
>>           console_pattern = 'Kernel command line: %s' % 
>> kernel_command_line
>>           self.wait_for_console_pattern(console_pattern)
>> -    def test_mips_malta(self):
>> -        """
>> -        :avocado: tags=arch:mips
>> -        :avocado: tags=machine:malta
>> -        :avocado: tags=endian:big
>> -        """
>> -        deb_url = ('http://snapshot.debian.org/archive/debian/'
>> -                   '20130217T032700Z/pool/main/l/linux-2.6/'
>> -                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')

This link still works for me, what am I missing?

$ wget 
http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
--2023-12-01 14:55:31-- 
http://snapshot.debian.org/archive/debian/20130217T032700Z/pool/main/l/linux-2.6/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
Resolving snapshot.debian.org (snapshot.debian.org)... 185.17.185.185, 
193.62.202.27
Connecting to snapshot.debian.org 
(snapshot.debian.org)|185.17.185.185|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 30231730 (29M)
Saving to: ‘linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb’

    linux-image-2.6.32-5-4kc-ma  12%[=>    ]   3,71M  1,23MB/s    eta 20s

> 
> You are dropping test_mips_malta() while the subject says
> "test_mips_malta_cpio" which uses:
> 
>          deb_url = ('http://snapshot.debian.org/archive/debian/'
>                     '20160601T041800Z/pool/main/l/linux/'
>                     'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
> 
> Anyway, the lesson is we can't rely on Debian snapshot mirror
> anymore, so more need to be cleaned:
> 
> $ git grep url.*snapshot.debian.org
> tests/avocado/boot_linux_console.py:127:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/boot_linux_console.py:160:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/boot_linux_console.py:203:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/boot_linux_console.py:513:        deb_url = 
> ('https://snapshot.debian.org/archive/debian/'
> tests/avocado/boot_linux_console.py:1129:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/boot_linux_console.py:1255:        deb_url = 
> ('https://snapshot.debian.org/archive/debian-ports'
> tests/avocado/boot_linux_console.py:1299:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/machine_s390_ccw_virtio.py:50:        kernel_url = 
> ('https://snapshot.debian.org/archive/debian/'
> tests/avocado/machine_s390_ccw_virtio.py:56:        initrd_url = 
> ('https://snapshot.debian.org/archive/debian/'
> tests/avocado/replay_kernel.py:110:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/replay_kernel.py:139:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
> tests/avocado/replay_kernel.py:287:        deb_url = 
> ('https://snapshot.debian.org/archive/debian-ports'
> tests/avocado/replay_kernel.py:445:        deb_url = 
> ('http://snapshot.debian.org/archive/debian/'
