Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2495932dyb;
        Mon, 23 Jun 2025 04:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2zhNMQM7kHRUGVYysE7CDFpYAUChBLAJDh5m5PZeTn/DTzIGJ4zh0diVP5lp3n5LG56feokcNqSpd1Q==@linaro.org
X-Received: by 2002:a05:6000:2010:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6d2799df4mr8969475f8f.9.1750679965505;
        Mon, 23 Jun 2025 04:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679965; cv=none;
        d=google.com; s=arc-20240605;
        b=kqwjs5DpiJfpj1XdTi3+H/GiO8mpeZzOBAz2+yOSsp9ZxLec42Byw/a6qHRcq9XnPT
         UOgxL2f3+LN14cuf55zcGUnWOUrr7dYbIoFZhCo1H+LgRmBSe66uHbAs2EmC4JMLZAeO
         iAnG2H4H7TtTEiteQS/aUR+hOr2oQaHr44NyQnoN+8AgnnqdvRqv/prwOV7utyemaPua
         xXqJHytM3gPexMykuoJGie20riC5T1WCZWyGDQh6aq4jzqPrHF0rcHuer4UFgoSvdJiZ
         a1J+veGK0reLJ1pGEZzmhmxhvxfVQY0eotjl4q/rVd6S3T/y4ZR5DNL0PWrqycrWoYzp
         o9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZNl0GNUoL+pUzh6aZuBV7rBwC2JelgKVfHJY1PQe040=;
        fh=gb6JLZz7rPqfTA43exKGrQKrXi7xMv5B3u/o9JzY/fE=;
        b=Jj1yBfeNPjf/0rJUVl903VDGsurdPskeHJbwnrkl7BJK4Awtb+4hI7T+OINydIIJm2
         kJ7CIwGo6EbyOiUGZbSYLNtbpgtOdbATFKiYx5hPBGn7pKcuoCNFZwXNqW9Jpkq/FOzb
         I6pao+w69MqNWDL1oy6IfUkYRv/HP8FCfsHxbHeVFRK2tIbLgoH6ma2JEGMs2Xy8V504
         a5CHI5wX+7j4+WwqKWZsg20mdeZWAHgyowgZOuLRSDxS1E6QoPMwOU9jLqIKXlc0XHFl
         T1XDGXwJsySqccFm9PrujLCELjMl8jym77y7ZjclLYvuuzFC7ZN5h/ByojN1OSDhmyaf
         BGgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWhgyQBe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6c93c3438sor2177679f8f.0.2025.06.23.04.59.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 04:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWhgyQBe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679965; x=1751284765; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNl0GNUoL+pUzh6aZuBV7rBwC2JelgKVfHJY1PQe040=;
        b=SWhgyQBeQX4mCH3nEEsv5yJEYli8ly/0Qm4XiWPV2h4T2epbVxVBU4iPWyTItGh3Am
         tsUpRSlOYd/7vcDLwZ59FSLkqah7wnY/mN7SWAYtRjXk74Nb/nPt8r85QUCera4s17Ax
         ncxwdhD/1FZ56chnuGvtxFwfuEq49VGX1WuDAZI2D2bJ8CZlfFqz4OgVrjIOYvSFfQYu
         qtnUQpdS9D4xjhhzBurbP0jbjByMHD1eMEvwhJZUKOg/Y9klvDc5Ec2AF0HZxP3sWw98
         xyRtdxG6iRR7xrB3nRTeD2xk4BuCEgjOALV4uuOUOPxxE/IO8nDs+N7zsLYPEVEnqnDU
         N5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679965; x=1751284765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNl0GNUoL+pUzh6aZuBV7rBwC2JelgKVfHJY1PQe040=;
        b=O20dXMwaJ+b/exBumqQ5vFshSwDek7scaBDaWpG0Ft/CtOEstyMbUI/18/k9XUdRzC
         NakwTOG79+KJDzlKrNZDAp+T7P9ivadH+0z1O7YV47d+UuVEEN+/1xi5EdY1BDSuZBDY
         aNeDho4m0piikrsSQU8sowk7seMuu4NTEkqCnHNPvUIYGr3FyNCXaujlGxzv7dd5Q1Vp
         HKXhy0+3UwWDGJblq2eitoTW96gD+JzjwajUS2QF6SmKSq6YAp2Xoljuyzuy4lMz2u6P
         Nx/ObznD2ZEv14gMoxBZajzlQYeU3X01T8D+QoxuL4NftW96e5bEcB7/8RmTECW6hhPE
         z8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUhx31W3BRUeJ9YC7/wKm6C+Jm29GpYeYjVLyD55JkSlFVoxqS3A3aG/BCn6EWSbMvwVI6D48e7ushGbA==@linaro.org
X-Gm-Message-State: AOJu0YzKkppkmbum7F+iaaUPpxNPZAE4038z1MlO/ZAofMtuQD0ypmxi
	UHLux8QhU+LMtMPSzkwTNwHVKYSbu7KUl5m+YflT1Cw3N1wmG48By44m9nOJLoKAdGuVzA==
X-Gm-Gg: ASbGncvehWJDh3/nexZ0KqZEvpOdEw7r5rL1nHp/mng+J6EP4ELpw4PUgmhpf0qBnCi
	Rh37ZG4sVF4sM7sw9C6lMx5oEPROMmUJI7x73ZHAvVceXIv20Bx8VraV99SDGMOj72cvDzobhU7
	HwnBjxsKQgRWREH664pImyRCM9vtMZs+mH7fJlffkprWsPD0L3gy/9Vm2enlod/iiSwofg5P/lZ
	wOc6asDxtIclCi4jubINqOOXSBnCiF42hox1IBGOVPKPwWg8GepaS5Q50ycszE2h5aC2m2ONIRb
	UcjLtSfVaUATNSPhfb3gMm/RzUkHU5tdbiIM5BCTgahDpSa0JNl3wczr4/nNaTsutIc8pYbMv91
	NuwaWZA7CZ0FAIgfYrav8pebocY0qhWLR0Aw5uNjr
X-Google-Smtp-Source: AGHT+IHOxtkdXSM3EMBB+rtXAYT6HLDRhKe1XTMmCY2e3R+6NO7I2w8zqwom52rHbrwAtgyuUqWVsQ==
X-Received: by 2002:a05:6000:2010:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6d2799df4mr8969438f8f.9.1750679964791;
        Mon, 23 Jun 2025 04:59:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d128cf7asm9177773f8f.100.2025.06.23.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:59:24 -0700 (PDT)
Message-ID: <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Date: Mon, 23 Jun 2025 13:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen
 test to TCG
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-24-philmd@linaro.org>
 <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JsqBbX0KMF7i

On 23/6/25 10:11, Thomas Huth wrote:
> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>> On macOS this test fails:
>>
>>    qemu-system-aarch64: mach-virt: HVF does not support providing 
>> Virtualization extensions to the guest CPU
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/test_aarch64_xen.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/ 
>> test_aarch64_xen.py
>> index 339904221b0..261d796540d 100755
>> --- a/tests/functional/test_aarch64_xen.py
>> +++ b/tests/functional/test_aarch64_xen.py
>> @@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
>>           """
>>           Launch Xen with a dom0 guest kernel
>>           """
>> +        self.require_accelerator("tcg") # virtualization=on
> 
> What about kvm (or xen) as accelerator? Would that work?

IIUC this tests boots a nested Xen guest running at Aarch64 EL2,
and at this point we can only run EL2/EL3 on TCG. HVF and KVM
can not for now (we are working on it).

I don't know if Xen can accelerate EL2, it would need support for
such hardware (like the Apple Silicon M4). Cc'ing Xen folks to
figure it out.
