Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2402523dyb;
        Mon, 23 Jun 2025 01:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTIlQp+LW3ONHtSXB9uML9M92XWkjma5DoGRJLO4BHNRLR9YrjYqWnDZ6Dg4zdLHF+HaT206RVTh5OrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGMG4ngjQ496Y0JEvH428Lxh6xTojfydRBwDmO3xHPfZRrJFbukje6YoOUki8n3aLsdeNgQ
X-Received: by 2002:a05:620a:248d:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3f99649e3mr1476150385a.57.1750666988872;
        Mon, 23 Jun 2025 01:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750666988; cv=none;
        d=google.com; s=arc-20240605;
        b=YEdPZominOwOGj40GCby6TvBx27YoCfL5C7E/VSdqkQML+2p5pdSHpUaIXp013v27Y
         Hpir0ARyDbYGWnmugV2PR8CixT51Ik5FNS4DTa2IlVFYXTS/dLxWUvpc6Abf9d/NJLs+
         BOdyyoV79K6hf8kX6xzpNvMFRDyvEsujieym5WYJ+Dlkb8yXh2wcxMoZOgY7cG+9CP66
         Gh4qO93yEEMhx5f4w4HCLYixaTVD/IC656nSs0P8z3KRuW7ygvlY6pOC8O9jI8Bywwey
         oOFaeusv/s4PxrgFBCRpmuMqNQd8xQelrfkm3krf1PmnLLAbXU/Sojj+EZf1jK/xgE0l
         caAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hdcp9RwtfZi8FMSc5dPMRPQIL7xDdgS875H69vG9FfM=;
        fh=MORy7MKTVyAI6kYD+vMkgDN7u/iJoNjqw2eIeJJt+Lg=;
        b=gLoZBuyKIknPLKeUy0x3LARivrVsBaNXuf14zHmL4LqB1SKrLgogFhN5XBaGfrwHxF
         iQJmXbryKjPv7U98pkCFJyIkIn2s0/sQw141AuJ8QWrK4Xk0AuX+6Fp3wrhsLYlJ6yiU
         /XuIKiXPDUL9tmUrPWDgSZhgvtZXXQDOTSnYcHLiozFNmSwzjK4Jkg0q3PWJHwd9yXwb
         eU4vIXVAB8Gcuh1+p0mzx9HubfIBumJ+j24N5L0wCxzlfn+3xEsKwblPsSrz9osFccrv
         eD0DnwWY8CC+YXFQH8qJdLx39bEZsrH376qRVYHCuGPB+ITVaNvzreDny5fARDiRCg20
         W3fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JU6TYrnt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a28350si734188385a.640.2025.06.23.01.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JU6TYrnt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hdcp9RwtfZi8FMSc5dPMRPQIL7xDdgS875H69vG9FfM=;
	b=JU6TYrntJXHFy2qNwuuUhSEYcaL1y6Oak6QTSh/UzNyjGj6jXr24WjG9MzKJkdnCcEh6J7
	y3g/hhKTyzcEWWb8x7YxIPHTo+5nUopkk/S3/QJ6sYnkTpqZPbX27hmowSCFBKv5jFqAyX
	bVO89nOSIvtVMRUXs66ccbaOBfyBdH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-zLrQ-kn0M66eRDpC6xrtxw-1; Mon, 23 Jun 2025 04:23:06 -0400
X-MC-Unique: zLrQ-kn0M66eRDpC6xrtxw-1
X-Mimecast-MFC-AGG-ID: zLrQ-kn0M66eRDpC6xrtxw_1750666985
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso2117069f8f.2
        for <alex.bennee@linaro.org>; Mon, 23 Jun 2025 01:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666985; x=1751271785;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdcp9RwtfZi8FMSc5dPMRPQIL7xDdgS875H69vG9FfM=;
        b=xLYn3Sjn2c8oA7GFFPm4AsH3xwvQMEh78DO2uxCC8p59NQoex8rQsRocr3nkFo5U+7
         BMQHjAn72FlOwnzhaLWP63rFwVk7iu4FeCkuTFDdLRcfhh/EDtK9XXVY5ZL8dUVUyw0S
         wDfNtazrJoGZF5pm6/sVux0Gf9IqmggtL7DvmRZLZ/3t+3v6JgzkaOgTLDN7TYlHdoLm
         M4gevjD9PtG4Qi1Zjy8V2ViKeFcaN6u6eIg8eB/ymc5gNchEHa4eHwJym5F17pEQOk1w
         gKMBjzZZtxCXlkT9xXttKYZcyW5CRUtuilTF7VpMGHCzSzUsC8FFqyUiFhDorWIXP4RY
         ipyA==
X-Forwarded-Encrypted: i=1; AJvYcCXaLZ7HRK2S1qwm3v3A15r7B/Z/lUzAjxU7/pKLlMB4IpoubLbT2Ux5CWNlABLbiVXkYKjacgFoPEWQ9w==@linaro.org
X-Gm-Message-State: AOJu0Yywc3KQKMZ296DApUL2PiRMEmqCtstyQBxB9MAtNM1nKR4DAf95
	/g3G6pyGI+kgWOZHFbE4KFKNABYYzY0xN//sZiumC9E0oLEA9ZYW9YdH8M3W7gB5hGZuYpvn6n8
	veDLjSaI/DqCBCUf6tnvWF2B9RWY3f3Mu/bDJBZmE+7sXsSy779Z1ST3BYQ==
X-Gm-Gg: ASbGncsyH6JAkIUeTzJaREMHHOacjIpwo5QzbmYJ4pmL5RVdActH9vESMjt8+IF4FVp
	MBa6+WUeeXU7E2f9SeiPCdxzC4QZPM+v3Y6oa91DshWXmc3L7AxD9543ijrrQWyefqnQUZGzXcv
	NJ17LdPw0uxdH821HFIZ6QXAXLhR7AHLs17JmkD8D35EH85aZfAyHpE26KVVUgbjO5YYIFcqA2z
	eV/jXPryLaFP/2POxr+Evk+fXXZQ5W105Ri/rI1rmXV5/Kl1uBtaINbfHs58DTy/w47Oth9NH0r
	s1VoVXQMqQB2R5eV+MyO8BqsTCtq5JSlJU1WlV81nFIswCmP1Z08kLdtbAp9z/c=
X-Received: by 2002:a05:6000:2111:b0:3a4:f6d6:2d68 with SMTP id ffacd0b85a97d-3a6d1314667mr7319752f8f.56.1750666985455;
        Mon, 23 Jun 2025 01:23:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2111:b0:3a4:f6d6:2d68 with SMTP id ffacd0b85a97d-3a6d1314667mr7319723f8f.56.1750666984983;
        Mon, 23 Jun 2025 01:23:04 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ltea-047-064-114-166.pools.arcor-ip.net. [47.64.114.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453770470b3sm17430525e9.30.2025.06.23.01.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:23:04 -0700 (PDT)
Message-ID: <c8d2da2b-f44b-46ab-baca-de8b9a4c25e5@redhat.com>
Date: Mon, 23 Jun 2025 10:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] tests/functional: Expand Aarch64 SMMU tests to
 run on HVF accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250620130709.31073-27-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R9uEo_6r2SOEarmBwo5-s-wgfHADz8_rzF8jBTjrL7A_1750666985
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: y8BJFo8rG58I

On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_aarch64_smmu.py | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/test_aarch64_smmu.py
> index c65d0f28178..59b62a55a9e 100755
> --- a/tests/functional/test_aarch64_smmu.py
> +++ b/tests/functional/test_aarch64_smmu.py
> @@ -22,6 +22,7 @@
>   
>   class SMMU(LinuxKernelTest):
>   
> +    accel = 'kvm'
>       default_kernel_params = ('earlyprintk=pl011,0x9000000 no_timer_check '
>                                'printk.time=1 rd_NO_PLYMOUTH net.ifnames=0 '
>                                'console=ttyAMA0 rd.rescue')
> @@ -45,11 +46,11 @@ def set_up_boot(self, path):
>           self.vm.add_args('-device', 'virtio-net,netdev=n1' + self.IOMMU_ADDON)
>   
>       def common_vm_setup(self, kernel, initrd, disk):

Wouldn't it be more straight-forward to do something like this here:

	if hvf_available():
		accel = "hvf"
	else:
		accel = "kvm"

... IMHO that's nicer than duplicating the test classes below.

  Thomas


> -        self.require_accelerator("kvm")
> +        self.require_accelerator(self.accel)
>           self.require_netdev('user')
>           self.set_machine("virt")
>           self.vm.add_args('-m', '1G')
> -        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-accel", self.accel)
>           self.vm.add_args("-cpu", "host")
>           self.vm.add_args("-machine", "iommu=smmuv3")
>           self.vm.add_args("-d", "guest_errors")
> @@ -201,5 +202,9 @@ def test_smmu_ril_nostrict(self):
>           self.run_and_check(self.F33_FILENAME, self.F33_HSUM)
>   
>   
> +class SMMU_HVF(SMMU):
> +    accel = 'hvf'

