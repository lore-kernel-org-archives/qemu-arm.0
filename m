Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8350769njd;
        Thu, 10 Apr 2025 05:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCO4yZ5TTnmAuEk+n5IwRfrrVA69U8kvxHlQNJWdJxQcHlJv/E+7W9vB4/LkIu12pq3eAUe4MAWD1vTA==@linaro.org
X-Received: by 2002:a05:600c:4e89:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43f2d7e94d0mr24129115e9.19.1744287617626;
        Thu, 10 Apr 2025 05:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744287617; cv=none;
        d=google.com; s=arc-20240605;
        b=YwDt4bRw3v0jZp37EVXlxHahpno06zpFYq09dtp7YJhyEVX7aR6Vqf08R+1rXpTwf1
         OcPvh8B71iGW/m4Wvb0Baaa699Tx/sxY5w2XOtO8bSXZCiBkzTjfeAsAmVwW6I9LZQsp
         +L1hlc32m1HVQB9zCE8iLS60INy2ydhZM7LU5LPSI3oCQEc0oJs42Vxswf5DXH0UMOE9
         CQsSIBDeiTPDvryOBKALC8lfOhHTV2SxdeqviGNumnBRxcN7fnjuF6pMWxeyML6sbtCc
         E9NwqPg42BdRm773EpWvnD6mL0+HrWYtavnr/c7qcZWTULfxpDY/PM0/T/9OxeohE6Wl
         3Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NeXmhdndNS5u8yRWDs4JMcDjHxLBk6ghVK8IdZQ/fes=;
        fh=nQOzAZ7SpLM6+daNa1mPnhLvfLMLOFKzkJB4qUsZzn0=;
        b=UU7OGemYxvE4klqEh07H+NiJoWxXfWt7ROsM7wMmagFZ0zlff3fMgZvqzcEGd3ewUN
         UAxerehVpXEvJ33xnwrBKDR4nckysFg1VJSMOCLt6qvbxCEW2BX86JLAlFIMR3dhRMfm
         7mA6k4fBq1IEUM7uZsaebjy+A5oVvvJhpEAQSYy3dD3vQuZ8RN39LeWSbJeKiY7hkLeP
         0AGigUlG/HZ77jwu2X91EQSsYWQL/q/5OobiKdSYJiSc1qE4gSVos250iWQjA5YkoXgp
         UtamymmuFUEN6GCQOvdcUBzLBjTw83/BxSnMW4zNfXFTlknZ6q849YGGwjbNRjVTBa9u
         CvcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+K0E59S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f231314casor13666925e9.0.2025.04.10.05.20.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 05:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+K0E59S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744287617; x=1744892417; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeXmhdndNS5u8yRWDs4JMcDjHxLBk6ghVK8IdZQ/fes=;
        b=C+K0E59SYgzTHw8NJ7ueG03izKBB8gAswIhGu4VI76YIFBvw3i+9/ADFzJsgywQtA5
         GyWOltenbXukiGb6M/ZcX+eoyywuzsl9AYUJ0JrTzq1ffPU6VLNb7fZyK7FSYvXYyRg0
         Dd8QvvQ8sR4ifplp4NwvPjT9IN3mT4Xn5AfBlXj/Efb8A1P6/tLkyaLtDUeR29DCu2Ly
         qUlwUnW8I1mckLIK4gbuGrEw50IdYqWd9++2ZXAukEfRYhL+ra0j+IA8YTB7UDitXgij
         rpaXufQajrt4DtZ7YCzQF+HOWtGLdyDLaYc4/zV9myYjozNTpN4exqAqfFLeijhlyR4Q
         PHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287617; x=1744892417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeXmhdndNS5u8yRWDs4JMcDjHxLBk6ghVK8IdZQ/fes=;
        b=owRUXdp7wxhcLesicl/T2gMtzuHNBQH5y+D2g1ml2xXPZDbLU9wmKtoYVjUqJZYAiT
         0d+aOlp6m86PM67N+JOIx/nAlZVwqoT7u1BIlryy6JFuprg5KEiBO47wS5VdS30hJUbS
         7bS59AHsuazZwVi+EBNCnAohVJkPQgq3p+uohAdBgHdz4rAbpBSWXC82UCfWhvbzXqep
         XR/vAcsqR0jGsfKY80AjJ9V2ssrGTnJ0H/Fzys57JN1hAtH6/7wGltbQTjzmr4Du+h7W
         XUHVdTkVUPj6zFryIDHwsRNjsS5nTcLX/IbYPNSZ4swsjcuhtb0WN9pv1jVMyQvJlj+W
         HuPA==
X-Forwarded-Encrypted: i=1; AJvYcCUYPrnz/luo3ZS94bR03Xf4ghuh4TKw7mrGHOHYcAH2vAwSfFUdC0dV238Y2tO1Ys4Scq3LCJ/lGs16yA==@linaro.org
X-Gm-Message-State: AOJu0Yy/bGeAN6pQ+4/781DyG1VmbrAGlmfI02ao13wsFIXuVT5W+Hly
	S1XlncvsHJ3pvK+PE6TAXKZDaiIqc3NpV72YVkJrvKOrStItENK2iQZ22UHXU5vdsw==
X-Gm-Gg: ASbGncuG6tANyUO2oG8/yOj/j4Ai5a5GIKDnrkL2ZzrHZJkkMczZE4+/EoYDs41kHVk
	bABybeH4Z7s9d69w8M1+oqdCtkXneZvq4wKrql3iJEYXWYs5xU8DRUlZdwbIYVwfuZ5EkgCYs8H
	mUzAhWY/zxfRQX+uU1Zkyy9jxG+lk5TesKevaiS+pqFzAuEPNTTTteS/3Jf9gh3AQjwm7Se/ir/
	ratm7M3sLQ0srNO6v/ZDugq1cb1cCy3olgyT2YwJB/4rj6y0m0ztAXwsJi6a3h9SOTMwKbOISRk
	ZE5V1m317xF/1KHWjYxkYgckBf0RNRomrenWns7DTkqY6SgRPvjmv+QrK0zfbjLA/iQmxsTtoG+
	5GQpP4zCXLDn61087uXdO+3Dh
X-Google-Smtp-Source: AGHT+IH55o8dLQU5MWUF0LRk2DuEGnzgemlHs82ch0drklrhuC92n5F05vhxhB+eoJkqYoi47lNtLw==
X-Received: by 2002:a05:6000:2585:b0:39c:12ce:1054 with SMTP id ffacd0b85a97d-39d8f2735a4mr2219745f8f.8.1744287617072;
        Thu, 10 Apr 2025 05:20:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4583153f8f.91.2025.04.10.05.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:20:16 -0700 (PDT)
Message-ID: <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
Date: Thu, 10 Apr 2025 14:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250409192115.GA5528@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4xNS/Vb8SZjZ

On 9/4/25 21:21, Stefan Hajnoczi wrote:
> On Mon, Apr 07, 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:
>> This patch series enables QEMU's system emulator to run in a browser using
>> Emscripten.
>> It includes implementations and workarounds to address browser environment
>> limitations, as shown in the following.
> 
> I think it would be great to merge this even if there are limitations
> once code review comments have been addressed. Developing WebAssembly
> support in-tree is likely to allow this effort to develop further than
> if done in personal repos (and with significant efforts required to
> rebase the code periodically).
> 
>> # New TCG Backend for Browsers
>>
>> A new TCG backend translates IR instructions into Wasm instructions and runs
>> them using the browser's WebAssembly APIs (WebAssembly.Module and
>> WebAssembly.instantiate). To minimize compilation overhead and avoid hitting
>> the browser's limitation of the number of instances, this backend integrates
>> a forked TCI. TBs run on TCI by default, with frequently executed TBs
>> compiled into WebAssembly.
>>
>> # Workaround for Running 64-bit Guests
>>
>> The current implementation uses Wasm's 32-bit memory model, even though Wasm
>> supports 64-bit variables and instructions. This patch explores implementing
>> TCG 64-bit instructions while leveraging SoftMMU for address translation. To
>> enable 64-bit guest support in Wasm today, it was necessary to partially
>> revert recent changes that removed support for different pointer widths
>> between the host and guest (e.g., commits
>> a70af12addd9060fdf8f3dbd42b42e3072c3914f and
>> bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
>> Emscripten. While this serves as a temporary workaround, a long-term
>> solution could involve adopting Wasm's 64-bit memory model once it gains
>> broader support, as it is currently not widely adopted (e.g., unsupported by
>> Safari and libffi). Feedback and suggestions on this approach are welcome.

The biggest problem I'm seeing is we no longer support 64-bit guests on
32-bit hosts, and don't plan to revert that.
