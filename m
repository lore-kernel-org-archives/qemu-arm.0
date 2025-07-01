Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3048826dye;
        Tue, 1 Jul 2025 03:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrjx3Esc6SX4Iu5/q5Wyk9ea/DyHpHq7qP70B81vVDzQkJ5j9Y5gEA0d1rpCL3q6qWAeFAQAVy7BS+kg==@linaro.org
X-Received: by 2002:a05:600c:83c6:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-454a07e2e50mr8533375e9.10.1751365113691;
        Tue, 01 Jul 2025 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751365113; cv=none;
        d=google.com; s=arc-20240605;
        b=FcSJZ/FvbDYBgCasoWppIwiFrzM1HtLr+9S9pMWawcxrV8T+zZqPDmIu4QvWqr8Kbz
         AqybXOTym62yIp5/OgR46SfQrsvo/cZe7Jhp7YuB5O0m0p4XaH8AxAwyQszybkwbYhXp
         HJGpm6k5+1z+rOBEdbu7B5Q7TQmX1LCUNhgjMhGGOh1KQ9/Y3VlrDzhokyf4nvhNcTY1
         h9Qqhli51WQDU0DLbpwc/TWEL0qNGrErP4AAZ3ebpiYF6OwZwmGyO99MPqjP92STmenc
         PvDlkNBdpQ8gqjks0ncIHkWdPIyCSzTYMmtTQP5I2pA9BZz7L7w6LmzPmwYzhKoFd4PO
         zXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LgnNOEMfhdY9VA8lAzP/UAe94NFoAHcMOH8/TPKyiSQ=;
        fh=/NhvZxhzI8pnFzXSH9M4xfkUV2643UvAE3+G+kSLu/A=;
        b=QXh+0s0lXojJrARmVhmR51gdZeuVd3G0Biqk92xFBhzSXWjUv9qyUuSek+L83Fh9JL
         LqNsYz0HrX7Nj/wwnJM/OERvSYXdEMHpJJdvA00B+Qw4ye6E2QMkQVfXHqfanKyqJjLC
         t6tBQ2zibXBBkCeUynuKmbJIbwb0bVFqNVmx/3qCRdW6Eyo38vaDzoaC6isyd6m+N6ja
         JEG/HVcUNOXKBqhBmVdSBkTKYOSM+tz+c9L0p9JpUrMpWQWp8kH0AqW44xTvVAtWeZcY
         FJUb3/MRmhc1fKXBgD8fwX7L939B3lbWDhig3Gcpw2t3s1C6OJ66ki0f9V0ozYMZZKJC
         W2PA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgZ+wCDA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45394cbaa2esor22606315e9.10.2025.07.01.03.18.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgZ+wCDA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751365113; x=1751969913; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgnNOEMfhdY9VA8lAzP/UAe94NFoAHcMOH8/TPKyiSQ=;
        b=KgZ+wCDA9hFaZd361HAWcpbhCH0SmQt7pThUJftvEVJSRCD+9OcomeyZ2gzwMeIosX
         PfAJR7bU2JIU7BPDHl0kwcdr/diZpPp/xNdIhF71f6kou7aZ1WpCR7VTqUiWpjwjFZsB
         YtV0jPqtejh7sqyxhM5/hEd/mkI5zlGmGGz9lWfhkTsPBky791jIIv+Wac4WaCuheVw8
         kbqc+srdNb77dTkuxiw48wqYWBukm286NmO1h/kX/LkyMQzfbErwlZVYKy9AuRxOydcd
         3Ozih+HULt+E1NwY5JMlUc6XIe2JUnREUedoO0fkpw3r+soRcPeeRXUkiywcWKBJVaHt
         tfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365113; x=1751969913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgnNOEMfhdY9VA8lAzP/UAe94NFoAHcMOH8/TPKyiSQ=;
        b=NhfUBwgWx7jzguT68yFfXDn9YDHqbngsEuGaIYZX+r7PkWZhxF1T8ZaBRm6WClkREF
         zcHTztA6AfTCZup6zyJOBY0dPI7BDStc1+w3bzK/Y9nXiBVh6NGofeiKLH/Li8Sgn7vh
         GuGa49WIQMq/iwxAX49xhlw474SSFzF9Xq/rjI0rRenO0U9V9W2bJDln3y62eqfclDsK
         GKlyf4qCRSY3noLy3DxhuuEpaLsfb2ioHobvI8dAvoBI4uvma39r3KbYb4LgH5xzKXrG
         XMyeWCZp6Yhn/7/KDCQn0EdZjiilICaWrXU7PdHC24I3lmZTX3MqRHZrZY+2FLysfTES
         a8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUppkRf6Plpj3QXf421/Ho+EZywvDmR4lHwjqFpjF/ICjAeVkOfuOkpQnykFMT3L6QgyQVkD3PNddg/BA==@linaro.org
X-Gm-Message-State: AOJu0YzplPh4SW6axR6H+hfeG9rc++CRp2eTSFm5ern4Gf33bgRy8yLS
	X2948RlN7NGTbkCW2vT1n4z5S4E8JwwmqjqIX1FlPELyrfvvyOfRbvIZJR5rUTINf0n+/g==
X-Gm-Gg: ASbGncvK2LnZ/L5dZKkBdQN/14claOUc7LLwN+wyBhIh7eMCAZ3gZbgVlcyB0v691Ae
	NvKaDJXIHSkDAhGyKMjBl8FSc4moDBLPIT/72IXuy/kt4wG5ZgIzfBjWevBjhs6saO6c6yfTimT
	h0BaHL20DzZ5muNp+4olZrAwPVKZQ4b6ck/bxXXWw5d3XttshPajTe2yh2A/euA3iCDSiAZo4N6
	G9LRbWHBGU9E+QmPW9dI7Rydgc59VBhzhbGiPiXeCNcv12nhNmonMkhsTaqUOsS19d4NX/TZXM0
	BOxRNAoSb+JPc2d+zgUDzNwBC5MgHQytLhdApww1SUQUVH2VBv0dV/Q6za7jNB9oyOBXAM7t+GA
	PidxfWDOGDlc/iFunbmElIyUkEGdWag==
X-Google-Smtp-Source: AGHT+IFb4W5g6wm6z7FzwAQ+UJUscW9Hb060Jxtit8cVodZVpioggdRu95VsxZAIY/qAELeUorDJxg==
X-Received: by 2002:a05:600c:4f06:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-4539002c9f6mr160576405e9.24.1751365112886;
        Tue, 01 Jul 2025 03:18:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3c7csm190478975e9.36.2025.07.01.03.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:18:32 -0700 (PDT)
Message-ID: <8d09d6bc-0fb9-4717-866e-7b557a4de3a0@linaro.org>
Date: Tue, 1 Jul 2025 12:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/26] arm: Fixes and preparatory cleanups for
 split-accel
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <CAFEAcA_hD_8XjMU+xdXM6ez-O8xmQtSddFLUA1j4JhstmJTFFQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_hD_8XjMU+xdXM6ez-O8xmQtSddFLUA1j4JhstmJTFFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TJNMW7Cxd+Op

On 1/7/25 12:16, Peter Maydell wrote:

> Hi; I've applied these to target-arm.next:
> 
>> Philippe Mathieu-Daudé (26):
>>    target/arm: Remove arm_handle_psci_call() stub
>>    target/arm: Reduce arm_cpu_post_init() declaration scope
>>    target/arm: Unify gen_exception_internal()
>>    target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
>>    target/arm/hvf: Trace hv_vcpu_run() failures
>>    accel/hvf: Trace VM memory mapping
>>    target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
>>    target/arm: Correct KVM & HVF dtb_compatible value
>>    target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
>>    target/arm: Restrict system register properties to system binary
>>    hw/arm/virt: Only require TCG || QTest to use TrustZone
>>    hw/arm/virt: Only require TCG || QTest to use virtualization extension
>>    hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
>>    hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
>>    tests/functional: Set sbsa-ref machine type in each test function
>>    tests/functional: Restrict nested Aarch64 Xen test to TCG
>>    tests/functional: Require TCG to run Aarch64 imx8mp-evk test
>>    tests/functional: Add hvf_available() helper
>>    tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator
> 
> Where I haven't picked up a patch it doesn't mean I'm
> rejecting it, just that I don't have time to think through
> the more complicated ones this week, and I wanted to at least
> take the easy patches to reduce the size of your patchset.

Thank you, appreciated!
