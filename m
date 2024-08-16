Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1128768njf;
        Fri, 16 Aug 2024 01:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGMCeRHNj3m0RJkaYZmbBmnTvOmcoEDaunu7MTAGH8z6sXC8osQrcplEyJKsJM57pZq+DbJTurxVAV6rv/6TNg5CNIKy7Y
X-Received: by 2002:a05:600c:450c:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-429e232b8a0mr40821505e9.6.1723797272496;
        Fri, 16 Aug 2024 01:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723797272; cv=none;
        d=google.com; s=arc-20160816;
        b=y4/Peb10ie0HAc7gRlEHX4GULRlmUqoKrXrIDXm3n+YxoJtPaB7j6uRLneRfOfQs7b
         fQbVcCM6GbEKnVPPwmqVv0J8S1Ia/gS5clJcpnpfzeE051kL4Gn641Fv9FC4jHzRAL1/
         W+mA5Rcg9yiPXrHYStywQ3TNQJWVLlPz73Ts3T3k9abX//rpAnX6YJpP5z2LD4D3ujLt
         SP7/Rcvvmuy/usb8Nx4sQB0oqxxm8SJzuXtCWM3OFNFc78YtdaKByHKQ3NBTNe7wMj9e
         ljQ78otEVTnsK6SbiLmVEJCDHyRlBZUQv3PVdUVfTx5r9rTrciJScBotbVeH/WUBKCN+
         PeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rcdVqiOHn2SOCfjcoFBldMGuyRVl6Cw86IDGdXt6peM=;
        fh=t1tYOmWquNcE+LDCKazS44yo3Mrt35dbiD3dTsF9L0w=;
        b=eZsVeiuCdv/R8O5W0VuNgkWFkCMgeE3yjG6LMd4gxpw4oq7cbVs2uGhzBjiwS5Cd+x
         fVQDqEX6o2N60QMHa3+ceXij2g47wlf11+9Ul+BwWtM7zP+C0is6BodVnTfb5F4y3uOY
         9dJIih7ltWuKkBy0VyFivHvqzdEFJYONsThjcsq+T/WXo9YQNhQjFdyCXckZGkd0W7MY
         8qOw1KyjcBfqS0qDjGUJcx+7OL7FUFm78i+g7hI56+rT+Pxs4K55O87gCDL9VhA7SK1I
         iB5gbY+w9AS8hHpLppH/hOzeyG3elprdEmaDAsJ6qzowiJniNLtCnwgtnlj8CvJNUrsf
         I8Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMw6mV+4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429ded17f8bsor14315855e9.1.2024.08.16.01.34.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Aug 2024 01:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMw6mV+4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723797272; x=1724402072; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcdVqiOHn2SOCfjcoFBldMGuyRVl6Cw86IDGdXt6peM=;
        b=KMw6mV+4Y1ApVY1ppgPEgeSiV1uv0MWSCcwmdTQnFSqL+QYERgm9Q4iOVe7PjIZLG9
         +QJE2X/FjN+KOwdjEFpTiaFE9SoSLMKTtpgmgJgWvPZJ49zfuWKtEoBt0/FqKTafjI5l
         tucdTnLfvZzbb5d9vhXy+8S07KF1Ke34dTRWzOl9kSPSuNxYyFkUXnPmC6SD7ka5lDhZ
         VgPom4z4RFls2Pj8l/rlYzgFHK4rt4335CpaSyyEebHJidj7oXpqUxdXU4YctjZHl8cE
         uI27+kW/UdaxlWctNeczU/NXBuuWIds10dLiDzCNb7Gz7LbZj25qJhDJ/RA5QNgqShhR
         80gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797272; x=1724402072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcdVqiOHn2SOCfjcoFBldMGuyRVl6Cw86IDGdXt6peM=;
        b=w4IRoleh6hUMH7r9/syl9RvYeGAqV9aIpTOtrPA5x1d0GV6QwmUB5C2AyfeDH4oOO9
         r6PxBb0YRhdw9GxFIgu3dThpos+OXVm66DDCbBgazyZe8NpIyJjT+qM0bs7rVtayI+ki
         Y3MrAwGWAps/oQLJyPzVCfOrBg2r5V2WuaQtqKR6vRwhW9T5hFFQgZQ1w52ZQ15+zr+E
         heEtsA9ChtpOSNNyFOoR82rrgkS4NW1UI/KYjtJ1wTQSSHyCMAZmIYjiV56Ih9iYuHFN
         5KX1KFSrzvdPyfQ1w0WVnH6BAm3SgnJwJmlMxP7BAeiz3OSwM207Rvj4uLGB7I3L+CUl
         qhHg==
X-Forwarded-Encrypted: i=1; AJvYcCVPV+yrgjMAkt6bbKGLRg/t727wi/GVXeoqL6TsHAEYnr4Fqw6ahOaCrsA0/T5r5uxzeisYNLrExT7Ak+FI4No3X+0gPMIO
X-Gm-Message-State: AOJu0YwoG84IfuyZ+f6yWtqHa/KSZba5DnEV3z/e2Em0q3CictT4a2ob
	zUICQtiHSfz5np5VI6WtG3KvRzq/CBAjRLoQ1+k+M6IFNfrlAtoR3UTSVDwYlSf1Fw==
X-Google-Smtp-Source: AGHT+IFShy4jd5WRvAhSKtqzWxwMatyTL980wx7NZ1fvES5RCsQmd++fHQBzYM9IFJt35z65kOfN3w==
X-Received: by 2002:adf:e6c3:0:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-37186d740a7mr4078144f8f.21.1723797271841;
        Fri, 16 Aug 2024 01:34:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.220.175] (143.red-88-28-5.dynamicip.rima-tde.net. [88.28.5.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ed8sm70447235e9.31.2024.08.16.01.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:34:31 -0700 (PDT)
Message-ID: <6f009629-fbad-4868-bc12-21a18de379b5@linaro.org>
Date: Fri, 16 Aug 2024 10:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] rust: add crate to expose bindings and interfaces
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
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
 <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
 <Zr4ZbOHR9Sc10YSX@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Zr4ZbOHR9Sc10YSX@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xLadaIzhQa2e

On 15/8/24 17:06, Daniel P. Berrangé wrote:
> On Thu, Aug 15, 2024 at 04:01:17PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi Manos,
>>
>> On 15/8/24 13:42, Manos Pitsidianakis wrote:
>>> Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
>>> provides some declaration macros for symbols visible to the rest of
>>> QEMU.
>>>
>>> Co-authored-by: Junjie Mao <junjie.mao@intel.com>
>>> Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> ---
>>>    MAINTAINERS                       |   6 ++
>>>    rust/meson.build                  |   9 +++
>>>    rust/qemu-api/.gitignore          |   2 +
>>>    rust/qemu-api/Cargo.lock          |   7 +++
>>>    rust/qemu-api/Cargo.toml          |  23 +++++++
>>>    rust/qemu-api/README.md           |  17 +++++
>>>    rust/qemu-api/build.rs            |  13 ++++
>>>    rust/qemu-api/meson.build         |  17 +++++
>>>    rust/qemu-api/rustfmt.toml        |   1 +
>>>    rust/qemu-api/src/bindings.rs     |   7 +++
>>>    rust/qemu-api/src/definitions.rs  | 108 ++++++++++++++++++++++++++++++++
>>>    rust/qemu-api/src/device_class.rs | 128 ++++++++++++++++++++++++++++++++++++++
>>>    rust/qemu-api/src/lib.rs          | 100 +++++++++++++++++++++++++++++
>>>    rust/qemu-api/src/tests.rs        |  48 ++++++++++++++
>>>    rust/rustfmt.toml                 |   7 +++
>>>    15 files changed, 493 insertions(+)
> 
>>> diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
>>> new file mode 100644
>>> index 0000000000..51260cbe42
>>> --- /dev/null
>>> +++ b/rust/qemu-api/Cargo.toml
>>> @@ -0,0 +1,23 @@
>>> +[package]
>>> +name = "qemu_api"
>>> +version = "0.1.0"
>>> +edition = "2021"
>>
>>> +license = "GPL-2.0 OR GPL-3.0-or-later"
>>
>> in particular explaining the license choice.
> 
> Semantically this is an overly verbose way of saying
> "GPL-2.0-or-later", so just simplify this.

Indeed. Manos, please use GPL-2.0-or-later to keep it simple.

> 
>> Should all rust code use it?
> 
> GPL-2.0-or-later is what we expect all new QEMU contributions to be
> licensed as, regardless of language[1], so this looks desirable.

Agreed.

> 
> With regards,
> Daniel
> 
> [1] unless they're derived from one of the few pieces of code under
>      different terms
