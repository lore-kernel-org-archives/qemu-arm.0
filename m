Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36654njj;
        Mon, 28 Oct 2024 23:10:45 -0700 (PDT)
X-Received: by 2002:adf:e54e:0:b0:37d:39ff:a9cf with SMTP id ffacd0b85a97d-38159d5cfadmr589000f8f.5.1730182245488;
        Mon, 28 Oct 2024 23:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182245; cv=none;
        d=google.com; s=arc-20240605;
        b=SSoW93smySUhZPPp8jLfvl9oOAipexMK/V2LuMDTJZg4B4w7jHGfxsQ0pXma+YMgGU
         mvv4xtZGxf5XUYVA7R/H1ZYQJBCkgALay7ot0mDd9HZbB25SWNIqUhhJ34iKW+YKMYdw
         gR4Q2gLC+nZaBCgOYfN0RHYKcfXmckI63VJ3X0JJdRIXMFnogGi0xzdK4furHGq5kjOk
         v5lGhDEq8Ad0n+H4MT180/ZGfNOYNZfeJIR59YBM4hPFmMv5lCxcFJv7ceUQ+oX3GqlT
         ZI5CozGBs/lpLjjeKE+Z+GhH65As9hG/dIkSNThjUymtYAfHHrQ2X0500stPSqQMsLSx
         IdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pTbswlSQFh+U2AURAZypMjlWl7wz00C7z2XO17y4wQI=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=NxggBEctAqsiUnXltEaNUj26LS5Y2QIlA7VO5KBZEat8MvQTFh7mGhxVgPU+SRG7Kc
         vVP49YVYpLAuT5OAXEeDEcNTZD5MMKCCTGlI2JMMG+q/HBE8xI7T5G+F1MIuFptbOYQ8
         A9IpZO79HavZwlJXMXvCe0dpEXOPUcETx7+TZDWpDu22yOSbjsBwy6xLzfhcZpfa4786
         Wp4PMbwH0MC4RCGzYkakd+1qzSlrzBXsrxUA49auuM1lbDKGL1xpzcxZHYWfs9K4XqVz
         iuN4jlEQFsN6vuw+407feFLcjCtuDTrS9+hFV2uNqtsJ+8Pv7KntoyAbOvpbrZhebpKi
         dJ0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qk6mQWqO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-380586dca9csor2315886f8f.1.2024.10.28.23.10.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qk6mQWqO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182245; x=1730787045; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTbswlSQFh+U2AURAZypMjlWl7wz00C7z2XO17y4wQI=;
        b=Qk6mQWqOFGWWAto4TSaJfipTG31iJW19zIgAnYXAYjDZD691e/bgSeGxVK0Z2Tfoyn
         SfJLUgUVal+Q9mtwYRv58LjTeraEGwG0cy7zh+tOItI75ugmqUB3qcdFXYrKCEfHgQog
         zKWttCO78pn2cg/5t+FDmPBfUwg9EiduezJeLOxVVtHURwS0Hb51NE8GrNIyb24EyWJc
         Q6v9F91IUs+GQD1D1M/L8Pp210BoQIUhmvtFjtTWB/Rfh0YVY3aEqMaHJJp1fg9f7r7a
         X9YxTQ4t1MW8UKbkLChSSGetLUyH+GUeRItuAuHY2eh9jXYpk3fR95wgdNhvkeWMKZKP
         HywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182245; x=1730787045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTbswlSQFh+U2AURAZypMjlWl7wz00C7z2XO17y4wQI=;
        b=wnRFpoIR4eI9v1G2I/5FiV3Qgf7THk8cMjzVe3MXSIR1y4EdVrgIGLfZ3vsQRtZCQC
         +YKaYwe+5csVfaW21dbPftKlNCb5EG08XFwp8nj33LJV3CFvhBF3SM04FZU2kQWbGJ/x
         iYPkEKv0u8OL92QTdr9gmYbB8hF1AtJl7S2OqwrQYuUaheyzb+BZNazmnddhdTF6aXVv
         Gh/D6CBnpO1FWSuHZ7rjazjLvIVeEedZ/nsK6JTqlaEfD+hIqE7RMqvRbsKjXWoUST3o
         qHpsjFU2+4z/u3xAF36Uq3+uIvzQOAjvURnzb07G4mImto5xPR9sKJo96aUcEvhaEsSR
         yY7A==
X-Gm-Message-State: AOJu0YyKhx1G2YT6nHgz0pP19+RVyRiNVT9DXHZnEBvPGn3HtfNr0DNW
	xXcLGI3v+rvJevFW2NLOPzKSqXB3RFzmvglHQ9Zq3Pv/aT3jnh0enKkrKftvfRJ1Rw==
X-Google-Smtp-Source: AGHT+IH9e9XRp6y+3x71gAkSy8Jn7oqtD9EJ4sg+Lxm+8+GQfFl/L8u2D5umxmh3JQRYkVlpOrtwPQ==
X-Received: by 2002:adf:ed88:0:b0:37d:460d:2d07 with SMTP id ffacd0b85a97d-38159d75937mr607201f8f.10.1730182244958;
        Mon, 28 Oct 2024 23:10:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f5e1sm165298915e9.14.2024.10.28.23.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:44 -0700 (PDT)
Message-ID: <631ea605-f89e-428b-aba0-93e3895f2ddb@linaro.org>
Date: Mon, 28 Oct 2024 12:18:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] target/m68k: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-10-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qfS2RWQIqPr5

On 10/25/24 15:12, Peter Maydell wrote:
> Explicitly set the 2-NaN propagation rule on env->fp_status
> and on the temporary fp_status that we use in frem (since
> we pass that to a division operation function).
> ---
>   target/m68k/cpu.c              | 16 ++++++++++++++++
>   target/m68k/fpu_helper.c       |  1 +
>   fpu/softfloat-specialize.c.inc | 19 +------------------
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
