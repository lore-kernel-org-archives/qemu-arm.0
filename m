Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp322995ejo;
        Mon, 11 Dec 2023 08:30:08 -0800 (PST)
X-Received: by 2002:a05:600c:2147:b0:40c:23ca:1444 with SMTP id v7-20020a05600c214700b0040c23ca1444mr2327255wml.80.1702312208555;
        Mon, 11 Dec 2023 08:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702312208; cv=none;
        d=google.com; s=arc-20160816;
        b=OKpgu1ugyjHNs+I9Hl7iJwKdxqK/twyxMzRDVxofBvmSMajXMWYhUX8UnQ/zQgYyN5
         ToloUu14Zs2IT/2vIm5lOkD6r2DQZh7aHrt7rYPQhRoxVSFBh4YjwXjpB+vIpcu/TIaz
         fA2WDjv6PasWzjzzYCf5PTGrYSBvaVh0pceeNra7CwNG/3f9dDFW0NKsGqhgoVq2GBgu
         4GH5HegxFhGMpTmQs2KRTHP2m1oHZ46jL56vHRhCVcZBHkExAV4yPzmcqkVkDAxnpojb
         LNeBcVTgq4mfqZGqut3faA7r1Q0yUOPJgZvG6lWokGNXbJmXFe292FA0Xrv/JxCgQXdi
         01lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lgQR+tJfnuE8VGMsbC6FBzjJNNEawrH+S2egV7A6WNM=;
        fh=LIN1c+usLVQtekpuVQpiJib5J9IPes9pLLH99qh6RZ8=;
        b=JzTD/7iRruax5xYOD0pVEt+Etw1OjY8I2s2TGWlt/VUJRSVCz1ur3Lt8DyzPh7JDDj
         hXpoTB9LILLfmc1Yp4l6PddHguWXGDHBasi2u0KGfOpcHSf9VgKXw/hW5vBaYTn6k/mj
         dRE/4QnpVYPH+sqjEZxSTNlQEh+LF+0yhc6+BbBzjj7WQeQHzeXNQAc9MLAdxXrayQ2/
         OlCWPV7tzOJJd2RgrW276Qy5PCqrh25UNsOLujvFgH47SacL1eQA3v0TSulngdGABQxr
         QwS4st1hrNnWu8PKNg50Cc0xFEXli9/+Jvnr3b5i+RVZJYV2Q5YM3wLb2OWOqqFLhtgs
         wghQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrz+Ns3V;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18-20020adff852000000b003333a104697sor2352172wrq.0.2023.12.11.08.30.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 08:30:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrz+Ns3V;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312208; x=1702917008; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgQR+tJfnuE8VGMsbC6FBzjJNNEawrH+S2egV7A6WNM=;
        b=qrz+Ns3VqhpnXN9zOSlQ1pjsXXdYduE0M6jJZAKeeZ7gOucLudosDtRxngj37nV/JX
         Zw2mV937Apz5kXRX4n0suxF9p0neGtK1M4mOy7U38V2elAV51GxlRs8TB93hDBp0VqQa
         0E5fQ06f+S6JK+c6r17za66RIG0AxMbSA0pKZBDHkT2RCbDtQvF0NOp8oZIjcFxAdw8s
         ChWqdI9V5ncTn4o96mD8zF2JMLleB1NnOc/hQXjohcWGHBusUPcQtpRojUzGLZwvBsEO
         koowBsr40Jz36FdNnj8iIgi62NJgni6wj1tyOhKUnbxEzoF/yl4sbZZOK/yWekVRiK8m
         +z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312208; x=1702917008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgQR+tJfnuE8VGMsbC6FBzjJNNEawrH+S2egV7A6WNM=;
        b=d7DSfczZywg1SF5QVB5g85S7/pyI54caETsbq9cEYjq2lQK0MZy5JtjYseuavX1hz1
         cjkmb4FDIgx6gagXb2ZxGxZs3VZCUWW9Y8SrHi8IIyuK+VryHmP6oVL1Cx0u1HOYBwh+
         WnOoGESRfWM7UPL+kkHgBYQ1KrNdZ0AYo/MigRDBRsg915E5sq8eLxu/UAuEXcjQZVoe
         VanZq0m6qbMN/LQKvUzdXcNUy8HWVfev7+HHFq0avj/9Rmnrdpt9fTs4RFTyp/Jo+bAy
         phZAxLn8r6BT7PLSYEosT9GAFoAESK+JfUFeA0IbiHsinr5MQ6t9WqB6l4+0KCu4JMGv
         PJug==
X-Gm-Message-State: AOJu0Yx0ZzCfaP1UQkNwtEBLj2WV8Pa8JdNwUV5J0fOaVPfonzBaHCrm
	MBN0IkpAqWgvAIMM6/h2GjCeItZXZB9iK5VghRylEg==
X-Google-Smtp-Source: AGHT+IFF9z/AOavNKv+0kQtxOnDAqtkj0yCuOY2JfT0TH7m9BaUGBEvIuEABRk5HwMgaIUjH3vYADw==
X-Received: by 2002:a5d:6685:0:b0:333:2fd2:51e5 with SMTP id l5-20020a5d6685000000b003332fd251e5mr2649904wru.94.1702312208133;
        Mon, 11 Dec 2023 08:30:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr. [176.184.30.150])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6807000000b0033334625bdbsm8962950wru.13.2023.12.11.08.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:30:07 -0800 (PST)
Message-ID: <bfa79c34-629b-474d-ba38-d73af157e25c@linaro.org>
Date: Mon, 11 Dec 2023 17:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] tests/avocado: use more distinct names for assets
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
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
 <20231208190911.102879-6-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208190911.102879-6-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DgmpCXNIkLDp

On 8/12/23 20:09, Cleber Rosa wrote:
> Avocado's asset system will deposit files in a cache organized either
> by their original location (the URI) or by their names.  Because the
> cache (and the "by_name" sub directory) is common across tests, it's a
> good idea to make these names as distinct as possible.
> 
> This avoid name clashes, which makes future Avocado runs to attempt to
> redownload the assets with the same name, but from the different
> locations they actually are from.  This causes cache misses, extra
> downloads, and possibly canceled tests.

Could it be clever to use the content hash for asset location?

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/kvm_xen_guest.py  | 3 ++-
>   tests/avocado/netdev-ethtool.py | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
