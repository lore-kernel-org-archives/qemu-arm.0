Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2202930njb;
        Mon, 7 Oct 2024 14:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjiDzC4dxMZaeg7eTylVFgsRk0XQfnYpjGk5ErWuG82EegXnkSMd9HFgx+OClfVAbPFOLe1VPgEPu4YQ==@linaro.org
X-Received: by 2002:a05:6a21:3a85:b0:1d6:de17:63bf with SMTP id adf61e73a8af0-1d6dfa2440cmr18298179637.2.1728336445052;
        Mon, 07 Oct 2024 14:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336445; cv=none;
        d=google.com; s=arc-20240605;
        b=T0xjNqiI0ov7CuIF4D2TiXagSMCwMsI0NlxQM4IfF7EAozKCa4ms5DUZbEVWD4cUeF
         zE1sDpqGsUYw4rV8hZTWzkwu9Rbba2JdIYhDwi96Z2GmLjWGX+SKgWLLnK8LfrFQNzXE
         3aa0uuyy03W8lIp4XMBTkdpJTXSRVviS0aeBe8i14TrLZnBe2o6U6Xy5ZdCwfgCFEl9L
         tQIi2bS7gVMRFh5bPQUn5RVKCZS77fUw7nxZNS9YXh4IUQ4cDV6NYbXTRE9o3XWfhkIz
         N7PTf4kai7WzIyQEEImdYo65ei/XRfhdaITruWlOraYOxszxb2//YUQRmLvskfc3AMl4
         4biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CqgDnhxYcJfnpmb7/gzzhepYKSy48HDyjJmQSXhkl3Q=;
        fh=ZNUPdOyQRxmqRRnBmQ+t650EwGwFRs86A0hhcix7XYA=;
        b=Rcmzq2zFhEOltBOI7+p1LmOW8Ko23ttPbTzHfYZKoLZnvFGlAdiJpi36pxyunX4q9r
         eUi3IFi2nFRCrqtOuJ82BgJzeMKOe6sSfGCuqArHi/qxjN8zsTXDHpBCDzlVy9WSzvUb
         ymBEle8yg6Pf2vRu3QLnReakdTYxiwN2RpLkxgFK+d4uoMdK6dQf/Jy6QNI/TB3PF8ie
         Fbu7FdVgVI64pmYOViULGakw9yJpeCvHTQCpIG2BgH9YnWq1moI8SP+Klox6RMWGMj4j
         n/lSqPvW1TUu97bj6tGl1hN01blyoKttYfsk7oSz3AcTMBw4e+JmGphXvs2gO4q0tDsb
         T7Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sz/3Jh+9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71df0cd4ffasor2999942b3a.2.2024.10.07.14.27.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sz/3Jh+9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336444; x=1728941244; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqgDnhxYcJfnpmb7/gzzhepYKSy48HDyjJmQSXhkl3Q=;
        b=sz/3Jh+9Qwfia5ZmImEhHTKRnYbOSISFipbcScD9oyo2+cUPzI5Bk6PaLMOaljnYQR
         Sk/0SesFZyLwJdqUJQMGYLUMU99ZvIb2G+AsMWCyXVHu5ooCOTxQsZ466rWXC/VkvHgm
         g23DvKKlcUoFnNHZ8KXdQCkfKgYD7Ho5vKwshoqljXWmHfTSHAp6ZP+a108Q4/VG4gpl
         l92H4DHDcREzyeF0Fluq7Cw7SSyv19i+T8wM4S+5GuI7d3NkiFUkz9UMHVidRP5RTSjz
         n8wO1JxQodCBIa5RgCGcxpRQPHAn/TVzs0SrLYBxiUZA+g8JuFis8bTggtrTcQKXTbnB
         9T5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336444; x=1728941244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqgDnhxYcJfnpmb7/gzzhepYKSy48HDyjJmQSXhkl3Q=;
        b=c/rupwZX7lLgZ/r45Jx0f1AnaVJc0pMvLbpICk7nWqSN78p5ChRqSthUgRAIQahpiK
         qZUtPzswv6/YMcU3yQplZjiqhaYTlrU3NDlsLVqdQTlYoSUA3BnQE051gFBDtUovemDj
         61Yo0oxqayxK2gNH+ohQ/nIhHok5lxv/KRYfmiaXBE2rZLJNd2KqfYwprqwqHnt47jSP
         Mondc25UdmKfKNGAY1j11i2HI3PEskAIiAuXaZHOIjRoE2mQiSp72iIkKqhNDJy1fD5S
         iNMpF8gzF9rJLjsBN7zNgdQHb6bYTlcoLzGJ+6uvucSfZ7LuoDN3+W1n0A0/awhZ9a2O
         +nGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnXFleok+e6zR30XltJFERoxPfsJBHsZ76R5Ux5aJvz0pKwGGr6bIM6xg8NLxthCkItlyVrdF25ZoWAQ==@linaro.org
X-Gm-Message-State: AOJu0Yzcp/B3mKaFBtYsnTWcpLddNIpMi/W1bjuP3z9UPpafaLV3i/eO
	kiMU3T+P67Aoe+ZJxSH2qBD41jtF0KUwLPxiw0PUPZy4bEktc8yJuRQewpbeW/1Vw2veK4zYCGI
	8SGA=
X-Google-Smtp-Source: AGHT+IFUSSiKDp/IPG9C3v8HSFzU/o5Dij/QuIbYEIpT+b52zosK/b8fiUgzmvLLH64t7gKuN+CCOA==
X-Received: by 2002:a05:6a00:391b:b0:718:e062:bd7e with SMTP id d2e1a72fcca58-71de24600e1mr20318300b3a.24.1728336444536;
        Mon, 07 Oct 2024 14:27:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccea54sm4890081b3a.68.2024.10.07.14.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:27:24 -0700 (PDT)
Message-ID: <a3f85304-e14e-42d0-b913-f551702ea6db@linaro.org>
Date: Mon, 7 Oct 2024 18:27:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] target/hppa: Add MemOp argument to
 hppa_get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-9-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fHcr6B56+NhQ

On 5/10/24 12:25, Richard Henderson wrote:
> Just add the argument, unused at this point.
> Zero is the safe do-nothing value for all callers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/cpu.h        | 2 +-
>   target/hppa/int_helper.c | 2 +-
>   target/hppa/mem_helper.c | 9 +++++----
>   target/hppa/op_helper.c  | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
