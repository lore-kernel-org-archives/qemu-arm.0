Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4293034njd;
        Fri, 25 Apr 2025 04:16:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr17919955e9.16.1745579768022;
        Fri, 25 Apr 2025 04:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745579768; cv=none;
        d=google.com; s=arc-20240605;
        b=bGUqwC5Y/pKw+iuuqy8D7i6G0mOwnnhBoUm5Z8zFcFKigsoc7F/XFDtJjwbXdTC6l6
         AnDGs4mTiYqWLkjD9ZyJNdMZqDnnmyDtt1gr2GZX/QQ6jWLPHbGBs6giL7QszAySzx/i
         sFi99JyeNRaKdElZ3aHZe1PfmdKUdP6mT7rO7bgXfT4jAa+ZMlseI1SyQUKvMI2CM4fL
         U86ZSjRn830b96CGPl3+Mp0ukbvAJmoCKOR2x2iEFUHYw6o0s9o6jwUZh7ODTrWKSEbu
         3sBzzpHqyUs2wgVXBb1q/XrHEw6bkeA4G1QQPgNAoufezti/P7J+LbhKEehHVLkY5eXQ
         nNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C0+6++I8ZYzgo53hdAJlQ+PAexnb750t9iDp5+aKXc0=;
        fh=/zTXKz1KFojrP6aT54O4R4a6QDYXVZmCfjkPbhgUxI8=;
        b=PicWd1hiu5likVCsEw7CKiiA2Xvkkx4RsHkaFTkRevPtQsiHltySia0i2jWRH/bDk7
         Gc8Wej96T+6h3rO7weh002IGfyXkBQ92UetkWNWZJ+das02c/mcWTLAyHYlaiZHu1aWj
         flIAUI8mCUeaPfUj+SNnaAhbQDDtgG8lsqDeNNb4ICyzRJTDjTOMhWEmHpfu89n8xOVS
         8YG5qfcuw3yrhLwez2kHaTNDzZJZbC8NO1VkTjDs3dsbab0z27kYGsD1SQ07sQRe2PBK
         QO31Xwgax+VyOEFS0fdBkzxUbE+4pWzPo/kN7/+0K+r2C6WlOug043oJzhfGLEtVmbla
         jszw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNcObx8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c2ccb5esor15249715e9.3.2025.04.25.04.16.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Apr 2025 04:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNcObx8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745579767; x=1746184567; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0+6++I8ZYzgo53hdAJlQ+PAexnb750t9iDp5+aKXc0=;
        b=gNcObx8iSZikMXqWYSXk7cDAUynlRn0xTig/NhZU8XO36qufIo5ood0sxYl4TSE7PL
         XgwPSMPZzJJr/vhYHSU5FW7nyugOxtPlszXCVaVrbbcYFiE2HqESuIWrxWx4wLkEos5M
         ihAMqrEYkjiqA0KWJhcYyrz0YHWvobB2XckRv86sGrVMpixNX87Dn/uSwPfEGZyvDln9
         TCHKh1VIQyU3TlJ+1bKkNfqIMMWBKKQYdUIeANs4v4zsdjiaI+V1mNJlARKEl6bCdnPQ
         3xKhYS0TRtkSkpBYzpjxuRJxqXg3BSE7iLXHKt7G5YUBpRbYYJlIL6kGR4T0Z/z7itIt
         9FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579767; x=1746184567;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0+6++I8ZYzgo53hdAJlQ+PAexnb750t9iDp5+aKXc0=;
        b=vgIuXEYojtM+pJ9qYZ4XbPqfj2gZHBJIvvMEoBbh8TjsoYRpaDvw8v9erOH5FhnSyW
         pmCAR7VcPwshupqzKScpTFvhQyv6VgdvT1JPVaGlq4oDwnoE+An7HliF8RTNkiak2DcW
         WAJyN40moLRM3+UYISCVV7GKLQsJlebTUlfqYQxm9fRsPtaWM+3J2SMu/dDusllx3tBO
         yiz/TL7dwcp5KpyrBC84qs7MBCv7a1/aWZhB2VIhPnNWA3vRewSG1kjSKPNQYu8vn7HF
         tiklkEPhPN3J5weV1E80vnATr2yYIfpAxnwa0/64QxJZoSu24vVzehFLAdGiw0REPTO1
         zxsw==
X-Gm-Message-State: AOJu0YxZ+dKq0uzNu9I7xDGaTRSUTR8fX9DG23VeNIe0li6XYW0VHTrD
	JOSNo1sgq9w1PurFjf49rNmq0uceR0Swc61Fj40PhKBHM2R+UG2aNnpbB5hZaK9C6A==
X-Gm-Gg: ASbGncu1KPyZDysVbParOsMrwJRRxVxVhY942Uj1PxH3u17Wg9SuTPW/TblPqIwyiWw
	wprBRvpNRPscxz89XZKYxaeLqiiWWNKflqAfeGaiwYR6fDq72E3hLLwItcWCEJPPOvxCokAvDKo
	qFgFepbEadxZT6CsOILP6TTetAdvKLzF+2Qq52/AzfXf/g6Ns+3sns0fERYKgGmRCGVV1APDDV7
	CAwtb7zRfyryxwZhQ0vLurb48FgGFnDI4ROlOwyxEoWHRxMW8DIQL0y9cbhUHwy6k1Xr4C/jTMj
	rs7svueMqsx0A435c5Do2Iha0gTWQXfR/Gr3lSgQA68McSH1a89U+uaOJd+fIWa58NNaJSCVup+
	0yQMlCiRQKdST05Umsus=
X-Google-Smtp-Source: AGHT+IFJV11VAEAxATVG3sMjByRSdGuphrEr2qODFZ9f5cf/caZYYTfz2MLUCKAR0HsSka0w8rNILA==
X-Received: by 2002:a05:600c:1911:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-440a65dbddcmr13430915e9.12.1745579767379;
        Fri, 25 Apr 2025 04:16:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b9c4sm56294895e9.3.2025.04.25.04.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:16:06 -0700 (PDT)
Message-ID: <152f7911-21ee-48e7-b0ca-dd562dad8afd@linaro.org>
Date: Fri, 25 Apr 2025 13:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Whether the qemu mps2-an385 model support getchar?
To: =?UTF-8?B?5bCP6ams6am5?= <1353455048@qq.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <tencent_6CC3332A93DC02BE2030AB5BC0E63B10B808@qq.com>
Content-Language: en-US
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gustavo Romero <gustavo.romero@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <tencent_6CC3332A93DC02BE2030AB5BC0E63B10B808@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DGshalizaJsV

Hi,

Cc'ing Alex and Gustavo.

On 23/4/25 13:31, 小马驹 wrote:
> When I use mps2-an385 model on qemu, I found that it seems not support 
> getchar. I used the FreeRTOS official demo(mps2-an385-GCC-QEMU), then I 
> tried to use UART  to receive input strings from QEMU terminal, so I 
> tried to use getchar() function. However, some errors occurred in QEMU 
> as shown below:
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)
> Is it means there are something wrong in the emulated board? And how to 
> solve the problem?
> ------------------------------------------------------------------------
