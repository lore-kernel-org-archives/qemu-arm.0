Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2493411dyb;
        Mon, 23 Jun 2025 04:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzqBikAz7Kp14fsI1WRwlZ5oIx5MBD487hJIYqNXWTE8KO7lO3kkuL4tdTPQcPPXD5Cn/YgDS6DhKfOg==@linaro.org
X-Received: by 2002:a05:600c:a07:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-4536539bbb4mr106711495e9.8.1750679619543;
        Mon, 23 Jun 2025 04:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679619; cv=none;
        d=google.com; s=arc-20240605;
        b=O551ikAm7vKVVKEsh4TU7Z7O7FfgRtPEX4pYECjeQ/Yull5cj9sqOcTZS5SFJTlrZx
         RHLU9iZAiPBLNNZzmJn/JeHoCVMcrzA6khXrbpZhyjRnJ95WQ855ydtN0raaJDphEMEY
         fyl33UpoVab2CCXMMlv/iBCYotxjVegaMVgonStyMUdyU/fjMMvt6Ghb+iS1g3toazV/
         2vh3DvTAGWe4UQi7/NjmHO+TvNhri97eAEC9FIy9D2pEg7HHRPHHjLmm37NSk2//XapL
         Ue4Aii5DApyy5JhqVEf8Dn2jXFH/avqoys0fo8+b+mIwpm9B6di8kxg/F82Q4gxu91Cv
         PTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4UkoQNG73kAls5FXW8j8XArdkpFVe7XI2g2lDPVsTBA=;
        fh=+3kc7JP+Je6USQVZiKRwRnn/Pj3qXRZdtvhIbfaOs9g=;
        b=d7z4XZ+libT31R2RBOxcrdgRrT9IUz+QfQjD3aRtD47OJZIuqIh4mO+2sO5wl/WJj4
         Uu5QFxBNqABsn9DG33hsACJhWIFO6fM93hA8n1G/dgH3a1ii/9CiWdjEmDQn67AhjZW3
         41pJIEmTiMJaROdu/2Winl1OW3d3TjAxG8v8zlPtf7ImEiOzjKynNAsD26AkehDaZCkp
         DcqvirywO5/kUAbinsZHWowLk53VEACS37ttXsrWv4liViYn2+a1o4nSCLckKvHpfAeI
         VLIqldnQ4+ZRyvKXowZbJp1FKOZNPz3alOdRk747TBIAylU5wDEY1rkUED7SuZ2DX6vP
         Nd7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTRFRFIS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646699b9sor25530615e9.0.2025.06.23.04.53.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 04:53:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTRFRFIS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679619; x=1751284419; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UkoQNG73kAls5FXW8j8XArdkpFVe7XI2g2lDPVsTBA=;
        b=OTRFRFISwh8yqL8xNvvlxrJl7/mzyOLz8sgrfTdaGj/EV2whldSf8I492zRW/jLAhO
         /gis2Z84yuOMgoe/F68kaatdlJEGiEaTLget/tzu8KbA33mqCzRl9nmjHwC+6ToSHlbG
         2mZeXTnMhoaf4gigeghMk0qGqUd0Wzto7vMNUKXISTqXertZs8yKENw+qKaJrdm3tngv
         l2puuiAExtwcg4zylokh83mC1Y44JL1EiqpDPBRA4AcWdSYuujvHAlzhaC9Dxmg9Wvm2
         KIFVpp7Ueg1e2wUdRCVmYpMejTe0xXd6/SckKKLV1Yu/6rAeXOF5vOeeYBncRsEX5mDC
         AIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679619; x=1751284419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UkoQNG73kAls5FXW8j8XArdkpFVe7XI2g2lDPVsTBA=;
        b=KmfL0cz0TGDuO2PUEOczl1dbLh6QpuFmteLl8FWhMup33fRTo1t1iF+EGkY7EPGsnv
         o4DXd/3tIezG7w5rj1YlWOHi5kUrkQKB+zjZC5g8/lruB0z2ntTw2gKR14bZCJTQ9+zp
         d+PcUdUQRcRRkbyih2FpKXsiNenHt/yhCRngD8fswl39ybqAS0KzYGtLaWGbC5SL1KMq
         xWfFDvw+rv085fVPxOyvXNEOfZK2xCFB0cMWX7hAt8hXZHfsvUJQbX2qMc0+3FZUKd3/
         D0WQWZ8eU6EtZcKHyMowFk1X6mcCacOU6jv3Yr+4WtXTPrKbMhEMbF2diBal9ZwMI+7f
         QjZA==
X-Forwarded-Encrypted: i=1; AJvYcCUMI4vxeyPN7jtdfAneRa/IpuCdNjcLY6qwl6/F87kx8+sfTZdmKHEEqhviY1vaE1T2BtEXoAVQS49/+A==@linaro.org
X-Gm-Message-State: AOJu0YxYZBPFCtDcxf7wyUa4BU8FZTIHgnnvj9FdDmZx495fF1GtX7ml
	9TXzgJOYeqm5CUAjpkRTwcKSHV9RIxa5Rpq8G7Kg1/qmGlGAHT8EtwrR6HTm5uhgMvQCmg==
X-Gm-Gg: ASbGncuDvtlVcgzhU83ZwyrMWw85AhMW4n2ARYe8DRx0UvwY9loy48YLr38VPMU+OzE
	SYQ/zDdvO3hugcP4AW9kZCKriZvXcKE4BC46BVJY+YvrkdO7mXdeuYpk/OQkphsVHZsxSrIQ+AL
	PwcwLqg7BRQaefoqFZgbewTjl14E7qTRTouyfvPXPD/vwRcmzV6iiTz+owXY9Szx4PgQV/cuksN
	Tohyxc/HXDK2jhbnXrukXLjLCrSnLz2+wCUE74MoKdmK5vd7sR5uZzINcHxG3b/G0ypLqm23x71
	7iqeJxHVp63IKOvP+u8njb5Ma82FX+cbdG+5jLPZlWgsMpz1oYSGfxUXR2jq/qz9mfFeUXpRJmR
	HKCESeuKeU3jaxX3IjFTir96BR+G/eg==
X-Google-Smtp-Source: AGHT+IGRCN6iUoyXqRv7gWL3CyrqT7BwgRkI/KO/oALd94G+AMGsRYNNsEs1oFkM62KVQ+Wcsduwjw==
X-Received: by 2002:a05:6000:230e:b0:3a4:ef48:23db with SMTP id ffacd0b85a97d-3a6d12f9af7mr10786713f8f.59.1750679618956;
        Mon, 23 Jun 2025 04:53:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm112628545e9.0.2025.06.23.04.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:53:38 -0700 (PDT)
Message-ID: <94d6e871-fcf1-448a-8a6a-f6a7f7720882@linaro.org>
Date: Mon, 23 Jun 2025 13:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] tests/functional: Expand Aarch64 SMMU tests to
 run on HVF accelerator
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
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
 <20250620130709.31073-27-philmd@linaro.org>
 <c8d2da2b-f44b-46ab-baca-de8b9a4c25e5@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c8d2da2b-f44b-46ab-baca-de8b9a4c25e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HJ7W7d7AEP0W

On 23/6/25 10:23, Thomas Huth wrote:
> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/test_aarch64_smmu.py | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/ 
>> test_aarch64_smmu.py
>> index c65d0f28178..59b62a55a9e 100755
>> --- a/tests/functional/test_aarch64_smmu.py
>> +++ b/tests/functional/test_aarch64_smmu.py
>> @@ -22,6 +22,7 @@
>>   class SMMU(LinuxKernelTest):
>> +    accel = 'kvm'
>>       default_kernel_params = ('earlyprintk=pl011,0x9000000 
>> no_timer_check '
>>                                'printk.time=1 rd_NO_PLYMOUTH 
>> net.ifnames=0 '
>>                                'console=ttyAMA0 rd.rescue')
>> @@ -45,11 +46,11 @@ def set_up_boot(self, path):
>>           self.vm.add_args('-device', 'virtio-net,netdev=n1' + 
>> self.IOMMU_ADDON)
>>       def common_vm_setup(self, kernel, initrd, disk):
> 
> Wouldn't it be more straight-forward to do something like this here:
> 
>      if hvf_available():
>          accel = "hvf"
>      else:
>          accel = "kvm"
> 
> ... IMHO that's nicer than duplicating the test classes below.

Good idea, thank you :)
