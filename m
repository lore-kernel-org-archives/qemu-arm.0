Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4913359njc;
        Thu, 21 Nov 2024 11:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPdx0kQiQ9/V72e+WMRK7Z+hiGbCAQzqGImpbKuqERgg2VMvjO5MnNvH1a/LYcr+bTrQeR
X-Received: by 2002:a05:622a:107:b0:465:2fba:71b5 with SMTP id d75a77b69052e-4653cbbbf0emr7069821cf.13.1732218101024;
        Thu, 21 Nov 2024 11:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732218101; cv=none;
        d=google.com; s=arc-20240605;
        b=F9qqxserdJeXqf7ECRyoD50Ux7iPyF7oRDcp0kKLup5YBm/ClXXdYu/xgoBJ1uwBJ/
         v0Sj6evvBSW2vZKBvHSzRROu5PhN2yzRRH4+8AM1VJ99pnKE+qkGqHdj5jXgq4AdLffH
         85gc4r1PM2puaxtXtix+JQkG2//J8SqeXJOHnt4FtHMnYp/aEUHtqdiV7vit9k4ftrQi
         7pqhyrAJyi5+u2DSY1aBgsBk6VEg3iCyYXKmuYi7/4vUNkZ7baUqETSCo7PNjzPHMQqR
         6SnIySuOeKMmgb/MceUjuuPQjGZFTscPgx5q+wiZsflU4funIQ+vs4uVyk33IZzuBwUA
         plrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=U+74IKXBfX76Hsz8vjGkl972OkUA9XQ4WAykI0zzAQw=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=A5ITonhWPRcuYv/6KIVHwCMNLmr2KgT2NnSRE0l4ho8yCPEQe4TiAfCbhBqINcFIVh
         kvDvDHabZgi3Ey8+wTgSIi7Rpb8pyQOrGF5C+BGE+GBHqXDUFSkfzVWdR2kwVYHxWwfj
         t3Y5Z3oARzIBKWgCPe0fJr0O0VPe/9FC/MLncxYK+CAHcO4kZC8gzgLA11sAozGbDWm8
         V23hWQxmX0GjQcysmWpzHDEoOGcdIjE0ExRuD2yb+zdccf8duiTBM12K/3DiO/bCsa/E
         ISQFx+I2DJ8IDpXSlqljAieTAiR+dkvRkWnpG/VTClCxsm3TxUOOgitWsHu/I2x6ZCyT
         x9Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SswMr51i;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c4a0809si4008251cf.521.2024.11.21.11.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SswMr51i;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732218100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U+74IKXBfX76Hsz8vjGkl972OkUA9XQ4WAykI0zzAQw=;
	b=SswMr51ixxyCRFwgCpuvzu/EpGJAEG8kbHVZxjyOg42f3/PbY1uqvzrlvPC2kJ3C80m8fv
	WkXl1D3u/qyou8WugLtDfDC5pe+cysbL9wDN1dfNySEmbn6RwLcMshOPnxfVLzQe4C/jJJ
	c90X4fqyCudjbIRHKrE/6VPpeODLFA8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-OdFiowMVOuqyryZcu4bY8g-1; Thu, 21 Nov 2024 14:41:39 -0500
X-MC-Unique: OdFiowMVOuqyryZcu4bY8g-1
X-Mimecast-MFC-AGG-ID: OdFiowMVOuqyryZcu4bY8g
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539fb5677c9so1196182e87.0
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732218094; x=1732822894;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+74IKXBfX76Hsz8vjGkl972OkUA9XQ4WAykI0zzAQw=;
        b=sk3DI+WxKC0jD7ntimkGIya2PZ4reMAQUz+XgRUth4FBEDSOC1nz6E8m2HJs6vbZUw
         Q/UiAjj0w8I+IAK7hiBN7kIW5AC8Y2TzIwvI9fygzzEiAsP5Vt60rwAlS9l9EGeEjgHt
         F54Xc5OPo8LNm4FmGIt5vIe5w3ElUbvec+3ebcxGeL5amP4EUXFF/i94CmP5f8w/mhAI
         PT+fQOzRdZpjJqyLPPCxy2kJdGtrn2oGmrTS2LuxiCkga6CEhbyQZ/d0G2RGcPeWrIcv
         y58jMDcWVJAKD+A6aI2vh46ewI6hty4SrmvvgPS6f8KBW1B4oto3flyGzzzwnSpR/SEF
         AYKg==
X-Gm-Message-State: AOJu0YxcI8rSEtEw83qq9QcbS4pYE3cSbpDqDY6xB1yCrlmRgVKxdhyX
	fFSSxtWggotnSEiu8nIfox146M0jG0e+MJOBmvZV2JJWU9iodmuxVpCUdlX7iaZpMduxyFZeaBL
	A6EBdzvqpRduEXe0xukakIi6frbC9D9qToO/tD9equQ9di5pncxMFS8wRO1YWTQ4OiRSegjQdwF
	J8kTiyfAvuusUnJm8jC/7b00WVQvxjbKPpgQ==
X-Gm-Gg: ASbGncvmaDjLHpe2wa/6cGkyJUE8M/srB5qH1Vle354xx6xjyRoGUr9S1zNGN6V9Vga
	9892G73jbIol3XaccnzOTYrISVTFK62XJW+2z556FTLWY0EFTAabkN0A2ChEkeAYG1rzbRqIpRo
	b2golUgEAkCNAcKvC8LjGV8gnpE9KicDL4NZWDJEtYtg4/Ypx/12zf84ADCXrLN4K4kjRPDIq99
	8ujyd5kWjZ2iiA5wU5iwqGD5zQuEB02VlkGJlgVwFEnWxsnk/QYNe4LyYMxI8Z/cW8fz7Ze2X4F
	Pzg=
X-Received: by 2002:a05:6512:3e09:b0:539:9524:92bc with SMTP id 2adb3069b0e04-53dc136de98mr4591542e87.55.1732218093942;
        Thu, 21 Nov 2024 11:41:33 -0800 (PST)
X-Received: by 2002:a05:6512:3e09:b0:539:9524:92bc with SMTP id 2adb3069b0e04-53dc136de98mr4591490e87.55.1732218093423;
        Thu, 21 Nov 2024 11:41:33 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f5402sm7750366b.68.2024.11.21.11.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:41:33 -0800 (PST)
Message-ID: <abaf7618-96dc-416a-b0dc-2ead6c16e45b@redhat.com>
Date: Thu, 21 Nov 2024 20:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/39] tests/functional: add a QMP backdoor for debugging
 stalled tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tA3WSVP2pXf6zdmjhIW2eHqJxnpcvILHEjMOm_I_Gec_1732218097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /daqFNHVi1/9

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Support the QEMU_TEST_QMP_BACKDOOR=backdoor.sock env variable as a
> way to get a QMP backdoor for debugging a stalled QEMU test. Most
> typically this would be used if running the tests directly:
> 
>   $ QEMU_TEST_QMP_BACKDOOR=backdoor.sock \
>     QEMU_TEST_QEMU_BINARY=./build/qemu-system-arm \
>     PYTHONPATH=./python \
>     ./tests/functional/test_arm_tuxrun.py
> 
> And then, when the test stalls, in a second shell run:
> 
>   $ ./scripts/qmp/qmp-shell backdoor.sock
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-18-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing/functional.rst      | 10 ++++++++++
>   tests/functional/qemu_test/testcase.py |  7 +++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
> index 6b5d0c5b98..b8ad7b0bf7 100644
> --- a/docs/devel/testing/functional.rst
> +++ b/docs/devel/testing/functional.rst
> @@ -176,6 +176,16 @@ primarily depend on the value of the ``qemu_bin`` class attribute.
>   If it is not explicitly set by the test code, its default value will
>   be the result the QEMU_TEST_QEMU_BINARY environment variable.
>   
> +Debugging hung QEMU
> +^^^^^^^^^^^^^^^^^^^
> +
> +When test cases go wrong it may be helpful to debug a stalled QEMU
> +process. While the QEMUMachine class owns the primary QMP monitor
> +socket, it is possible to request a second QMP monitor be created
> +by setting the ``QEMU_TEST_QMP_BACKDOOR`` env variable to refer
> +to a UNIX socket name. The ``qmp-shell`` command can then be
> +attached to the stalled QEMU to examine its live state.
> +
>   Attribute reference
>   -------------------
>   
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
> index e2a329c3e5..fceafb32b0 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -175,6 +175,13 @@ def _new_vm(self, name, *args):
>                            log_dir=self.logdir)
>           self.log.debug('QEMUMachine "%s" created', name)
>           self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
> +
> +        sockpath = os.environ.get("QEMU_TEST_QMP_BACKDOOR", None)
> +        if sockpath is not None:
> +            vm.add_args("-chardev",
> +                        f"socket,id=backdoor,path={sockpath},server=on,wait=off",
> +                        "-mon", "chardev=backdoor,mode=control")
> +
>           if args:
>               vm.add_args(*args)
>           return vm

Reviewed-by: Thomas Huth <thuth@redhat.com>
