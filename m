Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp883205njf;
        Thu, 15 Aug 2024 07:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTZX50ryRlBodnbuaKbJKmUiF88Q8trRRrnmjlKMJ/KSO8RZp1YNn6Gqru6IGHeVL4+aoCaG+LifXmYMbJUrezde0dJ8Eq
X-Received: by 2002:a05:651c:10b0:b0:2ef:2e98:9718 with SMTP id 38308e7fff4ca-2f3aa1df0f0mr44207821fa.15.1723733528020;
        Thu, 15 Aug 2024 07:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723733528; cv=none;
        d=google.com; s=arc-20160816;
        b=CiA+8ezmf+ypsnCM44c+axe/TmXuA/oK3QRSmg03HVSVgK22NG89bGlX4gfZpMpd4k
         64J0b1/9xLm9GnJTRdJsaN6p2aQTyNoZxHyb/Iajh8JGckQGfEcffyf1MazAJ4qkWkId
         9frDlYUb+vlwNRuivlKzskrZhbEM0vQHJf2StEj26NTeIUB8WXvRRSAJEs+Vs+rnZtu2
         wXj/HzwjyfFuF5Wkwv3q580Xkycv/H+3BHaTFHwfS7bMrYNNBGcSdrZZFBWB+BFo+1MN
         VIZltF4OltVPlnSqLvCjMoKFLxrhinIDl83xa/RjkhQ1XXLvnsLQgNYnRVv5mggdYxJE
         CXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=Form3l+Y9Es8kJTAeBAesEFa2D4OSAQ1T21kXvuuHII=;
        fh=Yoo+Zgg63xOAdM5TKpa0q/JJAXEK0scLnwNyi2VhG1E=;
        b=GbwoRbmyLYpYEJQtv88ZYu3KTOi4aUIy+NUKBBXPX950+sYKYoRR7vykgOszgjlClW
         Jc1skn/ePJ1vm3E/BADquUI95rTAWE2iORggBqTIHn6jEBRkdw+4xFebsHP/eg0d7PMR
         nNAPNYqtAH0E24/TD+pcCAy+cqKWq3xz1B0IlWS1HvAFUTBnR3rjtSeuduuP2lw9XELD
         uzp9EWJIIhVWDk4cmadWz5QCQaAD3q8X/kMo74VTXsqd+hVfDaJhLJbbXnKIMrhIy6Vj
         6A4eGHVnwJqNUepO6VTpiDqTfceKP91LoJCzDZzaGM178w4SRj14H1QBch+XIrdDT4rJ
         NH1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m3JgatVs;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f3b7476e6dsor3335991fa.7.2024.08.15.07.52.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 07:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m3JgatVs;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723733527; x=1724338327; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Form3l+Y9Es8kJTAeBAesEFa2D4OSAQ1T21kXvuuHII=;
        b=m3JgatVsfoix0LiU2B06EL0Rg7tEw+jY58DjqhZWjlLjhCKW+cz0K4FhrxlgHJ0bg2
         xxYNYSSqSq1OGrTG3EWnoBG1snM+87q9CVU3+0TqK+kIP7dd9MxkvQLeYNQQPZn0a09f
         E5TU14IItLRz++sFZBD6SA7LZUeCKn8autM38dJc0Mpjg2fdkMRBKpygGtqVg4ZftciE
         SxWUEhtv9kt9qyY3x0+HJtUOQ379C3Rz31KLUmxI5pupCF+LlwxbnAZgbkydP0SmE8Wv
         CL237brP/ULWzEAVTztKXtcVHKsWkZE0FUc00d/TTs80r2vSxt05A/HlDrjpsZ1KJw9S
         eptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723733527; x=1724338327;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Form3l+Y9Es8kJTAeBAesEFa2D4OSAQ1T21kXvuuHII=;
        b=IPdHG6iDcX8yZd24IKETaiG5saALggmtZOgK/PR3pnbe9+Q48RB0uVuKR6hYkrIxc3
         0u2JgVjQjRLXDjcn69XUiM9LDQqnK9WWhrPnkbvPal5uCGFIOJqU1uyVv8/uboUu4/jl
         pDuGadIr+9Rd2QgXwYI8hFeCj2Z23gTSU/BbXNNLFQLAfjo/5HZx0eATCG2u/AWZhIAY
         Hmir+2k3yaeOOkPmRsfIHriPEBQA3Kzps5XrVk58xSENX+sxnda0BrjMDzJOCMNpy7fw
         cJrX2Y9TSLKpbPOBRsDIwUQvZz/6j5/XJBN3C6gskzE+lpU9DvEV47ilMtJWDtBVYBN6
         9Byg==
X-Forwarded-Encrypted: i=1; AJvYcCWQPC4217DryafaPVhLmcpfOkFaOy3abkzdgCoMd6ln0jllOSZXkyHjKh/qaZ8zERvGoZQVwdtmKQT5dJoHNFoEK38oQ217
X-Gm-Message-State: AOJu0YyclsFhH/qf8Guh3p3+eYLMcs9XNnfSjHicl1Tv2cks23NJr/+B
	JlTqfLk4CW0FRWmcx/8jkJfgle4b/MPXtJ1TRBNJIxZ8BJ/OafJmzVWmTW0TnYDLTQ==
X-Google-Smtp-Source: AGHT+IEPXQ+DX/0lApDeGM66C4oRZWsZ5dhhyURys8hul+nlJXTwp8dBKZ7MVald++CxDLA3pR5SzQ==
X-Received: by 2002:a2e:bd86:0:b0:2ef:2c3c:512a with SMTP id 38308e7fff4ca-2f3aa300b4cmr65909951fa.42.1723733527225;
        Thu, 15 Aug 2024 07:52:07 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c73e6sm114588666b.11.2024.08.15.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:52:06 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:50:35 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>, "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Junjie Mao <junjie.mao@intel.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
Bcc: 
Subject: Re: [PATCH v7 6/7] rust: add crate to expose bindings and interfaces
User-Agent: meli 0.8.7
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org> <20240815-rust-pl011-v7-6-975135e98831@linaro.org> <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
In-Reply-To: <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
Message-ID: <i9lat.di1u9m6k136b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: ZEV63bTvbOU1

On Thu, 15 Aug 2024 17:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Hi Manos,
>
>On 15/8/24 13:42, Manos Pitsidianakis wrote:
>> Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
>> provides some declaration macros for symbols visible to the rest of
>> QEMU.
>> 
>> Co-authored-by: Junjie Mao <junjie.mao@intel.com>
>> Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>   MAINTAINERS                       |   6 ++
>>   rust/meson.build                  |   9 +++
>>   rust/qemu-api/.gitignore          |   2 +
>>   rust/qemu-api/Cargo.lock          |   7 +++
>>   rust/qemu-api/Cargo.toml          |  23 +++++++
>>   rust/qemu-api/README.md           |  17 +++++
>>   rust/qemu-api/build.rs            |  13 ++++
>>   rust/qemu-api/meson.build         |  17 +++++
>>   rust/qemu-api/rustfmt.toml        |   1 +
>>   rust/qemu-api/src/bindings.rs     |   7 +++
>>   rust/qemu-api/src/definitions.rs  | 108 ++++++++++++++++++++++++++++++++
>>   rust/qemu-api/src/device_class.rs | 128 ++++++++++++++++++++++++++++++++++++++
>>   rust/qemu-api/src/lib.rs          | 100 +++++++++++++++++++++++++++++
>>   rust/qemu-api/src/tests.rs        |  48 ++++++++++++++
>>   rust/rustfmt.toml                 |   7 +++
>>   15 files changed, 493 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5464cb2b03..56a88048d2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3348,6 +3348,12 @@ F: hw/core/register.c
>>   F: include/hw/register.h
>>   F: include/hw/registerfields.h
>>   
>> +Rust
>> +M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> +S: Maintained
>> +F: rust/qemu-api
>> +F: rust/rustfmt.toml
>
>Few lines in docs/devel/rust.rst would be welcomed,

In another patch. There's so much to do!

>
>> diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
>> new file mode 100644
>> index 0000000000..51260cbe42
>> --- /dev/null
>> +++ b/rust/qemu-api/Cargo.toml
>> @@ -0,0 +1,23 @@
>> +[package]
>> +name = "qemu_api"
>> +version = "0.1.0"
>> +edition = "2021"
>
>> +license = "GPL-2.0 OR GPL-3.0-or-later"
>
>in particular explaining the license choice.
>
>Should all rust code use it?

It's an OR, so all rust code can use GPL-2.0 like the rest of QEMU.
