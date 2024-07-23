Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2666055njc;
        Tue, 23 Jul 2024 11:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBKStjkQSWbN2XdtgShuMjlUDHyoMUysgSUovx9kBpgx2p8+tBl8eeRZufSeCPM3R7VyCWbVWZrSvGqXyoEPfgmRC/FGGC
X-Received: by 2002:adf:fb88:0:b0:368:3f74:f7dd with SMTP id ffacd0b85a97d-369dec15d0fmr2717581f8f.20.1721757750457;
        Tue, 23 Jul 2024 11:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721757750; cv=none;
        d=google.com; s=arc-20160816;
        b=N9s60kabWaM5/OKV6JvbFiiaBTBpGMP6lNiUkUQPRrxw+eKOAKDMSPqp6aKPli22nP
         X0Vxkz4iRUUUkY8z2Jlc9K0uIKoZ8sR9TYy10g5vNOSi8nS8E291CiJtb9vHObJEq6Yv
         gZkUhNZMVWVCCfS6Ida9s0iceQtcOjfoA7RhNRo/Zjs7p1Z/bWYmmXVElCj+3qiecYMW
         jBhS2Hc1KbGXS9OM09zeuD7X016X35gl55tr1waZ38r8lx8XsP6oVJJAca3HsOx7NLzd
         ZwzCNNmVVdxh6dL11B+OcBX7+bIY6V3H5pqretnrcmBv5oGjKhoogzOQE5Kmw1WByBAc
         S3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7S3a2md43hb4zNMQ55AJJzTFm+D1MhDeY6mpisPvLAs=;
        fh=31UJgRnd41nkvev12/lFvBX6OsEOqK0q6cQWi4XIKA8=;
        b=UlP9hw7tbTx1UC453/7E+AY9oS8dL94oFFNIGa3UwuDPfysO/+Cdd8JsJ+bJSH8XL9
         bB4etr52UGoUVw7jjxn9Aob43uZjxybZUUaESErGSDySH406TnO7Pmnjk+gHRAf2b6XF
         TsEi7twWzZ6RiAQ3RW0DwKJRS0ry6IORHi7UyrhxKUeNEoGQO9MJDjX3rPik52g7XcMH
         Wjbjcp36lwD5cSqEYnmFCyWgzzlZi4mOaBzpw3wMHc27sKjXaQ3m1rJrWvI2es09qXn3
         9QvFSi8nPzzwNc8m6Y5WKIwLEsayGn9SU7U3svdhqe5xDotgjBtmfxPIiwdqagXcu+wQ
         xy5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLRMaz1n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-368789e8f08sor2402767f8f.8.2024.07.23.11.02.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Jul 2024 11:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLRMaz1n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721757750; x=1722362550; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7S3a2md43hb4zNMQ55AJJzTFm+D1MhDeY6mpisPvLAs=;
        b=DLRMaz1nXL3+1cS0V+5F+C055xf0hsjjArsLlNUDyrnohOukQmShcV2XWAhsg+Avq5
         PvYKo+9s0KmZ4oe58d/8UIuk2gNiPMNnQqfFtsEop3kVYoqBqi1HOL3F+9yJJU5Php6h
         VmvQp8zbZ7lw7wOdB4wNEcVpAaZa1wZt2vKePo9Psy15Fx8ayHukQZ0A8xoduMRPBoaU
         NkInCek4JzW4Z0knG/JBm4xj8yx4JqTocg31RY6BuRibXmPJLBUsLVOPLSv7tvatndcp
         joRXfXWGP8uKBLQ0pff5j2YvUhgK4bn/FpQApq4yCgu8Bf389OhS/NCajORvE6zbSOhR
         KW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721757750; x=1722362550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7S3a2md43hb4zNMQ55AJJzTFm+D1MhDeY6mpisPvLAs=;
        b=LwtBy+u3AB1A7eyTSh+s0VJI4g8Rq122kd2Plp73gDbuig5H1l9NHJnx0/mQEw+tCm
         1dEXYeSYlPdLT1lqURhss0kK/JrPUBxHabTWqeGgBGSAdCCnM4PHYk1C3o0z3Hrl7En0
         6kMpMyztW/pwwZYAHbMekpByWKz6Iis76uDGtEWTeUMRtt0e2oaOon1hDOn3A9maUd1z
         fYembAMBLhdZjtOF2TUHTz5XRIWGSHaHsri3+WS6NaqhP03wlpkWycTA21JxzB511l50
         2Tis3vu+qwuwOVd46zEXpqMqQkCKg43xqugRNLyt36jkPn0ZZxxV+HpdLv0YiwNdMtd6
         kgRw==
X-Forwarded-Encrypted: i=1; AJvYcCUyJeWBuA2M3kzTKktNlrTNvotW0MJFsH7ALSiMd9kYHIsEGtDdF85wSpHoayOjqIjfoHAGCyMJ5f8RMWrn/NVyyJBCdQIE
X-Gm-Message-State: AOJu0YzmlB+XNq37bte4wh2LJpb76L09Uj8N1aLVjfkql/aoATm2+c+w
	4eCkAH+Ng8OIY7715Ebq1RWg2qw6353+Et4IoRW5QNAhBto/8yowhJmXtXSVxewDbw==
X-Google-Smtp-Source: AGHT+IFUeI0Zjy2nfRwYaAVd7jdvXj9nkUZDII/GiPETjFdDDMinEzyXd/gwc6DxVhxT+8e48m7HSA==
X-Received: by 2002:a5d:6206:0:b0:368:7ee2:b7c8 with SMTP id ffacd0b85a97d-369dec047bdmr2794723f8f.1.1721757749784;
        Tue, 23 Jul 2024 11:02:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.208.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa171sm184554195e9.1.2024.07.23.11.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 11:02:29 -0700 (PDT)
Message-ID: <aeb3b761-7a74-45c0-bc6b-87e4f6eb1527@linaro.org>
Date: Tue, 23 Jul 2024 20:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] util/fifo8: Rework fifo8_pop_buf()
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H7JUZQxKPxld

On 22/7/24 18:07, Philippe Mathieu-Daudé wrote:
> Rename current fifo8_pop_buf() as fifo8_pop_constbuf()
> and expose ESP's fifo8_pop_buf() which takes care of
> wrapped FIFO buffer.
> 
> Supersedes: <20240719151628.46253-1-philmd@linaro.org>
>    util/fifo8: Introduce fifo8_change_capacity()
> 
> Philippe Mathieu-Daudé (7):
>    chardev/char-fe: Document returned value on error
>    util/fifo8: Fix style
>    util/fifo8: Use fifo8_reset() in fifo8_create()
>    util/fifo8: Rename fifo8_peek_buf() -> fifo8_peek_constbuf()
>    util/fifo8: Rename fifo8_pop_buf() -> fifo8_pop_constbuf()
>    util/fifo8: Expose fifo8_pop_buf()
>    util/fifo8: Introduce fifo8_discard()

Series queued, thanks.
