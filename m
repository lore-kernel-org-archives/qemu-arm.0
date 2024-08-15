Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp863989njf;
        Thu, 15 Aug 2024 07:01:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiCuXfx8r5nZDNrpGdKIkEIG1gDQoH8Y8CRzaJjRXceQDJfFVgaNIzgzvzqfwp3JQPQYPiQd8dO/c8MvAcdsLY4Aw7D0NR
X-Received: by 2002:a17:907:e64b:b0:a7a:a7b8:adb1 with SMTP id a640c23a62f3a-a8366d49526mr400709466b.36.1723730487602;
        Thu, 15 Aug 2024 07:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723730487; cv=none;
        d=google.com; s=arc-20160816;
        b=PAqu+3sXwIcKwJah0m3hyalrgtJY8x2L0mILB25kaiVnAaBYGqYKPWzlQFSdTjbbWU
         pnGCDSrs/V+PfC8OHSVpwc0L/BM2mWo4wsODux1uZ1NbW8MT3J+4VscpdP4/6LM0s3Bs
         vNpqfybLo4HpLZWtDRtDB6aMM3C8xYo98eYeBL1rBf+L5voCuQ92fVWt6v8jwAwQfDZk
         NaEBVNUOZn7sPpkTefijNpG7HIElwDTHxTrL/XhuQx/ghOKEUOn1n05JXegefBP6u3Vl
         EwBLijGhsT+VItCDauUn6apC3Ui3kqcZIaqRD1396+Md7PsXD3AzkXcR9ooPyOjvdzKQ
         g4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8DxCdAIn5y4gTzTjhyb9YR7k4aqTjKY2yApmrude/dg=;
        fh=l72h+ohq3qcQWw+e2dYKZ+NOCp5K3o2doywQk/Kzq9c=;
        b=Ihuq7r6H9lB/WfZzoV4YHIEU0GLgP4rMcpRV5VfP1jQT+/veLPHXhOxb9nP21P/DsX
         CYU9Dd8YNa0MblXCTyT7TmBKi/8+pts/yPaJETyt8ve+GMEwuo4zyTAZakybTYil37ls
         D8RFrNKLNniJhHSVossfAesCjDEtQ2zJxjSry48ZvtkTlOEBgeZwuz6FtvqIFGSEJpsz
         fiEolgocGiHJKTob+n3zp8OltvY4RfGtBp/MeT17k9k+/U5ysPjOkP6nC0lsDVDbCTyW
         0KVv1JGejxcOg8qutrb4Kgt2JbOC6Muc8fDCheMpe+ZK3KH12WpnZVAvanNvPYCiMgjU
         dRnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OcIelBSg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a838b5ff44asor12958366b.15.2024.08.15.07.01.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 07:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OcIelBSg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723730487; x=1724335287; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DxCdAIn5y4gTzTjhyb9YR7k4aqTjKY2yApmrude/dg=;
        b=OcIelBSgcxsvlU5z4tMI9KRr9RsVLzsIwNCZuVmo4jUQGIi5FXu0QEL/9rAe08RlQI
         8L7DAqN24gDfeNczL+s/NKpHH/QLKJGd4du9mGqOLCIfCLyytOAeSTdcRkrSV+wbALcK
         CHJK8voBkD0QmSa20G5RqU87MsKcN92HzYbxshEOTjF2aUCKSlEFknBi/YeoRgA35T73
         TjsOmIN0M684lrQZLQMemWyVKOldSmabvJk1xXUr/mySeQw/IqCZTK8srUtuMbGyelnp
         dcSxzOOTRLxxxlYFMCXiWcOMbCBUhLAEntEPL1/yhGHkw8dq/nPDUZaOcnZ8fksiXrwV
         eyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723730487; x=1724335287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DxCdAIn5y4gTzTjhyb9YR7k4aqTjKY2yApmrude/dg=;
        b=OguhjoCtBQmkH1IQT1XEis7A7NsAgUWWf+Tehs+PXRGmQKWDWbBlPW6rgd0UfU3//L
         4qy65snYqtBRSpYXlGgcmIApo6QIhU481mU01U/Hk/X12pjIC/DVkP6JYqYd7+0H069Q
         b97yARqPk/6NbH5382psLZXzgZoC8o4dOwAqDAkKp5fTge2MShbLUTcLpHlrdGZtV9uE
         Epj9AgIpaCXKTlwnaOIih7Xipp4URY3f6VrgQawxDjZhzCskGD+yBqT4YYe8ZZXzv6I3
         KMwdTOQYKII0YSzn1nUd/NejHx5AZdy/nmHm1/DhdT7Ku9pM6SbL6kQalNRRRe4o1u7s
         Mm6w==
X-Forwarded-Encrypted: i=1; AJvYcCXuNLesY16JRtPIdYWegfT/f6grT9s2WL7QYvMWQg+qVO3G8BMgYze1NusResTaiQvIonOV7ZNZgWIYAcx7bCHKF6xj5TtR
X-Gm-Message-State: AOJu0YwW8Isr1YSUsvQHZzIgxqv7eu/Qf4yFhRZ8c8WehunWJvBwHZ7R
	46iw9Zxbt8uOs/buwsDnNb8T3fIdAh8koLFVF7BcHeX2kNfM1iY4wGVnfUhvCeudQw==
X-Google-Smtp-Source: AGHT+IG+VRgNNZ0HwlyxiqMHy9WFgWzm7ORf95ag1U2KeV1i6XvltyF075I/Y4XWGWZ5tkxdq4pdzA==
X-Received: by 2002:a17:907:f769:b0:a7d:340e:43a4 with SMTP id a640c23a62f3a-a8366d474c1mr444370466b.31.1723730486912;
        Thu, 15 Aug 2024 07:01:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.202.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf2b7sm107233066b.55.2024.08.15.07.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 07:01:26 -0700 (PDT)
Message-ID: <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
Date: Thu, 15 Aug 2024 16:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] rust: add crate to expose bindings and interfaces
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Junjie Mao <junjie.mao@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com,
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
 <20240815-rust-pl011-v7-6-975135e98831@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-6-975135e98831@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: zMfcLwgfVGw6

Hi Manos,

On 15/8/24 13:42, Manos Pitsidianakis wrote:
> Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
> provides some declaration macros for symbols visible to the rest of
> QEMU.
> 
> Co-authored-by: Junjie Mao <junjie.mao@intel.com>
> Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   MAINTAINERS                       |   6 ++
>   rust/meson.build                  |   9 +++
>   rust/qemu-api/.gitignore          |   2 +
>   rust/qemu-api/Cargo.lock          |   7 +++
>   rust/qemu-api/Cargo.toml          |  23 +++++++
>   rust/qemu-api/README.md           |  17 +++++
>   rust/qemu-api/build.rs            |  13 ++++
>   rust/qemu-api/meson.build         |  17 +++++
>   rust/qemu-api/rustfmt.toml        |   1 +
>   rust/qemu-api/src/bindings.rs     |   7 +++
>   rust/qemu-api/src/definitions.rs  | 108 ++++++++++++++++++++++++++++++++
>   rust/qemu-api/src/device_class.rs | 128 ++++++++++++++++++++++++++++++++++++++
>   rust/qemu-api/src/lib.rs          | 100 +++++++++++++++++++++++++++++
>   rust/qemu-api/src/tests.rs        |  48 ++++++++++++++
>   rust/rustfmt.toml                 |   7 +++
>   15 files changed, 493 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5464cb2b03..56a88048d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3348,6 +3348,12 @@ F: hw/core/register.c
>   F: include/hw/register.h
>   F: include/hw/registerfields.h
>   
> +Rust
> +M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> +S: Maintained
> +F: rust/qemu-api
> +F: rust/rustfmt.toml

Few lines in docs/devel/rust.rst would be welcomed,

> diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
> new file mode 100644
> index 0000000000..51260cbe42
> --- /dev/null
> +++ b/rust/qemu-api/Cargo.toml
> @@ -0,0 +1,23 @@
> +[package]
> +name = "qemu_api"
> +version = "0.1.0"
> +edition = "2021"

> +license = "GPL-2.0 OR GPL-3.0-or-later"

in particular explaining the license choice.

Should all rust code use it?

Thanks,

Phil.
