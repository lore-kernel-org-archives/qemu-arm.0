Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1336137njb;
        Tue, 6 Aug 2024 12:30:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHnNlX90m5Xxkb3U9JM7GeXNCxbGFnlOtKuV6XJcECtpTI8IECf61rB7BXKy+fnz1VZXDN8v1lEM3qMMwFvyAK1FrxoLQ5
X-Received: by 2002:a2e:91d0:0:b0:2ef:1c0f:d490 with SMTP id 38308e7fff4ca-2f15ab0c2a1mr115196821fa.39.1722972629159;
        Tue, 06 Aug 2024 12:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722972629; cv=none;
        d=google.com; s=arc-20160816;
        b=IpibCk2l7Aka9+yEhI9wV93xu3FZ7qR2OFeZV8E6ZvnDlq0TDUbg+VFEgrJikPovGR
         JJ/bi+VMevJj0PTZdE2m6vmmtlTnA83SLtWOBn64wXUQc4ME/iAyORSBfiTe6XYqohpc
         Ceo4HQ+t7/Vp0zioJ9m3rUFiMDTdt8bL6ddVdZmvfouMkK/t2a7G/MlilLtSaHCGgikd
         WSXIZKYvSsw/5pxnFJ7bmGiNF4H9x1dn0TnsKlGxAGu2BnEG18WQYlRyyh2tkYFFZU/0
         lNkHWg0Rd7uVZUNuCR74ei5RR757QiQqhi0JOoJL1kj8vT+g2FdSe5mAtBEd9W5IQyIy
         zklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P76gTOzFzXU4EN8b7uHbluQmlo5oYvuNAX6IWkFa11Q=;
        fh=SWMa2F3lBw8R/N6gKTrqbQn7RFuTHPFdpLZlZqW32zA=;
        b=Agr3CJhzKWJbJ6Nu3pW20vl6h9CYQS1LPZ2v897b45ZN2tzSO6qQ/gyRpjUjJRipQp
         Ex+T6VAvwO9rkuBWHkvKU27jY+P7rcmyM/UiXDvanFt6QAJVtWbsSZqpBTlYUxRvYs4q
         qUg2XiNMeUKjQlR2rajf9yw35gSGr3UOLM+bWzZASS8X8USli5NdgngA2EpyXTkPJndB
         xANNyw5iYryTM8aFLf8VGr2ZJUB7CjzAjOIsy3lNUQeZ850lwPU2eKLZMFPX0nwqxCgC
         PjiYEskz1CJ+6A0tpahy4nPUwabBEueNUJF1yzltRiF0AxgOWe9u1BflxHMzgQe/n5Hs
         /mqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6n3QYK5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f15e212bb9sor24419671fa.13.2024.08.06.12.30.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 12:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6n3QYK5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722972628; x=1723577428; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P76gTOzFzXU4EN8b7uHbluQmlo5oYvuNAX6IWkFa11Q=;
        b=V6n3QYK5SKR2WIep4HWm4mEhZ+cx0/T4ifSWkAdgSov0Dc//QUNiL8vMwcYW7d8jty
         3b7oMjikSRRmkBaqL3i3FFfXJXrzaupIlA/jCWRUyArj0U4UHRMn9LzE+aTSB10NNY/7
         TBr9cjkz3U3hMHPwaVzU8Fv+PdPLlZhX1WL8pfHZ0ihwY1PAGCvtHr9Els6Tod+J6QEI
         ynCEvywa4u59gZsYlTv6fRkZDp74zPdDUWSY+yITk4M56U2SzYNAqweqw/+ETT1TfJeW
         +vh1OZDgBQ6gRATZRbrkzcANanxGc/qkma1/1laPxv4sNPUCF/r88CikouvTtEUBO3N3
         ve8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722972628; x=1723577428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P76gTOzFzXU4EN8b7uHbluQmlo5oYvuNAX6IWkFa11Q=;
        b=vhF1dGjb+zuj1bj/Kk5je+/hC3tMHt3qyVp8XegcCNfjnbEAxGLUj5jz0d3FDVulf8
         jCkMgnnMnyzvBJgaMDAZOsj47Tx43XYCD2Zc2TpQy8N/QOficEb24jN5gNUvMmp665Sx
         YBc96YidF+eH10xT4GgPrNmsy/imVrwVyUsCMHQVarChR2uAaLy4WUvSmRXXrkq1W7hd
         jzuUuIObtB2u9//eWGs6wWvFAljP0Ta5NzpOplyD7JCKx7pyVedIRCdyrqX2V0Dll6gU
         tbfUr4e1a550mbs+75lQV6YwSSQdJsYZgr9gLIXq+Ce7wM3AvUAIIMki99B4MXLLGxYi
         bEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Sxq8N1arw7lUdml5II04UlodxKM9IkXaYfmBCcjteoboouL8ggp1RS+I3s629zZvrmvwU85pFzu5p5sH9sxN2ZN/FB2y
X-Gm-Message-State: AOJu0YxiyM8Twyu4LmG4xYCwxw2AxRdUO3zGZKqVPiJx/RGltTPaOUJV
	dYH5GfRFmQFxPkjV3JBAWer4zOqQ5TpPmaPXiL0Ji4/CrPX5ab6OZrIPv0s5OnZxOQ==
X-Google-Smtp-Source: AGHT+IEr8TsGyQqAdDFzXKk6b+H4wmROdXIZsZxEzGySz0nVAFbPsUXyNA9aBvNixrGUipAd/jr1vQ==
X-Received: by 2002:a2e:96d1:0:b0:2ef:208f:9ec0 with SMTP id 38308e7fff4ca-2f15aa92e12mr116284951fa.14.1722972628189;
        Tue, 06 Aug 2024 12:30:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-141.dsl.sta.abo.bbox.fr. [176.184.43.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e01d0asm188941585e9.16.2024.08.06.12.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 12:30:27 -0700 (PDT)
Message-ID: <fff8c0f4-881a-4317-857a-0d20a72484eb@linaro.org>
Date: Tue, 6 Aug 2024 21:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] tests/avocado/machine_aarch64_sbsaref.py: allow
 for rw usage of image
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-9-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240806173119.582857-9-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7wEZKJLdaeGH

On 6/8/24 19:31, Cleber Rosa wrote:
> When the OpenBSD based tests are run in parallel, the previously
> single instance of the image would become corrupt.  Let's give each
> test its own snapshot.
>

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 756f316ac9..f8bf40c192 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -190,7 +190,7 @@ def boot_openbsd73(self, cpu):
>               "-cpu",
>               cpu,
>               "-drive",
> -            f"file={img_path},format=raw",
> +            f"file={img_path},format=raw,snapshot=on",
>           )
>   
>           self.vm.launch()
