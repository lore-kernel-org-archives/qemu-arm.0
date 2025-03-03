Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2579983njb;
        Mon, 3 Mar 2025 04:38:52 -0800 (PST)
X-Received: by 2002:a05:600c:a03:b0:43b:a397:345f with SMTP id 5b1f17b1804b1-43bad820605mr112920615e9.11.1741005531939;
        Mon, 03 Mar 2025 04:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741005531; cv=none;
        d=google.com; s=arc-20240605;
        b=NYkurwy1FoZF8wua6eoZrRpYhU285gARvhJJ5RjMaMXIkGet/Eyem4VCnNlKCJLJ2s
         hW2NIwZ6UbYzsowBcjiUxI333MeNUxSrSgfBpzdgx2DX2p1MHqNAyk+yUd7VoqclT/5+
         WQuYY/R2NyByMB14F4Rnjo6+Z2dR8SElIfMLMsAz0skrs/hsqz7gj5Olh039V5Qvajf0
         LZatLIbr4YATlCjOvrmgjKnC1aSalanimwS3XldKtIRO7la1Q+VZjKDdXtJWeJiKr/fZ
         GtO6L3Hi9i5pGQfvsECjlUr15GBODbXX0p4xs1vfzRhy4cwyETvms6b4MVstWNf47CHm
         P5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=F4UYeXdqwyctSY62KBMASteRGUXei+yMQov4/X3UKu0=;
        fh=34addhkuFBqy3I0lXXE3v7jLOOq8J0kcFiPwDHJtyDk=;
        b=hRQ3GbKRrzzNXaauw4etCqBdIiL+I/kbZgphTgRQkcpCAhC3nZZr/Cj5VJ6m6g+jmL
         bPhHCgHPNLEr2ArW05Y6MKDI0aX4HCaUQKUICyvK7mME0lSpflmQzpPqBDtjXQFSipY8
         bgcpDtG7Tcleoo0DTd2iG364K6u912MvT2QINVKm7TeXi0ZuY0W4TnOMMA7x7F6YD9oD
         nPde/hHOGkgCqpw2unp89QG/IOloQ1nbHeaQ00pqxU8cRsEJfOENzyOUHRg7pUeTKDQ0
         2O1jthfW2Yr/nP2ccLH5wbRvbJZGOjwFztKoBNdlFBEtMCx+8Y4t33RhUFkh1a2UeMJs
         V/+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1e71gJA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bc2bf0024sor8367115e9.5.2025.03.03.04.38.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Mar 2025 04:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1e71gJA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741005531; x=1741610331; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4UYeXdqwyctSY62KBMASteRGUXei+yMQov4/X3UKu0=;
        b=Z1e71gJAFcj105sppL20jbT3uGg9k4Uj+QpQefpToyy9/vMu0Cb8l6uqusAdFkm/gB
         KG7bRySf//70z0nbzpwetK5mGJb114Iz90Nl/cLPrJBeon5Df+v/V/+tsVfd8B7JAQoI
         GYusYlToByjzVI0l7Pwmp2MiqROdds10tbmNROCPPkVKLyDEBTIA4c3WMuqvIA9fftwI
         OWlimcw1CxiiSyuDTtZ6Ps8p+qddXG93mByJQsSTxcgIYS7SKrbyDKeMKc6nARuLa0Ar
         HWxTxS7k7hbEiaSkp9z6WXIUXJVWpOrmGBetmmnT6VsuBRQ7K+Agrt2rGaipKa6IWE+A
         tXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741005531; x=1741610331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4UYeXdqwyctSY62KBMASteRGUXei+yMQov4/X3UKu0=;
        b=my16l2uNOvQ/g/dReTYl7HNuPPdIcewJxOAiOtQhhL6mGYmq+G/4w6VPM1L1ERg3YC
         A8O/dz+dml0JmFdY7D2qdDy9d/NGg8eH+JZ/EgF07iaRwbcAl09xAEQoP9vF/2JUGqPz
         Px6LwzByas+Zfg5Oi4zEXlaoDi/J/x9+eWwIPXEXxblrBhPFhGnEp5pV3yJU8/MPQg4N
         zKIBjMS5u7qZbQq2hvHBeEYluRQJn79KLr+eb2zevPmdH087BEY9QtNS9UJEJPnjXVts
         vsuZjPXg0goOWa2g7d1r72ZcCKCRtOyi5vhKPvrfN2DnbomaIbyawi3FeFQV77OAwrdC
         2YJA==
X-Gm-Message-State: AOJu0YzemC/6Yf3FwiSmM8FOGryynuQwq7HfKburRm7K5+kwVYuRLoC0
	HOEanBypB0lyyRYaiHktTkYZCkckYZ1ETUmmE8aVFkrOzdmQu9P4WYws3MEMFitMPA==
X-Gm-Gg: ASbGncvsE6bFSCZ+nkL+qnQq5iHvaAq5SangXf6wxUMDhecxaAEG5nB/366cAASpgsZ
	dbe2ERJ+V9M+zBpRNGUX3btFJkl3QUBqWqBGdfetJeZF9WkG+OpChA8xTRbcRBxqQOeN+mefNhl
	F2IR8Cp08AucuFiKNzF8Rj8gXbcz3arJsXHgEk4rncP4z0bVo0NMq7rVrNkvD9S9XUbTJKCCfyD
	y9QpCONFYijmCo2CFUimyzZbNOfz7cS6qnGHImqn7z9AdRlcdXZ/5+qDcog94NxwQEn49aAugb/
	GjUlK2GNiRvVw7qy+2zWq+/NEjLOCcfp6AQGffXX2QT5G/If14CSpGY1zfM7IULkeXcoECdTBXp
	bnGFkzrG3PNtQ
X-Google-Smtp-Source: AGHT+IHUHlQ/5XUXQcB00VdgvQQSxddXSD+g+DDVekgzd6TlgCOMDZ+5L/jn01FUyxiFpvTfKOf+tw==
X-Received: by 2002:a05:600c:444d:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43ba66e6317mr137315605e9.12.1741005531415;
        Mon, 03 Mar 2025 04:38:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a2dsm14434172f8f.72.2025.03.03.04.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 04:38:50 -0800 (PST)
Message-ID: <f6c0ba30-ee78-40f0-ae11-dc7c6abf30f9@linaro.org>
Date: Mon, 3 Mar 2025 13:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] hw/char: Improve RX FIFO depth uses
To: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-arm@nongnu.org,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20250220092903.3726-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 13SMxXO4247z

On 20/2/25 10:28, Philippe Mathieu-Daudé wrote:

>    hw/char/pl011: Warn when using disabled receiver
>    hw/char/pl011: Simplify a bit pl011_can_receive()
>    hw/char/pl011: Improve RX flow tracing events
>    hw/char/pl011: Really use RX FIFO depth
>    hw/char/bcm2835_aux: Really use RX FIFO depth
>    hw/char/imx_serial: Really use RX FIFO depth
>    hw/char/mcf_uart: Use FIFO_DEPTH definition instead of magic values
>    hw/char/mcf_uart: Really use RX FIFO depth
>    hw/char/sh_serial: Return correct number of empty RX FIFO elements

Series queued, thanks!
