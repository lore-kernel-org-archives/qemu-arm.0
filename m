Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1088945ejb;
        Fri, 15 Sep 2023 02:18:48 -0700 (PDT)
X-Received: by 2002:a17:906:3102:b0:99c:e38d:e484 with SMTP id 2-20020a170906310200b0099ce38de484mr888921ejx.6.1694769528271;
        Fri, 15 Sep 2023 02:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694769528; cv=none;
        d=google.com; s=arc-20160816;
        b=c2hqCgYcJw7VImswWaW5JyGQYG9IG2y0Kh32RkCwcDZOxTX7sM7/D0hdBcPI1ynYwv
         ghCNEYJ6GY3j2NYpUU5Vf6qMDcW1Z6mco0LyzUM+3iFpMIx8QW3VbpxRQZ31t6ZQhjgM
         did38cp9wzzHTTL077fpDfxfftrBYhOE4/MMmR9MNm5AxamrAsE7IANr3EjfGNijx9LU
         WsMKvxxph6BdUdbQOg04w9z4irpNSNcczfqtLWUgSZUkSo1kQ5zhZQmDhmm46MNp1LOj
         fkUogUnf7ZhBfgRW8atcXGnT+9vOe1kU8PiXDEXy1A7SnMEToi0fnprqQNYGQjA+LDgQ
         YDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=23uIT8W8uz5jxSR0khjdYCUNZy/RMRiv3Wkg9Mr5TZU=;
        fh=Dywkr1pmJgt3LJwhEUYYUg9RZ8OGOJmVSzfIOjmigvo=;
        b=X74U4+wJX2/LR6sW4GPFAc5leDMU6s0u3+dSvM7taVVSI2P9omFOkOlGLXKTf6Ouxv
         A9H1c0PmzWCgp5XvCImQN6hV3VvnoIxVVDMAI9Zr+ko4GXoTSI3COQTwL7OyCVBvAYHt
         skQeFmWGl4gwP4tiKaP3u+J1Iv+sDgSNuQok/puWCuc3equ6et5WNjIoL0de2ahzeYiD
         U75UtORN3T3eseDGL9YrgHExH8HSpFgn+OBycpxO90YJ5YqimHxNJjDAqdbH+BJibedA
         D2jGJg3hlD3b7lP8hCINvrBMTUsm7lWNLoaN3Q28qxzhlNQV5VsjHVX5afr4kO6czjGK
         kUhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOmx4fit;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hy4-20020a1709068a6400b009adae26553dsor1060790ejc.17.2023.09.15.02.18.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 02:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOmx4fit;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769527; x=1695374327; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23uIT8W8uz5jxSR0khjdYCUNZy/RMRiv3Wkg9Mr5TZU=;
        b=iOmx4fitMY0Y7DfKu/t/w0sr1ojaNQ03WbPaIGuMukpInXWrnN/2YsO6Z5dbl5lEvk
         +FgHqJVh38qjNXP0e/mRGLyI8ezSSz+J2W59qUBc0QcjlvmsXCQgEGaZAr1ZcfQ5a7/n
         tlisIGM/gT8Bbgl3V3ydEw1U7TVUxAQbpNd5WzLtOJ/3TBCTR6cHPmUpYk8g02hs4N1C
         YBqI43oKWdSeZMWIQdGu1TRZfnkPVyQhz9+JyCd4kBOIzfYaWSrBcgVxAhxMCrh54Y5w
         SNOjDS2RiUAi4RBV/Fteo9gUnl5LRN7Q3v4a94zQkN3SstoZpONaMjqxZnRnygKSvjXe
         RprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769527; x=1695374327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23uIT8W8uz5jxSR0khjdYCUNZy/RMRiv3Wkg9Mr5TZU=;
        b=bTiQBbwshg/lA8H1ueD5c78pF/TVaDFi/9OPJOY1zp3m974vnZU19J+i6WRocGm+f7
         l0Px04e+jypX4D2r6dOlHkZ5W/n0iL7IrocOTcM+ERVCFBVreYaJEBI+PY/uuFK99KFg
         2irKlo7c8rOhK5+zhSkfJPTkqCxwXWmrpkK+WNpeyAj7nBqF7m1s66Vv6bv1QtpImdRt
         Lucv5t8cJrIsaTI6hSiB0B7rzYgtF01tMKBWQj4cCFC1MYSFxX9h4Bthe4BAR/yZDonZ
         7OSj6Os1tInk2Du0jbTWFaPPvo+hmGPdPeRL41ouL7QG4+1NR0HAmQvOSRrY2h6LcEdQ
         wTzw==
X-Gm-Message-State: AOJu0YySeTLma1qcv/9OC91Le+mIuQ/5ORxYwQWePdQKe+SbK28Q5Cme
	nwQ+r59RQtIK0AaLhAXN3Uu8T/Zr6v6P0lFt8Xye3w==
X-Google-Smtp-Source: AGHT+IFSpfNOukyLFgAUTdF79yBuXLFCtOK9mSF6vHYGWb8n8YmkxuFdgEH3v5OVNE1DTldR0/5LXA==
X-Received: by 2002:a17:906:329a:b0:9a5:ceab:f496 with SMTP id 26-20020a170906329a00b009a5ceabf496mr959382ejw.58.1694769527698;
        Fri, 15 Sep 2023 02:18:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr. [176.131.223.129])
        by smtp.gmail.com with ESMTPSA id bj26-20020a170906b05a00b00997e99a662bsm2108518ejb.20.2023.09.15.02.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:18:47 -0700 (PDT)
Message-ID: <8b0686f0-9f36-1647-ec6a-e65a4389a852@linaro.org>
Date: Fri, 15 Sep 2023 11:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 8/9] tests/avocado: Fix console data loss
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914155422.426639-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RkrjxRTNM5ii

On 14/9/23 17:54, Alex Bennée wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> Occasionally some avocado tests will fail waiting for console line
> despite the machine running correctly. Console data goes missing, as can
> be seen in the console log. This is due to _console_interaction calling
> makefile() on the console socket each time it is invoked, which must be
> losing old buffer contents when going out of scope.
> 
> It is not enough to makefile() with buffered=0. That helps significantly
> but data loss is still possible. My guess is that readline() has a line
> buffer even when the file is in unbuffered mode, that can eat data.
> 
> Fix this by providing a console file that persists for the life of the
> console.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: "Daniel P. Berrangé" <berrange@redhat.com>
> Message-Id: <20230912131340.405619-1-npiggin@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   python/qemu/machine/machine.py         | 19 +++++++++++++++++++
>   tests/avocado/avocado_qemu/__init__.py |  2 +-
>   2 files changed, 20 insertions(+), 1 deletion(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(this patch also had)
Acked-by: John Snow <jsnow@redhat.com>
