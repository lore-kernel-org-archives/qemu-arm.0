Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5291288njc;
        Fri, 22 Nov 2024 02:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrGNjF+VdPiqqwG22ik7v/ru5DIKrcfVIju1KhXZX1+qrCozWBMe0IGO3tSkjfQdRcLLCG
X-Received: by 2002:a05:620a:40c3:b0:7b1:1d91:5cf1 with SMTP id af79cd13be357-7b5144df5e7mr372279585a.1.1732272352516;
        Fri, 22 Nov 2024 02:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732272352; cv=none;
        d=google.com; s=arc-20240605;
        b=b/kv4B1TwVfvoZr7SqjY6HV8VtLQDwAzLGIxyjqXMWqvAeH5obYKMK39ZN20zibegH
         CAq4AnEdzIJqhRbSDImFgDQDKP0UO0ysi52lQTI1DqavCDGzFrPQIY+rGvLd2qYADfgG
         7H5JfEgfupzRQyNOP9dPoqPuZ5wGwptPdlGqkSUO6z4GPVAh9FQxQwOeceKuBR0TXhCu
         MVFhQDcGTQwARgukPRX4p/ZfNH0b5zO4pJdO4PSw1vtXxvBsYOmDxcVRiAgKpw4kHI6Z
         9nzgSLctWajyj8oyJ9+peGcLiFwDFoczKt7hN3pOfqqSIUCPpOcDV/fncZ0bjjwmln9u
         O5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hZ+5a8PwZkMTPXwonKk6mETCAiEBRkZ8/IbneuBWRBI=;
        fh=WOUa7rlvlWxDdlm6rDi9a6uiSM9xMSrKhArCwvikkEw=;
        b=BnlfnULwkSsWutZiA1/RhDV744pCZIZmM82FVQcEV3DoQi8qkrLIlmbXcT+AKNv8bW
         t3dqOxxTXveiWNuCgAYpzx5H2jOOLgv/HmrACpYlJjZ0StzRi8IONzwbffHXL6PTFCcS
         fvTYPncIf/iBolDuYK456nHkQYzd31Vgumsi8Hq9SSlGCXcf5F0k1dJ60wRShuwZFDeJ
         90UuVnY9CPb66e9AzRwplk4p3+K5Td/90BmokodlSaFH5zTf3B2gma7N+1Z31q0yV50H
         Y7OR/BfkXJBzQpgHXpVCfx/ouqdFVixsA1nTTI04pdGP3pDNNNx75oftHcw9w3EdObw+
         /fLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D7Qv8cyP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b5142bec18si187552585a.642.2024.11.22.02.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D7Qv8cyP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732272352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZ+5a8PwZkMTPXwonKk6mETCAiEBRkZ8/IbneuBWRBI=;
	b=D7Qv8cyPQoWDOpmPbIazwuy37PLL4Krx+2SdC1Hklyaxcu32l3s5DedkXOwkT0pQHe2C5w
	gqASaW0s1p6r/LvMwUVHLxhlzOKXE0ADzg9l0nSzrlJhv72kz+O97bKuZwjoCFYq+1Bh/U
	R8JHdjc/bsXjqmcu7lA/HZwpPQbKX5c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-NbMAAvJmMOqRU8MHGrGioA-1; Fri, 22 Nov 2024 05:45:50 -0500
X-MC-Unique: NbMAAvJmMOqRU8MHGrGioA-1
X-Mimecast-MFC-AGG-ID: NbMAAvJmMOqRU8MHGrGioA
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d41aed9bcbso25147156d6.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272350; x=1732877150;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZ+5a8PwZkMTPXwonKk6mETCAiEBRkZ8/IbneuBWRBI=;
        b=mKR2Cpw/lWxwLYX9HTZnrMUvv/MuvjNApjAXSB7b36YQOSsBBLhhh086Cz6ElQVB1J
         a/jCKOtpX/BRcUP+cqx75Uzx6aqYJAQj4QBngdawfUywuNi6fV+6aoXfXLWd8kklg39g
         Ua85FnrA3V3D8uPOzq0UcqDs7BJiKqwlRjnqCrybshLAV4QJw7m0+b/7gs7OcKotV/YM
         Fcp/er61kkiPpOpxHbWag0QVTh2W98cEf9GZe9IomLiR5lmAx/6aSyM2pj5boOIBahHv
         XxnEwcHyPVMNXZDQNOsQg/MwHG2PeJNYIofU3TC8LM7TqObUU1wu43wdTzVBQ8Tog0K/
         wg4w==
X-Gm-Message-State: AOJu0YwCXbruHJF/kbUv1U/zdRjDgRItTj9K93Rn5JK5tWq4xp/OiHRi
	HU36OAHoQWo5Z6Y9oIJUMEGxqPYocfrpyf6U3WKtO65LeA8Jj2ndz8Pha3AjdORjoj53oVm3mmG
	T9cEDtZ2v3/IE4+80J0cGhJk3nAremCwIfNVr6O2NwselRSMIWxg2CBqCZpkzEPs+RFhs+yeZaf
	gQ0p0X2tD4nXRouvi+9Gn+oj2v3Nv07EW1m7i3
X-Gm-Gg: ASbGncvQLQXUt83Z2tVNuxIwj3rP9EUI9SGN+stL+HIxw737Rw/5L/4HzAgW3RgJuzY
	1dxcZSgZwI2bBLQRvm7a8XPgQ28jbHsg+pifM+eC4wNScQNk/gxmg6t1pKup9ucL82cyHT/AQKQ
	wRCI/JSCv0rDP7ME0NencehQ5FeJ0PfT+tW+hMfbE3eo7z9cpOeZU0mA/jcQEWqcz00bWv6nOzw
	ATvhnt7bsHnwRaCAnHg/pM50ve4Tz5L7Nky8nSBQuxyCb28es/LfOPmozt0XMr0LoeI2Mazgvk=
X-Received: by 2002:ad4:5bcf:0:b0:6d4:2737:6c11 with SMTP id 6a1803df08f44-6d4513459d6mr29767186d6.39.1732272350426;
        Fri, 22 Nov 2024 02:45:50 -0800 (PST)
X-Received: by 2002:ad4:5bcf:0:b0:6d4:2737:6c11 with SMTP id 6a1803df08f44-6d4513459d6mr29766676d6.39.1732272350050;
        Fri, 22 Nov 2024 02:45:50 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b51415aef9sm72666185a.108.2024.11.22.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:45:49 -0800 (PST)
Message-ID: <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com>
Date: Fri, 22 Nov 2024 11:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
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
 <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
 <875xoglcin.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <875xoglcin.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HsOzfbirER_idpg9arCKGftgJ3-CQXedsAFN29Y_nVc_1732272350
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4meri7yyl0qM

On 21/11/2024 18.31, Alex Bennée wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 21 Nov 2024 at 16:58, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> This is a mostly testing focused set of patches but a few bug fixes as
>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>> are objected to but I think its pretty safe.
>>>
>>> Contains:
>>>
>>>    - Daniel's clean-up of functional tests
>>>    - Another avocado->function conversion from Thomas
>>>    - Update the tuxrun baseline images
>>>    - Minor fix to the rust pl011 device
>>>    - Documentation clarification on identity
>>
>> Should we really be updating the tuxrun baseline images
>> in the middle of a release freeze period? Unless the old images
>> are going to go away and break the tests, I think it would
>> be better to stick with what we're currently testing.
> 
> Well the arm64be fixed a real problem and while I was at it I figured
> might as well keep the rest in sync. I have tested them so they all pass
> (although I'm waiting on the CI run now).

But there could be new intermittent problems in the new images ... so if 
we'd face such a problem, we would not know whether it is the image or 
whether it is QEMU. Thus maybe let's better keep the old versions for 9.2 
(except for the arm64 patch that fixes a real problem), and use the new 
versions for 10.0 ?

  Thomas
