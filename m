Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2501230dyb;
        Mon, 23 Jun 2025 05:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVshbcfiRChNSSmdGYcM7p9qn6bB8T9jvEIbF6VGsBgpjCcQKx9SMkW3M96xKiSf0RDhRAEuRu95r+Dg==@linaro.org
X-Received: by 2002:a05:6000:2906:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6d27e1608mr9480835f8f.17.1750680337422;
        Mon, 23 Jun 2025 05:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750680337; cv=none;
        d=google.com; s=arc-20240605;
        b=NOoC5QiwzbBlKvjSBM6mOzwS/hlBdZFA/j/2262pmz7jyhjDW1Q6OpANUu/SSMNgjQ
         bBmD8LcNgkqZecdY3mIEuSEAHeGTyaes03KHqAl0KA14Zcnx8B0Hwekz2FCdl3c3rj+P
         Dp+1iaBQOJvVnJiWTiSK+XQMhG5Z8VxdYpOiSCi6UnQKvv0WGXmzCobdnoPyMwx0ZM+t
         ec5BMfmVgNVEzhrSAPCd4VEfBTLLRRZvdtcYapOCIewP287KQeE/p/xj2YjnKdB3QK71
         TRjPCp1+82sgx6+sLQX/cTZdSkA+1C46PzURsYCiFaUI0gNP6ntKWNc20tjNG13uYypm
         YYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LhVmC7Ptr86082iSVP3tCUv3mxHNuSnJ7XLqXn+lKmI=;
        fh=4nA4yjCsJEG9cYDvB1WwPteVv5aVzr7xtWraYps0Ruo=;
        b=XeaVfUozj8MHPcyHwS1iNES4FRDbVQkXgzcGj3+WSXVmUhzZGEaQ4AXIdITCbk8AZL
         +VLzmxXHCB9Inf1pDJcmsv74/pTE8casisZ7CEZEirVongGSkjKChZOU0t6Jz+dVnlxo
         S0y+FzzZbjag0ZOM7w2rkaPfY3c1lFnCKmt7S9wJ8tZOO6kT6FKKtlybMKF6/VyciJHc
         7X+Fyzb0Jkj5UzPKrKPRxly42DkeeoyKuZ/U1LKpPVOhW4bT0eNkP4xNiffznXE1Hr+4
         B64dHELA8T8CeeAaQSB7ZReyq16gUnzOUE1AYveRDIU9A+gsrWdYs7F0u5eq6OclcZWM
         HzIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbqXMtX7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d0f0cc07sor1655477f8f.1.2025.06.23.05.05.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbqXMtX7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680337; x=1751285137; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhVmC7Ptr86082iSVP3tCUv3mxHNuSnJ7XLqXn+lKmI=;
        b=fbqXMtX7d4SKah4XUfwWlCngCS8DCoHcU11oHEpT7IKl9bW95rrRCwzuf1h3OVWUfr
         oXKtyViJwO1I87ZdNX6HkA+RoEwkt7DDisfw21psPPdyQgzsab/9eOrK85+mzZp1Uszi
         4NN4bkULSg5cU1v/A1gKaluEQmxYDXQt1KgEJRRnt9UvVvq3YpbZKjXisnHR9YRumqG7
         48d4fWmNTOwJFRX2TIE9CI0joBSlC2my+/0eA9AQHByieMblCPIRG3p5bH5Oi7dfWxT6
         rN2f/YFZhNEkC07FBoH5zjZyvVXdJ8NJzT7S2tVX/fb5WGh+EdzzZ4sNCIeCZUPKqtH2
         pOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680337; x=1751285137;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhVmC7Ptr86082iSVP3tCUv3mxHNuSnJ7XLqXn+lKmI=;
        b=AeF0mhSipJ2VFGv/kyyr6Qn4dl9zoBOYBLDoLPxNMWdxAko4rxcnc87MVq0bL13gbx
         L8RGA85CDMN8+1IRyBWgGKvvCiXKbiqdEHNfbEIeDBRNp953kvs+tUHksuZgAQy3vOhi
         4C5mGb8S1EEDKWugfpYCsaG1kid4IaLYHj0pVCnWq+fIThybkCT8SJLtV5QbejpX7zh6
         JZwrzJzBKglAQkCiAJFzjvVTQM8bI0gjF9RJ8hU9UWACUR8yGKOnxxaUZKqwEdEIi802
         THIj5eSZ6lS9t2IalansDnGeAoJUQwExSqxyiwz8uZfCpIAD97LR1IC69V9buKkid1Su
         rsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVyb8e+kHcpG3/FhNK123GaFV1HYQMJzUtDi3H6dWSzRTeW3M+Re2gs9BfprcusOqdEMXLJ3vwJF8cB1Q==@linaro.org
X-Gm-Message-State: AOJu0YwM5uUHsQDJVoExhIlRXtrzTF9dNNhZt+mDXo74mh1xE8w+2h20
	v/hhKgjo8CO6bIjZ4xwvlzdmWpSfzYChvfihjhXxCq4ZS/NHsJ0EvKbjVmCpT0krUPIOmQ==
X-Gm-Gg: ASbGncvx0zCob8CPYX4nopflxGjr9WQsMekTA7REB4HXu0Q9V6od0/Uhc4Dxt6EhAhT
	avxd0RhzLiymML3PfyRIFKDH8v1lfYRFspf/6bAI9XXMUfkDNGNIq3qpbiSTlAcPfK9Zu+E3Lzg
	8/qUi05nyDqU6UJUlt4F7/H4TPnSIqKdxpYA9K8U6U492L7jTACFTf50rb9lNvMZppz3cbTgp0B
	KAZpgWMyXXOJ0A+KV/RKeLhtozGLPSnsbB6tX5t0XPBnOMBxr3NN4p7cFHqnFspfcXop13rcfNt
	26W6iZ/7/Li8NjOHhRNjT0xxELhzN+FdjDzGhIWJK8Mne7hA/PnZ8bS0LSnx9l0Lu325BVQVBru
	vcNCQQgMWLSKrwSMyrYxyj5z4k7SmTQ==
X-Google-Smtp-Source: AGHT+IFqbtwF21H6pWk34kjB74g+vaQ792b2mQtfrzzfV/L7m1oPbaWH1vPXMofzQKaBoxU+8UO20g==
X-Received: by 2002:a5d:5f93:0:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6d27e17c2mr9044838f8f.18.1750680336753;
        Mon, 23 Jun 2025 05:05:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a908sm142235035e9.4.2025.06.23.05.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:05:36 -0700 (PDT)
Message-ID: <424c91ee-f5cb-40a1-b1bd-3f0648ae83f5@linaro.org>
Date: Mon, 23 Jun 2025 14:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen
 test to TCG
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Content-Language: en-US
In-Reply-To: <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qDhzeOeUyQCc

On 23/6/25 13:59, Philippe Mathieu-Daudé wrote:
> On 23/6/25 10:11, Thomas Huth wrote:
>> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>>> On macOS this test fails:
>>>
>>>    qemu-system-aarch64: mach-virt: HVF does not support providing 
>>> Virtualization extensions to the guest CPU
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/functional/test_aarch64_xen.py | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/ 
>>> test_aarch64_xen.py
>>> index 339904221b0..261d796540d 100755
>>> --- a/tests/functional/test_aarch64_xen.py
>>> +++ b/tests/functional/test_aarch64_xen.py
>>> @@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
>>>           """
>>>           Launch Xen with a dom0 guest kernel
>>>           """
>>> +        self.require_accelerator("tcg") # virtualization=on
>>
>> What about kvm (or xen) as accelerator? Would that work?
> 
> IIUC this tests boots a nested Xen guest running at Aarch64 EL2,
> and at this point we can only run EL2/EL3 on TCG. HVF and KVM
> can not for now (we are working on it).

I'll update the description with:

   Currently QEMU only support accelerating EL0 and EL1, so features
   requiring EL2 (like virtualization) or EL3 must be emulated with TCG.

> I don't know if Xen can accelerate EL2, it would need support for
> such hardware (like the Apple Silicon M4). Cc'ing Xen folks to
> figure it out.
