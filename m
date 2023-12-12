Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp744347ejo;
        Tue, 12 Dec 2023 00:13:31 -0800 (PST)
X-Received: by 2002:a17:902:e748:b0:1d0:6ffd:6e8a with SMTP id p8-20020a170902e74800b001d06ffd6e8amr3273848plf.130.1702368811570;
        Tue, 12 Dec 2023 00:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702368811; cv=none;
        d=google.com; s=arc-20160816;
        b=jhYlmqWpIyb+zaxwWVS5mlaRZAzb3e2UnZcmvZE9PadGcA/ql12G1Ip9RC39pvSz9t
         quEgCQJXUgWL+zoXH6rg89zaXQZu/K7JYNu0mb/gY3k2oYTwNI0GfqXKzYcQAip4d77k
         tDcAJYp+dS3lTY6erblT5guJVyISa+GnEt5XoJKnSxgOzAeVnxoNFVs0VBwmt9czCg4U
         YZMiEAnIDqzHV81hXl5IaGxJN8qdfYhI6vigPjR/NsawqEi0iSEOZRRQ70bWRhbeJVqN
         Kem3iNHcpYXmy1uYhPloF3JC3fAQ98gtn+rmYBgbvs/Z87PfeB+SlJfAoqLYT+wTUQ9c
         zDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aWeXIAcPVQudRWVNMCBKAFyfnETiLoRy/MoLakk4Nn4=;
        fh=G32V+mZ9Y4lIJvzfHCJ/ixWGpeVEhXHrcmDpqhTgrpA=;
        b=ExGnPiZwOrW4wUMvp8ZN9rRCG9rQw3TD8s8FUAdyjs/aVpVcrKIThW+/oPRWM6Gg06
         jJUP6FaStyXn6U9+gqNg02Y1a8t/N3FlEj4pvARD6+khdOAGPhhuPFdUpffhbp+tdqRt
         hbJYV0Ob1qiV3U/eMZK1DIwbLy0Be136Em/6yQegn+FdOW1KtJFZwBuMSlzL/rKYEYJo
         Rbyrmt/6M6Xb7uozT3ugKXpiYWBNXDFj/8uaU3YKbcqDL/+mkz/agFsjAELzK1bc14gy
         uQ6uYPwqKD2Ce5sl2NcSuaaqE0KoWrk3V6XTcx1LF/n5FBpSotFVmzM6carU9Q9AUCiQ
         oHPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UVkH+WH2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ba1-20020a170902720100b001d08f820567sor2692395plb.5.2023.12.12.00.13.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 00:13:31 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UVkH+WH2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702368811; x=1702973611; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWeXIAcPVQudRWVNMCBKAFyfnETiLoRy/MoLakk4Nn4=;
        b=UVkH+WH2zhv6rPRuuWpIM5l7Pbo1Lo/peVQguOt/mxUo6ai6tBDbsGuODfv+uDtWlY
         UM5PtE9FQGtPDi7H7VLMvzNUGU48YB6NG6xDqDbBpa/n/SsHoNBlvUmNe9pbxkqVkLQN
         50p95I3dmsaBMiyaZDDkVqqloYNRQD4VbF+6GGQKQyosiMfGFzuRxffYZDrPDuJUmj4g
         a9NfhhIds99T7tCGrKdbCiY4JTrjAhZ3Ds8QQ77WevuHO0fNZy0T/YoLFupPdqkoG0Zc
         qB7VNTM3b5Wq3SqfXhrGeBm45miDDHtwRV68GpgsviIO9Xsqn2EBrAutBdsXqrNUWJJK
         gIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368811; x=1702973611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWeXIAcPVQudRWVNMCBKAFyfnETiLoRy/MoLakk4Nn4=;
        b=XY5+Ggy84Goxt9QlbzDM1ZSxjoSaev8rEJzmyjmFJxMdk+zyej/u8Nk222n5+Bs6tP
         wWRe37V+vdWbySmvDKTcqV60S84RJzsXR31l02ZEYbxouZiBQ/F4tnQp5vPFP0mq3Ixu
         6dtLovI+jzEw3EbQ+RMq3qvoDKc1FrGRCNSc466DuX/Bl0HU1SyZSfnsv2ccbsx29NaY
         7zva07WlKUHYWvhoCx0eKRayPp3Abe2eYgBPPzYCQmbYawMeed9Tq0idsbfqGVYsvAS9
         eBxiDsLOXC76UjIvyIT2OcYSiiD4aQz2zKC5rFChr9bAcQa9m+1m6Ao9xSUhsVXs6IOw
         Dxug==
X-Gm-Message-State: AOJu0Yz/iJ/auAVT7Ro3bLAlSiH1h3hNbgxPauI4HyaIrnlqmohjjd8M
	KxzA2ACID1ZhImDJt7T4oBJuAQ==
X-Google-Smtp-Source: AGHT+IFvUmziIWBs1OJTpYO7C68nwt4JBi4XL8fGer5kyd+qMcd75C6AEDDD+1T+2txWVzO/tVeY5A==
X-Received: by 2002:a17:902:650e:b0:1d3:34cb:231a with SMTP id b14-20020a170902650e00b001d334cb231amr377063plk.70.1702368811100;
        Tue, 12 Dec 2023 00:13:31 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.205.15] ([157.82.205.15])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001cfcf3dd317sm7999185plc.61.2023.12.12.00.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:13:30 -0800 (PST)
Message-ID: <85f0bd13-9fe3-420d-939f-695955427f5a@daynix.com>
Date: Tue, 12 Dec 2023 17:13:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] testa/avocado: test_arm_emcraft_sf2: handle RW
 requirements for asset
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-8-crosa@redhat.com>
 <5377419a-88dd-4e5c-8be4-1345f6c2115b@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <5377419a-88dd-4e5c-8be4-1345f6c2115b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9WNl+FuiDTft

On 2023/12/12 1:36, Philippe Mathieu-Daudé wrote:
> On 8/12/23 20:09, Cleber Rosa wrote:
>> The asset used in the mentioned test gets truncated before it's used
>> in the test.  This means that the file gets modified, and thus the
>> asset's expected hash doesn't match anymore.  This causes cache misses
>> and re-downloads every time the test is re-run.
>>
>> Let's make a copy of the asset so that the one in the cache is
>> preserved and the cache sees a hit on re-runs.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/avocado/boot_linux_console.py | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py 
>> b/tests/avocado/boot_linux_console.py
>> index f5c5d647a4..e2e928e703 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -414,14 +414,16 @@ def test_arm_emcraft_sf2(self):
>>                      'fe371d32e50ca682391e1e70ab98c2942aeffb01/spi.bin')
>>           spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
>>           spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
>> +        spi_path_rw = os.path.join(self.workdir, 
>> os.path.basename(spi_path))
>> +        shutil.copy(spi_path, spi_path_rw)
> 
> This is an implementation detail. By default fetch_asset() should return
> a path to a read-only artifact. We should extend it to optionally return
> a writable file path, with the possibility to provide a dir/path.

Apparently it is not OK to abstract fetch_asset() away; it confuses some 
static analysis according to:
"[PATCH 02/10] tests/avocado: mips: add hint for fetchasset plugin"

That said, it is still nice to have a method that does os.path.join() 
and shutil.copy().
