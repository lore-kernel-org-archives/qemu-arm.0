Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp879716njb;
        Wed, 8 Jan 2025 06:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOWUpgqIebO89mx9lvKRloD9CDr3VDxH48SEJQjaVGGDIqI1V8UB8W/G0f/3mc1i/4oSoC
X-Received: by 2002:ac8:5794:0:b0:467:85b1:402b with SMTP id d75a77b69052e-46c7109e367mr37145701cf.47.1736346346145;
        Wed, 08 Jan 2025 06:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736346346; cv=none;
        d=google.com; s=arc-20240605;
        b=IbXD2Wwd6ds6b61waHfQU1Vdfi8QFO/TfHwbXG2dS0wJjfPV9bZVr6UAeYA7hWVHLt
         eHmJW0hRWFI8m9yHz98ByMQd4/woV0fHh2zaPi9Q8LpF8oTjk+BZjJjKmbqwOvE7s8Bi
         b8Upt8TR25QG5cGAVE5gQqs3RH5CiX/ZBSWz8FZ08SOOCEv9d3fUT1ibJIhVI4Sc4qfQ
         MQZC0MsCrDBKFNqJf1CxVFed8TNAiH/aB9qDxpoVdPvb60RXX9Z8ls8D8yhPV9jNGoLF
         jGBfXM/IXGu0xbhw4xHQhvHUJ+PV70McVwL366fwVuREul+xiPUHIry6mke4Q/UO5ehw
         Ec0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=AXEibKuSVZlpViRtb1cZIFRQexR3IJ/dHIKw/SCt2RM=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=J69pPEpc8VyzuBALxe/GcjF0OuYacgnLM/gkOX6kJV7jF0iWpr//g7ZeQVAIK+xN2s
         IfCZwHsrkxGes1fn9tczjrqOLRPCiujlwUb6N2ahTEKsUyBPfZAu7U+WQnvaHQtgrs5N
         GPEWpUms9rRz1EmHmGCewZeo/S3GgcV5RqhPEMpowxI24Q41TfIqsoPqFHhU5fVUqMEH
         b6CrW/fflxc1IAO3TWi6C/9QLgcqv0Nw5KoQdLiDpI2pJYQbzi7ld/C7Y9eh9O3KBKz/
         uO1vtXcJ2WLrZqDM8dudMtFtjUV+LRxtOXfC6FC3MOnOUsh8Lp+KykmpU+DJz4qxHBcO
         +XGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="A/C8Qenm";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb9a62asi504887561cf.230.2025.01.08.06.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="A/C8Qenm";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736346345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AXEibKuSVZlpViRtb1cZIFRQexR3IJ/dHIKw/SCt2RM=;
	b=A/C8QenmMRG+bAHLTaPMIIwrk/GScS9zvwn9ivIc8ya2d5cgmkRcF3ALMHCPb3zpr6WQO8
	B12YQwgYDFrI/Vi1VjdSGrUS8/dzm2/ZAXhu/6Kvg1NnP6IN7K6Wjc1aJqcQQVvs/plQlc
	XbTWEzqLSNHdGXO0gI84VWIuaszJGI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-79IR05LTMCqo8PIiw36ABQ-1; Wed, 08 Jan 2025 09:25:44 -0500
X-MC-Unique: 79IR05LTMCqo8PIiw36ABQ-1
X-Mimecast-MFC-AGG-ID: 79IR05LTMCqo8PIiw36ABQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so54226945e9.1
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346343; x=1736951143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXEibKuSVZlpViRtb1cZIFRQexR3IJ/dHIKw/SCt2RM=;
        b=YeRGqP7WY0FLnGx/+r4jJ9tKSNQeyKt15biN1LFQemKhCPpfRXEfuK/FlJTkg9117X
         celSPl11BZTUHt3CjzMYFexajiUxc2Hv+ZEt3n+k5dkmcDCA+mcGgK7xvmK22rGjs2WQ
         RNVHvH8G4zHubYlKxwlqPZro4qoTTT7fS+LcNOooOBIf+X/dtg4KXc8UM7RGrKAE7oVk
         MZy0wTilsnEnGrfdtLqNy56jv/HOqqf6nytLyRfDXNPHt5Sa9KwpCSx0J474sOjjWIzJ
         tvMweAfbCxooYocJXPVkoUl/nCmywW4v7lxuoKMh6dDwo+rVu/COsxxkJrDCthijSTsB
         jN7Q==
X-Gm-Message-State: AOJu0YyREPRpXEGbtFYPWK0M/R5ojUXe12DiScIU2ZVQdZmlIbMpsnqR
	R0/vcb8K2xvcAO3jJRkzP7EwQaNLovLTdPRqgNU81AwqHMk15qw6ZLc906Nqfu6dPzL/eyhDdfb
	+bopIm1Brmr6mbQ4TkeREbMRhUrWRmIIIOQZ9acuuF3K+JJfBanxWGkaUq+355DY/h60dqGv+4S
	H5FODjEPQQVTfQ33QJCu6g+pbBW3d0jqrN8A==
X-Gm-Gg: ASbGncvBxI7AUBTE6nlO3+CX+vE6QSg7KzxIMNwQ+4ZT+pi8igjxdbh2bQaB/ap8jh6
	MMNGPr6MjyNaImGRzuaWEdHQkDO24w++zmxjp+KVMko7f9sDvOUOEKwB6rttDGj+2Thj+dpPTXj
	+JOv0GrMTEzYakdtqU+gyauE4U68ECMQ5SVWp5afOTsderfGSLrmuU85w1iagByVZ9y/mthdSe+
	GyXHGYPaDtdejr0oiNz+z4O8Tp1Ylm80BeASQTfxSiFbBdG/V68eB8YSOf2eO/HMwxAWr9DqLsK
	kzbruA==
X-Received: by 2002:a05:600c:3c97:b0:436:840b:261c with SMTP id 5b1f17b1804b1-436e26ab54fmr24511615e9.19.1736346343487;
        Wed, 08 Jan 2025 06:25:43 -0800 (PST)
X-Received: by 2002:a05:600c:3c97:b0:436:840b:261c with SMTP id 5b1f17b1804b1-436e26ab54fmr24510775e9.19.1736346342911;
        Wed, 08 Jan 2025 06:25:42 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da74dasm22530075e9.2.2025.01.08.06.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:25:42 -0800 (PST)
Message-ID: <d1dfef85-c830-416e-9ff6-a69c124aa32e@redhat.com>
Date: Wed, 8 Jan 2025 15:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/32] tests/vm: allow interactive login as root
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-30-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-30-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MqPOWHL1O5IjrscdI7LbipyxzcuwrY76kEbPLB8zR18_1736346343
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3r2kSwhIokJh

On 08/01/2025 13.10, Alex Bennée wrote:
> This is useful when debugging and you want to add packages to an
> image.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include | 3 ++-
>   tests/vm/basevm.py        | 9 +++++++--
>   2 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
